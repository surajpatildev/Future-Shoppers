<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<s:url value="/resources/css" var="css" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<!-- Bootstrap Bootswatch skeatch theame -->
<link href="${css}/bootstrap.minty.css" rel="stylesheet">

<style type="text/css">
	  html{
  }
  body{
      margin: 0;
      padding: 0;
      background: #e7ecf0;
      font-family: Arial, Helvetica, sans-serif;
  }
  *{
      margin: 0;
      padding: 0;
  }
  p{
      font-size: 12px;
      color: #373737;
      font-family: Arial, Helvetica, sans-serif;
      line-height: 18px;
  }
  p a{
      color: #218bdc;
      font-size: 12px;
      text-decoration: none;
  }
  a{
      outline: none;
  }
  .f-left{
      float:left;
  }
  .f-right{
      float:right;
  }
  .clear{
      clear: both;
      overflow: hidden;
  }
  #block_error{

      height: 550px;
      border: 1px solid #cccccc;
      -moz-border-radius: 4px;
      -webkit-border-radius: 4px;
      border-radius: 4px;
      background: #fff url(http://www.ebpaidrev.com/systemerror/block.gif) no-repeat 0 51px;
  }
  #block_error div{
      padding: 100px 40px 0 186px;
  }
  
 @media screen and (max-width:500px){
   #block_error div{
      padding: 100px 40px 0 10px;
  }
  
}
  #block_error div h2{
      color: #218bdc;
      font-size: 24px;
      display: block;
      padding: 0 0 14px 0;
      border-bottom: 1px solid #cccccc;
      margin-bottom: 12px;
      font-weight: normal;
  }
  
  
  @import url(http://fonts.googleapis.com/css?family=Open+Sans:700);

#cssmenu {
	background: #78C2AD;
	width: auto;
}

#cssmenu ul {
	font-family: "Montserrat", -apple-system, system-ui, BlinkMacSystemFont,
		"Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
	list-style: none;
	margin: 0;
	margin-top: 0;
	padding: 0;
	line-height: 1;
	display: block;
	zoom: 1;
}

#cssmenu ul:after {
	content: " ";
	display: block;
	font-size: 0;
	height: 0;
	clear: both;
	visibility: hidden;
}

#cssmenu ul li {
	display: inline-block;
	padding: 0;
	margin: 0;
}

#cssmenu.align-right ul li {
	float: right;
}

#cssmenu.align-center ul {
	text-align: center;
}

#cssmenu ul li a {
	color: #ffffff;
	text-decoration: none;
	display: block;
	padding: 15px 25px;
	font-weight: 700;
	text-transform: uppercase;
	font-size: 14px;
	position: relative;
	-webkit-transition: color .25s;
	-moz-transition: color .25s;
	-ms-transition: color .25s;
	-o-transition: color .25s;
	transition: color .25s;
}

#cssmenu ul li a:hover {
	color: #333333;
}

#cssmenu ul li a:hover:before {
	width: 100%;
}

#cssmenu ul li a:after {
	content: "";
	display: block;
	position: absolute;
	right: -3px;
	top: 19px;
	height: 6px;
	width: 6px;
	background: #ffffff;
	opacity: .5;
}

#cssmenu ul li a:before {
	content: "";
	display: block;
	position: absolute;
	left: 0;
	bottom: 0;
	height: 3px;
	width: 0;
	background: #333333;
	-webkit-transition: width .25s;
	-moz-transition: width .25s;
	-ms-transition: width .25s;
	-o-transition: width .25s;
	transition: width .25s;
}

#cssmenu ul li.last>a:after, #cssmenu ul li:last-child>a:after {
	display: none;
}

#cssmenu ul li.active a {
	color: #333333;
}

#cssmenu ul li.active a:before {
	width: 100%;
}

#cssmenu.align-right li.last>a:after, #cssmenu.align-right li:last-child>a:after
	{
	display: block;
}

#cssmenu.align-right li:first-child a:after {
	display: none;
}

@media screen and (max-width: 768px) {
	#cssmenu ul li {
		float: none;
		display: block;
	}
	#cssmenu ul li a {
		width: 100%;
		-moz-box-sizing: border-box;
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
		border-bottom: 1px solid #fb998c;
	}
	#cssmenu ul li.last>a, #cssmenu ul li:last-child>a {
		border: 0;
	}
	#cssmenu ul li a:after {
		display: none;
	}
	#cssmenu ul li a:before {
		display: none;
	}
}

  
</style>

<title>${title}</title>
</head>
<body marginwidth="0" marginheight="0">
	<div id='cssmenu'>
<div class="container">
<ul>
   <li class='active'><a href='${pageContext.request.contextPath}/'><span>Home</span></a></li>
</ul>
</div>
</div>
	<div id="block_error" class="">
		<div>
			<h2 id='error_heading'>Error 404. &nbspOops you've have encountered an error</h2>
			<p>
				It apperrs that Either something went wrong or the page doesn't
				exist anymore..<br /> This website is temporarily unable to service
				your request as it has exceeded it’s resource limit. Please check
				back shortly.
			</p>
			<p>
				If you are the owner of the account and are regularly seeing this
				error, please read more about it in our knowledgebase.
				If you have any questions, please contact our Technical Support
				department.
			</p>
		</div>
	</div>
</body>
</html>