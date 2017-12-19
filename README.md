# OCaml Pluggable Audio Manipulation Framework

This is a fun OCaml toy for playing with audio output.  The intent of 
it is to be a pluggable, monadic thing that allows for easy hookup
of audio processing routines with MP3 files as input and direct output
to the default audio device as output.  That said, what it basically 
is consists of an external interface to `libmpg123` and `libao` with
some monadic glue to facilitate the sort of messing around that is 
clearly the intent.

