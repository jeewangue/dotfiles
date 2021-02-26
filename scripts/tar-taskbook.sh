#! /bin/bash
tar cvzf - taskbook | gpg -aesr jeewangue@gmail.com > taskbook.tar.gz.asc
