// $(document).ready(function(){
//   //alert("Holy guacamole! You should check in on some of those fields below.");
//   $('#alert').click(function(){
//     $('#alert').hide(); // Esto oculta todos los nodos del tipo p del DOM
//   });
// });


//para pagina index
$(document).ready(function(){
  $('.add-to-existing').hide();

  $('.add-to-existing-button').click(function(){
    $('.add-to-existing-button').hide();
    $('.add-to-existing').show();
  });
});


//para pagina profile
  // $(document).ready(function(){
  //   console.log('jQuery está funcionando');
  //   $('.editando').hide();
  //   $('#listo').hide();
  //
  //   $('#editar').click(function(){
  //     $('#solo-ver').hide();
  //     $('.editando').show();
  //     $('#listo').show();
  //     $('#editar').hide();
  //   });
  // });

//
$(document).on('turbolinks:load', function() {
  console.log('jQuery está funcionando');
  $('.editando')[0].hide();
  $('.editando')[1].hide();
  $('#listo').hide();

  $('#editar').click(function(){
    $('#solo-ver').hide();
    $('.editando').show();
    $('#listo').show();
    $('#editar').hide();
  });

});
