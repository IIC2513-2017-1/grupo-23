$(document).on('turbolinks:load', function(){
  $('.tablinks').on('click', function(){
    var link = $(this);
    var tab = $("." + link.data('tab'));

    $('.tabcontent').each(function(){
      $(this).hide();
    });

    $('.tablinks').each(function(){
      $(this).removeClass('active');
    });

    tab.show();
    link.addClass('active');
  });

});
