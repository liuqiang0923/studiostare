

function byId(id) {
	return document.getElementById(id);
}
function byName(name) {
	return document.getElementsByName(name);
}
function getValue(id) {
	var obj = byId(id);
	return obj ? obj.value : '';
}
function getValuesByName(name) {
	var objs = byName(name);
	if (!objs || objs.length == 0) return '';
	
	var values = '';
	for (var i=0; i<objs.length; i++) {
		if (i>0) values += ',';
		values += objs[i].value;
	}
	return values;
}
function setValue(id, value) {
	return byId(id).value = value;
}
function hide(obj){show_(obj,'none');}
function show(obj){show_(obj,'');}
function show_(obj,visual){
    if (!obj) return;
    if (typeof(obj)=='string' ) {
        var obj2 = document.getElementById(obj);
        if (obj2){
            obj2.style.display=visual;
        }
    } else {
        obj.style.display=visual;
    }
}

function checkall(checkboxName, flag) {
	shiftAllBox(checkboxName, flag);
}

function shiftAllBox(chkName, flag) {
	var chkElemGroup = document.getElementsByName(chkName);
	if (chkElemGroup != null) {
		for (var i = 0; i < chkElemGroup.length; i++) {
			chkElemGroup[i].checked = flag;
		}
	}
}

function changeColor(obj) {
	obj.style.backgroundColor = "#ffffa2";
}
function defaultColor(obj) {
	obj.style.backgroundColor = "#fafafa";
}


function hasTicked(chkboxname) {
	var boxes = document.getElementsByName(chkboxname);
	if (boxes==null || boxes.length==0)
		return false;
	
	for (var i=0; i<boxes.length; i++) {
		if (boxes[i].checked)
			return true;
	}
	return false;
}

function getTickedCheckboxArray(chkboxname,returnObj) {
	var boxes = document.getElementsByName(chkboxname);
	var ticked = [];
	if (boxes==null || boxes.length==0)
		return ticked;
	
	for (var i=0; i<boxes.length; i++) {
		if (boxes[i].checked) {
			if (returnObj) {
				ticked.push(boxes[i]);
			} else {
				ticked.push(boxes[i].value);
			}
		}
	}
	return ticked;
}


function getTickedCheckbox(chkboxname) {
	return getCheckboxes(chkboxname, 'checked');
}

function getCheckboxes(chkboxname, checkedStatus) {
	var boxes = document.getElementsByName(chkboxname);
	if (boxes==null || boxes.length==0)
		return '';
	
	var values = '';
	for (var i=0; i<boxes.length; i++) {
		if (checkedStatus == 'checked') {
			if ( boxes[i].checked) {
				if(boxes[i].value != 'on'){
					values += (values?',':'') + boxes[i].value;
				}
			}
		}
		else if (checkedStatus == 'unchecked') {
			if (!boxes[i].checked) {
				values += (values?',':'') + boxes[i].value;
			}
		}
		else {
			values += (values?',':'') + boxes[i].value;
		}
	}
	return values;
}

function getTickedIdCheckbox(chkboxname) {
	var boxes = document.getElementsByName(chkboxname);
	if (boxes==null || boxes.length==0)
		return '';
	
	var ticked = '';
	for (var i=0; i<boxes.length; i++) {
		if (boxes[i].checked) {
			if(ticked) {
				ticked = ticked+','+boxes[i].id;
			} else {
				ticked = boxes[i].id;  
			}
		}
	}
	return ticked;
}

function trimStr(str) { 
	return str.replace(/(^\s*)(\s*$)/g,'');
}

function showMessage(req) {
	// the response text looks like: {"result":"save ok", etc...}
	var x = eval('('+req.responseText+')');
	alert(x.result);
}
function succ(req) {
	showMessage(req);
	if(top.closefloat) top.closefloat(true);
}

function cssclick(obj,normalClass,clickClass){
	obj.className = clickClass;
	setTimeout(function(){obj.className = normalClass;},100);
}

var progidx = 0, progblock, progbar, progtimeout;
function progress(resetFlag) {
	if (resetFlag) progressReset();
	
	if (!progbar) { progbar = byId('progressbar');}
	if (!progblock) { progblock = byId('progressblock');}
	var maxlength = progbar.offsetWidth;
	if (progidx<1) {
		show(progbar);
	}
    if(progidx<maxlength) {
        progidx++;
    } else {
        progidx=-20;
    }
    progblock.style.marginLeft=progidx+'px';
    progtimeout = setTimeout(progress, 20);
}
function progressReset() {
	progidx = 0;
	if (!progblock) { progblock = byId('progressblock');}
	progblock.style.marginLeft='-20px';
	hide(progbar);
	clearTimeout(progtimeout);
}
//--------------------------------------------------------------------
//		Image Util Methods
//--------------------------------------------------------------------

/**
 * 在图片加载完成时，调用此方法，自动调整图片的大小和位置。
 * 调整方式为，以图片小的一边为基准，等比例放大到容器的尺寸，
 * 另一边同样等比例缩放，然后居中。
 * 例如，给定容器尺寸为200X150，某图片大小为120X80，
 * 那么经过处理后，图片的大小为200X167，且距离容器左边距为-8.
 *
 * img为给定图片，targetSize为适配的大小。
 * 用法示例：<img src="logo.jpg" onload='imageAdapte(this,200,150)'>
 */
function imageAdapte(img, targetWidth, targetHeight) {
	var w = img.width, h = img.height;
	var rationW = targetWidth / w;
	var rationH = targetHeight / h;
	var ratio = Math.max(rationW,rationH);
	
	var w2 = parseInt(w * ratio);
	var h2 = parseInt(h * ratio);
	img.style.width = w2+'px';
	img.style.height = h2+'px';
	
	if (rationW==ratio) {
		img.style.marginLeft = 0;
		img.style.marginTop = parseInt((targetHeight - h2) / 2) + 'px';
	} else {
		img.style.marginLeft = parseInt((targetWidth - w2) / 2) + 'px';
		img.style.marginTop = 0;
	}
}

String.format = function() { 
    if (arguments.length == 0) 
        return null; 
    var str = arguments[0]; 
    for ( var i = 1; i < arguments.length; i++) { 
        var re = new RegExp('\\{' + (i - 1) + '\\}', 'gm'); 
        str = str.replace(re, arguments[i]); 
    } 
    return str; 
}; 


