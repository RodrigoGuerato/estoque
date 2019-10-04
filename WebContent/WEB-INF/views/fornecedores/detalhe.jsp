<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<html>
	<jsp:include page="../base/header.jsp"/>

<body>
	<jsp:include page="../base/navbar.jsp"/>
	<div class="container">
		<div>
			<h4>Dados do Fornecedor</h4>
		</div>
		<div>
			<ul>
				<li>Id: ${fornecedor.id}</li>
				<li>Razão Social: ${fornecedor.razaoSocial}</li>
				<li>Nome Fantasia: ${fornecedor.nomeFantasia}</li>
				<li>CNPJ: ${fornecedor.cnpj}</li>
				<li>Email: ${fornecedor.email}</li>
				<li>Telefone: ${fornecedor.telefone}</li>
			</ul>
		</div>
		<div>
			<a class="btn btn-warning" href="${s:mvcUrl('listarFornecedorUrl').build()}">voltar</a>
		</div>
	</div>
	<jsp:include page="../base/scripts.js"/>
</body>
</html>