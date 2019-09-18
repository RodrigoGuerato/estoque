<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta charset="UTF-8">
<title>Produtos - Novo</title>
</head>
<body>
	<div>
		<h4>Dados do Produto</h4>
	</div>
	<f:form action="${s:mvcUrl('salvarProdutoUrl').build()}" method="post" modelAttribute="produto">
		<div>
			<label for="descricao">Descrição</label>
			<f:input path="descricao" />
			<f:errors path="descricao" />
		</div>
		<div>
			<label for="quantidade">Quantidade</label>
			<f:input type="number" path="quantidade"/>
			<f:errors path="quantidade" />
		</div>
		<div>
			<label for="localizacao">Localização</label>
			<f:input path="localizacao" />
			<f:errors path="localizacao"  />
		</div>		
		<div>
			<label for="categoria">Categoria</label>
			<f:input path="categoria" />
			<f:errors path="categoria"  />
		</div>		
		<div>
			<label for="estoqueMinimo">Estoque Minimo</label>
			<f:input type="number" path="estoqueMinimo" />
			<f:errors path="estoqueMinimo"  />
		</div>		
		
		
		<div>
			<input type="submit" value="Salvar">
		</div>		
	</f:form>
</body>
</html>