package br.com.bioimportejb.service;

import javax.ejb.Local;

import br.com.bioimportejb.entidades.Usuario;
import br.com.daofabrica.excecoes.ExcecaoGenerica;

@Local
public interface UsuarioService{
	
	public Usuario inserirUsuario(Usuario ator)  throws ExcecaoGenerica;
	public Usuario alterarUsuario(Usuario ator) throws ExcecaoGenerica;
	public String buscarEmailPorLogin(String login) throws ExcecaoGenerica;
	public boolean verificarExistenciaLogin(String login, Long id) throws ExcecaoGenerica;
	public Boolean validarCodigo(String login, String codigo) throws ExcecaoGenerica;
	public Boolean validarLogin(String login, String senhaAtual) throws ExcecaoGenerica;
	public void alterarSenhaUsuario(String login, String senha) throws ExcecaoGenerica;
	
}
