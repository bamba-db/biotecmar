package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the usuario database table.
 * 
 */
@Entity
@Table(name="usuario", schema="bio")
@NamedQuery(name="Usuario.findAll", query="SELECT u FROM Usuario u")
public class Usuario implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_usuario")
	private Long idUsuario;

	private String login;

	private String nome;

	private String senha;

	//bi-directional many-to-one association to Amostra
	@OneToMany(mappedBy="usuario")
	private List<Amostra> amostras;

	//bi-directional many-to-one association to Analise
	@OneToMany(mappedBy="usuario")
	private List<Analise> analises;

	//bi-directional many-to-one association to AnaliseBio
	@OneToMany(mappedBy="usuario")
	private List<AnaliseBio> analiseBios;

	//bi-directional many-to-one association to DadosGerai
	@OneToMany(mappedBy="usuario")
	private List<DadosGerai> dadosGerais;

	//bi-directional many-to-one association to Descritor
	@OneToMany(mappedBy="usuario")
	private List<Descritor> descritors;

	//bi-directional many-to-one association to DescritorUnidade
	@OneToMany(mappedBy="usuario")
	private List<DescritorUnidade> descritorUnidades;

	//bi-directional many-to-one association to Taxon
	@OneToMany(mappedBy="usuario")
	private List<Taxon> taxons;

	//bi-directional many-to-one association to UnidadeMedida
	@OneToMany(mappedBy="usuario")
	private List<UnidadeMedida> unidadeMedidas;

	public Usuario() {
	}

	public Long getIdUsuario() {
		return this.idUsuario;
	}

	public void setIdUsuario(Long idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getLogin() {
		return this.login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSenha() {
		return this.senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public List<Amostra> getAmostras() {
		return this.amostras;
	}

	public void setAmostras(List<Amostra> amostras) {
		this.amostras = amostras;
	}

	public Amostra addAmostra(Amostra amostra) {
		getAmostras().add(amostra);
		amostra.setUsuario(this);

		return amostra;
	}

	public Amostra removeAmostra(Amostra amostra) {
		getAmostras().remove(amostra);
		amostra.setUsuario(null);

		return amostra;
	}

	public List<Analise> getAnalises() {
		return this.analises;
	}

	public void setAnalises(List<Analise> analises) {
		this.analises = analises;
	}

	public Analise addAnalis(Analise analis) {
		getAnalises().add(analis);
		analis.setUsuario(this);

		return analis;
	}

	public Analise removeAnalis(Analise analis) {
		getAnalises().remove(analis);
		analis.setUsuario(null);

		return analis;
	}

	public List<AnaliseBio> getAnaliseBios() {
		return this.analiseBios;
	}

	public void setAnaliseBios(List<AnaliseBio> analiseBios) {
		this.analiseBios = analiseBios;
	}

	public AnaliseBio addAnaliseBio(AnaliseBio analiseBio) {
		getAnaliseBios().add(analiseBio);
		analiseBio.setUsuario(this);

		return analiseBio;
	}

	public AnaliseBio removeAnaliseBio(AnaliseBio analiseBio) {
		getAnaliseBios().remove(analiseBio);
		analiseBio.setUsuario(null);

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
		dadosGerai.setUsuario(this);

		return dadosGerai;
	}

	public DadosGerai removeDadosGerai(DadosGerai dadosGerai) {
		getDadosGerais().remove(dadosGerai);
		dadosGerai.setUsuario(null);

		return dadosGerai;
	}

	public List<Descritor> getDescritors() {
		return this.descritors;
	}

	public void setDescritors(List<Descritor> descritors) {
		this.descritors = descritors;
	}

	public Descritor addDescritor(Descritor descritor) {
		getDescritors().add(descritor);
		descritor.setUsuario(this);

		return descritor;
	}

	public Descritor removeDescritor(Descritor descritor) {
		getDescritors().remove(descritor);
		descritor.setUsuario(null);

		return descritor;
	}

	public List<DescritorUnidade> getDescritorUnidades() {
		return this.descritorUnidades;
	}

	public void setDescritorUnidades(List<DescritorUnidade> descritorUnidades) {
		this.descritorUnidades = descritorUnidades;
	}

	public DescritorUnidade addDescritorUnidade(DescritorUnidade descritorUnidade) {
		getDescritorUnidades().add(descritorUnidade);
		descritorUnidade.setUsuario(this);

		return descritorUnidade;
	}

	public DescritorUnidade removeDescritorUnidade(DescritorUnidade descritorUnidade) {
		getDescritorUnidades().remove(descritorUnidade);
		descritorUnidade.setUsuario(null);

		return descritorUnidade;
	}

	public List<Taxon> getTaxons() {
		return this.taxons;
	}

	public void setTaxons(List<Taxon> taxons) {
		this.taxons = taxons;
	}

	public Taxon addTaxon(Taxon taxon) {
		getTaxons().add(taxon);
		taxon.setUsuario(this);

		return taxon;
	}

	public Taxon removeTaxon(Taxon taxon) {
		getTaxons().remove(taxon);
		taxon.setUsuario(null);

		return taxon;
	}

	public List<UnidadeMedida> getUnidadeMedidas() {
		return this.unidadeMedidas;
	}

	public void setUnidadeMedidas(List<UnidadeMedida> unidadeMedidas) {
		this.unidadeMedidas = unidadeMedidas;
	}

	public UnidadeMedida addUnidadeMedida(UnidadeMedida unidadeMedida) {
		getUnidadeMedidas().add(unidadeMedida);
		unidadeMedida.setUsuario(this);

		return unidadeMedida;
	}

	public UnidadeMedida removeUnidadeMedida(UnidadeMedida unidadeMedida) {
		getUnidadeMedidas().remove(unidadeMedida);
		unidadeMedida.setUsuario(null);

		return unidadeMedida;
	}

}