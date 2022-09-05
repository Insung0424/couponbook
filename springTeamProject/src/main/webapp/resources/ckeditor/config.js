/**
 * @license Copyright (c) 2003-2022, CKSource Holding sp. z o.o. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	
	// config.uiColor = '#AADC6E';
	config.language = 'kr';
		config.toolbarGroups = [
			{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
			{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
			{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
			{ name: 'forms', groups: [ 'forms' ] },
			{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
			{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
			'/',
			'/',
			{ name: 'links', groups: [ 'links' ] },
			{ name: 'insert', groups: [ 'insert' ] },
			{ name: 'styles', groups: [ 'styles' ] },
			{ name: 'colors', groups: [ 'colors' ] },
			{ name: 'tools', groups: [ 'tools' ] },
			{ name: 'others', groups: [ 'others' ] },
			{ name: 'about', groups: [ 'about' ] }
		];

	config.removeButtons = 'HiddenField,ShowBlocks,About,Flash,Source,Save,Templates,NewPage,Preview,Print,SelectAll,Scayt,Replace,Find,Anchor,Indent,Outdent,TextField,Textarea,Select,Button,ImageButton,Radio,Checkbox,Form,BulletedList,NumberedList,Blockquote,CreateDiv,BidiLtr,BidiRtl,Language';

	
	config.filebrowserUploadUrl      = "fileupload.do"
	//config.filebrowserUploadUrl      = '/upload.do?type=Files',
	//config.filebrowserImageUploadUrl = '/upload.do?type=Images',
	//config.filebrowserUploadMethod='form'; //파일 오류났을때 alert띄워줌
};
