#!/bin/bash
#rsync -r /Volumes/GoogleDrive-118292251643994314192/My\ Drive/Notability/M227C/ ~/git/pub/Math227C/LectureNotes
rsync -r "/Users/jun/jallard@uci.edu - Google Drive/My Drive/Notability/M227C23sp/" ~/git/pub/Math227C/LectureNotes
cd ~/git/pub/Math227C/LectureNotes;
rm Icon*;
cd ../
git add .
git commit -m 'After lecture, sync hand notes'
