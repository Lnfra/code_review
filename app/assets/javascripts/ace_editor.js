
$( document ).ready( function() {

  var editor = ace.edit("editor");
  editor.setTheme("ace/theme/monokai");
  editor.getSession().setMode("ace/mode/javascript");

  //Hide the textarea with id of content
  var textarea = $('textarea#content').hide();
  editor.getSession().setValue(textarea.val());

  editor.getSession().on('change', function(){
    textarea.val(editor.getSession().getValue());
  });

});