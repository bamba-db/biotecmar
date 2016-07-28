package br.com.bioimportweb.managedbean;

import java.io.Serializable;
import java.net.MalformedURLException;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import br.com.bioimportejb.exception.ExcecaoIntegracao;
import br.com.bioimportweb.gbif.api.utils.GbifUtils;
import br.com.bioimportweb.util.Util;

@ViewScoped
@ManagedBean(name="gbifApiMB")
public class GbifApiMB implements Serializable {

	private static final long serialVersionUID = -1239947487350258066L;
	
	public static void main(String... args) {
		testarApi();
	}
	
	public static void testarApi() {
		try {
			GbifUtils.getInstance().processarDataSet("45adf020-a40b-4530-bbc0-0242daa4bd6c");
		} catch (MalformedURLException e) {
			Util.montaMensagemFlashRedirect("Erro ao formatar URL do DataSet", null);
		} catch (ExcecaoIntegracao e) {
			Util.montaMensagemFlashRedirect("Erro ao efetuar a leitura do arquivo de Ocorrências", null);
		}
		System.out.println("teste");
	}

}
