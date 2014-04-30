/**
# my website
@module main
@class main
**/
(function($, window, document, undefined){
    'use strict';
    var
    modules,
    log,
    /**
    snow fall
    @method snow
    @private
    **/
    snow = function(){
        log.debug('run snow');
        window.snowFall.snow(document.body, {
            flakeCount : 30,
            maxSpeed : 6,
            maxSize: 4,
            round: true
        });
    },
    setVars = function(){
        modules = window.modules || {};
        log = window.log;
        log.setLevel('debug');
    },
    /**
    init handlers
    @method initHandlers
    @private
    **/
    initHandlers = function(){
        $('#jq-run-snow').each(snow);
    },
    /**
    init
    @method init
    @private
    **/
    init = function(){
        setVars();
        initHandlers();
        modules.main = {};
        window.modules = modules;
    };
    $(init);
}(jQuery, window, document));
