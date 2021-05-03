#!/bin/bash

set -e
set -x

checkins=(2021-4)
checkin_dir=./
public_dir=./public
checkin_file=$public_dir/index.md

mkdir -p $public_dir
echo -e "# Checkin Lists\n" > $checkin_file

for checkin in ${checkins[@]}; do
	slots=$(cat $checkin)
	all=$(ls | grep $checkin- | sed 's/2021-4-//g')
	echo -e "## $checkin\n" >> $checkin_file

	echo -e "### Full lists\n" >> $checkin_file
	unset in
	unset notin
	for slot in $slots; do
		if [[ -f $checkin-$slot &&
		-r $checkin-$slot &&
		-w $checkin-$slot &&
		! -x $checkin-$slot ]]; then
			in=(${in[@]} $slot)
			echo -e "- [x] $slot" >> $checkin_file
		else
			notin=(${notin[@]} $slot)
			echo -e "- [ ] $slot" >> $checkin_file
		fi
	done
	echo "" >> $checkin_file

	echo -e "### Checked in\n" >> $checkin_file
	for i in ${in[@]}; do
		echo "- [x] $i" >> $checkin_file
	done
	echo "" >> $checkin_file

	echo -e "### NOT Checked in\n" >> $checkin_file
	for n in ${notin[@]}; do
		echo "- [ ] $n" >> $checkin_file
	done
	echo "" >> $checkin_file

	echo -e "### 友情客串\n" >> $checkin_file
	for a in $all; do
		if [ "x$(echo ${in[@]}|grep $a)" = "x" ]; then
			echo "- $a" >> $checkin_file
		fi
	done
	echo "" >> $checkin_file
done

echo "theme: jekyll-theme-leap-day" > $public_dir/_config.yml
