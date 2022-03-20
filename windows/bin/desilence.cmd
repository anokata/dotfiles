REM ffmpeg -hide_banner -i 2021-11-18_14-43-02.mkv -af silenceremove=1:0:-30dB 2021-11-18_14-43-02_out.mkv
REM silenceremove=0:0:0:-1:5:-25dB
REM =window=0.02:detection=peak:stop_mode=all:start_mode=all:stop_periods=-1:stop_threshold=0.05:stop_duration=3:start_threshold=0.05
ffmpeg -hide_banner -i 2021-11-18_14-43-02.mkv -af silenceremove=window=0.02:detection=peak:stop_mode=all:start_mode=all:stop_periods=-1:stop_threshold=0.05:stop_duration=3:start_threshold=0.05 2021-11-18_14-43-02_out.mp3
