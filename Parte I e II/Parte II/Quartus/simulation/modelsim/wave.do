onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TP1_Parte_II/address
add wave -noupdate /TP1_Parte_II/clock
add wave -noupdate /TP1_Parte_II/wren
add wave -noupdate /TP1_Parte_II/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1 ns}
view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 10000 -range 4 0 -starttime 0ps -endtime 1000ps sim:/TP1_parteI/address 
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/TP1_parteI/clock 
wave create -driver freeze -pattern clock -initialvalue 1 -period 400ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/TP1_parteI/wren 
wave create -driver freeze -pattern constant -value 00000000 -range 7 0 -starttime 0ps -endtime 1000ps sim:/TP1_parteI/data 
wave create -driver freeze -pattern constant -value 10000 -range 4 0 -starttime 0ps -endtime 600ps sim:/TP1_Parte_II/address 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 00101 -range 4 0 -starttime 100ps -endtime 200ps Edit:/TP1_Parte_II/address 
wave modify -driver freeze -pattern constant -value 00101 -range 4 0 -starttime 300ps -endtime 400ps Edit:/TP1_Parte_II/address 
wave modify -driver freeze -pattern constant -value 00101 -range 4 0 -starttime 500ps -endtime 600ps Edit:/TP1_Parte_II/address 
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 600ps sim:/TP1_Parte_II/clock 
wave create -driver freeze -pattern clock -initialvalue 0 -period 400ps -dutycycle 50 -starttime 0ps -endtime 600ps sim:/TP1_Parte_II/wren 
wave create -driver freeze -pattern constant -value 00000000 -range 7 0 -starttime 0ps -endtime 600ps sim:/TP1_Parte_II/data 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 00010010 -range 7 0 -starttime 200ps -endtime 300ps Edit:/TP1_Parte_II/data 
wave modify -driver freeze -pattern constant -value 00010100 -range 7 0 -starttime 300ps -endtime 400ps Edit:/TP1_Parte_II/data 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 600ps Edit:/TP1_Parte_II/clock 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 600ps Edit:/TP1_Parte_II/clock 
WaveCollapseAll -1
wave clipboard restore
