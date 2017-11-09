module RegisterFile (
	input Clock,
	input logic [5:0]AddressA,
	output logic [15:0]ReadDataA,
	input [15:0]WriteData,
	input WriteEnable,
	input [5:0]AddressB,
	output [15:0]ReadDataB
);//initialise inputs and outputs

logic [15:0]Registers[64];

always_ff @ (posedge Clock)
	begin 

	end

endmodule //RegisterFile