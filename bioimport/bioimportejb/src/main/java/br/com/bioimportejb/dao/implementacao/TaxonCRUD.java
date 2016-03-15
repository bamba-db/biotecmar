package br.com.bioimportejb.dao.implementacao;


import java.io.Serializable;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import br.com.bioimportejb.dao.TaxonDAO;
import br.com.bioimportejb.entidades.Taxon;
import br.com.daofabrica.crud.CRUDGenerico;
import br.com.daofabrica.excecoes.ExcecaoGenerica;

public class TaxonCRUD extends CRUDGenerico<Taxon, Long> implements TaxonDAO, Serializable{

	private static final long serialVersionUID = 1L;

	@Override
	public Taxon buscarPorTaxonKey(Long taxonkey) throws ExcecaoGenerica {
		try {
			StringBuilder hql = new StringBuilder();
			hql.append("select t from Taxon t where t.taxonkey = :taxonkey");
			Query query = criarQuery(hql.toString());
			query.setParameter("taxonkey", taxonkey);
			return (Taxon) query.uniqueResult();
		} catch (HibernateException e) {
			throw new ExcecaoGenerica(e);
		}
	}

	
}
