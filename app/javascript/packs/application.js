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
      if (button.dataset.recyclability == 100) {
        confettiElement.style.display = 'block';
        document.querySelector('.carouselbg').style.background = 'transparent';
        confetti.render();
        Swal.fire ({
          icon: 'success',
          title: 'You go that right!',
          text: 'success'
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
      if (button.dataset.recyclability == 0) {
        confetti.render();
        Swal.fire ({
          icon: 'Good job!',
          title: 'You go that right!',
          text: 'success'
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
  orangeButton.forEach((button) => {
    button.addEventListener('click', (event) => {
      console.log(orangeButton)
      console.log(button.dataset.recyclability)
      console.log(button.dataset.recyclability > 0 && button.dataset.recyclability < 100)
      if (button.dataset.recyclability > 0 && button.dataset.recyclability < 100) {
        confetti.render();
        Swal.fire ({
          icon: 'Good job!',
          title: 'You go that right!',
          text: 'success'
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













