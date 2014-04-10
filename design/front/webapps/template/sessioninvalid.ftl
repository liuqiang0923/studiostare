<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>登录超时</title>
		<script>
			function sessionInvaild(){
				//通知客户端session超时协议串
				location.href="easyshow://sessioninvalid";
				//eval(callback);
			}
		</script>
	</head>
	<body onload="sessionInvaild();">
		登录超时...
	</body>
</html>
