// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(function() {
	$("#twitch-tab").click(function(){
		$("#video-player").html("<div class='video-player'><iframe  src='http://twitch.tv/schamtoo/embed' frameborder='0' allowfullscreen></iframe></div>")
		$document.getElementById(/([A-z])\w+-/+"tab").className="";
		$document.getElementById("twitch-tab").className="Active";
		return false;
	});
	$("#mlg-tab").click(function(){
		$("#video-player").html("<div class='video-player'><iframe src='http://tv.majorleaguegaming.com/player/embed/schamtoo' frameborder='0' allowfullscreen></iframe></div>")
		$document.getElementById(/([A-z])\w+-/+"tab").className="";
		$document.getElementById("mlg-tab").className="Active";
		return false;
	});
	$("#youtube-tab").click(function(){
		$("#video-player").html("<div class='video-player'><iframe src='https://www.youtube.com/embed/iuQY9HHZQpA?list=PLYWkkXRQ3uYUsKKFfY37lEbwoY8wilSYt' frameborder='0' allowfullscreen></iframe></div>")
		$document.getElementById(/([A-z])\w+-/+"tab").className="";
		$document.getElementById("mlg-tab").className="Active";
		return false;
	});
});
