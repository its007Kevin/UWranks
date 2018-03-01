$(function() {
  $("#msg").keypress(function (e) {
      if(e.which == 13 && !e.shiftKey) {
          $(this).closest("form").submit();
          e.preventDefault();
          return false;;
      }
  });
});
