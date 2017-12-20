type mp3_handle = 
type ao_handle  = 
type size       = int
type frame_date = int list

external init: 
external load: mp3_handle -> size -> frame_data
external play: ao_handle -> size -> frame_data 
external kill: 
