#!/bin/bash
#
#$ -cwd
#$ -S /bin/bash
#
# set -o nounset 
set -o pipefail
set -o errexit
#set -o xtrace

OPTS=`getopt -o hTQgti --long test,help,target-extension,query-extension,gene-annotation-file,transcript-file,interaction-file: -n 'parse-options' -- "$@"`

if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi

printf "Number of input parameters: "$#"\n"
if [ $# = "0" ]; then 
   echo "Input bed file not found. The program will exit 1"
   exit 1
fi

printf "\n :: BEHST - Biological Enrichment of Hidden Sequence Targets ::\n\n"


if [ $1 = "--test" ]; then 

	if [ ! -f "hiC_parser.py" ]; then
	    echo "Executable file hiC_parser.py not found! The program will exit 1"
	    exit 1
	fi
	if [ ! -f "gProfilerCall.r" ]; then
	    echo "Executable file gProfilerCall.r not found! The program will exit 1"
	    exit 1
	fi
	if [ ! -f "gene_annotation_parser.py" ]; then
	    echo "Executable file gene_annotation_parser.py not found! The program will exit 1"
	    exit 1
	fi
	echo "Executable files found, test passed."
	exit 0
fi

if [ $1 = "-h" ] || [ $1 = "--help" ]; then 

	printf "	Usage: ./behst INPUT_BED_FILE [--optionsl parameters]\n\n"

	printf "	List of optional parameters:\n\n"
	printf "	-T | --target-extension		target extension basepair integer (default is 9400)\n"
	printf "	-Q | --query-extension		query extension basepair integer (default is 24100)\n"
	printf "	-g | --gene-annotation-file	gene annotation file path (default is GENCODE annotation v.19)\n"
	printf "	-t | --transcript-file		principal transcript file path (default is APPRIS\n"
	printf " 					transcript 2017_01.v20 file)\n"
	printf "	-i | --interaction-file		chromatin interactions file path (default is the Hi-C HiCCUPS \n"
	printf "					from Lieberman-Aiden 2014)\n"
	exit 0
fi


echo "$OPTS"

TSS_EXT="DEFAULT_ET"
QUERY_AC="DEFAULT_EQ"
INPUT_FILE="unknown"
GENE_ANNOTATION_FILE="DEFAULT_GENE_ANNOTATION_FILE"
TRANSCRIPT_ANNOTATION_FILE="DEFAULT_TRANSCRIPT_ANNOTATION_FILE"
HI_C_FILE="DEFAULT_LONG_RANGE_INTERACTION_FILE"

    

printf "\n1st parameter: "$1"\n"
printf "2nd parameter: "$2"\n"
printf "3rd parameter: "$3"\n"
printf "4th parameter: "$4"\n"
printf "5th parameter: "$5"\n"
printf "6th parameter: "$6"\n"
printf "7th parameter: "$7"\n"
printf "8th parameter: "$8"\n"
printf "9th parameter: "$9"\n"
printf "10th parameter: "${10}"\n"
printf "11th parameter: "${11}"\n"
printf "12th parameter: "${12}"\n\n"

INPUT_FILE="$1"; shift;

COUNTER=0

while true; do
  case "$1" in
    -T | --target-extension ) TSS_EXT="$2"; shift; shift ;;
    -Q | --query-extension ) QUERY_AC="$2"; shift; shift ;;
    -g | --gene-annotation-file )    GENE_ANNOTATION_FILE="$2"; shift; shift ;;
    -t | --transcript-file )    TRANSCRIPT_ANNOTATION_FILE="$2"; shift; shift ;;
    -i | --interaction-file )    HI_C_FILE="$2"; shift; shift ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
  COUNTER=$[COUNTER + 1]
  # printf "COUNTER = "$COUNTER"\n"
done

echo INPUT_FILE=$INPUT_FILE
echo TSS_EXT=$TSS_EXT
echo QUERY_AC=$QUERY_AC
echo GENE_ANNOTATION_FILE=$GENE_ANNOTATION_FILE
echo TRANSCRIPT_ANNOTATION_FILE=$TRANSCRIPT_ANNOTATION_FILE
echo HI_C_FILE=$HI_C_FILE
printf "\n\n"


./project.sh $INPUT_FILE $QUERY_AC $TSS_EXT $GENE_ANNOTATION_FILE $TRANSCRIPT_ANNOTATION_FILE $HI_C_FILE