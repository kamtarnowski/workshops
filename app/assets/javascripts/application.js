//= require jquery
//= require jquery_ujs
//= require gritter
//= require bootstrap-sprockets
//= require_self

$(document).ready(function(){
    $('.navbar-header')
        .mouseenter(function(){
            $('#logo_off').hide();
            $('#logo_on').fadeIn('slow');
        })
        .mouseleave(function(){
            $('#logo_on').hide();
            $('#logo_off').fadeIn('slow');
        });
});
