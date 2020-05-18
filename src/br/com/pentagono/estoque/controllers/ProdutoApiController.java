package br.com.pentagono.estoque.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.pentagono.estoque.daos.ProdutoDAO;
import br.com.pentagono.estoque.models.Produto;

@CrossOrigin
@RestController
@RequestMapping("/api/produtos")
public class ProdutoApiController {
	
	@Autowired
	private ProdutoDAO produtoDAO;
	
	@GetMapping
	private List<Produto> listarTodos() {
		return produtoDAO.listarTodos();
	}
	
	

}
