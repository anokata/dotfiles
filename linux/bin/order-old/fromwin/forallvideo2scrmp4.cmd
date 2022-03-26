echo off
for %%f in (*.mkv) do (
    echo %%~nf
    video2scr1sec "%%~nf.mkv"
)