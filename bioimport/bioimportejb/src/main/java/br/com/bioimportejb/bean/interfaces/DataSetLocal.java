package br.com.bioimportejb.bean.interfaces;

import java.util.List;

import javax.ejb.Local;

import br.com.bioimportejb.entidades.DataSet;
import br.com.bioimportejb.exception.ExcecaoIntegracao;

@Local
public interface DataSetLocal {

	List<DataSet> listarDataSet() throws ExcecaoIntegracao;

	List<DataSet> salvar(List<DataSet> lista) throws ExcecaoIntegracao;

	DataSet salvar(DataSet d) throws ExcecaoIntegracao;;

}
