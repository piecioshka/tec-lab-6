module automat2
  (
    input x,
    input clk,
    input reset,
    output y
  );
    
  localparam [1:0] s1 = 2'd0, s2 = 2'd2, s3 = 2'd3;
  reg [1:0] state_reg, state_next;
  
  // rejestr automatu
  always@(posedge clk, posedge reset)
    if(reset)
      state_reg <= s1;
    else
      state_reg <= state_next;

  // przejscia automatu
  always@* begin
    case(state_reg)
      s1: if(x)
            state_next = s1; // 1
          else
            state_next = s2; // 0
      s2: if(x)
            state_next = s1; // 1
          else
            state_next = s3; // 0
      s3: if(x)
            state_next = s1; // 1
          else
            state_next = s3; // 0
      default: state_next = s1;
    endcase
  end
 
  // wyjscie automatu	
	assign y = (state_reg == s3) & x;
	
  // do symulacji przejsc automatu
  reg [2*8-1:0] aut; // 2 znakowy string : char=8bitów

  always@*
    case(state_reg)
      s1: aut = "s1";
      s2: aut = "s2";
      s3: aut = "s3";
    endcase
  
endmodule