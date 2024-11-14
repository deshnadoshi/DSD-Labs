module testbench_top();

    logic clk, rst;
    logic [1:0] sw; // Address for instruction memory
    logic [31:0] ALUResult;
    logic [31:0] RD1, RD2;
    logic [31:0] prode_register_file;
    logic [31:0] prode_data_memory; // For data memory debugging
    logic [6:0] display_led; // Debugging display output

    top uut(
        .clk(clk), .rst(rst),
        .sw(sw), // Address for instruction memory
        .ALUResult(ALUResult),
        .RD1(RD1), .RD2(RD2),
        .prode_register_file(prode_register_file),
        .prode_data_memory(prode_data_memory), // New data memory probe
        .display_led(display_led) // New display output
    );

    // Generate Reset Signal
    initial begin
        rst = 0;
        #50 rst = 1;
    end

    // Generate Clock Signal
    initial begin
        clk = 0;
        forever #25 clk = ~clk;
    end

    // Test Different Instructions (0 = no-op, 1 = LW, 2 = SW)
    initial begin
        sw = 0; // No operation
        #100
        sw = 1; // Load Word (LW)
        #100
        sw = 2; // Store Word (SW)
    end

    // Monitor Signals for Debugging
    initial begin
        $monitor("Time: %0t | ALUResult: %h | RD1: %h | RD2: %h | Prode RF: %h | Prode DM: %h | Display: %b",
                 $time, ALUResult, RD1, RD2, prode_register_file, prode_data_memory, display_led);
    end

endmodule
