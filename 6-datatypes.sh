#!/bin/bash

set -euo pipefail

echo "print time and date"

TIMEDATE=$(date)
echo "current date and time is :: $TIMEDATE"

# ensure these are treated as integers
declare -i Number1=10
declare -i Number2=20

# perform arithmetic in a POSIX-friendly, bash-safe way
sum_of_numbers=$((Number1+Number2))
echo "sum of numbers is :: $sum_of_numbers"