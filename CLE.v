`timescale 1ns/10ps
module CLE ( clk, reset, rom_q, rom_a, sram_a, sram_d, sram_wen, finish);
input         clk;
input         reset;
input  [7:0]  rom_q;
output [6:0]  rom_a;
output [9:0]  sram_a;
output [7:0]  sram_d;
output        sram_wen;
output        finish;

reg [6:0] rom_a_w, rom_a_r;
reg [9:0] sram_a_w, sram_a_r;
reg [9:0] sram_d_w, sram_d_r;
reg       sram_wen_w, sram_wen_r;
reg       finish_w, finish_r;
// output reg
assign rom_a = rom_a_r;
assign sram_a = sram_a_r;
assign sram_d = sram_d_r;
assign sram_wen = sram_wen_r;
assign finish = finish_r;

// DFS reg
// reg dfs[31:0][31:0], dfs_w [31:0][31:0];

// input
reg [7:0] in_rom_q;


reg sram_reset, sram_reset_w;
reg update_color, update_color_w;

// assign rom_counter = counter[1:0];
// assign read_rom_idx[0] = read_rom_idx[1] -  1;
// assign read_rom_idx[1] = 7 - (rom_counter << 1);
integer i,j;

// kernel 
reg [4:0] kernel_x, kernel_x_w; // 0 ~ 30
reg [4:0] kernel_y, kernel_y_w; // 0 ~ 30
reg [1:0] counter, counter_w;
reg kernel_counter [1:0]; //0 ~ 3
reg [4:0] x,y;
reg [4:0] n_x,n_y;
wire [4:0] g_x, g_y;    //global
wire [4:0] ng_x, ng_y;  //next global
reg [9:0] g_idx, g_idx_w;
assign g_x = g_idx[9:5];
assign g_y = g_idx[4:0];
assign ng_x = g_idx_w[9:5];
assign ng_y = g_idx_w[4:0];
reg same_flag, same_flag_w; 
reg diff_flag, diff_flag_w;
reg sram_write, sram_write_w;
reg [7:0] color, color_w; 
reg new_color, new_color_w;
// assign flag = same_flag & diff_flag;
reg [9:0] inter_counter, inter_counter_w;

// rom read 
wire [6:0] rom_addr;
assign rom_addr = (n_x << 2) + (n_y >> 3);
wire [3:0] read_rom_idx ;
reg [2:0] rom_counter, rom_counter_w;
assign read_rom_idx = (new_color) ? 7 - y[2:0] : 7 - g_y[2:0];

//external sram
reg [7:0] ex_sram_a;
wire [7:0] ex_sram_a_w;
reg [7:0] ex_sram_d, ex_sram_d_w;
// reg       ex_sram_wen, ex_sram_wen_w;
// reg       ex_sram_cen, ex_sram_cen_w;
wire ex_sram_wen, ex_sram_cen;
assign ex_sram_wen = sram_wen_r;
assign ex_sram_cen = 0;
wire [7:0] ex_sram_q_w;
reg  [7:0] ex_sram_q;
// assign ex_sram_a_w = ex_sram_wen_w ? {1'b0,rom_a_w} : {1'b0,rom_a_r};
assign ex_sram_a_w = sram_wen_w ? {1'b0,rom_a_w} : {1'b0,rom_a_r};

sram_256x8 test(
    .A(ex_sram_a),
    .D(ex_sram_d),
    .CLK(clk),
    .WEN(ex_sram_wen),
    .CEN(ex_sram_cen),
    .Q(ex_sram_q_w)
);
always@(*) begin
    // ex_sram_a_w = 
    case(counter)
    2'd0: begin
        x = kernel_x;
        y = kernel_y;
        n_x = kernel_x + 1;
        n_y = kernel_y;
    end
    2'd1: begin
        x = kernel_x + 1;
        y = kernel_y;
        n_x = kernel_x;
        n_y = kernel_y + 1;
    end
    2'd2: begin
        x = kernel_x;
        y = kernel_y + 1;
        n_x = kernel_x + 1;
        n_y = kernel_y + 1; 
    end
    2'd3: begin
        x = kernel_x + 1;
        y = kernel_y + 1;
        n_x = kernel_x_w;
        n_y = kernel_y_w;
    end
    endcase
            // in_rom_q[read_rom_idx];
end
// reg kernel_data [8:0];


always@(*) begin

    counter_w = counter ;
    g_idx_w = g_idx;
    same_flag_w = same_flag;
    diff_flag_w = diff_flag;
    sram_write_w = sram_write;
    inter_counter_w = inter_counter;
    rom_counter_w = rom_counter;
    rom_a_w = rom_a_r;
    sram_a_w = sram_a_r;
    sram_d_w = sram_d_r;
    sram_wen_w = 1;
    color_w = color;
    new_color_w = new_color;
    kernel_x_w = kernel_x;
    kernel_y_w = kernel_y;
    finish_r = 0;
    sram_reset_w = sram_reset;
    update_color_w = update_color;
    // external sram
    ex_sram_d_w = ex_sram_d;
    // ex_sram_wen_w = 1;
    // ex_sram_cen_w = ex_sram_cen;
    // for(i = 0; i < 32; i = i + 1) begin
    //     for(j = 0; j < 32; j = j + 1) begin
    //         dfs_w[i][j] = dfs[i][j];
    //     end
    // end
    // $display("x is %d y is %d",g_x,g_y);
    // $display("input is %d",in_rom_q[read_rom_idx]);
    // $display("reg is %d", dfs[g_x][g_y]);
    // $display((in_rom_q[read_rom_idx] == dfs[g_x][g_y]));
    // $display(ex_sram_q);// && (in_rom_q[read_rom_idx] == ex_sram_q[read_rom_idx]));
    if(sram_reset) begin
        // inter_counter_w = inter_counter + 1;
        // sram_a_w = inter_counter;
        g_idx_w = g_idx + 1;
        sram_a_w = g_idx;
        sram_d_w = 0;
        sram_wen_w = 0;
        rom_a_w  = sram_a_w;
        // ex_sram_a_w = inter_counter;
        ex_sram_d_w = 0;
        // ex_sram_wen_w = 0;
        // ex_sram_cen_w = 0;
        // if(inter_counter == 1023) begin
        if(g_idx == 1023) begin
            sram_reset_w = 0;
            rom_a_w = 0;
        end
    end
    else if(rom_counter != 4) begin
        rom_counter_w = rom_counter + 1;
        
    end
    else if(!new_color && (in_rom_q[read_rom_idx] == ex_sram_q[read_rom_idx]) ) begin
        // rom_read_w = 0;
        $display("global index: %d %d",g_x,g_y);
        rom_counter_w = 0;
        // update_color_w = 0;
        g_idx_w = g_idx + 1;
        rom_a_w = (ng_x << 2) + (ng_y >> 3);
        if(g_idx == 1023) begin
            finish_r = 1;
        end
    end
    else if(!new_color && (in_rom_q[read_rom_idx] != ex_sram_q[read_rom_idx])) begin
        $display("global index: %d %d", g_x,g_y);
        $display("new color: %d",color);
        rom_counter_w = 0;
        new_color_w = 1;
        // dfs_w[g_x][g_y] = 1;
        // $display(ex_sram_a);
        ex_sram_d_w = ex_sram_q;
        ex_sram_d_w[read_rom_idx] = 1;
        // ex_sram_wen_w = 0;
        // ex_sram_a = rom_a_r;
        update_color_w = 1;
        sram_a_w = {g_x,g_y};
        sram_d_w = color;
        sram_wen_w = 0;
        // rom_a_w = rom_addr;
        rom_a_w = 0;
    end 
    // else if(inter_counter == 1023) begin
    //     color_w = color + 1;
    //     rom_counter_w = 0;
    //     new_color_w = 0;
    //     update_color_w = 0;
    //     g_idx_w = g_idx + 1;
    //     inter_counter_w = 0;
    //     finish_r = 1;   
    //     if(color == 1) begin
    //     end
    //     rom_a_w = (ng_x << 2) + (ng_y >> 3);
    //     if(g_idx == 1023) begin
    //         finish_r = 1;
    //     end
    // end
    else if(new_color && !sram_write) begin
        counter_w = counter + 1;
        // $display("x is %d, y is %d",x,y);
        // $display("sram addr %d: ",ex_sram_a);
        same_flag_w = same_flag;
        diff_flag_w = diff_flag;
        rom_counter_w = 0;
        rom_a_w = rom_addr;
        if(in_rom_q[read_rom_idx] == 1) begin
            // if(dfs[x][y] == 1) begin
            // if()
            if(ex_sram_q[read_rom_idx] == 1) begin
                // $display(ex_sram_q[read_rom_idx]);
                same_flag_w = 1;
            end
            else begin
                diff_flag_w = 1;
            end
        end
        if(counter == 3) begin
            if(same_flag_w && diff_flag_w) begin
                sram_write_w = 1; 
            end
            else begin
                same_flag_w = 0;
                diff_flag_w = 0;
                kernel_x_w = kernel_x + 1;
                if(kernel_x == 30 && kernel_y != 30) begin
                    kernel_x_w = 0;
                    kernel_y_w = kernel_y + 1;
                end
                else if(kernel_x == 30 && kernel_y == 30) begin
                    kernel_x_w = 0;
                    kernel_y_w = 0;
                    // inter_counter_w = inter_counter + 1;
                    // $display("kernel_counter is %d",inter_counter);
                    if(update_color == 0) begin
                        if(g_idx == 1023) begin
                            finish_r = 1;
                        end
                        else begin
                            new_color_w = 0; 
                            color_w = color + 1;
                            rom_counter_w = 0; 
                            rom_a_w = (ng_x << 2) + (ng_y >> 3);
                        end
                    end
                    else begin
                        update_color_w = 0;
                    end
                end
                // kernel_x_w = (kernel_x == 30) ? 0 : kernel_x + 1;
                // kernel_y_w = (kernel_y == 30) ? 0 : kernel_y + 1; 
                // if(kernel_x == 30 && kernel_y == 30) begin
                //     inter_counter_w = inter_counter + 1;
                // end
            end
        end 
        else begin
        end
    end
    else if(new_color && sram_write) begin
        counter_w = counter + 1;
        rom_counter_w = 0;
        rom_a_w = rom_addr;
        if(in_rom_q[read_rom_idx] == 1 && ex_sram_q[read_rom_idx] == 0) begin
            // dfs_w[x][y] = 1; 
            ex_sram_d_w = ex_sram_q;
            ex_sram_d_w[read_rom_idx] = 1;
            // ex_sram_wen_w = 0;
            sram_a_w = {x,y};
            sram_d_w = color;
            sram_wen_w = 0;
            update_color_w = 1;
        end
        if(counter == 3) begin
            sram_write_w = 0; 
            same_flag_w = 0;
            diff_flag_w = 0;
            kernel_x_w = kernel_x + 1;
            if(kernel_x == 30 && kernel_y != 30) begin
                kernel_x_w = 0;
                kernel_y_w = kernel_y + 1;
            end
            else if(kernel_x == 30 && kernel_y == 30) begin
                kernel_x_w = 0;
                kernel_y_w = 0;
                // inter_counter_w = inter_counter + 1;
            end
            
        end
    end
        
end

always @ (posedge clk or posedge reset) begin
    
    if( reset == 1) begin 
        
        rom_a_r <= 0;
        in_rom_q <= 0;    
        counter <= 0;
        g_idx <= 0;
        same_flag <= 0;
        diff_flag <= 0;
        sram_write <= 0;
        // inter_counter <= 0;
        rom_counter <= 0;
        rom_a_r <= 0;
        sram_a_r <= 0;
        sram_d_r <= 0;
        sram_wen_r <= 1;
        color <= 1;
        new_color <= 0;
        kernel_x <= 0;
        kernel_y <= 0;
        sram_reset <= 1;
        update_color <= 0;

        ex_sram_a <= 0;
        ex_sram_d <= 0;
        // ex_sram_cen <= 0;
        // ex_sram_wen <= 0;
        ex_sram_q <= 0;
        // for(i = 0; i < 32; i = i + 1) begin
        //     for(j = 0; j < 32; j = j + 1) begin
        //         dfs[i][j] <= 0;
        //     end
        // end
    end
    else begin
        //sram
        in_rom_q <= rom_q;
        counter <= counter_w ;
        g_idx  <= g_idx_w;
        same_flag <= same_flag_w;
        diff_flag <= diff_flag_w;
        sram_write <= sram_write_w;
        // inter_counter <= inter_counter_w;
        rom_counter <= rom_counter_w;
        rom_a_r <= rom_a_w;
        sram_a_r <= sram_a_w;
        sram_d_r <= sram_d_w;
        sram_wen_r <= sram_wen_w;
        color <= color_w;
        new_color <= new_color_w;
        kernel_x <= kernel_x_w;
        kernel_y <= kernel_y_w;
        sram_reset <= sram_reset_w;
        update_color <= update_color_w;

        ex_sram_a <= ex_sram_a_w;
        ex_sram_d <= ex_sram_d_w;
        // ex_sram_cen <= ex_sram_cen_w;
        // ex_sram_wen <= ex_sram_wen_w;
        ex_sram_q <= ex_sram_q_w;
        // for(i = 0; i < 32; i = i + 1) begin
        //     for(j = 0; j < 32; j = j + 1) begin
        //         dfs[i][j] <= dfs_w[i][j];
        //     end
        // end
    end
end


endmodule



// 0 - 7 , 7 - 14 , 14 - 21 , 21 - 28 , 28 - 35, 
// 0 - 7 , 7 - 14 , 14 - 21 , 21 - 28 , 24 - 31,
// 0 - 7 , 7 - 14 , 14 - 20 , 20 - 25 , 26 - 31; 
// 0 1  2  3  4  5  6  7
// 7 8  9  10 11 12 13 14
// 7 14 15 16 17 18 19 20 
// 7 14 20 21 22 23 24 25
// 7 14 20 25 26 27 28 29
// 7 14 20 25 29 30 31