function selectPath() {
    window.pywebview.api.select_path().then(path => {
        document.getElementById('llm-path').value = path;
    });
}


function submitForm(event) {
    event.preventDefault();
    const llmPath = document.getElementById('llm-path').value;
    const gpuLayers = document.getElementById('gpu-layers').value;
    const contextNumber = document.getElementById('context-number').value;

    const data = {
        llm_path: llmPath,
        gpu_layers: gpuLayers,
        context_number: contextNumber
    };

    window.pywebview.api.submit_form(data).then(response => {
        console.log(response);
        window.location.href = "/home/shehroz/ArcheV/frontend/web/index.html";
    });
}
