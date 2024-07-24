# test_import.py
import sys
sys.path.append('/home/shehroz/ArcheV/backend/Syntacticle_analysis/verilog(1)/verilog')

try:
    from linter import run_verilator_lint
    print("Import successful!")
except ImportError as e:
    print(f"ImportError: {e}")
