#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom fsm.vhd fsm_tb.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -voptargs="+acc" -t ns work.fsm_tb

#Mosta forma de onda
view wave

#Adiciona ondas específicas
add wave -radix binary  /t
add wave -radix uns  /j
add wave -radix binary  /led
add wave -radix binary  /motor
add wave -radix binary  /fan
add wave /dut/state



#Simula até um 100000ns
run 100

wave zoomfull
write wave wave.ps