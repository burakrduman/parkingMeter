
L
Command: %s
53*	vivadotcl2

opt_design2default:defaultZ4-113h px
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px
k
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_design2default:defaultZ4-22h px
O

Starting %s Task
103*constraints2
DRC2default:defaultZ18-103h px
M
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px
R
DRC finished with %s
272*project2
0 Errors2default:defaultZ1-461h px
a
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462h px
�

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.118 . Memory (MB): peak = 434.906 ; gain = 3.5512default:defaulth px
B
%Done setting XDC timing constraints.
35*timingZ38-35h px
^

Starting %s Task
103*constraints2&
Logic Optimization2default:defaultZ18-103h px
>
,Implement Debug Cores | Checksum: 15279089a
*commonh px
f

Phase %s%s
101*constraints2
1 2default:default2
Retarget2default:defaultZ18-101h px
r
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px
H
Retargeted %s cell(s).
49*opt2
02default:defaultZ31-49h px
9
'Phase 1 Retarget | Checksum: 17e70ee1e
*commonh px
�

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.346 . Memory (MB): peak = 917.285 ; gain = 0.0002default:defaulth px
r

Phase %s%s
101*constraints2
2 2default:default2(
Constant Propagation2default:defaultZ18-101h px
r
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px
F
Eliminated %s cells.
10*opt2
02default:defaultZ31-10h px
E
3Phase 2 Constant Propagation | Checksum: 17e70ee1e
*commonh px
�

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.486 . Memory (MB): peak = 917.285 ; gain = 0.0002default:defaulth px
c

Phase %s%s
101*constraints2
3 2default:default2
Sweep2default:defaultZ18-101h px
T
 Eliminated %s unconnected nets.
12*opt2
13322default:defaultZ31-12h px
R
!Eliminated %s unconnected cells.
11*opt2
02default:defaultZ31-11h px
6
$Phase 3 Sweep | Checksum: 19f0086e1
*commonh px
�

%s
*constraints2r
^Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.815 . Memory (MB): peak = 917.285 ; gain = 0.0002default:defaulth px
^

Starting %s Task
103*constraints2&
Connectivity Check2default:defaultZ18-103h px
�

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.010 . Memory (MB): peak = 917.285 ; gain = 0.0002default:defaulth px
G
5Ending Logic Optimization Task | Checksum: 19f0086e1
*commonh px
�

%s
*constraints2r
^Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.842 . Memory (MB): peak = 917.285 ; gain = 0.0002default:defaulth px
^

Starting %s Task
103*constraints2&
Power Optimization2default:defaultZ18-103h px
p
7Will skip clock gating for clocks with period < %s ns.
114*pwropt2
2.002default:defaultZ34-132h px
G
5Ending Power Optimization Task | Checksum: 19f0086e1
*commonh px
�

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.009 . Memory (MB): peak = 917.285 ; gain = 0.0002default:defaulth px
W
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
202default:default2
12default:default2
02default:default2
02default:defaultZ4-41h px
Y
%s completed successfully
29*	vivadotcl2

opt_design2default:defaultZ4-42h px
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
opt_design: 2default:default2
00:00:142default:default2
00:00:142default:default2
917.2852default:default2
485.9302default:defaultZ17-268h px
A
Writing placer database...
1603*designutilsZ20-1893h px
:
Writing XDEF routing.
211*designutilsZ20-211h px
G
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px
G
#Writing XDEF routing special nets.
210*designutilsZ20-210h px
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:002default:default2 
00:00:00.0712default:default2
917.2852default:default2
0.0002default:defaultZ17-268h px
M
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px
�
#The results of DRC are in file %s.
168*coretcl2�
RC:/Users/BURAKPC/Vivado/parking-meter/parking-meter.runs/impl_1/main_drc_opted.rptRC:/Users/BURAKPC/Vivado/parking-meter/parking-meter.runs/impl_1/main_drc_opted.rpt2default:default8Z2-168h px


End Record