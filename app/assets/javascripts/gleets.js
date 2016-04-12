$(document).ready(function() {
  $('#gleet_body').on('keyup', function() {
    var characters = count_characters();
    validate_length(characters);
    output_character_count(characters);
  });
  $('#new_gleet').submit(function(ev) {
    if (count_characters() > 170) {
      ev.preventDefault();
    }
  });
  convert_to_local_time();
});

function count_characters() {
  return ($('#gleet_body').val().length);
}

function validate_length(characters) {
  if (characters > 170) {
    $('#gleet_body').parent().addClass('has-error');
    $('#counter').addClass('red');
  } else {
    $('#gleet_body').parent().removeClass('has-error');
    $('#counter').removeClass('red');
  }
}

function output_character_count(characters) {
  $('#counter').html("<p>Gleet length: " + characters + "</p>");
}

function convert_to_local_time() {
  $('.gleet-time').each(function() {
    var el = $(this);
    var utc_time = el.html();
    var local_time = new Date(utc_time);
    var hour = local_time.getHours();
    var unpadded_minutes = local_time.getMinutes().toString();
    var minutes = zero_pad_minutes(unpadded_minutes);
    var month = local_time.getMonth();
    var day = local_time.getDay();
    var year = local_time.getFullYear();
    el.html("gleeted on " + month + "/" + day + "/" + year + " at " + hour + ":" + minutes);
  });
}

function zero_pad_minutes(min) {
  console.log(min.length);
  if (min.length === 1) {
    return "0" + min;
  } else {
    return min;
  }
}
