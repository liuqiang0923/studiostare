
function showPages(name, callbackfunc) 
{ 	//初始化属性
	this.name = name;      //对象名称
	this.page = 1;         //当前页数
	this.pageCount = 1;    //总页数
	this.argName = 'page'; //参数名
	this.showTimes = 1;    //打印次数
	this.callbackfunc = callbackfunc;    //打印次数
}

showPages.prototype.getPage = function()
{ 	//丛url获得当前页数,如果变量重复只获取最后一个
	var args = location.search;
	var reg = new RegExp('[\?&]?' + this.argName + '=([^&]*)[&$]?', 'gi');
	var chk = args.match(reg);
	this.page = RegExp.$1;
}

showPages.prototype.checkPages = function()
{ 	//进行当前页数和总页数的验证
	if (isNaN(parseInt(this.page))) this.page = 1;
	if (isNaN(parseInt(this.pageCount))) this.pageCount = 1;
	if (this.page < 1) this.page = 1;
	if (this.pageCount < 1) this.pageCount = 1;
	if (this.page > this.pageCount) this.page = this.pageCount;
	this.page = parseInt(this.page);
	this.pageCount = parseInt(this.pageCount);
}

showPages.prototype.createHtml = function(mode){ //生成html代码
	var strHtml = '', prevPage = this.page - 1, nextPage = this.page + 1;
	if (mode == '' || typeof(mode) == 'undefined') mode = 0;
	switch (mode) 
	{
		case 0 : //模式1 (页数,首页,前页,后页,尾页)
			strHtml += 'Pages: ' + this.page + ' / ' + this.pageCount + '';
			strHtml += '';
			if (prevPage < 1) 
			{
				strHtml += '«';
				strHtml += '‹';
			} 
			else 
			{
				strHtml += '«';
				strHtml += '‹';
			}
			for (var i = 1; i <= this.pageCount; i++) 
			{
				if (i > 0) 
				{
					if (i == this.page) 
					{
						strHtml += '[' + i + ']';
					} 
					else 
					{
						strHtml += '[' + i + ']';
					}
				}
			}
			if (nextPage > this.pageCount) 
			{
				strHtml += '›';
				strHtml += '»';
			} 
			else 
			{
				strHtml += '›';
				strHtml += '»';
			}
			strHtml += '';
			break;
		case 1 : //模式1 (10页缩略,首页,前页,后页,尾页)
			strHtml += 'Pages: ' + this.page + ' / ' + this.pageCount + '';
			strHtml += '';
			if (prevPage < 1) 
			{
				strHtml += '«';
				strHtml += '‹';
			} 
			else 
			{
				strHtml += '«';
				strHtml += '‹';
			}
			if (this.page % 10 ==0) 
			{
				var startPage = this.page - 9;
			} 
			else 
			{
				var startPage = this.page - this.page % 10 + 1;
			}
			if (startPage > 10) 
				strHtml += '...';
			for (var i = startPage; i < startPage + 10; i++) 
			{
				if (i > this.pageCount) break;
				if (i == this.page) 
				{
					strHtml += '[' + i + ']';
				} 
				else 
				{
					strHtml += '[' + i + ']';
				}
			}
			if (this.pageCount >= startPage + 10) strHtml += '...';
			if (nextPage > this.pageCount) 
			{
				strHtml += '›';
				strHtml += '»';
			} 
			else 
			{
				strHtml += '›';
				strHtml += '»';
			}
			strHtml += '';
			break;
		case 2 : //模式2 (前后缩略,页数,首页,前页,后页,尾页)
			//strHtml += this.page + '/' + this.pageCount + '页 ';
			strHtml += '';

			if (this.pageCount > 0 && this.pageCount < 11) {
				for (var i=1; i<=this.pageCount; i++) {
					if (this.page!=i) {
						strHtml += '<span class="p1" onclick="'+this.callbackfunc+'('+i+')">'+i+'</span>';
					} else {
						strHtml += '<span class="p2">'+i+'</span>';
					}
				}
			} else {

				if (this.page != 1) strHtml += '<span class="p1" onclick="'+this.callbackfunc+'(1)">1</span>';
				if (this.page >= 5) strHtml += '...';
				if (this.pageCount > this.page + 2) 
				{
					var endPage = this.page + 2;
				} 
				else 
				{
					var endPage = this.pageCount;
				}
				for (var i = this.page - 2; i <= endPage; i++) 
				{
					if (i > 0) 
					{
						if (i == this.page) 
						{
							strHtml += '<span class="p2">' + i + '</span>';
						} 
						else 
						{
							if (i != 1 && i != this.pageCount) 
							{
								strHtml += '<span class="p1" onclick="'+this.callbackfunc+'('+i+')">' + i + '</span>';
							}
						}
					}
				}
				if (this.page + 3 < this.pageCount) strHtml += '...';
				if (this.page != this.pageCount) {
					strHtml += '<span class="p1" onclick="'+this.callbackfunc+'('+this.pageCount+')">' + this.pageCount + '</span>';
					//strHtml += '<span class="p1">' + this.pageCount + '</span>';
				}
			}

			break;
		case 3 : //模式3 (箭头样式,首页,前页,后页,尾页) (only IE)
			strHtml += 'Pages: ' + this.page + ' / ' + this.pageCount + '';
			strHtml += '';
			if (prevPage < 1) 
			{
				strHtml += '9';
				strHtml += '7';
			} 
			else 
			{
				strHtml += '9';
				strHtml += '7';
			}
			if (nextPage > this.pageCount) 
			{
				strHtml += '8';
				strHtml += ':';
			} 
			else 
			{
				strHtml += '8';
				strHtml += ':';
			}
			strHtml += '';
			break;
		case 4 : //模式4 (下拉框)
			if (this.pageCount < 1) 
			{
				strHtml += '';
				for (var i = 1; i <= this.pageCount; i++) 
				{
					if (this.page == i) chkSelect=' selected="selected"';
					else chkSelect='';
					strHtml += '';
				}
			}
			strHtml += '';
			break;
		case 5 : //模式5 (输入框)
			strHtml += '';
			if (this.pageCount < 1) 
			{
				strHtml += '';
				strHtml += '';
			} 
			else 
			{
				strHtml += '';
				strHtml += '';
				strHtml += '';
				strHtml += '';
			}
			strHtml += '';
			break;
		default :
			strHtml = 'Javascript showPage Error: not find mode ' + mode;
			break;
	}
	return strHtml;
}

showPages.prototype.createUrl = function (page) 
{ 	//生成页面跳转url
	if (isNaN(parseInt(page))) page = 1;
	if (page < 1) page = 1;
	if (page > this.pageCount) page = this.pageCount;
	var url = location.protocol + '//' + location.host + location.pathname;
	var args = location.search;
	var reg = new RegExp('([\?&]?)' + this.argName + '=[^&]*[&$]?', 'gi');
	args = args.replace(reg,'$1');
	if (args == '' || args == null) 
	{
		args += '?' + this.argName + '=' + page;
	} 
	else if (args.substr(args.length - 1,1) == '?' || args.substr(args.length - 1,1) == '&') 
		{
			args += this.argName + '=' + page;
		} 
		else {
			args += '&' + this.argName + '=' + page;
		}
	return url + args;
}

showPages.prototype.toPage = function(page)
{ 	//页面跳转
	var turnTo = 1;
	if (typeof(page) == 'object') 
	{
		turnTo = page.options[page.selectedIndex].value;
	} 
	else 
	{
		turnTo = page;
	}
	self.location.href = this.createUrl(turnTo);
}

showPages.prototype.printHtml = function(mode)
{ 	//显示html代码
	//this.getPage();
	this.checkPages();
	this.showTimes += 1;
	document.getElementById(this.name).innerHTML = this.createHtml(mode);
}

showPages.prototype.formatInputPage = function(e)
{ //限定输入页数格式
	var ie = navigator.appName.indexOf("Microsoft Internet Explorer") != -1 ? true:false;
	if(!ie) var key = e.which;
	else var key = event.keyCode;
	if (key == 8 || key == 46 || (key >= 48 && key <= 57)) return true;
	return false;
}

function generatePageBar(pageNo, totalpages, pagebarId, callbackFunc) {
	var pg = new showPages(pagebarId, callbackFunc);
	pg.page = pageNo;  // 当前页数
	pg.pageCount = totalpages;  // 总页数
	pg.printHtml(2);
}

function clearPageBar(pagebarId) {
	var bar = document.getElementById(pagebarId);
	if (bar) {
		bar.innerHTML = '';
	}
}