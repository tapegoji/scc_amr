#!/bin/bash
rm results/* -rf
mkdir results

# Check if the first argument is "parallel"
if [ "$1" == "-parallel" ]; then
    # Run ElmerGrid with partitioning and parallel options
    echo "Running ElmerSolver in parallel mode"
    # if -case is given then use it, otherwise use the default case.sif
    if [ "$2" == "-case" ]; then
        mpirun -np 6 --oversubscribe ElmerSolver_mpi $3
    else
        mpirun -np 6 --oversubscribe ElmerSolver_mpi case.sif
    fi
else
    # Run ElmerGrid with the default serial option
    echo "Running ElmerSolver in serial mode"
    if [ "$1" == "-case" ]; then
        ElmerSolver $2
    else
        ElmerSolver case.sif
    fi
fi

# Run Paraview in the background
paraview &
