transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vmap -link {C:/Users/Zack/labone/mainproject/VivadoProjects/finalDesign/finalDesign.cache/compile_simlib/activehdl}
vlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 -l xil_defaultlib \
"../../../../finalDesign.gen/sources_1/ip/xadc_wiz_0/xadc_wiz_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

