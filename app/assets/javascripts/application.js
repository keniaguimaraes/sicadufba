// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require materialize-sprockets
//= require select2
//= require materialize/extras/nouislider
//= require toastr
//= require_tree .



('.dropdown-button').dropdown({
      container: document.body,
      coverTrigger: false,
      closeOnClick: true
 }); 


( document ).ready(function() {
    ('.collapsible').collapsible();
    ('.tooltipped').tooltip();
    ('.modal').modal();
    
	 ('.toastr').options = {
	                  "closeButton": false,
	                  "debug": false,
	                  "positionClass": "toast-bottom-right",
	                  "onclick": null,
	                  "showDuration": "500",
	                  "hideDuration": "500",
	                  "timeOut": "500",
	                  "extendedTimeOut": "500",
	                  "showEasing": "swing",
	                  "hideEasing": "linear",
	                  "showMethod": "fadeIn",
	                  "hideMethod": "fadeOut"
	              }
	
    
    
}); // end of document ready


