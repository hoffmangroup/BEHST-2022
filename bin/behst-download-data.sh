#!/bin/bash
#!/usr/bin/env python3.5
#
#$ -cwd
#$ -S /bin/bash
#
set -o pipefail -o errexit
# set -o nounset
# set -o xtrace

cd $HOME

# the --small option lets the script download only one file for testing

printf "\n :: BEHST - Biological Enrichment of Hidden Sequence Targets behst-download-data ::\n"

HOME_VAR=""

if [ -z "$XDG_DATA_HOME" ] # unset
  then
     HOME_VAR=$HOME
     # echo "HOME_VAR=\$HOME=$HOME/.local/behst"
else # set
     HOME_VAR=$XDG_DATA_HOME
     #echo "HOME_VAR=\$XDG_DATA_HOME=$XDG_DATA_HOME/behst"
fi


if [ -z "$1" ]
  then
    OUTDIR=$HOME_VAR"/.local/behst"
else
    OUTDIR=$1
    # echo "You specified "$OUTDIR" as data folder."
fi

echo
echo "Downloading BEHST reference data files into "$OUTDIR
echo



mkdir -p $OUTDIR
cd $OUTDIR

wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/appris_data_principal.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/gencode.v19.annotation_withproteinids.gtf
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/hic_8celltypes.hiccups

if [ "$2" == "--small" ]; then 

  wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_LIVER_enhancers.bed
fi

# Let's also create the /results/ and /temp/ folder that BEHST needs

mkdir -p ../results

mkdir -p ../temp