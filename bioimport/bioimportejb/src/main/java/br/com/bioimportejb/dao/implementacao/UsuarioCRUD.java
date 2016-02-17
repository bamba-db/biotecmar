package br.com.bioimportejb.dao.implementacao;


import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.bioimportejb.dao.UsuarioDAO;
import br.com.bioimportejb.entidades.Usuario;
import br.com.bioimportejb.enumerator.PerfilEnum;
import br.com.daofabrica.crud.CRUDGenerico;
import br.com.daofabrica.excecoes.ExcecaoGenerica;

public class UsuarioCRUD extends CRUDGenerico<Usuario, Long> implements UsuarioDAO, Serializable{

	private static final long serialVersionUID = 1L;

	public Usuario buscarUsuarioPorLoginESenha(String login, String senha){
		
		Criteria criteria = ((Session)getEntityManager().getDelegate()).createCriteria(getClassePersistente());
		criteria.add(Restrictions.eq("login", login));
		criteria.add(Restrictions.eq("senha", senha));
		
		Usuario ator = (Usuario) criteria.uniqueResult();
	
		return ator;
	}

	public String buscarEmailPorLogin(String login) throws ExcecaoGenerica{

		StringBuffer hql = new StringBuffer("select c.login FROM Usuario c where c.login = :login ");
		Query query = ((Session)getEntityManager().getDelegate()).createQuery(hql.toString());
		query.setString("login", login);
		return (String) query.uniqueResult();
	}
	
	public boolean verificarExistenciaLogin(String login, Long id) throws ExcecaoGenerica{

		StringBuffer hql = new StringBuffer("select count(c.id) FROM Usuario c where c.login = :login ");
		if(null != id){
			hql.append(" and c.id != :id");
		}
		Query query = ((Session)getEntityManager().getDelegate()).createQuery(hql.toString());
		
		query.setString("login", login);
		if(null != id){
			query.setLong("id", id);
		}
		return ( (Long) query.uniqueResult() > 0);
	}

	@Override
	public boolean validarUsuarioPorLoginECodigo(String login, String codigo) {
		StringBuffer hql = new StringBuffer("select count(c.id) FROM Usuario c where c.login = :login and c.codigo = :codigo and c.dataHoraValidadeCodigo > :agora");
		
		Query query = ((Session)getEntityManager().getDelegate()).createQuery(hql.toString());
		query.setString("login", login);
		query.setString("codigo", codigo);
		query.setCalendar("agora", Calendar.getInstance());
		
		return ( (Long) query.uniqueResult() > 0);
	}

	@Override
	public boolean validarUsuarioPorLoginESenha(String login, String senhaAtual) {
		StringBuffer hql = new StringBuffer("select count(c.id) FROM Usuario c where c.login = :login and c.senha = :senhaAtual");
		
		Query query = ((Session)getEntityManager().getDelegate()).createQuery(hql.toString());
		query.setString("login", login);
		query.setString("senhaAtual", senhaAtual);

		return ( (Long) query.uniqueResult() > 0);
	}

	@Override
	public Usuario buscarUsuarioPorLogin(String login) throws ExcecaoGenerica {
		Criteria criteria = ((Session)getEntityManager().getDelegate()).createCriteria(getClassePersistente());
		criteria.add(Restrictions.eq("login", login));
		
		Usuario ator = (Usuario) criteria.uniqueResult();
		return ator;
	}

	@Override
	public List<String> buscarPorPerfil(PerfilEnum ad) throws ExcecaoGenerica {
		try{
			StringBuilder hql = new StringBuilder();
			hql.append("select ator.login from Usuario ator  ");
			hql.append(" where ator.perfil = :sigla ");
			Query query = criarQuery(hql.toString());
			query.setParameter("sigla", ad.toString());
			return query.list();
		} catch(HibernateException e){
			throw new ExcecaoGenerica(e.getMessage());
		}
	}
	
	
}
