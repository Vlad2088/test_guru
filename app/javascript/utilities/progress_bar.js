document.addEventListener('turbolinks:load', function () {

  const progressBar = document.getElementById('progress_bar')

  if (progressBar) { 
    const progressBarValue = document.querySelector('.progress-bar-value')
    const progressQuestion = progressBarValue.dataset.progressQuestion
    const progress = document.querySelector('.progress-bar')
    
    progress.style.width = '' + progressQuestion + '%'
    progressBarValue.textContent = '' + progressQuestion + '%' }
})
