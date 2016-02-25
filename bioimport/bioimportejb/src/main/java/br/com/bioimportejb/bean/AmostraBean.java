package br.com.bioimportejb.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.com.bioimportejb.dao.AmostraDAO;
import br.com.bioimportejb.entidades.Amostra;
import br.com.bioimportejb.entidades.Analise;
import br.com.bioimportejb.entidades.Taxon;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.daofabrica.excecoes.ExcecaoGenerica;
import br.com.daofabrica.fabrica.DAOFabrica;
import br.com.daofabrica.fabrica.DAOFabricaImpl;

@Stateless
public class AmostraBean implements Serializable {

	private static final long serialVersionUID = -813410451887480286L;

	@PersistenceContext(unitName="bioimportejb")
	private EntityManager em;
	
	private DAOFabrica daoFabrica;
	
	@PostConstruct
	public void instanciarFabrica() {
		daoFabrica = new DAOFabricaImpl(em);
	}
	
	private AmostraDAO getAmostraDAO() throws ExcecaoGenerica {
		return (AmostraDAO) daoFabrica.getDAO(Amostra.class);
	}
	
	public List<Amostra> salvar(List<Amostra> lista) throws ExcecaoGenerica {
		List<Amostra> samplesGravados = new ArrayList<Amostra>();
		for(Amostra a : lista) {
			for(Analise f: a.getAnalises()) {
				f.setAmostra(a);
			}
			samplesGravados.add(getAmostraDAO().mesclar(a));
		}
		return samplesGravados;
	}

	public List<Amostra> listarAmostras() throws ExcecaoGenerica {
		return getAmostraDAO().listarAscOuDesc("dtAmostra", true);
	}

	public Amostra buscarPorId(Long id) throws ExcecaoIntegracao {
		try {
			return getAmostraDAO().buscarPorId(id);
		} catch (ExcecaoGenerica e) {
			throw new ExcecaoIntegracao(e);
		}
	}

	
}
