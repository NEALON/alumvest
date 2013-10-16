CKEDITOR.editorConfig = (config) ->
  config.toolbar = [
  	{ name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source' ] },
  	{ name: 'clipboard', groups: [ 'clipboard', 'undo' ], items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
  	{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ], items: [ 'Scayt' ] },
    { name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
    { name: 'color', items: [ 'TextColor', 'BGColor' ] },
    { name: 'justify', items: [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
   	{ name: 'tools', items: [ 'Maximize' ] },
   	{ name: 'others', items: [ '-' ] },
   	{ name: 'about', items: [ 'About' ] }
  	'/',
  	{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Strike', '-', 'RemoveFormat' ] },
  	{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] },
  	{ name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
  	{ name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule', 'SpecialChar' ] },
  ];

  config.toolbarGroups = [
  	{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
  	{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
  	{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ] },
  	{ name: 'forms' },
    { name: 'styles' },
   	{ name: 'colors' },
   	{ name: 'tools' },
   	{ name: 'others' },
   	{ name: 'about' }
  	'/',
  	{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
  	{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align' ] },
  	{ name: 'links' },
  	{ name: 'insert' },
  ];

  config.filebrowserUploadUrl = '/common/filepicker';
