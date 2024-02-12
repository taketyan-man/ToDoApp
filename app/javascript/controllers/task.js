import jquery from "jquery";
window.$ = jquery;
$(window).on('scroll', function() {
  
  var pos = $(window).scrollTop();
  if (50 < pos) {
    $('.arrow-box').fadeIn('');
  }
  else {
    $('.arrow-box').fadeOut('');
  }
});

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
      if($('.home-user-alert').hasClass('box-active')) {
        $('.home-user-alert').removeClass('box-active');
      }
    };
  })

  
  $('.fa-bell').on('click', function() {
    if($('.home-user-alert').hasClass('box-active')) {
      $('.home-user-alert').removeClass('box-active');
    } else {
      $('.home-user-alert').addClass('box-active');
      if($('.home-user-box').hasClass('box-active')) {
        $('.home-user-box').removeClass('box-active');
      }
    };
  })

  $('.arrow-box').on('click', function() {
    $('body,html').animate({scrollTop:0}, 500, 'swing');
  })
});