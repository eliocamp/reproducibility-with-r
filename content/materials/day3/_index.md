---
title: "Day 3"
# list or single layouts are possible
layout: single-series # list, list-sidebar, single-series
weight: 4
subtitle: "Packing your proyect"
description: |
  An organised project is a happy project
cascade:
  draft: false
  # list or single layouts are possible
  layout: single-series # list, list-sidebar, single-series
---

## Learning objectives

-   Manage package dependencies inside a project.
-   Get to know different options to pack and share a project.
-   Using docker to share a project.


## Homework

<div class = "activity">

Initialise renv in your compendium

Use `renv::init()` to set up a lockfile and a local library for your project. 
Make sure that you can run all the relevant code to ensure that renv has discovered all the dependencies correctly.

Commit and push your changes to your GitHub repository.
Make sure that you don't commit the library folder. 

</div>


<div class = "activity">

Build a docker container 

Create a Dockerfile and build a docker image. 
Test it to make sure that it runs properly and all the necessary packages are installed. 

Add the necessary instructions on how to run the container to the README.

As always, commit and push changes to your GitHub repository. 

Upload your docker image to DockerHub. 

</div>


<div class = "activity">

Share your repository and reproduce someone else's

Just like before, share your repository on the #day-3 channel on Slack, clone and reproduce other's and share your feedback.

</div>

