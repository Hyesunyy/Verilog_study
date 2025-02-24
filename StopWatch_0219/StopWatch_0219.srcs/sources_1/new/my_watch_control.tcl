restart
add_force CLK {0 0ns} {1 4ns} -repeat_every 8ns

add_force BTN0 0
add_force BTN1 0

run 20ms

add_force BTN0 1

run 20ms

add_force BTN0 1

run 20ms