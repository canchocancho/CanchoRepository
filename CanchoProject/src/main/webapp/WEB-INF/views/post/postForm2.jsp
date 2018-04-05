<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>POST2</title>
	
	<style type="text/css">
		#div_root{
			margin: auto;
			width: 100%;
			height:100px;
			background-color:#ff9999;
			text-align:center;
		}
		
		#div_top{
			width:100%;
			height:100px;
			background-color:#ffe699;
			text-align:center;
		}
		
		#div_menu{
			width:20%;
			height:500px;
			float:left;
			background-color:#99ffb3;
			text-align:center;
		}
		
		#div_con{
			width:80%;
			height:500px;
			float:left;
			background-color:#99b3ff;
			text-align:center;
		}
	</style>
	
	<SCRIPT>
	<!--
	var count = 1; // textarea 의 name 에 사용할 카운터를 설정합니다
	var num = 1; // textarea 에 디폴트로 보여줄 텍스트 번호를 설정 합니다
	
	function addBox (x) {
	  if (document.all) {  // 인터넷 익스플로러 4.0 이상이면,
	    var Commentext = '<p><textarea NAME="Comment' + count++ + '" rows="5" cols="50" style="background-color:#F5F5F5">코멘트 '+num++ +'<\/textarea>';
	    x.insertAdjacentHTML('beforeEnd', Commentext)
	  }
	  else if (document.getElementById) {  // 넷스케이프 6.0 이상이면,
	    var newArea = document.createElement('textarea');
	    newArea.name = 'Comment' + count++;
	    newArea.rows = 5;
	    newArea.cols = 50;
	    x.appendChild(document.createElement('p'));
	    x.appendChild(newArea);
	  }
	  else if (document.layers) {  // 넷스케이프 4.0 이상이면,
	    var newLayer = new Layer (window.innerWidth);
	    var Commentext = '';
	    Commentext += '<html><body><form name="myForm">';
	    Commentext += '<textarea name="Comment" rows="5" cols="50" style="background-color:#F5F5F5">코멘트 '+num++ +'<\/textarea>';
	    Commentext += '<\/form><\/body><\/html>';
	    newLayer.document.write(Commentext);
	    newLayer.document.close();
	    newLayer.top = document.height;
	    document.height += newLayer.document.height;
	    newLayer.visibility = 'show';
	  }
	 else {alert('네츠케이프와 익스플로러 4.0 이상에서만 사용할 수 있습니다')};
	}
	//-->
	</SCRIPT>

	</head>
	
	<body>
		<div id="div_root"><h1>div를 새로 파서 만들어봅니다</h1></div>
		<div id="div_top">
		
			
		
		</div>
		<div id="div_menu">유저리스트</div>
		<div id="div_con">
		
			<FORM NAME="myForm" method=post action="">

			<INPUT TYPE="submit" value=" 전송하기 ">
			</FORM>

		</div>
	</body>
</html>