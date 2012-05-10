$(document).ready(function(){
  $('#busqueda').keyup(function () { 
    $.get($('#filtro_clientes').attr('action'),  
    $('#filtro_clientes').serialize(), null, 'script');
    return false;
  });
//  $('.paper li').click(function(){
//  	$('#detail-panel').html('<%=j render("detalleCliente") %>'); 
//  });
  $("#list-results-panel").niceScroll({cursorcolor:"#00F"});
  $('#boton-back').click(function(){
  	$('#main-panel').show('slow');
  	$('#boton-back').hide('fast');
  });
 });