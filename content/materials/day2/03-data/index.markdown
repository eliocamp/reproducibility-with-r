---
title: "03: Sharing data"
weight: 3
show_post_date: false
publishDate: 2022-02-19
excerpt: ""
---


The two ingredients for a reproducible project are code and data.
We talked a lot about how to organise and share code, but what about data?
Sharing data is far from trivial and there are a lot of things to consider.

## Permissions

Before the technical issues of sharing data there are the bureaucratic issues.
Depending on your context, you might not be allowed to share your data.
Data can be expensive to create so your company or institution might want to keep it private so they can squeeze all the profit it can from it.
Or it might contain industry secrets or proprietary information.

Privacy concerns might preclude sharing data including sensitive and/or potentially identifiable information, such as it's common in the medical setting.
Baring licencing barriers, you might be able to share aggregated data, or anonymised data.
If your data comes from human subjects such as medical trials, psychological or social experiments, even surveys, you need to ask consent before you publish the data.

The bottom line is that you need to check carefully if you actually can distribute raw or derived data before doing so.
Even if you created the data yourself, check with your institution.

## How to share

The technical aspects of data sharing can be much more complicated than code sharing for the simple reason that data are, most of the time, much bigger than a couple of text files with a few hundred lines each.
Hosting and transferring several gigabytes worth of data can be a challenge, as well as ensuring long-term stability.

That is to say that there is no one solution to sharing data.

### Data inside the repository

If your project relies on not a lot of data, then you are in luck.
You can simply add the relevant files to your GitHub repository (or any other repository-hosting service) and you're done.
Anyone will be able to download the entire repository and run the code without worrying about accessing data because it is already there.

What counts as "tiny data" in this context depends on the repository service you use.
GitHub allows individual files of [up to 100 MB](https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-large-files-on-github#file-size-limits), so for any file below that limit can be safely included in your repository.
If you have many moderately big files, you might be reaching [GitHub's soft limit of around 5Gb per repository](https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-large-files-on-github#repository-size-limits).

Other services impose other limits but whatever the limit, bear in mind that large repositories can perform poorly.

<div class = notes> 

Repository size and version control

When using version control, remember that the repository stores the information of every past commit.
This means that the size of the complete repository can be much larger than the size of the project at a particular point in time.
Since code is stored in plain text files, this overhead is not big, but if you have data in your repository every change to the data files will be remembered and can severely increase your repository size.
</div>

### Data ouside the repository

If your data is not so tiny and exceeds the limits of your particular repository provider, you will need to look for an external service to host it and how to provide access to it.

<div class = notes> 

Public data

Sometimes a research project might use publicly-accessible data, perhaps provided by a public API, or a public repository.
In that case, you might not need to host the data yourself and instead rely on that service.
While this has the advantage that other people can handle all the complexities of data storage and delivery, the disadvantage is that you don't control it.
The service might decide to update the data (perhaps they found an error) and you might then lose access to the version of the data that produced a certain result.
</div>

A survey of every hosting provider would be impossible.
Some popular and reputable services are [figshare](https://figshare.com/), the [Open Science Framework](https://osf.io/) and [Mendeley Data](https://data.mendeley.com/).
Each has its own pros and cons, but in this workshop we will use [Zeonodo](https://zenodo.org/) because it's free, offers a generous 50GB limit per dataset, assigns Digital Object Identifier (DOI), supports versioning, and it integrates well with GitHub.
Also because we've used it, so we are more familiar with it.

## Using zenodo for data hosting

The basis of [Zenodo](http://zenodo.org/) to store data are not that much different from using any garden-variety file hosting service.
You just go to the site, upload the file and get a link.
The main difference is that you also need to specify the metadata and you get an unique DOI that represents your data.
This allows you or anyone else to cite these data and also allows you to upload multiple versions of the same dataset and refer to the proper one.

<div class = notes> 

Zeonodo Sandbox

Data uploaded to Zeonodo cannot be deleted.
Because we are going to upload test data, we are going to use [Zenodo Sandbox](https://sandbox.zenodo.org/).
</div>

### Upload

Go do [sandbox.zenodo.org](sandbox.zenodo.org) and log in (create an account or use your GitHub account if necessary).
To upload a dataset you need to click on Upload.





<div class="figure">
<img src="images/zenodo-upload_1.png" alt="Screenshot of Zenodo’s page after clicking Upload on the main page. It shows a list with one entry, called “PEnguins” and a green button titled “New Upload.”"  />
<p class="caption">Figure 1: Zeonodo upload. As you can see, datasets are permanent and this user had already uploaded one test dataset in preparation for writing this.</p>
</div>

You will see a list of your previously-uploaded datasets which in your case might be empty.
Now you need to click on "New Upload".





<div class="figure">
<img src="images/zenodo-upload_2.png" alt="Screenshot of Zenodo’s New Upload page. It shows a big area where to drop file with a button to Chose files."  />
<p class="caption">Figure 2: Zeonodo upload section.</p>
</div>

In this new section you can drag and drop your files on the big area or click on "Choose files" to open a file chooser.
A single dataset can have multiple files.





<div class="figure">
<img src="images/zenodo-upload_3.png" alt="Screenshot of Zenodo’s New Upload page scrolled down. It shows a list of options for metadata."  />
<p class="caption">Figure 3: Zeonodo upload section.</p>
</div>

Zeonodo supports multiple types of records.
Beside datasets, you could create a DOI for your entire publication, or for individual images.
This is the lesson about datasets, so you need to select "Dataset" as the upload type.

You can create your upload as an unpublished draft and only publish it once you are ready.
In this case, it is a good idea to reserve the DOI before publishing.
That way you can cite this future upload safely on your publication.

Finally, it is important to fill in the metadata.
Title, keywords, description will document what this data is, how it was collected and what it was used for.

Don't stress yourself too much about the correctness of each field, you can always edit this information in the future.

The last step is to click the "Publish" button at the bottom of the page and your dataset will be published.





<div class="figure">
<img src="images/zenodo-upload_4.png" alt="Screenshot of Zenodo’s record viewer. It shows a record titled “Test Upload 2,” a preview of the dataset, an “Edit” button, a “New Version” button, and information on the publication date, DOI and Licence."  />
<p class="caption">Figure 4: Zeonodo upload section.</p>
</div>

Once the dataset is uploaded you will be able to see the result.
You can see [this](https://sandbox.zenodo.org/record/1029654) example.

If you are logged in you will see two big buttons labelled "Edit" and "New Version".
The Edit button allows you to edit the metadata associated with this record.
So you don't need to worry about typos and other errors.
The New Version button allows you to upload a whole new version of the dataset in case you find an error in your dataset and want to correct it.
Each version will have its own DOI and stable URL so you can cite and download the specific version used in each project.

<div class = activity> 

Upload your data

Follow all the steps detailed previously to upload penguins.csv to a Zenodo record. 
(We are testing stuff, so remember to use sandbox.zenodo.org).

</div>:

### Download

Once the dataset is hosted somewhere you need to decide how do you want people to get it.
You could simply put a link to the data in the README and indicate where to download it manually.
This involves minimal effort but it introduces error-prone manual steps and thus make the project harder to reproduce.

If you go to a zenodo record, below the file previewyou will see a box with the list of files in it.





<div class="figure">
<img src="images/file_list.png" alt="Screenshot of Zenodo’s list of files in the example database. It shows one file called penguins.csv that weights 15.2kB. To the right there’s a “Preview” button and a “download” button and below it an md5 checksum."  />
<p class="caption">Figure 5: Lis of files in the example database.</p>
</div>

The nice bit here is the "Download" button. 
This is the button you should point people to. 

To make reproducibility much easier, you could write code that programmatically download the datasets where it should be.
For example, you could create a `download_penguins()` function


```r
download_penguins <- function() {
  file <- here::here("data/penguins.csv")
  url <- "https://sandbox.zenodo.org/record/1029654/files/penguins.csv?download=1"
  download.file(url, file)
}
```

To get the URL of each file, you can right-click on the Download button and select Copy link to clipboard. 

Now anyone wanting to reproduce the project can call `download_penguins()` from the project and the dataset will be downloaded where it needs to be.

An even seamless approach could be create a function that returns the dataset, downloading the relevant files if needed.
A minimal example would be something like this


```r
dataset_penguins <- function() {
  file <- here::here("data/penguins.csv")
  if (!file.exists(file)) {
    download_penguins()
  } 
  return(read.csv(file))
}
```

Now you can forget everything about downloading datasets and just use this function inside your RMarkdown like this

``` r
penguins <- dataset_penguins()
```

With this system, the RMarkdown file will be self-sufficient and download the data if needed.
Neither future you nor any future reproducibility enthusiast needs to worry about downloading data before running the code.


<div class = activity> 

Improve report.Rmd

1. Modify report.Rmd in the [demo project](http://localhost:4321/reproducibility-with-r/demo_project.zip) to download the data automatically. 

</div>



<div class = notes> 

Manage Zenodo programmatically

You can use the [**zen4R**](https://github.com/eblondel/zen4R) package to automate all these steps. 
This will allow you to create, update and download datasets using Zenodo's API.
</div>
  
