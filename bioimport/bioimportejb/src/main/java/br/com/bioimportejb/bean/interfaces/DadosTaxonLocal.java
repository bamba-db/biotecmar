package br.com.bioimportejb.bean.interfaces;

import br.com.bioimportejb.entidades.DadosTaxon;
import br.com.daofabrica.excecoes.ExcecaoGenerica;

public interface DadosTaxonLocal {

	DadosTaxon buscarPorTaxonKey(Long taxonkey) throws ExcecaoGenerica;

}
