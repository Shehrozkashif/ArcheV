import subprocess


def lint(file_path):
    result = subprocess.run(['verilator', '--lint-only', file_path], capture_output = True, text = True)
    return not result.returncode

