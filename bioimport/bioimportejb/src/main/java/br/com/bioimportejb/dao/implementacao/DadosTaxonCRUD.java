package br.com.bioimportejb.dao.implementacao;


import java.io.Serializable;

import br.com.bioimportejb.dao.DadosTaxonDAO;
import br.com.bioimportejb.entidades.DadosTaxon;
import br.com.daofabrica.crud.CRUDGenerico;

public class DadosTaxonCRUD extends CRUDGenerico<DadosTaxon, Long> implements DadosTaxonDAO, Serializable{

	private static final long serialVersionUID = 1L;
	
}
