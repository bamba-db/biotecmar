package br.com.bioimportweb.rest;

import java.util.ArrayList;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import br.com.bioimportejb.bean.AmostraBean;
import br.com.bioimportejb.entidades.Amostra;
import br.com.bioimportejb.exception.ExcecaoIntegracao;

@Path("/amostras/")
@Named
@RequestScoped
public class AmostrasRest {
	
	@Inject
	private AmostraBean amostraBean;
	
	@GET
	@Produces( { MediaType.APPLICATION_XML })
	 public List<Amostra> procurarAmostra() throws ExcecaoIntegracao {
		List<Amostra> lista = new ArrayList<Amostra>();
		lista = amostraBean.listarAmostras();
		return lista;
	 }

	
}
