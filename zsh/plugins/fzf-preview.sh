file=$1

case $(file --brief --dereference --mime-type "$file") in
	application/x*-binary*|application/octet-stream*)
		echo "Binary files cannot be previewed"
		;;
	application/vnd.openxmlformats-officedocument.*)
		echo "OpenXML office document formats cannot be previewed"
		;;
	application/gzip|application/x-tar*|application/x-compressed-tar*|application/x-*-compressed-tar*)
		tar -tvf "$file"
		;;
	application/zip*)
		unzip -l "$file"
		;;
	inode/directory)
		tree -C "$file" | head -200
		;;
	image/*)
		wezterm imgcat --height=auto --width=auto "$file"
		;;
	*)
		bat --color=always --paging=never --style=changes,numbers "$file"
		;;
esac
