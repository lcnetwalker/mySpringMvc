/**
Custom module for you to write your own javascript functions
**/
var Custom = function () {

    // private functions & variables

    var myFunc = function(text) {
        alert(text);
    }
    
    var talbeMoveUP = function(obj)
    {
        var current=$(obj).parent().parent();
        var prev=current.prev();
        if(current.index()>0)
        {
            current.insertBefore(prev);
        }
    }
    var talbeMoveDown = function(obj)
    {
        var current=$(obj).parent().parent();
        var next=current.next();
        if(next)
        {
            current.insertAfter(next);
        }
    }

    // public functions
    return {

        //main function
        init: function () {
            //initialize here something.            
        },

        //some helper function
        talbeMoveUP: function (obj) {
        	talbeMoveUP(obj);
        },
        
        talbeMoveDown: function (obj) {
        	talbeMoveDown(obj);
        }

    };

}();

/***
Usage
***/
//Custom.init();
//custom.dosomestuff();
