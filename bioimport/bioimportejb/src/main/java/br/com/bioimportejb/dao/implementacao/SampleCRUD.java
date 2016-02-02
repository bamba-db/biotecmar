package br.com.bioimportejb.dao.implementacao;


import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

import br.com.bioimportejb.dao.SampleDAO;
import br.com.bioimportejb.entidades.Sample;
import br.com.daofabrica.crud.CRUDGenerico;
import br.com.daofabrica.excecoes.ExcecaoGenerica;

public class SampleCRUD extends CRUDGenerico<Sample, Integer> implements SampleDAO, Serializable{

	private static final long serialVersionUID = 1L;
	
	public List<Sample> listarAscOuDesc(String ordemAscCampo, boolean buscarAsc) throws ExcecaoGenerica {
		
		logger.info("::::Acionou o mï¿½todo listarAscOuDesc em GenericCRUD::::");
		
		List<Sample> lista = null;
		
		try {
			Criteria criteria = null;
			Session session = null;
			criteria = ((Session) getEntityManager().getDelegate()).createCriteria(getClassePersistente());
			 
			if(buscarAsc){
				criteria.addOrder(Order.asc(ordemAscCampo));
			}else{
				criteria.addOrder(Order.desc(ordemAscCampo));
			}
			
			lista = criteria.list();
			for(Sample s : lista) {
				s.getFishAssemblyAnalysi().size();
			}
			return lista;
		} catch (HibernateException e) {
			logger.info(e.getMessage());
			throw new ExcecaoGenerica(e);
		}
		
	}
	
}
