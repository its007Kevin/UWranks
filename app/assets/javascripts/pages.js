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
  // Comment Reply System
  var placeholder;

  $('.toggle_post_comments').click(function () {
    $(this).closest('.post').find('.post_comments').toggle();
    if ($(this).html() === 'Hide') {
      $(this).html(placeholder);
    } else {
      placeholder = $(this).html();
      $(this).html('Hide');
    }
  });
  
  $('.reply_post').click(function () {
    $(this).closest('.post').find('.reply').toggle(); // Show reply form
    // Get user your replying to in the input form
    var replying_to = $(this).closest('.post').find('.post_user').html();
    $(this).closest('.post').find('.reply_field').val(`@${replying_to} `).focus();  
  });

  $('.reply_comment').click(function () {
    $(this).closest('.post').find('.reply').toggle();
    var replying_to = $(this).closest('.comment').find('.comment_user').html();
    $(this).closest('.post').find('.reply_field').val(`@${replying_to} `).focus();
  });

  $('.submit_reply').click(function () {
    var numReplies;
    var label = $(this).closest('.post').find('.toggle_post_comments');
    if (label.html() === 'Hide') {
      numReplies = placeholder.substring(0, 1);
      placeholder = ++numReplies + ' Replies';
    } else {
      numReplies = label.html().substring(0, 1);
      label.html(`${++numReplies} Replies`);
    }
  });

  $('.cancel').click(function () {
    $(this).closest('.reply').find('.reply_field').val('');
    $(this).closest('.reply').toggle();
  });
  // Infinite Scrolling
  $(window).scroll(function () {
    var url = $('.pagination .next_page').attr('href');
    if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 70) {
      $('.pagination').text('Loading more rankings');
      $.getScript(url);
    }
  });
});