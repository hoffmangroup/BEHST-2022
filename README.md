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

1) Manually install [Minoconda](https://conda.io/docs/user-guide/install/index.html)

2) Type the following commands to install BEHST:

`conda install -c bioconda behst`

## Execution instructions - Quick start ##

Download the default BEHST data files into a specific data directory (for example,  ~/.local/share/behst):

`behst-download-data -d ~/.local/share/behst`

Apply BEHST to an input BED file of genomic regions, by using the default gene annotations, the default transcript annotations, and the default Hi-C long range interactions. For example, to apply BEHST to the FANTOM5 pancreas enhancers, you first have to download the file with the following command:

`wget wget https://www.hoffmanlab.org/proj/behst/data/pressto_PANCREAS_enhancers.bed`

And then call BEHST with the following command:

`behst pressto_PANCREAS_enhancers.bed -d ~/.local/share/behst`

## Execution instructions - Complete explanation ##
To run BEHST, you first have to download the default data files. They are genomic regions files containing enhancers of FANTOM5 and VISTA which can be the input of your test, and the files of the data you need to run BEHST: a GENCODE annotation file, a principal transcript APPRIS file, and a Hi-C long-range interaction file.

To download the data files, you have to run the `behst-download-data` by providing the full path of there directory where you want to download the data files. For example:

`behst-download-data -d ~/.local/share/behst`

This command downloads all the default data files of BEHST into the `~/.local/share/behst/` directory in your computer.
After having downloaded all the default data files, you can use BEHST by calling the `behst` script providing two mandatory parameters (an input .bed file of genomic regions on which to apply BEHST, and the default data directory full path), and multiple optional parameters.
With the optional parameters, you can specifify alternative values for the query extension (`-Q`) and the target extension (`-T`), and alternative files for the gene annotations (`g`), for the principal transcript file (`-t`), and for the long-range interaction file (`-i`).

For example, to apply BEHST to the FANTOM5 lung enhancers by using the optimized hyper-parameter values QUERY = 24100 and TSS extension = 9400, the default GENCODE annotations (previously downloaded in the `~/.local/share/behst/` directory), the default APPRIS transcripts (previously downloaded in the `~/.local/share/behst/` directory), and the default Hi-C long range interactions (previously downloaded in the `~/.local/share/behst/` directory), run the following commands. First, download the lung enhancers file:

`wget https://www.hoffmanlab.org/proj/behst/data/pressto_LUNG_enhancers.bed`

Then, apply BEHST to it:

`behst pressto_LUNG_enhancers.bed -d ~/.local/share/behst`

The user can decide to use an alternative gene annotation file, an alternative transcript file, and an alternative chromatin loopings file, by specifying them as arguments to the `project.sh` script. The user can read the help by typing:

`behst --help`

The user can also decide to terminate the execution after the production of the gene list, and to avoid the call to gProfileR. In this case, the user has to specify the `--no-gprofiler` option.

This command will print the following instructions:
    
    usage: behst [-h] [-T BP] [-Q BP] [-d DATADIR] [-g FILE] [-t FILE] [-i FILE]
             [--no-gprofiler] [-v]
             BEDFILE

    positional arguments:
      BEDFILE               path to query genomic region file (BED format) regions
    
    optional arguments:
      -h, --help            show this help message and exit
      -T BP, --target-extension BP
                            extend target regions by BP base pairs (default 9400)
      -Q BP, --query-extension BP
                            extend query regions by BP base pairs (default 24100)
      -d DATADIR, --data DATADIR
                            path to directory with reference data (default
                            ~/.local/share/behst)
      -g FILE, --gene-annotation-file FILE
                            path of gene annotation file (GTF format, default
                            DATADIR/gencode.v19.annotation_withproteinids.gtf).
      -t FILE, --transcript-file FILE
                            path to the principal transcript file (BED format,
                            default DATADIR/appris_data_principal.bed)
      -i FILE, --interaction-file FILE
                            path to the chromatin interactions file (HICCUPS
                            Format, default DATADIR/hic_8celltypes.hiccups).
      --no-gprofiler        If activated, generate the gene list and do not call
                            g:ProfileR)
      -v, --version         print current BEHST version

    Citation: Chicco D, Bi HS, Reimand J, Hoffman MM. 2018. "BEHST: Genomic set
    enrichment analysis enhanced through integration of chromatin long-range
    interactions". In preparation.

## License ##
All the code is licensed under the [GNU General Public License, version 2 (GPLv2)](http://www.gnu.org/licenses/gpl-2.0-standalone.html).


## Contacts ##

BEHST was developed by [Davide Chicco](http://www.DavideChicco.it), Haixin Sarah Bi, and Michael M. Hoffman at the [Hoffman Lab](http://www.hoffmanlab.org) of the [Princess Margaret Cancer Centre](http://www.uhn.ca/PrincessMargaret/Research/) (Toronto, Ontario, Canada).

## Support ##
For support of BEHST, please write to the [BEHST-users mailing list](mailto:behst-l@listserv.utoronto.ca), rather than writing the authors directly. Using the mailing list will get your question answered more quickly. It also allows us to pool knowledge and reduce getting the same inquiries over and over. Questions sent to the mailing list will receive a higher priority than those sent to us individually.

If you do not want to read discussions about other people's use of BEHST, but would like to hear about new releases and other important information, please subscribe to the [BEHST-announce mailing list](mailto:behst-announce-l@listserv.utoronto.ca).