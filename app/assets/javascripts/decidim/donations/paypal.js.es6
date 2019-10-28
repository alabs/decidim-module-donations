$(() => {
  $('.freq').on('click', function() {
    $('.freq').addClass('hollow').removeClass('light');
    $(this).removeClass('hollow').addClass('light');
    var value = $(this).attr('subscription');
    $('#donation_subscription').val(value)
    console.log(value);
  });

  $('.amount').on('click', function() {
    $('.amount').addClass('hollow').removeClass('light');
    $(this).removeClass('hollow').addClass('light');
    var value = $(this).attr('amount');
    $('#donation_amount').val(value)
  })
});
