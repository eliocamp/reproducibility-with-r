---
title: "02: Getting the most of git"
weight: 2
show_post_date: false
publishDate: 2022-02-19
excerpt: ""
---

## Why git?

Do you have something like this in your computer?

```         
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
```

Probably we all have, or had something like this at one point because we didn't use a version control system.
Version control systems manage the evolution and changes of a set of files that we'll call **repository**.
If you ever looked at the history of a Google Docs file, it is like that but in a very controlled way.
Git is one popular version control system.

If you work alone, git is great to track changes and recover previous version of your files.
You can also use a **remote repository** to have a back up and share your work.

If you work as a team you can take advantage of all the above and also use version control as a tool to collaborate and organize the various versions of the same file present in the multiple computers you and they use.

## But what do we mean by version control?

Let's imagine that we have a repository already working ([later](/materials/day2/01-git/#creating-a-new-repository) we'll see how to create one).
When you create a new file as part of the repository (or *repo*), that file is untracked or unversioned.
This means that git will ignore the file and any change you make to it until you *add* it to the repo.
At that point the file is **staged** and it ready to get into the repository.
To do that you do a *commit* and **save** that version of the file to the repo.
This workflow `modify --> add --> commit` will repeat every time you want to save a version of the file.
We don't recommend making a commit every time you save the file or change a comma, and its also not a good idea to make a commit with a billion of changes.
With practice and depending on how do you work, you will find a comfortable middle ground.

![The figure shows the states of a file: untracked or tracked. When it is tracked by the repository, the file can be staged, committed or modified. With the add action the file is "staged", with the commit action the file is "saved" to the repository. This cycles repeats teach time the file is modified.](images/file_cycle2.png)

So, we mentioned `add` and `commit`, these are git commands.
If you have experience working with the command line you could use git from there, but the same commands can be executed from a GUI like [GitHub Desktop](https://desktop.github.com/) or [GitKraken](https://www.gitkraken.com/).
RStudio also provides a basic GUI for git, which we are going to use in this workshop.

<div class = notes> 

If you want to try the command line, here are the core git commands:

-   `git add <file>` to add a file to the staging area.
-   `git commit -m "A very descriptive message` to commit the files on the staging area. 

</div>

## What are remote repositories?

What we explained before is the **local workflow**.
This is when the repo lives in your computer and that's it.
But you can also connect the **local repository** with a **remote repository**.
For this workshop we are going to use [GitHub](https://www.github.com) to host remote repositories, but there are other options you can explore, such as [GitLab](https://about.gitlab.com/).

Let's imagine we have a local repository, we made some commits and we want to send those changes to the remote repository (we'll how to create the remote repository later).
For that we **push** the commits to the remote repository and the two repos are "up to date".

If a team-mate changes a file and pushes the changes it to the remote repository, your local repo will be "outdated".
To download those new commits from the remote repository you **pull** the commits.

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
If you followed the [pre-workshop instructions](/materials/day0#git-and-github), RStudio, git, and GitHub are definitely talking to each other.

<div class = notes> 

You can check that RStudio "sees" git by going to `Tools --> Global Options --> Git/SVN`.
There you should find the path in your computer to the git installation.

</div>

To introduce yourself to git, that is to let it know your name and email, you can use the *usethis* package.

``` r
library(usethis) 
use_git_config(user.name  = "Jane Doe",
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
But keep in mind that there are many other ways to work with git.

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

In this section we are going to see what it looks like to use collaborative workflows
to work with other people to do data analysis and software development.
Previously you were working with git individually:

``` 
Modify a file --> Add --> Commit 
```

You did all this in a branch of the repository that we usually call *main* because it is the main one. A **branch** in git is a tag that points to a specific *commit* in the repository from which other versions of the repository are created. 
Working in a branch allows you to modify files without modifying the same files in other branches, because essentially you are working on a “parallel” set of files.
When you want to pass the changes from your branch to the main branch, you would have to do a **merge** to combine the branches.

Collaborative workflow includes two new concepts: *forks* and *pull requests*.

- A **fork** is a copy of another person's or team's repository that will be stored in your GitHub account.
Both the original and the fork are on GitHub, the difference is that you can make
modifications to the version that is in your account.
- **Pull Request** or PR is a GitHub tool that allows you to make changes to a fork or branch and then request to the maintainer to merge those changes into the main repository.
Pull requests can come from forks or from independent branches within the repository. They allow
the maintainers and contributors to the project to review, discuss, request, and approve the changes and merge then to the main branch.

Learning how to effectively use these tools and concepts can make collaborating with other people
much easier. You may even be able to use this workflow even on an individual basis.

When you are collaborating on a project, you may find yourself in one of the following situations
of these situations:

- Scenario 1: You have write permissions on the remote repository,
in this case you don't need to use forks.
- Scenario 2: You do not have write permissions on the remote repository, so you will need to use forks.

In both scenarios we will assume that you will work with branches to separate
your work from other people's before passing them to the main branch.

### Scenario 1

This diagram shows the workflow when we **don't** need to do a fork.

![Concept model of the workflow in scenario 1. The remote repository is copied into a local repository with a "clone". Files inside the local repository and the remote repository are synced with push and pull. The owned remote repository can be merged into the foreign remote repository with a pull request.](images/no_fork.png)

1. Clone the repository on your computer following the [these same instructions](/materials/day2/01-git/#creating-a-new-repository).
2. Create a new branch.
3. Edit files, add them and make commits in that branch.
4. When the changes are done and ready, send a pull request to the remote repository to
to compare your changes in your branch with main branch.
5. The pull request is accepted and merged or you have to make new changes (go back to step 3).
6. Once the PR is accepted and merged, the main branch now has the updated changes and you can delete the branch you were working on.
7. The process can be repeated several times, in parallel or in sequence depending on the size of the team and project.

### Scenario 2

For fork-based workflows, the process is as follows:

![Concept model of the workflow in scenario 2. A foreign remote repository can be forked to an owned remote repository with a "fork". The remote repository is copied into a local repository with a "clone". Files inside the local repository and the remote repository are synced with push and pull. The owned remote repository can be merged into the foreign remote repository with a pull request.](images/si_fork.png)

1. Create a fork of the main repository (if you don't already have one).
2. Clone the forked repository on your computer.
3. Create a new branch in the forked repository.
4. Make changes to the files and commit them to the branch.
5. When everything is ready, open the pull request. If you need to make new
changes you will have to go back to step 4.
6. If the PR is accepted and merged, the main branch in the main repository will be updated and the new branch can be deleted.
7. Finally you can synchronize your forked repository with the main repository.





### Let's plant some trees

As a fun example will collaborate with the recently open Flametree galley and do some pull request on the way.

<div class = activity> 

Fork the repository 

1. Go to [github.com/paocorrales/flametree_gallery](https://github.com/paocorrales/flametree_gallery)
2. Fork the repository using the "Fork" button on the top right corner.

![Screenshot of a repository showing where the "fork" button is.](images/fork.png)

Now, you have a copy of the repo in your GitHub account.

3. Copy the url of the repo and clone it to your computer following the [instructions to create a new repo.](/materials/day2/01-git/#creating-a-new-repository)

![Screenshot of a forked repo showing where to copy the url to clone the repo.](images/clone.png)

</div>

Now you have an RStudio project (that is also a repo) that is a copy of the one in the original repo.
It's a very small project with a few file.
`template_script.R` includes the necessary code to create beautiful images like this:

![Image of trees created using R](images/tree_pao.png)

It uses the [*flametree*](https://github.com/djnavarro/flametree) library created by [Danielle Navarro](https://djnavarro.net/).
How it works is not part of the topics of the workshop (sadly!) but it's a good excuse to practice doing pull requests.

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

At this point you've made a change in your local repo (that is a copy of the forked repo) and pushed those changes to **your** remote repo in GitHub.
The original repo doesn't know this.

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

The owner/s of the repo will receive an email.
They can review the pull request, comment on it and eventually accept the contribution.
When that happen the changes you made will appear in the repo.

## Resources

[Happy git with R, by Jenny Bryan](https://happygitwithr.com)

[Version Control. Primeros pasos de Git con R by Yanina Bellini Saibene and Marysol Gatti (in Spanish)](https://yabellini.github.io/Intro_to_Git_with_Rstudio/)
