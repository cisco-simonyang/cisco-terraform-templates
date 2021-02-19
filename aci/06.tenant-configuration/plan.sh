#!/bin/bash

if [ $# -eq 0 ]
then
    echo "No arguments supplied"
else
    terraform plan -var-file=$1.tfvars -state=$1.tfstate
fi