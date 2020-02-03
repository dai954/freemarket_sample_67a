$(function() {
  
  $('.item-photo__bottom--size').hover(function(){
  $('.item-photo__top--size').attr('src',$(this).attr('src'))
  
  });
});