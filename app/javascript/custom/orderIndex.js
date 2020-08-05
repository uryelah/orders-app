window.onload = () => {
  if (window.location.pathname.includes('orders')) {
    const controlFilterBtn = document.getElementById('controlFilterBtn');
    const controlInput = document.getElementById('order_number');

    if (controlFilterBtn && controlInput) {
      controlFilterBtn.addEventListener('click', () => {
        window.location = `${window.locaiton.host}/orders/controll/${controlInput.value}`
      });
    }
  }
};
