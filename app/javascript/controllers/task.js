import jquery from "jquery";
window.$ = jquery;
$(function (){
  $('.tab').on('click', function() {
    $('.tab-active').removeClass('tab-active');
    $(this).addClass('tab-active');
    $('.todo-index-active').removeClass('todo-index-active');
    const index = $(this).index();
    $('.todo-list-box').eq(index).addClass('todo-index-active');
  });

  $('.alert-button').on('click', function() {
    $(this).next('.alert-box').addClass('active');
  })

  $('.alert-no').on('click', function() {
    $(this).parent().parent().removeClass('active');
  })

  $('.fa-user').on('click', function() {
    if($('.home-user-box').hasClass('box-active')) {
      $('.home-user-box').removeClass('box-active');
    } else {
      $('.home-user-box').addClass('box-active');
    }
  })
});