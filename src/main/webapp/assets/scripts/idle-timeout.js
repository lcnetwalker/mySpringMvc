var IdleTimeout = function () {

    return {

        //main function to initiate the module
        init: function () {

            // cache a reference to the countdown element so we don't have to query the DOM for it on each ping.
            var $countdown;

            $('body').append('<div class="modal fade" id="idle-timeout-dialog" data-backdrop="static"><div class="modal-dialog modal-small"><div class="modal-content"><div class="modal-header"><h4 class="modal-title">您的会话即将到期。</h4></div><div class="modal-body"><p><i class="fa fa-warning"></i> 您的会话将被锁定在 <span id="idle-timeout-counter"></span> 秒。</p><p>要继续您的会话?</p></div><div class="modal-footer"><button id="idle-timeout-dialog-logout" type="button" class="btn btn">不，退出</button><button id="idle-timeout-dialog-keepalive" type="button" class="btn btn-primary" data-dismiss="modal">是的，继续工作</button></div></div></div></div>');
                    
            // start the idle timer plugin
            $.idleTimeout('#idle-timeout-dialog', '.modal-content button:last', {
                idleAfter: 1800, // seconds
                timeout: 120000, // 毫秒 to timeout
                pollingInterval: 1800, // seconds
                keepAliveURL: '/keepalive',
                serverResponseEquals: 'OK',
                onTimeout: function(){
                    window.location = "/logout";
                },
                onIdle: function(){
                    $('#idle-timeout-dialog').modal('show');
                    $countdown = $('#idle-timeout-counter');

                    $('#idle-timeout-dialog-keepalive').on('click', function () { 
                        $('#idle-timeout-dialog').modal('hide');
                    });

                    $('#idle-timeout-dialog-logout').on('click', function () { 
                        $('#idle-timeout-dialog').modal('hide');
                        $.idleTimeout.options.onTimeout.call(this);
                    });
                },
                onCountdown: function(counter){
                    $countdown.html(counter); // update the counter
                }
            });
            
        }

    };

}();