#!/usr/bin/env zsh

file=$1

case $(file --brief --dereference --mime-type "$file") in
	inode/x-empty)
		echo 'inode/x-empty files cannot be previewed'
		;;
	application/octet-stream*)
		echo 'application/octet-stream files cannot be previewed'
		;;
	application/x*-binary*)
		echo 'application/x*-binary* files cannot be previewed'
		;;
	application/vnd.openxmlformats-officedocument.*)
		echo 'OpenXML office document formats cannot be previewed'
		;;
	application/gzip|application/x-tar*|application/x-compressed-tar*|application/x-*-compressed-tar*)
		tar -tvf "$file"
		;;
	application/zip*)
		unzip -l "$file"
		;;
	inode/directory)
		tree -CalFN "$file" | head -200
		;;
	image/*)
		wezterm imgcat --no-resample --tmux-passthru=detect --height="${FZF_PREVIEW_LINES:-auto}" --width="${FZF_PREVIEW_COLUMNS:-auto}" "$file"
		;;
	*)
		bat --color=always --paging=never --style=changes,numbers "$file"
		;;
esac
