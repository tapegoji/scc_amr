#!/bin/bash

# Check if the first argument is "parallel"
if [ "$1" == "-parallel" ]; then
    # Run ElmerGrid with partitioning and parallel options
    echo "Running ElmerGrid in parallel mode"
    ElmerGrid 14 2 case_orig.msh -partdual -metiskway 6 -autoclean -out case
else
    # Run ElmerGrid with the default serial option
    echo "Running ElmerGrid in serial mode"
    ElmerGrid 14 2 case_orig.msh -autoclean -out case
fi
