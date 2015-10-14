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

    // Display success message after form submit when redirecting to homepage.
    // Checking if we have a query string with "?sent=true". if so, then display
    // the success message.
    var success = location.search.split('sent=')[1];
    if (success) {
       $('.alert-success').show();

        // In case the browser supports then alter the url without refresh.
        // Changing the url to homepage without any query string.
        // This is done so the user will be able to refresh the page without the
        // success message displaying without a redirect from the form submission.
        if (history.pushState) {
            var newUrl = window.location.protocol + "//" + window.location.host + window.location.pathname;
            window.history.pushState({path: newUrl},'', newUrl);
        }
    }

});
