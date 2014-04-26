(function($, window, doc, undef){
    'use strict';

    var snow = function(){
        snowFall.snow(document.body, {
            flakeCount : 30,
            maxSpeed : 6,
            maxSize: 4,
            round: true
        });
    },
    initHandlers = function(){
        $('.jq-run-snow').each(snow);
    },
    init = function(){
        initHandlers();
    };
    $(init);
}(jQuery, window, document));
