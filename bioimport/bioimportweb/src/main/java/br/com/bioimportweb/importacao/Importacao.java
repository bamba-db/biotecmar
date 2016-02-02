package br.com.bioimportweb.importacao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.com.bioimportejb.entidades.FishAssemblyAnalysi;
import br.com.bioimportejb.entidades.Sample;
import br.com.bioimportejb.entidades.Taxon;
import br.com.bioimportejb.util.ChaveSampleVO;

import com.opencsv.CSVReader;

public class Importacao implements Serializable {

	private static final long serialVersionUID = 6347826210665043437L;

	private static final int PHYLUM = 4;

	private static final int KINGDOM = 3;
	
	private static final int CLASS = 5;
	private static final int ORDER = 6;
	private static final int FAMILY = 7;
	private static final int GENUS = 8;
	private static final int SPECIES = 9;
	private static final int INFRASPECIFICEPITHET = 10;
	private static final int TAXONRANK = 11;
	private static final int SCIENTIFICNAME = 12;
	private static final int COUNTRYCODE = 13;
	private static final int LOCALITY = 14;
	private static final int PUBLISHINGORGKEY = 15;
	private static final int DECIMALLATITUDE = 16;
	private static final int DECIMALLONGITUDE = 17;
	private static final int ELEVATION = 18;
	private static final int ELEVATIONACCURACY = 19;
	private static final int DEPTH = 20;
	private static final int DEPTHACCURACY = 21;
	private static final int EVENTDATE = 22;
	private static final int DAY = 23;
	private static final int MONTH = 24;
	private static final int YEAR = 25;
	private static final int TAXONKEY = 26;
	private static final int SPECIESKEY = 27;
	private static final int BASISOFRECORD = 28;
	private static final int INSTITUTIONCODE = 29;
	private static final int COLLECTIONCODE = 30;
	private static final int CATALOGNUMBER = 31;
	private static final int RECORDNUMBER = 32;
	private static final int IDENTIFIEDBY = 33;
	private static final int RIGHTS = 34;
	private static final int RIGHTSHOLDER = 35;
	private static final int RECORDEDBY = 36;
	private static final int TYPESTATUS = 37;
	private static final int ESTABLISHMENTMEANS = 38;
	private static final int LASTINTERPRETED = 39;
	private static final int MEDIATYPE = 40;
	private static final int ISSUE = 41;
	

	private Logger log = LoggerFactory.getLogger(getClass());
	public Collection<Sample> lerCsv(InputStream inputStream) {
		Map<ChaveSampleVO, Sample> samples = new HashMap<ChaveSampleVO, Sample>(); 
		try {
			 CSVReader reader = new CSVReader(new InputStreamReader(inputStream), '\t');
			 String [] linha;
			 
			 int count = 0;
			 
			 while ((linha = reader.readNext()) != null) {
				if(count != 0) {
					Sample sample = new Sample();
					ChaveSampleVO chave = new ChaveSampleVO();
					int tamanhoLinha = linha.length;
					BigDecimal latitude = null;
					BigDecimal longitude = null;
					if(tamanhoLinha > DECIMALLATITUDE) { 
						latitude = new BigDecimal(linha[DECIMALLATITUDE]);
						sample.setLatitude(latitude);
						chave.setLatitude(latitude);
					}
					if(tamanhoLinha > DECIMALLONGITUDE) {
						longitude = new BigDecimal(linha[DECIMALLONGITUDE]);
						sample.setLongitude(longitude);
						chave.setLongitude(longitude);
					}
					
					if(tamanhoLinha > DEPTH) {
						try {
							String depthString = linha[DEPTH];
							if(depthString != null && !"".equals(depthString)) {
								BigDecimal depth = new BigDecimal(depthString);
								sample.setDepth(depth);
								chave.setDepth(depth);
							}
						} catch (Exception e) {
							log.error(e.getMessage(), e);
						}
					}
					
					Date data = dataCsv(linha);
					sample.setDt(data);
					chave.setData(data);
					
					Sample aux = samples.get(chave);
					if(aux != null) {
						sample = aux;
					}
					FishAssemblyAnalysi f = new FishAssemblyAnalysi();
			    	
			    	if(f.getTaxon() == null) {
						f.setTaxon(new Taxon());
					}
			    	
					if(KINGDOM < tamanhoLinha) {
			    		f.getTaxon().setKingdom(linha[KINGDOM]);
			    	}
			    	
			    	if(PHYLUM < tamanhoLinha) {
			    		f.getTaxon().setPhylum(linha[PHYLUM]);
			    	}
			    	
			    	if(CLASS < tamanhoLinha) {
			    		f.getTaxon().setClass_(linha[CLASS]);
			    	}
			    	
			    	if(ORDER < tamanhoLinha) {
			    		f.getTaxon().setOrder(linha[ORDER]);
			    	}
			    	
			    	if(FAMILY < tamanhoLinha) {
			    		f.getTaxon().setFamily(linha[FAMILY]);
			    	}
			    	
			    	if(GENUS < tamanhoLinha) {
			    		f.getTaxon().setGenus(linha[GENUS]);
			    	}
			    	
			    	if(SPECIES < tamanhoLinha) {
			    		f.getTaxon().setSpecies(linha[SPECIES]);
			    	}
			    	
			    	if(INFRASPECIFICEPITHET < tamanhoLinha) {
			    		f.getTaxon().setInfraspecificepithet(linha[INFRASPECIFICEPITHET]);
			    	}
			    	
			    	if(TAXONRANK < tamanhoLinha) {
			    		f.getTaxon().setTaxonrank(linha[TAXONRANK]);
			    	}
			    	
			    	if(SCIENTIFICNAME < tamanhoLinha) {
			    		f.getTaxon().setScientificname(linha[SCIENTIFICNAME]);
			    	}
			    	
			    	sample.addFishAssemblyAnalysi(f);
			    	samples.put(chave, sample);
				}
				count ++;
			 }
		} catch (FileNotFoundException e) {
			log.error(e.getMessage(), e);
		} catch (IOException e) {
			log.error(e.getMessage(), e);
		}
		return samples.values();  
	}
	private Date dataCsv(String[] linha) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		Date data = null;
		try {
			data = sdf.parse(linha[LASTINTERPRETED]);
		} catch (ParseException e) {
			log.error(e.getMessage(), e);
		}
		return data;
	}
	
	public static void main(String ...args) {
		Importacao i = new Importacao();
		List<Sample> lista = null;
		try {
			lista = new ArrayList<Sample>();
			lista.addAll(i.lerCsv(new FileInputStream(new File("C:\\Workspaces\\BiotecMar\\0012051-151016162008034\\0012051-151016162008034.csv"))));
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(lista.size());
	}
}
