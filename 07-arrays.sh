#!/bin/bash
echo "printing the names using arrays concept"

Names=("sreekanth" "varsha" "amma" "nanna" "thambi")

echo "First name is :: ${Names[0]}"
echo "Second name is :: ${Names[1]}"
echo "Third name is :: ${Names[2]}"
echo "Fourth name is :: ${Names[3]}"
echo "Fifth name is :: ${Names[4]}"
echo "All names are :: ${Names[%*]}"