module ProgramCounter
	(
		input	Clock,
		input	Reset,
		input	[15:0]LoadValue,
		input	LoadEnable,
		input	[8:0]Offset,
		input	OffsetEnable,
		output	[15:0]CounterValue);

	always_comb
	begin
		if (Reset)
			CounterValue = '0;
		else if (LoadEnable)
			CounterValue = LoadValue;
		else if (OffsetEnable)
			CounterValue = CounterValue + Offset;
		else
			CounterValue = CounterValue + 0'b1;
	end
endmodule // ProgramCounter
