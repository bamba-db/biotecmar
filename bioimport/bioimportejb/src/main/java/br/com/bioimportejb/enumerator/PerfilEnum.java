package br.com.bioimportejb.enumerator;


public enum PerfilEnum {
	
	SUPER_AD("SAD", "Coordenador Geral"),
	AD("AD", "Gestor - NGQ"),
	CHE("CHE", "Respons�vel de �rea"),
	ESP("ESP", "T�cnico"),
	RQ("RQ", "Representante do Respons�vel de �rea"),
	RD("RD", "Representante da Dire��o");
	
	
	private PerfilEnum(String sigla, String descricao) {
		this.sigla = sigla;
		this.descricao = descricao;
	}

	private String sigla;
	private String descricao;
	
	public String getSigla() {
		return sigla;
	}
	public void setSigla(String sigla) {
		this.sigla = sigla;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	@Override
	public String toString() {
		return this.sigla;
	}
}
