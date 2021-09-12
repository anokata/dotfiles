echo off
for %%f in (*.mp4) do (
    audio_extract "%%~f"
)