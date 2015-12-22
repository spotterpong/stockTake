$(document).ready(function() {
    $('#patch-test-time').hide();
    $('#contact_patch_test').change(function() {
        if(this.checked)
            $('#patch-test-time').show();
        else
            $('#patch-test-time').hide();       
    });
    
        $('#use_current_time_').change(function() {
        var now = new Date();
        var dateTimeDate = now.getFullYear() + '-' + now.getMonth() + '-' + now.getDate() + ' '
                            + now.getHours() + ':' + now.getMinutes() + ':' + now.getSeconds();
        if(this.checked)
            $('#patch_test_time_field').val(dateTimeDate);
        else
            $('#patch_test_time_field').val('');
    });

});
