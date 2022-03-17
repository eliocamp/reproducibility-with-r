---
title: "02: Research compendia with rrtools"
weight: 2
show_post_date: false
publishDate: 2022-02-19
excerpt: ""
---

Of course, you can always create a file structure that suits you and your work by hand.
But if you are going to do that a lot, it might be nice to automate some of the work. 
We are going to use the rrtools package to create a "research compendium" using a couple of R functions and combine it with the things we learned on the git and GitHub section.

The first thing you need to know is that an rrtools compendium will be at the same time an R package.
If you don't have experience with R packages, don't worry!
This is why:

-   An R package is, in practice, just a folder with some special text files and a few sub-folders.
-   You don't need to learn much about packages to use rtools and take advantage of it.
-   Here we'll cover the necessary bits to work inside a compendium.
-   But if you want to learn more about R packages there are wonderful resources, for example: [here](https://r-pkgs.org/).

The following instructions are adapted from the [rrtools GitHub repository](https://github.com/benmarwick/rrtools).

### 0. Create a Git-managed directory linked to an online repository

It is possible to use rrtools without Git, but usually you would want you research compendium to be managed by the version control software Git.

The name of the compendium and the project should be the same.
Keep in mind that this will also be the package name so it has to follow some rules for everything to work properly. 
Your project name  must:

-   contain only ASCII letters, numbers, and '.'
-   have at least two characters
-   start with a letter (not a number)
-   not end with '.'

For convenience we will use  `pkgname` as a placeholder for this package.

<div class = instructions> 

1.  Create an online repository.
2.  In RStudio, start a new Project:

-   `File > New Project > Version Control > Git`. In the "repository URL" paste the URL of your new GitHub repository. It will be something like this <https://github.com/paocorrales/PaperCompedium.git>.
-   Make sure you know where you are creating the project.
-   Choose "Open in new session".
-   Click on "Create Project".
</div>

### 1. `rrtools::use_compendium()`

This uses `usethis::create_package()` to create a basic R package in the `pkgname` directory.
The function will also instruct on the next steps. 


<div class = instructions>

Create the compendium

1.  In the new project, run `rrtools::use_compendium()` to create the compendium

2.  Edit the `DESCRIPTION` file (located in your `pkgname` directory) to include accurate metadata, e.g. your [ORCID](https://orcid.org/).
    This is one of the files that makes a regular folder an "R package".

3.  Periodically update the `Imports:` section of the `DESCRIPTION` file with the names of packages used in the code we write in the .Rmd document(s) by running `rrtools::add_dependencies_to_description()`
</div>

### 2. `usethis::use_mit_license(copyright_holder = "My Name")`

This adds a reference to the MIT license in the [DESCRIPTION](DESCRIPTION) file and generates a [LICENSE](LICENSE) file listing the name provided as the copyright holder.

To use a different license, replace this line with any of the licenses mentioned here: `?usethis::use_mit_license()`

<div class = notes> 

You can read more about licences [here](https://r-pkgs.org/license.html).
</div>

### 3. `rrtools::use_readme_rmd()`

This generates [README.Rmd](README.Rmd) and renders it to [README.md](README.md), ready to display on the repository home page on GitHub.

It contains:

-   A template citation to show others how to cite your project. Edit this to include the correct title and [DOI](https://doi.org) when it get published!
-   License information for the text, figures, code and data in your compendium.

This function also adds:

-   Two other markdown files: a code of conduct for users [CONDUCT.md](CONDUCT.md), and basic instructions for people who want to contribute to your project [CONTRIBUTING.md](CONTRIBUTING.md), including for first-timers to git and GitHub.
-   A `runtime.txt` that makes [Binder](https://mybinder.org/) work, if your compendium is hosted online (e.g. GitHub, Zenodo, Figshare, Dataverse, etc.)

### 4. `rrtools::use_analysis()`

This function has three `location =` options: `top_level` to create a top-level `analysis/` directory and a few more options more associated with R packages.
The default options is a top-level `analysis/`.

This folder will have the following structure:

    analysis/
    |
    ├── paper/
    │   ├── paper.Rmd       # this is the main document to edit
    │   └── references.bib  # this contains the reference list information

    ├── figures/            # location of the figures produced by the Rmd
    |
    ├── data/
    │   ├── raw_data/       # data obtained from elsewhere
    │   └── derived_data/   # data generated during the analysis
    |
    └── templates
        ├── journal-of-archaeological-science.csl
        |                   # this sets the style of citations & reference list
        ├── template.docx   # used to style the output of the paper.Rmd
        └── template.Rmd

-   the `paper.Rmd` is ready to write in and render with bookdown. It includes:

    -   a YAML header that identifies the `references.bib` file and the supplied `csl` file (to style the reference list).
    -   a colophon that adds some git commit details to the end of the document. This means that the output file (HTML/PDF/Word) is always traceable to a specific state of the code.

-   the `references.bib` file has just one item to demonstrate the format. It is ready to insert more reference details or be replaced it with a .bib file created using Reference Manager tools like Zotero.

-   you can replace the supplied `csl` file with a different citation style from <https://github.com/citation-style-language/>

Remember that the `Imports:` field in the `DESCRIPTION` file must include the names of all packages used in analysis documents (e.g. `paper.Rmd`).
rrtools have a helper function `rrtools::add_dependencies_to_description()` that will scan the Rmd file, identify libraries used in there, and add them to the `DESCRIPTION` file.

When you create this file structure using this function you can choose whether you want to add your data to the repository.
If `data_in_git = FALSE` you will exclude files in the `data/` directory from being tracked by git and prevent them from appearing on GitHub.
You should set `data_in_git = FALSE` if your data files are large (>100 mb is the limit for GitHub) or you do not want to make the data files publicly accessible on GitHub.
More about sharing data in [the next section](/reproducibility-with-r/materials/day2/03-data/).

<div class = notes> 

rrtools assistant

You can also use a graphic interface to create the compendium using the "rrtools Assistant" addin.
It includes detailed instructions and the code associated with each step.

![rrtools Assistant interface showing the Overview tab.](images/rrtools1.png)
</div>

### Working with your own code

To load your custom code in the `paper.Rmd`, you have a few options.
You can write all your R code in chunks in the Rmd, that's the simplest method.
Or you can write R code in script files in a sub folder called `R`, and include `devtools::load_all(".")` at the top of your `paper.Rmd`.
Or you can write functions in `R` and use `library(pkgname)` at the top of your `paper.Rmd`, or omit `library` and preface each function call with `pkgname::`.
Up to you to choose whatever seems most natural to you.

#### Documenting code

Whether you choose to write code in chunks, script files or as functions, it important to your future self and others to document your code. 
If you are not used to doing it, the easiest way to start is by commenting everything without much thinking. 
With time you can decide if you need commenting every single line or maybe only the key decisions you made when you where writing the code. 

If you decide to work with functions there are a few tools that can help you to document them and make that documentation available in the Help Pane (remember, a compendium is also a package, so you can take advantage of that!). 
Each function will live in a .R file (there are some exceptions but we won't worry about that at this point) and will have a header with the name, descriptions and more information. 
You can use simple `#` to comment or you can use *roxygen2* comments using `#'`. 
The later will allow you to generate the package documentation. 

The following instructions to document a function are adapted from the [R packages book](https://r-pkgs.org/man.html).

<div class = instructions>  

The documentation workflow

1. Create a dummy function that add to numbers and save it to `add-numbers.R`.

2. Add roxygen comments to your function:

```
#' Add together two numbers
#' 
#' @param x A number.
#' @param y A number.
#' @return The sum of \code{x} and \code{y}.
#' @examples
#' add(1, 1)
#' add(10, 1)
#' @export
add <- function(x, y) {
  x + y
}
```

* The first line is the title
* You can also add a description after the title
* `@params` are the function arguments, in this case `x` and `y`.
* `@examples` starts the examples sections, R will run this code when the package is build.
* The `@export` comment is important to make the function accessible via`pkgname::add()` or `library(pkgname)`.

3. Run `devtools::document()` (or press `Ctrl/Cmd + Shift + D` in RStudio) to build the documentation based on these roxygen comments 

4. Preview documentation with `?add`.

5. Rinse and repeat until the documentation looks the way you want.


</div>

## Resources 

[A guide to modern reproducible data science with R](https://www.rstudio.com/resources/rstudioconf-2019/a-guide-to-modern-reproducible-data-science-with-r-karthik-ram/)
