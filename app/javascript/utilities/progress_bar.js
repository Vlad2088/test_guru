document.addEventListener('turbolinks:load', function () {

  const progressBar = document.getElementById('progress_bar')

  if (progressBar) { 
    const progressBarValue = document.querySelector('.progress-bar-value')
    const progressQuestion = progressBarValue.dataset.progressQuestion
    const progress = document.querySelector('.progress-bar')
    const Width = progressQuestion

    progress.style.width = '' + Width + '%'
    progressBarValue.textContent = '' + Width + '%' }
})
