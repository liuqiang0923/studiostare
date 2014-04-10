
/*
    ----------- Calendar : Day Selecter ------------
    
        author : satellite @ cnvery
        create : 2005-11-17
        site   : http://www.cnvery.net/

    ------------------------------------------------


    ----------- Example ----------------------------

    <input type='text' name='someDateField' size='13' readonly='readonly' onclick='javascript:calendar.setHook(this)' />

    so easy:
    onclick='javascript:calendar.setHook(this)'

    and you can set the field readonly
    readonly='readonly'

    ------------------------------------------------
*/
function cnVeryCalendar()
{
    //Style
    var border_frame        = '#ED5565';
    var border_inner        = '#f6f6f6';
    var fore_frameCaption    = '#ffffff';
    var back_frameCaption    = '#ED5565';
    var fore_currentMonth    = '#ff0000';
    var back_weekName        = '#e9e9e9';
    var back_nullDay        = '#fafafa';
    var fore_dayMouseOver    = '#ff6600';
    var back_dayMouseOver    = '#eeeeee';
    var font_cnChar        = 'font-size:16px;padding: 10px 5px; ';
    var font_numChar        = 'text-align:center;';
    var style_cell        = ';line-height:20px; border-color:' + border_inner;

    //Declare
    var reciever;
    var today = new Date();
    var y = today.getFullYear();
    var m = today.getMonth() + 1;

	var __cnVeryCalendarContainer;

    //Return Max Days In The Month
    this.daysInMonth = function(y, m)
    {
        switch (m)
        {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                return 31;
            case 4:
            case 6:
            case 9:
            case 11:
                return 30;
            case 2:
                //Is Leep Year
                if (y % 4 != 0)
                {
                    return 28;
                }
                if (y % 100 == 0)
                {
                    return y % 400 == 0 ? 29 : 28;
                }
                return 29;
        }
    }

	this.pad = function(e) {
		if (e<10) {
			return '0'+e;
		}
		return e;
	}

	this.parseDay = function(d) {
		var digits = d.split("-");
		if (digits.length!=3) {
			return new Date(y, m-1, 1);
		}
		
		var _y = digits[0];
		var _m = digits[1]*1;
		var _d = digits[2]*1;
		
		if (isNaN(_y) || isNaN(_m) || isNaN(_d)) {
			return new Date(y, m-1, 1);
		}
		return new Date(_y, _m-1, _d);
	}

    //Generate Codes
    this.generateCalendarTable = function()
    {
    	var _day = arguments.length == 1 ? arguments[0] : new Date(y, m-1, 1);
        var i;
        //var j = new Date(y, m-1, 1).getDay();
        //var k = this.daysInMonth(y, m);
        var j = new Date(_day.getFullYear(), _day.getMonth(), 1).getDay();
        var k = this.daysInMonth(_day.getFullYear(), _day.getMonth()+1);

        var body = '';

        //Frame Table Header
        body += "<table align='center' cellpadding='0' cellspacing='1' width='100%' height='188' style='border:1px solid " + border_frame + "; background-color: white;'>";
        body += "    <tr>";
        body += "        <td style='background-color:" + back_frameCaption + ";'>";
        body += "            <div style='color:" + fore_frameCaption + "; float:left'></div>";
        body += "            <div style='float:right; padding: 10px 5px;'>";
        body += "				 <a href='javascript:calendar.setValue(\"" + today.getFullYear() + "-" + this.pad(today.getMonth()+1) + "-" + this.pad(today.getDate()) + "\");'";
        body += "				    style='color:" + fore_frameCaption + "; text-decoration:none;" + font_cnChar + "'>[ 今天 ]</a> ";
        body += "                <a href='javascript:calendar.setValue(\"\")' style='color:" + fore_frameCaption + "; text-decoration:none;" + font_cnChar + "'>[ 清空 ]</a> ";
        body += "                <a href='javascript:calendar.fadeOut()' style='color:" + fore_frameCaption + "; text-decoration:none;" + font_cnChar + "'>[ 关闭 ]</a>";
        body += "            </div>";
        body += "        </td>";
        body += "    </tr>";
        body += "    <tr>";
        body += "        <td valign=top>";
        body += "            <table width='100%' cellpadding='0' cellspacing='2' border='0'>";
        body += "                <tr>";
        body += "                    <td style='" + font_cnChar + "'><a href='javascript:calendar.loadPreviousYear()' style='text-decoration:none; color:" + fore_dayMouseOver + "'>&lt;上年 | </a> <a href='javascript:calendar.loadNextYear()' style='text-decoration:none; color:" + fore_dayMouseOver + "'>下年&gt;</a></td>";
        body += "                    <td nowrap='nowrap' style='text-align:center;color:" + fore_currentMonth + ";" + font_cnChar + "'><b>"+ _day.getFullYear() + "年" + (_day.getMonth()+1) + "月</b> </td>";
        body += "                    <td style='text-align:right;" + font_cnChar + "'><a href='javascript:calendar.loadPreviousMonth()' style='text-decoration:none; color:" + fore_dayMouseOver + "'>上月 | </a> <a href='javascript:calendar.loadNextMonth()' style='text-decoration:none; color:" + fore_dayMouseOver + "'>下月</a></td>";
        body += "                </tr>";
        body += "            </table>";
        body += "        </td>";
        body += "    </tr>";
        body += "    <tr>";
        body += "        <td valign=top>";

        //Calendar Table Header
        body += "<table align='center' width='100%' cellpadding='0' cellspacing='0' style='border: 1px solid #fff; border-collapse:collapse; table-layout:fixed;'>";
        body += "    <tr align='center' style='background-color:" + back_weekName + "'>";
        body += "        <td style='" + font_cnChar + "'>日</td>";
        body += "        <td style='" + font_cnChar + "'>一</td>";
        body += "        <td style='" + font_cnChar + "'>二</td>";
        body += "        <td style='" + font_cnChar + "'>三</td>";
        body += "        <td style='" + font_cnChar + "'>四</td>";
        body += "        <td style='" + font_cnChar + "'>五</td>";
        body += "        <td style='" + font_cnChar + "'>六</td>";
        body += "    </tr>";

        //Insert Null Days Before The First Day In Current Month
        if (j != 0)
        {
            body += "<tr align='center'>";
            body += ("<td style='background:" + back_nullDay + style_cell + "' colspan='" + j + "'></td>");
        }

        //Loop Each Days In Current Month
        for (i=1; i<=k; i++)
        {
            //Row Begin
            if ((i+j) % 7 == 1)
            {
                body += "<tr align='center'>";
            }

            //Cells Day By Day
            body += "<td ";
            body += " onclick=\"calendar.setValue('" + _day.getFullYear() + "-" + this.pad(_day.getMonth()+1) + "-" + this.pad(i) + "')\"";
            if (_day.getFullYear() == today.getFullYear() && _day.getMonth() == today.getMonth() && i == today.getDate())
            {
                body += " style='padding: 10px; cursor:pointer; font-size: 18px; font-weight: bold;  " + font_numChar + "; background: #ED5565; color: #fff;'";
            }
            else
            {
                body += " style='padding: 10px; cursor:pointer; font-size: 18px; " + font_numChar + "'";
	            body += " onmouseover=\"this.style.backgroundColor='" + back_dayMouseOver + "'; this.style.color='" + fore_dayMouseOver + "'\"";
                body += " onmouseout=\"this.style.backgroundColor=''; this.style.color=''\"";
            }
            body += ">" + i + "</td>";

            //Row End
            if ((i+j) % 7 == 0)
            {
                body += ("</tr>");
            }
        }

        //Append Null Days After The Last Day In Current Month
        if ((i+j) % 7 != 0)
        {
            body += ("<td style='background:" + back_nullDay + style_cell + "' colspan='" + (8 - (i+j)%7) + "'></td>");
            body += ("</tr>");
        }
        if (j < (36-k))
        {
            body += ("<tr><td colspan='7' style='background:" + back_nullDay + style_cell + "'>&nbsp;</td></tr>");
        }
        if (j == 0 && k == 28)
        {
            body += ("<tr><td colspan='7' style='background:" + back_nullDay + style_cell + "'>&nbsp;</td></tr>");
        }

        //End Calendar Table
        body += "</table>";

        //End Frame Table
        body += "</td></tr></table>";

		y = _day.getFullYear();
		m = _day.getMonth()+1;

        //Return
        return body;
    }


    //Load Previous Year
    this.loadPreviousYear = function()
    {
        y--;
        __cnVeryCalendarContainer.innerHTML = this.generateCalendarTable(new Date(y,m-1,1));
    }
    this.loadNextYear = function()
    {
        y++;
        __cnVeryCalendarContainer.innerHTML = this.generateCalendarTable(new Date(y,m-1,1));
    }
    this.loadPreviousMonth = function()
    {
        m--;
        if (m < 1)
        {
            m = 12;
            y--;
        }
        __cnVeryCalendarContainer.innerHTML = this.generateCalendarTable(new Date(y,m-1,1));
    }
    this.loadNextMonth = function()
    {
        m++;
        if (m > 12)
        {
            m = 1;
            y++;
        }
        __cnVeryCalendarContainer.innerHTML = this.generateCalendarTable(new Date(y,m-1,1));
    }


    //Get Position
    this.getAbsolutePosition = function(element)
    {
        var point = { x: element.offsetLeft, y: element.offsetTop };
        //Recursion
        if (element.offsetParent)
        {
            var parentPoint = this.getAbsolutePosition(element.offsetParent);
            point.x += parentPoint.x;
            point.y += parentPoint.y;
        }
        return point;
    };


    //Pop Layer
    this.setHook = function(dateField)
    {
		__cnVeryCalendarContainer = document.getElementById('__cnVeryCalendarContainer');
        if (__cnVeryCalendarContainer.style.display != 'none' && reciever.id == dateField.id)
        {
            __cnVeryCalendarContainer.style.display = 'none';
            return;
        }
        reciever = dateField;

        y = today.getFullYear();
        m = today.getMonth() + 1;
        //----------------------------

        var point = this.getAbsolutePosition(dateField);
        __cnVeryCalendarContainer.style.left = (point.x) + 'px';
        __cnVeryCalendarContainer.style.top  = (point.y + + dateField.offsetHeight + 2) + 'px';
        __cnVeryCalendarContainer.innerHTML  = this.generateCalendarTable(this.parseDay(dateField.value));
        __cnVeryCalendarContainer.style.display = '';
    }


    //Hide Layer
    this.fadeOut = function()
    {
        __cnVeryCalendarContainer.style.display = 'none';
    }


    //Click a Day Cell To Add The Value
    this.setValue = function(date)
    {
        reciever.value = date;
        this.fadeOut();
    }
}

//Render Instance
document.write("<div id='__cnVeryCalendarContainer' style='width:320px; height:250px; position:absolute; float:left; display:none; z-index:999'></div>");

var calendar = new cnVeryCalendar();