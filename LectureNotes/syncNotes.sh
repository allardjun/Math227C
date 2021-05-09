#!/bin/bash
rsync -r ~/Google\ Drive/Notability/Math227c21Sp/ ~/github/Math227C/LectureNotes
cd ~/github/Math227C/LectureNotes;
rm Icon*;
cd ../
git add .
git commit -m 'After lecture, sync hand notes'
