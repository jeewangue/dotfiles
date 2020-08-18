git_status()
{
	NC='\033[0m'
	RED='\033[0;31m'
	BLUE='\033[0;34m'
	GREEN='\033[0;32m'
	for d in `ls`; do
		echo $d
		j=0
		if [ -d $d/.git ];		then
			cd $d
			if [[ "$(git status | grep modified)" != "" ]];			then
				if [ $j -eq 0 ]
				then
					echo ""
					echo "Directory: $d "
					j=1
				fi
				echo ""
				m="$(git status | grep modified)"
				echo -e "$RED $m $NC"
			fi
			if [[ "$(git status | grep 'is ahead of')" != "" ]]
			then
				if [ $j -eq 0 ]
				then
					echo ""
					echo "Directory: $d "
					j=1
				fi
				n="$(git status | grep 'ahead of' | grep -oE '[0-9]+')"
				echo -e "\t$BLUE `git branch | grep \* | awk '{ print $2 }'` $NC is $BLUE $n $NC commit(s) ahead of origin"
			fi
			if [[ "$(git ls-files --others --exclude-standard)" != "" ]]
			then
				if [ $j -eq 0 ]
				then
					echo ""
					echo "Directory: $d "
					j=1
				fi
				for f in `git ls-files --others --exclude-standard`; do
					echo -e "\t$GREEN untracked: $f $NC"
				done
			fi
			cd ..
		fi
	done
}

alias gstatus=git_status
