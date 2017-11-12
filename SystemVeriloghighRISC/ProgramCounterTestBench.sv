// ProgramCounterTestBench
//
// C T Clarke
//
// October 2015
//
// This module implements a testbench for 
// the Program Counter to be created in the
// Digital Systems Design tutorial.
module ProgramCounterTestBench();

	// These are the signals that connect to 
	// the program counter
	logic              	Clock;
	logic              	Reset;
	logic        [15:0]	LoadValue;
	logic						LoadEnable;
	logic signed  [8:0]	Offset;
	logic 					OffsetEnable;
	logic        [15:0]	CounterValue;

	// this is the instantiation of the program 
	// counter
	ProgramCounter uut
	(
		.Clock,
		.Reset,
		.LoadValue,
		.LoadEnable,
		.Offset,
		.OffsetEnable,
		.CounterValue
	);
	
	default clocking @(posedge Clock);
	endclocking
		
	always  #10  Clock++;

	initial
	begin
	  // Start by initialising all values
	  Clock			= '0;
	  Reset			= '1;
	  LoadValue		= '0;
	  LoadEnable		= '0;
	  Offset			= '0;
	  OffsetEnable		= '0;

	  // Once the reset has had a chance to
	  // take effect, start counting sequentially
	  ##1 Reset   = '0;
	  // Counter Value should be 0
	  
	  // Check that setting a load value doesn't 
	  // affect the counter
	  ##5 LoadValue    = 16'd1000;
	  // Counter Value should be 5
	  
	  // Raise the load enable signal for a single
	  // cycle to check that it works
	  ##5 LoadEnable   = '1;
	  ##1 LoadEnable   = '0;
	  // Counter Value should be 1000
	  
	  // Check that setting an offset value doesn't 
	  // affect the counter
	  ##5 Offset	    = -16'd200;
	  // Counter Value should be 1005
	  
	  // Raise the offset enable signal for a single
	  // cycle to check that it works
	  ##5 OffsetEnable   = '1;
	  ##1 OffsetEnable   = '0;
	  // Counter Value should be 810
	end
	
endmodule
	
