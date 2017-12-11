#!/bin/bash

set -e
set -u

temp_dir="frames"
frames_dir="${temp_dir}/frames"
strips_dir="${temp_dir}/strips"
width="1"

mkdir -p "$frames_dir"
mkdir -p "$strips_dir"

ffmpeg -i "$1" "$frames_dir/frame-%06d.png"
mogrify -path "$strips_dir" -crop "${width}x+0+0" -gravity center "$frames_dir"/*.png
convert "$strips_dir"/*.png +append output.png
