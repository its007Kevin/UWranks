$(function () {
  $('.modal-close, .modal-background').click(function () {
    closeModal();
  });
  $(document).keyup(function(e) {
    if (e.keyCode == 27) { // escape key 
      closeModal();
    }
  });
});

function closeModal() {
  $('#jobModal').removeClass('is-active');
  $('.error_messages').empty();
  $('.jobForm').val('');	
}