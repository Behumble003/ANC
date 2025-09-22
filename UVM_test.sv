module top;

    // Define the parameter with a default value.
    parameter  MAX_BANK = 8;

    // --- Class definition is now INSIDE the module ---
    class env;
        // Make sure the "rand" keyword is present for randomize() to work.
        rand bit [31:0] err_arr [MAX_BANK];

        function void print_arr;
            $display("----------------------------------------");
            $display(">> Printing array contents (size = %0d)", MAX_BANK);
            for (int i = 0; i < MAX_BANK; i++) begin
                $display("   err_arr[%2d] = 0x%h", i, err_arr[i]);
            end
            $display("----------------------------------------");
        endfunction
    endclass
    // --- End of class definition ---


    // Declare the handle for the class object
    env env0;

    initial begin
        $display(">> Starting Testbench...");

        // Create the object
        env0 = new();

        // Randomize it
        if (!env0.randomize()) begin
            $fatal(1, "Randomize FAILED!");
        end

        // Print the array
        env0.print_arr();

        $display(">> Testbench finished.");
        $finish;
    end

endmodule
