# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@OpenEdit = (url) ->
	$.ajax url,
		type: 'GET'		
		dataType: 'html'
		success: (html) -> $("#edit-section").html html