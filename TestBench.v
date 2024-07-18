module tb_clock;

    // Inputs
    reg Clk_1sec;
    reg reset;

    // Outputs
    wire [5:0] seconds;
    wire [5:0] minutes;
    wire [4:0] hours;
initial begin
$dumpfile("my.vcd");
$dumpvars;
end
    // Instantiate the Unit Under Test (UUT)
    Digital_Clock uut (
        .Clk_1sec(Clk_1sec), 
        .reset(reset), 
        .seconds(seconds), 
        .minutes(minutes), 
        .hours(hours)
    );
    
    //Generating the Clock with `1 Hz frequency
    initial Clk_1sec = 0;
    always #50000000 Clk_1sec = ~Clk_1sec;  //Every 0.5 sec toggle the clock.

    initial begin
        reset = 1;
        // Wait 100 ns for global reset to finish
        #100;
        reset = 0;  
    end
      
endmodule