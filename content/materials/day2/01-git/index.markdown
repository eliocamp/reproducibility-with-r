---
title: "01: Getting the most of git"
weight: 1
show_post_date: false
publishDate: 2022-02-19
excerpt: ""
---

## Why git?

Do you have something like this in your computer?

    /home/pao/Documents/thesis
    ├── abstract.R
    ├── thesis.Rmd
    ├── thesis_reviwed.Rmd
    ├── thesis_reviwed2.Rmd
    ├── thesis_final.Rmd
    ├── thesis_finalfinal.Rmd
    ├── this_is_it.Rmd
    ├── now_this_is_it_for_real_this_time_i_swear.Rmd
    └── FINAL.Rmd

Probably we all have, or had something like this at one point because we didn't use a version control system.
Version control systems manage the evolution and changes of a set of files that we'll call **repository**.
If you ever looked at the history of a Google Docs file, it is like that but in a very controlled way.
Git is one popular version control system.

If you work alone, git is great to track changes and recover previous version of your files.
You can also use a **remote repository** (more later) to have a back up and share your work.

If you work as a team you can take advantage of all the above and also use version control as a tool to collaborate and organize the various versions of the same file present in the multiple computers you and they use.

## But what we mean by version control?

Let's imagine that we have a repository already working ([later](/reproducibility-with-r/materials/day2/01-git/#creating-a-new-repository) we'll see how to create one).
When you create a new file as part of the repository (or *repo*), that file is untracked or unversioned.
This means that the git will ignore the file and any change you made until you *add* it to the repo.
At that point the file is **staged** and it ready to get into the repository.
To do that you do a *commit* and **save** that version of the file to the repo.
This workflow `modify --> add --> commit` will repeat every time you want to save a version of the file.
We don't recommend making a commit every time you save the file or change a comma, and its also not a good idea to make a commit with a billion of changes.
With practice and depending on how do you work, you will find a comfortable middle ground.

![The figure shows the states of a file: untracked or tracked. When it is tracked by the repository, the file can be staged, committed or modified. With the add action the file is "staged", with the commit action the file is "saved" to the repository. This cycles repeats teach time the file is modified.](images/file_cycle2.png)

So, we mentioned `add` and `commit`, these are git commands.
If you have experience working with the command line you could use git from there, but the same commands can be executed from a GUI like [GitHub Desktop](https://desktop.github.com/) or [GitKraken](https://www.gitkraken.com/).
During this workshop we'll use RStudio.

<div class = notes> 

If you want to try the command line, here are the core git commands:

-   `git add <file>` to add a file to the staging area.
-   `git commit -m "A very descriptive message` to commit the files on the staging area. 

</div>

## Did you mentioned remote repository?

Yes, before we went through a **local workflow**.
The repo lives in your computer and that's it.
But, you can also connect the **local repository** with a **remote repository**.
For this workshop we are going to use [GitHub](https://www.github.com) to host remote repositories, but there are other options you can explore, such as [GitLab](https://about.gitlab.com/).

Let's imagine we have a local repository, we made some commits and we want to send those changes to the remote repository (we'll how to create the remote repository later).
For that we **push** the commits to the remote repository and the two repos are "up to date".

A team mate makes a change to a file and push it to the remote repository.
Now, your local repo is "outdated" and you need to download those new commits from the remote repository.
You **pull** the commits.

![Concept model of a workflow using RStudio projects and git. Files are added to the staging area, and then commited to the local repository. You can push commits to the remote repository and pull new commits to your computer.](images/local_remote.png)

Tools like GitHub also include features that help you to collaborate and manage repositories.
For example, you can modify files and commit those changes using the web interface.

<div class = notes> 

If you want to try the command line, here are the git commands:

-   `git push` to upload commits to the remote repository.
-   `git pull` to download commits from the remote repository to the local repo.

</div>

## Introduce yourself to Git

Before you create your first repository you need to make sure that git and RStudio are friends and that git knows you.
If you follow the [pre-workshop instructions](http://localhost:4321/reproducibility-with-r/materials/day0#git-and-github), RStudio, git, and GitHub are definitely talking to each other.

<div class = notes> 

You can check that RStudio "sees" git by going to `Tools --> Global Options --> Git/SVN`.
There you should find the path in your computer to the git installation.

</div>

To introduce yourself to git, that is to let it know your name and email you can use the *usethis* package.

``` r
library(usethis) 
use_git_config(user.name = "Jane Doe",
               user.email = "jane@example.org")
```

Substituting with your name and the email associated with your GitHub account.

<div class = notes> 

You can do the same using the command line with

```bash
git config --global user.name 'Jane Doe'
git config --global user.email 'jane@example.com'
```

</div>

## Creating a new repository

There are many ways to start a new repository, locally in your computer using the command line or an interface, from GitHub (or its friends), from RStudio!
Here we'll show you how to create a repo from GitHub, associate it to an RStudio project and work with it.
But keep in mind that there are many other ways of working with git.

<div class = instructions> 

1.  Create an online repository.

-   Go to [github.com](https://github.com) and log in.
-   On the top right corner, click on the "+" bottom and then "New repository"

Then:

-   Repository template: No template.
-   Repository name: myrepo or whatever you wish to name your new project.
-   Description: Any short description of the project. Write this for humans.
-   Public.
-   Initialize this repository with: nothing (we can set up everything from R).

Before going back to RStudio, copy the url for the repository.
For example `https://github.com/paocorrales/myrepo.git`
</div>

<div class = instructions> 

2.  In RStudio, start a new Project:

-   `File > New Project > Version Control > Git`. In the "repository URL" paste the URL of your new GitHub repository `https://github.com/paocorrales/myrepo.git`.
-   Choose the folder where you want to create the project.
-   Choose "Open in new session".
-   And Click on "Create Project".
</div>

The new folder in your computer will be a git repository, linked to a remote GitHub repository and an RStudio Project at the same time.
This workflow also makes sure that all the configuration between the local and remote repos are done correctly.

It also adds a `.gitignore` file that includes a list of files that we don't need to track (i.e. `.Rhistory`).

## Local changes

It's time to put into practice some of the thing we've been talking.

<div class = activity> 

Add, commit

1.  Create a new RMarkdown file and save it.
2.  Add it to the staging area and commit the file. You'll need to add a descriptive message!
3.  Make a change on the file, it can be anything. Save it.
4.  Repeat step 2.


![Git panel with 3 untracked files.](images/add1.png)

![Git panel with 3 tracked files added to the staging area.](images/add2.png)

![RStudio interface to see file differences, write message's commit and push it to the remote repository.](images/add3.png)

</div>

If everything went OK, you started tracking files, made changes, committed them to the local repository.
You may see a message on the git tab saying that the local repo is ahead of the remote repo by 2 commits.

<div class = activity> 

Push!

1. Now, push the commits to the remote repository.

</div>

You won't see any changes on GitHub until you push those commits.
You can do this at the end of the day if you prefer but if you work with others it may be a good idea to push everything after you do each commit.

## Remote changes

Let's come back to GitHub.
If you refresh the page, now you'll see the files you committed just now.
Let's click on "Commits" to see the history of the repository.
From this view, you can explore the repository at the "state" of each commit and look at the file differences.

Now, we can try to make changes here.

<div class = activity> 

Create a README

1. On the main page, click on the green bottom that says "Add a README".
2. Add something to the file. READMEs usually are written in Markdown and contain information about the repo.
3. At the end of the page add a message on the first line and click on "Commit new file". 
4. Come back to the main page to see the README. 

</div>

The new file and the changes you do on GitHub are only on the remote repository until you make a pull from the local repo.
If you make changes on the local repo while it not up to date, you may encounter merge conflicts, which lead to headaches.
This happens when the version of a file on the local repo is not compatible with its version on the remote repo.
In those cases, git cannot decide which version is the right one and you have to do it yourself.

To avoid this problem (most of the time), you should do a pull before start doing anything else.
Most of the time RStudio will show the "Already up-to-date" but it is good to make this a habit.

<div class = activity> 

Pull from GitHub

1. Go back to RStudio.
2. To the the Git pane.
2. Click on the light blue arrow that says "Pull".
3. Check the README file on the Files tab.

</div>

## Anatomy of GitHub Repo

-   *Readme files.* Use a `README.md` file to explain what your project is, and how use it.
    `README.md` is the file that is automatically displayed when you open a GitHub repo.

-   *License.* The license tell people how they can use the content of your repo.
    Generally, we use permissive licences and people can do almost anything with the materials.
    Examples are the MIT Licence or Apache.
    Some extra resources:

    -   [Choose an open source license](https://choosealicense.com/) does what it says on the tin and helps you choose a licence.
    -   [Software Licenses in Plain English](https://tldrlegal.com/) explains licences' legalese in simple terms

-   *Contributing guide.* A file called `CONTRIBUTING.md` and guidelines for contributors so they know what they should do if they want to help you out.

-   *Code of Conduct.* Good projects have codes of conduct to make sure that people are treated well.
    Github has an Code of Conduct wizard to make it easy to add one.

-   *Issues.* Allows you to manage the project.

## Collaborating with others

When collaborating on a project you can find yourself in one of two scenarios

-   You have write permission of the repo you are working on.
-   You don't have write permission on the repo.

The first situation is the most common when working together with an team on a long term project.
You can clone the repo following the [these same instructions](/reproducibility-with-r/materials/day2/01-git/#creating-a-new-repository) and use the same workflow as before.
When you try to push your changes to the remote repository, GitHub will check if you have the rights to modify the repo.
The only difference between this and working on your own is that you need to communicate well so that two people are not working on the same thing.
But this is true with or without git.

The second situation is common when contributing to strangers' projects, such as fixing bugs in open source packages.
In this case, you need to first *fork* the repository, which creates a remote repository linked to your GitHub account to which you will have complete access.
Now you work in this fork using the normal workflow: modify, add, commit and push.
But for your changes to integrate into the original repository, you need to create a *pull request* (or *PR*).
This will let the owner of the original repo that you made some changes that you think should be merged.
The owner can then accept, reject or ask for modifications.
Once they accept your Pull Request, your modifications will be safe in the original repository.

![Concep model of the remote workflow. A foreign remote repository can be forked to an owned remote repository with a "fork". The remote repository is copied into a local repository with a "clone". Files inside the local repository and the remote repository are synced with push and pull. The owned remote repository can be merged into the foreign remote repository with a pull request. ](images/pull-request.png)

### Let's plant some trees

As a fun example will collaborate with the recently open Flametree galley and do some pull request on the way. 

<div class = activity> 

Fork the repository 

1. Go to [github.com/paocorrales/flametree_gallery](https://github.com/paocorrales/flametree_gallery)
2. Fork the repository using the "Fork" button on the top right corner.

![Screenshot of a repository showing where the "fork" button is.](images/fork.png)

Now, you have a copy of the repo in your GitHub account.

3. Copy the url of the repo and clone it to your computer following the [instructions to create a new repo.](/reproducibility-with-r/materials/day2/01-git/#creating-a-new-repository)

![Screenshot of a forked repo showing where to copy the url to clone the repo.](images/clone.png)

</div>

Now you have an RStudio project (that is also a repo) that is a copy of the one in the original repo. It's a very small project with a few file. `template_script.R` includes the necessary code to create beautiful images like this:

![Image of trees created using R](images/tree_pao.png)

It uses the [*flametree*](https://github.com/djnavarro/flametree) library created by [Danielle Navarro](https://djnavarro.net/). How it works is not part of the topics of the workshop (sadly!) but it's a good excuse to practice doing pull requests.

<div class = activity> 

Make a change in the repo

1. Make a copy of the `template_script.R` file and change it's name to `<your-name.R>`
2. Change the value of the first 3 variables in the script:

    * `name` your name.
    * `seed` there are some random things happening there.
    * `shades` choose 4 colors that you like. 

You can run the code if you want :)

3. Save the file, **add** it to the staging area and **commit** it (*include only the .R file you created*).
4. Push it to your remote repository.

</div>

At this point you've made a change in your local repo (that is a copy of the forked repo) and pushed those changes to your remote repo in GitHub. The original repo doesn't know this. 

If you want to contribute the changes you made to the original repo, it's time to make a pull request. 

<div class = activity> 

Make a pull request

1. Go to your repo in GitHub, you will see that you made the last commit and a message like this:

![Screenshot of a forked repo in GitHub with a new commit. It shows how to star a new pull request.](images/pr1.png)

2. Click on "Open pull request".
3. And click on "Create pull request". 
4. We are almost there. Complete the pull request with a title and a message and then finish the PR.

![Screenshot of GitHub showing how to add a title, message and finish a pull request](images/pr2.png)

And that it!

</div>

The owner/s of the repo will receive an email. They can review the pull request, comment on it and eventually accept the contribution. When that happen the changes you made will apear in the repo. 

## Resources

[Happy git with R, by Jenny Bryan](https://happygitwithr.com)

[Taller de git developed by Yanina Bellini Saibene and Marysol Gatti (in Spanish)](https://master--yabellini.netlify.app/es/courses/tallerdegitconr%3E)
