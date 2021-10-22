/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09-SP2
// Date      : Fri Jan 15 02:34:40 2021
/////////////////////////////////////////////////////////////


module CLE ( clk, reset, rom_q, rom_a, sram_a, sram_d, sram_wen, finish );
  input [7:0] rom_q;
  output [6:0] rom_a;
  output [9:0] sram_a;
  output [7:0] sram_d;
  input clk, reset;
  output sram_wen, finish;
  wire   new_color, N95, N96, N97, N104, N107, N108, sram_write, sram_reset,
         update_color, N170, N171, N172, N173, N174, N175, N176, n147, n148,
         n149, n151, n153, n155, n157, n159, n161, n163, n165, n1710, n1720,
         n1730, n1740, n1760, n178, n179, n180, n183, n184, n185, n186, n187,
         n188, n189, n190, n197, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n219, n220, n221, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n270, n272, n274, n275,
         n742, n354, n361, n362, n363, n364, n365, n366, n367, n554, n555,
         n556, n558, n559, n560, n562, n565, n566, n567, n568, n569, n570,
         n571, n572, n573, n574, n575, n576, n577, n578, n579, n580, n581,
         n582, n583, n584, n585, n586, n587, n588, n589, n590, n591, n592,
         n593, n594, n595, n596, n597, n598, n599, n600, n601, n602, n603,
         n604, n605, n606, n607, n608, n609, n610, n611, n612, n613, n614,
         n615, n616, n617, n618, n619, n620, n621, n622, n623, n624, n625,
         n626, n627, n628, n629, n630, n631, n632, n633, n634, n635, n636,
         n637, n638, n639, n640, n641, n642, n643, n644, n645, n646, n647,
         n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658,
         n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669,
         n670, n671, n672, n673, n674, n675, n676, n677, n678, n679, n680,
         n681, n682, n683, n684, n685, n686, n687, n688, n689, n690, n691,
         n692, n693, n694, n695, n696, n697, n698, n699, n700, n701, n702,
         n703, n704, n705, n706, n707, n708, n709, n710, n711, n712, n713,
         n714, n715, n716, n717, n718, n719, n720, n721, n722, n723, n724,
         n725, n726, n727, n728, n729, n730, n731, n732, n733, n734, n735,
         n736, n737, n738, n739, n740, n741;
  wire   [4:0] g_x;
  wire   [4:0] g_y;
  wire   [6:0] rom_a_w;
  wire   [6:0] ex_sram_a_w;
  wire   [7:0] ex_sram_a;
  wire   [7:0] ex_sram_d;
  wire   [7:0] ex_sram_q_w;
  wire   [4:0] kernel_x;
  wire   [4:0] kernel_y;
  wire   [4:0] kernel_x_w;
  wire   [2:0] kernel_y_w;
  wire   [7:1] color;
  wire   [7:0] in_rom_q;
  wire   [2:0] ex_sram_q;
  wire   [4:2] r488_carry;
  wire   [4:2] r489_carry;

  sram_256x8 test ( .Q(ex_sram_q_w), .A({1'b0, ex_sram_a[6:0]}), .D(ex_sram_d), 
        .CLK(clk), .CEN(1'b0), .WEN(sram_wen) );
  DFFRX1 ex_sram_d_reg_0_ ( .D(n232), .CK(clk), .RN(n558), .Q(ex_sram_d[0]), 
        .QN(n190) );
  DFFRX1 ex_sram_d_reg_1_ ( .D(n231), .CK(clk), .RN(n558), .Q(ex_sram_d[1]), 
        .QN(n189) );
  DFFRX1 ex_sram_d_reg_2_ ( .D(n230), .CK(clk), .RN(n741), .Q(ex_sram_d[2]), 
        .QN(n188) );
  DFFRX1 ex_sram_d_reg_3_ ( .D(n229), .CK(clk), .RN(n740), .Q(ex_sram_d[3]), 
        .QN(n187) );
  DFFRX1 ex_sram_d_reg_4_ ( .D(n228), .CK(clk), .RN(n740), .Q(ex_sram_d[4]), 
        .QN(n186) );
  DFFRX1 ex_sram_d_reg_5_ ( .D(n227), .CK(clk), .RN(n740), .Q(ex_sram_d[5]), 
        .QN(n185) );
  DFFRX1 ex_sram_d_reg_6_ ( .D(n226), .CK(clk), .RN(n740), .Q(ex_sram_d[6]), 
        .QN(n184) );
  DFFRX1 ex_sram_d_reg_7_ ( .D(n225), .CK(clk), .RN(n740), .Q(ex_sram_d[7]), 
        .QN(n183) );
  DFFRX1 color_reg_7_ ( .D(n241), .CK(clk), .RN(n558), .Q(color[7]) );
  DFFRX1 color_reg_2_ ( .D(n246), .CK(clk), .RN(n558), .QN(n734) );
  DFFRX1 color_reg_3_ ( .D(n245), .CK(clk), .RN(n558), .Q(color[3]) );
  DFFRX1 color_reg_4_ ( .D(n244), .CK(clk), .RN(n558), .QN(n736) );
  DFFRX1 color_reg_5_ ( .D(n243), .CK(clk), .RN(n558), .Q(color[5]) );
  DFFRX1 color_reg_6_ ( .D(n242), .CK(clk), .RN(n558), .QN(n738) );
  DFFRX1 color_reg_1_ ( .D(n247), .CK(clk), .RN(n558), .Q(color[1]) );
  DFFSX1 color_reg_0_ ( .D(n248), .CK(clk), .SN(n558), .QN(n731) );
  DFFRX1 update_color_reg ( .D(n268), .CK(clk), .RN(n558), .Q(update_color) );
  DFFRX1 g_idx_reg_7_ ( .D(N174), .CK(clk), .RN(n741), .Q(g_x[2]) );
  DFFRX1 g_idx_reg_9_ ( .D(N176), .CK(clk), .RN(n741), .Q(g_x[4]) );
  DFFRX1 g_idx_reg_8_ ( .D(N175), .CK(clk), .RN(n558), .Q(g_x[3]) );
  DFFRX1 g_idx_reg_5_ ( .D(N172), .CK(clk), .RN(n741), .Q(g_x[0]), .QN(n729)
         );
  DFFRX1 g_idx_reg_6_ ( .D(N173), .CK(clk), .RN(n558), .Q(g_x[1]) );
  DFFRX1 kernel_y_reg_3_ ( .D(n555), .CK(clk), .RN(n558), .Q(kernel_y[3]), 
        .QN(n224) );
  DFFRX1 g_idx_reg_4_ ( .D(N171), .CK(clk), .RN(n558), .Q(g_y[4]) );
  DFFRX1 g_idx_reg_3_ ( .D(N170), .CK(clk), .RN(n558), .Q(g_y[3]), .QN(n735)
         );
  DFFSX1 sram_reset_reg ( .D(n554), .CK(clk), .SN(n558), .Q(sram_reset), .QN(
        n722) );
  DFFRX1 same_flag_reg ( .D(n259), .CK(clk), .RN(n558), .QN(n275) );
  DFFRX1 diff_flag_reg ( .D(n264), .CK(clk), .RN(n558), .QN(n274) );
  DFFRX1 sram_write_reg ( .D(n263), .CK(clk), .RN(n558), .Q(sram_write), .QN(
        n728) );
  DFFRX1 rom_counter_reg_2_ ( .D(n180), .CK(clk), .RN(n558), .QN(n270) );
  DFFRX1 rom_counter_reg_1_ ( .D(n178), .CK(clk), .RN(n558), .Q(n1760) );
  DFFRX1 ex_sram_q_reg_0_ ( .D(ex_sram_q_w[0]), .CK(clk), .RN(n558), .Q(
        ex_sram_q[0]), .QN(n723) );
  DFFRX1 ex_sram_q_reg_4_ ( .D(ex_sram_q_w[4]), .CK(clk), .RN(n740), .QN(n1710) );
  DFFRX1 ex_sram_q_reg_1_ ( .D(ex_sram_q_w[1]), .CK(clk), .RN(n740), .QN(n725)
         );
  DFFRX1 ex_sram_q_reg_5_ ( .D(ex_sram_q_w[5]), .CK(clk), .RN(n558), .QN(n1720) );
  DFFRX1 ex_sram_q_reg_2_ ( .D(ex_sram_q_w[2]), .CK(clk), .RN(n558), .Q(
        ex_sram_q[2]), .QN(n739) );
  DFFRX1 ex_sram_q_reg_6_ ( .D(ex_sram_q_w[6]), .CK(clk), .RN(n558), .QN(n1730) );
  DFFRX1 ex_sram_q_reg_3_ ( .D(ex_sram_q_w[3]), .CK(clk), .RN(n558), .QN(n727)
         );
  DFFRX1 ex_sram_q_reg_7_ ( .D(ex_sram_q_w[7]), .CK(clk), .RN(n558), .QN(n1740) );
  DFFRX1 in_rom_q_reg_4_ ( .D(rom_q[4]), .CK(clk), .RN(n558), .Q(in_rom_q[4])
         );
  DFFRX1 in_rom_q_reg_0_ ( .D(rom_q[0]), .CK(clk), .RN(n558), .Q(in_rom_q[0])
         );
  DFFRX1 in_rom_q_reg_5_ ( .D(rom_q[5]), .CK(clk), .RN(n558), .Q(in_rom_q[5])
         );
  DFFRX1 in_rom_q_reg_1_ ( .D(rom_q[1]), .CK(clk), .RN(n558), .Q(in_rom_q[1])
         );
  DFFRX1 in_rom_q_reg_6_ ( .D(rom_q[6]), .CK(clk), .RN(n558), .Q(in_rom_q[6])
         );
  DFFRX1 in_rom_q_reg_2_ ( .D(rom_q[2]), .CK(clk), .RN(n558), .Q(in_rom_q[2])
         );
  DFFRX1 in_rom_q_reg_7_ ( .D(rom_q[7]), .CK(clk), .RN(n558), .Q(in_rom_q[7])
         );
  DFFRX1 in_rom_q_reg_3_ ( .D(rom_q[3]), .CK(clk), .RN(n558), .Q(in_rom_q[3])
         );
  DFFRX1 kernel_y_reg_2_ ( .D(kernel_y_w[2]), .CK(clk), .RN(n558), .Q(
        kernel_y[2]), .QN(n149) );
  DFFRX1 kernel_y_reg_1_ ( .D(kernel_y_w[1]), .CK(clk), .RN(n558), .Q(
        kernel_y[1]), .QN(n148) );
  DFFRX1 kernel_y_reg_0_ ( .D(kernel_y_w[0]), .CK(clk), .RN(n741), .Q(
        kernel_y[0]), .QN(n147) );
  DFFRX1 kernel_x_reg_0_ ( .D(kernel_x_w[0]), .CK(clk), .RN(n741), .Q(
        kernel_x[0]), .QN(n733) );
  DFFRX1 kernel_x_reg_3_ ( .D(kernel_x_w[3]), .CK(clk), .RN(n741), .Q(
        kernel_x[3]), .QN(n219) );
  DFFRX1 kernel_x_reg_4_ ( .D(kernel_x_w[4]), .CK(clk), .RN(n741), .Q(
        kernel_x[4]), .QN(n730) );
  DFFRX1 kernel_x_reg_1_ ( .D(kernel_x_w[1]), .CK(clk), .RN(n741), .Q(
        kernel_x[1]), .QN(n221) );
  DFFRX1 kernel_x_reg_2_ ( .D(kernel_x_w[2]), .CK(clk), .RN(n741), .Q(
        kernel_x[2]), .QN(n220) );
  DFFRX1 rom_counter_reg_0_ ( .D(n179), .CK(clk), .RN(n558), .Q(n737), .QN(
        n272) );
  DFFRX1 g_idx_reg_2_ ( .D(n262), .CK(clk), .RN(n558), .Q(g_y[2]), .QN(n721)
         );
  DFFRX1 g_idx_reg_1_ ( .D(n261), .CK(clk), .RN(n558), .Q(g_y[1]), .QN(n724)
         );
  DFFRX1 g_idx_reg_0_ ( .D(n260), .CK(clk), .RN(n558), .Q(g_y[0]), .QN(n719)
         );
  DFFRX1 ex_sram_a_reg_6_ ( .D(ex_sram_a_w[6]), .CK(clk), .RN(n740), .Q(
        ex_sram_a[6]) );
  DFFRX1 ex_sram_a_reg_5_ ( .D(ex_sram_a_w[5]), .CK(clk), .RN(n558), .Q(
        ex_sram_a[5]) );
  DFFRX1 ex_sram_a_reg_4_ ( .D(ex_sram_a_w[4]), .CK(clk), .RN(n558), .Q(
        ex_sram_a[4]) );
  DFFRX1 ex_sram_a_reg_3_ ( .D(ex_sram_a_w[3]), .CK(clk), .RN(n741), .Q(
        ex_sram_a[3]) );
  DFFRX1 ex_sram_a_reg_2_ ( .D(ex_sram_a_w[2]), .CK(clk), .RN(n558), .Q(
        ex_sram_a[2]) );
  DFFRX1 ex_sram_a_reg_1_ ( .D(ex_sram_a_w[1]), .CK(clk), .RN(n740), .Q(
        ex_sram_a[1]) );
  DFFRX1 ex_sram_a_reg_0_ ( .D(ex_sram_a_w[0]), .CK(clk), .RN(n740), .Q(
        ex_sram_a[0]) );
  DFFRX1 rom_a_r_reg_0_ ( .D(rom_a_w[0]), .CK(clk), .RN(n741), .QN(n367) );
  DFFRX1 rom_a_r_reg_1_ ( .D(rom_a_w[1]), .CK(clk), .RN(n740), .QN(n366) );
  DFFRX1 rom_a_r_reg_2_ ( .D(rom_a_w[2]), .CK(clk), .RN(n558), .QN(n365) );
  DFFRX1 rom_a_r_reg_3_ ( .D(rom_a_w[3]), .CK(clk), .RN(n741), .QN(n364) );
  DFFRX1 rom_a_r_reg_4_ ( .D(rom_a_w[4]), .CK(clk), .RN(n740), .QN(n363) );
  DFFRX1 rom_a_r_reg_5_ ( .D(rom_a_w[5]), .CK(clk), .RN(n558), .QN(n362) );
  DFFRX1 rom_a_r_reg_6_ ( .D(rom_a_w[6]), .CK(clk), .RN(n741), .QN(n361) );
  DFFRX1 sram_a_r_reg_3_ ( .D(n255), .CK(clk), .RN(n740), .QN(n214) );
  DFFRX1 sram_a_r_reg_4_ ( .D(n254), .CK(clk), .RN(n740), .QN(n213) );
  DFFRX1 sram_a_r_reg_6_ ( .D(n252), .CK(clk), .RN(n558), .QN(n211) );
  DFFRX1 sram_a_r_reg_7_ ( .D(n251), .CK(clk), .RN(n741), .QN(n210) );
  DFFRX1 sram_a_r_reg_8_ ( .D(n250), .CK(clk), .RN(n558), .QN(n209) );
  DFFRX1 sram_a_r_reg_9_ ( .D(n249), .CK(clk), .RN(n740), .QN(n208) );
  DFFRX1 sram_a_r_reg_0_ ( .D(n258), .CK(clk), .RN(n558), .QN(n217) );
  DFFRX1 sram_a_r_reg_1_ ( .D(n257), .CK(clk), .RN(n740), .QN(n216) );
  DFFRX1 sram_a_r_reg_2_ ( .D(n256), .CK(clk), .RN(n558), .QN(n215) );
  DFFRX1 sram_d_r_reg_0_ ( .D(n240), .CK(clk), .RN(n558), .QN(n151) );
  DFFRX1 sram_d_r_reg_1_ ( .D(n239), .CK(clk), .RN(n558), .QN(n153) );
  DFFRX1 sram_d_r_reg_2_ ( .D(n238), .CK(clk), .RN(n558), .QN(n155) );
  DFFRX1 sram_d_r_reg_3_ ( .D(n237), .CK(clk), .RN(n741), .QN(n157) );
  DFFRX1 sram_d_r_reg_4_ ( .D(n236), .CK(clk), .RN(n558), .QN(n159) );
  DFFRX1 sram_d_r_reg_5_ ( .D(n235), .CK(clk), .RN(n740), .QN(n161) );
  DFFRX1 sram_d_r_reg_6_ ( .D(n234), .CK(clk), .RN(n741), .QN(n163) );
  DFFRX1 sram_d_r_reg_7_ ( .D(n233), .CK(clk), .RN(n558), .QN(n165) );
  DFFRX1 sram_a_r_reg_5_ ( .D(n253), .CK(clk), .RN(n740), .QN(n212) );
  DFFRX1 new_color_reg ( .D(n267), .CK(clk), .RN(n558), .Q(new_color), .QN(
        n720) );
  DFFRX1 counter_reg_1_ ( .D(n265), .CK(clk), .RN(n558), .Q(n354), .QN(n718)
         );
  ADDHXL U373 ( .A(kernel_y[1]), .B(kernel_y[0]), .CO(r489_carry[2]), .S(N107)
         );
  ADDHXL U378 ( .A(kernel_y[2]), .B(r489_carry[2]), .CO(r489_carry[3]), .S(
        N108) );
  DFFRX2 counter_reg_0_ ( .D(n266), .CK(clk), .RN(n558), .Q(n732), .QN(n197)
         );
  ADDHX1 U297 ( .A(kernel_y[3]), .B(r489_carry[3]), .CO(r489_carry[4]), .S(
        N104) );
  DFFSX1 sram_wen_r_reg ( .D(n726), .CK(clk), .SN(n558), .QN(n562) );
  DFFRX2 kernel_y_reg_4_ ( .D(n556), .CK(clk), .RN(n741), .Q(kernel_y[4]) );
  ADDHX1 U294 ( .A(kernel_x[1]), .B(kernel_x[0]), .CO(r488_carry[2]), .S(N95)
         );
  ADDHX1 U295 ( .A(kernel_x[2]), .B(r488_carry[2]), .CO(r488_carry[3]), .S(N96) );
  ADDHX1 U296 ( .A(kernel_x[3]), .B(r488_carry[3]), .CO(r488_carry[4]), .S(N97) );
  INVX12 U519 ( .A(reset), .Y(n558) );
  NAND2X1 U520 ( .A(n677), .B(n708), .Y(n559) );
  NOR2XL U521 ( .A(n736), .B(n683), .Y(n682) );
  INVX2 U522 ( .A(n708), .Y(n707) );
  INVX6 U523 ( .A(n726), .Y(n560) );
  AND2X1 U524 ( .A(n274), .B(n591), .Y(n668) );
  INVX1 U525 ( .A(n578), .Y(n679) );
  INVX1 U526 ( .A(n575), .Y(n678) );
  INVX1 U527 ( .A(n704), .Y(n579) );
  INVX2 U528 ( .A(n706), .Y(n705) );
  NOR2XL U529 ( .A(n596), .B(n671), .Y(n595) );
  BUFX2 U530 ( .A(n354), .Y(n689) );
  AND2X1 U531 ( .A(g_x[2]), .B(n642), .Y(n654) );
  NOR4X1 U532 ( .A(sram_write), .B(n610), .C(update_color), .D(n593), .Y(n672)
         );
  OAI2BB2X1 U533 ( .B0(r488_carry[4]), .B1(n730), .A0N(r488_carry[4]), .A1N(
        n730), .Y(n660) );
  AOI22X1 U534 ( .A0(n720), .A1(n719), .B0(new_color), .B1(n694), .Y(n565) );
  NOR2X1 U535 ( .A(n732), .B(n689), .Y(n633) );
  AOI22X1 U536 ( .A0(n720), .A1(n724), .B0(new_color), .B1(n695), .Y(n677) );
  NAND2X1 U537 ( .A(n708), .B(n676), .Y(n702) );
  NOR2X2 U538 ( .A(n610), .B(n722), .Y(n554) );
  NOR2X1 U539 ( .A(n732), .B(n697), .Y(n607) );
  NOR2X1 U540 ( .A(n689), .B(n197), .Y(n659) );
  INVX1 U541 ( .A(n698), .Y(n692) );
  NOR2X2 U542 ( .A(n595), .B(n615), .Y(n708) );
  INVX16 U543 ( .A(n562), .Y(sram_wen) );
  INVX12 U544 ( .A(n365), .Y(rom_a[2]) );
  INVX12 U545 ( .A(n366), .Y(rom_a[1]) );
  INVX12 U546 ( .A(n363), .Y(rom_a[4]) );
  INVX12 U547 ( .A(n361), .Y(rom_a[6]) );
  NOR2BX1 U548 ( .AN(n637), .B(n647), .Y(n642) );
  NOR2X1 U549 ( .A(n735), .B(n631), .Y(n630) );
  NOR2X1 U550 ( .A(n738), .B(n681), .Y(n680) );
  NOR2X1 U551 ( .A(n724), .B(n712), .Y(n711) );
  NAND2X1 U552 ( .A(n658), .B(n621), .Y(n657) );
  NOR2X2 U553 ( .A(n615), .B(n620), .Y(n658) );
  NAND2X1 U554 ( .A(n567), .B(n566), .Y(n703) );
  NOR2X1 U555 ( .A(n565), .B(n567), .Y(n575) );
  NOR2X1 U556 ( .A(n566), .B(n567), .Y(n578) );
  OAI22X1 U557 ( .A0(new_color), .A1(n721), .B0(n720), .B1(n696), .Y(n567) );
  OAI31X1 U558 ( .A0(n573), .A1(n676), .A2(n572), .B0(n571), .Y(n587) );
  NOR2X1 U559 ( .A(n197), .B(n697), .Y(n606) );
  NAND2X1 U560 ( .A(n596), .B(n706), .Y(n697) );
  OAI21X1 U561 ( .A0(n590), .A1(n589), .B0(n610), .Y(n742) );
  INVX12 U562 ( .A(n742), .Y(finish) );
  INVX12 U563 ( .A(n208), .Y(sram_a[9]) );
  INVX12 U564 ( .A(n209), .Y(sram_a[8]) );
  INVX12 U565 ( .A(n210), .Y(sram_a[7]) );
  INVX12 U566 ( .A(n211), .Y(sram_a[6]) );
  INVX12 U567 ( .A(n212), .Y(sram_a[5]) );
  INVX12 U568 ( .A(n213), .Y(sram_a[4]) );
  INVX12 U569 ( .A(n214), .Y(sram_a[3]) );
  INVX12 U570 ( .A(n215), .Y(sram_a[2]) );
  INVX12 U571 ( .A(n216), .Y(sram_a[1]) );
  INVX12 U572 ( .A(n217), .Y(sram_a[0]) );
  INVX12 U573 ( .A(n165), .Y(sram_d[7]) );
  INVX12 U574 ( .A(n163), .Y(sram_d[6]) );
  INVX12 U575 ( .A(n161), .Y(sram_d[5]) );
  INVX12 U576 ( .A(n159), .Y(sram_d[4]) );
  INVX12 U577 ( .A(n157), .Y(sram_d[3]) );
  INVX12 U578 ( .A(n155), .Y(sram_d[2]) );
  INVX12 U579 ( .A(n153), .Y(sram_d[1]) );
  INVX12 U580 ( .A(n151), .Y(sram_d[0]) );
  OAI21X1 U581 ( .A0(sram_reset), .A1(n671), .B0(n665), .Y(n698) );
  NAND2X2 U582 ( .A(n722), .B(n597), .Y(n665) );
  OAI21X2 U583 ( .A0(n615), .A1(n614), .B0(n613), .Y(n662) );
  NOR2X2 U584 ( .A(n197), .B(n718), .Y(n667) );
  INVX12 U585 ( .A(n362), .Y(rom_a[5]) );
  INVX12 U586 ( .A(n364), .Y(rom_a[3]) );
  INVX12 U587 ( .A(n367), .Y(rom_a[0]) );
  NOR2XL U588 ( .A(n591), .B(n728), .Y(n596) );
  NOR2BX1 U589 ( .AN(n667), .B(n612), .Y(n666) );
  NOR2X1 U590 ( .A(sram_reset), .B(n597), .Y(n674) );
  AOI2BB2X1 U591 ( .B0(n689), .B1(n147), .A0N(n689), .A1N(n147), .Y(n694) );
  INVXL U592 ( .A(n565), .Y(n566) );
  OAI22XL U593 ( .A0(n689), .A1(kernel_y[2]), .B0(n718), .B1(N108), .Y(n696)
         );
  NOR2XL U594 ( .A(n1710), .B(n679), .Y(n573) );
  OAI2BB2XL U595 ( .B0(n718), .B1(N107), .A0N(n718), .A1N(n148), .Y(n695) );
  INVXL U596 ( .A(n677), .Y(n676) );
  NAND2XL U597 ( .A(n565), .B(n567), .Y(n704) );
  AOI2BB2X1 U598 ( .B0(n579), .B1(ex_sram_q[0]), .A0N(n703), .A1N(n725), .Y(
        n568) );
  OAI21XL U599 ( .A0(n1720), .A1(n678), .B0(n568), .Y(n572) );
  OAI22XL U600 ( .A0(n1730), .A1(n679), .B0(n1740), .B1(n678), .Y(n569) );
  AOI211XL U601 ( .A0(ex_sram_q[2]), .A1(n579), .B0(n677), .C0(n569), .Y(n570)
         );
  OAI21XL U602 ( .A0(n703), .A1(n727), .B0(n570), .Y(n571) );
  INVXL U603 ( .A(n703), .Y(n576) );
  AO22X1 U604 ( .A0(n576), .A1(in_rom_q[1]), .B0(n579), .B1(in_rom_q[0]), .Y(
        n574) );
  AOI211XL U605 ( .A0(n578), .A1(in_rom_q[4]), .B0(n676), .C0(n574), .Y(n583)
         );
  NAND2XL U606 ( .A(n575), .B(in_rom_q[5]), .Y(n582) );
  AO22X1 U607 ( .A0(n576), .A1(in_rom_q[3]), .B0(n575), .B1(in_rom_q[7]), .Y(
        n577) );
  AOI211XL U608 ( .A0(n578), .A1(in_rom_q[6]), .B0(n677), .C0(n577), .Y(n581)
         );
  NAND2XL U609 ( .A(n579), .B(in_rom_q[2]), .Y(n580) );
  AO22X1 U610 ( .A0(n583), .A1(n582), .B0(n581), .B1(n580), .Y(n586) );
  INVXL U611 ( .A(n586), .Y(n588) );
  AOI2BB2X1 U612 ( .B0(n587), .B1(n588), .A0N(n587), .A1N(n588), .Y(n592) );
  NAND2XL U613 ( .A(n592), .B(n720), .Y(n614) );
  NOR2X1 U614 ( .A(n1760), .B(n270), .Y(n715) );
  NAND2X1 U615 ( .A(n272), .B(n715), .Y(n597) );
  INVX1 U616 ( .A(n674), .Y(n615) );
  NOR2XL U617 ( .A(n614), .B(n615), .Y(n590) );
  NOR2X2 U618 ( .A(n720), .B(n615), .Y(n706) );
  NOR4XL U619 ( .A(n220), .B(kernel_x[0]), .C(n221), .D(n219), .Y(n584) );
  NAND2XL U620 ( .A(kernel_x[4]), .B(n584), .Y(n621) );
  NAND3XL U621 ( .A(n147), .B(kernel_y[4]), .C(kernel_y[2]), .Y(n585) );
  NOR3XL U622 ( .A(n148), .B(n224), .C(n585), .Y(n622) );
  OA21XL U623 ( .A0(n587), .A1(n586), .B0(n275), .Y(n670) );
  NAND2XL U624 ( .A(n588), .B(n587), .Y(n591) );
  NOR2XL U625 ( .A(n670), .B(n668), .Y(n612) );
  NAND3BX1 U626 ( .AN(n621), .B(n622), .C(n666), .Y(n593) );
  NOR4XL U627 ( .A(sram_write), .B(update_color), .C(n705), .D(n593), .Y(n589)
         );
  NOR3XL U628 ( .A(n719), .B(n721), .C(n724), .Y(n619) );
  NAND3XL U629 ( .A(n619), .B(g_y[4]), .C(g_y[3]), .Y(n648) );
  NOR3BX1 U630 ( .AN(g_x[1]), .B(n648), .C(n729), .Y(n637) );
  AND4X1 U631 ( .A(n637), .B(g_x[2]), .C(g_x[4]), .D(g_x[3]), .Y(n610) );
  NAND2XL U632 ( .A(n706), .B(n672), .Y(n613) );
  NOR2X1 U633 ( .A(n613), .B(n731), .Y(n686) );
  AOI21XL U634 ( .A0(n613), .A1(n731), .B0(n686), .Y(n248) );
  OAI21X1 U635 ( .A0(n597), .A1(n614), .B0(n722), .Y(n713) );
  NAND2XL U636 ( .A(g_y[0]), .B(n713), .Y(n712) );
  AOI21XL U637 ( .A0(n724), .A1(n712), .B0(n711), .Y(n261) );
  NOR2X1 U638 ( .A(new_color), .B(n592), .Y(n671) );
  OAI31XL U639 ( .A0(sram_write), .A1(n705), .A2(n593), .B0(update_color), .Y(
        n594) );
  NAND2XL U640 ( .A(n707), .B(n594), .Y(n268) );
  OA21X2 U641 ( .A0(n595), .A1(n597), .B0(n722), .Y(n726) );
  OAI22XL U642 ( .A0(kernel_x[0]), .A1(n606), .B0(n733), .B1(n607), .Y(n599)
         );
  NAND2XL U643 ( .A(g_x[0]), .B(n692), .Y(n598) );
  OAI211XL U644 ( .A0(n212), .A1(n560), .B0(n599), .C0(n598), .Y(n253) );
  AOI22XL U645 ( .A0(g_x[3]), .A1(n692), .B0(N97), .B1(n606), .Y(n601) );
  NAND2XL U646 ( .A(n607), .B(kernel_x[3]), .Y(n600) );
  OAI211XL U647 ( .A0(n209), .A1(n560), .B0(n601), .C0(n600), .Y(n250) );
  AOI22XL U648 ( .A0(g_x[4]), .A1(n692), .B0(n660), .B1(n606), .Y(n603) );
  NAND2XL U649 ( .A(kernel_x[4]), .B(n607), .Y(n602) );
  OAI211XL U650 ( .A0(n208), .A1(n560), .B0(n603), .C0(n602), .Y(n249) );
  AOI22XL U651 ( .A0(g_x[2]), .A1(n692), .B0(N96), .B1(n606), .Y(n605) );
  NAND2XL U652 ( .A(n607), .B(kernel_x[2]), .Y(n604) );
  OAI211XL U653 ( .A0(n210), .A1(n560), .B0(n605), .C0(n604), .Y(n251) );
  AOI22XL U654 ( .A0(g_x[1]), .A1(n692), .B0(N95), .B1(n606), .Y(n609) );
  NAND2XL U655 ( .A(n607), .B(kernel_x[1]), .Y(n608) );
  OAI211XL U656 ( .A0(n211), .A1(n560), .B0(n609), .C0(n608), .Y(n252) );
  NAND2XL U657 ( .A(color[1]), .B(n686), .Y(n685) );
  NOR2X1 U658 ( .A(n734), .B(n685), .Y(n684) );
  AOI21XL U659 ( .A0(n734), .A1(n685), .B0(n684), .Y(n246) );
  NAND2XL U660 ( .A(color[3]), .B(n684), .Y(n683) );
  AOI21XL U661 ( .A0(n736), .A1(n683), .B0(n682), .Y(n244) );
  INVXL U662 ( .A(n713), .Y(n647) );
  NOR2XL U663 ( .A(n648), .B(n647), .Y(n611) );
  AOI2BB2X1 U664 ( .B0(g_x[0]), .B1(n611), .A0N(g_x[0]), .A1N(n611), .Y(N172)
         );
  NAND2XL U665 ( .A(n612), .B(n728), .Y(n699) );
  NAND3XL U666 ( .A(n667), .B(new_color), .C(n699), .Y(n620) );
  OAI22XL U667 ( .A0(kernel_x[0]), .A1(n657), .B0(n733), .B1(n658), .Y(
        kernel_x_w[0]) );
  AOI22XL U668 ( .A0(g_y[2]), .A1(n554), .B0(N172), .B1(n662), .Y(n618) );
  OAI2BB2XL U669 ( .B0(kernel_x[0]), .B1(n732), .A0N(kernel_x[0]), .A1N(n659), 
        .Y(n616) );
  AOI32XL U670 ( .A0(n667), .A1(n706), .A2(kernel_x_w[0]), .B0(n616), .B1(n706), .Y(n617) );
  OAI211XL U671 ( .A0(n365), .A1(n665), .B0(n618), .C0(n617), .Y(rom_a_w[2])
         );
  NAND2XL U672 ( .A(n619), .B(n713), .Y(n631) );
  AOI2BB2X1 U673 ( .B0(g_y[4]), .B1(n630), .A0N(g_y[4]), .A1N(n630), .Y(N171)
         );
  NOR3X1 U674 ( .A(n705), .B(n621), .C(n620), .Y(n710) );
  INVXL U675 ( .A(n710), .Y(n632) );
  AOI2BB2X1 U676 ( .B0(kernel_y[4]), .B1(r489_carry[4]), .A0N(kernel_y[4]), 
        .A1N(r489_carry[4]), .Y(n623) );
  NOR2X1 U677 ( .A(n622), .B(n632), .Y(n709) );
  AO22X1 U678 ( .A0(n632), .A1(kernel_y[4]), .B0(n623), .B1(n709), .Y(n556) );
  AOI22XL U679 ( .A0(g_y[1]), .A1(n554), .B0(N171), .B1(n662), .Y(n629) );
  INVXL U680 ( .A(n633), .Y(n625) );
  NAND2XL U681 ( .A(kernel_y[4]), .B(r489_carry[4]), .Y(n624) );
  OAI211XL U682 ( .A0(kernel_y[4]), .A1(r489_carry[4]), .B0(n625), .C0(n624), 
        .Y(n626) );
  OAI2BB2XL U683 ( .B0(n667), .B1(n626), .A0N(n633), .A1N(kernel_y[4]), .Y(
        n627) );
  AOI32XL U684 ( .A0(n667), .A1(n706), .A2(n556), .B0(n627), .B1(n706), .Y(
        n628) );
  OAI211XL U685 ( .A0(n366), .A1(n665), .B0(n629), .C0(n628), .Y(rom_a_w[1])
         );
  AOI21XL U686 ( .A0(n735), .A1(n631), .B0(n630), .Y(N170) );
  AO22X1 U687 ( .A0(kernel_y[3]), .A1(n632), .B0(N104), .B1(n709), .Y(n555) );
  NOR2XL U688 ( .A(n667), .B(n633), .Y(n675) );
  AOI222XL U689 ( .A0(n555), .A1(n667), .B0(n675), .B1(N104), .C0(kernel_y[3]), 
        .C1(n633), .Y(n634) );
  AOI2BB2X1 U690 ( .B0(N170), .B1(n662), .A0N(n634), .A1N(n705), .Y(n636) );
  NAND2XL U691 ( .A(g_y[0]), .B(n554), .Y(n635) );
  OAI211XL U692 ( .A0(n367), .A1(n665), .B0(n636), .C0(n635), .Y(rom_a_w[0])
         );
  AOI2BB2X1 U693 ( .B0(g_x[2]), .B1(n642), .A0N(g_x[2]), .A1N(n642), .Y(N174)
         );
  INVXL U694 ( .A(N96), .Y(n638) );
  OAI22XL U695 ( .A0(n220), .A1(n658), .B0(n638), .B1(n657), .Y(kernel_x_w[2])
         );
  AOI222XL U696 ( .A0(kernel_x_w[2]), .A1(n667), .B0(n197), .B1(N96), .C0(
        kernel_x[2]), .C1(n659), .Y(n639) );
  AOI2BB2X1 U697 ( .B0(N174), .B1(n662), .A0N(n639), .A1N(n705), .Y(n641) );
  NAND2XL U698 ( .A(g_y[4]), .B(n554), .Y(n640) );
  OAI211XL U699 ( .A0(n363), .A1(n665), .B0(n641), .C0(n640), .Y(rom_a_w[4])
         );
  AOI2BB2X1 U700 ( .B0(g_x[3]), .B1(n654), .A0N(g_x[3]), .A1N(n654), .Y(N175)
         );
  INVXL U701 ( .A(N97), .Y(n643) );
  OAI22XL U702 ( .A0(n219), .A1(n658), .B0(n643), .B1(n657), .Y(kernel_x_w[3])
         );
  AOI222XL U703 ( .A0(kernel_x_w[3]), .A1(n667), .B0(n197), .B1(N97), .C0(
        kernel_x[3]), .C1(n659), .Y(n644) );
  AOI2BB2X1 U704 ( .B0(N175), .B1(n662), .A0N(n644), .A1N(n705), .Y(n646) );
  NAND2XL U705 ( .A(g_x[0]), .B(n554), .Y(n645) );
  OAI211XL U706 ( .A0(n362), .A1(n665), .B0(n646), .C0(n645), .Y(rom_a_w[5])
         );
  NOR3XL U707 ( .A(n648), .B(n729), .C(n647), .Y(n649) );
  AOI2BB2X1 U708 ( .B0(g_x[1]), .B1(n649), .A0N(g_x[1]), .A1N(n649), .Y(N173)
         );
  INVXL U709 ( .A(N95), .Y(n650) );
  OAI22XL U710 ( .A0(n221), .A1(n658), .B0(n650), .B1(n657), .Y(kernel_x_w[1])
         );
  AOI222XL U711 ( .A0(kernel_x_w[1]), .A1(n667), .B0(n197), .B1(N95), .C0(
        kernel_x[1]), .C1(n659), .Y(n651) );
  AOI2BB2X1 U712 ( .B0(N173), .B1(n662), .A0N(n651), .A1N(n705), .Y(n653) );
  NAND2XL U713 ( .A(g_y[3]), .B(n554), .Y(n652) );
  OAI211XL U714 ( .A0(n364), .A1(n665), .B0(n653), .C0(n652), .Y(rom_a_w[3])
         );
  AND2X1 U715 ( .A(g_x[3]), .B(n654), .Y(n655) );
  AOI2BB2X1 U716 ( .B0(g_x[4]), .B1(n655), .A0N(g_x[4]), .A1N(n655), .Y(N176)
         );
  INVXL U717 ( .A(n660), .Y(n656) );
  OAI22XL U718 ( .A0(n658), .A1(n730), .B0(n657), .B1(n656), .Y(kernel_x_w[4])
         );
  AOI222XL U719 ( .A0(kernel_x_w[4]), .A1(n667), .B0(n197), .B1(n660), .C0(
        kernel_x[4]), .C1(n659), .Y(n661) );
  AOI2BB2X1 U720 ( .B0(N176), .B1(n662), .A0N(n661), .A1N(n705), .Y(n664) );
  NAND2XL U721 ( .A(g_x[1]), .B(n554), .Y(n663) );
  OAI211XL U722 ( .A0(n361), .A1(n665), .B0(n664), .C0(n663), .Y(rom_a_w[6])
         );
  NAND2XL U723 ( .A(color[5]), .B(n682), .Y(n681) );
  AOI21XL U724 ( .A0(n738), .A1(n681), .B0(n680), .Y(n242) );
  CLKBUFX3 U725 ( .A(n558), .Y(n741) );
  CLKBUFX3 U726 ( .A(n558), .Y(n740) );
  OAI32XL U727 ( .A0(sram_reset), .A1(n715), .A2(n737), .B0(n272), .B1(n722), 
        .Y(n179) );
  NAND3BX1 U728 ( .AN(n666), .B(n706), .C(n728), .Y(n669) );
  NAND2XL U729 ( .A(n706), .B(n667), .Y(n700) );
  INVXL U730 ( .A(n700), .Y(n701) );
  OAI22XL U731 ( .A0(n668), .A1(n669), .B0(n274), .B1(n701), .Y(n264) );
  OAI22XL U732 ( .A0(n670), .A1(n669), .B0(n275), .B1(n701), .Y(n259) );
  NAND2XL U733 ( .A(n671), .B(n674), .Y(n673) );
  AOI32XL U734 ( .A0(n674), .A1(n673), .A2(n672), .B0(n720), .B1(n673), .Y(
        n267) );
  AO22X1 U736 ( .A0(n705), .A1(n689), .B0(n706), .B1(n675), .Y(n265) );
  OAI2BB2XL U737 ( .B0(n147), .B1(n710), .A0N(n147), .A1N(n709), .Y(
        kernel_y_w[0]) );
  OA22X1 U738 ( .A0(n726), .A1(rom_a[0]), .B0(n560), .B1(rom_a_w[0]), .Y(
        ex_sram_a_w[0]) );
  OA22X1 U739 ( .A0(n726), .A1(rom_a[1]), .B0(n560), .B1(rom_a_w[1]), .Y(
        ex_sram_a_w[1]) );
  OA22X1 U740 ( .A0(n726), .A1(rom_a[2]), .B0(n560), .B1(rom_a_w[2]), .Y(
        ex_sram_a_w[2]) );
  OA22X1 U741 ( .A0(n726), .A1(rom_a[3]), .B0(n560), .B1(rom_a_w[3]), .Y(
        ex_sram_a_w[3]) );
  OA22X1 U742 ( .A0(n726), .A1(rom_a[4]), .B0(n560), .B1(rom_a_w[4]), .Y(
        ex_sram_a_w[4]) );
  OA22X1 U743 ( .A0(n726), .A1(rom_a[5]), .B0(n560), .B1(rom_a_w[5]), .Y(
        ex_sram_a_w[5]) );
  OA22X1 U744 ( .A0(n726), .A1(rom_a[6]), .B0(n560), .B1(rom_a_w[6]), .Y(
        ex_sram_a_w[6]) );
  OAI222XL U745 ( .A0(n702), .A1(n678), .B0(n707), .B1(n1740), .C0(n560), .C1(
        n183), .Y(n225) );
  OAI222XL U746 ( .A0(n702), .A1(n679), .B0(n707), .B1(n1730), .C0(n560), .C1(
        n184), .Y(n226) );
  OAI222XL U747 ( .A0(n559), .A1(n678), .B0(n707), .B1(n1720), .C0(n560), .C1(
        n185), .Y(n227) );
  OAI222XL U748 ( .A0(n559), .A1(n679), .B0(n707), .B1(n1710), .C0(n560), .C1(
        n186), .Y(n228) );
  AOI2BB2X1 U749 ( .B0(color[7]), .B1(n680), .A0N(color[7]), .A1N(n680), .Y(
        n241) );
  OA21XL U750 ( .A0(color[5]), .A1(n682), .B0(n681), .Y(n243) );
  OA21XL U751 ( .A0(color[3]), .A1(n684), .B0(n683), .Y(n245) );
  OA21XL U752 ( .A0(color[1]), .A1(n686), .B0(n685), .Y(n247) );
  OAI22XL U753 ( .A0(n689), .A1(kernel_y[3]), .B0(n718), .B1(N104), .Y(n687)
         );
  AOI2BB2X1 U754 ( .B0(g_y[3]), .B1(n692), .A0N(n697), .A1N(n687), .Y(n688) );
  OAI21XL U755 ( .A0(n214), .A1(n560), .B0(n688), .Y(n255) );
  NAND2XL U756 ( .A(n689), .B(r489_carry[4]), .Y(n690) );
  AOI2BB2X1 U757 ( .B0(kernel_y[4]), .B1(n690), .A0N(kernel_y[4]), .A1N(n690), 
        .Y(n691) );
  AOI2BB2X1 U758 ( .B0(g_y[4]), .B1(n692), .A0N(n697), .A1N(n691), .Y(n693) );
  OAI21XL U759 ( .A0(n213), .A1(n560), .B0(n693), .Y(n254) );
  OAI222XL U760 ( .A0(n698), .A1(n719), .B0(n697), .B1(n694), .C0(n560), .C1(
        n217), .Y(n258) );
  OAI222XL U761 ( .A0(n698), .A1(n724), .B0(n560), .B1(n216), .C0(n695), .C1(
        n697), .Y(n257) );
  OAI222XL U762 ( .A0(n721), .A1(n698), .B0(n697), .B1(n696), .C0(n560), .C1(
        n215), .Y(n256) );
  OAI22XL U763 ( .A0(n701), .A1(n728), .B0(n700), .B1(n699), .Y(n263) );
  OAI222XL U764 ( .A0(n707), .A1(n727), .B0(n560), .B1(n187), .C0(n703), .C1(
        n702), .Y(n229) );
  OAI222XL U765 ( .A0(n707), .A1(n739), .B0(n560), .B1(n188), .C0(n704), .C1(
        n702), .Y(n230) );
  OAI222XL U766 ( .A0(n707), .A1(n725), .B0(n560), .B1(n189), .C0(n703), .C1(
        n559), .Y(n231) );
  OAI222XL U767 ( .A0(n707), .A1(n723), .B0(n560), .B1(n190), .C0(n704), .C1(
        n559), .Y(n232) );
  OAI22XL U768 ( .A0(n706), .A1(n197), .B0(n705), .B1(n732), .Y(n266) );
  OAI22XL U769 ( .A0(n151), .A1(n560), .B0(n731), .B1(n707), .Y(n240) );
  OAI2BB2XL U770 ( .B0(n153), .B1(n560), .A0N(color[1]), .A1N(n708), .Y(n239)
         );
  OAI22XL U771 ( .A0(n155), .A1(n560), .B0(n734), .B1(n707), .Y(n238) );
  OAI2BB2XL U772 ( .B0(n157), .B1(n560), .A0N(color[3]), .A1N(n708), .Y(n237)
         );
  OAI22XL U773 ( .A0(n159), .A1(n560), .B0(n736), .B1(n707), .Y(n236) );
  OAI2BB2XL U774 ( .B0(n161), .B1(n560), .A0N(color[5]), .A1N(n708), .Y(n235)
         );
  OAI22XL U775 ( .A0(n163), .A1(n560), .B0(n738), .B1(n707), .Y(n234) );
  OAI2BB2XL U776 ( .B0(n560), .B1(n165), .A0N(color[7]), .A1N(n708), .Y(n233)
         );
  OAI2BB2XL U777 ( .B0(n149), .B1(n710), .A0N(N108), .A1N(n709), .Y(
        kernel_y_w[2]) );
  OAI2BB2XL U778 ( .B0(n148), .B1(n710), .A0N(N107), .A1N(n709), .Y(
        kernel_y_w[1]) );
  AOI2BB2X1 U779 ( .B0(g_y[2]), .B1(n711), .A0N(g_y[2]), .A1N(n711), .Y(n262)
         );
  OA21XL U780 ( .A0(g_y[0]), .A1(n713), .B0(n712), .Y(n260) );
  OAI21XL U781 ( .A0(sram_reset), .A1(n272), .B0(n1760), .Y(n714) );
  OAI31XL U782 ( .A0(sram_reset), .A1(n1760), .A2(n272), .B0(n714), .Y(n178)
         );
  AOI31XL U783 ( .A0(n1760), .A1(n270), .A2(n722), .B0(n715), .Y(n717) );
  AOI21XL U784 ( .A0(n272), .A1(n1760), .B0(sram_reset), .Y(n716) );
  OAI22XL U785 ( .A0(n272), .A1(n717), .B0(n270), .B1(n716), .Y(n180) );
endmodule

