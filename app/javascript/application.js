// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"










 // jQuery(function() {
   
 //   var roles = $('#user_role_id').html();
 //   return $('#user_team_id').change(function() {
   
	//    var team = $('#user_team_id :selected').text();
	//    var options = $(roles).filter("optgroup[label='" + team + "']").html();
	//      if (options) {
	//        return $('#user_role_id').html(options);
	//      } else {
	//        return $('#user_role_id').empty();
	//      }
	//   });
	// });


 jQuery(function() {
   
   var roles = $('#user_role_id').html();
   return $('#user_team_id').change(filter_by_team);

   	function filter_by_team() {
   	   var team = $('#user_team_id :selected').text();
	   var options = $(roles).filter("optgroup[label='" + team + "']").html();
	     if (options) {
	       return $('#user_role_id').html(options);
	     } else {
	       return $('#user_role_id').empty();
	     }
	  }
	});

