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
            $('#add-question-form').hide();
            // $("form").toggle();
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

$(document).ready(function() {
  $("#add-choice").on('click',function(event){
    event.preventDefault();
    $.ajax("http://localhost:3000/choices/choiceform")
      .done(function(choiceform) {
        $("body").append(choiceform);
        $("form").on('submit',function(e) {
          e.preventDefault();
          $.ajax("http://localhost:3000/choices", {
            method: "POST",
            data: $("form").serialize()
          })
          .done(function(choicePartial) {
            $(".mothafucka").append(choicePartial);
            $('#add-choice-form').hide();
            console.log(choicePartial)
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

$(document).ready(function() {
  $("#login").on('click', function(event) {
    event.preventDefault();
    $.ajax("http://localhost:3000/sessions/loginform")
      .done(function(loginform) {
        $("body").append(loginform);
        $("form").on('submit', function(e) {
          e.preventDefault();
          $.ajax("http://localhost:3000/login", {
          method: "POST",
          data: $("form").serialize()
        })
          .done(function(loginPartial) {

            $("#hidethisshit").hide();
            $("#login_page").append(loginPartial);
            $("#login_page").hide();
             window.location = "/surveys"
          })
          .fail(function() {
            console.log("you suck");
          });
        });
      })
        .fail(function() {
          console.log("idk")
        });
    });
});

$(document).ready(function() {
  $("#signup").on('click', function(event) {
    event.preventDefault();
    $.ajax("http://localhost:3000/sessions/signupform")
      .done(function(signupform) {
        $("body").append(signupform);
        $("form").on('submit', function(e) {
          e.preventDefault();
          $.ajax("http://localhost:3000/users", {
          method: "POST",
          data: $("form").serialize()
        })
          .done(function(signupPartial) {

            $("#hidethisshit").hide();
            $("#signup_page").append(signupPartial);
            $("#signup_page").hide();
             window.location = "/surveys"
          })
          .fail(function() {
            console.log("you suck");
          });
        });
      })
        .fail(function() {
          console.log("idk")
        });
    });
});
