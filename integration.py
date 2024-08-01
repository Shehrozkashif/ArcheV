from flask import Flask, request, jsonify, render_template
import webview
import os
import sys

sys.path.append('/home/shehroz/ArcheV/backend/Syntacticle_analysis/verilog(1)/verilog')
from linter import run_verilator_lint

# Define the template folder path
template_dir = '/home/shehroz/ArcheV/frontend/templates'
app = Flask(__name__, template_folder=template_dir)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/submit_form', methods=['POST'])
def submit_form():
    data = request.get_json()
    llm_path = data['llmPath']
    prompt = data['prompt']
    context_number = data['contextNumber']
    gpu_layers = data['gpuLayers']
    
    # Process the data or perform actions as needed
    response_message = f"LLM Path: {llm_path}, Prompt: {prompt}, Context Number: {context_number}, GPU Layers: {gpu_layers}"
    print(response_message)

    # Example: run linter
    # lint_result = run_verilator_lint(llm_path)

    return jsonify(message="Form submitted successfully!")

if __name__ == '__main__':
    # Start the Flask server
    app.run(debug=True, use_reloader=False)
    
    # Open the webview after the server starts
    webview.create_window('ArcheV', 'http://127.0.0.1:5000')
    webview.start()
