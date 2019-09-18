package br.com.pentagono.estoque.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.pentagono.estoque.models.Produto;

@Repository
public class ProdutoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void salvar(Produto objetoProduto) {
		
		System.out.println("salvando o produto: " + objetoProduto.getDescricao());		
		System.out.println("salvando o produto: " + objetoProduto.getLocalizacao());
		System.out.println("salvando o produto: " + objetoProduto.getQuantidade());
		
		manager.persist(objetoProduto);
	}	
	
	public List<Produto> listarTodos() {
		return manager.createQuery("SELECT p FROM Produto p").getResultList();
	}
}
