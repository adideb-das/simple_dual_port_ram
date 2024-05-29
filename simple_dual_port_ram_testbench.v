`include "simple_dual_port_ram.v"

module simple_dual_port_ram_testbench;
    //input
    reg clock;
    reg wr_en;
    reg [7:0] data_in;
    reg [3:0] addr_in_p0; 
    reg [3:0] addr_in_p1;
    reg port_en_0;
    reg port_en_1; 
    //output
    wire [7:0] data_output_0;
    wire [7:0] data_output_1;


    integer i;

    simple_dual_port_ram dut(clock,wr_en, data_in,addr_in_p0,addr_in_p1,port_en_0, port_en_1,data_output_0,data_output_1);

    always 
    #5 clock= ~clock;


    initial begin

            $dumpfile("dual_port_ram_timing_diagram.vcd");// timing diagram is generated
            $dumpvars(0,simple_dual_port_ram_testbench); // dumping the variables in the timing diagram


    end

    initial begin
    clock=1;
    addr_in_p1=0;
    port_en_0=0;
    port_en_1=0;
    wr_en=0;
    data_in=0;
    addr_in_p0=0;
    #20;

    //write all locations of RAM
    port_en_0=1;
    wr_en=1;

    for(i=0;i<15;i++)begin
        data_in=i+1;
        addr_in_p0=i;
        #10;    
    end
    

    //read from port 1, all location of RAM
    wr_en=0;
    port_en_0=0;
    port_en_1=1;
    for(i=0;i<15;i++)begin
        addr_in_p1=i;
        #10;
    end
    port_en_1=0;
    end
endmodule