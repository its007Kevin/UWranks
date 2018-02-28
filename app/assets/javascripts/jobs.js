$(function () {
  $('#addJob').click(function () {
    $('#addJobForm').addClass('is-active');
  });
  $('#closeModal, #background').click(function () {
    closeModal();
  });
  $(document).keyup(function(e) {
    if (e.keyCode == 27) { // escape key 
      closeModal();
    }
  });
});

function closeModal() {
  $('#addJobForm').removeClass('is-active');
  $('#error_messages').empty();
  $('.jobForm').val('');	
}