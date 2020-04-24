#!/bin/bash
rsync -r ~/Google\ Drive/Math227C_2020Spring/Math227c ~/github/Math227C/LectureNotes
cd ~/github/Math227C/LectureNotes/Math227c;
rm Icon*;
git add .
git commit -m 'After lecture hand notes'
