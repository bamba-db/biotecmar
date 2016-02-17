package br.com.bioimportweb.managedbean;
 
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.com.bioimportejb.bean.AmostraBean;
import br.com.bioimportejb.entidades.Amostra;
import br.com.bioimportweb.importacao.Importacao;
import br.com.bioimportweb.util.Util;
import br.com.daofabrica.excecoes.ExcecaoGenerica;
 
@ViewScoped
@ManagedBean(name="importacaoCsv")
public class ImportacaoCsv implements Serializable {
     
    /**
	 * 
	 */
	private static final long serialVersionUID = -7090737375321788764L;
	private UploadedFile file;
	private File arquivo;
 
	private Logger log = LoggerFactory.getLogger(getClass());
	@EJB
	private AmostraBean sampleBean;
	private List<Amostra> listaSamples;
	
    public UploadedFile getFile() {
        return file;
    }
 
    public void setFile(UploadedFile file) {
        this.file = file;
    }
     
    public void upload(FileUploadEvent fileUploadEvent) {
        
//        FacesMessage message = new FacesMessage("Succesful", file.getFileName() + " is uploaded.");
//        FacesContext.getCurrentInstance().addMessage(null, message);
        file = fileUploadEvent.getFile();
       
    }
    
    public void importar() {
    	Importacao importacao = new Importacao();
    	try {
			listaSamples = new ArrayList<Amostra>(); 
			listaSamples.addAll(importacao.lerCsv(getFile().getInputstream()));
			listaSamples = sampleBean.salvar(listaSamples);
		} catch (IOException e) {
			log.error(e.getMessage(), e);
			Util.montaMensagemErroSemFlashRedirect("Erro ao importar arquivo", null);
		} catch (ExcecaoGenerica e) {
			log.error(e.getMessage(), e);
			Util.montaMensagemErroSemFlashRedirect(e.getMessage(), null);
		}
    }

	public File getArquivo() {
		return arquivo;
	}

	public void setArquivo(File arquivo) {
		this.arquivo = arquivo;
	}

	public List<Amostra> getListaSamples() {
		return listaSamples;
	}

	public void setListaSamples(List<Amostra> listaSamples) {
		this.listaSamples = listaSamples;
	}
	
}