package br.com.bioimportweb.managedbean;

import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import br.com.bioimportweb.gbif.api.utils.RegistryWsGuiceIT;

@ViewScoped
@ManagedBean(name="gbifApiMB")
public class GbifApiMB implements Serializable {

	private static final long serialVersionUID = -1239947487350258066L;
	
	public void testarApi() {
		RegistryWsGuiceIT.testGetDataset();
		System.out.println("teste");
	}

}
