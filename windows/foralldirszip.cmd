echo off
for /D %%f in (*) do (
    echo %%~f
    C:\DWLD\zipanddel.py "%%~f"
)