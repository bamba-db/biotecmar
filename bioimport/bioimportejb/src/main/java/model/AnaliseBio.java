package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the analise_bio database table.
 * 
 */
@Entity
@Table(name="analise_bio", schema="bio")
@NamedQuery(name="AnaliseBio.findAll", query="SELECT a FROM AnaliseBio a")
public class AnaliseBio implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_analise_bio")
	private Long idAnaliseBio;

	@Temporal(TemporalType.DATE)
	@Column(name="dt_inclusao")
	private Date dtInclusao;

	//bi-directional many-to-one association to Analise
	@ManyToOne
	@JoinColumn(name="id_analise")
	private Analise analise;

	//bi-directional many-to-one association to Taxon
	@ManyToOne
	@JoinColumn(name="id_taxon")
	private Taxon taxon;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario usuario;

	public AnaliseBio() {
	}

	public Long getIdAnaliseBio() {
		return this.idAnaliseBio;
	}

	public void setIdAnaliseBio(Long idAnaliseBio) {
		this.idAnaliseBio = idAnaliseBio;
	}

	public Date getDtInclusao() {
		return this.dtInclusao;
	}

	public void setDtInclusao(Date dtInclusao) {
		this.dtInclusao = dtInclusao;
	}

	public Analise getAnalise() {
		return this.analise;
	}

	public void setAnalise(Analise analise) {
		this.analise = analise;
	}

	public Taxon getTaxon() {
		return this.taxon;
	}

	public void setTaxon(Taxon taxon) {
		this.taxon = taxon;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}