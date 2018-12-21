view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 10000 -range 4 0 -starttime 0ps -endtime 1000ps sim:/TP1_parteI/address 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 10001 -range 4 0 -starttime 100ps -endtime 200ps Edit:/TP1_parteI/address 
wave modify -driver freeze -pattern constant -value 10010 -range 4 0 -starttime 200ps -endtime 300ps Edit:/TP1_parteI/address 
wave modify -driver freeze -pattern constant -value 10001 -range 4 0 -starttime 400ps -endtime 500ps Edit:/TP1_parteI/address 
wave modify -driver freeze -pattern constant -value 10010 -range 4 0 -starttime 500ps -endtime 600ps Edit:/TP1_parteI/address 
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/TP1_parteI/clock 
wave modify -driver freeze -pattern constant -value 10000 -range 4 0 -starttime 200ps -endtime 300ps Edit:/TP1_parteI/address 
wave modify -driver freeze -pattern constant -value 10001 -range 4 0 -starttime 300ps -endtime 400ps Edit:/TP1_parteI/address 
wave create -driver freeze -pattern clock -initialvalue 1 -period 400ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/TP1_parteI/wren 
wave modify -driver freeze -pattern constant -value 10000 -range 4 0 -starttime 400ps -endtime 500ps Edit:/TP1_parteI/address 
wave modify -driver freeze -pattern constant -value 10001 -range 4 0 -starttime 500ps -endtime 600ps Edit:/TP1_parteI/address 
wave modify -driver freeze -pattern constant -value 10001 -range 4 0 -starttime 700ps -endtime 800ps Edit:/TP1_parteI/address 
wave create -driver freeze -pattern constant -value 00000000 -range 7 0 -starttime 0ps -endtime 1000ps sim:/TP1_parteI/data 
WaveExpandAll -1
wave modify -driver freeze -pattern counter -startvalue 0 -endvalue 1000 -type Range -direction Up -period 50ps -step 1 -repeat forever -starttime 0ps -endtime 1000ps Edit:/TP1_parteI/wren 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 400ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/TP1_parteI/wren 
wave modify -driver freeze -pattern counter -startvalue 00000001 -endvalue 00001000 -type Range -direction Up -period 50ps -step 1 -repeat forever -range 7 0 -starttime 0ps -endtime 1000ps Edit:/TP1_parteI/data 
wave modify -driver freeze -pattern counter -startvalue 00000001 -endvalue 00001000 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 7 0 -starttime 0ps -endtime 1000ps Edit:/TP1_parteI/data 
WaveCollapseAll -1
wave clipboard restore
