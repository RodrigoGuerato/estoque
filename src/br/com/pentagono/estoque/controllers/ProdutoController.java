package br.com.pentagono.estoque.controllers;

import java.util.List;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.pentagono.estoque.daos.ProdutoDAO;
import br.com.pentagono.estoque.models.Produto;
import br.com.pentagono.estoque.validations.ProdutoValidator;

@Controller
@Transactional
@RequestMapping("/produtos")
public class ProdutoController {

	@Autowired
	private ProdutoDAO produtoDAO;
	
	@InitBinder
	protected void init(WebDataBinder binder) {
		
		ProdutoValidator validadorDeProduto = new ProdutoValidator();
		binder.setValidator(validadorDeProduto);
	}	

	@RequestMapping(value="/novo", name="novoProdutoUrl")
	public String form(Produto produto) {

		System.out.println("carregando o formulario de produtos");
		return "produtos/form";
	}

	@RequestMapping(method=RequestMethod.POST, name="salvarProdutoUrl")
	public String salvarNoBanco(@Valid Produto produtoQueSeraSalvo, BindingResult resultadoValidacao, RedirectAttributes atributos) {
		
		if (resultadoValidacao.hasErrors()) {
			return form(produtoQueSeraSalvo);
		}
		
		System.out.println("produto que chegou : " + produtoQueSeraSalvo.getDescricao());	
		produtoDAO.salvar(produtoQueSeraSalvo);
		atributos.addFlashAttribute("status", "produto salvo com sucesso");
		
		return "redirect:/produtos";
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView listarProdutos() {

		ModelAndView mav = new ModelAndView("produtos/lista");
		List<Produto> dados = produtoDAO.listarTodos();
		mav.addObject("listaDeProdutos", dados);

		return mav;
	}

}
