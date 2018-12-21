transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Aluno/Downloads/new-20180817T162303Z-001/new/Parte\ I/Quartus {C:/Users/Aluno/Downloads/new-20180817T162303Z-001/new/Parte I/Quartus/RAMlpm.v}
vlog -vlog01compat -work work +incdir+C:/Users/Aluno/Downloads/new-20180817T162303Z-001/new/Parte\ I/Quartus {C:/Users/Aluno/Downloads/new-20180817T162303Z-001/new/Parte I/Quartus/TP1_parteI.v}

