/**
# my website
@module main
@class main
**/
(function($, window, document, undefined){
    'use strict';
    var
    modules,
    vars,
    log,
    /**
    localize
    @method setVars
    @private
    **/
    setVars = function(){
        var namespaces = ['modules', 'vars'];
        namespaces.forEach(function(value){
            window[value] = {};
        });
        modules = window.modules;
        vars = window.vars;
        log = window.log || window.console.error('loglevel.js required.');
        log.setLevel('debug');
    },
    initVars = function(){
        $('.jq-vars').each(function(index, el){
            $.extend(vars, $(el).data());
        });
        log.debug('vars:', vars);
    }

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

    /**
    init handlers
    @method setHandlers
    @private
    **/
    setHandlers = function(){
        $('#jq-run-snow').each(snow);
    },

    /**
    ready
    @method ready
    @private
    **/
    ready = function(){
        initVars();
        setHandlers();
        modules.main = {};
    },
    /**
    init
    @method init
    @private
    **/
    init = function(){
        setVars();
        $(ready);
    };
    init();
}(jQuery, window, document));
