import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector('#user_address, #location');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
