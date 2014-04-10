function reportErrorCode(errorCode){
	if(errorCode=="0"){
		alert("操作成功");
	}
	else if(errorCode=="2"){
		alert("数据格式不正确");
	}else if(errorCode=="101"){
		alert("此套房已被下定！！");
	}else if(errorCode=="100"){
		alert("顾客已经预定此套房");
	}
	else if(errorCode=="302"){
		alert("用户登录超时");
		sessionInvaild();
	}else if(errorCode=="303"){
		alert("短信服务不可用，请稍后再试！");
	}else if(errorCode=="404"){
		alert("没有查找到您要操作的对象！");
	}else if(errorCode=="500"){
		alert("服务器出现错误，请联系管理员！");
	}else{
		alert("未知错误码:"+errorCode);
	}
}

function sessionInvaild(){
	//通知客户端session超时协议串
	var callback ="easyshow://sessionInvalid";
	try{
	eval(callback);
	}catch(e){
		
	}
}