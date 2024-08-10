import os
import sys

from llama_cpp import Llama
from llm_interface import llm_interface
from syntactical_analysis import linter
from functional_verification import funct


# Add the directory containing main.py to the Python path
sys.path.append('/home/shehroz/ArcheV')

# Import the Api class from main.py
from main import Api


# Instantiate the Api class
api_instance = Api()


# Call the submit_form method
submit_form = api_instance.submit_form()


# Using variables from the Api class
model_path = api_instance.llm_path
context_number = api_instance.context_number
gpu_layers = api_instance.gpu_layers


llm = Llama(model_path, context_number, gpu_layers)


# Reading the prompts from the folder
def read_prompts_from_directory(directory_path):
    prompts = []

    for filename in os.listdir(directory_path):
        if filename.endswith(".txt"):
            file_path = os.path.join(directory_path, filename)

            with open(file_path, 'r') as file:
                prompt = file.read().strip()
                prompts.append(prompt)

    return prompts


directory_path = '/home/shehroz/ArcheV/prompts'
user_prompts = read_prompts_from_directory(directory_path)

sys_prompt = "Write a Verilog module for the following module description."


# Providing a list of prompts to the llm interface
verilog_code = llm_interface.llm_response(sys_prompt, user_prompts)


print(verilog_code)


# Passing the Verilog code to linter.py
syntax_results = linter.run_verilator_lint(verilog_code)  # linter will provide the result pass or fail


# functional verification

# a verilog file and  the llm output will be compared if they were same the llm will passed the functional verification test 

def read_verilog_file(file_path):
    """
    Reads the contents of a Verilog file and returns it as a string.

    Args:
        file_path (str): The path to the Verilog file.

    Returns:
        str: The content of the Verilog file.
    """
    try:
        with open(file_path, 'r') as file:
            verilog_code = file.read()
        return verilog_code
    except FileNotFoundError:
        print(f"Error: The file at {file_path} was not found.")
        return None
    except IOError:
        print(f"Error: An IOError occurred while reading the file at {file_path}.")
        return None


verilog_file_path = '/home/shehroz/ArcheV/functional_verification/compare.v'  
output_file = read_verilog_file(verilog_file_path)




def functional_verification(syntax_results):
    if syntax_results == "pass":
        results_functional_verification =funct.run_verilog_simulation(syntax_results, output_file)
        
    
    return results_functional_verification

