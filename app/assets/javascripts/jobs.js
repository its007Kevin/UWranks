# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(".selectJobBtn").click(function() {
    var $row = $(this).closest("tr");  
    var $text = $row.find(".jobTableId").text(); 
    
    alert($text);
});

