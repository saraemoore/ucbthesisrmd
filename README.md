[![Build Status](https://travis-ci.org/saraemoore/ucbthesisrmd.svg?branch=master)](https://travis-ci.org/saraemoore/ucbthesisrmd)

### Description

This R package provides a single [R Markdown](http://rmarkdown.rstudio.com) template and format, both named **ucbthesis**. This PDF document template is built on the ucbthesis LaTeX document class for [PhD dissertations](https://math.berkeley.edu/~vojta/tex/ucbthesis-phd.html) and [Master's theses](https://math.berkeley.edu/~vojta/tex/ucbthesis-masters.html) maintained and distributed by Paul Vojta. This package also builds upon/brings up-to-date features available in Steven Pollack's [ucbthesis R package](https://github.com/stevenpollack/ucbthesis). This package is intended for UC Berkeley graduate students who also utilize R code in their thesis or dissertation results and/or would like to avoid setting up and editing their document using more complex markup languages (e.g. LaTeX) or word-processing software (e.g. Microsoft Word).

### Table of Contents

1. [Prerequisites](#prerequisites)  
2. [Installation](#installation)
3. [Usage](#usage)
4. [Advanced](#advanced)

### Prerequisites

In short, this template requires XeLaTeX, [pandoc](http://pandoc.org/), and the [rmarkdown](https://cran.r-project.org/web/packages/rmarkdown/) R package.

XeLaTeX is included with 'full' installs of [TeX Live](http://www.tug.org/texlive/) and [MacTeX](http://www.tug.org/mactex/). To acquire [pandoc](http://pandoc.org/) and [rmarkdown](https://cran.r-project.org/web/packages/rmarkdown/), you can either install the latest version of [RStudio](http://www.rstudio.com/products/rstudio/download/) or perform manual installations:

- [pandoc](http://pandoc.org/): [instructions](https://github.com/rstudio/rmarkdown/blob/master/PANDOC.md) are provided with the **rmarkdown** package
- [rmarkdown](https://cran.r-project.org/web/packages/rmarkdown/):

```r
install.packages("rmarkdown")
```

Additionally, the sample document shipped with the ucbthesisrmd package can be rendered without modification (if you'd like to quickly see a preview of what a finished PDF could look like; see [Usage](#usage) below for further instructions), **but the following packages must first be installed**:

* [pander](https://cran.r-project.org/web/packages/pander/index.html),
* [ggplot2](https://cran.r-project.org/web/packages/ggplot2/index.html),
* [tikzDevice](https://cran.r-project.org/web/packages/tikzDevice/index.html), and
* [dagR](https://cran.r-project.org/web/packages/dagR/index.html).

```r
install.packages(c("pander", "ggplot2", "tikzDevice", "dagR"))
```

### Installation

To install the ucbthesisrmd R package from GitHub:

```r
devtools::install_github("saraemoore/ucbthesisrmd")
```

### Usage

To create a new R Markdown document using the **ucbthesis** template, use the `rmarkdown::draft` function:

```r
rmarkdown::draft("/path/to/my_thesis.Rmd", template = "ucbthesis", package = "ucbthesisrmd", edit = FALSE)
```

Alternatively, if using RStudio, begin a new document using this template by going to "File > New File > R Markdown..."

A new directory (here called 'my_thesis') will be created by default (to suppress this, add `create_dir = FALSE` to the call to `rmarkdown::draft()`) in the parent directory you specified (in the toy example above, `/path/to/`). Within this directory, you'll find four files that you can and should modify:

* the main R Markdown document ('my_thesis.Rmd'),
* two sample chapters ('chap1.Rmd' and 'chap2.Rmd') -- also referred to below as child documents -- and
* a sample bibliography file ('references.bib').

(You'll also see a LaTeX class file, ucbthesis.cls, in this directory -- you won't need to modify this file.)

To customize this document for your thesis or dissertation, modify the YAML header in the main R Markdown document. Also in this file, add (or remove) links to child documents like chapters, an introduction, or a conclusion. Put your manuscript in the child document(s) using either (R) Markdown or TeX syntax. Your bibliographic references can go into references.bib, and further bibliography options can be set in the YAML header.

To render the document:

```r
rmarkdown::render("/path/to/my_thesis/my_thesis.Rmd")
```

In RStudio, if preferred, use either the "Knit" button or the keyboard shortcut (Ctrl+Shift+K).

**Note**: If you run the above command within the R console and get a `xelatex: command not found` error, try running R from the shell.

### Advanced

See the [wiki](https://github.com/saraemoore/ucbthesisrmd/wiki) for advanced usage of this package.
