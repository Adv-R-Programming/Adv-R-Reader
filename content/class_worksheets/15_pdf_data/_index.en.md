PDF Data Extraction
================

- [Overview][]
- [Install Guide][]
  - [pdftools][]
  - [tesseract][]
  - [tabulizer][]
- [Optical Character Recognition + Text Extraction][]
- [Area Selection & Tables][]
- [Conclusion][]

## Overview

PDFs are a ubiquitous file format. However, they were not made with data
processes in mind. This can make them quite a pain to work with, so they
would be avoided when possible.

Today I will walk you through one example of when I needed to get data
out of PDFs. It will be less of a worksheet and more of an explanation.
In 2019 I spent some time working in the UK building a machine learning
system to identify what foster care providers should be prioritized for
inspection to assure children were receiving adequate care. One of the
most important bits of data in building this system was how these
fostering agencies have performed in the past.

The governmental agency that oversees this process, Ofsted, regularly
published reports on these providers to the public online. However, that
was the only format this information was available in. Step one was
building a web scraper to download all of the reports and attach
relevant metadata. The next step was scraping the contents. The last
step was using that raw data for further analyses. Today we’re going to
work on that second step together.

I’ve provided a real report PDF at the following link. Please download
the file and place it in the `data` directory of your current project.

[Download the PDF Report Here.][]

## Install Guide

Working with PDFs requires a few specialized tools. I’ll try to walk you
though installing them here. In total, we need to end up with working
versions of the `tesseract`, `pdftools`, and `tabulizer` packages. I’ll
provide links to their home pages here:

### pdftools

[pdftools homepage][]

`pdftools` should be the easiest to install, as it does not have any
special dependencies unless you are on Linux. You should be able to
install it using the following:

``` r
install.packages("pdftools")
```

### tesseract

[tesseract homepage][]

The `tesseract` package works as a wrapper around [tesseract-ocr][]. It
should also install without difficulties for most systems using the
following code:

``` r
install.packages("tesseract")
```

### tabulizer

[tabulizer homepage][]

`tabulizer` is where the difficulties will come in, as it relies on Java
and is currently out of date on CRAN. This means we will need to install
it directly from GitHub. Run the following code to install the required
packages. If `rJava` fails to install make sure you have a valid java
installation on your system. **Make sure you install the appropriate
version for your operating system**.

``` r
# install remotes
install.packages("remotes")

# install rJava
install.packages("rJava")

# on 64-bit Windows
remotes::install_github(c("ropensci/tabulizerjars", "ropensci/tabulizer"), INSTALL_opts = "--no-multiarch")
# elsewhere
remotes::install_github(c("ropensci/tabulizerjars", "ropensci/tabulizer"))
```

## Optical Character Recognition + Text Extraction

The first problem with our PDF is that it is a flattened document, which
means the content is really just a picture. You can test this yourself
by opening the PDF in your program of choice and trying to select the
text. We need to re-digitize this text.

Our first step then is running Optical Character Recognition (OCR) on
the document. We can do this in R using the `tesseract` package.
`tesseract` will look at the document, and try to recognize the
squiggles as letters and words. This is much harder for a machine than
it is for us, but this document is pretty clean so it should do well.

If we have `tesseract` installed, then `pdftools` will automatically use
it if we ask for text from a flattened document. We can do this using
the `pdf_ocr_text()` function and by providing the path to the PDF. The
following code will turn every page into a `.png` image, then try to
recognize all the text on the page. It will return a character vector
where each page is an element in the vector.

<div class="question">

Run the following code to run OCR on the example PDF and extract the
text.

``` r
# get text blobs
pdf_text_vector = pdftools::pdf_ocr_text("data/SC_SC037304_2007_07_30__1.pdf")
```

</div>

Looking at out output we get a character vector of length 13 (one for
each page), inside which the contents of each page are all smushed
together. From this, I can try to extract the information I want using
some RegEx. I’ll provide the specific formulas you need; do try to
understand them though! I’m using [regex101][] to help me build my
formulas.

I want to make a dataframe with one row (for this report), with columns
indicating the name of the foster care agency, it’s reference number,
the date, and the summary result. If we were really building a database
from this data, we would then run this code on other reports such that
each report would create one row in the database.

First, I need to load in `stringr` for text tools, and combine all of my
pages into one giant text blob. This is so that I can search for the
info I want from the entire document, rather than needing to search on
each page.

``` r
# load stringr
library(stringr)

# combine all the elements of the vector into one large element for searching
pdf_text_blob = paste0(pdf_text_vector, collapse = " ")
```

Next, I start looking for my key data points. I start with the reference
number, the get the date, and summary rating. I then take those elements
and make a dataframe.

``` r
# Get the document URN
# the regex formula is looking for whatever comes after the phrase "Unique reference number" and ends with the next newline (\n) character
# I need to subset the results matrix to just the contents of my capture (inside the () ), rather than everything
doc_urn = str_match(pdf_text_blob, "(?<=Unique reference number) (.+?)\\n")[1,2]

# Get the date
doc_date = str_match(pdf_text_blob, "(?<=Inspection date) (.+?)\\n")[1,2]

# get summary result
doc_result = str_match(pdf_text_blob, "(?<=The overall quality rating is) (.+?)\\.\\n")[1,2]

# combine results
doc_df = data.frame("urn" = doc_urn, "date" = doc_date, "rating" = doc_result)
```

Because I want to (theoretically) run this code on all the reports, I
will turn it into a function.

``` r
get_report_info = function(pdf_text_blob){
  
  # Get the document URN
  # the regex formula is looking for whatever comes after the phrase "Unique reference number" and ends with the next newline (\n) character
  # I need to subset the results matrix to just the contents of my capture (inside the () ), rather than everything
  doc_urn = str_match(pdf_text_blob, "(?<=Unique reference number) (.+?)\\n")[1,2]
  
  # Get the date
  doc_date = str_match(pdf_text_blob, "(?<=Inspection date) (.+?)\\n")[1,2]
  
  # get summary result
  doc_result = str_match(pdf_text_blob, "(?<=The overall quality rating is) (.+?)\\.\\n")[1,2]
  
  # combine results
  doc_df = data.frame("urn" = doc_urn, "date" = doc_date, "rating" = doc_result)
  
  # return
  return(doc_df)
  
}

get_report_info(pdf_text_blob = pdf_text_blob)
```

You may notice that there is an error in the Unique reference number in
my results; in that there is an extra \$. Unfortunately that comes with
OCR territory, and it did not quite read the document correctly. All we
can do is keep an eye out for these issues and correct them. In this
case, I’ll add a warning if I see any special characters in the URN.

``` r
get_report_info = function(pdf_text_blob){
  
  # Get the document URN
  # the regex formula is looking for whatever comes after the phrase "Unique reference number" and ends with the next newline (\n) character
  # I need to subset the results matrix to just the contents of my capture (inside the () ), rather than everything
  doc_urn = str_match(pdf_text_blob, "(?<=Unique reference number) (.+?)\\n")[1,2]
  
  # Get the date
  doc_date = str_match(pdf_text_blob, "(?<=Inspection date) (.+?)\\n")[1,2]
  
  # get summary result
  doc_result = str_match(pdf_text_blob, "(?<=The overall quality rating is) (.+?)\\.\\n")[1,2]
  
  # combine results
  doc_df = data.frame("urn" = doc_urn, "date" = doc_date, "rating" = doc_result)
  
  # test for special characters in URN
  if(grepl("[^a-zA-Z0-9_]", doc_df$urn)){warning(paste0("Non alpha-numeric symbol in URN! See: ", doc_df$urn))}
  
  # return
  return(doc_df)
  
}

get_report_info(pdf_text_blob = pdf_text_blob)
```

## Area Selection & Tables

Say we didn’t want to get the whole document back as a big blob. One of
the most common times this is the case is when there is a table of data
in our PDF. In this case, we have a table of text on page 10 of the
report. It would be great to somehow keep that formatting and pull it
into R as a table. Well, we can! This is where `tabulizer` comes in.

`tabulizer` allows you to use the X/Y coordinates in a PDF to your
advantage, and just get back the content from that area. Unfortunately,
it does not work with flattened documents, so you would need to run OCR
on the document outside of R. Today, just download the following
document and add it to your data folder.

[Download the digital PDF Report Here.][]

<div class="question">

Run the following code to start an interactive tool to extract the table
from page 10. You should click and drag to create a box around the
table. If the box is not in the right position, hover over the edge of
the box to adjust it.

``` r
# start interactive table too
table_1 = tabulizer::extract_areas("data/digital_SC_SC037304_2007_07_30__1.pdf", pages = 10)
```

</div>

How do the results look? If your results are like mine, it kinda got the
idea, but leaves a lot to be desired. We can refine our extraction with
a few steps. First, we need to get the X/Y coordinates of our table.

<div class="question">

Run the following code to start an interactive tool to get the location
of our table. The interface will be the same as the above, but it will
output a list which contains the dimensions of our table for use later.

``` r
# start interactive table too
table_1_coords = tabulizer::locate_areas("data/digital_SC_SC037304_2007_07_30__1.pdf", pages = 10)
```

</div>

Now that we have our coordinates, we can refine our table extraction a
bit. Using `extract_tables()` we can help the process by specifying how
many columns there should be. I do this by setting `guess` to `FALSE`,
and setting `columns` to the right boundary of each column. You can read
the other options in the help page.

``` r
# set my own coordinates for rendering
table_coords = list(c(236, 70, 674, 525))

# manually refine table results
doc_table = tabulizer::extract_tables("data/digital_SC_SC037304_2007_07_30__1.pdf",
                          guess = FALSE, pages = 10, 
                          area = table_coords,
                          columns = list(c(120, 424, 525)),
                          output = "data.frame")[[1]]
```

The results should be a bit nicer, but still not perfect. We can combine
those multiple rows into a single value with the following code. I take
a step through my current output line by line, and if the next line has
an `NA` in the standard column, I combine the contents of that row’s
`Action` column with the previous. I then create a clean output.

``` r
# make output vector
output = c()

# walk through each row and combine non-NA row conent
for(line in 1:nrow(doc_table)){
  
  # check if standard is not NA
  if(!is.na(doc_table[line, "Standard"])){
    # record standard
    standard = doc_table[line, "Standard"]
    # clear buffer for action text
    action_text = c()
  }
  
  # get the current action text
  action_text = append(action_text, doc_table[line, "Action"])
  
  # if the next row is a new standard, combine current text and save in output
  if(line + 1 > nrow(doc_table) || !is.na(doc_table[line + 1, "Standard"])){
    # combine all action text so far
    action_text = paste0(action_text, collapse = " ")
    
    # save to output
    output[as.character(line)] = action_text
  
  }
  
}

# make clean output
clean_doc_table = data.frame("standard" = doc_table[!is.na(doc_table$Standard), "Standard"],
                             "action" = output,
                             "due_date" = doc_table[!is.na(doc_table$Standard), "Due.date"])
```

## Conclusion

Working with PDFs is messy, but being able to do so gives you access to
an entirely new realm of data sources. While it is always advisable to
look for other ways to get data, if PDFs is all you have, at least now
you know how to make the best of things.

  [Overview]: #overview
  [Install Guide]: #install-guide
  [pdftools]: #pdftools
  [tesseract]: #tesseract
  [tabulizer]: #tabulizer
  [Optical Character Recognition + Text Extraction]: #optical-character-recognition-text-extraction
  [Area Selection & Tables]: #area-selection-tables
  [Conclusion]: #conclusion
  [Download the PDF Report Here.]: https://github.com/Adv-R-Programming/Adv-R-Reader/raw/main/content/class_worksheets/15_pdf_data/data/SC_SC037304_2007_07_30__1.pdf
  [pdftools homepage]: https://docs.ropensci.org/pdftools/index.html
  [tesseract homepage]: https://docs.ropensci.org/tesseract/index.html
  [tesseract-ocr]: https://github.com/tesseract-ocr/tesseract
  [tabulizer homepage]: https://docs.ropensci.org/tabulizer/index.html
  [regex101]: https://regex101.com/
  [Download the digital PDF Report Here.]: https://github.com/Adv-R-Programming/Adv-R-Reader/raw/main/content/class_worksheets/15_pdf_data/data/digital_SC_SC037304_2007_07_30__1.pdf
