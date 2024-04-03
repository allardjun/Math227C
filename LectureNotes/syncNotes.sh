#!/bin/bash
GDRIVELOCATION="jallard@uci.edu - Google Drive/My Drive/Notability/M227-24sp"
rsync -r "/Users/jun/"$GRIVELOCATION ~/git/pub/Math227C/LectureNotes
cd ~/git/pub/Math227C/LectureNotes;
rm Icon*;
cd ../
git add .
git commit -m 'After lecture, sync hand notes'
git push

