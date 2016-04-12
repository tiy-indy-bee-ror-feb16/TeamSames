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
