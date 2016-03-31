--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.8
-- Dumped by pg_dump version 9.5.0

-- Started on 2016-03-31 12:15:10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 74378)
-- Name: biotecmar; Type: SCHEMA; Schema: -; Owner: biotecmar
--

CREATE SCHEMA biotecmar;


ALTER SCHEMA biotecmar OWNER TO biotecmar;

SET search_path = biotecmar, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 74620)
-- Name: abiotic_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE abiotic_analysis (
    id integer NOT NULL,
    salinity_s numeric,
    temperature_c numeric,
    doc_um numeric,
    nitrite_um numeric,
    nitrate_um numeric,
    ammonia_um numeric,
    organic_nitrogen_um numeric,
    silicate_um numeric,
    organic_phosphorous_um numeric,
    ortho_phosphate_um numeric
);


ALTER TABLE abiotic_analysis OWNER TO biotecmar;

--
-- TOC entry 178 (class 1259 OID 74618)
-- Name: abiotic_analysis_id_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE abiotic_analysis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE abiotic_analysis_id_seq OWNER TO biotecmar;

--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 178
-- Name: abiotic_analysis_id_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE abiotic_analysis_id_seq OWNED BY abiotic_analysis.id;


--
-- TOC entry 177 (class 1259 OID 74609)
-- Name: area; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE area (
    id integer NOT NULL,
    name text,
    nw_latitude numeric,
    nw_longitude numeric,
    se_latitude numeric,
    se_longitude numeric
);


ALTER TABLE area OWNER TO biotecmar;

--
-- TOC entry 176 (class 1259 OID 74607)
-- Name: area_id_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE area_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE area_id_seq OWNER TO biotecmar;

--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 176
-- Name: area_id_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE area_id_seq OWNED BY area.id;


--
-- TOC entry 171 (class 1259 OID 74381)
-- Name: ator; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE ator (
    id integer NOT NULL,
    login character varying NOT NULL,
    senha character varying NOT NULL,
    nome character varying NOT NULL,
    perfil character varying NOT NULL
);


ALTER TABLE ator OWNER TO biotecmar;

--
-- TOC entry 170 (class 1259 OID 74379)
-- Name: ator_id_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE ator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ator_id_seq OWNER TO biotecmar;

--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 170
-- Name: ator_id_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE ator_id_seq OWNED BY ator.id;


--
-- TOC entry 192 (class 1259 OID 74723)
-- Name: benthic_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE benthic_analysis (
    id integer NOT NULL,
    taxon text,
    relative_abundance numeric
);


ALTER TABLE benthic_analysis OWNER TO biotecmar;

--
-- TOC entry 191 (class 1259 OID 74721)
-- Name: benthic_analysis_id_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE benthic_analysis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE benthic_analysis_id_seq OWNER TO biotecmar;

--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 191
-- Name: benthic_analysis_id_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE benthic_analysis_id_seq OWNED BY benthic_analysis.id;


--
-- TOC entry 181 (class 1259 OID 74634)
-- Name: biotic_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE biotic_analysis (
    id integer NOT NULL,
    bacterial_count_cellml numeric,
    chlorophyll_a_ugl numeric,
    pheophytin_ugl numeric
);


ALTER TABLE biotic_analysis OWNER TO biotecmar;

--
-- TOC entry 180 (class 1259 OID 74632)
-- Name: biotic_analysis_id_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE biotic_analysis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE biotic_analysis_id_seq OWNER TO biotecmar;

--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 180
-- Name: biotic_analysis_id_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE biotic_analysis_id_seq OWNED BY biotic_analysis.id;


--
-- TOC entry 172 (class 1259 OID 74392)
-- Name: configuracao; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE configuracao (
    nom_configuracao character varying(100),
    valor_configuracao character varying(200)
);


ALTER TABLE configuracao OWNER TO biotecmar;

--
-- TOC entry 190 (class 1259 OID 74709)
-- Name: fish_assembly_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE fish_assembly_analysis (
    id integer NOT NULL,
    abundance numeric,
    id_taxon bigint,
    id_sample integer
);


ALTER TABLE fish_assembly_analysis OWNER TO biotecmar;

--
-- TOC entry 189 (class 1259 OID 74707)
-- Name: fish_assembly_analysis_id_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE fish_assembly_analysis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fish_assembly_analysis_id_seq OWNER TO biotecmar;

--
-- TOC entry 2159 (class 0 OID 0)
-- Dependencies: 189
-- Name: fish_assembly_analysis_id_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE fish_assembly_analysis_id_seq OWNED BY fish_assembly_analysis.id;


--
-- TOC entry 188 (class 1259 OID 74688)
-- Name: metagenome_functional_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE metagenome_functional_analysis (
    id integer NOT NULL,
    reference_db_id text NOT NULL,
    function text NOT NULL,
    id_meta_analysis integer
);


ALTER TABLE metagenome_functional_analysis OWNER TO biotecmar;

--
-- TOC entry 187 (class 1259 OID 74686)
-- Name: metagenome_functional_analysis_id_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE metagenome_functional_analysis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metagenome_functional_analysis_id_seq OWNER TO biotecmar;

--
-- TOC entry 2160 (class 0 OID 0)
-- Dependencies: 187
-- Name: metagenome_functional_analysis_id_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE metagenome_functional_analysis_id_seq OWNED BY metagenome_functional_analysis.id;


--
-- TOC entry 185 (class 1259 OID 74664)
-- Name: metagenome_taxonomic_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE metagenome_taxonomic_analysis (
    id integer NOT NULL,
    taxon text NOT NULL,
    abundance numeric,
    id_meta_analysis integer
);


ALTER TABLE metagenome_taxonomic_analysis OWNER TO biotecmar;

--
-- TOC entry 184 (class 1259 OID 74662)
-- Name: metagenome_taxonomic_analysis_id_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE metagenome_taxonomic_analysis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metagenome_taxonomic_analysis_id_seq OWNER TO biotecmar;

--
-- TOC entry 2161 (class 0 OID 0)
-- Dependencies: 184
-- Name: metagenome_taxonomic_analysis_id_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE metagenome_taxonomic_analysis_id_seq OWNED BY metagenome_taxonomic_analysis.id;


--
-- TOC entry 183 (class 1259 OID 74648)
-- Name: metagenomic_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE metagenomic_analysis (
    id integer NOT NULL,
    external_id text,
    fasta_file_url text
);


ALTER TABLE metagenomic_analysis OWNER TO biotecmar;

--
-- TOC entry 182 (class 1259 OID 74646)
-- Name: metagenomic_analysis_id_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE metagenomic_analysis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metagenomic_analysis_id_seq OWNER TO biotecmar;

--
-- TOC entry 2162 (class 0 OID 0)
-- Dependencies: 182
-- Name: metagenomic_analysis_id_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE metagenomic_analysis_id_seq OWNED BY metagenomic_analysis.id;


--
-- TOC entry 186 (class 1259 OID 74678)
-- Name: reference_db; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE reference_db (
    id text NOT NULL
);


ALTER TABLE reference_db OWNER TO biotecmar;

--
-- TOC entry 175 (class 1259 OID 74591)
-- Name: sample; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE sample (
    id bigint NOT NULL,
    type text,
    environment text,
    name text,
    latitude numeric,
    longitude numeric,
    depth numeric,
    dt date,
    id_sample bigint NOT NULL
);


ALTER TABLE sample OWNER TO biotecmar;

--
-- TOC entry 195 (class 1259 OID 90761)
-- Name: sample_id_sample_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE sample_id_sample_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sample_id_sample_seq OWNER TO biotecmar;

--
-- TOC entry 2163 (class 0 OID 0)
-- Dependencies: 195
-- Name: sample_id_sample_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE sample_id_sample_seq OWNED BY sample.id_sample;


--
-- TOC entry 174 (class 1259 OID 74589)
-- Name: sample_id_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE sample_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sample_id_seq OWNER TO biotecmar;

--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 174
-- Name: sample_id_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE sample_id_seq OWNED BY sample.id;


--
-- TOC entry 173 (class 1259 OID 74581)
-- Name: sample_type; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE sample_type (
    type text NOT NULL
);


ALTER TABLE sample_type OWNER TO biotecmar;

--
-- TOC entry 194 (class 1259 OID 82571)
-- Name: taxon; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE taxon (
    id_taxon bigint NOT NULL,
    kingdom character varying(100),
    phylum character varying(100),
    class character varying(100),
    ord character varying,
    family character varying(100),
    genus character varying(100),
    species character varying(100),
    infraspecificepithet character varying(100),
    taxonrank character varying(100),
    scientificname character varying(100),
    taxonkey bigint
);


ALTER TABLE taxon OWNER TO biotecmar;

--
-- TOC entry 193 (class 1259 OID 82569)
-- Name: taxon_id_taxon_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE taxon_id_taxon_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE taxon_id_taxon_seq OWNER TO biotecmar;

--
-- TOC entry 2165 (class 0 OID 0)
-- Dependencies: 193
-- Name: taxon_id_taxon_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE taxon_id_taxon_seq OWNED BY taxon.id_taxon;


--
-- TOC entry 1965 (class 2604 OID 74623)
-- Name: id; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY abiotic_analysis ALTER COLUMN id SET DEFAULT nextval('abiotic_analysis_id_seq'::regclass);


--
-- TOC entry 1964 (class 2604 OID 74612)
-- Name: id; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY area ALTER COLUMN id SET DEFAULT nextval('area_id_seq'::regclass);


--
-- TOC entry 1961 (class 2604 OID 74384)
-- Name: id; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY ator ALTER COLUMN id SET DEFAULT nextval('ator_id_seq'::regclass);


--
-- TOC entry 1971 (class 2604 OID 74726)
-- Name: id; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY benthic_analysis ALTER COLUMN id SET DEFAULT nextval('benthic_analysis_id_seq'::regclass);


--
-- TOC entry 1966 (class 2604 OID 74637)
-- Name: id; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY biotic_analysis ALTER COLUMN id SET DEFAULT nextval('biotic_analysis_id_seq'::regclass);


--
-- TOC entry 1970 (class 2604 OID 74712)
-- Name: id; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY fish_assembly_analysis ALTER COLUMN id SET DEFAULT nextval('fish_assembly_analysis_id_seq'::regclass);


--
-- TOC entry 1969 (class 2604 OID 74691)
-- Name: id; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenome_functional_analysis ALTER COLUMN id SET DEFAULT nextval('metagenome_functional_analysis_id_seq'::regclass);


--
-- TOC entry 1968 (class 2604 OID 74667)
-- Name: id; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenome_taxonomic_analysis ALTER COLUMN id SET DEFAULT nextval('metagenome_taxonomic_analysis_id_seq'::regclass);


--
-- TOC entry 1967 (class 2604 OID 74651)
-- Name: id; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenomic_analysis ALTER COLUMN id SET DEFAULT nextval('metagenomic_analysis_id_seq'::regclass);


--
-- TOC entry 1963 (class 2604 OID 116338)
-- Name: id; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY sample ALTER COLUMN id SET DEFAULT nextval('sample_id_seq'::regclass);


--
-- TOC entry 1962 (class 2604 OID 90763)
-- Name: id_sample; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY sample ALTER COLUMN id_sample SET DEFAULT nextval('sample_id_sample_seq'::regclass);


--
-- TOC entry 1972 (class 2604 OID 82574)
-- Name: id_taxon; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY taxon ALTER COLUMN id_taxon SET DEFAULT nextval('taxon_id_taxon_seq'::regclass);


--
-- TOC entry 2133 (class 0 OID 74620)
-- Dependencies: 179
-- Data for Name: abiotic_analysis; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

COPY abiotic_analysis (id, salinity_s, temperature_c, doc_um, nitrite_um, nitrate_um, ammonia_um, organic_nitrogen_um, silicate_um, organic_phosphorous_um, ortho_phosphate_um) FROM stdin;
\.


--
-- TOC entry 2166 (class 0 OID 0)
-- Dependencies: 178
-- Name: abiotic_analysis_id_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('abiotic_analysis_id_seq', 1, false);


--
-- TOC entry 2131 (class 0 OID 74609)
-- Dependencies: 177
-- Data for Name: area; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

COPY area (id, name, nw_latitude, nw_longitude, se_latitude, se_longitude) FROM stdin;
\.


--
-- TOC entry 2167 (class 0 OID 0)
-- Dependencies: 176
-- Name: area_id_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('area_id_seq', 1, false);


--
-- TOC entry 2125 (class 0 OID 74381)
-- Dependencies: 171
-- Data for Name: ator; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

COPY ator (id, login, senha, nome, perfil) FROM stdin;
1	admin	202cb962ac59075b964b07152d234b70	Admin	AD
\.


--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 170
-- Name: ator_id_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('ator_id_seq', 1, true);


--
-- TOC entry 2146 (class 0 OID 74723)
-- Dependencies: 192
-- Data for Name: benthic_analysis; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

COPY benthic_analysis (id, taxon, relative_abundance) FROM stdin;
\.


--
-- TOC entry 2169 (class 0 OID 0)
-- Dependencies: 191
-- Name: benthic_analysis_id_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('benthic_analysis_id_seq', 1, false);


--
-- TOC entry 2135 (class 0 OID 74634)
-- Dependencies: 181
-- Data for Name: biotic_analysis; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

COPY biotic_analysis (id, bacterial_count_cellml, chlorophyll_a_ugl, pheophytin_ugl) FROM stdin;
\.


--
-- TOC entry 2170 (class 0 OID 0)
-- Dependencies: 180
-- Name: biotic_analysis_id_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('biotic_analysis_id_seq', 1, false);


--
-- TOC entry 2126 (class 0 OID 74392)
-- Dependencies: 172
-- Data for Name: configuracao; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

COPY configuracao (nom_configuracao, valor_configuracao) FROM stdin;
gerenciador	1.0
\.


--
-- TOC entry 2144 (class 0 OID 74709)
-- Dependencies: 190
-- Data for Name: fish_assembly_analysis; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

COPY fish_assembly_analysis (id, abundance, id_taxon, id_sample) FROM stdin;
5842	\N	4225	145
5843	\N	4227	145
5844	\N	4241	145
5845	\N	4242	145
5846	\N	4285	145
5847	\N	4257	145
5848	\N	4262	145
5849	\N	4304	145
5850	\N	4305	145
5851	\N	4322	145
5852	\N	4330	145
5853	\N	4298	145
5854	\N	4288	145
5855	\N	4325	145
5856	\N	4309	145
5857	\N	4281	145
5858	\N	4296	145
5859	\N	4224	145
5860	\N	4239	145
5861	\N	4332	145
5862	\N	4390	145
5863	\N	4282	145
5864	\N	4271	145
5865	\N	4270	145
5866	\N	4235	145
5867	\N	4256	145
5868	\N	4300	145
5869	\N	4364	145
5870	\N	4385	145
5871	\N	4405	145
5872	\N	4228	145
5873	\N	4427	145
5874	\N	4366	145
5875	\N	4432	145
5876	\N	4295	145
5877	\N	4220	145
5878	\N	4246	145
5879	\N	4289	145
5880	\N	4220	146
5881	\N	4221	146
5882	\N	4222	146
5883	\N	4235	146
5884	\N	4236	146
5885	\N	4237	146
5886	\N	4238	146
5887	\N	4240	146
5888	\N	4253	146
5889	\N	4254	146
5890	\N	4255	146
5891	\N	4256	146
5892	\N	4268	146
5893	\N	4269	146
5894	\N	4270	146
5895	\N	4271	146
5896	\N	4280	146
5897	\N	4261	146
5898	\N	4281	146
5899	\N	4258	146
5900	\N	4274	146
5901	\N	4295	146
5902	\N	4296	146
5903	\N	4297	146
5904	\N	4292	146
5905	\N	4298	146
5906	\N	4299	146
5907	\N	4300	146
5908	\N	4301	146
5909	\N	4302	146
5910	\N	4311	146
5911	\N	4312	146
5912	\N	4313	146
5913	\N	4264	146
5914	\N	4321	146
5915	\N	4262	146
5916	\N	4325	146
5917	\N	4316	146
5918	\N	4326	146
5919	\N	4265	146
5920	\N	4245	146
5921	\N	4308	146
5922	\N	4340	146
5923	\N	4291	146
5924	\N	4350	146
5925	\N	4275	146
5926	\N	4246	146
5927	\N	4357	146
5928	\N	4289	146
5929	\N	4347	146
5930	\N	4243	146
5931	\N	4239	146
5932	\N	4283	146
5933	\N	4363	146
5934	\N	4373	146
5935	\N	4374	146
5936	\N	4375	146
5937	\N	4247	146
5938	\N	4257	146
5939	\N	4285	146
5940	\N	4383	146
5941	\N	4384	146
5942	\N	4385	146
5943	\N	4234	146
5944	\N	4389	146
5945	\N	4322	146
5946	\N	4303	146
5947	\N	4395	146
5948	\N	4390	146
5949	\N	4396	146
5950	\N	4400	146
5951	\N	4333	146
5952	\N	4403	146
5953	\N	4404	146
5954	\N	4405	146
5955	\N	4228	146
5956	\N	4406	146
5957	\N	4407	146
5958	\N	4408	146
5959	\N	4227	146
5960	\N	4305	146
5961	\N	4226	146
5962	\N	4416	146
5963	\N	4339	146
5964	\N	4344	146
5965	\N	4372	146
5966	\N	4293	146
5967	\N	4224	146
5968	\N	4386	146
5969	\N	4309	146
5970	\N	4306	146
5971	\N	4392	146
5972	\N	4421	146
5973	\N	4379	146
5974	\N	4419	146
5975	\N	4422	146
5976	\N	4426	146
5977	\N	4232	146
5978	\N	4428	146
5979	\N	4387	146
5980	\N	4229	146
5981	\N	4288	146
5982	\N	4282	146
5983	\N	4286	146
5984	\N	4324	146
5985	\N	4431	146
5986	\N	4433	146
5987	\N	4371	146
5988	\N	4247	147
5989	\N	4265	147
5990	\N	4276	147
5991	\N	4277	147
5992	\N	4278	147
5993	\N	4293	147
5994	\N	4245	147
5995	\N	4309	147
5996	\N	4289	147
5997	\N	4323	147
5998	\N	4232	147
5999	\N	4274	147
6000	\N	4355	147
6001	\N	4356	147
6002	\N	4272	147
6003	\N	4346	147
6004	\N	4375	147
6005	\N	4316	147
6006	\N	4312	147
6007	\N	4246	147
6008	\N	4306	147
6009	\N	4233	148
6010	\N	4248	148
6011	\N	4249	148
6012	\N	4250	148
6013	\N	4243	148
6014	\N	4251	148
6015	\N	4252	148
6016	\N	4265	148
6017	\N	4266	148
6018	\N	4267	148
6019	\N	4230	148
6020	\N	4279	148
6021	\N	4234	148
6022	\N	4294	148
6023	\N	4291	148
6024	\N	4309	148
6025	\N	4319	148
6026	\N	4246	148
6027	\N	4308	148
6028	\N	4324	148
6029	\N	4334	148
6030	\N	4335	148
6031	\N	4336	148
6032	\N	4347	148
6033	\N	4274	148
6034	\N	4320	148
6035	\N	4354	148
6036	\N	4362	148
6037	\N	4356	148
6038	\N	4245	148
6039	\N	4318	148
6040	\N	4370	148
6041	\N	4310	148
6042	\N	4316	148
6043	\N	4224	148
6044	\N	4372	148
6045	\N	4381	148
6046	\N	4351	148
6047	\N	4276	148
6048	\N	4388	148
6049	\N	4355	148
6050	\N	4394	148
6051	\N	4333	148
6052	\N	4332	148
6053	\N	4360	148
6054	\N	4399	148
6055	\N	4377	148
6056	\N	4409	148
6057	\N	4410	148
6058	\N	4299	148
6059	\N	4415	148
6060	\N	4306	148
6061	\N	4284	148
6062	\N	4227	148
6063	\N	4420	148
6064	\N	4348	148
6065	\N	4349	148
6066	\N	4222	148
6067	\N	4238	148
6068	\N	4425	148
6069	\N	4289	148
6070	\N	4430	148
6071	\N	4247	148
6072	\N	4293	148
6073	\N	4353	148
6074	\N	4386	148
6075	\N	4229	149
6076	\N	4230	149
6077	\N	4231	149
6078	\N	4262	149
6079	\N	4263	149
6080	\N	4264	149
6081	\N	4274	149
6082	\N	4275	149
6083	\N	4292	149
6084	\N	4273	149
6085	\N	4290	149
6086	\N	4308	149
6087	\N	4317	149
6088	\N	4318	149
6089	\N	4222	149
6090	\N	4333	149
6091	\N	4234	149
6092	\N	4226	149
6093	\N	4300	149
6094	\N	4276	149
6095	\N	4309	149
6096	\N	4349	149
6097	\N	4249	149
6098	\N	4258	149
6099	\N	4271	149
6100	\N	4224	149
6101	\N	4368	149
6102	\N	4355	149
6103	\N	4372	149
6104	\N	4377	149
6105	\N	4378	149
6106	\N	4306	149
6107	\N	4288	149
6108	\N	4393	149
6109	\N	4238	149
6110	\N	4364	149
6111	\N	4245	149
6112	\N	4244	149
6113	\N	4246	149
6114	\N	4282	149
6115	\N	4414	149
6116	\N	4419	149
6117	\N	4243	149
6118	\N	4247	149
6119	\N	4410	149
6120	\N	4409	149
6121	\N	4305	149
6122	\N	4289	149
6123	\N	4299	149
6124	\N	4227	149
6125	\N	4293	149
6126	\N	4265	149
6127	\N	4304	149
6128	\N	4232	150
6129	\N	4289	150
6130	\N	4274	150
6131	\N	4222	150
6132	\N	4277	150
6133	\N	4345	150
6134	\N	4346	150
6135	\N	4293	150
6136	\N	4361	150
6137	\N	4355	150
6138	\N	4245	150
6139	\N	4379	150
6140	\N	4380	150
6141	\N	4246	150
6142	\N	4243	150
6143	\N	4332	150
6144	\N	4264	150
6145	\N	4309	150
6146	\N	4306	150
6147	\N	4276	150
6148	\N	4316	150
6149	\N	4247	150
6150	\N	4224	150
6151	\N	4370	150
6152	\N	4392	150
6153	\N	4265	150
6154	\N	4360	150
6155	\N	4223	151
6156	\N	4225	151
6157	\N	4239	151
6158	\N	4247	151
6159	\N	4272	151
6160	\N	4283	151
6161	\N	4281	151
6162	\N	4284	151
6163	\N	4303	151
6164	\N	4301	151
6165	\N	4287	151
6166	\N	4314	151
6167	\N	4327	151
6168	\N	4328	151
6169	\N	4329	151
6170	\N	4291	151
6171	\N	4337	151
6172	\N	4338	151
6173	\N	4322	151
6174	\N	4341	151
6175	\N	4330	151
6176	\N	4342	151
6177	\N	4325	151
6178	\N	4298	151
6179	\N	4364	151
6180	\N	4262	151
6181	\N	4365	151
6182	\N	4386	151
6183	\N	4271	151
6184	\N	4397	151
6185	\N	4363	151
6186	\N	4296	151
6187	\N	4315	151
6188	\N	4417	151
6189	\N	4366	151
6190	\N	4280	151
6191	\N	4429	151
6192	\N	4390	151
6193	\N	4344	151
6194	\N	4408	151
6195	\N	4270	151
6196	\N	4288	151
6197	\N	4434	151
6198	\N	4347	151
6199	\N	4234	152
6200	\N	4310	152
6201	\N	4320	152
6202	\N	4293	152
6203	\N	4238	152
6204	\N	4348	152
6205	\N	4349	152
6206	\N	4246	152
6207	\N	4247	152
6208	\N	4318	152
6209	\N	4361	152
6210	\N	4284	152
6211	\N	4306	152
6212	\N	4243	152
6213	\N	4372	152
6214	\N	4266	152
6215	\N	4333	152
6216	\N	4394	152
6217	\N	4261	153
6218	\N	4244	154
6219	\N	4245	154
6220	\N	4246	154
6221	\N	4258	154
6222	\N	4259	154
6223	\N	4261	154
6224	\N	4271	154
6225	\N	4241	154
6226	\N	4226	154
6227	\N	4299	154
6228	\N	4297	154
6229	\N	4316	154
6230	\N	4332	154
6231	\N	4282	154
6232	\N	4339	154
6233	\N	4308	154
6234	\N	4353	154
6235	\N	4265	154
6236	\N	4249	154
6237	\N	4322	154
6238	\N	4359	154
6239	\N	4355	154
6240	\N	4227	154
6241	\N	4360	154
6242	\N	4349	154
6243	\N	4318	154
6244	\N	4255	154
6245	\N	4371	154
6246	\N	4221	154
6247	\N	4376	154
6248	\N	4300	154
6249	\N	4220	154
6250	\N	4247	154
6251	\N	4229	154
6252	\N	4401	154
6253	\N	4402	154
6254	\N	4222	154
6255	\N	4289	154
6256	\N	4323	154
6257	\N	4228	154
6258	\N	4413	154
6259	\N	4305	154
6260	\N	4405	154
6261	\N	4372	154
6262	\N	4406	154
6263	\N	4243	154
6264	\N	4277	154
6265	\N	4222	154
6266	\N	4306	154
6267	\N	4224	155
6268	\N	4271	155
6269	\N	4282	155
6270	\N	4267	155
6271	\N	4246	155
6272	\N	4300	155
6273	\N	4253	155
6274	\N	4272	155
6275	\N	4281	155
6276	\N	4317	155
6277	\N	4351	155
6278	\N	4226	155
6279	\N	4363	155
6280	\N	4344	155
6281	\N	4239	155
6282	\N	4306	155
6283	\N	4289	155
6284	\N	4326	155
6285	\N	4285	155
6286	\N	4373	155
6287	\N	4293	155
6288	\N	4296	155
6289	\N	4243	155
6290	\N	4228	155
6291	\N	4361	155
6292	\N	4220	155
6293	\N	4226	156
6294	\N	4228	156
6295	\N	4243	156
6296	\N	4257	156
6297	\N	4260	156
6298	\N	4273	156
6299	\N	4286	156
6300	\N	4287	156
6301	\N	4255	156
6302	\N	4288	156
6303	\N	4274	156
6304	\N	4289	156
6305	\N	4290	156
6306	\N	4291	156
6307	\N	4281	156
6308	\N	4306	156
6309	\N	4307	156
6310	\N	4315	156
6311	\N	4246	156
6312	\N	4282	156
6313	\N	4268	156
6314	\N	4265	156
6315	\N	4331	156
6316	\N	4330	156
6317	\N	4229	156
6318	\N	4229	156
6319	\N	4343	156
6320	\N	4344	156
6321	\N	4352	156
6322	\N	4358	156
6323	\N	4365	156
6324	\N	4366	156
6325	\N	4366	156
6326	\N	4367	156
6327	\N	4253	156
6328	\N	4369	156
6329	\N	4361	156
6330	\N	4295	156
6331	\N	4300	156
6332	\N	4382	156
6333	\N	4271	156
6334	\N	4387	156
6335	\N	4315	156
6336	\N	4391	156
6337	\N	4392	156
6338	\N	4363	156
6339	\N	4277	156
6340	\N	4289	156
6341	\N	4224	156
6342	\N	4398	156
6343	\N	4368	156
6344	\N	4234	156
6345	\N	4244	156
6346	\N	4293	156
6347	\N	4411	156
6348	\N	4245	156
6349	\N	4412	156
6350	\N	4293	156
6351	\N	4271	156
6352	\N	4322	156
6353	\N	4418	156
6354	\N	4287	156
6355	\N	4262	156
6356	\N	4310	156
6357	\N	4263	156
6358	\N	4423	156
6359	\N	4424	156
6360	\N	4347	156
6361	\N	4239	156
6362	\N	4428	156
6363	\N	4325	156
6364	\N	4285	156
6365	\N	4415	156
6366	\N	4262	156
6367	\N	4403	156
6368	\N	4332	156
6369	\N	4235	156
6370	\N	4321	156
6371	\N	4309	156
6372	\N	4435	156
\.


--
-- TOC entry 2171 (class 0 OID 0)
-- Dependencies: 189
-- Name: fish_assembly_analysis_id_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('fish_assembly_analysis_id_seq', 6372, true);


--
-- TOC entry 2142 (class 0 OID 74688)
-- Dependencies: 188
-- Data for Name: metagenome_functional_analysis; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

COPY metagenome_functional_analysis (id, reference_db_id, function, id_meta_analysis) FROM stdin;
\.


--
-- TOC entry 2172 (class 0 OID 0)
-- Dependencies: 187
-- Name: metagenome_functional_analysis_id_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('metagenome_functional_analysis_id_seq', 1, false);


--
-- TOC entry 2139 (class 0 OID 74664)
-- Dependencies: 185
-- Data for Name: metagenome_taxonomic_analysis; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

COPY metagenome_taxonomic_analysis (id, taxon, abundance, id_meta_analysis) FROM stdin;
\.


--
-- TOC entry 2173 (class 0 OID 0)
-- Dependencies: 184
-- Name: metagenome_taxonomic_analysis_id_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('metagenome_taxonomic_analysis_id_seq', 1, false);


--
-- TOC entry 2137 (class 0 OID 74648)
-- Dependencies: 183
-- Data for Name: metagenomic_analysis; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

COPY metagenomic_analysis (id, external_id, fasta_file_url) FROM stdin;
\.


--
-- TOC entry 2174 (class 0 OID 0)
-- Dependencies: 182
-- Name: metagenomic_analysis_id_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('metagenomic_analysis_id_seq', 1, false);


--
-- TOC entry 2140 (class 0 OID 74678)
-- Dependencies: 186
-- Data for Name: reference_db; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

COPY reference_db (id) FROM stdin;
\.


--
-- TOC entry 2129 (class 0 OID 74591)
-- Dependencies: 175
-- Data for Name: sample; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

COPY sample (id, type, environment, name, latitude, longitude, depth, dt, id_sample) FROM stdin;
145	\N	\N	\N	-20.13152	-37.49183	71.0	2015-11-04	51
146	\N	\N	\N	-20.80583	-37.76123	77.5	2015-11-04	52
147	\N	\N	\N	-20.76584	-31.83651	84.0	2015-11-04	53
148	\N	\N	\N	-20.52542	-29.31035	42.5	2015-11-04	54
149	\N	\N	\N	-20.57672	-34.80645	37.0	2015-11-04	55
150	\N	\N	\N	-21.00496	-34.11486	85.0	2015-11-04	56
151	\N	\N	\N	-19.84874	-38.13464	\N	2015-11-04	57
152	\N	\N	\N	-20.48813	-28.84407	15.0	2015-11-04	58
153	\N	\N	\N	-20.41495	-36.4185	37.0	2015-11-04	59
154	\N	\N	\N	-20.41495	-36.4185	\N	2015-11-04	60
155	\N	\N	\N	-22.38222	-37.5875	66.0	2015-11-04	61
156	\N	\N	\N	-20.38903	-36.68958	62.0	2015-11-04	62
\.


--
-- TOC entry 2175 (class 0 OID 0)
-- Dependencies: 195
-- Name: sample_id_sample_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('sample_id_sample_seq', 62, true);


--
-- TOC entry 2176 (class 0 OID 0)
-- Dependencies: 174
-- Name: sample_id_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('sample_id_seq', 156, true);


--
-- TOC entry 2127 (class 0 OID 74581)
-- Dependencies: 173
-- Data for Name: sample_type; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

COPY sample_type (type) FROM stdin;
\.


--
-- TOC entry 2148 (class 0 OID 82571)
-- Dependencies: 194
-- Data for Name: taxon; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

COPY taxon (id_taxon, kingdom, phylum, class, ord, family, genus, species, infraspecificepithet, taxonrank, scientificname, taxonkey) FROM stdin;
4220	Animalia	Chordata	Actinopterygii	Perciformes	Gobiidae	Elacatinus			GENUS	Elacatinus Jordan, 1904	2376682
4221	Animalia	Chordata	Actinopterygii	Perciformes	Pomacentridae	Chromis	Chromis multilineata		SPECIES	Chromis multilineata (Guichenot, 1853)	5212222
4222	Animalia	Chordata	Actinopterygii	Perciformes	Gobiidae	Lythrypnus			GENUS	Lythrypnus Jordan & Evermann, 1896	2375993
4223	Animalia	Chordata	Elasmobranchii	Lamniformes	Alopiidae	Alopias	Alopias superciliosus		SPECIES	Alopias superciliosus Lowe, 1841	2420813
4224	Animalia	Chordata	Actinopterygii	Perciformes	Scaridae	Sparisoma	Sparisoma tuiupiranga		SPECIES	Sparisoma tuiupiranga Gasparini, Joyeux & Floeter, 2003	2393936
4225	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Hyporthodus	Hyporthodus niveatus		SPECIES	Hyporthodus niveatus (Valenciennes, 1828)	5788225
4226	Animalia	Chordata	Actinopterygii	Perciformes	Labridae	Halichoeres	Halichoeres rubrovirens		SPECIES	Halichoeres rubrovirens Rocha, Pinheiro & Gasparini, 2010	5853038
4227	Animalia	Chordata	Actinopterygii	Beryciformes	Holocentridae	Myripristis	Myripristis jacobus		SPECIES	Myripristis jacobus Cuvier, 1829	2357064
4228	Animalia	Chordata	Actinopterygii	Perciformes	Gobiidae	Coryphopterus	Coryphopterus thrix		SPECIES	Coryphopterus thrix BÃ¶hlke & Robins, 1960	2377830
4229	Animalia	Chordata	Actinopterygii	Anguilliformes	Muraenidae	Gymnothorax	Gymnothorax funebris		SPECIES	Gymnothorax funebris Ranzani, 1839	2403964
4230	Animalia	Chordata	Actinopterygii	Perciformes	Blenniidae	Ophioblennius	Ophioblennius trinitatis		SPECIES	Ophioblennius trinitatis Miranda Ribeiro, 1919	2395285
4231	Animalia	Chordata	Actinopterygii	Stomiiformes	Gonostomatidae	Manducus	Manducus maderensis		SPECIES	Manducus maderensis (Johnson, 1890)	2347440
4232	Animalia	Chordata	Actinopterygii	Aulopiformes	Synodontidae	Synodus	Synodus intermedius		SPECIES	Synodus intermedius (Spix & Agassiz, 1829)	5212673
4233	Animalia	Chordata	Actinopterygii	Perciformes	Pempheridae	Pempheris	Pempheris schomburgkii		SPECIES	Pempheris schomburgki MÃ¼ller & Troschel, 1848	2374374
4234	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Serranus	Serranus phoebe		SPECIES	Serranus phoebe Poey, 1851	2388747
4235	Animalia	Chordata	Actinopterygii	Perciformes	Acanthuridae	Acanthurus	Acanthurus bahianus		SPECIES	Acanthurus bahianus Castelnau, 1855	5209181
4236	Animalia	Chordata	Actinopterygii	Perciformes	Chaetodontidae	Chaetodon	Chaetodon striatus		SPECIES	Chaetodon striatus Linnaeus, 1758	2385344
4237	Animalia	Chordata	Actinopterygii	Syngnathiformes	Syngnathidae	Hippocampus	Hippocampus reidi		SPECIES	Hippocampus reidi Ginsburg, 1933	5201123
4238	Animalia	Chordata	Actinopterygii	Perciformes	Scaridae	Sparisoma	Sparisoma amplum		SPECIES	Sparisoma amplum (Ranzani, 1841)	2393931
4239	Animalia	Chordata	Actinopterygii	Tetraodontiformes	Balistidae	Balistes	Balistes vetula		SPECIES	Balistes vetula Linnaeus, 1758	2407103
4240	Animalia	Chordata	Actinopterygii	Aulopiformes	Synodontidae	Synodus	Synodus foetens		SPECIES	Synodus foetens (Linnaeus, 1766)	5212651
4241	Animalia	Chordata	Actinopterygii	Perciformes	Labridae	Halichoeres	Halichoeres poeyi		SPECIES	Halichoeres poeyi (Steindachner, 1867)	2384275
4242	Animalia	Chordata	Actinopterygii	Anguilliformes	Muraenidae	Gymnothorax	Gymnothorax miliaris		SPECIES	Gymnothorax miliaris (Kaup, 1856)	2403816
4243	Animalia	Chordata	Actinopterygii	Perciformes	Chaetodontidae	Prognathodes	Prognathodes brasiliensis		SPECIES	Prognathodes brasiliensis Burgess, 2001	2385620
4244	Animalia	Chordata	Actinopterygii	Perciformes	Priacanthidae	Heteropriacanthus	Heteropriacanthus cruentatus		SPECIES	Heteropriacanthus cruentatus (LacepÃ¨de, 1801)	2375045
4245	Animalia	Chordata	Actinopterygii	Tetraodontiformes	Balistidae	Melichthys	Melichthys niger		SPECIES	Melichthys niger (Bloch, 1786)	2407141
4246	Animalia	Chordata	Actinopterygii	Perciformes	Pomacentridae	Stegastes	Stegastes pictus		SPECIES	Stegastes pictus (Castelnau, 1855)	2398843
4247	Animalia	Chordata	Actinopterygii	Perciformes	Sphyraenidae	Sphyraena	Sphyraena barracuda		SPECIES	Sphyraena barracuda (Edwards, 1771)	2394277
4248	Animalia	Chordata	Actinopterygii	Anguilliformes	Moringuidae	Moringua	Moringua edwardsi		SPECIES	Moringua edwardsi (Jordan & Bollman, 1889)	2403010
4249	Animalia	Chordata	Actinopterygii	Perciformes	Pomacentridae	Microspathodon	Microspathodon chrysurus		SPECIES	Microspathodon chrysurus (Cuvier, 1830)	2398749
4250	Animalia	Chordata	Actinopterygii	Perciformes	Scombridae	Scomberomorus	Scomberomorus cavalla		SPECIES	Scomberomorus cavalla (Cuvier, 1829)	2374282
4251	Animalia	Chordata	Actinopterygii	Perciformes	Scombridae	Thunnus	Thunnus obesus		SPECIES	Thunnus obesus (Lowe, 1839)	2373996
4252	Animalia	Chordata	Actinopterygii	Perciformes	Labridae	Xyrichtys	Xyrichtys splendens		SPECIES	Xyrichthys splendens Castelnau, 1855	2383034
4253	Animalia	Chordata	Actinopterygii	Tetraodontiformes	Tetraodontidae	Canthigaster	Canthigaster figueiredoi		SPECIES	Canthigaster figueiredoi Moura & Castro, 2002	2407732
4254	Animalia	Chordata	Actinopterygii	Perciformes	Labridae	Bodianus	Bodianus pulchellus		SPECIES	Bodianus pulchellus (Poey, 1860)	5209681
4255	Animalia	Chordata	Actinopterygii	Perciformes	Pomacentridae	Chromis	Chromis flavicauda		SPECIES	Chromis flavicauda (GÃ¼nther, 1880)	5212237
4256	Animalia	Chordata	Actinopterygii	Perciformes	Pomacentridae	Chromis	Chromis enchrysura		SPECIES	Chromis enchrysura Jordan & Gilbert, 1882	5212213
4257	Animalia	Chordata	Actinopterygii	Perciformes	Pomacanthidae	Centropyge	Centropyge aurantonotus		SPECIES	Centropyge aurantonotus Burgess, 1974	2396519
4258	Animalia	Chordata	Actinopterygii	Perciformes	Kyphosidae	Kyphosus			GENUS	Kyphosus LacepÃ¨de, 1801	2381286
4259	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Epinephelus	Epinephelus itajara		SPECIES	Epinephelus itajara (Lichtenstein, 1822)	2388456
4260	Animalia	Chordata	Actinopterygii	Tetraodontiformes	Molidae	Masturus	Masturus lanceolatus		SPECIES	Masturus lanceolatus (LiÃ©nard, 1840)	2407925
4261	Animalia	Chordata	Elasmobranchii	Orectolobiformes	Ginglymostomatidae	Ginglymostoma	Ginglymostoma cirratum		SPECIES	Ginglymostoma cirratum (Bonnaterre, 1788)	2417495
4262	Animalia	Chordata	Actinopterygii	Anguilliformes	Muraenidae	Gymnothorax	Gymnothorax moringa		SPECIES	Gymnothorax moringa (Cuvier, 1829)	2404065
4263	Animalia	Chordata	Actinopterygii	Myctophiformes	Myctophidae	Myctophum	Myctophum obtusirostre		SPECIES	Myctophum obtusirostre TÃ¥ning, 1928	2405866
4264	Animalia	Chordata	Actinopterygii	Polymixiiformes	Polymixiidae	Polymixia	Polymixia lowei		SPECIES	Polymixia lowei GÃ¼nther, 1859	2410398
4265	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Mycteroperca	Mycteroperca venenosa		SPECIES	Mycteroperca venenosa (Linnaeus, 1758)	2389034
4266	Animalia	Chordata	Actinopterygii	Perciformes	Scaridae	Sparisoma	Sparisoma axillare		SPECIES	Sparisoma axillare (Steindachner, 1878)	2393922
4267	Animalia	Chordata	Actinopterygii	Perciformes	Scombridae	Thunnus	Thunnus alalunga		SPECIES	Thunnus alalunga (Bonnaterre, 1788)	2373946
4268	Animalia	Chordata	Actinopterygii	Perciformes	Carangidae	Caranx	Caranx latus		SPECIES	Caranx latus Agassiz, 1831	2390847
4269	Animalia	Chordata	Elasmobranchii	Rajiformes	Dasyatidae	Dasyatis	Dasyatis centroura		SPECIES	Dasyatis centroura (Mitchill, 1815)	2419499
4270	Animalia	Chordata	Elasmobranchii	Carcharhiniformes	Carcharhinidae	Galeocerdo	Galeocerdo cuvier		SPECIES	Galeocerdo cuvier (PÃ©ron & Lesueur, 1822)	2418234
4271	Animalia	Chordata	Actinopterygii	Beryciformes	Holocentridae	Holocentrus	Holocentrus adscensionis		SPECIES	Holocentrus adscensionis (Osbeck, 1765)	5204778
4272	Animalia	Chordata	Actinopterygii	Perciformes	Scombridae	Thunnus	Thunnus atlanticus		SPECIES	Thunnus atlanticus (Lesson, 1831)	2373969
4273	Animalia	Chordata	Actinopterygii	Perciformes	Lutjanidae	Lutjanus	Lutjanus analis		SPECIES	Lutjanus analis (Cuvier, 1828)	2384981
4274	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Mycteroperca	Mycteroperca interstitialis		SPECIES	Mycteroperca interstitialis (Poey, 1860)	2389044
4275	Animalia	Chordata	Actinopterygii	Aulopiformes	Synodontidae	Saurida			GENUS	Saurida Valenciennes in Cuvier & Valenciennes, 1850	2401132
4276	Animalia	Chordata	Actinopterygii	Perciformes	Scaridae	Sparisoma	Sparisoma rocha		SPECIES	Sparisoma rocha Pinheiro, Gasparini & Sazima, 2010	5852347
4277	Animalia	Chordata	Actinopterygii	Scorpaeniformes	Scorpaenidae	Scorpaena	Scorpaena dispar		SPECIES	Scorpaena dispar Longley & Hildebrand, 1940	2334636
4278	Animalia	Chordata	Actinopterygii	Anguilliformes	Ophichthidae	Pseudomyrophis	Pseudomyrophis frio		SPECIES	Pseudomyrophis frio (Jordan & Davis, 1891)	2404442
4279	Animalia	Chordata	Actinopterygii	Mugiliformes	Mugilidae	Mugil	Mugil curvidens		SPECIES	Mugil curvidens Valenciennes, 1836	2400657
4280	Animalia	Chordata	Elasmobranchii	Carcharhiniformes	Carcharhinidae	Carcharhinus	Carcharhinus falciformis		SPECIES	Carcharhinus falciformes (MÃ¼ller & Henle, 1839)	2418109
4281	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Cephalopholis	Cephalopholis fulva		SPECIES	Cephalopholis fulva (Linnaeus, 1758)	2388809
4282	Animalia	Chordata	Actinopterygii	Perciformes	Pomacanthidae	Holacanthus	Holacanthus tricolor		SPECIES	Holacanthus tricolor (Bloch, 1795)	5211450
4283	Animalia	Chordata	Actinopterygii	Tetraodontiformes	Monacanthidae	Aluterus	Aluterus monoceros		SPECIES	Aluterus monoceros (Linnaeus, 1758)	2406708
4284	Animalia	Chordata	Elasmobranchii	Carcharhiniformes	Sphyrnidae	Sphyrna	Sphyrna lewini		SPECIES	Sphyrna lewini (Griffith & Smith, 1834)	2418789
4285	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Cephalopholis			GENUS	Cephalopholis Bloch & Schneider, 1801	2388808
4286	Animalia	Chordata	Actinopterygii	Tetraodontiformes	Monacanthidae	Cantherhines	Cantherhines macrocerus		SPECIES	Cantherhines macrocerus (Hollard, 1853)	2406957
4287	Animalia	Chordata	Actinopterygii	Anguilliformes	Muraenidae	Gymnothorax	Gymnothorax vicinus		SPECIES	Gymnothorax vicinus (Castelnau, 1855)	2403930
4288	Animalia	Chordata	Actinopterygii	Perciformes	Lutjanidae	Lutjanus	Lutjanus vivanus		SPECIES	Lutjanus vivanus (Cuvier, 1828)	2384856
4289	Animalia	Chordata	Actinopterygii	Perciformes	Malacanthidae	Malacanthus	Malacanthus plumieri		SPECIES	Malacanthus plumieri (Bloch, 1786)	2389881
4290	Animalia	Chordata	Actinopterygii	Myctophiformes	Myctophidae	Lepidophanes	Lepidophanes guentheri		SPECIES	Lepidophanes guentheri (Goode & Bean, 1896)	2405710
4291	Animalia	Chordata	Actinopterygii	Perciformes	Xiphiidae	Xiphias	Xiphias gladius		SPECIES	Xiphias gladius Linnaeus, 1758	2397850
4292	Animalia	Chordata	Actinopterygii	Perciformes	Lutjanidae	Ocyurus	Ocyurus chrysurus		SPECIES	Lutjanus chrysurus (Bloch, 1791)	2385289
4293	Animalia	Chordata	Actinopterygii	Perciformes	Carangidae	Seriola	Seriola rivoliana		SPECIES	Seriola rivoliana Valenciennes, 1833	5961682
4294	Animalia	Chordata	Actinopterygii	Scorpaeniformes	Scorpaenidae	Scorpaena	Scorpaena plumieri		SPECIES	Scorpaena plumieri Bloch, 1789	2334560
4295	Animalia	Chordata	Actinopterygii	Perciformes	Acanthuridae	Acanthurus	Acanthurus coeruleus		SPECIES	Acanthurus coeruleus Bloch & Schneider, 1801	5209188
4296	Animalia	Chordata	Actinopterygii	Tetraodontiformes	Balistidae	Canthidermis	Canthidermis sufflamen		SPECIES	Canthidermis sufflamen (Mitchill, 1815)	2407087
4297	Animalia	Chordata	Actinopterygii	Perciformes	Gobiidae	Gnatholepis	Gnatholepis thompsoni		SPECIES	Gnatholepis thompsoni Jordan, 1904	2378717
4298	Animalia	Chordata	Actinopterygii	Perciformes	Malacanthidae	Lopholatilus	Lopholatilus villarii		SPECIES	Lopholatilus villarii Miranda Ribeiro, 1915	2389831
4299	Animalia	Chordata	Actinopterygii	Perciformes	Mullidae	Mulloidichthys	Mulloidichthys martinicus		SPECIES	Mulloidichthys martinicus (Cuvier, 1829)	2396844
4300	Animalia	Chordata	Actinopterygii	Perciformes	Labridae	Halichoeres	Halichoeres dimidiatus		SPECIES	Halichoeres dimidiatus (Agassiz, 1831)	2384245
4301	Animalia	Chordata	Elasmobranchii	Lamniformes	Lamnidae	Isurus	Isurus oxyrinchus		SPECIES	Isurus oxyrinchus Rafinesque, 1810	5216248
4302	Animalia	Chordata	Actinopterygii	Tetraodontiformes	Monacanthidae	Stephanolepis	Stephanolepis hispidus		SPECIES	Stephanolepis hispidus (Linnaeus, 1766)	5213455
4303	Animalia	Chordata	Actinopterygii	Tetraodontiformes	Diodontidae	Diodon	Diodon holocanthus		SPECIES	Diodon holocanthus Linnaeus, 1758	5213361
4304	Animalia	Chordata	Actinopterygii	Perciformes	Carangidae	Seriola	Seriola fasciata		SPECIES	Seriola fasciata (Bloch, 1793)	5961709
4305	Animalia	Chordata	Actinopterygii	Perciformes	Pomacanthidae	Holacanthus	Holacanthus ciliaris		SPECIES	Holacanthus ciliaris (Linnaeus, 1758)	5211452
4306	Animalia	Chordata	Actinopterygii	Perciformes	Labridae	Thalassoma	Thalassoma noronhanum		SPECIES	Thalassoma noronhanum (Boulenger, 1890)	2384531
4307	Animalia	Chordata	Actinopterygii	Myctophiformes	Myctophidae	Diaphus	Diaphus splendidus		SPECIES	Diaphus splendidus (Brauer, 1904)	2406262
4308	Animalia	Chordata	Actinopterygii	Perciformes	Apogonidae	Phaeoptyx	Phaeoptyx pigmentaria		SPECIES	Phaeoptyx pigmentaria (Poey, 1860)	2396970
4309	Animalia	Chordata	Actinopterygii	Perciformes	Carangidae	Seriola	Seriola dumerili		SPECIES	Seriola dumerili (Risso, 1810)	5961696
4310	Animalia	Chordata	Actinopterygii	Perciformes	Labridae	Xyrichtys	Xyrichtys novacula		SPECIES	Xyrichtys novacula (Linnaeus, 1758)	2383057
4311	Animalia	Chordata	Elasmobranchii	Carcharhiniformes	Carcharhinidae	Carcharhinus	Carcharhinus longimanus		SPECIES	Carcharhinus longimanus (Poey, 1861)	2418052
4312	Animalia	Chordata	Actinopterygii	Perciformes	Carangidae	Seriola	Seriola lalandi		SPECIES	Seriola lalandi Valenciennes, 1833	5961708
4313	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Pronotogrammus	Pronotogrammus martinicensis		SPECIES	Pronotogrammus martinicensis (Guichenot, 1868)	2387497
4314	Animalia	Chordata	Actinopterygii	Perciformes	Carangidae	Seriola	Seriola zonata		SPECIES	Seriola zonata (Mitchill, 1815)	5961719
4315	Animalia	Chordata	Actinopterygii	Perciformes	Carangidae	Decapterus	Decapterus tabl		SPECIES	Decapterus tabl Berry, 1968	2391055
4316	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Pseudogramma	Pseudogramma gregoryi		SPECIES	Pseudogramma gregoryi (Breder, 1927)	5210100
4317	Animalia	Chordata	Actinopterygii	Perciformes	Labridae	Halichoeres	Halichoeres penrosei		SPECIES	Halichoeres penrosei Starks, 1913	2384140
4318	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Rypticus	Rypticus saponaceus		SPECIES	Rypticus saponaceus (Bloch & Schneider, 1801)	2387710
4319	Animalia	Chordata	Actinopterygii	Anguilliformes	Ophichthidae	Myrichthys	Myrichthys breviceps		SPECIES	Myrichthys breviceps (Richardson, 1848)	2404520
4320	Animalia	Chordata	Actinopterygii	Tetraodontiformes	Tetraodontidae	Sphoeroides	Sphoeroides spengleri		SPECIES	Sphoeroides spengleri (Bloch, 1785)	2407829
4321	Animalia	Chordata	Actinopterygii	Perciformes	Labridae	Clepticus	Clepticus brasiliensis		SPECIES	Clepticus brasiliensis Heiser, Moura & Robertson, 2000	5209748
4322	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Dermatolepis	Dermatolepis inermis		SPECIES	Dermatolepis inermis (Valenciennes, 1833)	2389125
4323	Animalia	Chordata	Actinopterygii	Anguilliformes	Ophichthidae	Ophichthus	Ophichthus gomesii		SPECIES	Ophichthus gomesi (Castelnau, 1855)	5213187
4324	Animalia	Chordata	Actinopterygii	Scorpaeniformes	Scorpaenidae	Scorpaena	Scorpaena brachyptera		SPECIES	Scorpaena brachyptera Eschmeyer, 1965	2334586
4325	Animalia	Chordata	Actinopterygii	Perciformes	Carangidae	Caranx	Caranx crysos		SPECIES	Caranx crysos (Mitchill, 1815)	2390762
4326	Animalia	Chordata	Actinopterygii	Perciformes	Scombridae	Thunnus	Thunnus albacares		SPECIES	Thunnus albacares (Bonnaterre, 1788)	2374013
4327	Animalia	Chordata	Elasmobranchii	Carcharhiniformes	Carcharhinidae	Carcharhinus	Carcharhinus signatus		SPECIES	Carcharhinus signatus (Poey, 1868)	2418077
4328	Animalia	Chordata	Elasmobranchii	Carcharhiniformes	Sphyrnidae	Sphyrna	Sphyrna zygaena		SPECIES	Sphyrna zygaena (Linnaeus, 1758)	2418794
4329	Animalia	Chordata	Actinopterygii	Anguilliformes	Muraenidae	Gymnothorax	Gymnothorax maderensis		SPECIES	Gymnothorax maderensis (Johnson, 1862)	2403887
4330	Animalia	Chordata	Actinopterygii	Perciformes	Lutjanidae	Rhomboplites	Rhomboplites aurorubens		SPECIES	Rhomboplites aurorubens (Cuvier, 1829)	2384721
4331	Animalia	Chordata	Actinopterygii	Myctophiformes	Myctophidae	Diaphus	Diaphus lucidus		SPECIES	Diaphus lucidus (Goode & Bean, 1896)	2406331
4332	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Serranus	Serranus annularis		SPECIES	Serranus annularis (GÃ¼nther, 1880)	2388708
4333	Animalia	Chordata	Actinopterygii	Beryciformes	Holocentridae	Sargocentron	Sargocentron bullisi		SPECIES	Sargocentron bullisi (Woods, 1955)	2356819
4334	Animalia	Chordata	Actinopterygii	Scorpaeniformes	Scorpaenidae	Scorpaenodes	Scorpaenodes caribbaeus		SPECIES	Scorpaenodes caribbaeus Meek & Hildebrand, 1928	2334385
4335	Animalia	Chordata	Actinopterygii	Anguilliformes	Ophichthidae	Myrophis			GENUS	Myrophis LÃ¼tken, 1852	2403413
4336	Animalia	Chordata	Actinopterygii	Gobiesociformes	Gobiesocidae	Tomicodon			GENUS	Tomicodon Brisout de Barneville, 1846	2411479
4337	Animalia	Chordata	Elasmobranchii	Lamniformes	Lamnidae	Isurus	Isurus paucus		SPECIES	Isurus paucus Guitart, 1966	5216258
4338	Animalia	Chordata	Actinopterygii	Perciformes	Lutjanidae	Etelis	Etelis oculatus		SPECIES	Etelis oculatus (Valenciennes, 1828)	2385140
4339	Animalia	Chordata	Actinopterygii	Perciformes	Carangidae	Elagatis	Elagatis bipinnulata		SPECIES	Elagatis bipinnulata (Quoy & Gaimard, 1825)	5210446
4340	Animalia	Chordata	Actinopterygii	Perciformes	Apogonidae	Apogon	Apogon pseudomaculatus		SPECIES	Apogon pseudomaculatus Longley, 1932	5211723
4341	Animalia	Chordata	Actinopterygii	Tetraodontiformes	Molidae	Mola	Mola mola		SPECIES	Mola mola (Linnaeus, 1758)	5213725
4342	Animalia	Chordata	Elasmobranchii	Squaliformes	Squalidae	Squalus	Squalus mitsukurii		SPECIES	Squalus mitsukurii Jordan & Snyder, 1903	5216338
4343	Animalia	Chordata	Actinopterygii	Stomiiformes	Gonostomatidae	Diplophos	Diplophos taenia		SPECIES	Diplophos taenia GÃ¼nther, 1873	2347474
4344	Animalia	Chordata	Actinopterygii	Perciformes	Gempylidae	Lepidocybium	Lepidocybium flavobrunneum		SPECIES	Lepidocybium flavobrunneum (Smith, 1843)	2397724
4345	Animalia	Chordata	Actinopterygii	Scorpaeniformes	Scorpaenidae	Scorpaenodes	Scorpaenodes tredecimspinosus		SPECIES	Scorpaenodes tredecimspinosus (Metzelaar, 1919)	2334371
4346	Animalia	Chordata	Actinopterygii	Perciformes	Labridae	Xyrichtys			GENUS	Xyrichtys Cuvier, 1814	2383029
4347	Animalia	Chordata	Elasmobranchii	Carcharhiniformes	Carcharhinidae	Prionace	Prionace glauca		SPECIES	Prionace glauca (Linnaeus, 1758)	2417940
4348	Animalia	Chordata	Actinopterygii	Perciformes	Blenniidae	Scartella	Scartella poiti		SPECIES	Scartella poiti Rangel, Gasparini & GuimarÃ£es, 2004	2395172
4349	Animalia	Chordata	Actinopterygii	Perciformes	Pomacentridae	Stegastes	Stegastes fuscus		SPECIES	Stegastes fuscus (Cuvier, 1830)	2398866
4350	Animalia	Chordata	Actinopterygii	Syngnathiformes	Aulostomidae	Aulostomus	Aulostomus strigosus		SPECIES	Aulostomus strigosus Wheeler, 1955	2332598
4351	Animalia	Chordata	Actinopterygii	Anguilliformes	Ophichthidae	Ophichthus	Ophichthus ophis		SPECIES	Ophichthus ophis (Linnaeus, 1758)	5213152
4352	Animalia	Chordata	Actinopterygii	Myctophiformes	Myctophidae	Myctophum	Myctophum affine		SPECIES	Myctophum affine (LÃ¼tken, 1892)	2405853
4353	Animalia	Chordata	Actinopterygii	Beloniformes	Belonidae	Platybelone	Platybelone argalus		SPECIES	Platybelone argalus (Lesueur, 1821)	4286140
4354	Animalia	Chordata	Actinopterygii	Perciformes	Pempheridae	Pempheris	Pempheris poeyi		SPECIES	Pempheris poeyi Bean, 1885	2374402
4355	Animalia	Chordata	Actinopterygii	Perciformes	Opistognathidae	Opistognathus	Opistognathus aurifrons		SPECIES	Opistognathus aurifrons (Jordan & Thompson, 1905)	2391774
4356	Animalia	Chordata	Actinopterygii	Scorpaeniformes	Scorpaenidae	Pontinus	Pontinus longispinis		SPECIES	Pontinus longispinis Goode & Bean, 1896	2334682
4357	Animalia	Chordata	Actinopterygii	Perciformes	Cirrhitidae	Amblycirrhitus	Amblycirrhitus pinos		SPECIES	Amblycirrhitus pinos (Mowbray, 1927)	2375113
4358	Animalia	Chordata	Elasmobranchii	Rajiformes	Myliobatidae	Mobula			GENUS	Mobula Rafinesque, 1810	2419178
4359	Animalia	Chordata	Actinopterygii	Perciformes	Lutjanidae	Lutjanus	Lutjanus jocu		SPECIES	Lutjanus jocu (Bloch & Schneider, 1801)	2384948
4360	Animalia	Chordata	Actinopterygii	Perciformes	Gobiidae	Priolepis	Priolepis dawsoni		SPECIES	Priolepis dawsoni Greenfield, 1989	2378453
4361	Animalia	Chordata	Actinopterygii	Tetraodontiformes	Balistidae	Xanthichthys	Xanthichthys ringens		SPECIES	Xanthichthys ringens (Linnaeus, 1758)	2407041
4362	Animalia	Chordata	Actinopterygii	Anguilliformes	Heterenchelyidae	Pythonichthys	Pythonichthys sanguineus		SPECIES	Pythonichthys sanguineus Poey, 1868	2404414
4363	Animalia	Chordata	Actinopterygii	Perciformes	Coryphaenidae	Coryphaena	Coryphaena hippurus		SPECIES	Coryphaena hippurus Linnaeus, 1758	2381939
4364	Animalia	Chordata	Actinopterygii	Anguilliformes	Muraenidae	Gymnothorax	Gymnothorax polygonius		SPECIES	Gymnothorax polygonius Poey, 1875	2403798
4365	Animalia	Chordata	Actinopterygii	Tetraodontiformes	Balistidae	Balistes	Balistes capriscus		SPECIES	Balistes capriscus Gmelin, 1789	2407107
4366	Animalia	Chordata	Elasmobranchii	Carcharhiniformes	Triakidae	Mustelus	Mustelus canis		SPECIES	Mustelus canis (Mitchill, 1815)	2418312
4367	Animalia	Chordata	Actinopterygii	Stomiiformes	Phosichthyidae	Vinciguerria	Vinciguerria nimbaria		SPECIES	Vinciguerria nimbaria (Jordan & Williams, 1895)	2346841
4368	Animalia	Chordata	Actinopterygii	Stomiiformes	Phosichthyidae	Pollichthys	Pollichthys mauli		SPECIES	Pollichthys mauli (Poll, 1953)	2346825
4369	Animalia	Chordata	Actinopterygii	Myctophiformes	Myctophidae	Notoscopelus	Notoscopelus caudispinosus		SPECIES	Notoscopelus caudispinosus (Johnson, 1863)	2406093
4370	Animalia	Chordata	Actinopterygii	Perciformes	Opistognathidae	Opistognathus	Opistognathus maxillosus		SPECIES	Opistognathus maxillosus Poey, 1860	2391852
4371	Animalia	Chordata	Actinopterygii	Perciformes	Sciaenidae	Pareques	Pareques acuminatus		SPECIES	Pareques acuminatus (Bloch & Schneider, 1801)	2399906
4372	Animalia	Chordata	Actinopterygii	Perciformes	Mullidae	Pseudupeneus	Pseudupeneus maculatus		SPECIES	Pseudupeneus maculatus (Bloch, 1793)	2396813
4373	Animalia	Chordata	Actinopterygii	Perciformes	Scaridae	Cryptotomus	Cryptotomus roseus		SPECIES	Cryptotomus roseus Cope, 1871	2393551
4374	Animalia	Chordata	Actinopterygii	Perciformes	Chaenopsidae	Emblemariopsis	Emblemariopsis signifer		SPECIES	Emblemariopsis signifer (Ginsburg, 1942)	5788047
4375	Animalia	Chordata	Actinopterygii	Perciformes	Sparidae	Pagrus	Pagrus pagrus		SPECIES	Pagrus pagrus (Linnaeus, 1758)	5210913
4376	Animalia	Chordata	Actinopterygii	Beloniformes	Exocoetidae	Exocoetus	Exocoetus volitans		SPECIES	Exocoetus volitans Linnaeus, 1758	2368648
4377	Animalia	Chordata	Actinopterygii	Aulopiformes	Synodontidae	Synodus	Synodus synodus		SPECIES	Synodus synodus (Linnaeus, 1758)	5212691
4378	Animalia	Chordata	Actinopterygii	Perciformes	Acropomatidae	Synagrops			GENUS	Synagrops GÃ¼nther, 1887	2381512
4379	Animalia	Chordata	Actinopterygii	Scorpaeniformes	Scorpaenidae	Pontinus	Pontinus rathbuni		SPECIES	Pontinus rathbuni Goode & Bean, 1896	2334693
4380	Animalia	Chordata	Actinopterygii	Perciformes	Gobiidae	Risor	Risor ruber		SPECIES	Risor ruber (RosÃ©n, 1911)	2377472
4381	Animalia	Chordata	Actinopterygii	Aulopiformes	Synodontidae	Trachinocephalus	Trachinocephalus myops		SPECIES	Trachinocephalus myops (Forster, 1801)	2401159
4382	Animalia	Chordata	Actinopterygii	Myctophiformes	Myctophidae	Diaphus	Diaphus perspicillatus		SPECIES	Diaphus perspicillatus (Ogilby, 1898)	2406273
4383	Animalia	Chordata	Actinopterygii	Perciformes	Chaetodontidae	Chaetodon	Chaetodon sedentarius		SPECIES	Chaetodon sedentarius Poey, 1860	2385404
4384	Animalia	Chordata	Actinopterygii	Perciformes	Chaetodontidae	Prognathodes	Prognathodes guyanensis		SPECIES	Prognathodes guyannensis (Durand, 1960)	2385615
4385	Animalia	Chordata	Actinopterygii	Perciformes	Scaridae	Sparisoma	Sparisoma radians		SPECIES	Sparisoma radians (Valenciennes, 1840)	2393901
4386	Animalia	Chordata	Actinopterygii	Perciformes	Istiophoridae	Makaira	Makaira nigricans		SPECIES	Makaira nigricans LacepÃ¨de, 1802	2397873
4387	Animalia	Chordata	Actinopterygii	Perciformes	Carangidae	Caranx	Caranx ruber		SPECIES	Caranx ruber (Bloch, 1793)	2390989
4388	Animalia	Chordata	Elasmobranchii	Orectolobiformes	Rhincodontidae	Rhincodon	Rhincodon typus		SPECIES	Rhincodon typus Smith, 1828	2417522
4389	Animalia	Chordata	Actinopterygii	Perciformes	Carangidae	Alectis	Alectis ciliaris		SPECIES	Alectis ciliaris (Bloch, 1787)	2390537
4390	Animalia	Chordata	Actinopterygii	Perciformes	Scombridae	Acanthocybium	Acanthocybium solandri		SPECIES	Acanthocybium solandri (Cuvier, 1832)	2374069
4391	Animalia	Chordata	Actinopterygii	Tetraodontiformes	Monacanthidae	Aluterus	Aluterus scriptus		SPECIES	Aluterus scriptus (Osbeck, 1765)	2406721
4392	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Serranus	Serranus baldwini		SPECIES	Serranus baldwini (Evermann & Marsh, 1899)	2388737
4393	Animalia	Chordata	Actinopterygii	Perciformes	Blenniidae	Hypleurochilus			GENUS	Hypleurochilus Gill, 1861	2395689
4394	Animalia	Chordata	Actinopterygii	Perciformes	Carangidae	Selar	Selar crumenophthalmus		SPECIES	Selar crumenophthalmus (Bloch, 1793)	2391007
4395	Animalia	Chordata	Actinopterygii	Tetraodontiformes	Ostraciidae	Acanthostracion	Acanthostracion polygonius		SPECIES	Acanthostracion polygonius Poey, 1876	2408186
4396	Animalia	Chordata	Elasmobranchii	Rajiformes	Dasyatidae	Pteroplatytrygon	Pteroplatytrygon violacea		SPECIES	Pteroplatytrygon violacea (Bonaparte, 1832)	2419426
4397	Animalia	Chordata	Actinopterygii	Perciformes	Gempylidae	Gempylus	Gempylus serpens		SPECIES	Gempylus serpens Cuvier, 1829	2397775
4398	Animalia	Chordata	Actinopterygii	Myctophiformes	Myctophidae	Diaphus	Diaphus fragilis		SPECIES	Diaphus fragilis TÃ¥ning, 1928	2406217
4399	Animalia	Chordata	Actinopterygii	Scorpaeniformes	Scorpaenidae	Scorpaena	Scorpaena isthmensis		SPECIES	Scorpaena isthmensis Meek & Hildebrand, 1928	2334641
4400	Animalia	Chordata	Actinopterygii	Perciformes	Carangidae	Decapterus	Decapterus macarellus		SPECIES	Decapterus macarellus (Cuvier, 1833)	2391064
4401	Animalia	Chordata	Actinopterygii	Scorpaeniformes	Scorpaenidae	Scorpaena	Scorpaena brasiliensis		SPECIES	Scorpaena brasiliensis Cuvier, 1829	2334557
4402	Animalia	Chordata	Elasmobranchii	Rajiformes	Dasyatidae	Dasyatis	Dasyatis guttata		SPECIES	Dasyatis guttata (Bloch & Schneider, 1801)	2419569
4403	Animalia	Chordata	Actinopterygii	Perciformes	Acanthuridae	Acanthurus	Acanthurus chirurgus		SPECIES	Acanthurus chirurgus (Bloch, 1787)	5209174
4404	Animalia	Chordata	Actinopterygii	Perciformes	Labridae	Bodianus	Bodianus rufus		SPECIES	Bodianus rufus (Linnaeus, 1758)	5209687
4405	Animalia	Chordata	Actinopterygii	Perciformes	Pomacentridae	Chromis	Chromis jubauna		SPECIES	Chromis jubauna Moura, 1995	5212165
4406	Animalia	Chordata	Actinopterygii	Perciformes	Sciaenidae	Equetus	Equetus lanceolatus		SPECIES	Equetus lanceolatus (Linnaeus, 1758)	2399845
4407	Animalia	Chordata	Actinopterygii	Stomiiformes	Sternoptychidae	Maurolicus	Maurolicus stehmanni		SPECIES	Maurolicus stehmanni Parin & Kobyliansky, 1993	2347492
4408	Animalia	Chordata	Actinopterygii	Anguilliformes	Muraenidae	Gymnothorax	Gymnothorax ocellatus		SPECIES	Gymnothorax ocellatus Agassiz, 1831	2403802
4409	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Mycteroperca	Mycteroperca bonaci		SPECIES	Mycteroperca bonaci (Poey, 1860)	2389013
4410	Animalia	Chordata	Actinopterygii	Beryciformes	Holocentridae	Plectrypops	Plectrypops retrospinis		SPECIES	Plectrypops retrospinis (Guichenot, 1853)	2356977
4411	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Hyporthodus	Hyporthodus nigritus		SPECIES	Hyporthodus nigritus (Holbrook, 1855)	5788220
4412	Animalia	Chordata	Actinopterygii	Myctophiformes	Myctophidae	Diaphus	Diaphus brachycephalus		SPECIES	Diaphus brachycephalus TÃ¥ning, 1928	2406285
4413	Animalia	Chordata	Actinopterygii	Beloniformes	Exocoetidae	Parexocoetus	Parexocoetus hillianus		SPECIES	Parexocoetus hillianus (Gosse, 1851)	2368613
4414	Animalia	Chordata	Actinopterygii	Perciformes	Scaridae	Scarus	Scarus zelindae		SPECIES	Scarus zelindae Moura, Figueiredo & Sazima, 2001	2393733
4415	Animalia	Chordata	Actinopterygii	Anguilliformes	Muraenidae	Monopenchelys	Monopenchelys acuta		SPECIES	Monopenchelys acuta (Parr, 1930)	2404180
4416	Animalia	Chordata	Actinopterygii	Perciformes	Apogonidae	Apogon	Apogon americanus		SPECIES	Apogon americanus Castelnau, 1855	5211671
4417	Animalia	Chordata	Actinopterygii	Scorpaeniformes	Dactylopteridae	Dactylopterus	Dactylopterus volitans		SPECIES	Dactylopterus volitans (Linnaeus, 1758)	2333605
4418	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Liopropoma	Liopropoma carmabi		SPECIES	Liopropoma carmabi (Randall, 1963)	2387887
4419	Animalia	Chordata	Actinopterygii	Perciformes	Scaridae	Sparisoma	Sparisoma frondosum		SPECIES	Sparisoma frondosum (Agassiz, 1831)	2393899
4420	Animalia	Chordata	Actinopterygii	Perciformes	Echeneidae	Remora	Remora remora		SPECIES	Remora remora (Linnaeus, 1758)	2375267
4421	Animalia	Chordata	Actinopterygii	Batrachoidiformes	Batrachoididae	Porichthys	Porichthys porosissimus		SPECIES	Porichthys porosissimus (Cuvier, 1829)	2350821
4422	Animalia	Chordata	Actinopterygii	Zeiformes	Zenionidae	Zenion	Zenion hololepis		SPECIES	Zenion hololepis (Goode & Bean, 1896)	2415317
4423	Animalia	Chordata	Actinopterygii	Myctophiformes	Myctophidae	Diaphus	Diaphus problematicus		SPECIES	Diaphus problematicus Parr, 1928	2406187
4424	Animalia	Chordata	Actinopterygii	Myctophiformes	Myctophidae	Hygophum	Hygophum reinhardtii		SPECIES	Hygophum reinhardtii (LÃ¼tken, 1892)	5213302
4425	Animalia	Chordata	Actinopterygii	Perciformes	Carangidae	Uraspis	Uraspis secunda		SPECIES	Uraspis secunda (Poey, 1860)	2391355
4426	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Anthias	Anthias menezesi		SPECIES	Anthias menezesi Anderson & Heemstra, 1980	2387913
4427	Animalia	Chordata	Actinopterygii	Tetraodontiformes	Monacanthidae	Aluterus	Aluterus schoepfii		SPECIES	Aluterus schoepfii (Walbaum, 1792)	2406748
4428	Animalia	Chordata	Actinopterygii	Perciformes	Carangidae	Caranx	Caranx lugubris		SPECIES	Caranx lugubris Poey, 1860	2390836
4429	Animalia	Chordata	Elasmobranchii	Carcharhiniformes	Carcharhinidae	Carcharhinus	Carcharhinus plumbeus		SPECIES	Carcharhinus plumbeus (Nardo, 1827)	2418009
4430	Animalia	Chordata	Actinopterygii	Perciformes	Labrisomidae	Malacoctenus	Malacoctenus brunoi		SPECIES	Malacoctenus brunoi GuimarÃ£es, Nunan & Gasparini, 2010	5961738
4431	Animalia	Chordata	Actinopterygii	Pleuronectiformes	Cynoglossidae	Symphurus	Symphurus plagusia		SPECIES	Symphurus plagusia (Bloch & Schneider, 1801)	2409465
4432	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Epinephelus	Epinephelus morio		SPECIES	Epinephelus morio (Valenciennes, 1828)	2388373
4433	Animalia	Chordata	Actinopterygii	Tetraodontiformes	Monacanthidae	Cantherhines	Cantherhines pullus		SPECIES	Cantherhines pullus (Ranzani, 1842)	2406961
4434	Animalia	Chordata	Actinopterygii	Perciformes	Serranidae	Mycteroperca	Mycteroperca tigris		SPECIES	Mycteroperca tigris (Valenciennes, 1833)	2389021
4435	Animalia	Chordata	Actinopterygii	Myctophiformes	Myctophidae	Diaphus	Diaphus dumerilii		SPECIES	Diaphus dumerilii (Bleeker, 1856)	2406248
\.


--
-- TOC entry 2177 (class 0 OID 0)
-- Dependencies: 193
-- Name: taxon_id_taxon_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('taxon_id_taxon_seq', 4435, true);


--
-- TOC entry 2005 (class 2606 OID 116337)
-- Name: AK_TAXON_KEY; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY taxon
    ADD CONSTRAINT "AK_TAXON_KEY" UNIQUE (taxonkey);


--
-- TOC entry 1988 (class 2606 OID 82610)
-- Name: PK_ABIOTIC_ANALYSIS; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY abiotic_analysis
    ADD CONSTRAINT "PK_ABIOTIC_ANALYSIS" PRIMARY KEY (id);


--
-- TOC entry 2003 (class 2606 OID 82612)
-- Name: PK_BENTHIC_ANALYSIS; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY benthic_analysis
    ADD CONSTRAINT "PK_BENTHIC_ANALYSIS" PRIMARY KEY (id);


--
-- TOC entry 1990 (class 2606 OID 82608)
-- Name: PK_BIOTIC_ANALYSIS; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY biotic_analysis
    ADD CONSTRAINT "PK_BIOTIC_ANALYSIS" PRIMARY KEY (id);


--
-- TOC entry 2001 (class 2606 OID 82601)
-- Name: PK_FISH_A_A; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY fish_assembly_analysis
    ADD CONSTRAINT "PK_FISH_A_A" PRIMARY KEY (id);


--
-- TOC entry 2007 (class 2606 OID 82579)
-- Name: PK_TAXON; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY taxon
    ADD CONSTRAINT "PK_TAXON" PRIMARY KEY (id_taxon);


--
-- TOC entry 1974 (class 2606 OID 74391)
-- Name: ak_ator_email; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY ator
    ADD CONSTRAINT ak_ator_email UNIQUE (login);


--
-- TOC entry 1986 (class 2606 OID 74617)
-- Name: area_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY area
    ADD CONSTRAINT area_pkey PRIMARY KEY (id);


--
-- TOC entry 1998 (class 2606 OID 74696)
-- Name: metagenome_functional_analysis_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenome_functional_analysis
    ADD CONSTRAINT metagenome_functional_analysis_pkey PRIMARY KEY (id, reference_db_id, function);


--
-- TOC entry 1994 (class 2606 OID 74672)
-- Name: metagenome_taxonomic_analysis_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenome_taxonomic_analysis
    ADD CONSTRAINT metagenome_taxonomic_analysis_pkey PRIMARY KEY (id, taxon);


--
-- TOC entry 1992 (class 2606 OID 74656)
-- Name: metagenomic_analysis_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenomic_analysis
    ADD CONSTRAINT metagenomic_analysis_pkey PRIMARY KEY (id);


--
-- TOC entry 1976 (class 2606 OID 74389)
-- Name: pk_ator; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY ator
    ADD CONSTRAINT pk_ator PRIMARY KEY (id);


--
-- TOC entry 1996 (class 2606 OID 74685)
-- Name: reference_db_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY reference_db
    ADD CONSTRAINT reference_db_pkey PRIMARY KEY (id);


--
-- TOC entry 1982 (class 2606 OID 74601)
-- Name: sample_name_key; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY sample
    ADD CONSTRAINT sample_name_key UNIQUE (name);


--
-- TOC entry 1984 (class 2606 OID 116340)
-- Name: sample_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY sample
    ADD CONSTRAINT sample_pkey PRIMARY KEY (id);


--
-- TOC entry 1980 (class 2606 OID 74588)
-- Name: sample_type_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY sample_type
    ADD CONSTRAINT sample_type_pkey PRIMARY KEY (type);


--
-- TOC entry 1978 (class 2606 OID 74396)
-- Name: unique_nom_configuracao; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY configuracao
    ADD CONSTRAINT unique_nom_configuracao UNIQUE (nom_configuracao);


--
-- TOC entry 1999 (class 1259 OID 82628)
-- Name: FKI_FAA_SAMPLE; Type: INDEX; Schema: biotecmar; Owner: biotecmar
--

CREATE INDEX "FKI_FAA_SAMPLE" ON fish_assembly_analysis USING btree (id_sample);


--
-- TOC entry 2016 (class 2606 OID 116356)
-- Name: FK_FAA_SAMPLE; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY fish_assembly_analysis
    ADD CONSTRAINT "FK_FAA_SAMPLE" FOREIGN KEY (id_sample) REFERENCES sample(id);


--
-- TOC entry 2015 (class 2606 OID 107329)
-- Name: FK_FISH_A_A_TAXON; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY fish_assembly_analysis
    ADD CONSTRAINT "FK_FISH_A_A_TAXON" FOREIGN KEY (id_taxon) REFERENCES taxon(id_taxon);


--
-- TOC entry 2013 (class 2606 OID 107334)
-- Name: FK_MFA_MA; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenome_functional_analysis
    ADD CONSTRAINT "FK_MFA_MA" FOREIGN KEY (id_meta_analysis) REFERENCES metagenomic_analysis(id);


--
-- TOC entry 2012 (class 2606 OID 107344)
-- Name: FK_MTA_MA; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenome_taxonomic_analysis
    ADD CONSTRAINT "FK_MTA_MA" FOREIGN KEY (id_meta_analysis) REFERENCES metagenomic_analysis(id);


--
-- TOC entry 2009 (class 2606 OID 116341)
-- Name: abiotic_analysis_id_fkey; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY abiotic_analysis
    ADD CONSTRAINT abiotic_analysis_id_fkey FOREIGN KEY (id) REFERENCES sample(id);


--
-- TOC entry 2017 (class 2606 OID 116346)
-- Name: benthic_analysis_id_fkey; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY benthic_analysis
    ADD CONSTRAINT benthic_analysis_id_fkey FOREIGN KEY (id) REFERENCES sample(id);


--
-- TOC entry 2010 (class 2606 OID 116351)
-- Name: biotic_analysis_id_fkey; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY biotic_analysis
    ADD CONSTRAINT biotic_analysis_id_fkey FOREIGN KEY (id) REFERENCES sample(id);


--
-- TOC entry 2014 (class 2606 OID 107339)
-- Name: metagenome_functional_analysis_reference_db_id_fkey; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenome_functional_analysis
    ADD CONSTRAINT metagenome_functional_analysis_reference_db_id_fkey FOREIGN KEY (reference_db_id) REFERENCES reference_db(id);


--
-- TOC entry 2011 (class 2606 OID 116361)
-- Name: metagenomic_analysis_id_fkey; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenomic_analysis
    ADD CONSTRAINT metagenomic_analysis_id_fkey FOREIGN KEY (id) REFERENCES sample(id);


--
-- TOC entry 2008 (class 2606 OID 107354)
-- Name: sample_type_fkey; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY sample
    ADD CONSTRAINT sample_type_fkey FOREIGN KEY (type) REFERENCES sample_type(type);


-- Completed on 2016-03-31 12:15:13

--
-- PostgreSQL database dump complete
--

