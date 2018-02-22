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
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_LIVER_enhancers.bed

wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/appris_data_principal_bed.pkl
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/gencode.v19.annotation_withproteinids_gtf.pkl
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/hic_8celltypes_hiccups.pkl

if [ "$2" != "--small" ]; then 

      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/my.genome
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_BLOOD_enhancers.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_BLOOD_enhancers_SHUFFLED.bed      
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_LIVER_enhancers_SHUFFLED.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_LUNG_enhancers.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_LUNG_enhancers_SHUFFLED.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_PANCREAS_enhancers.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_PANCREAS_enhancers_SHUFFLED.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_STOMACH_enhancers.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_STOMACH_enhancers_SHUFFLED.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/randomlyShuffledNew_pressto_BLOOD_enhancers.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/randomlyShuffledNew_pressto_LIVER_enhancers.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/randomlyShuffledNew_pressto_LUNG_enhancers.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/randomlyShuffledNew_pressto_PANCREAS_enhancers.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/randomlyShuffledNew_pressto_STOMACH_enhancers.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/randomlyShuffledNew_vista_EYE_sorted.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/randomlyShuffledNew_vista_FOREBRAIN_sorted.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/randomlyShuffledNew_vista_HEART_sorted.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/randomlyShuffledNew_vista_HINDBRAIN_sorted.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/randomlyShuffledNew_vista_Human_BRAIN_sorted.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/randomlyShuffledNew_vista_Human_sorted.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/randomlyShuffledNew_vista_LIMB_sorted.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/randomlyShuffledNew_vista_MIDBRAIN_sorted.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/randomlyShuffledNew_vista_NOSE_sorted.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_EYE_SHUFFLED.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_EYE_sorted.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_EYE_TEMP
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_FOREBRAIN_SHUFFLED.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_FOREBRAIN_sorted.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_HEART_SHUFFLED.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_HEART_sorted.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_HEART_TEMP
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_HINDBRAIN_SHUFFLED.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_HINDBRAIN_sorted.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_Human_BRAIN_SHUFFLED.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_Human_BRAIN_sorted.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_Human_SHUFFLED.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_Human_sorted.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_LIMB_SHUFFLED.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_LIMB_sorted.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_LIMB_sorted_EDITED_FOR_GREAT.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_MIDBRAIN_SHUFFLED.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_MIDBRAIN_sorted.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_MIDBRAIN_sorted_EDITED_FOR_GREAT.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_NOSE_SHUFFLED.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_NOSE_sorted.bed
      wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_NOSE_sorted_FOR_GREAT.bed

fi

# Let's also create the /results/ and /temp/ folder that BEHST needs

mkdir -p ../results

mkdir -p ../temp