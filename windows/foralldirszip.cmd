echo off
for /D %%f in (*) do (
    echo %%~f
    zipanddel.py "%%~f"
)