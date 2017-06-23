#!/bin/bash
#
#$ -cwd
#$ -S /bin/bash
#
set -o nounset -o pipefail -o errexit
# set -o xtrace

# Suppose you're in the /behst/ folder. 
cd ..

# Now let's download the /data/ folder
# wget -r -l1 --no-parent -nH --cut-dirs=2 -e robots=off https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/

# The B plan
mkdir data
cd data

wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/appris_data_principal.txt
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/ENCFF001VED.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/ENCFF001VED_sorted.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/ENCODE_myc.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/ENCODE_myc_first9rows.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/file2.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/file3.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/file.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/FORMER_ENCFF001VED_SHUFFLE.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/FORMER_KLF2_input_to_tool_step_9_SHUFFLE.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/FORMER_vista_example4_Human_brain_sorted_SHUFFLE.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/FORMER_vista_example4_Human_sorted_SHUFFLE.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/FORMER_vista_example4_Human_sorted_SHUFFLE_sorted.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/gencode.v19.annotation.gtf_withproteinids
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/go_data_example
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/gpdw_gene_list
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/hic_allCellTypes
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/KLF2_input_to_tool_step_9.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/KLF2_input_to_tool_step_9_SHUFFLE2.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/KLF2_input_to_tool_step_9_sorted_SHUFFLE2.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/my.genome
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_BLOOD_enhancers.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_BLOOD_enhancers_SHUFFLED.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_LIVER_enhancers.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_LIVER_enhancers_SHUFFLED.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_LUNG_enhancers.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_LUNG_enhancers_SHUFFLED.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_PANCREAS_enhancers.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_PANCREAS_enhancers_SHUFFLED.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_STOMACH_enhancers.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/pressto_STOMACH_enhancers_SHUFFLED.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/random_example_9rows2.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/random_example_9rows.bed
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
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/tss_list_1486400665.65.bed
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_example2_Human_ORIGINAL
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_example2_Mouse
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_example3_Human
wget https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/vista_example_temp
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

# Let's also create the /results/ and /temp/ folder that BEHST needs

mkdir ../results

mkdir ../temp