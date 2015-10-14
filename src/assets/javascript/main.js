$(document).ready(function() {

    /* ======= Fixed header when scrolled ======= */    
    $(window).on('scroll load', function() {
         if ($(window).scrollTop() > 0) {
          $('#header').addClass('scrolled');
         }
         else {
          $('#header').removeClass('scrolled');
         }
    });

    /* ======= jQuery Placeholder ======= */
    /* Ref: https://github.com/mathiasbynens/jquery-placeholder */
    $('input, textarea').placeholder();


  /**
   * Contact us form for setting "Shoov" trial submit callback.
   */
    var submitTrailForm = function(){

      // The form element.
      var $form = $('#trial-form');

      // The form submit element.
      var $submitButton = $form.find('button[type="submit"]');

      $submitButton.bind('click', function(){
        event.preventDefault();

        // Get input values.
        var website = $('input[type="url"]').val().trim();
        var email = $('input[type="email"]').val().trim();

        // Simple validation.
        if (website == '' || email == '') {
          $('.alert-danger').show();
          return;
        };

        $.ajax({
          url: $form.attr('action'),
          method: "POST",
          data: {
            subject: 'shoov - contact trail set up',
            url: website,
            website:  email
          },
          dataType: "json",
          success: function () {
            $('.alert-danger').hide();
            $('.alert-success').show();
          }
        });
      })

    }

  // Form contact for trial submission callback.
  submitTrailForm();

});
