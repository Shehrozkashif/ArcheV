import subprocess
import difflib

def run_verilog_simulation(verilog_file, output_file):
    compile_command = f"iverilog -o simulation.out {verilog_file}"
    subprocess.run(compile_command, shell=True, check=True)
    
    run_command = f"vvp simulation.out > {output_file}"
    subprocess.run(run_command, shell=True, check=True)

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

def main():
    verilog_file1 = "adder.v adder_tb.v"
    verilog_file2 = "llm_adder.v adder_tb_llm.v"
    output_file1 = "output1.txt"
    output_file2 = "output2.txt"
    diff_file = "diff.txt"
    
    run_verilog_simulation(verilog_file1, output_file1)
    run_verilog_simulation(verilog_file2, output_file2)
    compare_files_side_by_side(output_file1, output_file2, diff_file)
    
if __name__ == "__main__":
    main()
