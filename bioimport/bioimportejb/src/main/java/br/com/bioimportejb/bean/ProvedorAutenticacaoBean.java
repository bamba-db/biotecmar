package br.com.bioimportejb.bean;

import java.io.Serializable;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.com.daofabrica.excecoes.ExcecaoGenerica;
import br.com.daofabrica.fabrica.DAOFabrica;
import br.com.daofabrica.fabrica.DAOFabricaImpl;
import br.com.bioimportejb.dao.UsuarioDAO;
import br.com.bioimportejb.entidades.Usuario;
import br.com.bioimportejb.service.ProvedorAutenticacaoService;

@Stateless
public class ProvedorAutenticacaoBean implements ProvedorAutenticacaoService, Serializable{
	
	private static final long serialVersionUID = 1L;

	@PersistenceContext(unitName="bioimportejb")
	private EntityManager em;
	
	private DAOFabrica daoFabrica;
	
	public UsuarioDAO getUsuarioDAO(EntityManager em) throws ExcecaoGenerica{
		daoFabrica = new DAOFabricaImpl(em);
		return (UsuarioDAO) daoFabrica.getDAO(Usuario.class);
	}

	@Override
	public Usuario buscarUsuarioPorLoginESenha(String login, String senha) throws ExcecaoGenerica {
		Usuario ator = getUsuarioDAO(em).buscarUsuarioPorLoginESenha(login, senha);
		
		return ator;
	}
	
}
