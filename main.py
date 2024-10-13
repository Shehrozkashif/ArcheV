import webview
import sys
sys.path.append('/home/shehroz/ArcheV/integration')

# Import the flow module from the integration package
from integration import flow
class API:
    _instance = None
    
    def get_flow_data(self):
        # Call the flow.main() function and return its data
        return flow.main()



    def __new__(cls, *args, **kwargs):
        if not cls._instance:
            cls._instance = super().__new__(cls, *args, **kwargs)
        return cls._instance

    def __init__(self):
        # Initialize the variables to store values
        self.llm_path = None
        self.gpu_layers = None
        self.context_number = None

    def analyze(self, data):
        # Update the instance variables with provided data
        self.llm_path = data.get('llm_path', 'No Path Provided')
        self.gpu_layers = data.get('gpu_layers', 'No GPU Layers Provided')
        self.context_number = data.get('context_number', 'No Context Number Provided')

        print(f"LLM Path: {self.llm_path}")
        print(f"GPU Layers: {self.gpu_layers}")
        print(f"Context Number: {self.context_number}")

        return "Data received and processed!"

    def get_values(self, data):
        # Store values in class-level variables
        self.llm_path = data.get('llm_path', 'No Path Provided')
        self.gpu_layers = data.get('gpu_layers', 'No GPU Layers Provided')
        self.context_number = data.get('context_number', 'No Context Number Provided')

        return self.llm_path, self.gpu_layers, self.context_number
        
    def get_stored_values(self):
        return self.llm_path, self.gpu_layers, self.context_number



if __name__ == '__main__':
    api = API()
    global_values = None
    global_values  = api.get_stored_values
    flow_results = flow.main()
    flow_results = api.get_flow_data()  #
    
    # You can now use flow_results for further processing
   
   
    # Provide the correct path to your HTML file
    window = webview.create_window('Analyze Form', '/home/shehroz/ArcheV/frontend/web/index.html', js_api=api)
    webview.start()