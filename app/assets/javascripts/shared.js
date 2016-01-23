
var disable_enter_barcode = function() {
$('#stock_barcode').keydown(function(e) {
  if(e.keyCode == 13) { // enter key was pressed
    console.log('Enter was supressed on barcode entry');
    return false; 
  }
});
};


$(document).ready(disable_enter_barcode);