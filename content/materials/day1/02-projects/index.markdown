---
title: "02: A tidy project is a happy project"
weight: 2
show_post_date: false
publishDate: 2023-10-01
excerpt: ""
---

Imagine that you read some interesting paper or analysis.
To your delight, all the code and data is available in a public repository.
You then are itching to sink your teeth on it; to see how they implemented the methods, or to run it with your own similar data.

You download the all the files and you find something like this.

```         
/home/dorothy/Documents/paper
├── abstract.R
├── correlation.png
├── data.csv
├── data2.csv
├── fig1.png
├── figure 2 (copy).png
├── figure.png
├── figure1.png
├── figure10.png
├── partial data.csv
├── script.R
└── script_final.R
```

And you have no idea what to do with it.
There's three `.R` files which could be the main script, several possible files containing some unspecified "data" and a bunch of image files with names that give little information on their contents.
With no README file or any other documentation to help you sort out this mess, you might well decide that your time is better spent somewhere else.

(Joke's on you: you are the author and it was your past self that left this mess.)

Reproducibility is as much as about the humans that interact with the code as the machines that need to run it.
Remember that a big reason to make your code reproducible is to enable other people to check and expand your code.
That anyone will want to do that is nothing short of a miracle, so you want to make their lives as easy as possible so they don't desist.

## Creating an organised project

What counts as "organised" is highly personal, but the main... Folder structure and file names should be:

1.  self-documenting
2.  easy to code with.
3.  all necessary files are inside the root folder

### Files that document themselves

Take advantage of folders to self-document the various parts of your analysis.

Put your data in `data`, pre-processing scripts in `scripts`, and your analysis in `analysis`.
Also use sub-folders, such as `data/raw` for raw data from the source and `data/derived` for pre-processed, cleaned-up data.

Name your files so that you can know what they are even if you came home at 3am after drinking a few beers.

Use slugs (short descriptions of what's inside).

<div class = activity> 

Describe what do you think are the contents of these files:

-   `data/raw/madrid_minimum-temperature.csv`

-   `scripts/02_compute_mean-temperature.R`

-   `analysis/01_madrid_minimum-temperature_descriptive-statistics.Rmd`
</div>

<div class = activity> 

Come up with good file names and folders for:

-   a dataset of cats with columns for weight, length, tail length, fur colour(s), fur type and name.

-   a script that downloads data from Spotify.

-   a scripts that cleans up data.

-   a scripts that fits a linear discriminant model and saves it to a file.

-   the .Rds file in which that model is stored.
</div>

<div class = notes> 

Use a familiar folder structure

There is no single one objectively best folder structure.
When in doubt, try to follow the conventions of your research community.
This will minimise any friction between you and your potential audience.
</div>

### Files you can code with

Always remember that machines are quite dumb, so be gentle and use file names machines can easily understand.

In some cases, file names with spaces confuse machines, so in general is much easier to code if file names use underscores and hyphens to split words.
Similarly, some machines can't handle "special characters" such as "ñ" or tildes.
Some symbols (".", "\*", an others) are also best avoided because they have special meaning in regular expressions.

Some file systems are case insensitive, so `Madrid-Temperature.csv` and `madrid-temperature.csv` might be the same file!

To avoid any headaches, it is best to be conservative and just use lower-case latin characters, numbers and hyphens ("\_" and "-").

Use hyphens as separators.
You can use "-" to separate words that are part of the same concept and "\_" to separate concepts.
For instance `buenos-aires_minimum-temperature.csv`.
We recommend this convention and not the other way around, because it's compatible with the ISO date format ("YYYY-MM-DD").

<div class = notes> 

By using separators consistently and smartly you can parse file names programmatically very easily.
For example, if you have




``` r
files
```

```
## [1] "madrid_minimum-temperature"       "buenos-aires_minimum-temperature"
## [3] "madrid_maximum-temperature"       "buenos-aires_maximum-temperature"
```

You could extract cities and variable names by just


``` r
strsplit(files, "_")
```

```
## [[1]]
## [1] "madrid"              "minimum-temperature"
## 
## [[2]]
## [1] "buenos-aires"        "minimum-temperature"
## 
## [[3]]
## [1] "madrid"              "maximum-temperature"
## 
## [[4]]
## [1] "buenos-aires"        "maximum-temperature"
```
</div>

Finally, try to make your files easily sortable.
Put numbers with enough zero-padding and, if relevant, use dates in YYYY-MM-DD format at the beginning of the file name so that sorting by name coincide with sorting by date.

### Making it portable

An important aspect of thinking about your project is that all scripts, data, figures, and whatever else is needed to (re)create the analysis is inside the same root folder.
That way you can ensure that the only thing you need to give to someone else to successfully run your code is that single folder.
It also makes your life easier if you work on the same project in different computers, as it enables you to sync a single folder.

One extra step to consider is that you cannot make your work portable if your code is not portable too.
Perhaps the main culprit of non-portable code is using absolute paths to manipulate files in your code.

Think about this piece of code:


``` r
read.csv("/home/dorothy/Documents/research/black-hole/data/data.csv")
```

Even if you correctly downloaded the `myresearch` folder, this code wouldn't run because it is unlikely that you saved that folder inside `Documents/research` and that your username is "dorothy".

Instead, you can use a relative path such as


``` r
read.csv("data/data.csv")
```

And this will run no matter where the root folder is located.
The only catch is that you need to make sure that the working directory is set to the root of the project.
This is easier said than done, especially due to (and assuming you use) knitr's default behaviour of setting the location of the R Markdown file as the working directory.
We will see that a simple solution is to use the [**here** package](/materials/day1/04-here/).

## RStudio Projects

RStudio provides a neat, structured way of separating your projects into different contexts.
They don't strictly help with reproducibility of the final product, but they will help you streamline your workflow by encapsulating things like the list of open files, R command history and RStudio settings for each project.

Opening an RStudio Project also ensures that you start a new R session every time and sets your working directory to the project root directory.

<div class = activity> 

Create a new RStudio Project

1.  Click on "File" and then in "New Project...".
2.  Click on "New directory".
3.  You'll see a list of various templates. Select "New Project".
4.  Type the name of the root folder in which your project will live and the directory where you want this folder to be created in by clicking "Browse.."
5.  Click on "Create Project".
</div>

If everything went well, you should have a new folder with your desired name.
This is a normal garden-variety folder; what singles it out as an RStudio Project is the .Rproj file that holds project-specific RStudio options and the hidden folder .Rproj.user where project-specific temporary files are located.

Each RStudio Project has its own set of options that you can change without altering global options or other project's options.

## Opening a project

The simplest way to open a project is to open the folder that contains it and double-click on the .Rproj file.
You can also quickly open a recently-used project by clicking on the project icon on the right-hand side of the RStudio toolbar.

This will open a new RStudio window with its own clean R process with the project folder as the working directory.
By default, it will also open any previously-opened files.
It will even preserve changes not saved.
This helps keep your work tidy and makes it easy to pick up or share what you've done later.

RStudio allows you to have multiple projects open, and this is possible because each project has its own folder.
You can work with multiple projects in parallel without code or results of one analysis interfering with the other's.

<div class = activity> 

Open your project

1.  On your new project, create a new file (any file) and write some code on it (e.g. `print("Hello world")`).
2.  Close the RStudio window.
3.  Now open a new RStudio window and open the RStudio Project you just closed (depending on your global options, it might open by default).
</div>

## A clean slate... every day

How do we ensure that the analysis is truly reproducible?
This is quite a broad question and there are many tools to solve this problem.
For now we are going to concentrate on at least on your computer being able to repeat the calculations or analysis from scratch.
And besides organising projects and not modifying the original data, how can you make sure that you saved all the code you were writing and used?
The most direct way is to restart the R session and run the code again, if it gives an error or doesn't return what you expected it means you missed a step.

<div class = notes> 

You can restart the R session with the shortcut Ctrl+Shift+F10 on Windows/Linux and Shift+Command+0 on Mac.

</div>

This can happen if for example you read data into memory by running a command in the console.
While we are working, R will have that data in memory and you will be able to make calculations and graphs, but your code will not be reproducible because it's missing the important step of reading the data.

The best way of ensuring this doesn't happen is to re-run your code on a fresh R session early and often so you can be sure that your code is reproducible at every step of the analysis.
However, by default RStudio will save the environment in a hidden file called .RData and restore it on startup, so that data will still be in memory.
And while this comes in handy so that you can boot up your work exactly where you left it each time you open your project, it might lead to a situation in which you never realise that you missed saving a key line of code in your analysis.

<div class = activity> 

Configure your project

1.   Go to "Tools" -> "Project options..."

2.  In the "General" tab

    -   "Restore .RData into workspace at startup": Select "No" from the dropdown menu.

    -   "Save workspace to .RData on exit": Select "No" from the dropdown menu
</div>

<div class = notes> 

You can change these preferences at the global level with "Tools" -> "Global options" in the "General" subheading
</div>

## Automatic project structure

There's a tool to automate a lot of this so you don't need to think about it so much.
The **rrtools** package can automate a lot of these steps (and more) and the **rrtools.addin** package offers a GUI for the main functionality.
These packages are not on CRAN, so you need to install them with


``` r
remotes::install_github("benmarwick/rrtools")
```

rrtools provides a relatively rich and strict template which has the advantage of liberating you from some decisions but, as it usually goes with these things, it also forces some decision onto you which might not be optimal for your specific use-case.
In any case, it provides a very solid starting point that follows some best practices.
However, it can be a bit overwhelming because it has many moving parts, so in this course we will go over each part in [Research compendia with rrtools](/materials/day2/03-rrtools/).

### Resources

[Project structure - Slides by Danielle Navarro](https://slides.djnavarro.net/project-structure/)/

[Packaging data analytical work reproducibly using R (and friends)](https://peerj.com/preprints/3192v1)

[How (and why) to make a research compendium](https://mbjoseph.github.io/intro-research-compendia/)
