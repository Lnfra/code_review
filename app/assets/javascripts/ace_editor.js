
$( document ).ready( function() {

    function checkMode(){
      if($('#editor').hasClass("markdown")){
          return "ace/mode/markdown"
      } else {
          return "ace/mode/javascript"
      }
    }

    var editor = ace.edit("editor");
    editor.setTheme("ace/theme/monokai");
    editor.getSession().setMode(checkMode());
    editor.getSession().setTabSize(4);

    //Hide the textarea with id of content
    var textarea = $('textarea#content').hide();
    editor.getSession().setValue(textarea.val());
    editor.getSession().setUseSoftTabs(true);
    document.getElementById('editor').style.fontSize='16px';
    editor.setShowPrintMargin(false);

    editor.getSession().on('change', function(){
    textarea.val(editor.getSession().getValue());
    });

    $( "#answer_code_language_id" ).change(function() {
        var selected = $('#answer_code_language_id option:selected').text().toLowerCase();
        if (selected === 'pseudo code'){
            editor.getSession().setMode('ace/mode/text');
        } else {
            editor.getSession().setMode('ace/mode/' + selected);
        }
    });

});