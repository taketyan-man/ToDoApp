// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require rails-ujs
import { Turbo } from "@hotwired/turbo-rails";
Turbo.session.drive = false;
import jquery from "jquery";
import Rails from '@rails/ujs';
window.$ = jquery

// スクロール機能
$(window).on('scroll', function() {
  
  var pos = $(window).scrollTop();
  if (50 < pos) {
    $('.arrow-box').fadeIn('');
  }
  else {
    $('.arrow-box').fadeOut('');
  }
});

// タブ切り替え
$(function (){
  let d;

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
      $('.footer-user').css('color', 'black');
      $('.home-user-box').removeClass('box-active');     
    } else {
      $('.home-user-box').addClass('box-active');
      $('.footer-user').css('color', 'orange');
      if($('.home-user-alert').hasClass('box-active')) {
        $('.home-user-alert').removeClass('box-active');
        $(".footer-bell").css('color', 'black');
      }
    };
  })

  
  $('.fa-bell').on('click', function() {
    if($('.home-user-alert').hasClass('box-active')) {
      $('.home-user-alert').removeClass('box-active');
      $(".footer-bell").css('color', 'black');
    } else {
      $('.home-user-alert').addClass('box-active');
      $('.footer-bell').css('color', 'orange');
      if($('.home-user-box').hasClass('box-active')) {
        $('.footer-user').css('color', 'black');
        $('.home-user-box').removeClass('box-active');
      }
    };
  })

  $('.arrow-box').on('click', function() {
    $('body,html').animate({scrollTop:0}, 500, 'swing');
  })

  $('.user-show-switch ').on('click', function() {
    if($('.user-show-box').hasClass('box-active')) {
      $('.cvevron-down').addClass('active');
      $('.user-show-box').removeClass('box-active');
      
    } else {
      $('.cvevron-down').removeClass('active');
      $('.user-show-box').addClass('box-active');
    }
  })
});
