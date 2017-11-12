module RegisterFileTb();
	logic        Clock = 0;
	logic [5:0]  AddressA;
	logic [15:0] ReadDataA;
	logic [15:0] WriteData;
	logic        WriteEnable;
	logic [5:0]  AddressB;
	logic [15:0] ReadDataB;

	RegisterFile uut (.*);

   default clocking @(posedge Clock);
	endclocking
	
	always  #10  Clock++;

   initial
	begin
		AddressA    = 6'd0;
		WriteData   = 16'h0000;
		WriteEnable = '0;
		AddressB    = 6'd0;
		##1;
	end

endmodule
