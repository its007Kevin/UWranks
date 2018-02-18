$(function () {
  $('#addJob').click(function () {
    $('#addJobForm').addClass('is-active');
  });
  $('#submitJob, #closeModal, #background').click(function () {
    $('#addJobForm').removeClass('is-active');
  });
  $(document).keyup(function(e) {
    if (e.keyCode == 27) { // escape key 
      $('#addJobForm').removeClass('is-active');
    }
  });
});