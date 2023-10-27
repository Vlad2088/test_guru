document.addEventListener('turbolinks:load', () => {
  const form = document.getElementById('new_user');
  if (form) new CheckConfirmation(form)
})

class CheckConfirmation {
  constructor(form) {
    this.form = form;
    this.password = form.elements.user_password
    this.passwordConfirmation = form.elements.user_password_confirmation
    this.successIcon = form.querySelector('.octicon-check-circle');
    this.failedIcon = form.querySelector('.octicon-x-circle');
    this.setup();
  }

  setup() {
    this.form.addEventListener( 'keyup', Event => {
      if (this.passwordConfirmation.value) {
        this.checkPassword()
      } else {
        this.resetStyle()
      }
    })
  }

  checkPassword() {
    if (this.password.value === this.passwordConfirmation.value) {
      this.successIcon.classList.remove('hide');
      this.failedIcon.classList.add('hide');
    } else {
      this.failedIcon.classList.remove('hide');
      this.successIcon.classList.add('hide');
    }
  }

  resetStyle() {
    this.failedIcon.classList.add('hide');
    this.successIcon.classList.add('hide');
  }
}
