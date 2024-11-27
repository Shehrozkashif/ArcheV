function second() {
    let element = document.getElementsByClassName("second")[0];
        element.style.display = "flex";
        element.scrollIntoView({ behavior: 'smooth' });
}


function openFile() {
    let x=pywebview.api.open_file_dialog()
    x.then(function(filePath) {
        document.getElementById('llm-path').value = filePath;
})}


function updateProgressBar(percentage) {
    const progressBar = document.getElementById('progressBar');
    progressBar.style.width = percentage + '%';
    progressBar.textContent = '';
    if (percentage === 100) {
        setTimeout(() => {
            transitionToFourthSlide();
        }, 5000); 
      }
  }


function transitionToFourthSlide() {
    const thirdSection = document.getElementById('third');
    const fourthSection = document.getElementById('fourth');
    if (thirdSection && fourthSection) {
        thirdSection.style.display = 'none'; // Hide slide 3
        fourthSection.style.display = 'flex'; // Show slide 4
        fourthSection.scrollIntoView({ behavior: 'smooth' });
    }
  };


function scrollToTop() {
    window.scrollTo(0, 0);
}
window.onload = scrollToTop;


