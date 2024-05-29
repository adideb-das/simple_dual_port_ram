module simple_dual_port_ram(
    input clock,//clock
    input wr_en,//write enable for port 0
    input [7:0] data_in,// input data to port 0
    input [3:0] addr_in_p0, //address for port 0
    input [3:0] addr_in_p1, //address for port 1
    input port_en_0, // enable port 0
    input port_en_1, // enable port 1
    output [7:0] data_output_0, //output data from port 0
    output [7:0] data_output_1 //output data from port 1
 );

//memory declaration 

reg [7:0] ram[15:0]; 
//RAM size as 16*8 bits, meaning 16 elements of 8 bits each

//writing to the RAM

always@(posedge clock)
begin
    if((port_en_0==1) && (wr_en==1))
         ram[addr_in_p0]<=data_in;
end

//always reading from ram , irrespective of clock
assign data_output_0=port_en_0 ? ram[addr_in_p0]: 'dZ;
assign data_output_1=port_en_1 ? ram[addr_in_p1]: 'dZ;

endmodule