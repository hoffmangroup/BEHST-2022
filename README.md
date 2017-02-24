# BEST - Biological Enrichment of Sequence Targets #

BEST: an advanced tool for gene set enrichment analysis (GSEA) enhanced
through chromatin long-range interactions


### What is this repository for? ###

* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up? ###

* Summary of set up
* Configuration
* Dependencies
* Database configuration
* How to run tests
* Deployment instructions

### Installation ###
To run best, you need to have the following programs and packages installed in your machine:
- Python
- Python Pandas package
- Bedtools
- Python PyBedtools package
- R
- R gProfileR package

You need to have root privileges, an internet connection, and at least 8 GB of free space on your hard disk.

#### Instructions for Linux CentOS 7 ####
Here are instructions to install all the programs and libraries needed by BEST on a Linux CentOS 7.2.1511 computer.

First of all, update your system:
`sudo yum -y update`

Install Python, and Python Pandas package:

`sudo yum -y install python`

`sudo yum -y install python-devel`

`sudo yum -y install epel-release`

`sudo yum -y install python-pip`

`sudo pip install pandas`

Install the development tools, such as gcc:

`sudo yum -y group install "Development Tools"`

`sudo yum -y install zlib-devel`

Install bedtools:

`sudo yum -y BEDTools`

`sudo pip install pybedtools`

Install R and its packages RCurl and gProfileR:

`sudo yum -y install R`

`sudo yum -y install curl-devel`

`sudo Rscript -e 'install.packages(c("RCurl","gProfileR"), repos="https://cran.rstudio.com")' `

#### Instructions for Linux Ubuntu 12 ####
#### Instructions for Mac OS 10 ####


### License ###
All the code is licensed under the [GNU General Public License, version 2 (GPLv2)](http://www.gnu.org/licenses/gpl-2.0-standalone.html).

The file of the Hi-C dataset `\data\hic_allCellTypes` was downloaded from the National Center for Biotechnology Information (NCBI) [Gene Expression Omnibus (GEO) website](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE63525) and is available under the [GEO copyright license](https://www.ncbi.nlm.nih.gov/geo/info/disclaimer.html).

The file of the APPRIS dataset `\data\appris_data_principal.txt` was downloaded from the [APPRIS website](http://appris.bioinfo.cnio.es/#/downloads) and is available under the [Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)](https://creativecommons.org/licenses/by-nc-nd/4.0/).

The file of the GENCODE dataset `\data\gencode.v19.annotation.gtf_withproteinids` was downloaded from the [GENCODE website](http://appris.bioinfo.cnio.es/#/downloads) and is available under the [Creative Commons
Attribution-NonCommercial-NoDerivs 2.5 Generic (CC BY-NC-ND 2.5)](https://creativecommons.org/licenses/by-nc-nd/2.5/).

### Contacts ###

BEST was developed by Davide Chicco, Haixin Sarah Bi, and Michael M. Hoffman at the [Hoffman Lab](http://www.hoffmanlab.org) of the [Princess Margaret Cancer Centre](http://www.uhn.ca/PrincessMargaret/Research/) (Toronto, Ontario, Canada).

For code questions, write to Davide Chicco: davide.chicco(AT)davidechicco.it

For scientific questions, write to Michael M. Hoffman: michael.hoffman(AT)utoronto.ca