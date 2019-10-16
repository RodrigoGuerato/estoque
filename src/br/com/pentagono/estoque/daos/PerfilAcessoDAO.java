package br.com.pentagono.estoque.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.pentagono.estoque.models.PerfilAcesso;

@Repository
public class PerfilAcessoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void salvar(PerfilAcesso objeto) {
		manager.persist(objeto);
	}
}
