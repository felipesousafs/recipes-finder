//= require jquery
//= require bootstrap-sprockets
//= require chosen-jquery
//= require select2


$(document).ready(function () {
    // $('.chosen-select').chosen({
    //     allow_single_deselect: true,
    //     width: '200px',
    //     placeholder_text_single: 'What ingredients do you have?'
    // });

    $( ".select2" ).select2({
        theme: "bootstrap",
        tags: true
    });
});
