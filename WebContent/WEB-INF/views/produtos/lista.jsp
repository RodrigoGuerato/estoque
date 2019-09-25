<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<html>
	<jsp:include page="../base/header.jsp" />
	
	<body>
		<jsp:include page="../base/navbar.jsp" />
		
		<div class="container">

			<div>
				<p>${status}</p>
			</div>
		
			<div class="row">
				<div class="col-md-9">
					<h4>Cadastro de Produtos</h4>
				</div>
				<div class="col-md-3 h4">
					<a class="btn btn-primary" href="${s:mvcUrl('novoProdutoUrl').build()}" >Novo Produto</a>
				</div>
			</div>
			
			<div class="row">
				<div class="table-responsive col-md-12">
					<table id="tabProdutos" class="table table-striped">
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
										<form action="${s:mvcUrl('excluirProdutoUrl').arg(0, prod.id).build()}" method="post">
											<a class="btn btn-warning btn-xs" href="${s:mvcUrl('alterarProdutoUrl').arg(0, prod.id).build()}">editar</a>
											<a class="btn btn-success btn-xs" href="${s:mvcUrl('detalharProdutoUrl').arg(0, prod.id).build()}">detalhes</a>
											<button class="btn btn-danger btn-xs" type="submit">Excluir</button>
										</form>
									</td>
								</tr>			
							</c:forEach>		
						</tbody>	
					</table>
				</div>
			</div>
		
		</div>
	</body>
	
	<jsp:include page="../base/scripts.jsp" />
</html>