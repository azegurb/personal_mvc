$(function () {

    // $('#contact-form').validator();

    $('#form-submit').on('submit', function (e) {
        e.preventDefault();
        // if (!e.isDefaultPrevented()) {
        var url = "/ajaxs/contact";
        alert('fucl')

        $.ajax({
            type: "POST",
            url: url,
            data: $(this).serialize(),
            success: function (data)
            {
                alert(data)
                var messageAlert = 'alert-' + data.type;
                var messageText = data.success;

                console.log(data)

                var alertBox = '<div class="alert ' + messageAlert + ' alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>' + messageText + '</div>';
                if (messageAlert && messageText) {
                    $('#contact-form').find('.messages').html(alertBox);
                    $('#contact-form')[0].reset();
                    grecaptcha.reset();
                }
            }
        });
        return false;
        // }
    })

    // $(document).on('submit','#form-submit',function(){
    //     e.preventDefault();
    //     // if (!e.isDefaultPrevented()) {
    //     var url = "/ajaxs/contact";
    //     alert('fucl')
    //
    //     $.ajax({
    //         type: "POST",
    //         url: url,
    //         data: $(this).serialize(),
    //         success: function (data)
    //         {
    //             alert(data)
    //             var messageAlert = 'alert-' + data.type;
    //             var messageText = data.success;
    //
    //             console.log(data)
    //
    //             var alertBox = '<div class="alert ' + messageAlert + ' alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>' + messageText + '</div>';
    //             if (messageAlert && messageText) {
    //                 $('#contact-form').find('.messages').html(alertBox);
    //                 $('#contact-form')[0].reset();
    //                 grecaptcha.reset();
    //             }
    //         }
    //     });
    //     return false;
    //     // }
    // });

});