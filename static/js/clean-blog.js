(function($) {
  "use strict"; // Start of use strict

  // Floating label headings for the contact form
  $("body").on("input propertychange", ".floating-label-form-group", function(e) {
    $(this).toggleClass("floating-label-form-group-with-value", !!$(e.target).val());
  }).on("focus", ".floating-label-form-group", function() {
    $(this).addClass("floating-label-form-group-with-focus");
  }).on("blur", ".floating-label-form-group", function() {
    $(this).removeClass("floating-label-form-group-with-focus");
  });

  // Show the navbar when the page is scrolled up
  var MQL = 992;

  //primary navigation slide-in effect
  if ($(window).width() > MQL) {
    var headerHeight = $('#mainNav').height();
    $(window).on('scroll', {
        previousTop: 0
      },
      function() {
        var currentTop = $(window).scrollTop();
        //check if user is scrolling up

        if (currentTop < this.previousTop) {
          //if scrolling up...
          if (currentTop > 0 && $('#mainNav').hasClass('is-fixed')) {
            $('#mainNav').addClass('is-visible');
          } else {
            $('#mainNav').removeClass('is-visible is-fixed');
          }
        } else if (currentTop > this.previousTop) {
          //if scrolling down...
          $('#mainNav').removeClass('is-visible');
          if (currentTop > headerHeight && !$('#mainNav').hasClass('is-fixed')) $('#mainNav').addClass('is-fixed');
        }
        this.previousTop = currentTop;
      });
  }

})(jQuery); // End of use strict



// reply form
function do_reply(parentid, rootid, username, e) {
    e.preventDefault()
    // console.log(parentid, rootid);
    // console.log(typeof username);
    $("#reply-form #id_parent_id").val(parentid);
    $("#reply-form #id_root_id").val(rootid);
    $("#reply-form").appendTo($("#div-comment-" + rootid));
    $("#reply-form .textarea").attr('placeholder', '回复 @' + username + ': ');
    $("#reply-form .textarea").val('回复 @' + username + ': ')
    $("#reply-form").show();
};

$(".more-btn").click(function(event) {
  event.preventDefault();
  $(this).parent().next().toggle();
  $(this).text($(this).text() == '收起' ? '点击查看' : '收起');
})
