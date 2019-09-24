<!DOCTYPE html>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Gestão de Estoque</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" />
	</head>
	<body>
	
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				    	<span class="sr-only">Toggle navigation</span>
				    	<span class="icon-bar"></span>
				    	<span class="icon-bar"></span>
				    	<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="${s:mvcUrl('homeUrl').build()}">Gestão de Estoque</a>
				</div>
				<div id="navbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="${s:mvcUrl('listarProdutoUrl').build()}">Produtos</a></li>
						<li><a href="#">Outro Link</a></li>
						<li><a href="#">Outro Link</a></li>
					</ul>
				</div>
			</div>
		</nav>	
		
		<div class="container">
			<h1>Home do sistema de estoque</h1>
		</div>
		
	</body>
	
	<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
</html>