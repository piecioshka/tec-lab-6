module automat 
  (
    input x,
    input clk,
    input reset,
    output y
  );
  
  // 20 strona
  // http://zpt2.tele.pw.edu.pl/luba/ulog_w7a.pdf
  
  localparam [2:0] s1 = 3'd0, s2 = 3'd2, s3 = 3'd3, s4 = 3'd4, s5 = 3'd5;
  reg [2:0] state_reg, state_next;
  
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
            state_next = s3;
          else
            state_next = s2;
      s2: if(x)
            state_next = s5;
          else
            state_next = s4;
      s3: state_next = s5;
      s4: state_next = s1;
      s5: state_next = s1;
      default: state_next = s1;
    endcase
  end
 
  // wyjscie automatu	
	assign y = (state_reg == s4) & x;
	
  // do symulacji przejsc automatu
  reg [2*8-1:0] aut; // 2 znakowy string : char=8bitów

  always@*
    case(state_reg)
      s1: aut = "s1";
      s2: aut = "s2";
      s3: aut = "s3";
      s4: aut = "s4";
      s5: aut = "s5";
    endcase
  
endmodule