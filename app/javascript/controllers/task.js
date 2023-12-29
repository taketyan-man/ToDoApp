import jquery from "jquery";
window.$ = jquery;
$(function (){
  $('.tab').click(function() {
    $('.tab-active').removeClass('tab-active');
    $(this).addClass('tab-active');
    $('.todo-index-active').removeClass('todo-index-active');
    const index = $(this).index();
    $('.todo-list-box').eq(index).addClass('todo-index-active');
  });

  $('.alert-button').on('click', function(){
    $(this).next('.alert-box').addClass('active');
  })

  $('.alert-no').on('click', function(){
    $(this).parent().parent().removeClass('active');
  })
});