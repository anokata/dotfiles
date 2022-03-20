echo off
for %%f in (*.flac) do (
    echo %%~f
    flac2mp3 "%%~f"
)