
var checkbox_fn = function() {
    $('#patch-test-time').hide();
    if(document.getElementById('contact_patch_test')) {
    if(document.getElementById('contact_patch_test').checked) {
        $('#patch-test-time').show();
    };
    };
    $('#contact_patch_test').change(function() {
        if(this.checked)
            $('#patch-test-time').show();
        else
            $('#patch-test-time').hide();       
    });
    
        $('#use_current_time_').change(function() {
        var now = new Date();
        var dateTimeDate = now.getFullYear() + '-' + (now.getMonth()+1) + '-' + now.getDate() + ' '
                            + now.getHours() + ':' + now.getMinutes() + ':' + now.getSeconds();
        if(this.checked)
            $('#patch_test_time_field').val(dateTimeDate);
        else
            $('#patch_test_time_field').val('');
    });

};
$(document).ready(checkbox_fn);
