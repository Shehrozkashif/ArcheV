import subprocess
import tempfile
import os
import json

def save_verilog_to_file(verilog_code, filename):
    with open(filename, 'w') as file:
        file.write(verilog_code)

def run_verilog_simulation(verilog_code, test_input):
    # Create a Verilog testbench module
    testbench_code = """
module testbench;
    reg a;
    reg b;
    reg sel;
    wire y;

    // Instantiate the design module
    mux2to1 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    // Apply the inputs and monitor the outputs
    initial begin
        // Apply the inputs
        a = {a};
        b = {b};
        sel = {sel};

        // Wait for some time to observe the output
        #10;

        // Print the output for checking
        $display("y = %b", y);

        // Finish the simulation
        $finish;
    end
endmodule
"""
    # Substitute test input values
    testbench_code = testbench_code.format(**test_input)

    # Save the Verilog code and testbench to a temporary file
    with tempfile.NamedTemporaryFile(delete=False, suffix=".v") as temp_file:
        temp_verilog_file = temp_file.name
        save_verilog_to_file(verilog_code + '\n' + testbench_code, temp_verilog_file)

    # Compile the Verilog code
    compile_command = f"iverilog -o simulation.out {temp_verilog_file}"
    try:
        subprocess.run(compile_command, shell=True, check=True, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
    except subprocess.CalledProcessError as e:
        
        os.remove(temp_verilog_file)
        raise

    # Run the simulation and capture the output
    run_command = "vvp simulation.out"
    try:
        result = subprocess.run(run_command, shell=True, check=True, capture_output=True, text=True)
    except subprocess.CalledProcessError as e:
    
        os.remove(temp_verilog_file)
        os.remove("simulation.out")
        raise

    # Clean up the temporary Verilog file
    os.remove(temp_verilog_file)
    os.remove("simulation.out")

    return result.stdout

def functional_verification(verilog_code, json_string):
    try:
        # Load test cases from the JSON string
        test_cases = json.loads(json_string)["test_cases"]
    except json.JSONDecodeError as e:
       
        return 'failed'

    for test_case in test_cases:
        # Extract input and expected output from the test case
        test_input = test_case["input"]
        expected_output = test_case["expected_output"]

        # Run the Verilog simulation with the provided inputs
        output = run_verilog_simulation(verilog_code, test_input)

        # Extract output from simulation result
        output_dict = {}
        for line in output.strip().splitlines():
            if "y =" in line:
                _, value = line.split("=")
                output_dict["y"] = int(value.strip())

        # Compare the actual output to the expected output
        if output_dict != expected_output:
          
            return 'failed'

    return 'passed'

# Example Verilog code
verilog_code = """
module mux2to1 (
    input wire a,    // Input 1
    input wire b,    // Input 2
    input wire sel,  // Select line
    output wire y    // Output
);

assign y = (sel) ? b : a;

endmodule
"""

# Example JSON string
json_string = """
{
    "test_cases": [
        {
            "input": {
                "a": 0,
                "b": 1,
                "sel": 0
            },
            "expected_output": {
                "y": 0
            }
        },
        {
            "input": {
                "a": 0,
                "b": 1,
                "sel": 1
            },
            "expected_output": {
                "y": 1
            }
        }
    ]
}
"""

result = functional_verification(verilog_code, json_string)

