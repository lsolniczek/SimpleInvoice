var line_total_function = function() {

	var unit_value = parseInt($(this).find('.unit_value').val());
	var quantity = parseInt($(this).find('.quantity').val());
	var vat_value = parseInt($(this).find('.vat_value').val());

	var unit_qnt = unit_value * quantity;
	var vat = vat_value/100;

	var total_line = unit_qnt + (unit_qnt*vat);
	var tota_line_formatted = $.number(total_line, 2, '.', '' );

	if (total_line == 0 || total_line == null) {
	    $(this).find('.line_total').val(" ");
	  } else {
	    $(this).find('.line_total').val(tota_line_formatted);
   	  };

}

var line_total_function_nested = function(event) {
      var field = event.field;

      var unit_value = field.find('.unit_value');
      var quantity = field.find('.quantity');
      var vat_value = field.find('.vat_value');


      $('.fields .items_table_row').on("keyup", function() {
          var unit_value_val = parseInt($(this).find(unit_value).val());
          var quantity_val = parseInt($(this).find(quantity).val());
          var vat_value_val = parseInt($(this).find(vat_value).val());

          var unit_qnt = unit_value_val * quantity_val;
          var vat = vat_value_val/100;
          var total_line = unit_qnt + (unit_qnt*vat);
          var tota_line_formatted = $.number(total_line, 2, '.', '' );

          if (total_line == 0 || total_line == null) {
            $(this).find('.line_total').val('0.00');
          } else {
            $(this).find('.line_total').val(tota_line_formatted);
          };
      });
    };

var show_hide_line_remove_ico = function(event){
      var field = event.field; 

      var remove_ico = field.find('.remove');      
      $('.fields .items_table_row').hover(
        function() {$(this).find(remove_ico).show()}, 
        function() {$(this).find(remove_ico).hide()}
        );
    };

var show_remove_ico = function() {$(this).find('.remove').show()};
var hide_remove_ico = function() {$(this).find('.remove').hide()};

var sum_total = function() {
	var sum_total = 0.00;

	$('.line .fields').each(function(index) { 
		var line_total = parseFloat($(this).find('.line_total').val()); 
		sum_total = sum_total+line_total;
	});

	$('.total p').remove();
	var sum_total_formatted = $.number(sum_total, 2, '.', ' ' );
	$('.total').append('<p>'+sum_total_formatted+'</p>');

	$('.hidden_total').val(sum_total);

};

var minus_total = function(event) {
  var field = event.field; 
  var removed_total_line = field.find('.line_total').val(" ");
  sum_total();
};

var sum_subtotal = function() {
  var sum_line_uvalue = 0.00;
  var sum_line_quantity = 0.00;
  var sum_subtotal = 0.00;

  $('.line .fields').each(function(index) { 
    var line_uvalue = parseFloat($(this).find('.unit_value').val());
    var line_quantity = parseFloat($(this).find('.quantity').val());
    var sum_subtotal_line = line_uvalue*line_quantity;
    sum_subtotal=sum_subtotal+sum_subtotal_line;
  });


  $('.subtotal p').remove();
  var sum_subtotal_formatted = $.number(sum_subtotal, 2, '.', ' ' );
  $('.subtotal').append('<p>'+sum_subtotal_formatted+'</p>');

  $('.hidden_subtotal').val(sum_subtotal);

};

var minus_subtotal = function(event) {
  var field = event.field; 
  var removed_uvalue = field.find('.unit_value').val(0.00);
  var removed_quantity = field.find('.quantity').val(0.00);
  sum_subtotal();
};

var vat_total = function() {
  var vat_total = 0.00;

  $('.line .fields').each(function(index) { 
    var line_vat = parseFloat($(this).find('.vat_value').val()); 
    var line_uvalue = parseFloat($(this).find('.unit_value').val());
    var line_quantity = parseFloat($(this).find('.quantity').val());
    var sum_vat_line = (line_uvalue*line_quantity)*(line_vat/100);
    vat_total = vat_total+sum_vat_line;
  });

  $('.total_vat p').remove();
  var sum_vat_formatted = $.number(vat_total, 2, '.', ' ' );
  $('.total_vat').append('<p>'+sum_vat_formatted+'</p>');

  $('.hidden_vat').val(vat_total);

};

var minus_vat = function(event) {
  var field = event.field; 
  var removed_vat_line = field.find('.vat_value').val(" ");
  vat_total();
};