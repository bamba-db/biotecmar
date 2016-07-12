
    create table biotecmar.abiotic_analysis (
        id int4 not null,
        ammonia_um numeric(19, 2),
        doc_um numeric(19, 2),
        nitrate_um numeric(19, 2),
        nitrite_um numeric(19, 2),
        organic_nitrogen_um numeric(19, 2),
        organic_phosphorous_um numeric(19, 2),
        ortho_phosphate_um numeric(19, 2),
        salinity_s numeric(19, 2),
        silicate_um numeric(19, 2),
        temperature_c numeric(19, 2),
        primary key (id)
    );

    create table biotecmar.area (
        id int4 not null,
        name varchar(255),
        nw_latitude numeric(19, 2),
        nw_longitude numeric(19, 2),
        se_latitude numeric(19, 2),
        se_longitude numeric(19, 2),
        primary key (id)
    );

    create table biotecmar.ator (
        id int8 not null,
        login varchar(255) not null,
        nome varchar(255) not null,
        senha varchar(255) not null,
        primary key (id)
    );

    create table biotecmar.benthic_analysis (
        id int4 not null,
        relative_abundance numeric(19, 2),
        taxon varchar(255),
        primary key (id)
    );

    create table biotecmar.biotic_analysis (
        id int4 not null,
        bacterial_count_cellml numeric(19, 2),
        chlorophyll_a_ugl numeric(19, 2),
        pheophytin_ugl numeric(19, 2),
        primary key (id)
    );

    create table biotecmar.contact (
        id_contato  bigserial not null,
        city varchar(255),
        country varchar(255),
        created timestamp,
        createdBy varchar(255),
        description varchar(255),
        firstName varchar(255),
        key_ int4,
        lastName varchar(255),
        modified timestamp,
        modifiedBy varchar(255),
        organization varchar(255),
        postalCode varchar(255),
        primary_ bool,
        province varchar(255),
        type_ varchar(255),
        id_dataset int8,
        primary key (id_contato)
    );

    create table biotecmar.dataset (
       alter table biotecmar.dataset add column  id_dataset  bigserial not null,
       alter table biotecmar.dataset add column  abbreviation varchar(255),
       alter table biotecmar.dataset add column  additionalInfo varchar(255),
       alter table biotecmar.dataset add column  alias varchar(255),
       alter table biotecmar.dataset add column  created timestamp,
       alter table biotecmar.dataset add column  create_by varchar(255),
       alter table biotecmar.dataset add column  data_alt timestamp,
       alter table biotecmar.dataset add column  deleted timestamp,
       alter table biotecmar.dataset add column  descricao varchar(255),
       alter table biotecmar.dataset add column  description varchar(255),
       alter table biotecmar.dataset add column  duplicate_of_dataset_key varchar(255),
       alter table biotecmar.dataset add column  external_ bool,
       alter table biotecmar.dataset add column  geographic_coverage_desc varchar(255),
       alter table biotecmar.dataset add column  homepage varchar(255),
       alter table biotecmar.dataset add column  installation_key varchar(255),
       alter table biotecmar.dataset add column  language_ varchar(255),
       alter table biotecmar.dataset add column  modified timestamp,
       alter table biotecmar.dataset add column  modified_by varchar(255),
       alter table biotecmar.dataset add column  num_constituents int4,
       alter table biotecmar.dataset add column  parent_dataset_key varchar(255),
       alter table biotecmar.dataset add column  project varchar(255),
       alter table biotecmar.dataset add column  pub_date timestamp,
       alter table biotecmar.dataset add column  publishing_organization_key varchar(255),
       alter table biotecmar.dataset add column  purpose varchar(255),
       alter table biotecmar.dataset add column  rights varchar(255),
       alter table biotecmar.dataset add column  sub_type varchar(255),
       alter table biotecmar.dataset add column  title varchar(255),
       alter table biotecmar.dataset add column  type_ varchar(255),
       alter table biotecmar.dataset add column  uuid varchar(255),
       alter table biotecmar.dataset add column  primary key (id_dataset)
    );

    create table biotecmar.email (
        id_email  bigserial not null,
        email varchar(255),
        id_contato int8,
        primary key (id_email)
    );

    create table biotecmar.endereco (
        id_endereco  bigserial not null,
        endereco varchar(255),
        id_contato int8,
        primary key (id_endereco)
    );

    create table biotecmar.fish_assembly_analysis (
        id int4 not null unique,
        abundance numeric(19, 2),
        id_sample int8,
        id_taxon int8,
        primary key (id)
    );

    create table biotecmar.geospatial_coverage (
        id_geospatial_coverage int8 not null,
        global_coverage bool,
        max_latitude float8,
        max_longitude float8,
        min_latitude float8,
        min_longitude float8,
        id_dataset int8,
        primary key (id_geospatial_coverage)
    );

    create table biotecmar.metagenome_functional_analysis (
        function varchar(255) not null,
        id int4 not null,
        reference_db_id varchar(255) not null,
        id_meta_analysis int4,
        primary key (function, id, reference_db_id)
    );

    create table biotecmar.metagenome_taxonomic_analysis (
        id int4 not null,
        taxon varchar(255) not null,
        abundance numeric(19, 2),
        id_meta_analysis int4,
        primary key (id, taxon)
    );

    create table biotecmar.metagenomic_analysis (
        id int4 not null,
        external_id varchar(255),
        fasta_file_url varchar(255),
        primary key (id)
    );

    create table biotecmar.pagina_contato (
        id_pagina_contato  bigserial not null,
        id_contato int8,
        pagina varchar(255),
        primary key (id_pagina_contato)
    );

    create table biotecmar.posicao_contato (
        id_posicao_contato  bigserial not null,
        id_contato int8,
        posicao varchar(255),
        primary key (id_posicao_contato)
    );

    create table biotecmar.reference_db (
        id varchar(255) not null,
        primary key (id)
    );

    create table biotecmar.sample (
        id int8 not null unique,
        depth numeric(19, 2),
        dt date,
        environment varchar(255),
        latitude numeric(19, 2),
        longitude numeric(19, 2),
        name varchar(255),
        id_dataset int8,
        type varchar(255),
        primary key (id)
    );

    create table biotecmar.sample_type (
        type varchar(255) not null,
        primary key (type)
    );

    create table biotecmar.taxon (
        id_taxon int8 not null unique,
        class varchar(255),
        family varchar(255),
        genus varchar(255),
        infraspecificepithet varchar(255),
        kingdom varchar(255),
        ord varchar(255),
        phylum varchar(255),
        scientificname varchar(255),
        species varchar(255),
        taxonkey varchar(255),
        taxonrank varchar(255),
        primary key (id_taxon)
    );

    create table biotecmar.telefone (
        id_telefone  bigserial not null,
        id_contato int8,
        telefone varchar(255),
        primary key (id_telefone)
    );

    create table biotecmar.temporal_coverage (
        id_temporal_coverage int8 not null,
        temporal_format varchar(255),
        id_dataset int8,
        primary key (id_temporal_coverage)
    );

    alter table biotecmar.contact 
        add constraint FKA6BC8B4661E25B82 
        foreign key (id_dataset) 
        references biotecmar.dataset;

    alter table biotecmar.email 
        add constraint FK882344422745B4FC 
        foreign key (id_contato) 
        references biotecmar.contact;

    alter table biotecmar.endereco 
        add constraint FKB9D4E5632745B4FC 
        foreign key (id_contato) 
        references biotecmar.contact;

    alter table biotecmar.fish_assembly_analysis 
        add constraint FK92A10B0880A66262 
        foreign key (id_sample) 
        references biotecmar.sample;

    alter table biotecmar.fish_assembly_analysis 
        add constraint FK92A10B0856D78CC6 
        foreign key (id_taxon) 
        references biotecmar.taxon;

    alter table biotecmar.geospatial_coverage 
        add constraint FKD3341A3A61E25B82 
        foreign key (id_dataset) 
        references biotecmar.dataset;

    alter table biotecmar.metagenome_functional_analysis 
        add constraint FKA3056E2FA2031DF0 
        foreign key (id_meta_analysis) 
        references biotecmar.metagenomic_analysis;

    alter table biotecmar.metagenome_functional_analysis 
        add constraint FKA3056E2F6F43B287 
        foreign key (reference_db_id) 
        references biotecmar.reference_db;

    alter table biotecmar.metagenome_taxonomic_analysis 
        add constraint FK73ABA9C2A2031DF0 
        foreign key (id_meta_analysis) 
        references biotecmar.metagenomic_analysis;

    alter table biotecmar.pagina_contato 
        add constraint FKFC8D608B2745B4FC 
        foreign key (id_contato) 
        references biotecmar.contact;

    alter table biotecmar.posicao_contato 
        add constraint FKE2F0752D2745B4FC 
        foreign key (id_contato) 
        references biotecmar.contact;

    alter table biotecmar.sample 
        add constraint FK938591C461E25B82 
        foreign key (id_dataset) 
        references biotecmar.dataset;

    alter table biotecmar.sample 
        add constraint FK938591C4A07C9A8 
        foreign key (type) 
        references biotecmar.sample_type;

    alter table biotecmar.telefone 
        add constraint FK18FE8842745B4FC 
        foreign key (id_contato) 
        references biotecmar.contact;

    alter table biotecmar.temporal_coverage 
        add constraint FK6A99560B61E25B82 
        foreign key (id_dataset) 
        references biotecmar.dataset;

    create sequence biotecmar.fish_assembly_analysis_id_seq;

    create sequence biotecmar.sample_id_seq;

    create sequence biotecmar.taxon_id_taxon_seq;
