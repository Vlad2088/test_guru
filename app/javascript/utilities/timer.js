document.addEventListener('turbolinks:load', function () {
  const display = document.querySelector('.timer');
  if (display) {
    let time = display.dataset.timer;
    time ? startTimer(display, time) : display.classList.add('hide')
  }
});

function startTimer(display, time) {
  const form = document.querySelector('form');
  let timer = setInterval(() => {
    if (time <= 0) {
      clearInterval(timer);
      form.submit();
    } else {
      let minutes = Math.floor(time / 60);
      let seconds = Math.floor(time % 60);
      display.textContent = `Оставшееся время: ${minutes} минут ${seconds} секунд`;
      time--
    }
  }, 1000);

}
