document.getElementById('check').addEventListener('click', function() {
    const llmPath = document.getElementById('llm-path').value;
    const gpuLayers = document.getElementById('gpu-layers').value;
    const contextNumber = document.getElementById('context-number').value;

    // Send data to Python
    window.pywebview.api.analyze({
        llm_path: llmPath,
        gpu_layers: gpuLayers,
        context_number: contextNumber
    }).then(response => {
        console.log(response); // Check the response in the browser console
    }).catch(error => {
        console.error('Error:', error); // Log any errors to the console
    });

    // Fetch flow data from Python and update the table
    window.pywebview.api.get_flow_data().then(data => {
        updateTable(data);
    }).catch(error => {
        console.error('Error fetching flow data:', error);
    });
});
function updateTable(data) {
    const tableBody = document.querySelector('table tbody');
    tableBody.innerHTML = ''; // Clear existing rows

    // Loop through the data to create table rows
    data.forEach((item, index) => {
        const row = document.createElement('tr');

        // Create and append the Id cell
        const idCell = document.createElement('td');
        idCell.textContent = index + 1;
        row.appendChild(idCell);

        // Create and append the Module Name cell
        const moduleNameCell = document.createElement('td');
        moduleNameCell.textContent = item[2]; // Assuming module name is the third element in tuple
        row.appendChild(moduleNameCell);

        // Create and append the Syntactical Verification cell
        const syntacticalCell = document.createElement('td');
        const syntacticalStatus = item[0]; // First column for syntactical verification
        const syntacticalText = document.createElement('p');
        syntacticalText.className = syntacticalStatus === 'passed' ? 'status delivered' : 'status cancelled';
        syntacticalText.textContent = syntacticalStatus === 'passed' ? 'Passed' : 'Failed';
        syntacticalCell.appendChild(syntacticalText);
        row.appendChild(syntacticalCell);

        // Create and append the Functional Verification cell
        const functionalCell = document.createElement('td');
        const functionalStatus = item[1]; // Second column for functional verification
        const functionalText = document.createElement('p');
        functionalText.className = functionalStatus === 'passed' ? 'status delivered' : 'status cancelled';
        functionalText.textContent = functionalStatus === 'passed' ? 'Passed' : 'Failed';
        functionalCell.appendChild(functionalText);
        row.appendChild(functionalCell);

        // Append the row to the table body
        tableBody.appendChild(row);
    });
}
