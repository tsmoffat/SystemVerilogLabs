module ProgramCounter
	(
		input	Clock,
		input	Reset,
		input	[15:0]LoadValue,
		input	LoadEnable,
		input	[8:0]Offset,
		input	OffsetEnable,
		output	[15:0]CounterValue);

	always_ff @ (posedge Clock, posedge Reset, posedge LoadEnable)
	begin
		if(Reset)				CounterValue <= '0;
		else if (LoadEnable) 	CounterValue <= LoadValue;
		else if (OffsetEnable)	CounterValue <= CounterValue + Offset;
		else					CounterValue <= CounterValue + 16'd1;
	end
endmodule // ProgramCounter
