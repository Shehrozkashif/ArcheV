
# ArcheV: RISC-V RV-32i RTL Benchmark

Welcome to ArcheV, a RISC-V RV-32i RTL Benchmark for evaluating Large Language Models, developed by merledu. This project utilizes [PyWebview](https://pywebview.flowrl.com/) to create a lightweight web-based user interface.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- **Python 3.6+**: Ensure Python is installed on your machine. Download it from [python.org](https://www.python.org/downloads/).
- **Pip**: Confirm that Pip, the Python package installer, is installed.
- **Virtual Environment (Optional but recommended)**: To manage dependencies, it's recommended to use a virtual environment:

  ```bash
  python3 -m venv .venv
  source .venv/bin/activate  # On Windows, use .venv\Scripts\activate
  ```

## Installation

1. **Clone the repository**:

    ```bash
    git clone https://github.com/Shehrozkashif/ArcheV.git
    cd ArcheV
    git checkout dev
    ```

2. **Install the dependencies**:

    If you're using a virtual environment, activate it first. Then, install the required packages using Pip:

    ```bash
    pip install -r requirements.txt
    ```

    If a `requirements.txt` file is not present, you can install PyWebview directly:

    ```bash
    pip install pywebview
    ```

3. **Run the application**:

    Execute the main Python file to launch the PyWebview interface:

    ```bash
    python main.py
    ```

## Usage

After running the application, a window with the web-based UI will appear, allowing you to interact with the ArcheV benchmarking tool.

## Contributing

To contribute to this project:

1. Fork this repository.
2. Create a branch: `git checkout -b feature-name`.
3. Make your changes and commit them: `git commit -m 'Add some feature'`.
4. Push to the original branch: `git push origin feature-name`.
5. Create a pull request.

Please refer to the [CONTRIBUTING.md](CONTRIBUTING.md) file for detailed contribution guidelines.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

## Contact

For questions or inquiries:

- **Shehroz Kashif**: [sharooz57@gmail.com]
- **GitHub**: [Shehrozkashif](https://github.com/Shehrozkashif)


