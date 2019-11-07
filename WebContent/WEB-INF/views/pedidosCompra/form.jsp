<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<html>
	<%@ include file="../base/header.jsp" %>
	<body>
		<%@ include file="../base/navbar.jsp" %>
	
		<div class="container">
			<f:form action="${s:mvcUrl('salvarPedidoCompraUrl').build()}" method="post" modelAttribute="pedidoCompra" >
			
				<f:hidden path="id"/>			
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Dados do Pedido</h3>
					</div>
					
					<div class="panel-body">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#detalhesF" aria-controls="home" role="tab" data-toggle="tab">Cabeçalho</a></li>
							<li role="presentation"><a href="#prodF" aria-controls="profile" role="tab" data-toggle="tab">Itens</a></li>
						</ul>		
						
						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="detalhesF">
							
								<div class="row">
									<div class="col-md-2">
										<div class="form-group">
											<label for="data">Data</label>
											<f:input path="data" cssClass="form-control" type="date" />
											<f:errors path="data" />
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-12" >
										<div class="form-group" >
											<label for="fornecedor">Fornecedor</label>
											<f:select path="fornecedor" cssClass="form-control"> 
												<f:option value="0">Selecione um Fornecedor</f:option>
												<f:options items="${fornecedores}" itemLabel="razaoSocial" itemValue="id" />
											</f:select>
											<f:errors path="fornecedor" />
										</div>		
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-12" >
										<div class="form-group" >
											<label for="condicaoPagamento">Condição de Pagamento</label>
											<f:input path="condicaoPagamento" cssClass="form-control" />
											<f:errors path="condicaoPagamento"  />
										</div>		
									</div>
								</div>
										
							</div>
							
							<div role="tabpanel" class="tab-pane" id="prodF">

								<div style="margin-top:10px">							
									<div class="row">
										<div class="col-md-12 text-right">
											<button id="btnNovaLinha" class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#modalItemPedido">Adicionar <i class="glyphicon glyphicon-plus"></i></button>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<table class="table table-condensed" id="tbItens">
												<thead>
													<tr>
														<th>#</th>
														<th>Produto</th>
														<th>Quantidade</th>
														<th>Preço Unitário</th>
														<th>Valor Total</th>
														<th>Ações</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${pedidoCompra.itens}" var="itemPedido" varStatus="status">
														<tr>
															<f:hidden path="itens[${status.index}].produto"/>
															<f:hidden path="itens[${status.index}].quantidade"/>
															<f:hidden path="itens[${status.index}].precoUnitario"/>
															<f:hidden path="itens[${status.index}].precoTotal"/>
															
															<td>${itemPedido.produto.descricao}</td>
															<td>${itemPedido.quantidade}</td>
															<td>${itemPedido.precoUnitario}</td>		
															<td>${itemPedido.precoTotal}</td>
															<td>botoes</td>		
														</tr>		
													</c:forEach>								
												</tbody>											
											</table>
										</div>										
									</div>							
								</div>
							
							</div>
						</div>								
						
					</div>
					
					<div class="panel-footer">
						<div class="row">
							<div class="col-md-12">
								<input class="btn btn-success" type="submit" value="Salvar">
							</div>
						</div>
					</div>
					
				</div>
			</f:form>
			
			<div class="modal fade" tabindex="-1" role="dialog" id="modalItemPedido">
			    <div class="modal-dialog" role="document">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title">Itens do Pedido</h5>
			                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
			                    <span aria-hidden="true">&times;</span>
			                </button>
			            </div>
			            <div class="modal-body">
			            
			            	<div class="row">
			            		<div class="col-md-12">
			            			<div class="form-group">
			            				<label for="produtoItem">Produto</label>
			            				<select id="produtoItem" class="form-control">
			            					<option value="">Selecione</option>
			            				</select>			            			
			            			</div>			            		
			            		</div> 
			            	</div>
			            	<div class="row">
			            		<div class="col-md-6">
			            			<div class="form-group">
			            				<label for="qtdeItem">Quantidade</label>
			            				<input id="qtdeItem" type="number" class="form-control" />
			            			</div>			            		
			            		</div>
			            		<div class="col-md-6">
			            			<div class="form-group">
			            				<label for="precoItem">Preço Unitário</label>
			            				<input id="precoItem" type="number" class="form-control" />
			            			</div>			            		
			            		</div> 
			            	</div>
			            
			            </div>
			            <div class="modal-footer">
			                <button id="btnModalSim" type="button" class="btn btn-success">Salvar</button>
			                <button id="btnModalNao" type="button" class="btn btn-danger" data-dismiss="modal">Sair</button>
			            </div>
			        </div>
			    </div>
			</div>			
			
		</div>
	</body>
	
	<%@ include file="../base/scripts.jsp" %>
	
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
	</script>
	
</html>