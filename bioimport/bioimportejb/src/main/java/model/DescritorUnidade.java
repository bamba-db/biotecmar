package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the descritor_unidade database table.
 * 
 */
@Entity
@Table(name="descritor_unidade", schema="bio")
@NamedQuery(name="DescritorUnidade.findAll", query="SELECT d FROM DescritorUnidade d")
public class DescritorUnidade implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_descritor_unidade")
	private Long idDescritorUnidade;

	@Temporal(TemporalType.DATE)
	@Column(name="dt_inclusao")
	private Date dtInclusao;

	private String valor;

	//bi-directional many-to-one association to DadosGerai
	@OneToMany(mappedBy="descritorUnidade")
	private List<DadosGerai> dadosGerais;

	//bi-directional many-to-one association to Descritor
	@ManyToOne
	@JoinColumn(name="id_descritor")
	private Descritor descritor;

	//bi-directional many-to-one association to UnidadeMedida
	@ManyToOne
	@JoinColumn(name="id_unidade_medida")
	private UnidadeMedida unidadeMedida;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario usuario;

	public DescritorUnidade() {
	}

	public Long getIdDescritorUnidade() {
		return this.idDescritorUnidade;
	}

	public void setIdDescritorUnidade(Long idDescritorUnidade) {
		this.idDescritorUnidade = idDescritorUnidade;
	}

	public Date getDtInclusao() {
		return this.dtInclusao;
	}

	public void setDtInclusao(Date dtInclusao) {
		this.dtInclusao = dtInclusao;
	}

	public String getValor() {
		return this.valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public List<DadosGerai> getDadosGerais() {
		return this.dadosGerais;
	}

	public void setDadosGerais(List<DadosGerai> dadosGerais) {
		this.dadosGerais = dadosGerais;
	}

	public DadosGerai addDadosGerai(DadosGerai dadosGerai) {
		getDadosGerais().add(dadosGerai);
		dadosGerai.setDescritorUnidade(this);

		return dadosGerai;
	}

	public DadosGerai removeDadosGerai(DadosGerai dadosGerai) {
		getDadosGerais().remove(dadosGerai);
		dadosGerai.setDescritorUnidade(null);

		return dadosGerai;
	}

	public Descritor getDescritor() {
		return this.descritor;
	}

	public void setDescritor(Descritor descritor) {
		this.descritor = descritor;
	}

	public UnidadeMedida getUnidadeMedida() {
		return this.unidadeMedida;
	}

	public void setUnidadeMedida(UnidadeMedida unidadeMedida) {
		this.unidadeMedida = unidadeMedida;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}