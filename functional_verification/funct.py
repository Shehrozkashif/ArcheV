import subprocess
import tempfile
import os

def save_verilog_to_file(verilog_code, filename):
    with open(filename, 'w') as file:
        file.write(verilog_code)

def run_verilog_simulation(verilog_code, output_file):
    # Save the Verilog code to a temporary file
    with tempfile.NamedTemporaryFile(delete=False, suffix=".v") as temp_file:
        temp_verilog_file = temp_file.name
        save_verilog_to_file(verilog_code, temp_verilog_file)

    # Compile the Verilog code
    compile_command = f"iverilog -o simulation.out {temp_verilog_file}"
    subprocess.run(compile_command, shell=True, check=True)

    # Run the simulation and save output to file
    run_command = f"vvp simulation.out > {output_file}"
    subprocess.run(run_command, shell=True, check=True)

    # Clean up the temporary Verilog file
    os.remove(temp_verilog_file)

def compare_files_side_by_side(file1, file2, diff_file):
    with open(file1, 'r') as f1, open(file2, 'r') as f2:
        file1_lines = f1.readlines()
        file2_lines = f2.readlines()

    max_lines = max(len(file1_lines), len(file2_lines))

    with open(diff_file, 'w') as df:
        for i in range(max_lines):
            line1 = file1_lines[i].strip() if i < len(file1_lines) else ""
            line2 = file2_lines[i].strip() if i < len(file2_lines) else ""
            df.write(f"Arche-v (line {i+1}): {line1}\n")
            df.write(f"File (line {i+1}): {line2}\n")
            df.write("\n")

def functional_verification(verilog_code1, verilog_code2):
    output_file1 = "output1.txt"
    output_file2 = "output2.txt"
    diff_file = "diff.txt"
    
    # Run simulations
    run_verilog_simulation(verilog_code1, output_file1)
    run_verilog_simulation(verilog_code2, output_file2)
    
    # Compare outputs
    compare_files_side_by_side(output_file1, output_file2, diff_file)
    
    # Check if the diff file is empty
    with open(diff_file, 'r') as df:
        diff_content = df.read()
    
    # Return 'pass' if the outputs match, otherwise 'fail'
    if not diff_content.strip():  # Empty diff content means no differences
        return 'pass'
    else:
        return 'fail'
