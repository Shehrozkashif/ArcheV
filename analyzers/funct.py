import subprocess
import json
import os

from globals import TMP_VERILOG, TEST_BENCH, FUNCT_REF, ARCHEV_TMP


def functional_verification(file_name):
    test_bench = os.path.join(TEST_BENCH, file_name+'_tb.v')
    i = 0
    expected_outputs = [];        
    with open((os.path.join(FUNCT_REF, file_name+'.json')), 'r') as f:
        data = json.load(f)
    with open('input.txt', 'w') as f:
            for case in data['test_cases']:
                for x in range(len(list(case['input'].values()))):
                    f.write(f"{list(case['input'].values())[x]}")
                    i+=1
                f.write("\n")
    for case in data['test_cases']:
            expected_outputs.extend([str(value) for value in case['expected_output'].values()])
    subprocess.run(['iverilog', '-o', os.path.join(ARCHEV_TMP,'.out'), test_bench, TMP_VERILOG], capture_output=True, text=True)
    result = subprocess.run(['vvp', 'simulation.out'], capture_output=True, text=True)
    output_array = result.stdout.split('\n')
    json_result_arr = [x.strip() for x in output_array if x.strip() != "-"]
    return expected_outputs == json_result_arr[:-1]