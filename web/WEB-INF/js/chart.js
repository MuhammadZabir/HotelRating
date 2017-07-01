//barchart

$('.vertical .progress-fill span').each(function(){
  var percent = $(this).html();
  var pTop = 100 - ( percent.slice(0, percent.length - 1) ) + "%"  ;
  console.log(pTop) ;
  $(this).parent().css({
    'height' : percent,
    'top' : pTop
  });
});