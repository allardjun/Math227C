#!/bin/bash

# Get notes from notability using rclone (assumes Notability server completed its sync to Google Drive)
rclone copy jallard_uci_gdrive:Notability/M227C_25Sp ~/git/pub/Math227C/LectureNotes/.

# Send the notability notes to github
cd ~/git/pub/Math227C/LectureNotes;
git add .
git commit -m 'After lecture, sync hand notes'
git push

# Copy problem sets to Dropbox for rendering in case github.com browser render fails
rsync -r ~/git/pub/Math227C/ProblemSets_PartI "/Volumes/Carrot/Dropbox/science/teaching/M227CII/" 
