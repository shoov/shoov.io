$(document).ready(function() {

    //
    var snedShoovTrailRequest = function(){

      // The form element.
      var $form = $('#shoov-trail-form');

      // The form submit element.
      var $submitButton = $form.find('button[type="submit"]');

        $submitButton.bind('click', function(){
          event.preventDefault();

          // The input fields
          var $fields = $form.find('input');

          var website = $($fields[0]).val().trim();
          var email = $($fields[1]).val().trim();

           if (website == '' || email == '') {
             console.log('empty')
               return;
           }
;
          console.log(website + ' ' + email);

            return;


            $.ajax({
                url: "//formspree.io/yaron@gizra.com",
                method: "POST",
                data: {message: "hello!"},
                dataType: "json",
                success: function (response) {
                    console.log(response);
                }
            });
        })

    }

    /* ======= Fixed header when scrolled ======= */    
    $(window).on('scroll load', function() {
         
         if ($(window).scrollTop() > 0) {
             $('#header').addClass('scrolled');
         }
         else {
             $('#header').removeClass('scrolled');
             
         }
    });

    //@todo add popup message when detail's sent.
    snedShoovTrailRequest();


    /* ======= jQuery Placeholder ======= */
    /* Ref: https://github.com/mathiasbynens/jquery-placeholder */
    
    $('input, textarea').placeholder();    

    /* ======= FAQ accordion ======= */
    function toggleIcon(e) {
    $(e.target)
        .prev('.panel-heading')
        .find('.panel-title a')
        .toggleClass('active')
        .find("i.fa")
        .toggleClass('fa-plus-square fa-minus-square');
    }
    $('.panel').on('hidden.bs.collapse', toggleIcon);
    $('.panel').on('shown.bs.collapse', toggleIcon);    

    /* ======= Testimonial Bootstrap Carousel ======= */
    /* Ref: http://getbootstrap.com/javascript/#carousel */
    $('#testimonials-carousel').carousel({
      interval: 8000 
    });

});
