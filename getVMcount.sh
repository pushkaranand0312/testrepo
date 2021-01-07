#!/bin/bash

numbers=`ssh -oStrictHostKeyChecking=no -oBatchMode=yes $1 sudo virsh list --all | grep -v Id | grep -v ^$| wc -l`

if [ $numbers -ne 0 ]; then 
   numbers=$(($numbers - 1))
   echo "KVM :$1: $numbers"
else 
 number=`ssh -oStrictHostKeyChecking=no -oBatchMode=yes $1 sudo vzlist -a | grep -iv hostname | grep -v ^$| wc -l`
 echo "VZ :$1 :$number"
fi
###

#This is a test line added to check pull request,
