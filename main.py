import webview
class Api:
    def __init__(self):
        self.llm_path = None
        self.gpu_layers = None
        self.context_number = None

    def select_path(self):
        # Use webview's file dialog method to select a folder
        result = webview.windows[0].create_file_dialog(webview.FOLDER_DIALOG)
        folder_selected = result[0] if result else None
        return folder_selected

    def submit_form(self, data):
        # Store form data in separate variables
        self.llm_path = data.get('llm_path')
        self.gpu_layers = data.get('gpu_layers')
        self.context_number = data.get('context_number')
        

        # Print the stored variables for verification
        print(f"LLM Path: {self.llm_path}")
        print(f"GPU Layers: {self.gpu_layers}")
        print(f"Context Number: {self.context_number}")

        return "Form data received and stored successfully"

if __name__ == '__main__':
    api = Api()
    window = webview.create_window(
        title='ArcheV',
        url='/home/shehroz/ArcheV/frontend/web/index.html',
        width=1200,
        height=600,
        resizable=False,
        js_api=api
    )
    webview.start()
    