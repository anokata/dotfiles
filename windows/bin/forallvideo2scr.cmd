echo off
for %%f in (*.*4) do (
    echo %%~f
    video2scr1sec "%%~f"
)