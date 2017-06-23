#!/bin/bash
#
#$ -cwd
#$ -S /bin/bash
#
set -o nounset -o pipefail -o errexit
# set -o xtrace

# Suppose you're in the /behst folder. 

# Now let's download the /data/ folder
wget -r -l1 --no-parent -nH --cut-dirs=2 -e robots=off https://www.pmgenomics.ca/hoffmanlab/proj/behst/data/

# Let's also create the /results/ and /temp/ folder that BEHST needs

`mkdir results`

`mkdir temp`