$(document).ready(function() {
  $(".selectBtn").click(function() {
    var $row = $(this).closest("tr");  
    var $text = $row.find(".jobId").text(); 
    alert($text);
  });
});