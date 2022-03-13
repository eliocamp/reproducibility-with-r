---
title: "01: Reproducible computational environment with renv"
weight: 1
show_post_date: false
publishDate: 2022-02-19
excerpt: ""
---

No code is its own isolated bubble.
Almost every analysis will depend on a number of external packages, such as ggplot2 for plotting, data.table for data wrangling, knitr for rendering a report, and so on.

But actively-maintained packages will change their code-base to fix bugs, add features, remove features or change behaviour.
These changes have the potential of breaking your analysis or creating subtle (or not so subtle) differences in the result.

For this reason it is important to both record package versions used in a project and to provide a mechanism for others to install the correct versions in their local machine.
The [**renv**](https://rstudio.github.io/renv/index.html) package solves both.

The idea underlying renv is that each project should have a project-specific R environment with its own library where packages are installed. 
Packages installed in the project library are independent of the personal library so you can install a specific version of a package in one project without changing the version used by another. 

The status of this project library is recorded in a lockfile: a file called `renv.lock` that holds the version, source and other metadata of each package used in the project. 
This file will be used by renv to restore the project library to its correct state if for some reason there are missing packages, or packages with the wrong version.

## Using renv in your project

The nice thing about renv is that on its default behaviour it automates a lot and gets out of your way as much as it can. 
To start working with renv you first need to initialise the project-local environment with `renv::init()`. 

This will automatically scan all your R scripts and RMarkdown files, discover their dependencies, and store the versions of the currently-installed packages in the lockfile and install them in the project library. 

<div class = activity> 

Start using renv

1. Open the demo project [demo project](/reproducibility-with-r/demo_project.zip). 

2. In the console run `renv::init()`  
</div>

In your project root you will now see a file called `renv.lock` and a folder called `renv`. 

Once this is done, you can keep working on your project as usual, installing, removing and updating packages as you normally would. 
The difference is that now all of that will only affect the project library. 
If you update a package in your project, other projects will still use the global version (or their local versions if you use renv with them). 
The flipside is that updating packages outside of the project won't affect the package versions used by it. 


<div class = activity> 

Use ggplot2

1. Add a new chunk that loads ggplot2 with `library(ggplot2)` in `report.Rmd`.

2. Try to render the file. 

</div> 

You will notice two weird things happening. 

First, RStudio will ask you to install the markdown package.
"But wait, I must have installed already!". 
Yes, but not on this project. 
Because the markdown package is not used explicitly anywhere in the project, renv didn't discover it as a project dependency package so it was neither included in the lockfile nor installed in the project library, so it needs to be installed. 

Second, you will get an error informing you that "there is no package called 'ggplot2'. 
Again, even if you had ggplot2 installed on your personal library, since it was not used on the code, it was not installed. 

You can now check the status of the lockfile with `renv::status()`, which will return this:

```
* The project is already synchronized with the lockfile.
The following package(s) are used in the project, but are not installed:

	ggplot2

Consider installing these packages, and then using `renv::snapshot()`
to record these packages in the lockfile.
```

The first line tells you that the lockfile is correctly synced with your project. 
It seems that renv updated the lockfile to include markdown and its dependencies when they were installed. 
(This is not always the case). 

The rest of the message tells you that renv detected a new dependency that is not installed. 
Of course, you added `library(ggplot2)` but never installed ggplot2. 
So you can install it normally (`install.packages("ggplot2")`) and now the report will render correctly. 

<div class = instructions> 

Install ggplot2

1. Install ggplot2 with `install.packages("ggplot2")` in the console. 

2. Knit `report.Rmd`.

3. Run `renv::status()` in the console. 


</div> 


This time, the report should render correctly because ggplot2 is now included in your project library. 
However, the output of `renv::status()` reads something like

```
The following package(s) are installed but not recorded in the lockfile:
               _
  lattice        [0.20-45]
  colorspace     [2.0-3]
  viridisLite    [0.4.0]
  mgcv           [1.8-39]
  isoband        [0.2.5]
  RColorBrewer   [1.1-2]
  munsell        [0.5.0]
  gtable         [0.3.0]
  labeling       [0.4.2]
  scales         [1.1.1]
  farver         [2.1.0]
  ggplot2        [3.3.5]
  MASS           [7.3-55]
  Matrix         [1.4-0]
  nlme           [3.1-155]

Use `renv::snapshot()` to add these packages to your lockfile.
```

This tells us that the lockfile is out of sync with the status of the project. 
To remedy that, you need to update the lockfile by taking a "snapshot" of the current status of the project with `renv::snapshot()`. 

This three functions (`renv::init()`, `renv::snapshot()` and `renv::status()`) should be enough to work locally within a controlled environment and with an updated lockfile. 

## Renv for reproducibility

All this work wouldn't be useful if there wasn't a way of using the lockfile to consistently recreate the same environment. 
This is where renv shines. 

Anyone who wants to install the same packages that you use with their exact versions can download your code, open the project and use `renv::restore()`. 
This will install everything in their local project library so they can be up an running in no time. 



<div class = instructions> 

Restore an environment 


1. Download this [reproducible project](/reproducibility-with-r/reproducible_project.zip). 

2. Open the project and restore the environment with `renv::restore()`.

3. Render `analysis/report.Rmd` to make sure that it worked.

</div>

<div class = notes> 

You don't need to share the `renv/library` folder, which holds the installed packages.
You share only the `renv.lock` file (and the `rev/activate.R` file, which is a very cool script that auto-install the correct version of renv if needed!). 
If you use git, you don't need to think about this because renv takes care of that with a special `renv/.gitignore`.

</div>


## Caveats


### The lockfile

The lockfile holds a snapshot of the project library at a moment in time, but it doesn't guarantee that this corresponds to the rendered result. 
The lockfile could be out of date when the code is run, or the lockfile could be outdated but the code not re-run.

### Dependency discovery

The automatic dependency discovery is really cool, but somewhat limited. 
It understand the most common and obvious ways a package can be loaded in a script, but it can fail if you use some more indirect methods. 

### Package installation 

Sometimes package installation can fail. 
One common case would be if you installed a CRAN-compiled package in Windows but the person trying to `restore()` the environment is running Linux. 
Since CRAN doesn't offer compiled packages for Linux, renv will try to install from source, which can fail if compilation requires missing system dependencies. 
There's nothing renv can do in this case, but the problem can be resolved by installing the relevant system dependencies. 

Package installation will fail if the remote repository that hosts a package is unreachable either due to local connection issues or it being down, or deleted. 
Again, there's nothing renv can do in that situation. 

### System dependencies

Furthermore, some R packages require certain system dependences to be installed to run
renv does not handle these cases yet, so if you are using a package that needs system dependencies, installation could fail if these are not met. 

Even in the case in which system dependencies are fulfilled, renv offers no guarantee that these are the same versions used to run the analysis. 
This means that if results depend on the version of some system dependency, renv will not be able to ensure reproducibility. 
This includes the version of R itself!

One tool to ensure that the whole system is stable is using containers, which is the subject of the next section. 


## Resources

[renv package documentation](https://rstudio.github.io/renv/index.html):
  - [Get started](https://rstudio.github.io/renv/articles/renv.html)
  - [FAQ](https://rstudio.github.io/renv/articles/faq.html)
