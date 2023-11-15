---
title: "An R reproducibility toolkit for the practical researcher"
tags:
- R
- reproducibility
- version control
- docker
date: "15 Novemer 2018"
output: pdf_document
authors:
- name: "Adrian M. Price-Whelan"
  orcid: "0000-0003-0872-7098"
  affiliation: 1, 2
- name: Author Without ORCID
  affiliation: 2
bibliography: paper.bib
aas-doi: "10.3847/xxxxx <- update this with the DOI from AAS once you know it."
aas-journal: "Astrophysical Journal <- The name of the AAS journal."
affiliations:
- name: Lyman Spitzer, Jr. Fellow, Princeton University
  index: 1
- name: Institution 2
  index: 2
---

# Summary

# Statement of Need

Reproducibility is a key principle to any scientific research.
Moreover it should be part of any data analysis work even if it does not have a scientific goal.
However, achieving full reproducibility is challenging and requires time and resources.
This workshops aims to maximize its reproducibility by leveraging existing tools in the R ecosystem --such as RMarkdown, renv, and others--, version control and working environments.

It can be follow by self-thought students as the materials are self contained including exercises and challenges to follow and complete.
It also includes [Notes for instructors](https://reproducibility.rocks/notes_for_instructors/) that wants to teach and/or re-use of the material along with slides, check points, a share document and feedback form templates.

# Description of Learning Modules

The workshop is intended for researchers, data scientists, and anyone who uses R to generate documents and who wants to collaborate with other people (or themselves in the future).
Basic prior experience with R is highly recommended.

The materials are organized to be teach during 4 days, ideally spread over a few weeks to also allow for spaced practice \[benjamin2010\].
Each day has specific learning objectives (Table \@ref(tab:xx)) and associated homework that motivate participants to convert an old or new research or analysis project into a reproducible one.

| Day \#                                                                                                               | Learning Objectives                                                                                                                                                            | Topics                                                                                                 |
|---------------|-------------------------------------------|---------------|
| [Day 1](https://reproducibility.rocks/materials/day1/): The workbench                                                | 1\. Create R project with an specific and useful structure; 2. Extend the use of RMarkdown files for reports and papers; 3. Use LaTeX templates to customize RMarkdown reports | 1\. What is reproducibility anyway?; 2. A tidy project is a happy project 3. Reporting with R Markdown |
| [Day 2](https://reproducibility.rocks/materials/day2/): Sharing and Contributing                                     | 1\. Using git to track your work; Using git to collaborate with others; How to set the documentation of your project; Organizing a project                                     | 1\. here are the portable paths, 2. Getting the most of git; 3. Research compendia with rrtools        |
| [Day 3](https://reproducibility.rocks/materials/day3/): Managing Dependencies and data                               | 1\. Manage package dependencies inside a project; 2. How to pack and share data                                                                                                | 1\. Managing R dependencies with renv; 2. Sharing data                                                 |
| [Day 4](https://reproducibility.rocks/materials/day4/): Building Reproducible Computational Environments with Docker | 1\. Using docker to share a project                                                                                                                                            | 1\. Reproducible computational environment with Docker                                                 |

## Instructional design

The workshop can be teach on-line or in person and while we invite self-thought students to study with other, it is possible to follow the material independently.
The material is taught using a combination of discussions, live coding or demonstrations sessions and, exercises.
For each topic or sub topic the is a check point: a multiple choice question to access how much the participants are familiar with the topic.
Depending on the answers the instructor can decide if the topic can be entirely, partially skipped or need to be explained in full.

| Method                         | Description                                                                                                                                                                 |
|--------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Discussions                    | Instructors present a topic and make questions to the students to motivate a conversation                                                                                   |
| Live coding or demonstrations  | Instructors write code or demonstrate how a tool works and invite students to follow along.                                                                                 |
| Exercises                      | Students are invited to complete short exercises that can include repeating what the instructor just shown, doing something similar or working in groups to solve a problem |
| Continuous anonymous feedback  | Students are asked at the end of each day to give feedback on 1. Something you like and we should keep and 2. Something you don't like that we should improve.              |

The [Notes for instructors](https://reproducibility.rocks/notes_for_instructors/) section includes secondary materials and templates that can help prepare them to teach the workshop.

## Experience of use in teaching and learning situations

This workshop has been delivered 2 times in and on-line setting.
Participants where graduate and undergraduate students along with experienced researchers and people working on the private sector and goverment.
Each time 2 instructors where always present and share the task of teaching, answer questions and help participants with technical issues.
This also helps to keep the agenda on track and the general organization of the workshop.

The anonymous feedback was positive and many recommendations or requests from the students where include in the following days.
The feedback also helped to improve the materials from the first to the second edition of the workshop.
In particular, a 4th day was added for the second edition to better cover the content of the workshop.

Other people has been using the materials to learn specific tools and apply them to their work independently.

# Story of the project

Elio and Paola started using R in 2014 and by the time the needed to write their undergrad dissertations they rapidly starting using rmarkdown and git.
They continued using R during their PhDs and started adding new tools to their repertory to make their works essier and as reprodubible as possible.
In 2021 Carlo Pecoraro from [Physalia courses](https://www.physalia-courses.org/) contacted Elio to invite them to teach a workshop.
Elio and Paola took the opportunity to compile what they been learning and using for year in a hand-on workshop.

# References
