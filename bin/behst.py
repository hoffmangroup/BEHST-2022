#!/usr/bin/python2.7

# To run this script:
#
# ./behst.py ../data/pressto_LUNG_enhancers.bed


import argparse

INPUT_FILE="unknown"
TSS_EXT="default_et"
QUERY_AC="default_eq"
GENE_ANNOTATION_FILE="default_gene_annotation_file"
TRANSCRIPT_ANNOTATION_FILE="default_transcript_annotation_file"
HI_C_FILE="default_long_range_interaction_file"



parser = argparse.ArgumentParser()

parser.add_argument("INPUT_BED_FILE", help="input BED file of genomic regions")
parser.add_argument("-T", "--target-extension", help="target extension basepair integer (default is 9400)\n", action="store")
parser.add_argument("-Q", "--query-extension", help="query extension basepair integer (default is 24100)\n", action="store")
parser.add_argument("-g", "--gene-annotation-file", help="gene annotation file path (default is GENCODE annotation v.19)\n", action="store")
parser.add_argument("-t", "--transcript-file", help="principal transcript file path (default is APPRIS transcript 2017_01.v20 file)\n\n", action="store")
parser.add_argument("-i", "--interaction-file", help="chromatin interactions file path (default is the Hi-C HiCCUPS from Lieberman-Aiden 2014)\n\n", action="store")
parser.add_argument("-v", "--version", help="current BEHST version\n", action="version", version='%(prog)s (version 0.6)')

args = parser.parse_args()
print args


INPUT_FILE = args.INPUT_BED_FILE

if args.target_extension:
  TSS_EXT = args.target_extension

if args.query_extension:
  QUERY_AC = args.query_extension

if args.gene_annotation_file:
  GENE_ANNOTATION_FILE = args.gene_annotation_file

if args.transcript_file:
  TRANSCRIPT_ANNOTATION_FILE = args.transcript_file

if args.interaction_file:
  HI_C_FILE = args.interaction_file
  



#-T | --target-extension ) TSS_EXT="$2"; shift; shift ;;
#-Q | --query-extension ) QUERY_AC="$2"; shift; shift ;;
#-g | --gene-annotation-file )GENE_ANNOTATION_FILE="$2"; shift; shift ;;
#-t | --transcript-file )TRANSCRIPT_ANNOTATION_FILE="$2"; shift; shift ;;
#-i | --interaction-file )HI_C_FILE="$2"; shift; shift ;;

print "INPUT_FILE: ",INPUT_FILE
print "TSS_EXT: ",TSS_EXT
print "QUERY_AC: ",QUERY_AC
print "GENE_ANNOTATION_FILE: ",GENE_ANNOTATION_FILE
print "TRANSCRIPT_ANNOTATION_FILE: ",TRANSCRIPT_ANNOTATION_FILE
print "HI_C_FILE: ",HI_C_FILE

# ./project.sh $INPUT_FILE $QUERY_AC $TSS_EXT $GENE_ANNOTATION_FILE $TRANSCRIPT_ANNOTATION_FILE $HI_C_FILE

import subprocess

subprocess.check_call(['./project.sh', INPUT_FILE, QUERY_AC, TSS_EXT, GENE_ANNOTATION_FILE, TRANSCRIPT_ANNOTATION_FILE, HI_C_FILE])