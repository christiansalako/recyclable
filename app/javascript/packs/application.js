require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import ConfettiGenerator from "confetti-js";



document.addEventListener('turbolinks:load', () => {
  $('.carousel').carousel({
      interval: false
  });

  const greenButtons = document.querySelectorAll('.green-answer')
  const secondButton = document.querySelectorAll('.red-answer')
  const orangeButton = document.querySelectorAll('.orange-answer')
  const confettiElement = document.getElementById('my-canvas');
  const confettiSettings = { target: confettiElement };
  var confetti = new ConfettiGenerator(confettiSettings);
  greenButtons.forEach((button) => {
    button.addEventListener('click', (event) => {
      console.log(button.dataset.recyclability)
      if (button.dataset.recyclability == 100) {
        confettiElement.style.display = 'block';
        document.querySelector('.carouselbg').style.background = 'transparent';
        confetti.render();
        Swal.fire ({
          icon: 'success',
          title: 'You got that right!'
        })
        document.querySelector('.swal2-confirm').addEventListener('click', (event) => {
          // confetti.clear()
          location.reload()
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
      console.log('Hello world', button.dataset.recyclability)
      if (button.dataset.recyclability == 0.0) {
        confettiElement.style.display = 'block';
        document.querySelector('.carouselbg').style.background = 'transparent';
        confetti.render();
        Swal.fire ({
          icon: 'success',
          title: 'You go that right!',

        })
        document.querySelector('.swal2-confirm').addEventListener('click', (event) => {
          // confetti.clear()
          location.reload()
        })
      } else {
        // confettiElement.style.display = 'block';
        // document.querySelector('.carouselbg').style.background = 'transparent';
        // confetti.render();
        Swal.fire({
          icon: 'error',
          title: 'You go that wrong!!!!!'
        })
        document.querySelector('.swal2-confirm').addEventListener('click', (event) => {
          // confetti.clear()
          location.reload()
        })
      }
    })
  })
  orangeButton.forEach((button) => {
    button.addEventListener('click', (event) => {
      console.log(button.dataset.recyclability)
      if (button.dataset.recyclability == 50.0) {
        confettiElement.style.display = 'block';
        confetti.render();
        Swal.fire ({
          icon: 'success',
          title: 'You go that right!'
        })
        document.querySelector('.swal2-confirm').addEventListener('click', (event) => {
          // confetti.clear()
          location.reload()
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













