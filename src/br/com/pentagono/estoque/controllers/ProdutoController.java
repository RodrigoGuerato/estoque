package br.com.pentagono.estoque.controllers;

import java.util.List;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
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

	@RequestMapping(value = "/novo", name = "novoProdutoUrl")
	public String form(Produto produto) {

		System.out.println("carregando o formulario de produtos");
		return "produtos/form";
	}

	@RequestMapping(method = RequestMethod.POST, name = "salvarProdutoUrl")
	public String salvarNoBanco(@Valid Produto produtoQueSeraSalvo, BindingResult resultadoValidacao,
			RedirectAttributes atributos) {

		if (resultadoValidacao.hasErrors()) {
			return form(produtoQueSeraSalvo);
		}

		System.out.println("produto que chegou : " + produtoQueSeraSalvo.getDescricao());
		produtoDAO.salvar(produtoQueSeraSalvo);
		atributos.addFlashAttribute("status", "produto salvo com sucesso");

		return "redirect:/produtos";
	}

	@RequestMapping(method = RequestMethod.GET, name = "listarProdutoUrl")
	public ModelAndView listarProdutos() {

		ModelAndView mav = new ModelAndView("produtos/lista");
		List<Produto> dados = produtoDAO.listarTodos();
		mav.addObject("listaDeProdutos", dados);

		return mav;
	}

	@RequestMapping(value = "{id}/edit", name = "alterarProdutoUrl")
	public String alterarProduto(@PathVariable Long id, Model model) {

		Produto produtoEncontrado = produtoDAO.buscaPorId(id);
		model.addAttribute(produtoEncontrado);
		return form(produtoEncontrado);
	}

	@RequestMapping(value = "/{id}", name = "detalharProdutoUrl")
	public ModelAndView detalharProduto(@PathVariable Long id) {

		Produto produtoVindoDoBanco = produtoDAO.buscaPorId(id);
		ModelAndView mav = new ModelAndView("produtos/detalhe");
		mav.addObject("produto", produtoVindoDoBanco);
		return mav;
	}

	@RequestMapping(value = "/{id}/delete", method = RequestMethod.POST, name = "excluirProdutoUrl")
	public String excluirProduto(@PathVariable Long id) {

		Produto produtoEncontrado = produtoDAO.buscaPorId(id);
		produtoDAO.excluir(produtoEncontrado);
		return "redirect:/produtos";
	}
}
