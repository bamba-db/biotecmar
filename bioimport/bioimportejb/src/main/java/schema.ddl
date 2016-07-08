
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
        primary_ boolean,
        province varchar(255),
        type_ varchar(255),
        id_dataset int8,
        primary key (id_contato)
    );

    create table biotecmar.dataset (
        id_dataset  bigserial not null,
        data_alt timestamp,
        descricao varchar(255),
        pub_date timestamp,
        uuid varchar(255),
        primary key (id_dataset)
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
        id int4 not null,
        abundance numeric(19, 2),
        id_sample int8,
        id_taxon int8,
        primary key (id)
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
        id int8 not null,
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
        id_taxon int8 not null,
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

    alter table biotecmar.contact 
        add constraint FK_j1pfbalpkwboqfa1xncywotf7 
        foreign key (id_dataset) 
        references biotecmar.dataset;

    alter table biotecmar.email 
        add constraint FK_67170amqm44jmm77a5p3i71k4 
        foreign key (id_contato) 
        references biotecmar.contact;

    alter table biotecmar.endereco 
        add constraint FK_s9qsdk3543ghmtn2m9wd8gs33 
        foreign key (id_contato) 
        references biotecmar.contact;

    alter table biotecmar.fish_assembly_analysis 
        add constraint FK_63dug7q58sa7hikiloe7iiw9d 
        foreign key (id_sample) 
        references biotecmar.sample;

    alter table biotecmar.fish_assembly_analysis 
        add constraint FK_ssqbih78uq1mgt54fxwvsb9ae 
        foreign key (id_taxon) 
        references biotecmar.taxon;

    alter table biotecmar.metagenome_functional_analysis 
        add constraint FK_8pv5hbver7h8ker6o3pbnxeiw 
        foreign key (id_meta_analysis) 
        references biotecmar.metagenomic_analysis;

    alter table biotecmar.metagenome_functional_analysis 
        add constraint FK_ko90qaxpy6hr9dps5ds089pan 
        foreign key (reference_db_id) 
        references biotecmar.reference_db;

    alter table biotecmar.metagenome_taxonomic_analysis 
        add constraint FK_lt7r5k3o4ead2cmjtw0huynyr 
        foreign key (id_meta_analysis) 
        references biotecmar.metagenomic_analysis;

    alter table biotecmar.pagina_contato 
        add constraint FK_9xh91qxa2twlb6q9ep5k01y9w 
        foreign key (id_contato) 
        references biotecmar.contact;

    alter table biotecmar.posicao_contato 
        add constraint FK_ab0bq49h7313xrffj1jaf0wjj 
        foreign key (id_contato) 
        references biotecmar.contact;

    alter table biotecmar.sample 
        add constraint FK_ko4yjfkmxh3foltx9m0jq9om3 
        foreign key (id_dataset) 
        references biotecmar.dataset;

    alter table biotecmar.sample 
        add constraint FK_ak52ljv8tc4huqbbjcf9rvwhi 
        foreign key (type) 
        references biotecmar.sample_type;

    alter table biotecmar.telefone 
        add constraint FK_fhbhsfenx14euecvb4np9x86d 
        foreign key (id_contato) 
        references biotecmar.contact;

    create sequence biotecmar.fish_assembly_analysis_id_seq;

    create sequence biotecmar.sample_id_seq;

    create sequence biotecmar.taxon_id_taxon_seq;
