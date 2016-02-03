package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the analise database table.
 * 
 */
@Entity
@Table(name="analise", schema="bio")
@NamedQuery(name="Analise.findAll", query="SELECT a FROM Analise a")
public class Analise implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_analise")
	private Long idAnalise;

	@Temporal(TemporalType.DATE)
	@Column(name="dt_analise")
	private Date dtAnalise;

	//bi-directional many-to-one association to Amostra
	@ManyToOne
	@JoinColumn(name="id_amostra")
	private Amostra amostra;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario usuario;

	//bi-directional many-to-one association to AnaliseBio
	@OneToMany(mappedBy="analise")
	private List<AnaliseBio> analiseBios;

	//bi-directional many-to-one association to DadosGerai
	@OneToMany(mappedBy="analise")
	private List<DadosGerai> dadosGerais;

	public Analise() {
	}

	public Long getIdAnalise() {
		return this.idAnalise;
	}

	public void setIdAnalise(Long idAnalise) {
		this.idAnalise = idAnalise;
	}

	public Date getDtAnalise() {
		return this.dtAnalise;
	}

	public void setDtAnalise(Date dtAnalise) {
		this.dtAnalise = dtAnalise;
	}

	public Amostra getAmostra() {
		return this.amostra;
	}

	public void setAmostra(Amostra amostra) {
		this.amostra = amostra;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public List<AnaliseBio> getAnaliseBios() {
		return this.analiseBios;
	}

	public void setAnaliseBios(List<AnaliseBio> analiseBios) {
		this.analiseBios = analiseBios;
	}

	public AnaliseBio addAnaliseBio(AnaliseBio analiseBio) {
		getAnaliseBios().add(analiseBio);
		analiseBio.setAnalise(this);

		return analiseBio;
	}

	public AnaliseBio removeAnaliseBio(AnaliseBio analiseBio) {
		getAnaliseBios().remove(analiseBio);
		analiseBio.setAnalise(null);

		return analiseBio;
	}

	public List<DadosGerai> getDadosGerais() {
		return this.dadosGerais;
	}

	public void setDadosGerais(List<DadosGerai> dadosGerais) {
		this.dadosGerais = dadosGerais;
	}

	public DadosGerai addDadosGerai(DadosGerai dadosGerai) {
		getDadosGerais().add(dadosGerai);
		dadosGerai.setAnalise(this);

		return dadosGerai;
	}

	public DadosGerai removeDadosGerai(DadosGerai dadosGerai) {
		getDadosGerais().remove(dadosGerai);
		dadosGerai.setAnalise(null);

		return dadosGerai;
	}

}