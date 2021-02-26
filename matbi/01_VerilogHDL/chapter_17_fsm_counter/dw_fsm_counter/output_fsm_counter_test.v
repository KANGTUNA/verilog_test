#! /usr/local/bin/vvp
:ivl_version "12.0 (devel)" "(s20150603-1115-g753bf516)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision - 12;
:vpi_module "/usr/local/lib/ivl/system.vpi";
:vpi_module "/usr/local/lib/ivl/vhdl_sys.vpi";
:vpi_module "/usr/local/lib/ivl/vhdl_textio.vpi";
:vpi_module "/usr/local/lib/ivl/v2005_math.vpi";
:vpi_module "/usr/local/lib/ivl/va_math.vpi";
S_0x7fffea7feb50 .scope module, "dw_tb_fsm_counter_test" "dw_tb_fsm_counter_test" 2 20;
 .timescale -9 -12;
v0x7fffea85af30_0 .var "clk", 0 0;
v0x7fffea85aff0_0 .var "i_num_cnt", 6 0;
v0x7fffea85b090_0 .var "i_run", 0 0;
v0x7fffea85b130_0 .net "o_done", 0 0, L_0x7fffea85b710;  1 drivers
v0x7fffea85b1d0_0 .net "o_idle", 0 0, L_0x7fffea85b440;  1 drivers
v0x7fffea85b270_0 .net "o_running", 0 0, L_0x7fffea85b580;  1 drivers
v0x7fffea85b340_0 .var "reset_n", 0 0;
E_0x7fffea83afd0 .event anyedge, v0x7fffea85ab50_0;
E_0x7fffea83b1f0 .event posedge, v0x7fffea85a670_0;
E_0x7fffea83a6e0 .event anyedge, v0x7fffea85ac10_0;
S_0x7fffea839eb0 .scope module, "u_dw_fsm_counter" "dw_fsm_counter" 2 72, 3 3 0, S_0x7fffea7feb50;
 .timescale -9 -9;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "reset_n";
    .port_info 2 /INPUT 1 "i_run";
    .port_info 3 /INPUT 7 "i_num_cnt";
    .port_info 4 /OUTPUT 1 "o_idle";
    .port_info 5 /OUTPUT 1 "o_running";
    .port_info 6 /OUTPUT 1 "o_done";
P_0x7fffea7fe190 .param/l "S_DONE" 1 3 20, C4<10>;
P_0x7fffea7fe1d0 .param/l "S_IDLE" 1 3 18, C4<00>;
P_0x7fffea7fe210 .param/l "S_RUN" 1 3 19, C4<01>;
L_0x7fffea82af50 .functor AND 1, L_0x7fffea85b580, L_0x7fffea86bcd0, C4<1>, C4<1>;
L_0x7f52154a0018 .functor BUFT 1, C4<0000000>, C4<0>, C4<0>, C4<0>;
v0x7fffea82b0b0_0 .net/2u *"_ivl_0", 6 0, L_0x7f52154a0018;  1 drivers
v0x7fffea8272c0_0 .net *"_ivl_12", 31 0, L_0x7fffea85b850;  1 drivers
L_0x7f52154a00f0 .functor BUFT 1, C4<0000000000000000000000000>, C4<0>, C4<0>, C4<0>;
v0x7fffea827390_0 .net *"_ivl_15", 24 0, L_0x7f52154a00f0;  1 drivers
v0x7fffea827cd0_0 .net *"_ivl_16", 31 0, L_0x7fffea86b9b0;  1 drivers
L_0x7f52154a0138 .functor BUFT 1, C4<0000000000000000000000000>, C4<0>, C4<0>, C4<0>;
v0x7fffea827d70_0 .net *"_ivl_19", 24 0, L_0x7f52154a0138;  1 drivers
L_0x7f52154a0180 .functor BUFT 1, C4<00000000000000000000000000000001>, C4<0>, C4<0>, C4<0>;
v0x7fffea85a150_0 .net/2u *"_ivl_20", 31 0, L_0x7f52154a0180;  1 drivers
v0x7fffea85a230_0 .net *"_ivl_22", 31 0, L_0x7fffea86bb50;  1 drivers
v0x7fffea85a310_0 .net *"_ivl_24", 0 0, L_0x7fffea86bcd0;  1 drivers
L_0x7f52154a0060 .functor BUFT 1, C4<0000001>, C4<0>, C4<0>, C4<0>;
v0x7fffea85a3d0_0 .net/2u *"_ivl_4", 6 0, L_0x7f52154a0060;  1 drivers
L_0x7f52154a00a8 .functor BUFT 1, C4<0000010>, C4<0>, C4<0>, C4<0>;
v0x7fffea85a4b0_0 .net/2u *"_ivl_8", 6 0, L_0x7f52154a00a8;  1 drivers
v0x7fffea85a590_0 .var "c_state", 6 0;
v0x7fffea85a670_0 .net "clk", 0 0, v0x7fffea85af30_0;  1 drivers
v0x7fffea85a730_0 .var "cnt", 6 0;
v0x7fffea85a810_0 .net "i_num_cnt", 6 0, v0x7fffea85aff0_0;  1 drivers
v0x7fffea85a8f0_0 .net "i_run", 0 0, v0x7fffea85b090_0;  1 drivers
v0x7fffea85a9b0_0 .net "is_done", 0 0, L_0x7fffea82af50;  1 drivers
v0x7fffea85aa70_0 .var "num_cnt", 6 0;
v0x7fffea85ab50_0 .net "o_done", 0 0, L_0x7fffea85b710;  alias, 1 drivers
v0x7fffea85ac10_0 .net "o_idle", 0 0, L_0x7fffea85b440;  alias, 1 drivers
v0x7fffea85acd0_0 .net "o_running", 0 0, L_0x7fffea85b580;  alias, 1 drivers
v0x7fffea85ad90_0 .net "reset_n", 0 0, v0x7fffea85b340_0;  1 drivers
E_0x7fffea820130/0 .event negedge, v0x7fffea85ad90_0;
E_0x7fffea820130/1 .event posedge, v0x7fffea85a670_0;
E_0x7fffea820130 .event/or E_0x7fffea820130/0, E_0x7fffea820130/1;
L_0x7fffea85b440 .cmp/eq 7, v0x7fffea85a590_0, L_0x7f52154a0018;
L_0x7fffea85b580 .cmp/eq 7, v0x7fffea85a590_0, L_0x7f52154a0060;
L_0x7fffea85b710 .cmp/eq 7, v0x7fffea85a590_0, L_0x7f52154a00a8;
L_0x7fffea85b850 .concat [ 7 25 0 0], v0x7fffea85a730_0, L_0x7f52154a00f0;
L_0x7fffea86b9b0 .concat [ 7 25 0 0], v0x7fffea85aa70_0, L_0x7f52154a0138;
L_0x7fffea86bb50 .arith/sub 32, L_0x7fffea86b9b0, L_0x7f52154a0180;
L_0x7fffea86bcd0 .cmp/eq 32, L_0x7fffea85b850, L_0x7fffea86bb50;
    .scope S_0x7fffea839eb0;
T_0 ;
    %wait E_0x7fffea820130;
    %load/vec4 v0x7fffea85ad90_0;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_0.0, 8;
    %pushi/vec4 0, 0, 7;
    %assign/vec4 v0x7fffea85a590_0, 0;
    %jmp T_0.1;
T_0.0 ;
    %load/vec4 v0x7fffea85a590_0;
    %dup/vec4;
    %pushi/vec4 0, 0, 7;
    %cmp/u;
    %jmp/1 T_0.2, 6;
    %dup/vec4;
    %pushi/vec4 1, 0, 7;
    %cmp/u;
    %jmp/1 T_0.3, 6;
    %dup/vec4;
    %pushi/vec4 2, 0, 7;
    %cmp/u;
    %jmp/1 T_0.4, 6;
    %jmp T_0.5;
T_0.2 ;
    %load/vec4 v0x7fffea85a8f0_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_0.6, 8;
    %pushi/vec4 1, 0, 7;
    %assign/vec4 v0x7fffea85a590_0, 0;
T_0.6 ;
    %jmp T_0.5;
T_0.3 ;
    %load/vec4 v0x7fffea85a9b0_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_0.8, 8;
    %pushi/vec4 2, 0, 7;
    %assign/vec4 v0x7fffea85a590_0, 0;
T_0.8 ;
    %jmp T_0.5;
T_0.4 ;
    %pushi/vec4 0, 0, 7;
    %assign/vec4 v0x7fffea85a590_0, 0;
    %jmp T_0.5;
T_0.5 ;
    %pop/vec4 1;
T_0.1 ;
    %jmp T_0;
    .thread T_0;
    .scope S_0x7fffea839eb0;
T_1 ;
    %wait E_0x7fffea820130;
    %load/vec4 v0x7fffea85ad90_0;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_1.0, 8;
    %pushi/vec4 0, 0, 7;
    %assign/vec4 v0x7fffea85aa70_0, 0;
    %jmp T_1.1;
T_1.0 ;
    %load/vec4 v0x7fffea85acd0_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_1.2, 8;
    %load/vec4 v0x7fffea85a810_0;
    %assign/vec4 v0x7fffea85aa70_0, 0;
    %jmp T_1.3;
T_1.2 ;
    %load/vec4 v0x7fffea85a9b0_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_1.4, 8;
    %pushi/vec4 0, 0, 7;
    %assign/vec4 v0x7fffea85aa70_0, 0;
T_1.4 ;
T_1.3 ;
T_1.1 ;
    %jmp T_1;
    .thread T_1;
    .scope S_0x7fffea839eb0;
T_2 ;
    %wait E_0x7fffea820130;
    %load/vec4 v0x7fffea85ad90_0;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_2.0, 8;
    %pushi/vec4 0, 0, 7;
    %assign/vec4 v0x7fffea85a730_0, 0;
    %jmp T_2.1;
T_2.0 ;
    %load/vec4 v0x7fffea85acd0_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_2.2, 8;
    %load/vec4 v0x7fffea85a730_0;
    %addi 1, 0, 7;
    %assign/vec4 v0x7fffea85a730_0, 0;
    %jmp T_2.3;
T_2.2 ;
    %load/vec4 v0x7fffea85a9b0_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_2.4, 8;
    %pushi/vec4 0, 0, 7;
    %assign/vec4 v0x7fffea85a730_0, 0;
T_2.4 ;
T_2.3 ;
T_2.1 ;
    %jmp T_2;
    .thread T_2;
    .scope S_0x7fffea7feb50;
T_3 ;
    %delay 5000, 0;
    %load/vec4 v0x7fffea85af30_0;
    %inv;
    %store/vec4 v0x7fffea85af30_0, 0, 1;
    %jmp T_3;
    .thread T_3;
    .scope S_0x7fffea7feb50;
T_4 ;
    %vpi_call 2 34 "$dumpfile", "output.vcd" {0 0 0};
    %vpi_call 2 35 "$dumpvars", 32'sb00000000000000000000000000000000, S_0x7fffea7feb50 {0 0 0};
    %vpi_call 2 38 "$display", "initialize value [%d]", $time {0 0 0};
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x7fffea85b340_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x7fffea85af30_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x7fffea85b090_0, 0, 1;
    %pushi/vec4 0, 0, 7;
    %store/vec4 v0x7fffea85aff0_0, 0, 7;
    %vpi_call 2 45 "$display", "Reset! [%d]", $time {0 0 0};
    %delay 100000, 0;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x7fffea85b340_0, 0, 1;
    %delay 10000, 0;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x7fffea85b340_0, 0, 1;
    %delay 10000, 0;
    %wait E_0x7fffea83b1f0;
    %vpi_call 2 54 "$display", "Check Idle [%d]", $time {0 0 0};
T_4.0 ;
    %load/vec4 v0x7fffea85b1d0_0;
    %cmpi/ne 1, 0, 1;
    %jmp/0xz T_4.1, 6;
    %wait E_0x7fffea83a6e0;
    %jmp T_4.0;
T_4.1 ;
    %vpi_call 2 57 "$display", "Start! [%d]", $time {0 0 0};
    %pushi/vec4 100, 0, 7;
    %store/vec4 v0x7fffea85aff0_0, 0, 7;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x7fffea85b090_0, 0, 1;
    %wait E_0x7fffea83b1f0;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x7fffea85b090_0, 0, 1;
    %vpi_call 2 63 "$display", "Wait Done [%d]", $time {0 0 0};
T_4.2 ;
    %load/vec4 v0x7fffea85b130_0;
    %cmpi/ne 1, 0, 1;
    %jmp/0xz T_4.3, 6;
    %wait E_0x7fffea83afd0;
    %jmp T_4.2;
T_4.3 ;
    %delay 100000, 0;
    %vpi_call 2 67 "$display", "Finish! [%d]", $time {0 0 0};
    %vpi_call 2 68 "$finish" {0 0 0};
    %end;
    .thread T_4;
# The file index is used to find the file name in the following table.
:file_names 4;
    "N/A";
    "<interactive>";
    "dw_tb_fsm_counter.v";
    "dw_fsm_counter.v";
