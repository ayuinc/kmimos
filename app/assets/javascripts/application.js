//= require jquery
//= require jquery_ujs
//= require fullcalendar.min
//= require bootstrap/collapse
//= require bootstrap/bootstrap-datepicker
//= require bootstrap/dropdown
//= require bootstrap/collapse
//= require bootstrap/transition
//= require bootstrap/tooltip
//= require bootstrap/z_popover
//= require bootstrap/modal
//= require bootstrap/tab
//= require jquery.sticky
//= require easing
//= require underscore-min
//= require typeahead.min
//= require_self
//= require_tree .

$(document).ready(function() {

	$(function () {
		$('.example').popover();
	});
});


function checkAll(){
	// Pass in a named "Check All" checkbox that appears on the same form where all 
	// checkboxes should be checked.
	main_checkbox = document.getElementById("check_all");

	// Loop through an array containing ALL inputs on same form as check_all
	location_checkboxes = document.getElementsByClassName("location_cbx");
	for (var i = 0; i < location_checkboxes.length; i++) {  
	  // Only work on checkboxes, and NOT on the "Check All" checkbox
    if(main_checkbox.checked == true){
      location_checkboxes[i].checked = true ;
    }else{
      location_checkboxes[i].checked = false;
    }
	};
}

function uncheckMain(location_checkbox) {
	var tracker = 0;
	main_checkbox = document.getElementById("check_all");
		if(location_checkbox.checked == false) {
			main_checkbox.checked = false;
		};
	location_checkboxes = document.getElementsByClassName("location_cbx");	
		for (var i = 0; i < location_checkboxes.length; i++) {  
		  // Only work on checkboxes, and NOT on the "Check All" checkbox
		  if (location_checkboxes[i].type == "checkbox") { 
		    if(location_checkboxes[i].checked == true){
		      tracker ++;
		    }
		  }  
		};
	  if (tracker == location_checkboxes.length) {
	    main_checkbox.checked = true;
	  }
}

function allLabel() {
	main_checkbox = document.getElementById("check_all");
	if (main_checkbox.checked == true) {
		main_checkbox.checked = false;
		checkAll();
	}else{
		main_checkbox.checked = true;
		checkAll();
	}
}











