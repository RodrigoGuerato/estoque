package br.com.pentagono.estoque.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import br.com.pentagono.estoque.models.Usuario;

@Repository
public class UsuarioDAO implements UserDetailsService {

	@PersistenceContext
	private EntityManager manager;
	
	public void salvar(Usuario usuarioQueSeraSalvo) {
		manager.merge(usuarioQueSeraSalvo);
	}
	
	public Usuario buscaPorId(String login) {
		return manager.find(Usuario.class, login);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		Usuario usuarioEncontrado = manager.find(Usuario.class, username);
		if (usuarioEncontrado == null) {
			throw new UsernameNotFoundException("Usuário " + username + " não existe ou esta incorreto");
		}

		return usuarioEncontrado;
	}

}
