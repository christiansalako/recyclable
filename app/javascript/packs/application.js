require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

const myButton = document.getElementById('green-answer')
const secondButton = document.getElementById('secondtest')

console.log('myButton info', myButton.dataset.recyclability);

myButton.addEventListener('click', function() {
  if (myButton.dataset.recyclability === 100) {
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
});


secondButton.addEventListener('click', function() {
  Swal.fire({
  icon: 'error',
  title: 'Oops...',
  text: 'You got that one wrong!',

})

});





