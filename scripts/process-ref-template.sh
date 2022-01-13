#!/bin/bash -e

echo "Updating markdown preprocessor"
npm install -g git+ssh://git@github.ibm.com:SqlServiceWdp/md-preprocess.git

echo "Processing template file"
( cd sqlref && md-preprocess md-preprocess.json sql_reference.template.md sql_reference.md ./diagrams/ )
