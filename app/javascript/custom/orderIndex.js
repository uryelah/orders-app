window.onload = () => {
  if (window.location.pathname.includes('orders')) {
    const controlFilterBtn = document.getElementById('controlFilterBtn');
    const controlInput = document.getElementById('order_number');

    if (controlFilterBtn && controlInput) {
      controlFilterBtn.addEventListener('click', () => {
        window.location = `http://localhost:3000/orders/controll/${controlInput.value}`
      });
    }
  }
};
