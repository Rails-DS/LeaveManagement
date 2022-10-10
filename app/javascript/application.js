// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"



$(document).ready(function(){

// Dynamic menu on selection of team





// Auto update total no of days
function total_days(){
	var start_date = document.getElementById("leave_hist_startDate").value;
	var end_date = document.getElementById("leave_hist_endDate").value;
	document.getElementById("leave_hist_noofDays").value = Math.floor((Date.parse(end_date) - Date.parse(start_date)) / 86400000);
}	

var end = document.getElementById("leave_hist_endDate")

	end.addEventListener('change', (event) => {
  	 total_days()
	});

});

console.log("test")