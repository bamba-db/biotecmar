package br.com.bioimportweb.rest;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import br.com.bioimportejb.bean.AmostraBean;
import br.com.bioimportejb.entidades.Amostra;
import br.com.bioimportejb.exception.ExcecaoIntegracao;

@Path("/amostra/{id}")
@Named
@RequestScoped
public class AmostraRest {
	
	@Inject
	private AmostraBean amostraBean;
	
	@GET
	@Produces( { MediaType.APPLICATION_XML })
	 public Amostra getPedidoById(@PathParam("id") Long id) throws ExcecaoIntegracao {
		Amostra a = amostraBean.buscarPorId(id);
		return a;
	 }

}
