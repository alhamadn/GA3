#!/bin/bash
set -euo pipefail

# Based on class w7a,we can call multiqc container like this 
CONTAINER=oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20

# Now our input and output directories a- will be input and b- will be output
a="$1"
b="$2"

# Based on the help command, it state we have to use multiqc then options. I actually accidently ran it in terminal in Q9 already. so i will try to redo it here with the same arguments
apptainer exec "$CONTAINER" multiqc "$a" --outdir "$b" 

# Optional part of the Q is to write echo statements. I like that one that did date and one another did "done or ran successfully" so i will do them both 
echo "successfully ran the script" 
date 