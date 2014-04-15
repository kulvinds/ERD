# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@searchDirectory = () ->
	$.ajax 'products/search',
		type: 'GET'
		data: { query: $('#search-term').val() }
		dataType: 'html'
		success: (html) -> $("#search-results-container").html html