package br.com.bioimportejb.dao;


import java.util.List;

import br.com.daofabrica.dao.DAOGenerico;
import br.com.daofabrica.excecoes.ExcecaoGenerica;
import br.com.bioimportejb.entidades.Usuario;
import br.com.bioimportejb.enumerator.PerfilEnum;

public interface UsuarioDAO extends DAOGenerico<Usuario, Long>{

	public Usuario buscarUsuarioPorLoginESenha(String login, String senha);

	public String buscarEmailPorLogin(String login) throws ExcecaoGenerica;
	
	public boolean verificarExistenciaLogin(String login, Long id) throws ExcecaoGenerica;

	public boolean validarUsuarioPorLoginECodigo(String login, String codigo) throws ExcecaoGenerica;

	public boolean validarUsuarioPorLoginESenha(String login, String senhaAtual) throws ExcecaoGenerica;

	public Usuario buscarUsuarioPorLogin(String login) throws ExcecaoGenerica;

	public List<String> buscarPorPerfil(PerfilEnum ad) throws ExcecaoGenerica;

}
