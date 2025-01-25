document.addEventListener('DOMContentLoaded', function () {
  const priceSlider = document.getElementById('price-slider');
  const priceValue = document.getElementById('price-value');
  const priceField = document.getElementById('price_range');

  const urlParams = new URLSearchParams(window.location.search);
  const priceFromParams = urlParams.get('price_range');

  if (priceFromParams) {
    priceSlider.value = priceFromParams;
    priceValue.textContent = `$${priceSlider.value}`;
    priceField.value = priceSlider.value;
  } else {
    priceValue.textContent = `$${priceSlider.value}`;
  }

  priceSlider.addEventListener('input', function() {
    priceValue.textContent = `$${priceSlider.value}`;
    priceField.value = priceSlider.value;
  });

  const filterForm = document.querySelector('.filter-form');
  if (filterForm) {
    filterForm.addEventListener('submit', function(event) {
      priceField.value = priceSlider.value;
    });
  }
});
