import os
import linter
import funct
import sys
sys.path.append('/home/shehroz/ArcheV')
import main
# llm settings
api = main.API()
LLM_settings = api.get_stored_values()
print(LLM_settings)



# Providing prompts to LLM
def read_file_content(file_path):
    with open(file_path, 'r') as file:
        return file.read().strip()

def read_files_from_directory(directory_path, extension):
    filenames = []
    contents = []

    # Check if the directory exists
    if not os.path.exists(directory_path):
        return filenames, contents

    # List files in the directory
    files_in_directory = os.listdir(directory_path)

    for filename in files_in_directory:
        if filename.endswith(extension):
            file_path = os.path.join(directory_path, filename)
            content = read_file_content(file_path)
            filenames.append(filename)
            contents.append(content)

    return contents, filenames

# Function to remove the file extension
def remove_extension(filename):
    return os.path.splitext(filename)[0]

propmpts_path = '/home/shehroz/ArcheV/prompts'  # for prompts
prompts, prompts_filename = read_files_from_directory(propmpts_path, ".txt")
json_file_path = "/home/shehroz/ArcheV/functional_verification"  # for function verification
json_files, json_names = read_files_from_directory(json_file_path, ".json")  # JSON files

def master_function(json_str, verilog_code):  # It will return the results
    # Syntactical verification
    syntactical_verification_results = linter.run_verilator_lint(verilog_code)
    # Functional verification
    functional_verification_results = funct.functional_verification(verilog_code, json_str)
    return syntactical_verification_results, functional_verification_results

def main():
    results = []  # List to store results for each iteration

    for i in range(len(prompts)):
        # Hardcoded the LLM code for testing The LLM class wll be used here I need verilog code here
        verilog_code = """  
module mux_2to1 (
    input wire a,
    input wire b,
    input wire sel,
    output wire y
);
    assign y = sel ? b : a;
endmodule
    
"""

        str = ""  # Initialize str to avoid UnboundLocalError

        prompt_name_without_extension = remove_extension(prompts_filename[i])

        for j in range(len(json_files)):  # This will find the prompt_file_name in JSON list
            json_name_without_extension = remove_extension(json_names[j])
            if prompt_name_without_extension == json_name_without_extension:
                str = "\n".join(json_files[j])
                break  # Once matched, exit the loop

        if str:  # Only proceed if str was assigned
            syntactical, functional = master_function(str, verilog_code)
            # Store syntactical and functional results along with the prompt name in the list
            results.append((syntactical, functional, prompt_name_without_extension))

    return results  # Return the list of results

results = main()
for result in results:
    print(result)