package br.com.bioimportejb.bean;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;

import br.com.daofabrica.excecoes.ExcecaoGenerica;
import br.com.daofabrica.fabrica.DAOFabrica;
import br.com.daofabrica.fabrica.DAOFabricaImpl;
import br.com.bioimportejb.dao.UsuarioDAO;
import br.com.bioimportejb.entidades.Usuario;
import br.com.bioimportejb.enumerator.PerfilEnum;
import br.com.bioimportejb.service.UsuarioService;

@Stateless
public class UsuarioBean implements UsuarioService, Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@PersistenceContext(unitName="bioimportejb")
	private EntityManager em;
	
	private DAOFabrica daoFabrica;
	
	@PostConstruct
	public void instanciarDaoFabrica() {
		daoFabrica = new DAOFabricaImpl(em);
	}
	
	public UsuarioDAO getUsuarioDAO() throws ExcecaoGenerica{
		return (UsuarioDAO) daoFabrica.getDAO(Usuario.class);
	}
	
	public Usuario inserirUsuario(Usuario ator) throws ExcecaoGenerica{
		ator = getUsuarioDAO().salvar(ator);
		try{
			em.flush();
		}catch(PersistenceException e){
			String erro = e.getMessage().split("ERRO:")[1];
			throw new ExcecaoGenerica(erro);
		}
		return ator;
	}

	public Usuario alterarUsuario(Usuario ator) throws ExcecaoGenerica {
		ator = getUsuarioDAO().alterar(ator);
		return ator;
	}
	
	public String buscarEmailPorLogin(String login) throws ExcecaoGenerica {
		return getUsuarioDAO().buscarEmailPorLogin(login);
	}
	
	public boolean verificarExistenciaLogin(String login, Long id) throws ExcecaoGenerica {
		return getUsuarioDAO().verificarExistenciaLogin(login, id);
	}

	@Override
	public Boolean validarCodigo(String login, String codigo) throws ExcecaoGenerica {
		return getUsuarioDAO().validarUsuarioPorLoginECodigo(login, codigo);
	}

	@Override
	public Boolean validarLogin(String login, String senhaAtual) throws ExcecaoGenerica {
		return getUsuarioDAO().validarUsuarioPorLoginESenha(login, senhaAtual);
	}

	@Override
	public void alterarSenhaUsuario(String login, String senha) throws ExcecaoGenerica {
		Usuario ator = getUsuarioDAO().buscarUsuarioPorLogin(login);
		ator.setSenha(senha);
		getUsuarioDAO().alterar(ator);
	}

	
}
