var ready;

ready = function(){
    // enable chosen js
    $('.chosen-select').chosen({
        no_results_text: 'Nie znaleziono użytkownika o nicku:',
        placeholder_text_multiple: ' Wybierz użytkownika'
    });
}

$(document).on("turbolinks:load",ready);