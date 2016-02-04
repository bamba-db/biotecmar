//package model;
//
//import java.io.Serializable;
//import javax.persistence.*;
//import java.util.List;
//
//
///**
// * The persistent class for the dados_taxon database table.
// * 
// */
//@Entity
//@Table(name="dados_taxon", schema="bio")
//@NamedQuery(name="DadosTaxon.findAll", query="SELECT d FROM DadosTaxon d")
//public class DadosTaxon implements Serializable {
//	private static final long serialVersionUID = 1L;
//
//	@Id
//	@GeneratedValue(strategy=GenerationType.IDENTITY)
//	private Long taxonkey;
//
//	@Column(name="class")
//	private String class_;
//
//	private String family;
//
//	private String genus;
//
//	private String infraspecificepithet;
//
//	private String kingdom;
//
//	private String ord;
//
//	private String phylum;
//
//	private String scientifcname;
//
//	private String species;
//
//	private String taxonrank;
//
//	//bi-directional many-to-one association to Taxon
//	@OneToMany(mappedBy="dadosTaxon")
//	private List<Taxon> taxons;
//
//	public DadosTaxon() {
//	}
//
//	public Long getTaxonkey() {
//		return this.taxonkey;
//	}
//
//	public void setTaxonkey(Long taxonkey) {
//		this.taxonkey = taxonkey;
//	}
//
//	public String getClass_() {
//		return this.class_;
//	}
//
//	public void setClass_(String class_) {
//		this.class_ = class_;
//	}
//
//	public String getFamily() {
//		return this.family;
//	}
//
//	public void setFamily(String family) {
//		this.family = family;
//	}
//
//	public String getGenus() {
//		return this.genus;
//	}
//
//	public void setGenus(String genus) {
//		this.genus = genus;
//	}
//
//	public String getInfraspecificepithet() {
//		return this.infraspecificepithet;
//	}
//
//	public void setInfraspecificepithet(String infraspecificepithet) {
//		this.infraspecificepithet = infraspecificepithet;
//	}
//
//	public String getKingdom() {
//		return this.kingdom;
//	}
//
//	public void setKingdom(String kingdom) {
//		this.kingdom = kingdom;
//	}
//
//	public String getOrd() {
//		return this.ord;
//	}
//
//	public void setOrd(String ord) {
//		this.ord = ord;
//	}
//
//	public String getPhylum() {
//		return this.phylum;
//	}
//
//	public void setPhylum(String phylum) {
//		this.phylum = phylum;
//	}
//
//	public String getScientifcname() {
//		return this.scientifcname;
//	}
//
//	public void setScientifcname(String scientifcname) {
//		this.scientifcname = scientifcname;
//	}
//
//	public String getSpecies() {
//		return this.species;
//	}
//
//	public void setSpecies(String species) {
//		this.species = species;
//	}
//
//	public String getTaxonrank() {
//		return this.taxonrank;
//	}
//
//	public void setTaxonrank(String taxonrank) {
//		this.taxonrank = taxonrank;
//	}
//
//	public List<Taxon> getTaxons() {
//		return this.taxons;
//	}
//
//	public void setTaxons(List<Taxon> taxons) {
//		this.taxons = taxons;
//	}
//
//	public Taxon addTaxon(Taxon taxon) {
//		getTaxons().add(taxon);
//		taxon.setDadosTaxon(this);
//
//		return taxon;
//	}
//
//	public Taxon removeTaxon(Taxon taxon) {
//		getTaxons().remove(taxon);
//		taxon.setDadosTaxon(null);
//
//		return taxon;
//	}
//
//}