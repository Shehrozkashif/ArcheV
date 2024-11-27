async function analyzes() {
    let llm_path = document.getElementById("llm-path").value;
    let context_length = document.getElementById("context-length").value;
    let gpu_layers = document.getElementById("gpu-layers").value;
    const errorMessageDiv = document.getElementById('error-message');
    if (!llm_path || !context_length || !gpu_layers) {
      errorMessageDiv.textContent = 'Please fill in all fields.';
      errorMessageDiv.style.display = 'block';
      return; 
    }
    let result = await pywebview.api.analyze(llm_path.trim(), context_length.trim(), gpu_layers.trim())
    // if (x== Dictionary){ ////////
    errorMessageDiv.style.display = 'none';
    const thirdSection = document.getElementById('third');
    if (thirdSection) {
      thirdSection.style.display = 'block';
      thirdSection.scrollIntoView({ behavior: 'smooth' });
      updateProgressBar(100); 
    }
    // }
    result;
    display_data(result)
  };

   
function display_data(x) {
    let tableBody = document.querySelector("#dictable tbody");
    let idcounter = 1;
    for (let key in x) {
    let row = document.createElement("tr");      
    let idCell = document.createElement("td");
    idCell.textContent = idcounter; 
    row.appendChild(idCell);      
    let promptCell = document.createElement("td");
    promptCell.textContent = x[key]["Prompt"];
    row.appendChild(promptCell);
    let syntacticalCell = document.createElement("td");
    syntacticalCell.textContent = x[key]["syntactical_verification"];
    row.appendChild(syntacticalCell);
    let functionalCell = document.createElement("td");
    functionalCell.textContent = x[key]["functional_verification"];
    row.appendChild(functionalCell);       
    tableBody.appendChild(row);       
    idcounter++;
    }
}