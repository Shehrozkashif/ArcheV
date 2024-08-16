import subprocess
import tempfile
import os


verilog_code = """
module mux2to1 (
    input wire a,    // Input 1
    input wire b,    // Input 2
    input wire sel,  // Select line
    output wire y    // Output
);

assign y = (sel) ? b : ;

endmodule
"""


def run_verilator_lint(verilog_code):
    # Create a temporary file to hold the Verilog code
    with tempfile.NamedTemporaryFile(delete=False, suffix='.v') as temp_file:
        temp_file.write(verilog_code.encode('utf-8'))
        temp_file_path = temp_file.name

    # Construct the command to execute
    command = f'verilator --lint-only {temp_file_path}'

    # Execute the command using subprocess
    try:
        result = subprocess.run(command, shell=True, check=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        if result.returncode == 0:
            return "passed"
        else:
            return "failed"
    except subprocess.CalledProcessError:
        return "failed"
    finally:
        # Clean up the temporary file
        os.remove(temp_file_path)



status = run_verilator_lint(verilog_code)

