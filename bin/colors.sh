#!/bin/bash
# anonymous : http://unix.stackexchange.com/questions/269077/tput-setaf-color-table-how-to-determine-color-codes
# TODO: make a proper utility out of this

color(){
  for c; do
    printf '\e[48;5;%dm%03d' $c $c
  done
  printf '\e[0m \n'
}

IFS=$' \t\n'
color {0..15}
for ((i=0;i<6;i++)); do
  color $(seq $((i*36+16)) $((i*36+51)))
done
color {232..255}





mode2header(){
	#### For 16 Million colors use \e[0;38;2;R;G;Bm each RGB is {0..255}
	printf '\e[mR\n' # reset the colors.
	printf '\n\e[m%59s\n' "Some samples of colors for r;g;b. Each one may be 000..255"
	printf '\e[m%59s\n'   "for the ansi option: \e[0;38;2;r;g;bm or \e[0;48;2;r;g;bm :"
}
mode2colors(){
	# foreground or background (only 3 or 4 are accepted)
  local fb="$1"
	[[ $fb != 3 ]] && fb=4
	local samples=(0 63 127 191 255)
	for r in "${samples[@]}"; do
		for g in "${samples[@]}"; do
			for b in "${samples[@]}"; do
				printf '\e[0;%s8;2;%s;%s;%sm%03d;%03d;%03d ' "$fb" "$r" "$g" "$b" "$r" "$g" "$b"
			done; printf '\e[m\n'
		done; printf '\e[m'
	done; printf '\e[mReset\n'
}
mode2header
mode2colors 3
mode2colors 4






tohex(){
    dec=$(($1%256))   ### input must be a number in range 0-255.
    if [ "$dec" -lt "16" ]; then
        bas=$(( dec%16 ))
        mul=128
        [ "$bas" -eq "7" ] && mul=192
        [ "$bas" -eq "8" ] && bas=7
        [ "$bas" -gt "8" ] && mul=255
        a="$((  (bas&1)    *mul ))"
        b="$(( ((bas&2)>>1)*mul ))" 
        c="$(( ((bas&4)>>2)*mul ))"
        printf 'dec= %3s basic= #%02x%02x%02x\n' "$dec" "$a" "$b" "$c"
    elif [ "$dec" -gt 15 ] && [ "$dec" -lt 232 ]; then
        b=$(( (dec-16)%6  )); b=$(( b==0?0: b*40 + 55 ))
        g=$(( (dec-16)/6%6)); g=$(( g==0?0: g*40 + 55 ))
        r=$(( (dec-16)/36 )); r=$(( r==0?0: r*40 + 55 ))
        printf 'dec= %3s color= #%02x%02x%02x\n' "$dec" "$r" "$g" "$b"
    else
        gray=$(( (dec-232)*10+8 ))
        printf 'dec= %3s  gray= #%02x%02x%02x\n' "$dec" "$gray" "$gray" "$gray"
    fi
}

for i in $(seq 0 255); do
    tohex ${i}
done
