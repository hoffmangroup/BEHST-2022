# BEHST - Biological Enrichment of Hidden Sequence Targets #

BEHST: an advanced tool for gene set enrichment analysis (GSEA) enhanced
through integration of chromatin long-range interactions

## Summary ##
BEHST reads an input dataset of chromosome regions, and intersects them with the chromatin interactions available in the Hi-C dataset. Of these chromosome regions, BEHST selects those that are presentthe regulatory regions of genes of APPRIS, a dataset of principal isoform annotations. We defined these cis-regulatory regions upon the position of their nearest transcription start site of the APPRIS genes' principal transcripts (obtained through GENCODE), plus an upstream and downstream extension. Afterwards, BEHST takes the genes of the resulting partner loci found in gene regulatory regions, and performs a gene set enrichment analysis on them through g:Profiler. BEHST, finally, outputs the list of the most significant Gene Ontology terms detected by g:Profiler.

## Installation ##
BEHST can be used on any Linux or macOS machine.
To run BEHST, you need to have the following programs and packages installed in your machine:

* **Python** (version 2.7.5)
* Python **Pandas** package
* **Bedtools** (version v2.25.0)
* Python **PyBedtools** package
* **R** (version 3.3.2)
* R **gProfileR** package
* **conda** package

You can easily install and/or update these packages through **conda** and **bioconda**, following these instructions:

1) Manually install conda [(instructions here)](https://conda.io/docs/install/quick.html)

2) Type the following commands to set the proper conda channels:

`conda config --add channels defaults;`

`conda config --add channels conda-forge;`

`conda config --add channels bioconda;`

3) Type the following commands to install BEHST:

`conda install -c bioconda behst;`

## Execution instructions - Quick start ##

Download the default BEHST data files into a specific data folder (for example,  ~/myBEHSTdataFolder):

`behst-download-data ~/myBEHSTdataFolder`

Apply BEHST to an input BED file of genomic regions, by using the default gene annotations, the default transcript annotations, and the default Hi-C long range interactions. For example, to apply BEHST to the FANTOM5 pancreas enhancers:

`behst ~/myBEHSTdataFolder/pressto_PANCREAS_enhancers.bed ~/myBEHSTdataFolder`

## Execution instructions - Complete explanation ##
To run BEHST, you first have to download the default data files. They are genomic regions files containing enhancers of FANTOM5 and VISTA which can be the input of your test, and the files of the data you need to run BEHST: a GENCODE annotation file, a principal transcript APPRIS file, and a Hi-C long-range interaction file.

To download the data files, you have to run the `behst-download-data` by providing the full path of there folder where you want to download the data files. For example:

`behst-download-data ~/myBEHSTdataFolder`

This command downloads all the default data files of BEHST into the `~/myBEHSTdataFolder/` folder in your computer.
After having downloaded all the default data files, you can use BEHST by calling the `behst` script providing two mandatory parameters (an input .bed file of genomic regions on which to apply BEHST, and the default data folder full path), and multiple optional parameters.
With the optional parameters, you can specifify alternative values for the query extension (`-Q`) and the target extension (`-T`), and alternative files for the gene annotations (`g`), for the principal transcript file (`-t`), and for the long-range interaction file (`-i`).

For example, to apply BEHST to the FANTOM5 lung enhancers by using the optimized hyper-parameter values QUERY = 24100 and TSS extension = 9400, the default GENCODE annotations (previously downloaded in the `~/myBEHSTdataFolder/` folder), the default APPRIS transcripts (previously downloaded in the `~/myBEHSTdataFolder/` folder), and the default Hi-C long range interactions (previously downloaded in the `~/myBEHSTdataFolder/` folder), run the following commands:

`behst ~/myBEHSTdataFolder/pressto_LUNG_enhancers.bed ~/myBEHSTdataFolder`

The user can decide to use an alternative gene annotation file, an alternative transcript file, and an alternative chromatin loopings file, by specifying them as arguments to the `project.sh` script. The user can read the help by typing:

`behst --help`

This command will print the following instructions:



    usage: behst [-h] [-T TARGET_EXTENSION] [-Q QUERY_EXTENSION]
                         [-g GENE_ANNOTATION_FILE] [-t TRANSCRIPT_FILE]
                         [-i INTERACTION_FILE] [-v]
                         INPUT_BED_FILE
                         BEHST_DATA_FILES_FOLDER

     positional arguments:
      INPUT_BED_FILE        input BED file of genomic regions
      BEHST_DATA_FILES_FOLDER
                            path to the folder where you downloaded the default
                            BEHST data files with ./behst-download-data
    
     optional arguments:
      -h, --help            show this help message and exit
      -T TARGET_EXTENSION, --target-extension TARGET_EXTENSION
                            target extension basepair integer. Default is 9400.
      -Q QUERY_EXTENSION, --query-extension QUERY_EXTENSION
                            query extension basepair integer. Default is 24100.
      -g GENE_ANNOTATION_FILE, --gene-annotation-file GENE_ANNOTATION_FILE
                            path of the gene annotation file (.gtf format).
                            Default is the GENCODE annotation v.19 file
                            (gencode.v19.annotation_withproteinids.gtf).
      -t TRANSCRIPT_FILE, --transcript-file TRANSCRIPT_FILE
                            path to the principal transcript file (.bed format).
                            Default is APPRIS transcript 2017_01.v20 file
                            (appris_data_principal.bed)
      -i INTERACTION_FILE, --interaction-file INTERACTION_FILE
                            path to the chromatin interactions file (.hiccups
                            format). Default is the Hi-C HiCCUPS from Lieberman-Aiden 2014 (hic_8celltypes.hiccups).
      -v, --version         current BEHST version
    
    Citation: Chicco D, Bi HS, Reimand J, Hoffman MM. 2017. "BEHST: Genomic set enrichment analysis enhanced through integration of chromatin long-range interactions". In preparation.


## License ##
All the code is licensed under the [GNU General Public License, version 2 (GPLv2)](http://www.gnu.org/licenses/gpl-2.0-standalone.html).


## Contacts ##

BEHST was developed by [Davide Chicco](http://www.DavideChicco.it), Haixin Sarah Bi, and Michael M. Hoffman at the [Hoffman Lab](http://www.hoffmanlab.org) of the [Princess Margaret Cancer Centre](http://www.uhn.ca/PrincessMargaret/Research/) (Toronto, Ontario, Canada).

## Support ##
For support of BEHST, please write to the [BEHST-users mailing list](behst-l@listserv.utoronto.ca), rather than writing the authors directly. Using the mailing list will get your question answered more quickly. It also allows us to pool knowledge and reduce getting the same inquiries over and over. Questions sent to the mailing list will receive a higher priority than those sent to us individually.

If you do not want to read discussions about other people's use of BEHST, but would like to hear about new releases and other important information, please subscribe to the [BEHST-announce mailing list](behst-announce-l@listserv.utoronto.ca).