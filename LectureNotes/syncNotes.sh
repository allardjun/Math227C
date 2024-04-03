#!/bin/bash
GDRIVELOCATION="jallard@uci.edu - Google Drive/My Drive/Notability/M227-24sp"

echo $GDRIVELOCATION
echo "/Users/jun/"$GDRIVELOCATION
#rsync -r "/Users/jun/"$GDRIVELOCATION ~/git/pub/Math227C/LectureNotes
cd ~/git/pub/Math227C/LectureNotes;
rm Icon*;
cd ../
git add .
git commit -m 'After lecture, sync hand notes'
git push

