package br.com.bioimportweb.managedbean;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import br.com.bioimportejb.bean.AmostraBean;
import br.com.bioimportejb.entidades.Amostra;
import br.com.bioimportejb.entidades.Analise;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.bioimportweb.util.Util;
import br.com.daofabrica.excecoes.ExcecaoGenerica;

@ViewScoped
@ManagedBean(name="mapaMB")
public class MapaMB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5904601591548693570L;

	private List<Amostra> samples;
	
	@EJB
	private AmostraBean sampleBean;
	
	private Logger log = LoggerFactory.getLogger(getClass());

	private JsonArray listaJson;
	
	private List<Analise> fishes;
	
	public JsonArray getListaJson() {
		return listaJson;
	}

	public void setListaJson(JsonArray listaJson) {
		this.listaJson = listaJson;
	}

	@PostConstruct
	private void iniciar() {
		try {
			setSamples(sampleBean.listarAmostras());
			listaJson = new JsonArray();
			for(Amostra s : samples) {
				JsonObject j = new JsonObject();
				j.addProperty("index", samples.indexOf(s));
				j.addProperty("latitude", s.getLatitude());
				j.addProperty("longitude", s.getLongitude());
				j.addProperty("depth", s.getProfundidade());
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				j.addProperty("data", sdf.format(s.getDtAmostra()));
				JsonArray array = new JsonArray();
				for(Analise f: s.getAnalises()) {
					JsonObject fo = new JsonObject();
					fo.addProperty("family", f.getAnaliseBio().getTaxon().getDadosTaxon().getFamily());
					fo.addProperty("genus", f.getAnaliseBio().getTaxon().getDadosTaxon().getGenus());
					fo.addProperty("kingdom", f.getAnaliseBio().getTaxon().getDadosTaxon().getKingdom());
					fo.addProperty("order", f.getAnaliseBio().getTaxon().getDadosTaxon().getOrd());
					fo.addProperty("phylum", f.getAnaliseBio().getTaxon().getDadosTaxon().getPhylum());
					fo.addProperty("scientificname", f.getAnaliseBio().getTaxon().getDadosTaxon().getScientifcname());
					fo.addProperty("species", f.getAnaliseBio().getTaxon().getDadosTaxon().getSpecies());
					fo.addProperty("taxonrank", f.getAnaliseBio().getTaxon().getDadosTaxon().getTaxonrank());
					array.add(fo);	
				}
				j.add("fishes", array);
				
				listaJson.add(j);
			}
			
		} catch (ExcecaoIntegracao e) {
			log.error(e.getMessage(), e);
			Util.montaMensagemErroSemFlashRedirect("Erro ao carregar lista de registros", "");
		}
	}
	
	public void converterJsonParaFish() {
		String index = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("index");
		if (index != null && !"".equals(index)) {
			Amostra sample = samples.get(Integer.valueOf(index));
			fishes = sample.getAnalises();
		}
	}

	public List<Amostra> getSamples() {
		return samples;
	}

	public void setSamples(List<Amostra> samples) {
		this.samples = samples;
	}
	
	public List<Analise> getFishes() {
		return fishes;
	}

	public void setFishes(List<Analise> fishes) {
		this.fishes = fishes;
	}
	
}
