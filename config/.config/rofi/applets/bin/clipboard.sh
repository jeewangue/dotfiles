#!/usr/bin/env bash
#
# Rofi frontend for GPaste.
# Dependencies:
#   rofi, gpaste, xsel, xdotool, xprop, awk, sed, coreutils

source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Key bindings
Kb_Clear='Alt+c'
Kb_Toggle='Alt+p'
Kb_Delete='Alt+d'
Kb_Edit='Alt+e'
Kb_Archive='Alt+s'
Kb_Hist='Alt+h'
Kb_Paste='Alt+Return'
Kb_QR='Alt+q'
Kb_Backup='Alt+B'
Kb_Switch_Main='Alt+1'
Kb_Switch_Archive='Alt+2'
Kb_LaunchGUI='F1'

# Theme Elements
list_col='1'
list_row='20'
win_width='60%'

# Rofi command
_rofi() {
	rofi -format 'i:s' -theme-str "window {width: $win_width;}" \
		-theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: "";}' \
		-theme-str 'inputbar { children: [textbox-prompt-colon, prompt, entry]; }' \
		-dmenu -i \
		-markup-rows \
		-theme ${theme}
}

Script=${0##*/}

usage() {
	while read -r Usage; do
		printf '%b\n' "$Usage"
	done <<-EOF
		Usage: $Script [OPT]
		\r  -c, --clear        - Clear history
		\r  -H, --histories    - Histories menu
		\r  -i, --input        - Read stdin into clipboard
		\r  -p, --paste [1-9]  - Paste clipboard item by index
		\r  -s, --selpaste     - Paste selection
		\r  -S, --seltoclip    - Move selection to clipboard
		\r  -t, --toggle       - Toggle tracking clipboard changes
		\r  -h, --help         - Displays this help information
		\r  *                  - Pass option(s) to \`gpaste-client\`
		\r If no option is given, rofi menu is displayed.
		\r  Rofi shortcuts:
		\r    - Clear history                 - $Kb_Clear
		\r    - Toggle tracking changes       - $Kb_Toggle
		\r    - Delete selected item          - $Kb_Delete
		\r    - Edit selected item            - $Kb_Edit
		\r    - Archive selected item         - $Kb_Archive
		\r    - Backup current history        - $Kb_Backup
		\r    - List and switch histories     - $Kb_Hist
		\r    - Paste selected item           - $Kb_Paste
		\r    - Display QR code               - $Kb_QR
		\r    - Switch to main clipboard      - $Kb_Switch_Main
		\r    - Switch to clipboard archive   - $Kb_Switch_Archive
		\r    - Launch GPaste GUI             - $Kb_LaunchGUI
		\r    - Activate selected item OR
		\r      add user input to clipboard   - Return
		\r
		\r    Histories menu
		\r      - Delete selected history     - $Kb_Delete
		\r      - Return to active history    - $Kb_Hist
		\r      - Switch to history OR
		\r        create new one with input   - Return
	EOF
}

# Start the daemon if it's not running
pidof -q gpaste-daemon || setsid -f gpaste-client daemon >/dev/null 2>&1

print_history() {
	gpaste-client --oneline |
		while read -r Item; do
			# remove uuid's
			printf '%s\n' "${Item#* }"
		done | sed 's/^[ \t]*//' # Hide leading whitespace
}

print_item() {
	gpaste-client --use-index get "$1" |
		# Remove blank lines from the beginning/end
		sed -e '/./,$!d' -e :a -e '/^\n*$/{$d;N;ba' -e '}'
}

select_item() { gpaste-client --use-index select "$1" ;}
delete_item() { gpaste-client --use-index delete "$1" ;}

edit_item() {
	TmpFile=$(mktemp "/tmp/$Script.XXXX")
	print_item "$1" > "$TmpFile"

	gpaste-client stop # Stop tracking to prevent index from shifting

	# Check if we need a terminal window
	if [ -t 2 ]; then
		$EDITOR "$TmpFile"
	else
		$TERMINAL -e "$EDITOR" "$TmpFile" >/dev/null 2>&1
	fi

	gpaste-client start

	if [ -z "$(sed 's/^[ \t]*//' "$TmpFile")" ]; then
		delete_item "$1"
	else
		gpaste-client --use-index replace "$1" "$(cat "$TmpFile")"
	fi
	rm -f "$TmpFile"
}

archive_item() {
	[ "$HistName" = archive ] && return

	Item=$(print_item "$1")
	gpaste-client switch-history archive
	gpaste-client add "$Item"
	gpaste-client switch-history history
}

toggle_track() {
	Status=$(dconf read /org/gnome/GPaste/track-changes)

	if "$Status"; then
		gpaste-client stop
	else
		gpaste-client start
	fi
}

paste_clip() {
	AW=$(xdotool getactivewindow)
	AW=$(xprop -id "$AW" | awk -F\" '/WM_CLASS/{print tolower($4)}')
	sleep .5
	case $AW in
		alacritty|kitty|st*|gnome-terminal|konsole|xfce4-terminal|terminator)
			xdotool key --delay 0 --clearmodifiers Ctrl+Shift+v ;;
		*)
			xdotool key --delay 0 --clearmodifiers Ctrl+v ;;
	esac
}

paste_selection() {
	sleep .5
	xdotool type --delay 0 --clearmodifiers -- "$(xsel -o)"
}

qr_code() {
	TmpQR=$(mktemp --suffix=.png "/tmp/${Script}_qr.XXXX")
	print_item "$1" | qrencode -s 10 -d 300 -v 8 -l H -o "$TmpQR"

	xdg-open "$TmpQR" && rm -f "$TmpQR"
}

clear_history() {
	[ "$HistName" = archive ] &&
		Confirm=$(printf 'Yes\nNo' | _rofi -p "Clear $HistName?")

	[ ${Confirm:-0:Yes} = 0:Yes ] && { gpaste-client empty; xsel -c ;}
}

backup_history() {
	BackupName=${HistName}_$(date +%Y-%m-%d_%H-%M-%S)
	gpaste-client backup-history "$BackupName"
}

menu_histories() {
	HistSelected=$(
		gpaste-client list-histories | _rofi -p ' Histories' \
			-selected-row "${HistIndex:-0}" \
			-kb-custom-1 "$Kb_Delete" \
			-kb-custom-2 "$Kb_Hist"
	)
	Ret=$?
	Index=${HistSelected%%:*}
	HistSelected=${HistSelected#*:}

	case $Ret in
		10) gpaste-client delete-history "$HistSelected"; HistIndex=$Index exec "$0" -H ;;
		11) exec "$0" ;;
		0)  [ -n "$HistSelected" ] && gpaste-client switch-history "$HistSelected"; exec "$0" ;;
		*)  exit $Ret
	esac
}

menu() {
	HistName=$(gpaste-client get-history)

	Clip=$(
		print_history | _rofi -p " $HistName" \
			-selected-row "${Index:-0}" \
			-kb-custom-1 "$Kb_Clear" \
			-kb-custom-2 "$Kb_Toggle" \
			-kb-custom-3 "$Kb_Delete" \
			-kb-custom-4 "$Kb_Edit" \
			-kb-custom-5 "$Kb_Archive" \
			-kb-custom-6 "$Kb_Backup" \
			-kb-custom-7 "$Kb_Hist" \
			-kb-custom-8 "$Kb_Paste" \
			-kb-custom-9 "$Kb_QR" \
			-kb-custom-10 "$Kb_Switch_Main" \
			-kb-custom-11 "$Kb_Switch_Archive" \
			-kb-custom-12 "$Kb_LaunchGUI"
	)
	Ret=$?
	Index=${Clip%%:*}

	[ -z "$Index" ] && exit

	case $Ret in
		10) clear_history ;;
		11) toggle_track ;;
		12) delete_item "$Index"; Index=$Index exec "$0" ;;
		13) edit_item "$Index"; Index=$Index exec "$0" ;;
		14) archive_item "$Index"; Index=$Index exec "$0" ;;
		15) backup_history; Index=$Index exec "$0" ;;
		16) menu_histories ;;
		17) select_item "$Index"; paste_clip ;;
		18) qr_code "$Index" ;;
		19) gpaste-client switch-history history; exec "$0" ;;
		20) gpaste-client switch-history archive; exec "$0" ;;
		21) gpaste-client ui ;;
		0)  { [ "$Index" -lt 0 ] && printf '%s' "${Clip#*:}" | gpaste-client ;} || select_item "$Index" ;;
		*)  exit $Ret
	esac
}

case $1 in
	-c|--clear)
		clear_history ;;
	-H|--histories)
		menu_histories ;;
	-p|--paste)
		[ -z "$2" ] && { printf '%s\n' "Please provide an index [1-9]"; exit 1 ;}
		print_item $(($2-1)) | xsel; paste_selection ;;
	-s|--selpaste)
		paste_selection ;;
	-S|--seltoclip)
		xsel -o | gpaste-client ;;
	-t|--toggle)
		toggle_track ;;
	-i|--input)
		gpaste-client ;;
	-h|--help)
		usage ;;
	"")
		menu ;;
	*)
		gpaste-client "$@"
esac
