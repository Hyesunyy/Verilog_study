
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/utils_1/imports/synth_1/watch_counter.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2u
sC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/utils_1/imports/synth_1/watch_counter.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
i
Command: %s
53*	vivadotcl28
6synth_design -top stopwatch_top -part xc7z007sclg400-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
{
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2

xc7z007sZ17-347h px� 
k
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2

xc7z007sZ17-349h px� 
E
Loading part %s157*device2
xc7z007sclg400-1Z21-403h px� 
[
$Part: %s does not have CEAM library.966*device2
xc7z007sclg400-1Z21-9227h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
12080Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:01 ; elapsed = 00:00:03 . Memory (MB): peak = 1359.730 ; gain = 447.773
h px� 
�
@concatenation with an unsized literal will be treated as 32 bits6865*oasys2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/watch_control.v2
708@Z8-10604h px� 
�
@concatenation with an unsized literal will be treated as 32 bits6865*oasys2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/watch_control.v2
708@Z8-10604h px� 
�
@concatenation with an unsized literal will be treated as 32 bits6865*oasys2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/watch_control.v2
718@Z8-10604h px� 
�
synthesizing module '%s'%s4497*oasys2
stopwatch_top2
 2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/stopwatch_top.v2
238@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

pulse_10ms2
 2h
dC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/pulse_10ms.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

pulse_10ms2
 2
02
12h
dC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/pulse_10ms.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
watch_counter2
 2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/watch_counter.v2
238@Z8-6157h px� 
�
evariable '%s' is written by both blocking and non-blocking assignments, entire logic could be removed4426*oasys2	
sec_cnt2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/watch_counter.v2
428@Z8-6090h px� 
�
evariable '%s' is written by both blocking and non-blocking assignments, entire logic could be removed4426*oasys2	
sec_cnt2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/watch_counter.v2
438@Z8-6090h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
watch_counter2
 2
02
12k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/watch_counter.v2
238@Z8-6155h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2

pls_10ms2
watch_counter2
uut_wcounter2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/stopwatch_top.v2
458@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
uut_wcounter2
watch_counter2
62
52k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/stopwatch_top.v2
458@Z8-7023h px� 
�
synthesizing module '%s'%s4497*oasys2
watch_control2
 2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/watch_control.v2
238@Z8-6157h px� 
�
-case statement is not full and has no default155*oasys2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/watch_control.v2
788@Z8-155h px� 
�
8referenced signal '%s' should be on the sensitivity list567*oasys2
	BTN0_mode2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/watch_control.v2
778@Z8-567h px� 
�
8referenced signal '%s' should be on the sensitivity list567*oasys2

BTN0_cnt2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/watch_control.v2
778@Z8-567h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
watch_control2
 2
02
12k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/watch_control.v2
238@Z8-6155h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
RST2
watch_control2

uut_wcntrl2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/stopwatch_top.v2
478@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2

uut_wcntrl2
watch_control2
102
92k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/stopwatch_top.v2
478@Z8-7023h px� 
�
Fall outputs are unconnected for this instance and logic may be removed3605*oasys2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/stopwatch_top.v2
498@Z8-4446h px� 
�
synthesizing module '%s'%s4497*oasys2	
hex2bcd2
 2e
aC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/display.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
hex2bcd2
 2
02
12e
aC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/display.v2
238@Z8-6155h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
82
hex2
72	
hex2bcd2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/stopwatch_top.v2
498@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
BCD2	
hex2bcd2	
uut_h2b2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/stopwatch_top.v2
498@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2	
uut_h2b2	
hex2bcd2
42
32k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/stopwatch_top.v2
498@Z8-7023h px� 
�
synthesizing module '%s'%s4497*oasys2
my_disp_mod2
 2c
_C:/Users/user/source/repos/Verilog_lab/my_disp_mod/my_disp_mod.srcs/sources_1/new/my_disp_mod.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
my_disp_mod2
 2
02
12c
_C:/Users/user/source/repos/Verilog_lab/my_disp_mod/my_disp_mod.srcs/sources_1/new/my_disp_mod.v2
238@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
stopwatch_top2
 2
02
12k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/stopwatch_top.v2
238@Z8-6155h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
RST2
watch_controlZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
clk2
watch_counterZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:01 ; elapsed = 00:00:04 . Memory (MB): peak = 1470.500 ; gain = 558.543
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:02 ; elapsed = 00:00:04 . Memory (MB): peak = 1470.500 ; gain = 558.543
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:02 ; elapsed = 00:00:04 . Memory (MB): peak = 1470.500 ; gain = 558.543
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1470.5002
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2i
eC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/constrs_1/new/stopwatch.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2i
eC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/constrs_1/new/stopwatch.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2g
eC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/constrs_1/new/stopwatch.xdc2!
.Xil/stopwatch_top_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1503.3202
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0012

1503.3202
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:03 ; elapsed = 00:00:08 . Memory (MB): peak = 1503.320 ; gain = 591.363
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Loading part: xc7z007sclg400-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:03 ; elapsed = 00:00:08 . Memory (MB): peak = 1503.320 ; gain = 591.363
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:03 ; elapsed = 00:00:08 . Memory (MB): peak = 1503.320 ; gain = 591.363
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
!inferring latch for variable '%s'327*oasys2
curr_state_reg2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/watch_control.v2
788@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
disp_mode_reg2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/watch_control.v2
708@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
next_state_reg2k
gC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.srcs/sources_1/new/watch_control.v2
848@Z8-327h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:03 ; elapsed = 00:00:08 . Memory (MB): peak = 1503.320 ; gain = 591.363
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   21 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    7 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    6 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit       Adders := 2     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               21 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                7 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                6 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                2 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 8     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   4 Input    7 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    7 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    6 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   6 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 13    
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 3     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
p
%s
*synth2X
VPart Resources:
DSPs: 66 (col length:40)
BRAMs: 100 (col length: RAMB18 40 RAMB36 20)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:04 ; elapsed = 00:00:10 . Memory (MB): peak = 1503.320 ; gain = 591.363
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:05 ; elapsed = 00:00:13 . Memory (MB): peak = 1503.320 ; gain = 591.363
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:05 ; elapsed = 00:00:13 . Memory (MB): peak = 1503.320 ; gain = 591.363
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
uut_wcntrl/curr_state_reg[1]2
stopwatch_topZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
uut_wcntrl/curr_state_reg[0]2
stopwatch_topZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
uut_wcntrl/disp_mode_reg2
stopwatch_topZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
uut_wcntrl/next_state_reg[1]2
stopwatch_topZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
uut_wcntrl/next_state_reg[0]2
stopwatch_topZ8-3332h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:05 ; elapsed = 00:00:13 . Memory (MB): peak = 1503.320 ; gain = 591.363
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:06 ; elapsed = 00:00:16 . Memory (MB): peak = 1503.320 ; gain = 591.363
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:06 ; elapsed = 00:00:16 . Memory (MB): peak = 1503.320 ; gain = 591.363
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:06 ; elapsed = 00:00:16 . Memory (MB): peak = 1503.320 ; gain = 591.363
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:06 ; elapsed = 00:00:16 . Memory (MB): peak = 1503.320 ; gain = 591.363
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:06 ; elapsed = 00:00:16 . Memory (MB): peak = 1503.320 ; gain = 591.363
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:06 ; elapsed = 00:00:16 . Memory (MB): peak = 1503.320 ; gain = 591.363
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|      |Cell   |Count |
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|1     |BUFG   |     1|
h px� 
2
%s*synth2
|2     |CARRY4 |     5|
h px� 
2
%s*synth2
|3     |LUT1   |     3|
h px� 
2
%s*synth2
|4     |LUT3   |     1|
h px� 
2
%s*synth2
|5     |LUT4   |     3|
h px� 
2
%s*synth2
|6     |LUT5   |     1|
h px� 
2
%s*synth2
|7     |LUT6   |     2|
h px� 
2
%s*synth2
|8     |FDRE   |    24|
h px� 
2
%s*synth2
|9     |IBUF   |     1|
h px� 
2
%s*synth2
|10    |OBUF   |    16|
h px� 
2
%s*synth2
+------+-------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:06 ; elapsed = 00:00:16 . Memory (MB): peak = 1503.320 ; gain = 591.363
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 0 critical warnings and 9 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:04 ; elapsed = 00:00:15 . Memory (MB): peak = 1503.320 ; gain = 558.543
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:06 ; elapsed = 00:00:16 . Memory (MB): peak = 1503.320 ; gain = 591.363
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1503.3202
0.000Z17-268h px� 
S
-Analyzing %s Unisim elements for replacement
17*netlist2
5Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1503.3202
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

9366f789Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
352
262
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:082

00:00:192

1503.3202	
994.758Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002

00:00:002

1503.3202
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2e
cC:/Users/user/source/repos/Verilog_lab/StopWatch_0219/StopWatch_0219.runs/synth_1/stopwatch_top.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2e
creport_utilization -file stopwatch_top_utilization_synth.rpt -pb stopwatch_top_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Thu Feb 20 20:18:11 2025Z17-206h px� 


End Record