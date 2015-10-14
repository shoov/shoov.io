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

    // Display success message after form submit when redirecting to homepage.
    // Checking if we have a query string with "?sent=true". if so, then display
    // the success message.
    var success = location.search.split('sent=')[1];
    if (success) {
       $('.alert-success').show();

        // Alter the url without refresh. Changing the url to homepage without
        // any query string(removing "?sent=true"). This is done so the user will
        // be able to refresh the page without seeing the success message on
        // every refresh.
        if (history.pushState) {
            var newUrl = window.location.protocol + "//" + window.location.host + window.location.pathname;
            window.history.pushState({path: newUrl},'', newUrl);
        }
    }

});
