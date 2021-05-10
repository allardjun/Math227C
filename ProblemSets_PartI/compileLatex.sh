#!/bin/bash
cd ProblemSets_PartI;
for i in *.tex;
  do pdflatex $i;
done
