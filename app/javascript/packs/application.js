require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";



document.addEventListener('turbolinks:load', () => {
  $('.carousel').carousel({
      interval: false
  });

  const greenButtons = document.querySelectorAll('.green-answer')
  const secondButton = document.querySelectorAll('.red-answer')
  const orangeButton = document.querySelectorAll('.orange-answer')
  greenButtons.forEach((button) => {
    button.addEventListener('click', (event) => {
      if (button.dataset.recyclability == 100) {
        Swal.fire ({
          icon: 'success',
          title: 'You go that right!',
          text: 'success'
        })
      } else {
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'You got that one wrong!',
        })
      }
    })
  })
  secondButton.forEach((button) => {
    button.addEventListener('click', (event) => {
      if (button.dataset.recyclability == 0) {
        Swal.fire ({
          icon: 'Good job!',
          title: 'You clicked the button!',
          text: 'success'
        })
      } else {
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'You got that one wrong!',
        })
      }
    })
  })
  orangeButton.forEach((button) => {
    button.addEventListener('click', (event) => {
      if (button.dataset.recyclability > 0 && button.dataset.recyclability < 100) {
        Swal.fire ({
          icon: 'Good job!',
          title: 'You clicked the button!',
          text: 'success'
        })
      } else {
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'You got that one wrong!',
        })
      }
    })
  })

})


















