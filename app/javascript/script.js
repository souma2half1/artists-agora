$(document).on('turbolinks:load', function() {
  $(function(){
  $('.post-card').mouseover(function(){
    $(this).addClass('post-card-ext');
  });
  $('.post-card').mouseout(function(){
    $(this).removeClass('post-card-ext');
  });
});
});


$(document).on('turbolinks:load', function() {
  $(function(){
  $('.work-image').slideDown();
});
});

$(document).on('turbolinks:load', function() {
  $(function(){
  $('.intro').fadeIn(800);
});
});