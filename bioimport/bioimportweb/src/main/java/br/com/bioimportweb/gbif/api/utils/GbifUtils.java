package br.com.bioimportweb.gbif.api.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.math.BigDecimal;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.apache.commons.lang.StringUtils;
import org.gbif.api.model.registry.Dataset;
import org.gbif.api.model.registry.Endpoint;
import org.gbif.api.service.registry.DatasetService;
import org.gbif.api.vocabulary.EndpointType;
import org.gbif.dwc.record.Record;
import org.gbif.dwc.terms.DwcTerm;
import org.gbif.dwc.text.Archive;
import org.gbif.dwc.text.ArchiveFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opencsv.CSVReader;

import br.com.bioimportejb.bean.SampleBean;
import br.com.bioimportejb.bean.interfaces.TaxonLocal;
import br.com.bioimportejb.entidades.FishAssemblyAnalysi;
import br.com.bioimportejb.entidades.Sample;
import br.com.bioimportejb.entidades.Taxon;
import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.bioimportejb.util.ChaveSampleVO;
import br.com.bioimportweb.managedbean.ImportacaoCsv;
import br.com.bioimportweb.util.Util;

public class GbifUtils implements Serializable {

	private static final String FILE_OCCURRENCE = "occurrence.txt";

	private static final String ARQ_TMP_PROP = "/arquivosTemporarios.properties";

	private static final long serialVersionUID = 5552011572435565843L;

	private Properties prop;
	
	private static GbifUtils instance;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	public static GbifUtils getInstance() {
      if(instance == null) {
         instance = new GbifUtils();
      }
      return instance;
   }
	
	private TaxonLocal taxonLocal;
	
	public Collection<Sample> montarSamples(Archive arq) throws ExcecaoIntegracao {
		CSVReader reader = null;
		Map<ChaveSampleVO, Sample> samples = new HashMap<ChaveSampleVO, Sample>();
		try {
			taxonLocal = (TaxonLocal) 
					new InitialContext().lookup("java:global/bioimportear/bioimportejb/TaxonBean");
			 Iterator<Record> iterator = arq.getCore().iterator();
			 while (iterator.hasNext()) {
				 	Record r = iterator.next();
					Sample sample = new Sample();
					ChaveSampleVO chave = new ChaveSampleVO();
					BigDecimal latitude = null;
					BigDecimal longitude = null;
					if(arq.getCore().hasTerm(DwcTerm.decimalLatitude)) { 
						latitude = new BigDecimal(r.value(DwcTerm.decimalLatitude));
						sample.setLatitude(latitude);
						chave.setLatitude(latitude);
					}
					if(arq.getCore().hasTerm(DwcTerm.decimalLongitude)) {
						longitude = new BigDecimal(r.value(DwcTerm.decimalLongitude));
						sample.setLongitude(longitude);
						chave.setLongitude(longitude);
					}
					
					if(arq.getCore().hasTerm(DwcTerm.minimumDepthInMeters)) {
						try {
							String depthString = r.value(DwcTerm.minimumDepthInMeters);
							if(StringUtils.isNotBlank(depthString)) {
								BigDecimal depth = new BigDecimal(depthString);
								sample.setDepth(depth);
								chave.setDepth(depth);
							}
						} catch (Exception e) {
							log.error(e.getMessage(), e);
						}
					}
					
					//TODO ver se há como recuperar a data
					Date data = Calendar.getInstance().getTime();
					sample.setDt(data);
					chave.setData(data);
					
					Sample aux = samples.get(chave);
					if(aux != null) {
						sample = aux;
					}
					FishAssemblyAnalysi f = new FishAssemblyAnalysi();
			    	
			    	/**
			    	 * Sistema recupera o taxonkey da linha corrente
			    	 * E verifica se já recuperou algum dado taxonômico com o mesmo taxonkey
			    	 * Caso já exista recupera do Map, caso não cria um novo para sua persistência.
			    	 */
			    	String taxonkey = null;
			    	if(arq.getCore().hasTerm(DwcTerm.identificationQualifier)) {
			    		taxonkey = r.value(DwcTerm.identificationQualifier);
			    	}
			    	
			    	Taxon dTaxon = null;
			    	
			    	/**
			    	 * O sistema verifica se existe algum registro, com o taxonkey recuperado, no banco
			    	 * de dados. Caso exista atribui os valores recebidos neste objeto recuperado, e se caso não exista, 
			    	 * o sistema cria um novo para que futuramente possa ser persistido.
			    	 */
//			    	if(taxonkey != null) {
//						dTaxon = taxonLocal.buscarPorTaxonKey(taxonkey);
//			    	}  
			    	
			    	/**
			    	 * Caso o taxon ainda não exista no banco de dados, o sistema grava as informações do novo taxon
			    	 * encontrado.
			    	 */
			    	if(dTaxon == null) {
			    		dTaxon = new Taxon();
			    		dTaxon.setTaxonkey(taxonkey);
			    	 
			    	
						if(arq.getCore().hasTerm(DwcTerm.kingdom)) {
				    		dTaxon.setKingdom(r.value(DwcTerm.kingdom));
				    	}
				    	
				    	if(arq.getCore().hasTerm(DwcTerm.phylum)) {
				    		dTaxon.setPhylum(r.value(DwcTerm.phylum));
				    	}
				    	
				    	if(arq.getCore().hasTerm(DwcTerm.class_)) {
				    		dTaxon.setClass_(r.value(DwcTerm.class_));
				    	}
				    	
				    	if(arq.getCore().hasTerm(DwcTerm.order)) {
				    		dTaxon.setOrder(r.value(DwcTerm.order));
				    	}
				    	
				    	if(arq.getCore().hasTerm(DwcTerm.family)) {
				    		dTaxon.setFamily(r.value(DwcTerm.family));
				    	}
				    	
				    	if(arq.getCore().hasTerm(DwcTerm.order)) {
				    		dTaxon.setGenus(r.value(DwcTerm.order));
				    	}
				    	
				    	if(arq.getCore().hasTerm(DwcTerm.scientificName)) {
				    		dTaxon.setSpecies(r.value(DwcTerm.scientificName));
				    	}
				    	
				    	if(arq.getCore().hasTerm(DwcTerm.infraspecificEpithet)) {
				    		dTaxon.setInfraspecificepithet(r.value(DwcTerm.infraspecificEpithet));
				    	}
				    	
				    	if(arq.getCore().hasTerm(DwcTerm.taxonRank)) {
				    		dTaxon.setTaxonrank(r.value(DwcTerm.taxonRank));
				    	}
				    	
				    	if(arq.getCore().hasTerm(DwcTerm.scientificName)) {
				    		dTaxon.setScientificname(r.value(DwcTerm.scientificName));
				    	}
				    	
				    	dTaxon = taxonLocal.salvar(dTaxon);
			    	} 
			    	f.setTaxon(dTaxon);
			    	f.setSample(sample);
			    	
			    	sample.addFishAssemblyAnalysi(f);
			    	samples.put(chave, sample);
			 }
		} catch (NamingException e1) {
			log.error(e1.getMessage(), e1);
			throw new ExcecaoIntegracao(e1);
		} finally {
			if(reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					throw new ExcecaoIntegracao(e);
				}
			}
		}
		return samples.values();  
	}
	private Date dataCsv(String[] linha) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		Date data = null;
		//TODO data = sdf.parse(linha[LASTINTERPRETED]);
		data = Calendar.getInstance().getTime();
		return data;
	}
	
	public void processarDataSet(String uuid) throws MalformedURLException, ExcecaoIntegracao {
		DatasetService ds = RegistryWsClientFactoryGuice.webserviceClientReadOnly().getInstance(DatasetService.class);
		Dataset dataset = ds.get(UUID.fromString(uuid));
		Endpoint endPointDwcArquive = null;
		for(Endpoint e : dataset.getEndpoints()) {
			if(EndpointType.DWC_ARCHIVE.equals(e.getType())) {
				endPointDwcArquive = e;
			}
		}
		
		downloadZipFile(endPointDwcArquive.getUrl().toURL());
		
	}
	
	public void downloadZipFile(URL url) throws ExcecaoIntegracao {
	    
	    try {
	    	String diretorioTmp = getProp().getProperty("diretorio.temporario");
	        URLConnection conn = url.openConnection();
	        InputStream in = conn.getInputStream();
	        String nomeDiretorio = diretorioTmp;
	        
	        File f = new File(nomeDiretorio);
	        if(!f.exists()) {
	        	f.mkdirs();
	        }
	        
			String nomeArquivo = nomeDiretorio + File.separator + Calendar.getInstance().getTimeInMillis();
			String nomeZip = nomeArquivo + ".zip";
			FileOutputStream out = new FileOutputStream(nomeZip);
	        byte[] b = new byte[1024];
	        int count;
	        while ((count = in.read(b)) >= 0) {
	            out.write(b, 0, count);
	        }
	        out.flush(); out.close(); in.close();    
	        
	        unZipIt(nomeZip, nomeArquivo, diretorioTmp);
	        
	        File fileOcorrencias = new File(nomeArquivo + File.separator + FILE_OCCURRENCE);
	        
	        Archive arq = ArchiveFactory.openArchive(fileOcorrencias);
	        
	        
			Collection<Sample> samples = montarSamples(arq);
			gravarSamples(samples);
			
			new File(nomeDiretorio).delete();
	        
	        
	    } catch (IOException e) {
	        log.error(e.getMessage(), e);
	        throw new ExcecaoIntegracao(e);
		}
	}
	
	public void gravarSamples(Collection<Sample> samples) throws ExcecaoIntegracao {
    	try {
    		SampleBean sampleBean = (SampleBean) 
					new InitialContext().lookup("java:global/bioimportear/bioimportejb/SampleBean");
			sampleBean.salvar(new ArrayList<Sample>(samples));
		} catch (NamingException e) {
			log.error(e.getMessage(), e);
			Util.montaMensagemErroSemFlashRedirect("Erro ao importar arquivo", null);
		}
    }
	
	/**
     * Unzip it
     * @param zipFile input zip file
     * @param output zip file output folder
	 * @throws ExcecaoIntegracao 
     */
	public void unZipIt(String zipFile, String outputFolder, String diretorio) throws ExcecaoIntegracao {

		byte[] buffer = new byte[1024];

		try {

			// create output directory is not exists
			File folder = new File(diretorio);
			if (!folder.exists()) {
				folder.mkdir();
			}

			// get the zip file content
			ZipInputStream zis = new ZipInputStream(new FileInputStream(zipFile));
			// get the zipped file list entry
			ZipEntry ze = zis.getNextEntry();

			while (ze != null) {

				String fileName = ze.getName();
				File newFile = new File(outputFolder + File.separator + fileName);

				log.info("file unzip : " + newFile.getAbsoluteFile());

				// create all non exists folders
				// else you will hit FileNotFoundException for compressed folder
				new File(newFile.getParent()).mkdirs();

				FileOutputStream fos = new FileOutputStream(newFile);

				int len;
				while ((len = zis.read(buffer)) > 0) {
					fos.write(buffer, 0, len);
				}

				fos.close();
				ze = zis.getNextEntry();
			}

			zis.closeEntry();
			zis.close();

			log.info("Done");

		} catch (IOException ex) {
			log.error(ex.getMessage(), ex);
			throw new ExcecaoIntegracao(ex);
		}
	}

	public Properties getProp() throws IOException {
		if(prop == null) {
			prop = new Properties();
			prop.load(GbifUtils.class.getResourceAsStream(ARQ_TMP_PROP));
		}
		return prop;
	}

	public void setProp(Properties prop) {
		this.prop = prop;
	}
}