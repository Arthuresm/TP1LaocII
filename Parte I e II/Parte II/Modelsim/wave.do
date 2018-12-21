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
