

var ready = function() {

  var getMax = function() {
    return $('#content_page')[0].scrollHeight - $(window).height();
  }

  var getValue = function() {
    return $('#content_page').scrollTop();
  }

  if ('max' in document.createElement('progress')) {
    // Browser supports progress element
    var progressBar = $('progress');

    // Set the Max attr for the first time
    progressBar.attr({
      max: getMax()
    });

    $('#content_page').on('scroll', function() {
      // On scroll only Value attr needs to be calculated

      progressBar.attr({
        value: getValue()
      });
    });

    $(window).resize(function() {
      // On resize, both Max/Value attr needs to be calculated
      progressBar.attr({
        max: getMax(),
        value: getValue()
      });
    });

  } else {

    var progressBar = $('.progress-bar'),
      max = getMax(),
      value, width;

    var getWidth = function() {
      // Calculate width in percentage
      value = getValue();
      width = (value / max) * 100;
      width = width + '%';
      return width;
    }

    var setWidth = function() {
      progressBar.css({
        width: getWidth()
      });
    }

    $('#content_page').on('scroll', setWidth);

    $(window).on('resize', function() {
      // Need to reset the Max attr
      max = getMax();
      setWidth();
    });

  }





  $('#flat').addClass("active");
  $('#progressBar').addClass('flat');

  $('#flat').on('click', function() {
    $('#progressBar').removeClass().addClass('flat');
    $('a').removeClass();
    $(this).addClass('active');
    $(this).preventDefault();
  });

  $('#single').on('click', function() {
    $('#progressBar').removeClass().addClass('single');
    $('a').removeClass();
    $(this).addClass('active');
    $(this).preventDefault();
  });

  $('#multiple').on('click', function() {
    $('#progressBar').removeClass().addClass('multiple');
    $('a').removeClass();
    $(this).addClass('active');
    $(this).preventDefault();
  });

  $('#semantic').on('click', function() {
    $('#progressBar').removeClass().addClass('semantic');
    $('a').removeClass();
    $(this).addClass('active');
    $(this).preventDefault();
  });

  $('#content_page').on('scroll', function() {

    maxAttr = $('#progressBar').attr('max');
    valueAttr = $('#progressBar').attr('value');
    percentage = (valueAttr / maxAttr) * 100;
    var colora = 'rgb(65,80,111)';
    var colorb = 'rgb(245,78,98)';
    var fad = fadeToColor(colora, colorb, percentage / 100);
    color = 'background-color:' + fad;
    function fadeToColor(rgbColor1, rgbColor2, ratio) {
      var color1 = rgbColor1.substring(4, rgbColor1.length - 1).split(','),
        color2 = rgbColor2.substring(4, rgbColor2.length - 1).split(','),
        difference,
        newColor = [];

      for (var i = 0; i < color1.length; i++) {
        difference = color2[i] - color1[i];
        newColor.push(Math.floor(parseInt(color1[i], 10) + difference * ratio));
      }

      return 'rgb(' + newColor + ')';
    }


    document.styleSheets[0].addRule('.flat::-webkit-progress-value', color);
    document.styleSheets[0].addRule('.flat::-moz-progress-bar', color);

  });
};
$(document).ready(ready);
$(document).on('page:load', ready);
