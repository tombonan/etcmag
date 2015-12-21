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
//= require ckeditor/init
//= require_tree .



// make flash go away after 5 seconds
$('document').ready(function() {
  setTimeout(function() {
    $('#flash').slideUp();
  }, 5000);
});

// sticky header that shrinks

$(document).ready(function () {
    $(".header-container").before($(".header-container").clone().addClass("animateIt"));
    $(window).on("scroll", function () {
        $("body").toggleClass("down", ($(window).scrollTop() > 340));
    });
});

 $(document).ready(function () {
    $(window).scroll(function () {
        $('.header-text').toggleClass("hide", ($(window).scrollTop() > 340)),
        $('.header-nav').toggleClass("up", ($(window).scrollTop() > 340)),
        $('.circle').toggleClass("move", ($(window).scrollTop() > 340)),
        $('.circle-img').toggleClass("size", ($(window).scrollTop() > 340)),
        $('.header-social-links').toggleClass("appear", ($(window).scrollTop() > 340));
     }); 
});



