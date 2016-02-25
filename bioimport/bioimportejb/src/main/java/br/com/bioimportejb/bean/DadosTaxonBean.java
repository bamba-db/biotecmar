package br.com.bioimportejb.bean;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.com.bioimportejb.bean.interfaces.DadosTaxonLocal;
import br.com.bioimportejb.dao.DadosTaxonDAO;
import br.com.bioimportejb.entidades.DadosTaxon;
import br.com.daofabrica.excecoes.ExcecaoGenerica;
import br.com.daofabrica.fabrica.DAOFabrica;
import br.com.daofabrica.fabrica.DAOFabricaImpl;

@Stateless
public class DadosTaxonBean implements Serializable, DadosTaxonLocal {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4313090296721687096L;
	
	@PersistenceContext(unitName="bioimportejb")
	private EntityManager em;
	
	private DAOFabrica daoFabrica;
	
	@PostConstruct
	public void instanciarFabrica() {
		daoFabrica = new DAOFabricaImpl(em);
	}

	public DadosTaxonDAO getDadosTaxonDAO() throws ExcecaoGenerica {
		return (DadosTaxonDAO) daoFabrica.getDAO(DadosTaxon.class);
	}
	
	@Override
	public DadosTaxon buscarPorTaxonKey(Long taxonkey) throws ExcecaoGenerica {
		return getDadosTaxonDAO().buscarPorId(taxonkey);
	}

}
