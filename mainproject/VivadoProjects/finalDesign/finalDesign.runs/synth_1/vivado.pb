
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
create_project: 2default:default2
00:00:312default:default2
00:00:322default:default2
439.2152default:default2
164.3712default:defaultZ17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/Zack/labone/mainproject/VivadoProjects/finalDesign/finalDesign.srcs/utils_1/imports/synth_1/top.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2�
lC:/Users/Zack/labone/mainproject/VivadoProjects/finalDesign/finalDesign.srcs/utils_1/imports/synth_1/top.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
p
Command: %s
53*	vivadotcl2?
+synth_design -top top -part xc7a35tcpg236-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-349h px� 
V
Loading part %s157*device2#
xc7a35tcpg236-12default:defaultZ21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
`
#Helper process launched with PID %s4824*oasys2
196522default:defaultZ8-7075h px� 
�
%s*synth2�
yStarting RTL Elaboration : Time (s): cpu = 00:00:25 ; elapsed = 00:00:26 . Memory (MB): peak = 1265.105 ; gain = 411.172
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2
top2default:default2
 2default:default2v
`C:/Users/Zack/labone/mainproject/VivadoProjects/finalDesign/finalDesign.srcs/sources_1/new/top.v2default:default2
232default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
CLK_SYS2default:default2
 2default:default2J
4C:/Users/Zack/labone/mainproject/clkSystem/CLK_SYS.v2default:default2
292default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CLK_SYS2default:default2
 2default:default2
02default:default2
12default:default2J
4C:/Users/Zack/labone/mainproject/clkSystem/CLK_SYS.v2default:default2
292default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
drive2default:default2
 2default:default2J
4C:/Users/Zack/labone/mainproject/driveSystem/drive.v2default:default2
342default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
movement2default:default2
 2default:default2\
FC:/Users/Zack/labone/mainproject/driveSystem/movementSystem/movement.v2default:default2
402default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
movement2default:default2
 2default:default2
02default:default2
12default:default2\
FC:/Users/Zack/labone/mainproject/driveSystem/movementSystem/movement.v2default:default2
402default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2!
PWM_Generator2default:default2
 2default:default2`
JC:/Users/Zack/labone/mainproject/driveSystem/PWM_Generator/PWM_Generator.v2default:default2
292default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2 
TimerCounter2default:default2
 2default:default2`
JC:/Users/Zack/labone/mainproject/driveSystem/PWM_Generator/PWM_Generator.v2default:default2
512default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
TimerCounter2default:default2
 2default:default2
02default:default2
12default:default2`
JC:/Users/Zack/labone/mainproject/driveSystem/PWM_Generator/PWM_Generator.v2default:default2
512default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Comparex2default:default2
 2default:default2`
JC:/Users/Zack/labone/mainproject/driveSystem/PWM_Generator/PWM_Generator.v2default:default2
782default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Comparex2default:default2
 2default:default2
02default:default2
12default:default2`
JC:/Users/Zack/labone/mainproject/driveSystem/PWM_Generator/PWM_Generator.v2default:default2
782default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Outputx2default:default2
 2default:default2`
JC:/Users/Zack/labone/mainproject/driveSystem/PWM_Generator/PWM_Generator.v2default:default2
1042default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Outputx2default:default2
 2default:default2
02default:default2
12default:default2`
JC:/Users/Zack/labone/mainproject/driveSystem/PWM_Generator/PWM_Generator.v2default:default2
1042default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
PWM_Generator2default:default2
 2default:default2
02default:default2
12default:default2`
JC:/Users/Zack/labone/mainproject/driveSystem/PWM_Generator/PWM_Generator.v2default:default2
292default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
overcurrent2default:default2
 2default:default2\
FC:/Users/Zack/labone/mainproject/driveSystem/overcurrent/overcurrent.v2default:default2
332default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
overcurrent2default:default2
 2default:default2
02default:default2
12default:default2\
FC:/Users/Zack/labone/mainproject/driveSystem/overcurrent/overcurrent.v2default:default2
332default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
drive2default:default2
 2default:default2
02default:default2
12default:default2J
4C:/Users/Zack/labone/mainproject/driveSystem/drive.v2default:default2
342default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2!
stationSystem2default:default2
 2default:default2N
8C:/Users/Zack/labone/mainproject/stationSystem/station.v2default:default2
312default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
XADC_Module2default:default2
 2default:default2P
:C:/Users/Zack/labone/mainproject/stationSystem/XADC/XADC.v2default:default2
262default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

xadc_wiz_02default:default2
 2default:default2�
�C:/Users/Zack/labone/mainproject/VivadoProjects/finalDesign/finalDesign.runs/synth_1/.Xil/Vivado-20600-LAPTOP-K6G3ST0S/realtime/xadc_wiz_0_stub.v2default:default2
62default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

xadc_wiz_02default:default2
 2default:default2
02default:default2
12default:default2�
�C:/Users/Zack/labone/mainproject/VivadoProjects/finalDesign/finalDesign.runs/synth_1/.Xil/Vivado-20600-LAPTOP-K6G3ST0S/realtime/xadc_wiz_0_stub.v2default:default2
62default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
XADC_Module2default:default2
 2default:default2
02default:default2
12default:default2P
:C:/Users/Zack/labone/mainproject/stationSystem/XADC/XADC.v2default:default2
262default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

SSegDriver2default:default2
 2default:default2`
JC:/Users/Zack/labone/mainproject/stationSystem/7SegmentDriver/7SegDriver.v2default:default2
302default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

SSegDriver2default:default2
 2default:default2
02default:default2
12default:default2`
JC:/Users/Zack/labone/mainproject/stationSystem/7SegmentDriver/7SegDriver.v2default:default2
302default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2 
SSEG_Display2default:default2
 2default:default2b
LC:/Users/Zack/labone/mainproject/stationSystem/7SegmentDisplay/7SegDisplay.v2default:default2
262default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
digitDriver2default:default2
 2default:default2b
LC:/Users/Zack/labone/mainproject/stationSystem/7SegmentDisplay/7SegDisplay.v2default:default2
832default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
digitDriver2default:default2
 2default:default2
02default:default2
12default:default2b
LC:/Users/Zack/labone/mainproject/stationSystem/7SegmentDisplay/7SegDisplay.v2default:default2
832default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
SSEG_Display2default:default2
 2default:default2
02default:default2
12default:default2b
LC:/Users/Zack/labone/mainproject/stationSystem/7SegmentDisplay/7SegDisplay.v2default:default2
262default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2"
materialSystem2default:default2
 2default:default2d
NC:/Users/Zack/labone/mainproject/stationSystem/MaterialSystem/MaterialSystem.v2default:default2
282default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
materialSystem2default:default2
 2default:default2
02default:default2
12default:default2d
NC:/Users/Zack/labone/mainproject/stationSystem/MaterialSystem/MaterialSystem.v2default:default2
282default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
	WasherPWM2default:default2
 2default:default2Z
DC:/Users/Zack/labone/mainproject/stationSystem/WasherPWM/WasherPWM.v2default:default2
212default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
WasherTC2default:default2
 2default:default2Z
DC:/Users/Zack/labone/mainproject/stationSystem/WasherPWM/WasherPWM.v2default:default2
452default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
WasherTC2default:default2
 2default:default2
02default:default2
12default:default2Z
DC:/Users/Zack/labone/mainproject/stationSystem/WasherPWM/WasherPWM.v2default:default2
452default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
	WasherOut2default:default2
 2default:default2Z
DC:/Users/Zack/labone/mainproject/stationSystem/WasherPWM/WasherPWM.v2default:default2
602default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	WasherOut2default:default2
 2default:default2
02default:default2
12default:default2Z
DC:/Users/Zack/labone/mainproject/stationSystem/WasherPWM/WasherPWM.v2default:default2
602default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	WasherPWM2default:default2
 2default:default2
02default:default2
12default:default2Z
DC:/Users/Zack/labone/mainproject/stationSystem/WasherPWM/WasherPWM.v2default:default2
212default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
stationSystem2default:default2
 2default:default2
02default:default2
12default:default2N
8C:/Users/Zack/labone/mainproject/stationSystem/station.v2default:default2
312default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
top2default:default2
 2default:default2
02default:default2
12default:default2v
`C:/Users/Zack/labone/mainproject/VivadoProjects/finalDesign/finalDesign.srcs/sources_1/new/top.v2default:default2
232default:default8@Z8-6155h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
busy_reg2default:default2`
JC:/Users/Zack/labone/mainproject/stationSystem/7SegmentDriver/7SegDriver.v2default:default2
622default:default8@Z8-6014h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:34 ; elapsed = 00:00:35 . Memory (MB): peak = 1358.801 ; gain = 504.867
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:34 ; elapsed = 00:00:36 . Memory (MB): peak = 1358.801 ; gain = 504.867
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:34 ; elapsed = 00:00:36 . Memory (MB): peak = 1358.801 ; gain = 504.867
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0292default:default2
1358.8012default:default2
0.0002default:defaultZ17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/Zack/labone/mainproject/VivadoProjects/finalDesign/finalDesign.gen/sources_1/ip/xadc_wiz_0/xadc_wiz_0/xadc_wiz_0_in_context.xdc2default:default2)
Station/XADC0/xadc1	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/Zack/labone/mainproject/VivadoProjects/finalDesign/finalDesign.gen/sources_1/ip/xadc_wiz_0/xadc_wiz_0/xadc_wiz_0_in_context.xdc2default:default2)
Station/XADC0/xadc1	2default:default8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2�
}C:/Users/Zack/labone/mainproject/VivadoProjects/finalDesign/finalDesign.srcs/constrs_1/imports/Vivado Files/Basys3_Master.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2�
}C:/Users/Zack/labone/mainproject/VivadoProjects/finalDesign/finalDesign.srcs/constrs_1/imports/Vivado Files/Basys3_Master.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2�
}C:/Users/Zack/labone/mainproject/VivadoProjects/finalDesign/finalDesign.srcs/constrs_1/imports/Vivado Files/Basys3_Master.xdc2default:default2)
.Xil/top_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1462.5512default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0182default:default2
1462.5512default:default2
0.0002default:defaultZ17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:01:12 ; elapsed = 00:01:14 . Memory (MB): peak = 1462.551 ; gain = 608.617
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Loading part: xc7a35tcpg236-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:01:12 ; elapsed = 00:01:14 . Memory (MB): peak = 1462.551 ; gain = 608.617
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:01:12 ; elapsed = 00:01:15 . Memory (MB): peak = 1462.551 ; gain = 608.617
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2default:default2

SSegDriver2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2default:default2"
materialSystem2default:defaultZ8-802h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    IDLE |                               00 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_                 CAPTURE |                               01 |                              001
2default:defaulth p
x
� 
�
%s
*synth2s
_                DIVISION |                               10 |                              010
2default:defaulth p
x
� 
�
%s
*synth2s
_                  OUTPUT |                               11 |                              011
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2default:default2

sequential2default:default2

SSegDriver2default:defaultZ8-3354h px� 
�
QFound Keep on FSM register '%s' in module '%s', re-encoding will not be performed4499*oasys2
	state_reg2default:default2"
materialSystem2default:defaultZ8-6159h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    IDLE |                             0000 |                             0000
2default:defaulth p
x
� 
�
%s
*synth2s
_                    READ |                             0001 |                             0001
2default:defaulth p
x
� 
�
%s
*synth2s
_                 CORRECT |                             0010 |                             0010
2default:defaulth p
x
� 
�
%s
*synth2s
_            LeaveDropoff |                             0100 |                             0100
2default:defaulth p
x
� 
�
%s
*synth2s
_              FINDPICKUP |                             0101 |                             0101
2default:defaulth p
x
� 
�
%s
*synth2s
_                  PICKUP |                             0110 |                             0110
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                             0011 |                             0011
2default:defaulth p
x
� 
.
%s
*synth2
*
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:01:14 ; elapsed = 00:01:17 . Memory (MB): peak = 1462.551 ; gain = 608.617
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input   32 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   17 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   12 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   10 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    8 Bit       Adders := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    7 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    2 Bit       Adders := 2     
2default:defaulth p
x
� 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      1 Bit         XORs := 14    
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               17 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               12 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               10 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                8 Bit    Registers := 3     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                7 Bit    Registers := 3     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                2 Bit    Registers := 6     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 16    
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   12 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input   12 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   10 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    8 Bit        Muxes := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    7 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit        Muxes := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   5 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   6 Input    3 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit        Muxes := 5     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  10 Input    2 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 8     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  10 Input    1 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 9     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    1 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    1 Bit        Muxes := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   6 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2j
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
top2default:default2
LED[4]2default:default2
02default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
top2default:default2
LED[3]2default:default2
02default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
top2default:default2
LED[2]2default:default2
02default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
top2default:default2
LED[1]2default:default2
02default:defaultZ8-3917h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:01:27 ; elapsed = 00:01:31 . Memory (MB): peak = 1462.551 ; gain = 608.617
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:01:55 ; elapsed = 00:01:58 . Memory (MB): peak = 1462.551 ; gain = 608.617
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Timing Optimization : Time (s): cpu = 00:01:56 ; elapsed = 00:02:00 . Memory (MB): peak = 1462.551 ; gain = 608.617
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Technology Mapping : Time (s): cpu = 00:01:57 ; elapsed = 00:02:01 . Memory (MB): peak = 1462.551 ; gain = 608.617
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
*BlackBox module %s has unconnected pin %s
3599*oasys2)
\Station/XADC0/xadc1 2default:default2
reset_in2default:defaultZ8-4442h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
vFinished IO Insertion : Time (s): cpu = 00:02:20 ; elapsed = 00:02:24 . Memory (MB): peak = 1462.551 ; gain = 608.617
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:02:20 ; elapsed = 00:02:24 . Memory (MB): peak = 1462.551 ; gain = 608.617
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:02:20 ; elapsed = 00:02:24 . Memory (MB): peak = 1462.551 ; gain = 608.617
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:02:20 ; elapsed = 00:02:24 . Memory (MB): peak = 1462.551 ; gain = 608.617
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:02:20 ; elapsed = 00:02:24 . Memory (MB): peak = 1462.551 ; gain = 608.617
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:02:20 ; elapsed = 00:02:24 . Memory (MB): peak = 1462.551 ; gain = 608.617
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
� 
O
%s
*synth27
#|      |BlackBox name |Instances |
2default:defaulth p
x
� 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
� 
O
%s
*synth27
#|1     |xadc_wiz_0    |         1|
2default:defaulth p
x
� 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
F
%s*synth2.
+------+---------+------+
2default:defaulth px� 
F
%s*synth2.
|      |Cell     |Count |
2default:defaulth px� 
F
%s*synth2.
+------+---------+------+
2default:defaulth px� 
F
%s*synth2.
|1     |xadc_wiz |     1|
2default:defaulth px� 
F
%s*synth2.
|2     |BUFG     |     1|
2default:defaulth px� 
F
%s*synth2.
|3     |CARRY4   |    15|
2default:defaulth px� 
F
%s*synth2.
|4     |LUT1     |    20|
2default:defaulth px� 
F
%s*synth2.
|5     |LUT2     |    37|
2default:defaulth px� 
F
%s*synth2.
|6     |LUT3     |    30|
2default:defaulth px� 
F
%s*synth2.
|7     |LUT4     |    21|
2default:defaulth px� 
F
%s*synth2.
|8     |LUT5     |    25|
2default:defaulth px� 
F
%s*synth2.
|9     |LUT6     |    50|
2default:defaulth px� 
F
%s*synth2.
|10    |MUXF7    |     3|
2default:defaulth px� 
F
%s*synth2.
|11    |FDRE     |   123|
2default:defaulth px� 
F
%s*synth2.
|12    |FDSE     |    11|
2default:defaulth px� 
F
%s*synth2.
|13    |IBUF     |    14|
2default:defaulth px� 
F
%s*synth2.
|14    |OBUF     |    34|
2default:defaulth px� 
F
%s*synth2.
+------+---------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:02:20 ; elapsed = 00:02:24 . Memory (MB): peak = 1462.551 ; gain = 608.617
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 1 critical warnings and 5 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:01:38 ; elapsed = 00:02:15 . Memory (MB): peak = 1462.551 ; gain = 504.867
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:02:21 ; elapsed = 00:02:24 . Memory (MB): peak = 1462.551 ; gain = 608.617
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0172default:default2
1462.5512default:default2
0.0002default:defaultZ17-268h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
182default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1462.5512default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
g
%Synth Design complete | Checksum: %s
562*	vivadotcl2
33edbe42default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
632default:default2
62default:default2
12default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:02:422default:default2
00:02:492default:default2
1462.5512default:default2
989.9572default:defaultZ17-268h px� 
u
%s6*runtcl2Y
ESynthesis results are not added to the cache due to CRITICAL_WARNING
2default:defaulth px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2p
\C:/Users/Zack/labone/mainproject/VivadoProjects/finalDesign/finalDesign.runs/synth_1/top.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2p
\Executing : report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sat Dec  2 13:10:49 20232default:defaultZ17-206h px� 


End Record