<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Lista de Produtos</title>
</head>
<body>
	<div>
		<a href="${s:mvcUrl('novoProdutoUrl').build()}" >Novo Produto</a>
	</div>
	<div>
		<p>${status}</p>
	</div>
	<div>
		<table id="tabProdutos">
			<thead>
				<tr>
					<th>Id</th>
					<th>Descrição</th>
					<th>Quantidade</th>
					<th>Localização</th>
					<th>Ações</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listaDeProdutos}" var="prod" >
					<tr>
						<td>${prod.id}</td>
						<td>${prod.descricao}</td>
						<td>${prod.quantidade}</td>
						<td>${prod.localizacao}</td>
						<td>
							<a href="${s:mvcUrl('alterarProdutoUrl').arg(0, prod.id).build()}">editar</a>
							<a href="${s:mvcUrl('detalharProdutoUrl').arg(0, prod.id).build()}">detalhes</a>
						</td>
					</tr>			
				</c:forEach>		
			</tbody>	
		</table>
	</div>
</body>
</html>