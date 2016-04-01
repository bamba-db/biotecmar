package br.com.bioimportweb.managedbean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.primefaces.event.CellEditEvent;
import org.primefaces.event.RowEditEvent;

import br.com.bioimportejb.bean.interfaces.DataSetLocal;
import br.com.bioimportejb.entidades.DataSet;
import br.com.bioimportejb.exception.ExcecaoIntegracao;

@ViewScoped
@ManagedBean
public class DataSetMB implements Serializable {

	private static final long serialVersionUID = 8681865857427040369L;

	private List<DataSet> lista = new ArrayList<DataSet>();
	
	@EJB
	private DataSetLocal dataSetLocal;
	
	@PostConstruct
	public void carregar() throws ExcecaoIntegracao {
		lista = dataSetLocal.listarDataSet();
	}

	public void adicionarDataSet() {
		List<DataSet> listaAntiga = new ArrayList<DataSet>(lista);
		lista.clear();
		DataSet d = new DataSet();
		d.setDescricao("0000");
		d.setUuid("0000");
		lista.add(d);
		lista.addAll(listaAntiga);
	}
	
	public void onRowEdit(CellEditEvent event) throws ExcecaoIntegracao {
        DataSet d = lista.get(((Integer) event.getRowIndex()));
        if(d.getUuid() != null) {
        	dataSetLocal.salvar(d);
        }
    }
	
	public List<DataSet> getLista() {
		return lista;
	}

	public void setLista(List<DataSet> lista) {
		this.lista = lista;
	}
}
