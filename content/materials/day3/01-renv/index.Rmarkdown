---
title: "01: Managing R dependencies with renv"
weight: 1
show_post_date: false
publishDate: 2022-02-19
excerpt: ""
---

No code is its own isolated bubble.
Almost every analysis will depend on a number of external packages, such as ggplot2 for plotting, data.table for data wrangling, knitr for rendering a report, and so on.

But actively-maintained packages will change their code-base to fix bugs, add or remove features, or change behaviour.
These changes can potentially break your analysis or create subtle (or not so subtle) differences in the result.

For this reason it is important to both record package versions used in a project and to provide a mechanism for others to install the correct versions in their local machine.
The [**renv**](https://rstudio.github.io/renv/index.html) package solves both.

The idea underlying renv is that each project should have a project-specific R environment with its own library where packages are installed.
Packages installed in the project library are independent of the personal library so you can install a specific version of a package in one project without changing the version used by another.

The status of this project library is recorded in a lockfile: a file called `renv.lock` that holds the version, source and other metadata of each package used in the project.
This file will be used by renv to restore the project library to its correct state if for some reason there are missing packages, or packages with the wrong version.

## Using renv in your project

The nice thing about renv is that it automates a lot and gets out of your way as much as it can.
To start working with renv you first need to initialise the project-local environment with `renv::init()`.

This will automatically scan all your R scripts and RMarkdown files, discover their dependencies, and store the versions of the currently-installed packages in the lockfile and install them in the project library.

<div class = activity> 

Start using renv

1. Create a new project and add a new R Markdown document (you can save it as paper.Rmd). 

2. In the console run `renv::init()`. 

3. Run `renv::status()`. 
</div>

You should see a message like this one:

```         
No issues found -- the project is in a consistent state.
```

Also in your project root you will now see a file called `renv.lock` and a folder called `renv`.
The former stores version and other information for your R packages (and even the version of R itself), while the latter stores your project library.

If you try to knit the project, you might get a modal saying that you need "an updated version of the markdown package" to render R Markdown.
This is actually [a bug in RStudio](https://github.com/rstudio/rstudio/issues/9861).
renv correctly recorded and installed all the dependencies needed to render the document, but RStudio mistakenly thinks that the markdown package (not the rmarkdown package) is also necessary.
As a work-around, install the markdown package.

Once this is done, you can keep working on your project as usual, installing, removing and updating packages as you normally would.
The difference is that now all of that will only affect the project library.
If you update a package in your project, other projects will still use the global version (or their local versions if you use renv with them).
The flipside is that updating packages outside of the project won't affect the package versions used by it.

<div class = activity> 

Use ggplot2

1. Add a new chunk that loads ggplot2 with `library(ggplot2)` in paper.Rmd.

2. Try to render the file. 

</div>

You will notice an error informing you that "there is no package called 'ggplot2'".
As with markdown before, while ggplot2 is probably installed in your user library, it's not installed in this project library.

You can now check the status of the lockfile with `renv::status()`, which will return something like this:

```         
The following package(s) are missing:

 package installed recorded used
 ggplot2 n         n        y   

See ?renv::status() for advice on resolving these issues.
```

This message lists packages and their status.
Whether they are installed (in the project library), whether they are recorded in the lockfile, and whether they have been detected as being used by your project.

In this case, ggplot2 is being used (due to the `library(ggplot2)` line) but is not installed (in the project library) and also not recorded in the lockfile.

<div class = instructions> 

Install ggplot2

1. Install ggplot2 with `install.packages("ggplot2")` in the console. 

2. Knit `paper.Rmd`.

3. Run `renv::status()` in the console. 

</div>

Now that ggplot2 is installed, you should be able to render the R Markdown file.
However, `renv::status()` prints something like this:

```         
The following package(s) are in an inconsistent state:

 package      installed recorded used
 colorspace   y         n        y   
 fansi        y         n        y   
 farver       y         n        y   
 ggplot2      y         n        y   
 gtable       y         n        y   
 isoband      y         n        y   
 labeling     y         n        y   
 lattice      y         n        y   
 MASS         y         n        y   
 Matrix       y         n        y   
 mgcv         y         n        y   
 munsell      y         n        y   
 nlme         y         n        y   
 pillar       y         n        y   
 pkgconfig    y         n        y   
 RColorBrewer y         n        y   
 scales       y         n        y   
 tibble       y         n        y   
 utf8         y         n        y   
 viridisLite  y         n        y   
 withr        y         n        y   

See ?renv::status() for advice on resolving these issues.
```

This table is similar to the one you saw before.
In this case these are ggplot2 and its dependencies.
They are all installed and used, but they are still not recorded in the lockfile.
To record these pacakges, you need to update the lockfile by taking a "snapshot" of the current status of the project with `renv::snapshot()`.

<div class = instructions> 

Update the lockfile

1. Run `renv::snapshot()` in the console. 

2. You will see a list of packages and the text "Do you want to proceed? [Y/n]:". Type "y" and press enter. 

3. Run `renv::status()` in the console. 

</div>

When all used packages are installed and recorded with their proper versions, `renv::status()` will display

```         
No issues found -- the project is in a consistent state.
```

These three functions (`renv::init()`, `renv::snapshot()` and `renv::status()`) should be enough to work locally within a controlled environment and with an updated lockfile.

## renv for reproducibility

All this work wouldn't be useful if there wasn't a way of using the lockfile to consistently recreate the same environment.
This is where renv shines.

Anyone who wants to install the same packages that you use with their exact versions can download your code, open the project and use `renv::restore()`.
This will install everything in their local project library so they can be up an running in no time.

<div class = instructions> 

Restore an environment 

1. Download this [reproducible project](/reproducibility-with-r/reproducible_project.zip). 

2. Open the project and run `renv::status()` in the R console. What's the stauts of the packages?

3. Run `renv::restore()` in the R console and proceed. 

4. Run `renv::status()` again to check that the project is in a consisten state. 

3. Render `analysis/report.Rmd` to make sure that it worked.

</div>

<div class = notes> 

You don't need to share the `renv/library` folder, which holds the installed packages.
You share only the `renv.lock` file (and the `rev/activate.R` file, which is a very cool script that auto-installs the correct version of renv if needed!). 
If you use git, you don't need to think about this because renv takes care of that with a special `renv/.gitignore` file.

</div>

## Caveats

### The lockfile

The lockfile holds a snapshot of the project library at a moment in time, but it doesn't guarantee that this corresponds to the rendered result.
The lockfile could be out of date when the code is run, or the code might have been run with a previous version of the lockfile.
It's up to you to always render your file when the project is in a consistent state.

### Dependency discovery

The automatic dependency discovery is really cool, but somewhat limited.
It understand the most common and obvious ways a package can be loaded in a script, but it can fail if you use some more indirect methods.
As we saw, it fails to detect the markdown dependency.
It also fails if you use functionality in a package that depends on Suggested packages (e.g. `ggplot2::geom_hex()` requires the hexbin package, so you need to add an explicit `library(hexbin)` somewhere in your project).

### Package installation

Sometimes package installation fails.
One common case would be if you installed a CRAN-compiled package in Windows but the person trying to `restore()` the environment is running Linux.
Since CRAN doesn't offer compiled packages for Linux, renv will try to install from source, which can fail if compilation requires missing system dependencies.
There's nothing renv can do in this case, but the problem can be resolved by installing the relevant system dependencies.

Package installation will fail if the remote repository that hosts a package is unreachable either due to local connection issues or it being down, or deleted.
Again, there's nothing renv can do in that situation.

Package installation can fail if the package requires compilation but the machine doesn't have enough RAM to compile.
This is the case with the sf package, which cannot be compiled in the free-tier RStudio Cloud machine.

### System dependencies

Furthermore, some R packages require certain system dependences to be installed to run.
renv does not handle these cases yet, so if you are using a package that needs system dependencies, installation could fail if these are not met.
Even if installation goes well, a package might not work if it has unmet runtime dependencies.

Even in the case in which system dependencies are fulfilled, renv offers no guarantee that these are the same versions used to run the analysis.
This means that if results depend on the version of some system dependency, renv will not be able to ensure reproducibility.
This includes the version of R itself!

One tool to ensure that the whole system is stable is using containers, which is the subject of the next section.

## Resources

[renv package documentation](https://rstudio.github.io/renv/index.html):

-   [Get started](https://rstudio.github.io/renv/articles/renv.html)
-   [FAQ](https://rstudio.github.io/renv/articles/faq.html)
