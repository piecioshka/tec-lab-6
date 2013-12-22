module mod5
  (
    input x,
    input clk,
    input reset,
    output [2:0] y
  );
  
  // automat More'a
    
  localparam [2:0] s0 = 3'd0, s1 = 3'd1, s2 = 3'd2, s3 = 3'd3, s4 = 3'd4;
  reg [2:0] state_reg, state_next;
  
  // rejestr automatu
  always@(posedge clk, posedge reset)
    if(reset)
      state_reg <= s0;
    else
      state_reg <= state_next;
      
  // przejscia automatu
  always@* begin
    case(state_reg)
      s0: if(x)
            state_next = s1;
          else
            state_next = s3;
      s1: if(x)
            state_next = s2;
          else
            state_next = s4;
      s2: if(x)
            state_next = s3;
          else
            state_next = s0;
      s3: if(x)
            state_next = s4;
          else
            state_next = s1;
      s4: if(x)
            state_next = s0;
          else
            state_next = s2;
      default: state_next = s0;
    endcase
  end
 
  // wyjscie automatu	
	assign y = state_reg;
	
  // do symulacji przejsc automatu
  reg [2*8-1:0] aut; // 2 znakowy string : char=8bitów

  always@*
    case(state_reg)
      s0: aut = "s0";
      s1: aut = "s1";
      s2: aut = "s2";
      s3: aut = "s3";
      s4: aut = "s4";
    endcase
  
endmodule
