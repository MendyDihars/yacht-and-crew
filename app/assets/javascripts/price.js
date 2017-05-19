$(document).ready(function() {
  setInterval(function() {
    var price = $("#unique_price").text();

    var checkin = $('#booking_checkin').val();
    var checkout = $('#booking_checkout').val();

    checkin = checkin.split('-');
    checkout = checkout.split('-');

    var date_1 = new Date(checkin[0], checkin[1] - 1, checkin[2]);
    var date_2 = new Date(checkout[0], checkout[1] - 1, checkout[2]);

    var days = (((date_2 - date_1) / 1000) / 3600) / 24;
    var amount = (days + 1) * price;

    if (amount >= 0) {
      $('#price').text(amount + ' €');
    }
    else {
      $('#price').html('<i class="fa fa-anchor faa-pulse animated fa-2x"></i>');
    };
  }, 1000);
});
