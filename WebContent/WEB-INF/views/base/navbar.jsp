<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>

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
				<li><a href="${s:mvcUrl('listarFornecedorUrl').build()}">Fornecedores</a></li>
				<li><a href="#">Outro Link</a></li>
			</ul>
		</div>
	</div>
</nav>	
