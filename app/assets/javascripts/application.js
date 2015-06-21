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
//= require_tree .

$(document).ready(function() {
  $("#add-question").on('click',function(event){
    event.preventDefault();
    $.ajax("http://localhost:3000/questions/questionform")
      .done(function(questionform) {
        $("body").append(questionform);
        $("form").on('submit',function(e) {
          e.preventDefault();

          $.ajax("http://localhost:3000/questions", {
  	      	method: "POST",
  	      	data: $("form").serialize()
  	      })
  	      .done(function(questionPartial) {
  	      	$("ul").append(questionPartial);
  	      	console.log(questionPartial)
  	      })
  	      .fail(function(){
  	      	console.log('fail panda');
  	      });
  	     });
  	    })
  	    .fail(function() {
  	      console.log('bad panda');
  	    });
  	});
});


