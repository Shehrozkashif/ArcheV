
  document.addEventListener('DOMContentLoaded', function() {

    function submitForm(event) {
      event.preventDefault(); // Prevent default form submission

      // Collect form data
      const llmPath = document.getElementById('llm-path').value;
      const gpuLayers = document.getElementById('gpu-layers').value;
      const contextNumber = document.getElementById('context-number').value;

      // Log form data (for demonstration purposes)
      console.log('Folder Path:', llmPath);
      console.log('GPU Layers:', gpuLayers);
      console.log('Context Number:', contextNumber);

      // You can add code here to handle form data (e.g., send to server or validate)
    }

    function selectPath() {
      document.getElementById('folder-selector').click();
    }

    // Event listener for folder selector change
    document.getElementById('folder-selector').addEventListener('change', function(event) {
      const files = event.target.files;
      if (files.length > 0) {
        // Use the path of the first file as a representation of the folder
        document.getElementById('llm-path').value = files[0].webkitRelativePath || files[0].name;
      }
    });

    // Event listener for the 'Analyze' button
    document.getElementById('check').addEventListener('click', function() {
      const llmPath = document.getElementById('llm-path').value.trim();
      const gpuLayers = document.getElementById('gpu-layers').value.trim();
      const contextNumber = document.getElementById('context-number').value.trim();
      const errorMessageDiv = document.getElementById('error-message');

      // Validate fields
      if (!llmPath || !gpuLayers || !contextNumber) {
        errorMessageDiv.textContent = 'Please fill in all fields.';
        errorMessageDiv.style.display = 'block';
        return; // Exit function if validation fails
      }

      // Hide error message if all fields are filled
      errorMessageDiv.style.display = 'none';

      // Proceed with the existing logic
      const thirdSection = document.getElementById('third');
      if (thirdSection) {
        thirdSection.style.display = 'block'; // Show the third section
        thirdSection.scrollIntoView({ behavior: 'smooth' });

        // Start the progress bar animation
        updateProgressBar(100); // Set the progress bar to 100% (or any other logic you want)
      }
    });

    // Initialize select folder button
    document.getElementById('select-folder').addEventListener('click', selectPath);

    // Function to update the progress bar
    function updateProgressBar(percentage) {
      const progressBar = document.getElementById('progressBar');
      if (progressBar) {
        progressBar.style.width = percentage + '%';
        progressBar.textContent = '';

        // Check if the progress bar is complete
        if (percentage === 100) {
          setTimeout(() => {
            transitionToFourthSlide();
          }, 5000); // Delay for smooth transition
        }
      }
    }

    // Function to transition from slide 3 to slide 4
    function transitionToFourthSlide() {
      const thirdSection = document.getElementById('third');
      const fourthSection = document.getElementById('fourth');

      if (thirdSection && fourthSection) {
        thirdSection.style.display = 'none'; // Hide slide 3
        fourthSection.style.display = 'flex'; // Show slide 4
        fourthSection.scrollIntoView({ behavior: 'smooth' });
      }
    }
  });

  document.addEventListener('DOMContentLoaded', () => {
    const { jsPDF } = window.jspdf;

    // Function to export table to JSON
    function exportTableToJson() {
      const table = document.querySelector('table');
      const headers = Array.from(table.querySelectorAll('thead th')).map(th => th.innerText);
      const rows = Array.from(table.querySelectorAll('tbody tr'));

      const data = rows.map(row => {
        const cells = Array.from(row.querySelectorAll('td'));
        return headers.reduce((acc, header, index) => {
          acc[header] = cells[index].innerText;
          return acc;
        }, {});
      });

      return data;
    }

    // Function to download JSON file
    function downloadJson() {
      const data = exportTableToJson();
      const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = 'table-data.json';
      a.click();
      URL.revokeObjectURL(url);
    }

    document.getElementById('save-json').addEventListener('click', downloadJson);
  });


  function scrollToTop() {
    window.scrollTo(0, 0);
  }
  // Call the function when the page loads
  window.onload = scrollToTop;

  



