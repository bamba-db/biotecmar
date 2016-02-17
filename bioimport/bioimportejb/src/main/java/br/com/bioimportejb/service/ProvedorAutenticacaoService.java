package br.com.bioimportejb.service;

import javax.ejb.Local;

import br.com.daofabrica.excecoes.ExcecaoGenerica;
import br.com.bioimportejb.entidades.Usuario;

@Local
public interface ProvedorAutenticacaoService{
	
	public Usuario buscarUsuarioPorLoginESenha(String login, String senha) throws ExcecaoGenerica;

}
