package br.com.bioimportejb.bean.interfaces;

import br.com.bioimportejb.entidades.Taxon;
import br.com.bioimportejb.exception.ExcecaoIntegracao;

public interface TaxonLocal {

	public Taxon buscarPorTaxonKey(Long taxonkey) throws ExcecaoIntegracao;

	public Taxon salvar(Taxon dTaxon) throws ExcecaoIntegracao;;

}
