#!/bin/bash
#!/usr/bin/env python3.5
#!/usr/bin/env Rscript
#
#$ -cwd
#$ -S /bin/bash
#
set -o nounset -o pipefail -o errexit
# set -o xtrace

# ./project.sh ../data/pressto_LUNG_enhancers.bed DEFAULT_EQ DEFAULT_ET DEFAULT_GENE_ANNOTATION_FILE DEFAULT_TRANSCRIPT_ANNOTATION_FILE DEFAULT_LONG_RANGE_INTERACTION_FILE


startTime=`date +%s`
millisec_time_number=$(date +%s)

printf "\n :: BEHST - Biological Enrichment of Hidden Sequence Targets ::\n\n"


# if [ $1 = "--test" ]; then
#
# 	if [ ! -f "hiC_parser.py" ]; then
# 	    echo "Executable file hiC_parser.py not found! The program will exit 1"
# 	    exit 1
# 	fi
# 	if [ ! -f "gProfilerCall.r" ]; then
# 	    echo "Executable file gProfilerCall.r not found! The program will exit 1"
# 	    exit 1
# 	fi
# 	if [ ! -f "gene_annotation_parser.py" ]; then
# 	    echo "Executable file gene_annotation_parser.py not found! The program will exit 1"
# 	    exit 1
# 	fi
# 	echo "Executable files found, test passed."
# 	exit 0
# fi


INPUT_FILE=$1
BEHST_DATA_FOLDER=$2
QUERY_AC=$3 # eQ in the paper
TSS_EXT=16000 # default TSS extension
TARGET_AC=$4 # eT in the paper (new variable)

GENE_ANNOTATION_FILE=$5
TRANSCRIPT_ANNOTATION_FILE=$6
HI_C_FILE=$7
GPROFILER_OFF=$8

ORIGINAL_INPUT_FILE=$1
ORIGINAL_BEHST_DATA_FOLDER=$2
ORIGINAL_QUERY_AC=$3
ORIGINAL_TARGET_AC=$4
ORIGINAL_GENE_ANNOTATION_FILE=$5
ORIGINAL_TRANSCRIPT_ANNOTATION_FILE=$6
ORIGINAL_HI_C_FILE=$7
ORIGINAL_GPROFILER_OFF=$8

if [ ! -f $INPUT_FILE ]; then
    printf "(project.sh) File $INPUT_FILE not found!\n The program will stop"
    exit 1
fi

if [ $QUERY_AC = "default_eq" ]; then
   QUERY_AC=10600
fi

if [ $TARGET_AC = "default_et" ]; then
   TARGET_AC=8500
fi

printf "\n The query extension eQ parameter is  "$QUERY_AC "\n"
printf "\n The target extension eT parameter is  "$TARGET_AC "\n\n"


if [ $GENE_ANNOTATION_FILE = "default_gene_annotation_file" ]; then
   GENE_ANNOTATION_FILE=$BEHST_DATA_FOLDER"/gencode.v19.annotation_withproteinids.gtf"
fi

if [ $TRANSCRIPT_ANNOTATION_FILE = "default_transcript_annotation_file" ]; then
   TRANSCRIPT_ANNOTATION_FILE=$BEHST_DATA_FOLDER"/appris_data_principal.bed"
fi

if [ $HI_C_FILE = "default_long_range_interaction_file" ]; then
   HI_C_FILE=$BEHST_DATA_FOLDER"/hic_8celltypes.hiccups"
fi

printf "\n The gene annotation file is  "$GENE_ANNOTATION_FILE "\n"
printf "\n The transcript annotation file is  "$TRANSCRIPT_ANNOTATION_FILE "\n"
printf "\n The long range interaction file is  "$HI_C_FILE "\n\n"
echo

filename=$(basename "$INPUT_FILE")
filename="${filename%.*}"
filename=$filename".bed"

INPUT_FILE_NEW=${filename//./_}

RESULTS_DIR="./BEHST-results"
mkdir -p $RESULTS_DIR
#TEMP_DIR="./temp-rand_"${millisec_time_number}
#mkdir -p $TEMP_DIR
TEMP_DIR=$(mktemp -d)

# GENE_ANNOTATION_FILE="../data/gencode.v19.annotation_withproteinids.gtf"
# TRANSCRIPT_ANNOTATION_FILE="../data/appris_data_principal.bed"
# HI_C_FILE="../data/hic_8celltypes.hiccups"

HI_C_FILTERED_TEMP_FILE="hi_c_filtered.txt"
OUTPUT_FILE=${INPUT_FILE_NEW}"_QUERY"${QUERY_AC}"_TARGET"${TARGET_AC}"_gene_list.txt"

ANALYSIS_RESULTS="gProfiler_results_QUERY"${QUERY_AC}"_TARGET"${TARGET_AC}

# to read input from stdin or user-specified argument
# if there is at least one argument and the first argument is a file, assign it to input, otherwise assign stdin to input
# [ $# -ge 1 -a -f "S1" ] && INPUT="$1" || INPUT="-"


# if [ $ORIGINAL_HI_C_FILE = "default_long_range_interaction_file" ]; then
#    HI_C_PICKLE_FILE=$BEHST_DATA_FOLDER"/hic_8celltypes_hiccups.pkl"
#    ./hiC_parser_load_pickle_file.py $HI_C_PICKLE_FILE | sort -V > "${TEMP_DIR}/$HI_C_FILTERED_TEMP_FILE"
# else
#     # standard treatment
#     ./hiC_parser.py "$HI_C_FILE" | sort -V > "${TEMP_DIR}/$HI_C_FILTERED_TEMP_FILE"
# fi

#
# part replaced by the previous pickle phase
#
python hiC_parser.py "$HI_C_FILE" | sort -V > "${TEMP_DIR}/$HI_C_FILTERED_TEMP_FILE"

python gene_annotation_parser.py "$GENE_ANNOTATION_FILE" "$TRANSCRIPT_ANNOTATION_FILE" $TSS_EXT > "${TEMP_DIR}/principal_transcripts.bed"


# Similar to bedtools intersect, bedtools window searches for overlapping features in A and B. However, window adds a specified number (1000, by default) of base pairs upstream and downstream of each feature in A. In effect, this allows features in B that are â€œnearâ€ features in A to be detected.

sort -V $INPUT_FILE | bedtools window -w $QUERY_AC -a stdin -b "${TEMP_DIR}/$HI_C_FILTERED_TEMP_FILE" | awk -F $'\t' '{print $(NF-2), $(NF-1), $NF}' OFS=$'\t' | sort -V | uniq | bedtools window -w $TARGET_AC -a stdin -b "${TEMP_DIR}/principal_transcripts.bed" | cut -f7 | sort -V | uniq > "${RESULTS_DIR}/$OUTPUT_FILE"

# comment the following line to save the transcripts
rm "${TEMP_DIR}/principal_transcripts.bed" "${TEMP_DIR}/$HI_C_FILTERED_TEMP_FILE"

echo
printf "\nBEHST generated the resulting gene list in the following file: \n "${RESULTS_DIR}/$OUTPUT_FILE"\n\n"

wc -l ${RESULTS_DIR}/$OUTPUT_FILE

# uncomment the following 2 lines to save the transcripts
# printf "the program will stop here"
# exit

if [ $GPROFILER_OFF = "False" ]; then

  echo
  echo "The program is calling g:ProfileR right now"
  echo

  GPROFILER_OUTPUT_FILE=${RESULTS_DIR}/${INPUT_FILE_NEW}_${ANALYSIS_RESULTS}_rev
  GO_LIST_FILE=${GPROFILER_OUTPUT_FILE}"GO_term_list_rand"${millisec_time_number}".behst"

  Rscript gProfilerCall.r ${RESULTS_DIR}/$OUTPUT_FILE $GPROFILER_OUTPUT_FILE $GO_LIST_FILE

  printf "\n BEHST generated the gProfiler2 output into the following file: \n %s\n\n" $GPROFILER_OUTPUT_FILE
  printf "\n BEHST generated the output GO list into the following file: \n %s\n\n" $GO_LIST_FILE

  endTime=`date +%s`
  runtime=$((endTime-startTime))
  printf 'BEHST Total running time: %dhours,  %dminutes, %dseconds\n' $(($runtime/3600)) $(($runtime%3600/60)) $(($runtime%60))

  rm -r $TEMP_DIR

  # PVALUE_OUTPUT=${RESULTS_DIR}/"limb_lowest_pvalue.txt"
  # LOWEST_ITEM=$(head -2 $GO_LIST_FILE | tail -1) 
  # OUTPUT_LINE="${LOWEST_ITEM}	${QUERY_AC}	${TARGET_AC}"
  # echo $OUTPUT_LINE >> $PVALUE_OUTPUT   

  # to retrieve a genome assembly (solution from https://www.biostars.org/p/98121/):
  # mysql --user=genome --host=genome-mysql.cse.ucsc.edu -A -e
  # \"select chrom, size from hg19.chromInfo\" > hg19.genome
fi
