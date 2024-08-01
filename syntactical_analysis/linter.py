import subprocess



def run_verilator_lint(file_name):
    # Construct the command to execute
    command = f'verilator --lint-only {file_name}'

    # Execute the command using subprocess
    try:
        result = subprocess.run(command, shell=True, check=False)
         # Return the exit code
    except subprocess.CalledProcessError as e:
        print(f"Error running Verilator lint on {file_name}:")
        print(e)
    return result.returncode 
        # return -1  # Return -1 on error

def main():
    file_name = input("Enter the Verilog file name with extension: ")
    exit_code = run_verilator_lint(file_name)
    if exit_code == 0:
        print(f" Exit code: {exit_code}")
    else:
        print(f"Exit code: {exit_code}")

if __name__ == "__main__":
    main()
