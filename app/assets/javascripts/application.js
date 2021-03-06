// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on("turbolinks:load", function() {

    $('#reg_form').hide();
    $('#reg_form_hide').hide();
    $('#reg_form_prompt').show();

    $('#reg_form_btn').click(function() {
        $('#reg_form_prompt').hide();
        $('#reg_form').show();
        $('#reg_form_hide').show();
    });

    $('#reg_form_hide').click(function() {
        $('#reg_form_prompt').show();
        $('#reg_form').hide();
        $('#reg_form_hide').hide();
    })

});