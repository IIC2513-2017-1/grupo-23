$(document).on('turbolinks:load', function(){
  $('.tablinks').on('click', function(){
    var link = $(this);
    var tab = $("." + link.data('tab'));
    var date = link.data('date').split('-');
    var city = "Santiago";
    var searchtext ="select item from weather.forecast where woeid in (select woeid from geo.places(1) where text='" + city + "') and u='c'";
    var dict = {'01': 'Jan', '02': 'Feb','03': 'Mar','04': 'Apr','05': 'May',
  '06': 'Jun','07': 'Jul','08': 'Aug','09': 'Sep','10': 'Oct','11': 'Nov','12': 'Dic'};
    var yahoodate = date[2]+' '+dict[date[1]]+' '+date[0];

    $.getJSON("https://query.yahooapis.com/v1/public/yql?q=" + searchtext + "&format=json").success(function(data){
      var temp = data.query.results.channel.item.condition.temp;
      var display = "La temperatura en " + city + " es de " +temp+ "°C";
      var addon = "\nNo se tiene pronósticos de temperatura para la fecha";

      var forecast = data.query.results.channel.item.forecast;
      var x;
      for (x in forecast){
        if (forecast[x].date == yahoodate){
          var high = forecast[x].high;
          var low =  forecast[x].low;
          addon = "\nEl día del partido la mínima será "+low+"°C y la máxima será "+high+"°C";
        }
      }
      $('#weather-result').html(display+addon);
    });


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
