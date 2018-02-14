$(function () {
  $('#addJob').click(function () {
    $('#addJobForm').toggle();
    toggleText($('#addJob'));
  });
});

function toggleText(text) {
  if (text.html() === 'Close') {
    text.html('Add new Job');
  } else {
    text.html('Close');
  }
}