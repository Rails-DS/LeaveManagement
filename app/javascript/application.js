// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"



$('#test').click(function (event){
	alert("done............");
	event.stop();
})