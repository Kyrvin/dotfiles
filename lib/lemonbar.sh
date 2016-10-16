#! /bin/bash
#
# Lemonbar formatting functions
#

# Set the foreground color of the text.
#   $1 The text to format
#   $2 The foreground color to use
lemonbar_fgcolor() {
	printf "%%{F%s}%s%%{F-}\n" "${2:--}" "$1"
}

# Set the background color of the text.
#   $1 The text to format
#   $2 The background color to use
lemonbar_bgcolor() {
	printf "%%{B%s}%s%%{B-}\n" "${2:--}" "$1"
}

# Set the underline color of the text.
#   $1 The text to format
#   $2 The underline color to use
lemonbar_ulcolor() {
	printf "%%{U%s}%s%%{U-}\n" "${2:--}" "$1"
}

# Set the foreground and background colors simultaneously
#   $1 The text to format
#   $2 The foreground color to use
#   $3 The background color to use
lemonbar_colors() {
	printf "%s\n" "$(lemonbar_fgcolor "$(lemonbar_bgcolor "$1" "$3")" "$2")"
}

# Swap the foreground and background colors for the text.
#   $1 The text to format
lemonbar_swap() {
	printf "%%{R}%s%%{R}\n" "$1"
}

# Offset the text by the given width.
#   $1 The text to format
#   $2 Width to offset by in pixels
lemonbar_offset() {
	printf "%%{O%d}%s\n" "${2:-0}" "$1"
}

# Select the font to render the text in.
#   $1 The text to format
#   $2 1-based font index to use
lemonbar_font() {
	printf "%%{T%d}%s%%{T-}\n" "${2:--}" "$1"
}

# Make the font clickable
#   $1 The text to format
#   $2 command to run
#   $3 mouse button to use (1 if omitted)
lemonbar_click() {
	printf "%%{A%d:%s:}%s%%{A}\n" "${3:-1}" "$2" "$1"
}

# Underline the text.
#   $1 The text to format
lemonbar_underline() {
	printf "%%{+u}%s%%{-u}\n" "$1"
}

# Overline the text.
#   $1 The text to format
lemonbar_overline() {
	printf "%%{+o}%s%%{-o}\n" "$1"
}
