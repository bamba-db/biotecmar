package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the configuracao database table.
 * 
 */
@Entity
@Table(name="configuracao", schema="bio")
@NamedQuery(name="Configuracao.findAll", query="SELECT c FROM Configuracao c")
public class Configuracao implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="nom_configuracao")
	private String nomConfiguracao;

	private String valor;

	public Configuracao() {
	}

	public String getNomConfiguracao() {
		return this.nomConfiguracao;
	}

	public void setNomConfiguracao(String nomConfiguracao) {
		this.nomConfiguracao = nomConfiguracao;
	}

	public String getValor() {
		return this.valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

}