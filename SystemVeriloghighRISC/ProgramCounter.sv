module ProgramCounter
	(
		input	Clock,
		input	Reset,
		input	[15:0]LoadValue,
		input	LoadEnable,
		input	[8:0]Offset,
		input	OffsetEnable,
		output	[15:0]CounterValue);

	always_ff @ (posedge Clock, posedge Reset, posedge LoadEnable, posedge OffsetEnable)
	begin
		if(Reset)				CounterValue <= '0;//Resets on positive
		else if (LoadEnable) 	CounterValue <= LoadValue; //Loads preset value into the PC
		else if (OffsetEnable)	CounterValue <= CounterValue + Offset; //Adds n offset to the PC
		else					CounterValue <= CounterValue + 16'b1; //default value, just increases the PC
	end
endmodule // ProgramCounter
