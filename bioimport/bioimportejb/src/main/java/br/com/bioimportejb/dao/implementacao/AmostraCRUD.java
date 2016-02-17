package br.com.bioimportejb.dao.implementacao;


import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

import br.com.bioimportejb.dao.AmostraDAO;
import br.com.bioimportejb.entidades.Amostra;
import br.com.daofabrica.crud.CRUDGenerico;
import br.com.daofabrica.excecoes.ExcecaoGenerica;

public class AmostraCRUD extends CRUDGenerico<Amostra, Long> implements AmostraDAO, Serializable{

	private static final long serialVersionUID = 1L;
	
	public List<Amostra> listarAscOuDesc(String ordemAscCampo, boolean buscarAsc) throws ExcecaoGenerica {
		
		logger.info("::::Acionou o método listarAscOuDesc em GenericCRUD::::");
		
		List<Amostra> lista = null;
		
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
			for(Amostra s : lista) {
				s.getAnalises().size();
			}
			return lista;
		} catch (HibernateException e) {
			logger.info(e.getMessage());
			throw new ExcecaoGenerica(e);
		}
		
	}
	
}
