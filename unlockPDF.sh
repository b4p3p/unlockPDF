#!/bin/bash

if [ -z "$1" ] && [ -z "$2" ]; then
  echo "usage: unlock.sh <PDFfile> <Password>"
  exit
fi

PDFFILE=$1
PSW=$2

for f in $(find -name "$1"); do
  pdftops -upw $PSW $f output.ps &
  wait
  mv $f $f".bak"
  
  pstopdf output.ps &
  wait
  mv output.pdf $f
  rm output.ps
done


