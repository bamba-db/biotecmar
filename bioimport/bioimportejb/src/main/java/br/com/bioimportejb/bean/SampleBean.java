package br.com.bioimportejb.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.com.bioimportejb.dao.SampleDAO;
import br.com.bioimportejb.entidades.FishAssemblyAnalysi;
import br.com.bioimportejb.entidades.Sample;
import br.com.daofabrica.excecoes.ExcecaoGenerica;
import br.com.daofabrica.fabrica.DAOFabrica;
import br.com.daofabrica.fabrica.DAOFabricaImpl;

@Stateless
public class SampleBean implements Serializable {

	private static final long serialVersionUID = -813410451887480286L;

	@PersistenceContext(unitName="bioimportejb")
	private EntityManager em;
	
	private DAOFabrica daoFabrica;
	
	@PostConstruct
	public void instanciarFabrica() {
		daoFabrica = new DAOFabricaImpl(em);
	}
	
	private SampleDAO getSampleDAO() throws ExcecaoGenerica {
		return (SampleDAO) daoFabrica.getDAO(Sample.class);
	}
	
	public List<Sample> salvar(List<Sample> lista) throws ExcecaoGenerica {
		List<Sample> samplesGravados = new ArrayList<Sample>();
		for(Sample s : lista) {
			for(FishAssemblyAnalysi f: s.getFishAssemblyAnalysi()) {
				f.setSample(s);
			}
			samplesGravados.add(getSampleDAO().salvar(s));
		}
		return samplesGravados;
	}

	public List<Sample> listarSamples() throws ExcecaoGenerica {
		return getSampleDAO().listarAscOuDesc("dt", true);
	}

	
}
