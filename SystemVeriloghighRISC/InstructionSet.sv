// InstructionSetPkg
//
// C T Clarke
//
// 10/10/17
//
// This package is used to define all the values and types 
// needed for the highRisc instruction set.

package InstructionSetPkg;
 
   // CHANGE THIS PARAMETER to 4 for testing the ALU on the 
	// FPGA. This is because the hardware doesn't have enough
	// switches. For simulation, and the overall processor 
	// configuration, set the value to 16.
	parameter DataWidth       = 16;
	
	// An example of an enumerated type that defines the names
	// for all of the instruction set opcodes.
	typedef enum logic [3:0] 
	{
		JR    = 4'd0,
		LOAD  = 4'd1, 
		STORE = 4'd2, 
		MOVE  = 4'd3,
		NAND  = 4'd4,
		NOR   = 4'd5,
		ROL   = 4'd6, 
		ROR   = 4'd7, 
		LIL   = 4'd8, 
		LIU   = 4'd9, 
		ADC   = 4'd10, 
		SUB   = 4'd11, 
		DIV   = 4'd12, 
		MOD   = 4'd13, 
		MUL   = 4'd14, 
		MUH   = 4'd15
	} eOperation;

	// An example of a structure used to combine the different
	// flags together so they can be refered to as a group.
	typedef struct packed
	{
		logic Overflow;
		logic Parity;
		logic Negative;
		logic Zero;
		logic Carry;
	} sFlags;
  
	// This setup works well for dataWidth values of 4 and 16
	// It is not tested for other values
	parameter ImmediateWidth     =    DataWidth/3  + DataWidth%3;
	parameter ImmediateMidStart  =    DataWidth/3  + DataWidth%3;
	parameter ImmediateHighStart = 2*(DataWidth/3) + DataWidth%3;

	// Sizes of various busses and bit positions
	parameter AddressWidth    = 16;
	parameter RfAddressWidth  =  6;
	parameter MemAddressWidth = 16;
	parameter OffsetWidth     =  9;
	parameter OpCodeStart     = 12;
	parameter OpCodeSize      =  4;
	parameter RegAStart       =  6;
	parameter RegASize        =  6;
	parameter RegBStart       =  0;
	parameter RegBSize        =  6;
	
	// The Register numbers of the flags and program counter
	// registers.
	typedef enum {SPECIAL_PC = 63,SPECIAL_FL = 62} eSpecials;

endpackage
