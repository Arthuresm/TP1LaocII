transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Aluno/Downloads/Implementa��o_FINAL {C:/Users/Aluno/Downloads/Implementa��o_FINAL/parte3.v}
vlog -vlog01compat -work work +incdir+C:/Users/Aluno/Downloads/Implementa��o_FINAL {C:/Users/Aluno/Downloads/Implementa��o_FINAL/cache_ass_conj.v}

