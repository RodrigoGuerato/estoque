package br.com.pentagono.estoque.conf;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import br.com.pentagono.estoque.daos.UsuarioLoad;

public class ServletSpringMVC extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {

		return new Class[] { SecurityConfig.class, AppWebConfiguration.class, JPAConfiguration.class, UsuarioLoad.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {

		return new Class[] { AppWebConfiguration.class };
	}

	@Override
	protected String[] getServletMappings() {

		return new String[] { "/" };
	}

}
