import subprocess
import tempfile
import os

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
            return "pass"
        else:
            return "failed"
    except subprocess.CalledProcessError:
        return "failed"
    finally:
        # Clean up the temporary file
        os.remove(temp_file_path)

# Example usage
verilog_code = """
module test;
    // Your Verilog code here
endmodule
"""

status = run_verilator_lint(verilog_code)
print(status)
