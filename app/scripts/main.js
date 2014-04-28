/**
# my website
@class main
**/
(function($, window, document, undefined){
    'use strict';
    var
    /**
    snow fall
    @method snow
    @private
    **/
    snow = function(){
        window.snowFall.snow(document.body, {
            flakeCount : 30,
            maxSpeed : 6,
            maxSize: 4,
            round: true
        });
    },
    /**
    init handlers
    @method initHandlers
    @private
    **/
    initHandlers = function(){
        $('.jq-run-snow').each(snow);
    },
    /**
    init
    @method init
    @private
    **/
    init = function(){
        initHandlers();
    };
    $(init);
}(jQuery, window, document));
