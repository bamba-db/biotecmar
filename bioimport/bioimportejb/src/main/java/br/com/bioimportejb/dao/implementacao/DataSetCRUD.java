package br.com.bioimportejb.dao.implementacao;


import java.io.Serializable;

import br.com.bioimportejb.dao.DataSetDAO;
import br.com.bioimportejb.entidades.DataSet;
import br.com.daofabrica.crud.CRUDGenerico;

public class DataSetCRUD extends CRUDGenerico<DataSet, String> implements DataSetDAO, Serializable{

	private static final long serialVersionUID = 7031312855202624550L;
	
}
