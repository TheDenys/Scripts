@rem feed to command line step by step because it loads CPU a lot (all cores, it's not single threaded)
@rem regexp to spit the command line for convert
@rem c:\\PortablePrograms\\vlc\\vlc.exe d:\\PHOTO_UP\\$1\.$2 --sout-transcode-vfilter rotate --rotate-angle 270 --sout "#transcode{vcodec=h264}:duplicate{dst=std{access=file,mux=ts,dst=d:\\PHOTO_UP\\$1_conv\.$2}}"
@rem sample
c:\PortablePrograms\vlc\vlc.exe d:\file.mp4 --sout-transcode-vfilter rotate --rotate-angle 270 --sout "#transcode{vcodec=h264}:duplicate{dst=std{access=file,mux=ts,dst=d:\file_conv.mp4}}"
