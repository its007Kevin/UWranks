document.addEventListener("turbolinks:load", function() {
  // Get all "navbar-burger" elements
  var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);
  // Check if there are any navbar burgers
  if ($navbarBurgers.length > 0) {
    // Add a click event on each of them
    $navbarBurgers.forEach(function ($el) {
      $el.addEventListener('click', function () {
        // Get the target from the "data-target" attribute
        var target = $el.dataset.target;
        var $target = document.getElementById(target);
        // Toggle the class on both the "navbar-burger" and the "navbar-menu"
        $el.classList.toggle('is-active');
        $target.classList.toggle('is-active');
      });
    });
  }
});

$(function () {
  $('.toggle_job_comments').click(function () {
    $(this).siblings('.job_comments').toggle();
    toggleLabel($(this), 'Hide', 'Show');
  });
  
	$('.toggle_post_comments').click(function () {
    $(this).closest('.post').find('.post_comments').toggle();
    toggleLabel($(this), 'Hide', 'Show');
  });
  
  $('.reply_post').click(function () {
    $(this).closest('.post').find('.reply').toggle();
    toggleLabel($(this), 'Reply', 'Cancel');
  });
});

function toggleLabel(link, label1, label2) {
  if (link.html() === label1) {
    link.html(label2);
  } else {
    link.html(label1);
  }
}
