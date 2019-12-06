module Random_3(
    input               RESET,    
    input               CLK,     
    input      [2:0]    Seed,     
    input               refresh,        
    output     [2:0]    Random_3_OUT  
);

    reg [2:0]random_3;
    assign Random_3_OUT = random_3;

    always@(posedge CLK) begin
        if(RESET)
            random_3 <= Seed;
        else if(refresh) begin
            random_3[0] <= random_3[2] ~^ random_3[1];
            random_3[1] <= random_3[0];
            random_3[2] <= random_3[1];
        end
    end

endmodule