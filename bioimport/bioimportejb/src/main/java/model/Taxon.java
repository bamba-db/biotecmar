//package model;
//
//import java.io.Serializable;
//import javax.persistence.*;
//import java.util.List;
//
//
///**
// * The persistent class for the taxon database table.
// * 
// */
//@Entity
//@Table(name="taxon", schema="bio")
//@NamedQuery(name="Taxon.findAll", query="SELECT t FROM Taxon t")
//public class Taxon implements Serializable {
//	private static final long serialVersionUID = 1L;
//
//	@Id
//	@GeneratedValue(strategy=GenerationType.IDENTITY)
//	@Column(name="id_taxon")
//	private Long idTaxon;
//
//	private String nome;
//
//	//bi-directional many-to-one association to AnaliseBio
//	@OneToMany(mappedBy="taxon")
//	private List<AnaliseBio> analiseBios;
//
//	//bi-directional many-to-one association to DadosTaxon
//	@ManyToOne
//	@JoinColumn(name="taxonkey")
//	private DadosTaxon dadosTaxon;
//
//	//bi-directional many-to-one association to Usuario
//	@ManyToOne
//	@JoinColumn(name="id_usuario")
//	private Usuario usuario;
//
//	public Taxon() {
//	}
//
//	public Long getIdTaxon() {
//		return this.idTaxon;
//	}
//
//	public void setIdTaxon(Long idTaxon) {
//		this.idTaxon = idTaxon;
//	}
//
//	public String getNome() {
//		return this.nome;
//	}
//
//	public void setNome(String nome) {
//		this.nome = nome;
//	}
//
//	public List<AnaliseBio> getAnaliseBios() {
//		return this.analiseBios;
//	}
//
//	public void setAnaliseBios(List<AnaliseBio> analiseBios) {
//		this.analiseBios = analiseBios;
//	}
//
//	public AnaliseBio addAnaliseBio(AnaliseBio analiseBio) {
//		getAnaliseBios().add(analiseBio);
//		analiseBio.setTaxon(this);
//
//		return analiseBio;
//	}
//
//	public AnaliseBio removeAnaliseBio(AnaliseBio analiseBio) {
//		getAnaliseBios().remove(analiseBio);
//		analiseBio.setTaxon(null);
//
//		return analiseBio;
//	}
//
//	public DadosTaxon getDadosTaxon() {
//		return this.dadosTaxon;
//	}
//
//	public void setDadosTaxon(DadosTaxon dadosTaxon) {
//		this.dadosTaxon = dadosTaxon;
//	}
//
//	public Usuario getUsuario() {
//		return this.usuario;
//	}
//
//	public void setUsuario(Usuario usuario) {
//		this.usuario = usuario;
//	}
//
//}