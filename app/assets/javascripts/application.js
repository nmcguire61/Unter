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
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require jquery-ui
//= require_tree .
//= require autocomplete-rails

// $('#start').click(function(){
//   if(this.value=="Edinburgh")this.value='';
// });

$(function(){
  $("#start").on("click", function(){
    console.log(this);
     if(this.value=="Edinburgh")this.value='';
  });
  $("#end").on("click", function(){
    console.log(this);
     if(this.value=="Glasgow")this.value='';
  });
});
