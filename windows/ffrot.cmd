mkdir out
ffmpeg -i %1 -vf "transpose=2"  -filter:v "setpts=1.3*PTS" out/%1