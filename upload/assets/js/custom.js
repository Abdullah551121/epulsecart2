(function($) {

    "use strict";

    // caching selectors
    var mainWindow           = $(window),
        mainHeader           = $('header'),
        mainBody             = $('body'),
        mainStatus           = $('#status'),
        mainPreloader        = $('#preloader'),
        slickNavMenu         = $('#menu'),
        sfMenuExample        = jQuery("#sf-example"),
        galleryPhoto         = $('.gallery-photo'),
        scrollUp             = $('.scrollup'),
        dtPicker             = $('.datepicker');


    mainWindow.on('load', function() {

        // Datepicker
        dtPicker.datepicker({
            format: 'dd/mm/yyyy',
            startDate: '-3d'
        });

        // Preloader
        mainStatus.fadeOut();
        mainPreloader.delay(350).fadeOut('slow');
        mainBody.delay(350).css({
            'overflow': 'visible'
        });        
        
        slickNavMenu.slicknav();      

        // Superfish Menu
        sfMenuExample.superfish({
            pathLevels: 1,
            delay: 1000,
            animation: {opacity: 'show'},
            animationOut: {opacity: 'hide'},
            speed: 'fast',
            speedOut: 'fast',
            cssArrows: true,
            disableHI: false,
        });

        // Magnific Popup
        galleryPhoto.magnificPopup({
            type: 'image',
            gallery: {
              enabled: true
            },
        });

        // Scroll to Top
        mainWindow.on("scroll", function() {
            if ($(this).scrollTop() > 98){  
                mainHeader.addClass("sticky");
                mainBody.addClass("sticky");
                scrollUp.show();
            }
            else{
                mainHeader.removeClass("sticky");
                mainBody.removeClass("sticky");
                scrollUp.hide();
            }
        });

        // Click event to scroll to top
        scrollUp.on("click", function() {
            $('html, body').animate({
                scrollTop: 0
            }, 800);
            return false;
        });
    });
})(jQuery);