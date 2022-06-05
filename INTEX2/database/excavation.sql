--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6
-- Dumped by pg_dump version 12.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bio_sample; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bio_sample (
    sample_id uuid NOT NULL,
    burial_id uuid,
    cluster_num integer,
    previously_sampled boolean DEFAULT false NOT NULL,
    notes text DEFAULT 'NULL'::text,
    research_initials text DEFAULT 'NULL'::text,
    burial_number integer,
    sample_number integer,
    burial_subplot text,
    rack_num text,
    bag_num text,
    initials text,
    year_found integer
);


ALTER TABLE public.bio_sample OWNER TO postgres;

--
-- Name: burial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.burial (
    burial_id uuid NOT NULL,
    head_direction text DEFAULT '''U'''::text,
    burial_depth double precision,
    south_to_head double precision,
    south_to_feet double precision,
    west_to_head double precision,
    west_to_feet double precision,
    estimate_age text,
    estimate_living_stature double precision,
    osteophytosis text DEFAULT 'NULL'::text,
    pathology_anomalies text DEFAULT 'NULL'::text,
    artifacts_description text DEFAULT 'NULL'::text,
    hair_color text DEFAULT 'NULL'::text,
    preservation_index text DEFAULT 'NULL'::text,
    artifact_found boolean DEFAULT false,
    description_of_taken text DEFAULT 'NULL'::text,
    hair_taken boolean DEFAULT false,
    soft_tissue_taken boolean DEFAULT false,
    bone_taken boolean DEFAULT false,
    tooth_taken boolean DEFAULT false,
    notes text DEFAULT 'NULL'::text,
    location_id uuid,
    skull_id uuid,
    pelvis_id uuid,
    date_found date,
    femur_id uuid,
    humerus_id uuid,
    tibia_id uuid,
    body_analysis_year integer,
    needs_confirmation boolean,
    length_of_remains double precision,
    burial_number integer,
    sample_number integer,
    "gender_GE" text,
    gender_body_col text,
    textile_taken boolean,
    postcrania_at_magazine boolean,
    postcrania_trauma boolean,
    has_byu_sample boolean,
    preservation_comments text,
    burial_wrapping text,
    burial_adult_child text,
    burial_gender_method text,
    age_code text,
    "GE_function_total" double precision,
    burial_age text,
    burial_sample_taken boolean,
    goods text,
    face_bundle boolean,
    field_book text,
    field_book_page_number text,
    osteology_unknown_comment text,
    rack_shelf text,
    hill_area text,
    tomb text,
    osteology_notes text,
    excavation_recorder text,
    shaft text,
    cluster text,
    shared_shaft text,
    cluster_number integer,
    calculated_length_of_remains double precision,
    burial_materials text,
    photo text,
    hair_present text
);


ALTER TABLE public.burial OWNER TO postgres;

--
-- Name: carbon_dating_analysis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carbon_dating_analysis (
    carbon14_id uuid NOT NULL,
    sample_id uuid,
    rack_num integer,
    tube_num integer,
    sample_description text DEFAULT 'NULL'::text,
    size double precision,
    foci integer,
    location_description text DEFAULT 'NULL'::text,
    question text DEFAULT 'NULL'::text,
    age_bp integer,
    c14_calendar_date text DEFAULT 'NULL'::text,
    calibrated_95_calendar_date_max text DEFAULT 'NULL'::text,
    calibrated_95_calendar_date_min text DEFAULT 'NULL'::text,
    calibrated_95_calendar_date_span text DEFAULT 'NULL'::text,
    calibrated_95_date_avg text DEFAULT 'NULL'::text,
    notes text DEFAULT 'NULL'::text,
    area integer,
    category text
);


ALTER TABLE public.carbon_dating_analysis OWNER TO postgres;

--
-- Name: femur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.femur (
    femur_id uuid NOT NULL,
    femur_head double precision,
    epiphyseal_union text DEFAULT 'NULL'::text,
    femur_length double precision,
    burial_id uuid
);


ALTER TABLE public.femur OWNER TO postgres;

--
-- Name: humerus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.humerus (
    humerus_id uuid NOT NULL,
    humerus_head double precision,
    epiphyseal_union text,
    humerus_length double precision,
    burial_id uuid
);


ALTER TABLE public.humerus OWNER TO postgres;

--
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location (
    location_id uuid NOT NULL,
    "location_NS" character(1) DEFAULT 'U'::bpchar,
    "location_EW" character(1) DEFAULT 'U'::bpchar,
    "low_pair_NS" integer DEFAULT 0,
    "high_pair_NS" integer DEFAULT 0,
    "low_pair_EW" integer DEFAULT 0,
    "high_pair_EW" integer DEFAULT 0,
    burial_subplot text DEFAULT 'U'::text
);


ALTER TABLE public.location OWNER TO postgres;

--
-- Name: pelvis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pelvis (
    pelvis_id uuid NOT NULL,
    ventral_arc integer,
    subpubic_angle integer,
    sciatic_notch integer,
    "medial_IP_ramus" integer,
    pubic_symphisis text DEFAULT 'NULL'::text,
    pubic_bone integer,
    preaur_sulcus integer,
    dorsal_pitting integer,
    burial_id uuid
);


ALTER TABLE public.pelvis OWNER TO postgres;

--
-- Name: skull; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skull (
    skull_id uuid NOT NULL,
    basilar_suture text DEFAULT 'NULL'::text,
    robust integer,
    supraorbital_ridges integer,
    orbital_edge integer,
    parietal_bossing integer,
    gonion integer,
    zygomatic_crest integer,
    nuchal_crest integer,
    cranial_suture text,
    maximum_cranial_length double precision,
    maximum_cranial_breadth double precision,
    basion_bregma_height double precision,
    bizygomatic_diameter double precision,
    nasion_prosthion double precision,
    maximum_nasal_breadth double precision,
    interorbital_breadth double precision,
    tooth_attrition text,
    tooth_eruption text DEFAULT 'NULL'::text,
    burial_id uuid,
    skull_sex text,
    skull_age text,
    basion_nasion double precision,
    basion_prosthion_length double precision,
    skull_year integer,
    skull_month integer,
    skull_date integer,
    skull_trauma boolean,
    skull_at_magazine boolean,
    cribra_orbitala boolean,
    porotic_hyperostosis boolean,
    button_osteoma boolean,
    has_tmj boolean,
    linear_hypoplasia_enamel boolean,
    metopic_suture text,
    porotic_hyperostosis_locations text
);


ALTER TABLE public.skull OWNER TO postgres;

--
-- Name: tibia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tibia (
    tibia_id uuid NOT NULL,
    tibia_length double precision,
    burial_id uuid
);


ALTER TABLE public.tibia OWNER TO postgres;

--
-- Data for Name: bio_sample; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bio_sample (sample_id, burial_id, cluster_num, previously_sampled, notes, research_initials, burial_number, sample_number, burial_subplot, rack_num, bag_num, initials, year_found) FROM stdin;
56515f0c-6e6e-4f7a-9510-77c263cfbb9d	\N	\N	f	8 teeth; adult	NULL	2	1	3	6		MBB	\N
f255123c-879d-4f23-af27-e03185ee7f0a	\N	\N	f	TEETH- CHILD	NULL	2	2	3	15		GM	\N
679d39ff-46f1-4130-81df-7015d752cf93	\N	\N	f	RIBS	NULL	3	1	3	15		GM	\N
ec02a691-fa1c-4c06-aa51-278eb4922101	\N	\N	f	Infant ribs	NULL	4	1	3	25		AWA	\N
62b92ca3-951b-4494-b315-e1ea4dde8769	\N	\N	t	10 teeth; adult	NULL	6	1	3	8		MBB	\N
106f990d-0eba-43c4-9286-897acb66933e	\N	\N	f	"Herbivore tooth. Perhaps Elephant. Evans/Kuchor 1993" - written on bag.	NULL	\N	1	Area 1		5	MBB	1993
2b0a6353-a732-483a-b492-b292bf1ba385	\N	9	f	Clavicle; UKN	NULL	\N	2	Area 1	33		AWA	1998
965395a4-1cf2-4ac2-ba31-2b76b349e7a1	\N	\N	f	RIBS, TEETH, AND SKIN OR TISSUE	NULL	\N	3	Area 1		6	GM	1998
86491686-4272-4ee9-924f-7ac67bd338a0	\N	10	f	2 bone fragments; UKN ("Cluster 10")	NULL	\N	4	Area 1	35		MBB	1998
7ca9d9dd-c02c-446b-af54-c48265a2534a	\N	\N	f	9 teeth; adult	NULL	1	1		5		MBB	\N
7269f3d2-10b7-45cc-b0d3-78b73c5a8eb1	\N	\N	f	14 teeth; adult	NULL	2	1		5		MBB	\N
63f7aed1-eaa5-4487-9796-cb47353a8261	\N	\N	f	~13 broken teeth and fragments; child	NULL	3	1		4		MBB	\N
49cd7a42-4ee8-4315-aa3e-053021cc1b41	\N	\N	f	2 rib fragments; adult	NULL	2	1	4	8		MBB	\N
ee080090-3dff-4d1f-b445-2e4fbb77ca4b	\N	\N	f	5 teeth; adult	NULL	3	1	4	13		MBB	\N
ab024192-03de-49ae-aab1-8984cb2cf00c	\N	\N	t	Tooth; adult	NULL	5	1	4	18		AWA	\N
f7294e75-bf58-41d6-b22a-bfc2bcfb68ce	\N	\N	f	Powdered tissue sample	NULL	2	1	18	17		MBB	\N
fbf5ddfa-1038-4058-80b4-c45d42394676	\N	\N	t	4 fragmented teeth; adult	NULL	10	1	11	10		MBB	1998
bf8cdeb2-f984-4768-8173-4d4a8a8773f2	\N	\N	f	Tissue; UKN	NULL	6	1	11	10		MBB	1998
ea7fd76a-4312-415b-a9a5-136170e7cbd5	\N	\N	t	1 tooth; adult	NULL	2	1	NNW	6		MBB	\N
bdbfc815-a181-4760-a099-1077cd503fa5	\N	\N	f	5 teeth; adult	NULL	3	1	NNW	8		MBB	\N
956e232a-4371-48e7-a418-ebecdb3aaea1	\N	\N	f	4 rib fragments; adult	NULL	3	2	NNW	8		MBB	\N
3d53b873-8fc7-4c1a-905f-f04720063a09	\N	\N	f	3 teeth; adult	NULL	4	1	NNW	9		MBB	\N
8ed8b6fd-2fa2-4fe8-902b-f2c3a95fc85d	\N	\N	f	5 TEETH; ADULT W/ TISSUE?, TOOTH DECAY PRESENT	NULL	5	1	NNW	12		CIE	\N
9c8c5583-d87f-448a-be5f-61bff3a785d4	\N	\N	f	BRAIN	NULL	5	2	NNW	11		GM	\N
435f32e4-1cd9-4541-83ed-8bb2ff600319	\N	14	f	Skin and fungi	NULL	6	1	NNW	31		AWA	1998
5d98806c-5a40-4d43-b9d7-d6660e4bca08	\N	10	f	Tissue; UKN ("Cluster 10")	NULL	8	1	NNW	35		MBB	1998
7feb7775-f550-4b35-bae0-5808d4954f62	\N	9	f	Unknown tissue	NULL	8	2	NNW	33		AWA	1998
d14a505a-b73e-4a49-9583-000afb41ad35	\N	9	f	Long bone	NULL	8	3	NNW	33		AWA	1998
be4387ee-1890-4bb8-afce-eab051875082	\N	\N	f	9 teeth; adult	NULL	9	1	NNW	5		MBB	\N
85d9ed7d-65c5-43be-a259-65e5b57655dc	\N	\N	f	3 teeth; child	NULL	9	2	NNW	6		MBB	\N
7902734f-3cb4-4d68-80ce-bb0c2b879815	\N	\N	f	~23 broken teeth and fragments; child	NULL	9	3	NNW	6		MBB	\N
08e36c05-ab6b-45e7-b690-d940e1c7d2d4	cfa32125-04f8-489b-97e0-3a27c0523995	\N	f	"Rib 1 2 of 2" - Written on the tube; 2 rib fragments; UKN	NULL	2	1	NW	16		MBB	\N
b9379c9e-e5cb-4523-a4d2-04ae1bb4345e	\N	\N	f	~6 TEETH AND FRAGMENTS	NULL	4	1	NW	3		GM	\N
74c83005-567a-41fe-aea3-a521be716df0	\N	\N	f	4 teeth; tissue; child	NULL	4	2	NW	4		MBB	\N
62f89b27-6d76-45b0-8563-d1f1e54f76c6	75468752-63ef-4168-851c-16d412e914f2	\N	f	7 teeth; adult (some tissue)	NULL	5	1	NW	6		MBB	\N
0afa1fc3-30f9-44bc-9651-b21144759424	13a398c6-8a9b-49ce-b7e9-ba51d36a589d	\N	f	4 rib fragments; child	NULL	7	1	NW	8		MBB	\N
ab782197-0d60-4823-aa84-3b0156a5b473	ceff6d7b-df35-47d1-81ce-1805dc3896f5	\N	f	Rib pieces; child	NULL	8	1	NW	25		AWA	\N
8d0b1b14-6092-40e7-b747-d4542cf85c3f	e3df4c56-4386-4588-ac61-17ef6fd64a2c	\N	t	Tooth	NULL	9	1	NW	31		AWA	\N
127b66a1-40c8-45b3-9b3e-15fe2b5843ce	f51b194f-f58b-4406-ae2c-2fe6b9683801	\N	f	~12 broken teeth and fragments; adult	NULL	10	1	NW	2		MBB	\N
c3ead46c-d7b7-49ce-87d4-ac9ee924962b	6c92c53f-c9bb-4c46-9ef9-aba16c48800d	\N	f	UNKNOWN TISSUE	NULL	11	1	NW			CIE	\N
c4dbae95-d0d7-4016-8eb1-a43470b8d0cd	5f94ca26-0902-45ca-a992-974efecf1ff8	\N	f	Empty tube with dust residue	NULL	12	1	NW	21		MBB	\N
0a0263e9-57e9-4f53-a169-5481c8550e8a	5f94ca26-0902-45ca-a992-974efecf1ff8	\N	t	2 teeth; adult	NULL	12	2	NW	5		MBB	\N
985f2b87-101a-4b79-9e89-0cb3827bf5c6	5f94ca26-0902-45ca-a992-974efecf1ff8	\N	f	Powdered bone sample	NULL	12	3	NW	17		MBB	\N
c975e2dd-e941-404e-ab81-f6961b80aada	ecdb27e2-47f1-4558-b723-d2788301855a	\N	f	6 TEETH; ADULT "AREA 11"	NULL	13	1	NW			CIE	1989
4e491504-4872-4990-abc8-1471b380a012	2bb91c5e-c8b4-4d3a-8b8f-508d4d394adb	\N	f	Skin; UKN	NULL	14	1	NW	10		MBB	1998
bb11749b-39d2-4090-b771-fafddc85ec9d	2bb91c5e-c8b4-4d3a-8b8f-508d4d394adb	\N	f	Bone fragments; UKN	NULL	14	2	NW	10		MBB	1998
15f605ca-7e45-4184-98da-90db2b170cc1	\N	\N	f	FOOT SKIN	NULL	15	1	NW	14		GM	\N
e1496c99-0980-4a50-9d9e-36db878362a1	52a079b3-bdeb-4849-93b5-2b068e7aca26	\N	f	SKIN FROM FOOT	NULL	16	1	NW	14		GM	\N
62727d25-9ac3-4fb6-acbe-9abb499a3bf2	\N	\N	f	TISSUE FROM CRANIAL CAVITY	NULL	16	1	NW	14		GM	\N
4264cd19-17de-4eb9-98a2-64652f43ef8e	\N	\N	f	2 rib fragments; child (some tissue)	NULL	16	2	NW	8		MBB	\N
3deefada-5aa5-46fa-af27-e07e71d6c117	\N	\N	f	7 rib fragments; child	NULL	16	3	NW	8		MBB	\N
c6e8c17f-4fb5-47d4-984f-370cf26248cd	dd58a634-8c11-4110-a8bd-161b0ab1920f	\N	f	HAIR	NULL	17	1	NW		4	CIE	\N
5747b43c-b33e-4217-bce9-1f88a2a4a32f	c63e1be9-5cde-4c7c-901f-1c77c3fab4cd	\N	t	~14 broken teeth and fragments; adult	NULL	18	1	NW	2		MBB	\N
43c94f69-09b2-48f5-a8d0-b4340f1499fb	9d1030e4-7b56-48de-9e36-cd4e85a0af94	\N	f	15 TEETH; ADULT	NULL	19	1	NW	12		CIE	\N
6a69be66-2fcc-4df6-8abe-ea6ff0c83682	ed3ed119-9553-45ff-b83c-6eacfdaf088f	\N	f	~9 teeth; adult	NULL	20	1	NW	1		AWA	\N
558a12db-5fb3-48ee-99c4-f0bc60544eef	ed3ed119-9553-45ff-b83c-6eacfdaf088f	\N	f	~10 broken teeth; adult	NULL	20	2	NW	1		AWA	\N
ad1c8585-35d7-4dea-b3ab-897409327707	ed3ed119-9553-45ff-b83c-6eacfdaf088f	\N	f	RESIN-RC	NULL	20	3	NW	11		GM	\N
64f237f8-156c-4556-831f-8a471c102a86	d0a756d6-f2ca-4477-aa09-9ad87f42d8b2	\N	f	Powdered tissue sample	NULL	22	1	NW	17		MBB	\N
b07de95a-864f-4a04-a6aa-3b16094f98bc	4e7f3827-b4af-451e-ab47-34b72db1ef14	\N	f	Empty tube with dust residue	NULL	23	1	NW	21		MBB	\N
67bed980-b6fb-4cd1-8489-6401a5715011	4e7f3827-b4af-451e-ab47-34b72db1ef14	14	f	Bone	NULL	23	2	NW	31		AWA	1998
eca7e52a-ce7e-4784-abeb-6b52bbfd751f	51b36f43-ead9-4d1c-bbf3-9dc087b02661	14	f	Teeth; adult	NULL	24	1	NW	31		AWA	1998
dfbc8788-44d1-4e04-bd7a-4ab27cecbfa7	51b36f43-ead9-4d1c-bbf3-9dc087b02661	\N	f	TEETH AND LONG BONE	NULL	24	2	NW		6	GM	1998
3913dbf9-4405-41ae-8dfe-13e602414704	4516b9ea-0b19-4d1d-8991-3bd726e66cc3	\N	f	Bone fragments (some rib); child	NULL	25	1	NW	10		MBB	1998
dbb6261a-423f-4bc2-929f-4f2f096b13e1	4516b9ea-0b19-4d1d-8991-3bd726e66cc3	\N	f	TEETH, TISSUE, AND VERTEBRAE	NULL	25	2	NW		6	GM	1998
3cc872ea-2137-4c0c-97c5-0264114d8ebd	\N	\N	f	SKIN AND 6 TEETH	NULL	26	1	NW	14		GM	\N
b025f8ea-a206-4d19-ba89-ced807a402cf	a2fa175e-1c8d-4def-8353-8ab73549136d	\N	f	Rib; child	NULL	27	1	NW	25		AWA	\N
d8442a8d-5d9f-42ef-b772-957b81980cf7	\N	\N	f	Skin; infant	NULL	28	1	NW	24		MBB	\N
676fe577-42ba-43b0-b878-6a97899749c4	39681bc2-f253-45f4-8677-80f78d8ba20b	\N	f	FOOT TISSUE	NULL	1	1	NW	22		GM	\N
8f8064a7-94e7-41dd-8f69-f56caa07f5f1	f51b194f-f58b-4406-ae2c-2fe6b9683801	\N	f	Rib pieces; adult	NULL	10	1	NW	25		AWA	\N
e63b73bc-2df4-4681-98d4-57f833d472eb	\N	\N	f	2 RIB	NULL	16	1	NW	3		GM	\N
e338b4e3-25bf-480c-997e-845f8209f18f	dd58a634-8c11-4110-a8bd-161b0ab1920f	\N	t	12 TEETH AND FRAGMENTS	NULL	17	1	NW	3		GM	\N
1b0339d0-5f9a-466c-81aa-9523add6e085	c63e1be9-5cde-4c7c-901f-1c77c3fab4cd	\N	f	16 teeth; (2 child?) 14 adult	NULL	18	1	NW	4		MBB	\N
2248a039-c394-4fdf-8251-621cec2c3418	cfa32125-04f8-489b-97e0-3a27c0523995	\N	t	9 teeth; adult	NULL	2	1	NW	8		MBB	\N
7a22e72d-45f9-4ffc-b9b4-31a7ddf7d041	ed3ed119-9553-45ff-b83c-6eacfdaf088f	\N	f	4 rib fragments; sub-adult	NULL	20	1	NW	8		MBB	\N
247d0f54-001c-4ed8-bc58-2b8bfa696196	7009b337-0ae2-4c16-a2c6-edbdc9f36657	\N	f	10 teeth; adult	NULL	21	1	NW	2		MBB	\N
a4869483-5cef-4800-b6d5-89afd198f36f	7009b337-0ae2-4c16-a2c6-edbdc9f36657	\N	f	MANDIBLE AND TEETH FRAGMENTS; CHILD	NULL	21	2	NW		2	CIE	\N
85af1fe1-9432-4195-a94c-e69b8f329915	d0a756d6-f2ca-4477-aa09-9ad87f42d8b2	\N	f	SKIN AND JEWELLERY	NULL	22	1	NW		6	GM	1998
360bc5a2-14ef-40ed-9b7b-a30bd83146f4	4e7f3827-b4af-451e-ab47-34b72db1ef14	\N	f	"Fibula"; child	NULL	23	1	NW	31		AWA	1998
06431573-c26e-46b4-95f0-388de16ca771	51b36f43-ead9-4d1c-bbf3-9dc087b02661	\N	f	Skin; femur	NULL	24	1	NW	31		AWA	1998
6bc2c084-b080-4590-b2a3-b222c180aa0a	4516b9ea-0b19-4d1d-8991-3bd726e66cc3	\N	f	RIBS, SKIN, AND TEETH	NULL	25	1	NW		6	GM	1998
00f618fe-aed2-4e2b-8d6b-7edb46243665	e03f3cc1-65f2-4071-861f-ca57b8ad127c	\N	f	Lung	NULL	26	1	NW	34		AWA	1998
cdb5178e-c582-47a3-9d42-7d37a04a648d	a2fa175e-1c8d-4def-8353-8ab73549136d	\N	f	4 teeth; adult	NULL	27	1	NW	34		AWA	1998
d0bb14f3-5990-4295-9610-08bdeb1ffb8d	\N	\N	f	4 UNK LONG BONE FRAG (TOO DIRTY TO SEE), 1 TOOTH; POSS CHILD	NULL	48	1	NW	29		CIE	2000
6c8f8fb0-65ac-47a3-817b-2b7f9a4c4e01	\N	\N	f	MANDIBLE AND 4 TEETH; ADULT	NULL	6	1	NW		1	CIE	33652
7a63b9ef-d9a3-4e4b-bbae-64462bd5fee8	\N	\N	f	RIB BONES, INFANT	NULL	6	2	NW		4	CIE	\N
e6e4d40e-c542-4286-b567-70a67b8e3e90	\N	\N	f	10 rib fragments; infant	NULL	6	3	NW	16		MBB	\N
d127cb62-52de-4a10-961e-454bd47b1547	e3df4c56-4386-4588-ac61-17ef6fd64a2c	\N	f	9 TEETH	NULL	9	1	NW	3		GM	\N
64dd40e4-b1a1-4fc2-8e3d-c8ba306e364f	e3df4c56-4386-4588-ac61-17ef6fd64a2c	\N	f	4 teeth; adult	NULL	9	2	NW	4		MBB	\N
f4911e4d-fa37-42b9-9266-05620c40bb50	\N	\N	f	11 teeth; child	NULL	8	1	NWW	6		MBB	\N
e3de1abd-957d-4f5e-a60b-f6b6013069a1	c66c5404-5b60-413a-8317-47a8189d9318	12	f	Skin from arm; UKN ("Cluster 12")	NULL	1	1	SE	14		MBB	1998
45f02f7f-a6c2-4979-91c0-7dcf0f2ee120	0628155d-e071-49f0-802b-690eafb70ce6	12	f	Internal tissue; UKN ("Cluster 12")	NULL	17	1	SE	14		MBB	1998
eee49bb9-dbfb-4179-aa51-fed87d33213b	6855e7a9-7cac-44a2-8e86-7cbc4806ecb7	\N	f	15 teeth; adult	NULL	23	1	SE	5		MBB	\N
b02d3a75-ceb3-4b31-bf4f-f98671e9073d	\N	\N	f	Cranium	NULL	20	1	SE	25		AWA	\N
6c6e45fd-a323-45cd-b456-2f58ea182324	fd0df308-3bb4-4b07-a0b4-6a8ddf4e682e	\N	f	Rib; child	NULL	18	1	SW	25		AWA	\N
3137f4a6-0e83-413d-bc20-ab5d981d8d47	f8ae9c87-8f94-48b2-91a0-1ded77135c2a	\N	f	HAIR AND POSSIBLE BONE FRAGMENTS	NULL	9	1	SW		1	CIE	\N
477116f5-1ea7-407a-8bdd-4c945b1a632c	\N	\N	f	Tissue; UKN	NULL	3	1	SW	25		MBB	\N
e958f2ef-73d7-45f0-9f8f-3ab20c03e15b	\N	\N	f	8-9 BROKEN TEETH; ADULT, SEVERELY DECAYED	NULL	20	1	SW	12		CIE	\N
566da1a2-e50a-4a2c-a490-0a2892785596	\N	\N	f	Empty tube with dust residue	NULL	20	2	SW	17		MBB	\N
398b11c5-2d95-46ee-88a9-0b2ea657c615	\N	\N	f	Empty tube with dust residue	NULL	20	3	SW	17		MBB	\N
1a78cf2b-bed6-4d1d-b695-9c1a41b298c4	5d28653c-5571-42cc-b05b-e24bf928bb28	5	t	2 teeth; adult ("Cluster 5")	NULL	6	1	NE	18		MBB	1998
6aaef078-041a-4339-a623-854094b93bbb	489e4813-8475-4ee9-9d69-740c16fd6e30	\N	f	Skin	NULL	8	1	NE	34		AWA	1998
8f66e4f6-044a-4ef7-a08a-bee2560b173f	e54e285e-58bc-4833-ba93-74eccd2d30d4	\N	f	Scat.	NULL	10	1	NE	34		AWA	1998
618d8141-eb83-4b93-a826-d2d8ee8d9861	edde2450-5842-4d7a-a558-6848ee4e6b80	\N	f	"DIS-ARTICULATED" HAND; CHILD, UNK BURIAL	NULL	12	1	NE		2	CIE	33652
cdd6304e-155a-4cd9-9aae-9f44bdab89bb	dd961579-58a3-4a91-a852-b897bcbbb4cd	\N	f	Skin from rib area; UKN	NULL	13	1	NE	24		MBB	\N
624591f8-369b-4850-91a0-a690dfaca7c6	dd961579-58a3-4a91-a852-b897bcbbb4cd	\N	f	Rib pieces; child	NULL	13	2	NE	25		AWA	\N
5456172d-5b50-4a17-a960-8b36808c44b7	436c2e7f-6047-4ce7-8c47-0693ebe0b7af	\N	f	3 rib fragments; adult	NULL	15	1	NE	8		MBB	\N
eb25c538-f8d4-4872-ac46-5cf4b5f5057f	436c2e7f-6047-4ce7-8c47-0693ebe0b7af	\N	f	5 TEETH; ADULT	NULL	15	2	NE	12		CIE	\N
8b9b5859-c555-4ab7-8c60-b25f926d8717	6f12c218-7455-4fcb-814d-2f77b0126b9c	\N	f	Cranial Tissue; UKN	NULL	17	1	NE	25		MBB	\N
12ea4947-b953-44bc-95a5-695220fd56d1	fc1817e3-309c-4fb2-8839-8858e7fdf9f2	\N	f	Tissue from palate; UKN	NULL	20	1	NE	25		MBB	\N
9478dfac-0390-45a5-82e1-ef6984ccc229	fbd79a6d-fc5f-4ba6-ad94-de32e4e54f16	\N	f	Tissue from skull; UKN	NULL	22	1	NE	25		MBB	\N
a11c2586-9be5-4bdb-83c2-d1b1b5138440	a93502e8-6358-42d2-9a31-a36dd5ef95e6	\N	f	HAIR	NULL	23	1	NE		1	CIE	\N
4cdb25cf-1fb2-4e43-93e2-de42663eb619	9aa96533-394a-4575-9b76-9b857e6c60dd	\N	f	12 teeth; adult	NULL	24	1	NE	2		MBB	\N
aa1ff6d0-0b2c-475a-a54b-638ca8f66044	8812ca45-b053-469b-8016-33173e3231dc	\N	f	HAIR	NULL	29	1	NE		2	CIE	\N
7e0b9030-bc76-4b19-bd2d-4fb25f594def	7edc6f64-6073-4723-acae-1410f39ef81e	\N	f	7 teeth; adult	NULL	30	1	NE	2		MBB	\N
f69e0ae5-f54d-4996-8620-41c4823548f1	7edc6f64-6073-4723-acae-1410f39ef81e	\N	f	5 TEETH; ADULT	NULL	30	2	NE	12		CIE	\N
13cdd71b-10de-4dcc-9230-9e2e1d139844	f8ef1a9d-736e-48fe-9dcf-5d60f487910d	\N	f	Powdered tissue sample	NULL	32	1	NE	17		MBB	\N
ac1bbcb3-e43d-4937-88c0-4b836cc2d996	cbb3564c-ba34-437d-ac5b-683fcd6309fa	\N	f	Skin	NULL	33	1	NE	31		AWA	1998
e88516b4-c430-4504-99a2-6791fbeb1add	cbb3564c-ba34-437d-ac5b-683fcd6309fa	\N	f	Scapula (?); child	NULL	33	2	NE	31		AWA	1998
eb5189b3-827b-4cea-9940-589111177a26	6d4ad459-7f7d-4618-880f-e14f0d1c4162	22	f	Tissue	NULL	37	1	NE	31		AWA	1998
e0eeb415-e60b-47f6-88a2-74f6b259e836	a856cbe6-2aae-4b51-bcf6-a87a04dab3a9	\N	f	2 TEETH, 1 RIB FRAGMENT; ADULT	NULL	38	1	NE	30		CIE	2000
01a2aec3-7eb3-468d-8d1d-028ee57e8084	a856cbe6-2aae-4b51-bcf6-a87a04dab3a9	\N	f	RIBS AND TEETH	NULL	38	2	NE	30		GM	2000
8dd3b673-42ad-4483-a5b2-062c0e97f9ea	92248460-e7bf-48aa-a002-093ed2fb3e20	19	f	Bone powder; UKN ("Cluster 19")	NULL	12	1	NNW	21		MBB	1998
a2064f97-8afa-42fd-9064-f4f939978c96	1190ec61-e986-44e1-b243-c4cb3576821d	19	f	Skin powder; UKN ("Cluster 19")	NULL	13	1	NNW	21		MBB	1998
6513681a-2085-4050-a57d-50952f90fd8d	1190ec61-e986-44e1-b243-c4cb3576821d	19	f	Bone powder; UKN ("Cluster 19")	NULL	13	2	NNW	21		MBB	1998
dd2c9dec-cb8d-483d-9328-aeaa6b673ff3	a78d29b5-cadf-464d-b99c-710c4602e63a	\N	f	THORACIC REGION MASS	NULL	14	1	NNW		4	CIE	\N
8376e7ff-c606-4c2d-9f1b-e36e6485172e	a78d29b5-cadf-464d-b99c-710c4602e63a	\N	f	12 EETH- CHILD	NULL	14	2	NNW	3		GM	\N
ffa2d8f9-7513-4f42-bc30-ef1e5b5fc301	83b179a1-2de3-42ad-8ccc-8d48ae137751	\N	f	MANDIBLE AND TEETH; ADULT	NULL	16	1	NNW		4	CIE	\N
2cd47593-25cb-4edb-bbe6-0db0d92ba852	83b179a1-2de3-42ad-8ccc-8d48ae137751	\N	f	10 TEETH	NULL	16	2	NNW	3		GM	\N
3f347b72-e234-4afa-a6ad-9bc45f80b2fe	83b179a1-2de3-42ad-8ccc-8d48ae137751	\N	f	2 rib fragments; child	NULL	16	3	NNW	8		MBB	\N
1ace3aef-d608-40b2-aa37-9bb1eea51aab	3a04b16b-50b5-48ff-be8a-1be3c0d51522	\N	f	Skin; UKN	NULL	18	1	NNW	25		MBB	\N
992c8ebb-85c0-4649-a4de-3d460bafecb8	3a04b16b-50b5-48ff-be8a-1be3c0d51522	\N	f	~12 broken teeth and fragments; adult	NULL	18	2	NNW	2		MBB	\N
88eea3d5-2774-4321-82cc-9d075dd357f6	24837d58-fb8b-4732-87f3-550bd4364d6b	\N	f	INFANT SKULL FRAGMENTS	NULL	19	1	NNW		3	CIE	\N
89e0b8ce-ee8e-4e03-aac5-0290385b4ae7	24837d58-fb8b-4732-87f3-550bd4364d6b	\N	f	3 TEETH AND FRAGMENT; ADULT, TISSUE ON 1 TOOTH	NULL	19	2	NNW	12		CIE	\N
8602da95-0015-4edd-a3fd-43aaf864a6ec	8fe892c8-da6e-4ffa-8f84-68bd2291dc88	\N	f	Powdered tooth sample	NULL	20	1	NNW	21		MBB	\N
0edbcafe-1730-4dcd-a6de-9f1c075744cd	8fe892c8-da6e-4ffa-8f84-68bd2291dc88	\N	f	Powdered tooth sample	NULL	20	2	NNW	21		MBB	\N
7f1813ed-376b-43c8-95dd-66791f72897a	8431e7ec-f080-42c5-96e2-79f1f704728b	\N	f	Tissue from intestine and tibia	NULL	22	1	NNW	21		MBB	\N
efef9795-9681-4b98-8227-d4c3545d3b2f	8431e7ec-f080-42c5-96e2-79f1f704728b	\N	f	Powdered foot sample	NULL	22	2	NNW	21		MBB	\N
996a3d15-0c61-48a1-bc00-5305dc678d5c	611ce3c7-9c16-4872-9e04-981619019dc9	\N	t	2 teeth; bone and tissue; adult	NULL	23	1	NNW	35		MBB	1998
96157448-7f0a-40e8-8e8d-cc2fec5379c6	611ce3c7-9c16-4872-9e04-981619019dc9	18	t	1 tooth; adult ("Cluster 18")	NULL	23	2	NNW	14		MBB	1998
93010d0b-cb4f-4855-bb58-83aa4e5f8e5f	73e5b07a-a0b5-41ec-b9cd-975d39461b7e	3	f	2 teeth; adult	NULL	24	1	NNW	32		AWA	1998
6ff181d8-5102-4159-8c6d-34b99b5ed021	73e5b07a-a0b5-41ec-b9cd-975d39461b7e	3	f	Skin	NULL	24	2	NNW	32		AWA	1998
4c4151c9-288c-477a-a496-8500c8217871	dcd09a01-4b5d-4695-ba4e-2f174b6b6500	\N	f	RIBS AND MOLARS	NULL	25	1	NNW	30		GM	2000
b0cd5877-91e6-450b-b439-ff7b91177123	\N	\N	f	Skin from foot; UKN	NULL	16	1	NNW	24		MBB	\N
a0ede5c3-9e36-4bf9-9bf5-e28e606fdd2b	af989728-249b-4433-8012-b07a018a8d53	\N	f	2 TEETH AND 3 RIB FRAGMENTS; ADULT	NULL	1	1	NW	29		CIE	2000
9bd545c8-769e-4da1-8c4c-ff136b18de0e	2cb9759a-118c-4f5e-83e2-91feee759087	\N	f	Hair	NULL	4	1	NW		3	CIE	34372
7e6f3837-8bbf-483d-82da-720862e00bf1	0569bbcc-b275-4dad-a85a-eba4b3ed49ac	\N	f	TISSUE ??	NULL	7	1	NW	14		GM	\N
f601399e-59ad-4fa7-9fa2-b398de02d358	96d9bb5f-9e05-4112-8c6d-1614e9d45be2	\N	f	Tissue (muscle?); UKN	NULL	8	1	NW	24		MBB	\N
9083053e-cbaf-47f2-a654-8833b8756275	d5bd381b-8fec-41a6-b91d-417797f4db97	\N	f	10 teeth; child	NULL	9	1	NW	6		MBB	\N
da366975-b5a9-4e6b-ab22-52bcab1a931a	\N	\N	f	8 WHOLE TEETH & 1 FRAGMENTED TOOTH, ADULT, DECAYED	NULL	10	1	NW	13		CIE	\N
28802806-e7b2-4c1f-8469-75817f35165b	1a4f08c6-95a9-407c-8f7a-37cc540a0d17	\N	f	"Rib #1 1 of 2" - Written on the tube; 1 rib fragment; UKN	NULL	11	1	NW	16		MBB	\N
576ca8fe-abbf-4002-8ffd-0e1e32d9bfc1	82b25bf4-8a5a-4d33-b51d-d6b8556b117d	\N	f	Skin	NULL	13	1	NW	25		AWA	\N
798a8611-f392-437e-942e-0292f7413bae	82b25bf4-8a5a-4d33-b51d-d6b8556b117d	\N	f	Skin from hand; UKN	NULL	13	2	NW	25		MBB	\N
9378fae4-64c6-48f6-bb9b-b125fa5c3dee	326692b0-50e3-4e96-9728-466361dcbe39	\N	f	HAIR	NULL	16	1	NW		4	CIE	\N
1f5180d4-2000-4b0a-924e-4e4885bacae1	326692b0-50e3-4e96-9728-466361dcbe39	\N	f	8 teeth; adult	NULL	16	2	NW	6		MBB	\N
155e87e8-e5d7-4066-a651-2afcf623ac41	629f37cd-8b3d-481b-8854-18f7fe0cc4c6	\N	f	9 TEETH	NULL	18	1	NW	3		GM	\N
ca66f437-c953-4d97-9acf-1dff7df1fe78	5de91827-251c-493c-9c95-b66680d62112	\N	f	9 broken teeth; adult	NULL	21	1	NW	2		MBB	\N
8681f4c5-d507-4d19-9a60-ae86b0be9303	b00822ce-5281-4cc6-b026-dcb50b3e8e7f	\N	f	7 ADULT TEETH, "EYE, SKIN FROM FACE"	NULL	22	1	NW	10		CIE	\N
d5392f83-d9df-4201-b699-d86d780d885d	2b6832d3-6bfa-474f-83a2-fbf06d284d5c	\N	f	Powdered tissue sample	NULL	27	1	NW	17		MBB	\N
c06251a2-600f-40ac-ba47-b4e941864a9c	4078b18a-07f3-4de5-96e8-e0be5127dd6b	\N	f	Empty tube with dust residue	NULL	29	1	NW	17		MBB	\N
b26c7538-ce67-4df1-a069-1302e29ad097	\N	5	f	Skin; UKN ("Cluster 5")	NULL	15	1	NW	18		MBB	1998
556d3a83-5b07-46cf-ad47-76339e23c40e	b00822ce-5281-4cc6-b026-dcb50b3e8e7f	22	t	5 teeth; adult	NULL	22	1	NW	31		AWA	1998
72774880-7fc6-45ee-a042-b17dd4f275e0	\N	\N	f	SKIN, TEETH, AND INTERNAL TISSUE	NULL	5	1	NW		6	GM	1998
863e4bb4-2f79-4117-bb83-235205b42ae5	\N	\N	f	8 BROKEN TEETH; ADULT	NULL	14	1	NW	13		CIE	\N
a8070616-bbb8-43a6-8e91-5a20d0260a07	\N	\N	f	Tissue; UKN	NULL	19	1	NW	24		MBB	\N
1e07404c-6ae2-4c1c-b320-680d648dfedb	\N	\N	f	4 TEETH	NULL	20	1	NW	3		GM	\N
85b127f1-0cfb-4245-ae4d-93d843b7ac30	\N	\N	f	BRAIN	NULL	23	1	NW	22		GM	\N
19c38922-940f-4370-952f-95ac8b4ef0f2	\N	\N	f	Cranial Tissue; UKN	NULL	21	1	NWW	25		MBB	\N
9cabe512-f607-47e7-ba23-6c6b973b5014	0ee4c09a-f6ef-4fc7-9324-77182774e3cb	19	f	Skin; UKN ("Cluster 19")	NULL	1	1	SE	14		MBB	1998
e95ba148-ceb6-427e-b13d-d398549b50f9	0ee4c09a-f6ef-4fc7-9324-77182774e3cb	\N	f	SCALP TISSUE	NULL	1	2	SE	14		GM	\N
73497a7b-8601-4ba4-9034-296bc0ba2149	0ee4c09a-f6ef-4fc7-9324-77182774e3cb	\N	f	Tissue; UKN	NULL	1	3	SE	24		MBB	\N
b365888d-3b50-47d7-b366-ca5b9f215353	0ee4c09a-f6ef-4fc7-9324-77182774e3cb	\N	f	6 TEETH AND FRAGMENTS; ADULT W/ TISSUE ATTACHED	NULL	1	4	SE	13		CIE	\N
607a7c03-36f5-41e9-b773-bca092cd4654	cd409f79-70b4-4f44-8bc5-af7c1f4e2497	\N	f	Tissue (muscle?); UKN	NULL	2	1	SE	25		MBB	\N
7931ee9a-954d-4df9-ad04-7144dde3617e	6726f829-3a6b-468a-8598-d110db053581	\N	t	12 TEETH	NULL	3	1	SE	3		GM	\N
f2c12e1e-5502-4e56-ba1e-2018be3dd7aa	6726f829-3a6b-468a-8598-d110db053581	\N	f	~13 broken teeth and fragments; adult	NULL	3	2	SE	6		MBB	\N
761acf58-5e6f-496a-9aa5-678a8beff646	6726f829-3a6b-468a-8598-d110db053581	\N	f	RIB	NULL	3	3	SE	15		GM	\N
3fa38b07-fe1a-4908-84c2-edcf1f5c4b92	7a3914f9-a7c0-4dbf-8236-03adbfc9425c	\N	f	5 teeth; adult	NULL	4	1	SE	4		MBB	\N
b0790a52-b953-4bc1-aa2d-c965c5603d78	c137c78c-6b74-41d4-9b96-3d69adb04d5d	\N	f	5 teeth; adult	NULL	5	1	SE	6		MBB	\N
d12b069d-4226-4119-85f9-3320e1815631	c137c78c-6b74-41d4-9b96-3d69adb04d5d	\N	f	8 bones; UKN	NULL	5	2	SE	14		MBB	\N
8999c9e3-7f3f-4a3c-a532-96e31953c9d4	c137c78c-6b74-41d4-9b96-3d69adb04d5d	\N	f	Powdered tissue sample	NULL	5	3	SE	17		MBB	\N
7db77761-84ee-4384-a13f-5cd8ceda0480	0b88847b-c1d5-46ac-9442-b70553c82cad	\N	f	Powdered tooth sample	NULL	6	1	SE	21		MBB	\N
86126aaa-a23d-47f9-8a67-a8c2127e10ed	0b88847b-c1d5-46ac-9442-b70553c82cad	15	f	"Thoracic along vertebrae"; 2 metal rings	NULL	6	2	SE	34		AWA	1998
cb201aff-5192-4d72-a88e-6cc08d130b3a	0b88847b-c1d5-46ac-9442-b70553c82cad	15	f	Broken teeth; UKN	NULL	6	3	SE	34		AWA	1998
0cb2ca3f-5e34-41d7-a843-5a5379158b2e	a06cb305-bb6d-423f-90a5-70dc750a7049	\N	f	SKIN AND TEETH	NULL	7	1	SE		6	GM	1998
c1529402-5f69-4a50-8025-920eac4c1289	a06cb305-bb6d-423f-90a5-70dc750a7049	3	f	Lung	NULL	7	2	SE	32		AWA	1998
7915d9df-fea9-4842-a65c-7945fa6de719	a06cb305-bb6d-423f-90a5-70dc750a7049	3	f	Rib	NULL	7	3	SE	32		AWA	1998
4901b466-e409-4637-af73-57069da6b73e	a06cb305-bb6d-423f-90a5-70dc750a7049	\N	f	RIBS AND TEETH	NULL	7	4	SE	29		GM	2000
58a69ca3-1115-4cfe-9e0c-453268ad35ce	bf2d238a-a1fe-444d-9d86-64251c0503cf	\N	f	3 TEETH, 2 RIB FRAGMENTS; ADULT, "ROMAN"	NULL	8	1	SE	29		CIE	2000
c01ca2b3-226c-4f08-9959-b772a215c45b	08066b58-ffc6-48d8-b270-7164586cc871	\N	f	2 TEETH, 2 RIB FRAGMENTS; ADULT	NULL	9	1	SE	30		CIE	2000
a6d04ed9-7f8e-4aff-93ae-863b4c9710b4	08066b58-ffc6-48d8-b270-7164586cc871	\N	f	4 TEETH AND BRAIN;ADULT "UNIDENTIFIED"	NULL	9	2	SE		1	CIE	33653
26059492-fec8-4289-a9c2-d4ccb0625cd5	08066b58-ffc6-48d8-b270-7164586cc871	\N	f	Tissue; UKN	NULL	9	3	SE	24		MBB	\N
507eeae4-4318-4685-90e7-466495c1b52c	81b687cd-bf07-4aa3-be9f-1d971eeb7283	\N	t	9 TEETH	NULL	10	1	SE	3		GM	\N
61c07d08-2daa-43ef-a015-3d6d26a01c49	bbf9875a-94e5-44cf-9f60-496f5260ab07	\N	f	Tissue from scapula; UKN	NULL	11	1	SE	25		MBB	\N
09d97a86-742c-49f9-8564-65c3da86da8c	bbf9875a-94e5-44cf-9f60-496f5260ab07	\N	f	TEETH	NULL	11	2	SE	15		GM	\N
14a2f7bc-8c06-4c4d-8dcc-32ff1d898752	13378b2f-b224-4a26-b265-69cb1dd6f054	\N	t	9 TEETH	NULL	12	1	SE	3		GM	\N
b49a3390-b3a2-43e3-85ec-83fbddb2ef68	13378b2f-b224-4a26-b265-69cb1dd6f054	\N	f	10 teeth; child	NULL	12	2	SE	8		MBB	\N
2ad781e8-5676-426b-8665-35749ae52a8a	6217eff0-c4bd-4796-b5b5-c3ebadc0b8b2	\N	f	4 rib fragments; child	NULL	13	1	SE	8		MBB	\N
1ccd6fd6-c289-4f1c-943a-9c232a8d25ab	bbd11d07-3709-4399-bdb6-de5b9ca68cee	\N	f	2 rib fragments; adult	NULL	14	1	SE	8		MBB	\N
09ee3ef5-6c2f-4d69-8280-839c4dce783c	bbd11d07-3709-4399-bdb6-de5b9ca68cee	\N	f	Skin from ankle; UKN	NULL	14	2	SE	25		MBB	\N
34c8b72a-8296-44cc-8417-582366b98d28	bbd11d07-3709-4399-bdb6-de5b9ca68cee	\N	t	9 TEETH	NULL	14	3	SE	3		GM	\N
55e3aede-b9f5-4d49-8ce3-683569512be9	6726f829-3a6b-468a-8598-d110db053581	\N	f	7 teeth; adult	NULL	3	1	SE	6		MBB	\N
ed7659e5-1d53-4121-8995-7e18dab07637	76d9ac67-a02e-44db-b8d1-dc1bd70ab4c6	\N	f	7 ribs and fragments; child	NULL	2	1	SW	16		MBB	\N
8e5169a9-36cc-407a-a1f3-53d608521793	76d9ac67-a02e-44db-b8d1-dc1bd70ab4c6	\N	f	5 bones; adult?	NULL	2	2	SW	14		MBB	\N
3a0aa60d-2f82-4f74-8d91-34fb0b959fd2	f7338570-d788-4205-80fe-1e2a175521a0	\N	t	TOOTH-RC	NULL	3	1	SW	11		GM	\N
f62a313e-5741-4d25-a724-8cd9ebe901a8	f7338570-d788-4205-80fe-1e2a175521a0	\N	f	Powdered bone sample	NULL	3	2	SW	17		MBB	\N
081e1b06-5adb-4cb1-9103-4216d9af8b30	901634ec-cb5b-4196-8214-2dbf33a95212	15	f	Skin	NULL	7	1	SW	34		AWA	1998
8cb79247-db30-4f88-88bc-ff1bb22e9316	\N	14	f	Long bone	NULL	10	1	SW	31		AWA	1998
0460dfde-df2c-40ff-81cc-71c5a7e0e524	76d9ac67-a02e-44db-b8d1-dc1bd70ab4c6	14	f	Teeth; child	NULL	2	1	SW	31		AWA	1998
d1078efe-98f7-42a0-9907-81732c17e75a	f974224d-5454-4181-b182-8a4e78682102	\N	f	2 rib fragments; adult	NULL	1	1	SW	8		MBB	\N
95f33a2a-0ecb-40c2-b8af-8697b869c473	\N	\N	f	9 teeth; adult	NULL	1	1	SW	2		MBB	\N
19e84779-7d3f-4ec8-81dd-b393c3df4bec	0d0dfe13-756e-4bc0-b68a-0329be2a1532	\N	f	SKULL	NULL	2	1	SW	22		GM	\N
f1c0b2b4-afbd-48fd-b714-e210c520cba1	0d042cc9-58c3-4629-a853-fd445d242707	\N	f	3 bone fragments (foot); adult	NULL	4	1	SW	14		MBB	\N
ef590a95-2187-4186-9b93-a075bf417444	34f10857-00a2-4f2e-a560-6e6b1439716f	\N	f	Skin sample	NULL	5	1	SW	21		MBB	\N
f26377e3-26fb-4e3a-a02f-b4c6b53dc25f	34f10857-00a2-4f2e-a560-6e6b1439716f	\N	f	TOOTH-RC	NULL	5	2	SW	11		GM	\N
6edb590f-643a-47f6-8af6-6d0968ef58a2	34f10857-00a2-4f2e-a560-6e6b1439716f	\N	f	Empty tube with dust residue	NULL	5	3	SW	17		MBB	\N
4ee3d6ef-3208-4528-bd7c-e5cccfe69998	34f10857-00a2-4f2e-a560-6e6b1439716f	\N	f	Empty tube with dust residue	NULL	5	4	SW	17		MBB	\N
8f8fe329-b73a-4883-91de-58d208d7d655	8204704f-4df6-42b8-9bab-e74e0829796c	18	f	Skin; UKN ("Cluster 18")	NULL	6	1	SW	14		MBB	1998
64a33c82-fad6-402d-9fad-486f877ed5c6	3bbca8cc-3d30-4d8c-9b7f-fb802bfe5a00	2	f	Skin	NULL	7	1	SW	31		AWA	1998
3a122897-348e-476e-ad2b-99e2a49e6aee	ef336535-f973-475e-990b-fbbaa40eb468	2	f	Ribs	NULL	8	1	SW	31		AWA	1998
59644e1a-e773-44fa-b661-3336fb9f6add	ef336535-f973-475e-990b-fbbaa40eb468	2	f	3 Teeth; adult	NULL	8	2	SW	31		AWA	1998
cded5a07-189a-4f7e-a3c0-38d4a6929275	ef336535-f973-475e-990b-fbbaa40eb468	\N	f	3 TEETH, 3 RIB FRAGMENTS; ADULT	NULL	8	3	SW	30		CIE	2000
41c25290-cf85-4deb-a4c4-bd7a869e9430	e46bba82-08a7-437d-b980-81fa8b8a5e60	\N	f	RIBS AND TEETH	NULL	9	1	SW	30		GM	2000
f0c75511-0fb4-4771-84cd-43eb26075e3f	e46bba82-08a7-437d-b980-81fa8b8a5e60	\N	f	2 MANDIBLE FRAGMENTS W/ MULT TEETH FRAGMENTS, MULT RIB FRAGMENTS; INFANT	NULL	9	2	SW	29		CIE	2000
1f62a5bd-012a-4da6-8c9f-61c485fcd8bd	06d5d746-fb1a-487f-b486-450c284d77f0	\N	f	BABY	NULL	10	1	SW	29		GM	2000
873ece03-ffbe-4db4-a39e-5bebdd9a3ae9	06d5d746-fb1a-487f-b486-450c284d77f0	\N	f	SKIN FROM SKULL	NULL	10	2	SW	14		GM	\N
ad49fbaa-92a9-4f5c-93ac-70875fb357e5	06d5d746-fb1a-487f-b486-450c284d77f0	\N	f	5 teeth; adult	NULL	10	3	SW	4		MBB	\N
a49e50f9-ad13-4b74-ac9d-950ae29fb187	06d5d746-fb1a-487f-b486-450c284d77f0	\N	f	6 teeth; adult (some bone)	NULL	10	4	SW	6		MBB	\N
372d2eac-da61-41c0-bf74-a2241a8bf36d	06d5d746-fb1a-487f-b486-450c284d77f0	\N	f	9 TEETH	NULL	10	5	SW	3		GM	\N
297469c6-0ebd-4ebf-b1cf-2312177d7c0e	977d6d89-41a5-4830-a51e-de899e1bf0da	\N	f	4 teeth; adult	NULL	11	1	SW	4		MBB	\N
ef229dd1-b133-46b2-895b-9141604e988f	977d6d89-41a5-4830-a51e-de899e1bf0da	\N	f	HAIR AND POSSIBLE BONE FRAGMENTS	NULL	11	2	SW		1	CIE	\N
850b0767-da7c-46af-ac06-a98ee50975c1	e3911ff9-304c-4483-8bc9-b857ac02e8c3	\N	f	3 rib fragments; adult	NULL	13	1	SW	8		MBB	\N
af8cecfe-7eec-4cb1-8e6b-707ecf0121c2	e3911ff9-304c-4483-8bc9-b857ac02e8c3	\N	f	TISSUE FROM TIBIA JOINT BY ANKLE	NULL	13	2	SW	22		GM	\N
06302f57-8cbc-4207-a47d-f545798e50c4	e08d750f-5dc9-4ce5-bca9-d842fd625b4a	\N	f	HAIR	NULL	14	1	SW		4	CIE	\N
4838cdc8-2386-4709-ab0b-38c1f3c0a15e	e08d750f-5dc9-4ce5-bca9-d842fd625b4a	\N	f	11 TEETH AND FRAGMENTS	NULL	14	2	SW	3		GM	\N
b2f8f8bf-ed47-4e42-8d3f-a70f182fc2b2	c074e858-802b-47f5-8e1b-690b888cfc2a	\N	f	8 TEETH; ADULT	NULL	15	1	SW	12		CIE	\N
fe193872-ca07-407d-9529-e3d60b59bd1e	c074e858-802b-47f5-8e1b-690b888cfc2a	\N	f	3 rib fragments; adult	NULL	15	2	SW	14		MBB	\N
c3ffb5af-1ea0-4fb0-91d1-f9672f4f03e1	c074e858-802b-47f5-8e1b-690b888cfc2a	\N	f	2 TEETH; ADULT, 1 BROKEN IN HALF	NULL	15	3	SW	12		CIE	\N
6133e249-06a6-43de-8b56-0dd14bac11ba	c074e858-802b-47f5-8e1b-690b888cfc2a	\N	f	HAIR	NULL	15	4	SW	22		GM	\N
7587cef8-c42f-44c0-9eb3-e877248b25f7	38b1a8aa-5072-43bf-95c9-ed60dc4acd22	\N	f	4 tubes with bone fragments and tissue; UKN ("SOHAG") written on bag	NULL	16	1	SW		5	MBB	1993
d899309d-8b75-4f74-b2f0-522de7265e60	38b1a8aa-5072-43bf-95c9-ed60dc4acd22	18	f	Rib fragment and tissue; adult ("Cluster 18")	NULL	16	2	SW	14		MBB	1998
fbb11024-2eb7-4f76-b49b-6812b6bbbd7e	c2f54861-1465-475a-ab5f-ca964d317e30	13	f	~5 broken teeth fragments; child ("Cluster 13")	NULL	17	1	SW	14		MBB	1998
17102f22-4580-4c49-848e-2ed09b9e9115	c2f54861-1465-475a-ab5f-ca964d317e30	13	f	Tissue; ("Cluster 13")	NULL	17	2	SW	14		MBB	1998
b1421225-c051-41ec-b369-674948817c0b	ce50e312-b8e2-4685-b5a0-d834211536d4	2	f	Tissue	NULL	18	1	SW	33		AWA	1998
366c9915-8709-4d0c-b341-b62ebc5a2c02	ce50e312-b8e2-4685-b5a0-d834211536d4	2	f	Internal	NULL	18	2	SW	33		AWA	1998
c266d9f7-912a-4b5a-a383-01a540019ddd	0e341882-243b-49c5-b661-7b5d3464b9b1	\N	f	2 TEETH AND 2 RIB FRAGMENTS; ADULT	NULL	19	1	SW	29		CIE	2000
f9e2f6c6-e13f-4e3f-ba39-fb3bb1f20e0a	0e341882-243b-49c5-b661-7b5d3464b9b1	\N	f	RIBS AND TEETH	NULL	19	2	SW	29		GM	2000
a68de78e-c5ab-415a-84f9-98509eb1d706	ad33fabc-d28e-4308-b244-bc63d39d3865	\N	f	2 TEETH (MOLARS), 2 RIBS; CHILD	NULL	20	1	SW	30		CIE	2000
6de03d78-35f7-4f3b-8372-09c321ea769f	ad33fabc-d28e-4308-b244-bc63d39d3865	\N	f	5 TEETH; ADULT	NULL	20	2	SW	13		CIE	\N
b31c484e-d6ce-4e47-b09c-bdec8422f45e	ad33fabc-d28e-4308-b244-bc63d39d3865	\N	f	SKIN AND HAIR	NULL	20	3	SW	14		GM	\N
90e49806-9e7f-4dcd-b4a8-d9c78411491c	e5315c7b-a6f7-47e8-9269-9af7b19b53fa	\N	f	11 TEETH	NULL	22	1	SW	3		GM	\N
7fed13ac-d19b-424c-b8b7-72656f062531	e5315c7b-a6f7-47e8-9269-9af7b19b53fa	\N	f	4 TEETH	NULL	22	2	SW	3		GM	\N
4f5cbcc2-e593-4b33-a3d5-05e57dd05632	e5315c7b-a6f7-47e8-9269-9af7b19b53fa	\N	f	4 teeth; adult	NULL	22	3	SW	4		MBB	\N
f6220c45-9fd0-4f73-8b00-a98f5577c4d0	e5315c7b-a6f7-47e8-9269-9af7b19b53fa	\N	f	Rib; adult	NULL	22	4	SW	25		AWA	\N
a40b7c1a-1958-4dec-b261-128e71a07b47	e8355825-5c14-4b0d-ba4e-1d148dea29e0	\N	f	HALF MANDIBLE W/ TEETH; ADULT	NULL	24	1	SW		4	CIE	\N
598c9af4-9640-4555-9c34-e26524d48848	e8355825-5c14-4b0d-ba4e-1d148dea29e0	\N	f	9 teeth; adult	NULL	24	2	SW	6		MBB	\N
635820b2-f1d2-4561-b9b8-cffbdada9254	c0879461-9e46-40f0-b0df-928c9e6da121	\N	f	5 teeth; adult	NULL	25	1	SW	4		MBB	\N
76fbb113-3b9a-4335-8cc4-50806ae4980b	c0879461-9e46-40f0-b0df-928c9e6da121	\N	t	6 teeth; adult	NULL	25	2	SW	8		MBB	\N
83a2db0b-4135-4530-a994-03d061b8b128	2aa87b59-cc3d-4495-aab3-c60e63a9d7fe	\N	f	Tissue (skin and mucle) from foot (5 toes); UKN	NULL	26	1	SW	27		MBB	\N
1e371cb0-9984-4cf2-9898-83996ddf6af8	2aa87b59-cc3d-4495-aab3-c60e63a9d7fe	13	f	Rib fragments; child ("Cluster 13")	NULL	26	2	SW	14		MBB	1998
39d24cbb-5055-4e62-847c-9aae35fc4f22	2aa87b59-cc3d-4495-aab3-c60e63a9d7fe	10	f	3 teeth and tissue; adult ("Cluster 10")	NULL	26	3	SW	35		MBB	1998
c9344fd9-6a42-4177-bc94-664e2b5557ba	3c90ba40-bad9-42a0-a6e3-fde59368c192	17	f	Internal tissue	NULL	27	1	SW	34		AWA	1998
2f6090d5-df8b-41ce-8aeb-7fc2406ef87e	3c90ba40-bad9-42a0-a6e3-fde59368c192	17	f	Skin	NULL	27	2	SW	34		AWA	1998
986c7f67-899e-49a7-9898-b7d54ba89e8e	3c90ba40-bad9-42a0-a6e3-fde59368c192	17	f	Ribs and teeth; child	NULL	27	3	SW	34		AWA	1998
7cfa7d9b-f8df-4920-8e86-33d901b8fb95	\N	\N	f	RIBS AND MOLARS- YOUTH	NULL	17	1	WNW?	30		GM	2000
a6377379-e120-4702-8441-9299099edc28	\N	19	f	Bone fragments; UKN ("Cluster 19")	NULL	\N	1		14		MBB	1998
7f46999f-4c1e-4c6e-aac9-4a91eea38254	\N	\N	f	Powdered tissue sample	NULL	9	1		17		MBB	\N
dc44c5e4-d25a-4b0a-a591-1ec76ab386fc	bfbd8eca-2b6b-4943-b58a-a15dc45fcafa	\N	f	"RIBS AND MOLARS"; UNK AGE (TOO DIRTY TO SEE)	NULL	3	1	NW	30		CIE	2000
ef88243c-f548-4efc-ba47-dbbba0b2cff9	2a690117-df88-43eb-bdd1-5693dff2f192	\N	f	RIBS AND TEETH	NULL	4	1	NW	30		GM	2000
32e54968-20d4-4d56-999e-05c3bc1797c4	5606dee1-2b45-40d0-af1f-6724f55beba2	\N	f	VERTEBRAE, INFANT W/ TISSUE	NULL	6	1	NW	30		CIE	2000
de860645-d80a-429a-b6b5-984265e4b8a0	19a342f9-d4d4-4226-9422-a860d43eba02	\N	f	Child ribs	NULL	7	1	NW	25		AWA	\N
e7363bde-40aa-44a8-8d83-056e47dd69a7	95d8cf2c-b4ce-4f45-b49f-928abc0eb7c9	\N	f	EYE ORBIT TISSUE	NULL	10	1	NW	22		GM	\N
a004c32c-bf03-4d66-865e-63607df438f0	6c9c0b1b-d740-4c1b-8ee4-9570c634f3f7	\N	f	THORAX	NULL	20	1	NW	22		GM	\N
cc35b6ba-309e-4db9-a4a2-53f6035d0c24	4c16172b-6af6-4d78-bb91-17f13a54cb57	\N	f	3 rib fragments; adult	NULL	28	1	NW	8		MBB	\N
a03754f0-a2b4-4d45-89c0-78739a765b15	94eb8d9a-5b30-415e-90f2-4b497cab9a25	\N	f	2 rib fragments; adult	NULL	13	1	NW	8		MBB	\N
bcf28d47-63fd-43e7-95a4-644e9c6adf49	32482789-c995-4258-97be-f288b85ddbe7	\N	f	11 teeth; child	NULL	14	1	NW	4		MBB	\N
513ced5c-5c4f-44db-86ee-c687971a3808	6c9c0b1b-d740-4c1b-8ee4-9570c634f3f7	\N	t	5 teeth; adult	NULL	20	1	NW	8		MBB	\N
e0af87c5-e5e4-4510-bfba-54ac7372eaa3	3e1bf414-67f3-4e83-bd6f-803dff798ecb	\N	f	SMALL TEST TUBE OF BUGS?	NULL	30	1	NW			CIE	\N
7c2f6fb3-9402-4a82-aefe-2d00ebea324b	6178f56c-9489-484c-8e4a-b711602dbf03	\N	f	Fragments of foot and rib (with tissue); child	NULL	31	1	NW	19		MBB	\N
c4eb7e08-44f3-48c4-a4eb-45c5195d1f4c	3a4a0f8e-0e66-4339-a425-3bec2f5c7061	\N	f	HAIR IN SCALP	NULL	33	1	NW	22		GM	\N
372bac00-3fca-4f92-a321-c6c45cb0de6c	3e2a1332-e0b8-47b7-b024-c87f9ee02c82	\N	f	Skin	NULL	36	1	NW	31		AWA	1998
aed6a220-6911-466e-a265-10f725add93f	df3a2d76-ae81-4c95-9191-03ad025cbaba	3	f	Long bone pieces	NULL	44	1	NW	33		AWA	1998
fc139f45-e233-4140-a706-6f20e8a269d2	19a342f9-d4d4-4226-9422-a860d43eba02	3	f	Bone and tissue	NULL	7	1	NW	33		AWA	1998
ba482a54-c593-4976-9e43-c11152d5601d	4bf59054-2542-4f6b-a570-e7371723e2b0	\N	f	VERTEBRAE	NULL	9	1	NW	30		GM	2000
d778dfad-c753-429a-b2d8-9e698beb84f3	9eab1774-5581-4b69-bf95-5b08507174e2	\N	f	17 teeth; child	NULL	4	1	NW	4		MBB	\N
c716f347-49ce-47f4-8d79-a657b01229b3	0f210b25-e1e2-4acc-b9f3-b9c22acae0f2	\N	f	9 bone fragments; child	NULL	7	1	NW	8		MBB	\N
0f49fa1a-2f7e-4735-8f15-407abd15e2fe	44cf9aeb-4dab-4a00-a26b-c8fb8e011437	\N	f	4 teeth; adult	NULL	8	1	NW	4		MBB	\N
1d99b3b7-5be8-462b-ae17-fd936b5b44fe	\N	\N	f	WOOD	NULL	40367	1	NW		2	CIE	\N
fa4030f7-84b3-4efc-bf2d-1cd01d3ae4b8	\N	\N	f	Scalp, hair, piece of skull	NULL	40394	1	NW	20		AWA	\N
545e7cb0-6f40-45bc-97fe-271f0eccdb42	\N	\N	f	11 teeth; adult	NULL	1	1	NW	1		AWA	\N
648b35d4-6d61-4a2e-b318-2a9ca95cb998	\N	\N	f	EYE	NULL	1	2	NW	29		GM	\N
6333c9a4-b985-434f-ab17-3cc704cce710	\N	\N	f	Bone or tooth fragments	NULL	1	3	NW	17		MBB	\N
0c418ab9-2e30-44d8-bbe8-64440d9fbad5	\N	\N	f	"Internal"	NULL	1	4	NW	31		AWA	1998
4d61cd03-7e13-4056-b11a-bd3120eda8b2	\N	2	f	6 teeth; adult	NULL	1	5	NW	33		AWA	1998
271367ed-c3de-43ca-b9ba-ff6de8d755f2	\N	\N	f	BLACK DEBRIS; "BUGS FROM PELVIS"	NULL	1	6	NW	30		CIE	2000
acda39ac-0b44-4e44-b1c4-66d44a21ff36	\N	\N	f	2 TEETH, 2 RIB FRAGMENTS W/ TISSUE; ADULT	NULL	2	1	NW	30		CIE	2000
71d0bb6b-cb6a-4ccd-b15c-031c8132ad31	\N	\N	f	BUGS FROM PELVIS	NULL	2	2	NW	30		GM	2000
0458fdc3-9bc0-4ff2-9ffe-dbe8851e6cb6	\N	\N	f	9-10 TEETH; ADULT, SOME FRAGMENTED	NULL	2	3	NW	13		CIE	\N
7d99bab6-5937-4814-ae7a-4e9778a820d4	\N	\N	f	9 TEETH; ADULT	NULL	2	4	NW	13		CIE	\N
b296466a-d576-4588-aeb2-ffec0130b323	\N	\N	f	BEARD HAIR	NULL	3	1	NW		4	CIE	\N
1da0e533-eaae-4cc1-bed1-855f045dd20f	\N	\N	f	3 rib fragments; child	NULL	3	2	NW	8		MBB	\N
ea147900-ba4b-4fba-a34f-ecc526ccfd67	\N	\N	f	Skin; UKN	NULL	3	3	NW	25		MBB	\N
219e93e4-5e88-4b85-802b-c54c458fe76c	\N	\N	f	2 tubes with tooth fragments; UKN ("SOHAG") written on bag	NULL	4	1	NW		5	MBB	1993
4b781a15-d0b5-4bec-bfcf-a419c2717cc5	\N	\N	t	4 teeth; adult	NULL	4	2	NW	31		AWA	1998
b7cd123c-dfce-4939-8c24-897d34885f7f	\N	\N	f	"COPROLITE?"	NULL	4	3	NW		3	CIE	1998
e2bd1d6f-6430-4f78-a41c-6753092ed337	\N	\N	t	TEETH	NULL	4	4	NW		6	GM	1998
f4abb474-0fa7-4045-aaed-85496a10d28a	\N	\N	f	SKIN	NULL	5	1	NW		6	GM	1998
2061e75e-f8c8-4042-b3bb-79527ad5a051	\N	\N	f	RIBS AND TEETH	NULL	5	2	NW	30		GM	2000
be716b42-3647-48ab-aef4-1801aca609a9	\N	\N	f	10 teeth; adult	NULL	6	1	NW	6		MBB	\N
09a4295e-0bed-466e-b9cf-f615f54216c6	\N	\N	t	9 TEETH	NULL	6	2	NW	3		GM	\N
898b3957-f554-4200-b5b6-4d8a0aa6ad3b	\N	\N	f	3 rib fragments; adult	NULL	7	1	NW	8		MBB	\N
1cf859c6-70c2-4391-8744-eb5f9f9f73e5	\N	\N	f	Tissue from palate; UKN	NULL	7	2	NW	25		MBB	\N
89470fae-687b-483c-aeaf-9d9722efd6d5	\N	\N	f	9 teeth; adult	NULL	8	1	NW	4		MBB	\N
f6906ca6-6304-430f-b6b7-f4941565312e	3a9cb261-0842-4a88-9fa2-3a26c42ce953	\N	t	14 teeth; adult	NULL	1	1	NW	6		MBB	\N
f52819a0-b301-40f9-a29e-905b70f37918	\N	\N	f	BRIAN	NULL	1	1	NW	22		GM	\N
b055c25c-e9e0-47ab-a259-a40c89d4b3dd	a97f015b-7a7d-4c40-9e81-bc6179b0541a	\N	f	TEETH	NULL	10	1	NW	15		GM	\N
b1183760-3c84-434e-9d1c-c03d889ce5e4	a97f015b-7a7d-4c40-9e81-bc6179b0541a	\N	f	HAIR AND SKIN	NULL	10	2	NW	15		GM	\N
77dd6279-2647-467c-89aa-a355e25b759c	a97f015b-7a7d-4c40-9e81-bc6179b0541a	\N	f	4 fragmented teeth; child?	NULL	10	3	NW	10		MBB	1998
7d748955-6fe5-42f5-9eea-04e2105b0c27	7b66924a-6996-4bdd-9f57-d64b2adc8cce	\N	f	Skin from foot; UKN	NULL	11	1	NW	10		MBB	1998
27499487-6e88-47fd-9fa2-828528545e9d	7b66924a-6996-4bdd-9f57-d64b2adc8cce	\N	f	Fibula fragment; child	NULL	11	2	NW	10		MBB	1998
783c2f6b-09ac-4402-9e69-60436a8707f9	7b66924a-6996-4bdd-9f57-d64b2adc8cce	18	f	5 teeth fragments; adult ("Cluster 18")	NULL	11	3	NW	14		MBB	1998
944a00df-b5e8-4b1a-a165-973e3e3ecbf6	2cc97078-e10b-40ce-892d-72c235ece5c2	\N	f	RIBS AND TISSUE	NULL	12	1	NW		6	GM	1998
622ee247-00b8-469a-8863-ae35f502fb59	2cc97078-e10b-40ce-892d-72c235ece5c2	\N	f	RIBS AND TEETH	NULL	12	2	NW	30		GM	2000
6f32c4a6-0486-4fea-ac6e-8977713f0e09	2cc97078-e10b-40ce-892d-72c235ece5c2	\N	f	4 teeth; adult	NULL	12	3	NW	6		MBB	\N
1f1c5ae2-09b6-4ba4-809c-a5f6316655af	2cc97078-e10b-40ce-892d-72c235ece5c2	\N	f	HAIR AND POSSIBLE BONE FRAGMENTS	NULL	12	4	NW		1	CIE	\N
c3a400f9-dfdd-475c-bd3c-48fcef0b68b0	2cc97078-e10b-40ce-892d-72c235ece5c2	\N	f	8 teeth; child	NULL	12	5	NW	4		MBB	\N
466fc0ce-7854-4b71-98a0-354d0ae34916	d5cba57d-d390-446f-8d5e-428dc755e0f8	\N	f	Skin from skull; UKN	NULL	13	1	NW	25		MBB	\N
a70b2c81-3e86-45d9-8563-32ec5994df4b	d5cba57d-d390-446f-8d5e-428dc755e0f8	\N	f	2 rib fragments; sub-adult	NULL	13	2	NW	8		MBB	\N
74e92ade-af91-4105-a3df-6b1e1d449135	d5cba57d-d390-446f-8d5e-428dc755e0f8	\N	f	Tissue; UKN	NULL	13	3	NW	25		MBB	\N
84e8c893-ec1a-47eb-9e5b-e93f68da066f	d5cba57d-d390-446f-8d5e-428dc755e0f8	\N	f	9 TEETH; ADULT, ONE BROKEN	NULL	13	4	NW	12		CIE	\N
05716989-d703-4be7-b33a-ab8e964dc56f	d5cba57d-d390-446f-8d5e-428dc755e0f8	\N	f	12 teeth; child	NULL	13	5	NW	1		AWA	\N
0b0a73de-8492-4586-a644-2844e5b31a2f	7a270137-bba5-4625-b00f-778e83459cfc	18	f	Internal tissue; UKN ("Cluster 18")	NULL	14	1	NW	14		MBB	1998
3d65ba4f-dee6-47fa-bd16-9f65f347a7b2	7a270137-bba5-4625-b00f-778e83459cfc	3	f	Ribs; infant	NULL	14	2	NW	33		AWA	1998
f322a831-25de-4f17-9637-ff11366e2a17	001c8dac-0f7e-4a7f-ac16-fdd47fca4262	\N	f	Skin, teeth, and bone; adult	NULL	15	1	NW	34		AWA	1998
2469b610-9a79-4a56-abbf-49f6885e6291	001c8dac-0f7e-4a7f-ac16-fdd47fca4262	\N	f	2 TEETH, RIB, OTHER UNK; ADULT	NULL	15	2	NW	30		CIE	2000
3ad491da-f3d1-4284-85a4-16cf74bb5d9b	001c8dac-0f7e-4a7f-ac16-fdd47fca4262	\N	f	WOOD FOR CARBON DATING	NULL	15	3	NW		3	CIE	33656
0d992456-bfa9-4448-8b0d-26e7bcbddadf	001c8dac-0f7e-4a7f-ac16-fdd47fca4262	\N	f	4 TEETH; ADULT	NULL	15	4	NW	13		CIE	\N
1b41859d-1f63-4e08-92f7-720fabefabe1	001c8dac-0f7e-4a7f-ac16-fdd47fca4262	\N	f	Rib pieces; adult	NULL	15	5	NW	25		AWA	\N
5b65686b-a81b-4754-a4a0-7b488773a1f6	94df0c7f-1327-4156-b4a9-428685cefc48	\N	f	Hair	NULL	16	1	NW		1	MBB	\N
c4a84997-ace5-47f1-8695-b71e562807a0	94df0c7f-1327-4156-b4a9-428685cefc48	\N	f	8 teeth; adult	NULL	16	2	NW	5		MBB	\N
8c999834-7dc7-4b13-9c5e-b38cb9651dc6	94df0c7f-1327-4156-b4a9-428685cefc48	\N	f	8 teeth; adult	NULL	16	3	NW	13		MBB	\N
adb76ded-c658-468e-b9ed-98967c95eb82	94df0c7f-1327-4156-b4a9-428685cefc48	\N	f	6 rib fragments; infant	NULL	16	4	NW	16		MBB	\N
3c7ca03f-d0f6-4d3f-b28c-98e768446fa5	9ddbfc0f-831d-436b-877e-6a498a78b6a4	\N	f	11 teeth; adult	NULL	17	1	NW	4		MBB	\N
3288cd45-f484-4f63-bdc8-7c5c97a7a08e	9ddbfc0f-831d-436b-877e-6a498a78b6a4	\N	f	5 teeth; adult	NULL	17	2	NW	6		MBB	\N
2d4af2ab-24df-4ab3-bb2e-0121b1201954	9ddbfc0f-831d-436b-877e-6a498a78b6a4	\N	t	2 teeth; adult	NULL	17	3	NW	6		MBB	\N
b7e0aa29-ce26-4d60-863e-e8644f53330d	daaa4edc-f05e-42f8-8405-2386010d654f	\N	f	Tissue from hand (fingerprint); UKN	NULL	18	1	NW	25		MBB	\N
1fec8a0a-1b97-4337-906f-4e2bfdda57a2	daaa4edc-f05e-42f8-8405-2386010d654f	\N	f	10 TEETH	NULL	18	2	NW	3		GM	\N
53655dca-52df-46dd-baca-1d4a092f5535	daaa4edc-f05e-42f8-8405-2386010d654f	\N	f	12 teeth; adult (some bone)	NULL	18	3	NW	6		MBB	\N
46400541-1067-4775-882f-8da703a14426	ea3889f2-e938-45ae-ab6d-a2d84592da46	\N	f	13 TEETH AND FRAGMENTS	NULL	19	1	NW	3		GM	\N
b5f4cd19-64d2-4602-8833-aaf8d56260c1	ea3889f2-e938-45ae-ab6d-a2d84592da46	\N	f	4 rib fragments; child (some tissue)	NULL	19	2	NW	14		MBB	\N
93ec6bb6-860e-4b6c-b0e7-fc8d581dce02	ea3889f2-e938-45ae-ab6d-a2d84592da46	\N	f	7 bone fragments; sub-adult?	NULL	19	3	NW	14		MBB	\N
021f0ded-c06a-4808-8e0b-3e1f72450e79	ea3889f2-e938-45ae-ab6d-a2d84592da46	\N	f	3 TEETH; ADULT W/ DECAY	NULL	19	4	NW	12		CIE	\N
9f8b02f1-cbe2-40d5-8ae1-1797ce532293	726f45f5-6282-4ff2-b4d5-bcef90dd7f86	\N	f	EYE FRAGEMENTS; UNK AGE	NULL	2	1	NW	29		CIE	\N
a693dd30-9403-49bd-aa5e-e75293d4f5de	15f52f43-f673-43a9-80e9-b4dd76a080ef	18	f	Skin; UKN ("Cluster 18")	NULL	21	1	NW	14		MBB	1998
9224793e-46af-4295-9c99-8218046ca8bf	15f52f43-f673-43a9-80e9-b4dd76a080ef	\N	f	3 molars; child	NULL	21	2	NW	31		AWA	1998
e25d4ef8-b5b8-4252-b22e-2efb512dc317	15f52f43-f673-43a9-80e9-b4dd76a080ef	\N	f	Broken rib pieces	NULL	21	3	NW	31		AWA	1998
2afc511e-5ca3-4ef9-b12e-f49f1d237f27	15f52f43-f673-43a9-80e9-b4dd76a080ef	\N	f	RIBS AND TEETH	NULL	21	4	NW	30		GM	2000
521a0e09-562d-4ef3-b45c-85dc1640862d	15f52f43-f673-43a9-80e9-b4dd76a080ef	\N	f	2 TEETH, MULT RIB FRAGMENTS; ADULT	NULL	21	5	NW	30		CIE	2000
4892b3b4-07f9-4fc4-bf64-f5aa53d612cd	1497ac1f-2778-47d8-a85d-2f8d1d3d63cd	\N	f	6 teeth; adult	NULL	22	1	NW	4		MBB	\N
a5bdd541-1e5c-4894-8da7-68bb1565dbef	1497ac1f-2778-47d8-a85d-2f8d1d3d63cd	\N	f	5 WHOLE TEETH; ADULT W/ MULTIPLE TOOTH FRAGMENTS	NULL	22	2	NW	12		CIE	\N
b3cc2ece-4c10-45fb-ba54-8c8d84e25eab	\N	\N	f	Bone fragments	NULL	9	2	SW	21		MBB	\N
fd113459-4af5-4407-b112-00876e2b6b4c	1497ac1f-2778-47d8-a85d-2f8d1d3d63cd	\N	f	9 teeth; child	NULL	22	3	NW	1		AWA	\N
39fcd8ed-dcf9-4a77-b9a9-63ec8c558dc9	1497ac1f-2778-47d8-a85d-2f8d1d3d63cd	\N	f	HAIR IN SCALP	NULL	22	4	NW	22		GM	\N
bf0c019f-6e15-49ec-a9be-0ccafc812983	1497ac1f-2778-47d8-a85d-2f8d1d3d63cd	18	f	Tissue; UKN ("Cluster 18")	NULL	22	5	NW	14		MBB	1998
13cff309-e40c-4868-8c60-43ad3f3718bf	8a6fbb46-dd60-42ad-9c8e-7bf006ecba27	\N	f	2 fragmented teeth; child	NULL	23	1	NW	10		MBB	1998
fe3ffc34-f442-4e49-a851-164bb3d1bb86	8a6fbb46-dd60-42ad-9c8e-7bf006ecba27	\N	f	LONG BONE, SKIN, AND INTERNAL?	NULL	23	2	NW		6	GM	1998
8931f38b-603e-4c53-87cb-17da46771864	5395b520-0632-4a5d-b9d7-dd982b16e3bb	\N	f	RIBS AND TEETH	NULL	24	1	NW	30		GM	2000
92630747-df84-4f2c-8baa-c0d76bf1c83e	5395b520-0632-4a5d-b9d7-dd982b16e3bb	\N	f	2 TEETH, MULT RIBS W/ TISSUE; "BABY"	NULL	24	2	NW	30		CIE	2000
ea8c4372-5baa-42db-b103-f58dfef0c68d	5395b520-0632-4a5d-b9d7-dd982b16e3bb	\N	f	HAIR	NULL	24	3	NW		2	CIE	\N
217fb633-8d17-454c-9428-328b2dfc45b8	5395b520-0632-4a5d-b9d7-dd982b16e3bb	\N	f	5 teeth; adult	NULL	24	4	NW	6		MBB	\N
a83cdac7-41ec-4a06-aba2-0908f90abff2	6cdd43c8-123b-443a-9d43-a8485752a4c1	\N	f	5 teeth; adult (some tissue)	NULL	25	1	NW	6		MBB	\N
f92f72b9-e701-4bb0-a92e-99f8131f690d	6cdd43c8-123b-443a-9d43-a8485752a4c1	\N	f	6 teeth; adult	NULL	25	2	NW	6		MBB	\N
9c3be67a-61fa-4dd3-9145-1a89b0b071e9	6cdd43c8-123b-443a-9d43-a8485752a4c1	\N	f	6 rib fragments; child	NULL	25	3	NW	8		MBB	\N
263a3cfb-fd09-4e2e-8d2f-fc788a55c70a	6cdd43c8-123b-443a-9d43-a8485752a4c1	\N	f	6 TEETH	NULL	25	4	NW	3		GM	\N
cded5604-7d9c-40fd-b22f-8a2b2687d4a2	6cdd43c8-123b-443a-9d43-a8485752a4c1	\N	f	10 TEETH, FRAGMENTS, AND MAYBE TISSUE	NULL	25	5	NW	3		GM	\N
8eba8551-52a9-42a9-ab0a-8e53daccd41f	719ddf65-0a14-4e3f-906f-541c0c55daf4	\N	t	7 TEETH	NULL	26	1	NW	3		GM	\N
a13dc833-cd11-4a30-8d24-13288ebb19c2	719ddf65-0a14-4e3f-906f-541c0c55daf4	\N	t	10 TEETH	NULL	26	2	NW	3		GM	\N
a383e8c7-7c0f-466b-a26b-e5c81e15acea	2bf48097-a932-447f-b0f2-08353a36238b	\N	f	FUNGUS	NULL	3	1	NW			CIE	\N
f460ee6d-4af5-4b80-b7bc-92f0f2028b49	\N	\N	f	~14 rib fragments; child	NULL	3	1	NW	5		MBB	\N
1fc0489b-2a57-4b20-b82a-4484bdc26fbe	\N	\N	f	7 SMALLER TEETH, POSSIBLY CHILD OR TEEN	NULL	4	1	NW	12		CIE	\N
144e3a35-e0d7-4610-81b0-05e4214d70ef	\N	\N	f	SKIN ?	NULL	4	2	NW	11		GM	\N
a0e61c57-f773-4844-8b45-bca46e47cd8d	8dcef9c0-a3f3-4a71-ab43-8dc05a671b4d	\N	f	Empty tube with dust residue	NULL	6	1	NW	17		MBB	\N
09524740-9c09-4481-9855-9746239bc954	\N	\N	t	2 teeth; adult	NULL	6	1	NW	5		MBB	\N
b42a76ef-b1d9-4798-94dc-4328b78bd0cc	\N	\N	f	~10 bone fragments (ribs and foot) and tissue; child	NULL	6	2	NW	28		MBB	\N
14775547-cc59-468c-9f14-17d11bba78f2	0f210b25-e1e2-4acc-b9f3-b9c22acae0f2	\N	f	Tissue; UKN	NULL	7	1	NW	5		MBB	\N
fa83ff4a-8d5a-495b-b1be-758c63c9626b	0f210b25-e1e2-4acc-b9f3-b9c22acae0f2	\N	f	Rib fragments; child	NULL	7	2	NW	10		MBB	1998
9c9e7143-81ff-4559-8187-d385126e09ce	\N	\N	f	"Internal"	NULL	7	1	NW	31		AWA	1998
9689e3ac-e1f5-443f-bd62-9851e3d07d0e	\N	\N	f	Ribs; child	NULL	7	2	NW	31		AWA	1998
efcb252b-9983-4392-956e-43b4ae611bbb	\N	2	t	Brain - Femur	NULL	7	3	NW	32		AWA	1998
746dc6a2-da07-4f51-880c-549583feb28d	44cf9aeb-4dab-4a00-a26b-c8fb8e011437	19	t	5 teeth; adult ("Cluster 19")	NULL	8	1	NW	14		MBB	1998
60ca1054-1241-408f-a4cb-1208dc429ffe	\N	19	f	Tissue; UKN ("Cluster 19")	NULL	8	1	NW	14		MBB	1998
af4be8c7-1152-4314-85ce-e94f682b4f6d	\N	19	t	4 rib fragments; sub-adult ("Cluster 19")	NULL	8	2	NW	14		MBB	1998
87d75275-b863-4ad0-be74-988b2ff94a56	\N	\N	f	RIBS AND TEETH- BABY	NULL	8	3	NW	30		GM	2000
d100f98c-79a7-49c9-8b98-95d068abd34e	\N	\N	f	2 TEETH, 3RIB FRAGMENTS; ADULT	NULL	9	1	NW	30		CIE	2000
7f4a8da0-c3e8-431d-aa47-f1ebaf1005e0	\N	\N	f	RIBS AND TEETH	NULL	9	2	NW	30		GM	2000
b3624032-a658-4cf3-bf74-3d044cdf8e02	407c1800-89cf-470d-af38-3309f82dbc71	\N	f	2 TEETH; ADULT W/ TISSUE ATTACHED	NULL	3	1	SE	13		CIE	\N
1f0cedb8-63d7-4dcb-befe-db2bf897bbb6	77913713-5875-4bc4-92c2-4b847a4d68e7	\N	f	10 TEETH; ADULT	NULL	11	1	SE	13		CIE	\N
bb84f5da-164d-4ef3-aa8a-e99d48b1d1f9	8e66dde4-bb2d-48c1-9af4-715cd9ddc960	\N	f	2 teeth; adult	NULL	12	1	SE	4		MBB	\N
9f79e6ab-9051-4992-aa9b-18d112b64f2c	04cf0d10-862a-4f77-9ef7-9cb35bbdf1e2	\N	f	SKIN	NULL	13	1	SE	22		GM	\N
4492e119-64b1-4fd8-bae7-33dab43ef99a	9c636011-3b74-4912-9f8c-df0b5fccb3ab	\N	f	3 rib fragments; adult	NULL	15	1	SE	8		MBB	\N
9493f277-25e5-4017-a4a3-fcbf9e06006d	9c636011-3b74-4912-9f8c-df0b5fccb3ab	\N	f	Skin from foot; UKN	NULL	15	2	SE	25		MBB	\N
b34aa467-079c-4afe-b48c-d134b41be5f3	f9382f1d-4d98-4b09-93f4-5e514a556122	\N	f	Finger or toe nails; UKN	NULL	16	1	SE	25		MBB	\N
84176e36-6731-4717-89cc-36d6848ada2a	a2111a73-8148-4044-a194-9eb8d41722a1	\N	f	Powdered tissue sample	NULL	18	1	SE	17		MBB	\N
04121c9a-2710-4f20-a033-1ca8167daa42	a2111a73-8148-4044-a194-9eb8d41722a1	\N	f	Empty tube with dust residue	NULL	18	2	SE	17		MBB	\N
739bb786-3b45-44f0-92ff-e0dc0b9f349f	a2111a73-8148-4044-a194-9eb8d41722a1	\N	f	Powdered tooth sample	NULL	18	3	SE	21		MBB	\N
1ca0916b-c13e-4aeb-8205-0d4af7b4611d	555d2d94-6ca1-4658-ac79-8fa140d0cfb7	\N	f	Long bone	NULL	19	1	SE	34		AWA	1998
983587fd-d315-4949-af2d-64001013a600	d26af406-3b50-4be4-9f89-e43db65754db	\N	f	MULT RIB FRAGMENTS; INFANT	NULL	20	1	SE	30		CIE	2000
d76695ee-d171-42fd-a8c7-a8240b6f10d4	adbc638a-9792-4282-81b2-14df1d9867f2	\N	f	RIBS- BABY	NULL	21	1	SE	30		GM	2000
baa5fead-6214-428a-98ee-51dac8a17ac0	adbc638a-9792-4282-81b2-14df1d9867f2	\N	f	MULT RIB FRAGMENTS; CHILD	NULL	21	2	SE	30		CIE	2000
9d275d04-cc86-41d4-958c-322cc8e9ead2	9fa3f644-bb19-4306-9639-f71523a7e01a	\N	t	11 TEETH; ADULT	NULL	22	1	SE	13		CIE	\N
89b5786a-d975-4b47-afcc-83e3116a1311	9fa3f644-bb19-4306-9639-f71523a7e01a	\N	f	HAIR	NULL	22	2	SE		1	CIE	\N
8f21b378-e354-446a-8fc1-7c4204bd3ada	9fa3f644-bb19-4306-9639-f71523a7e01a	\N	f	Infant ribs	NULL	22	3	SE	25		AWA	\N
fb264a4c-26c0-428c-a19f-0b020a7c6614	9fa3f644-bb19-4306-9639-f71523a7e01a	\N	f	7 TEETH	NULL	22	4	SE	3		GM	\N
f64918ac-171f-44d4-be1b-90eb44996429	99e73d14-87ab-4774-8723-8a23de10c5e8	\N	f	3 rib fragments; adult	NULL	24	1	SE	8		MBB	\N
4df7e347-ff47-4adc-be0c-fc1121f0d2e6	f1c0d7b9-708b-484f-ae76-73b4197a694d	\N	f	6 TEETH AND MAYBE TISSUE	NULL	26	1	SE	3		GM	\N
0ce7f886-a0b9-47ad-b838-0fcaac7156cc	b309a563-a635-4301-94cc-faba9f06685f	\N	f	4 TEETH AND FRAGMENTS	NULL	27	1	SE	3		GM	\N
5dcfb787-7141-4615-a3ca-0fa245e3881a	b309a563-a635-4301-94cc-faba9f06685f	\N	f	Bone and tissue from foot; UKN	NULL	27	2	SE	26		MBB	\N
82921346-665a-4b39-b395-f4bbd410ad7c	b309a563-a635-4301-94cc-faba9f06685f	\N	f	7 TEETH; ADULT, W/ CROWNS MISSING	NULL	27	3	SE	12		CIE	\N
a64711dd-6cc2-4b56-94b7-758a5ab346b9	42c6465c-dfd2-441f-88a5-8242a1decd4d	\N	f	Powdered brain sample	NULL	28	1	SE	21		MBB	\N
971a374f-332a-48a3-99bd-ccc8be2bd08a	42c6465c-dfd2-441f-88a5-8242a1decd4d	20	f	2 rib fragments; sub-adult ("Cluster 20")	NULL	28	2	SE	35		MBB	1998
fbf8eb25-87e5-4cf1-94da-588ae2f7e4e6	42c6465c-dfd2-441f-88a5-8242a1decd4d	20	f	5 teeth; adult ("Cluster 20")	NULL	28	3	SE	35		MBB	1998
14d9fe62-4568-4e64-ab36-4ddf3f151605	42c6465c-dfd2-441f-88a5-8242a1decd4d	20	f	Tissue; UKN ("Cluster 20")	NULL	28	4	SE	35		MBB	1998
4f5fabe9-3038-4c4e-ae3f-6667b54db4c6	3da8b8f3-e50c-47a7-85cf-1e33a081374d	25	f	Teeth and skin; UKN	NULL	29	1	SE	31		AWA	1998
bef8c4e5-bb61-4891-b1e8-f745b1542797	3da8b8f3-e50c-47a7-85cf-1e33a081374d	3	f	Long bone and teeth; adult	NULL	29	2	SE	32		AWA	1998
db6e07b5-d988-4a62-a7b5-50549cfd7f0c	a5797565-b719-47f2-9f2e-f430af02e263	17	f	Bone, skin, and teeth; adult	NULL	30	1	SE	34		AWA	1998
9d57ea0c-24c4-423c-9902-a9e73e66f657	a5797565-b719-47f2-9f2e-f430af02e263	\N	f	RIBS	NULL	30	2	SE	30		GM	2000
def0ea14-8530-4335-8137-8203f381a50b	a5797565-b719-47f2-9f2e-f430af02e263	\N	f	7 RIB FRAG, 1 TOOTH, ULNA FRAG; CHILD	NULL	30	3	SE	30		CIE	2000
65c8be03-3114-410e-9a6e-2ff3127489bb	651a0614-27f9-4454-ba5f-1c79a895fabc	\N	f	RIBS AND TEETH (HEADWEST)	NULL	31	1	SE	30		GM	2000
c942fe69-a899-4386-bc73-8486053d4bd9	cda5baa9-e271-4c3c-84c2-8064c129afbd	\N	f	2 TEETH, 3 RIB FRAGMENTS, ADULT	NULL	32	1	SE	30		CIE	2000
210b2d72-d099-4ee9-9d4f-7d3d03b0e246	69b645c6-3923-482b-9cdd-82f0a371a96b	\N	f	2 TEETH; ADULT	NULL	33	1	SE	13		CIE	\N
6bd10f53-b6ad-4211-bcca-4bf788a3668c	69b645c6-3923-482b-9cdd-82f0a371a96b	\N	f	HAIR	NULL	33	2	SE		1	CIE	\N
67bf087b-4d7d-469c-bec3-8a98b472921a	639b108f-441d-42da-b70c-8c8ad5c82b59	\N	f	Skin from ankle; UKN	NULL	34	1	SE	25		MBB	\N
b8833d78-4514-4def-8d7c-0e142d0c1330	785cd5cc-6ccf-4805-85cc-f7e6f09c2f52	\N	f	13 TEETH AND FAGMENTS	NULL	36	1	SE	3		GM	\N
b8477a44-472e-48e4-9ed7-399d37ac546c	785cd5cc-6ccf-4805-85cc-f7e6f09c2f52	\N	f	11 teeth; adult	NULL	36	2	SE	5		MBB	\N
844d4d30-c635-4d5c-a2d1-c1a2fc0c7221	8b09b01d-e37c-4013-bfb2-21550f998a2d	\N	t	Tooth "M14"	NULL	39	1	SE	18		AWA	\N
66ee4f0b-20c7-4bec-bc91-c0e89a7621be	8b09b01d-e37c-4013-bfb2-21550f998a2d	18	f	Tissue; UKN ("Cluster 18")	NULL	39	2	SE	14		MBB	1998
7f5b2b1e-7f64-42b5-9c56-c9ce9b7c0463	8b09b01d-e37c-4013-bfb2-21550f998a2d	17	f	Tissue from pelvic area	NULL	39	3	SE	34		AWA	1998
a66dd1bd-a989-4722-a27c-4eefa224242e	8b09b01d-e37c-4013-bfb2-21550f998a2d	\N	f	RIBS AND TEETH	NULL	39	4	SE	30		GM	2000
aa2f65f4-9ec4-40d7-b8fa-6d611cbe4c8a	8b09b01d-e37c-4013-bfb2-21550f998a2d	\N	f	Eye orbit; UKN	NULL	39	5	SE	24		MBB	\N
2f1e67c5-9628-4f08-853d-385a9b4aa819	8b09b01d-e37c-4013-bfb2-21550f998a2d	\N	f	("Flowers?? Over face") - written on tube	NULL	39	6	SE	5		MBB	\N
696abf12-71d4-4025-bcce-f3f8311b8667	8b09b01d-e37c-4013-bfb2-21550f998a2d	\N	f	Ribs; child	NULL	39	7	SE	25		AWA	\N
ff16a3b0-afae-4ec7-bd5c-c4f5c73bcfd3	daeab445-316a-4126-b293-90801b9c7095	\N	f	Ribs; child	NULL	40	1	SE	25		AWA	\N
aa4e1ee6-8a1e-469e-8a6d-f855196d0ac1	daeab445-316a-4126-b293-90801b9c7095	\N	f	2 bone fragments; UKN	NULL	40	2	SE	5		MBB	\N
cfd1ad01-9bf5-412d-890d-47f2655205cf	daeab445-316a-4126-b293-90801b9c7095	\N	f	5 rib fragments and tissue; child	NULL	40	3	SE	16		MBB	\N
e49e624f-29e5-41e4-906f-7171b714f585	daeab445-316a-4126-b293-90801b9c7095	\N	f	Tissue sample	NULL	40	4	SE	17		MBB	\N
3064dd6d-a947-49cc-8d96-61f07b0af3ac	daeab445-316a-4126-b293-90801b9c7095	18	f	Bone fragment; UKN ("Cluster 18")	NULL	40	5	SE	14		MBB	1998
2dd5add7-eb9a-485e-8b9a-663f675c6c18	d0730ae9-188d-4f93-b182-83556e89fcb1	23	f	Lung	NULL	41	1	SE	34		AWA	1998
3d69954e-d7a3-4f90-8873-6ba9de78f987	d0730ae9-188d-4f93-b182-83556e89fcb1	23	f	Rib/skin	NULL	41	2	SE	34		AWA	1998
96b784bd-d5da-44b3-af91-bc1dd09e8386	d0730ae9-188d-4f93-b182-83556e89fcb1	\N	f	2 TEETH, 5 RIB FRAGMENTS; ADULT	NULL	41	3	SE	30		CIE	2000
3d8db4e9-f1a7-49ff-b54d-1d38a34d8970	d0730ae9-188d-4f93-b182-83556e89fcb1	\N	f	15 YR OLD GIRL- RIBS AND TEETH	NULL	41	4	SE	30		GM	2000
fb1d40c2-5ff9-43db-a4ac-f93891ce5773	2d765fea-7137-44c0-8185-8a38029f06d1	\N	f	Broken ribs pieces	NULL	52	1	SE	25		AWA	\N
5db352c5-b678-432e-8c98-4645754865ec	8283b0b2-1c77-4408-95c6-14361a4ed399	\N	f	MISC. TISSUE	NULL	53	1	SE	22		GM	\N
041fb12b-c7df-4a7d-b337-141870b2c11e	8283b0b2-1c77-4408-95c6-14361a4ed399	\N	t	1 tooth; adult	NULL	53	2	SE	6		MBB	\N
6c6e73a1-25d4-444e-bafa-41ec9fc9ed0f	8283b0b2-1c77-4408-95c6-14361a4ed399	\N	f	~5 broken teeth and fragments; adult	NULL	53	3	SE	6		MBB	\N
69e0b699-3607-4209-8a02-5f6918319ea9	\N	\N	f	~4 bone fragments (finger); adult	NULL	1	1	SE	25		MBB	\N
b41f4fb7-8f7b-43f9-9e28-bf84f7080c16	\N	\N	f	Tissue sample	NULL	1	2	SE	17		MBB	\N
0663373e-64fb-4ece-a1da-eed816598b3e	\N	\N	t	TOOTH-RC	NULL	1	3	SE	11		GM	\N
881689d6-3860-422d-a0c5-edfc93f78f14	\N	\N	f	8 rib fragments; child	NULL	1	4	SE	14		MBB	\N
4a556d57-5a2b-4f47-9027-a518e1c45b19	\N	\N	f	5 broken teeth and fragments; scalp and hair; child	NULL	5	1	SE	26		MBB	\N
ca704f4c-adb9-43e1-bc1a-d785346e553b	\N	\N	f	2 bones; 6 teeth; adult	NULL	5	2	SE	14		MBB	\N
b227f6c9-e777-4e51-939e-5723b40218eb	\N	2	f	Lung tissue	NULL	5	3	SE	32		AWA	1998
00cc1031-0b05-4099-8304-e022c5a44fe3	\N	23	f	Teeth and skin; adult	NULL	7	1	SE	34		AWA	1998
82830d81-89a7-4908-bb36-29f9686c50d1	6ce9c973-c6d8-4c18-a505-9bd3a38523ad	4	f	Bone fragment; UKN ("Cluster 4")	NULL	10	1	SE	35		MBB	1998
aff2304f-aefb-40a0-b79b-f423f5ab1d3f	6ce9c973-c6d8-4c18-a505-9bd3a38523ad	4	f	Tissue; UKN ("Cluster 4")	NULL	10	2	SE	18		MBB	1998
4dbb6bae-845f-4b61-be65-cdfc49dfe5c6	6ce9c973-c6d8-4c18-a505-9bd3a38523ad	\N	f	3 RIBS AND 3 TEETH; ADULT	NULL	10	3	SE	30		CIE	2000
c6a63ed5-a6e0-4ca9-a0db-8f544fe70b8d	77913713-5875-4bc4-92c2-4b847a4d68e7	\N	f	2 TEETH, 1 RIB; ADULT	NULL	11	1	SE	29		CIE	2000
288787d4-5728-4ec5-a7d1-9ec3794d0545	77913713-5875-4bc4-92c2-4b847a4d68e7	\N	f	RIB AND TWO TEETH	NULL	11	2	SE	29		GM	2000
3652d713-bcb8-4522-85af-1e5f9d9c13ec	77913713-5875-4bc4-92c2-4b847a4d68e7	\N	f	3 RIB FRAGMENTS; ADULT "OLD MAN"	NULL	11	3	SE	30		CIE	2000
23b603fc-3438-4975-87eb-b01f8aace31b	8e66dde4-bb2d-48c1-9af4-715cd9ddc960	\N	f	4 teeth; adult	NULL	12	1	SE	8		MBB	\N
174f363a-e82f-4c59-84ba-4bf9cc6ecea9	8e66dde4-bb2d-48c1-9af4-715cd9ddc960	\N	f	1 TOOTH; ADULT	NULL	12	2	SE	12		CIE	\N
2a9eee80-c75c-41d2-9b36-7344989dffc8	04cf0d10-862a-4f77-9ef7-9cb35bbdf1e2	\N	f	10 teeth; adult	NULL	13	1	SE	13		MBB	\N
bd9b6b48-7ae1-4ca4-927e-d3108a55635d	04cf0d10-862a-4f77-9ef7-9cb35bbdf1e2	\N	t	2 teeth; adult	NULL	13	2	SE	5		MBB	\N
acdcbce4-eed2-4f2f-8bad-6edd53639832	a81be35e-2042-4340-a1b5-b56e40e630bf	\N	f	7 teeth; child?	NULL	14	1	SE	1		AWA	\N
1ddc6e75-6779-486d-9e96-c63f34854f24	9c636011-3b74-4912-9f8c-df0b5fccb3ab	\N	f	HAIR	NULL	15	1	SE	22		GM	\N
1a7ff5dd-0f00-4336-9df5-3949b28e72c9	9c636011-3b74-4912-9f8c-df0b5fccb3ab	\N	f	TISSUE INSIDE EYE	NULL	15	2	SE		3	CIE	\N
670d2c64-0065-4e11-ae19-b97340408046	9c636011-3b74-4912-9f8c-df0b5fccb3ab	\N	f	MANDIBLE W/ TEETH; ADULT	NULL	15	3	SE			CIE	\N
967a62c4-699c-44ea-b2d5-51c7e5a8ff60	5b14bf08-c716-452f-b497-6ed887f13e1b	2	f	Skin	NULL	17	1	SE	32		AWA	1998
cb80a8d1-8855-4f9a-83d0-04f241440ca5	a2111a73-8148-4044-a194-9eb8d41722a1	2	t	2 teeth; adult	NULL	18	1	SE	32		AWA	1998
5d2eab1a-1226-4e3b-a95b-d9702bcc9af4	555d2d94-6ca1-4658-ac79-8fa140d0cfb7	4	f	Bone fragment; UKN ("Cluster 4"	NULL	19	1	SE	18		MBB	1998
3231b607-9d86-43be-9d71-c71381c434d2	555d2d94-6ca1-4658-ac79-8fa140d0cfb7	4	f	4 teeth; adult ("Cluster 4")	NULL	19	2	SE	18		MBB	1998
fa232a91-5c32-4514-95cf-8ede947387e5	555d2d94-6ca1-4658-ac79-8fa140d0cfb7	\N	f	RIBS- OLD MAN	NULL	19	3	SE	30		GM	2000
51e2e954-cf04-47f3-8af5-f96d6c9afe90	\N	\N	f	UNK, INTACT ARM OR LEG BONE, 5 RIB FRAGMENTS, 3 TEETH, CHILD	NULL	2	1	SE	29		CIE	2000
9affe8ce-b75b-4c0c-8583-b3020e955b85	\N	\N	f	RIBS- PRECHRISTIAN	NULL	2	2	SE	29		GM	2000
7d5caa85-0192-424f-8a84-5fb1d5a1ccdf	aa25e4fd-c41c-4f74-963b-f077a104bad8	\N	f	7 TEETH- CHILD	NULL	2	1	SE	3		GM	\N
de9d6ba7-2232-4906-9548-4132f1ee4190	aa25e4fd-c41c-4f74-963b-f077a104bad8	\N	f	MISC. TISSUE	NULL	2	2	SE	22		GM	\N
a34f4e36-bf16-4f07-971d-b0cd7e7be436	d26af406-3b50-4be4-9f89-e43db65754db	\N	f	6 rib fragments; sub-adult	NULL	20	1	SE	14		MBB	\N
f0e6d9a5-dbb4-4221-b756-f375642e3a83	d26af406-3b50-4be4-9f89-e43db65754db	\N	f	Scalp and hair; UKN	NULL	20	2	SE	26		MBB	\N
6b4e43b8-f806-4ee5-9bc5-7f409abd53e8	d26af406-3b50-4be4-9f89-e43db65754db	6	f	2 teeth; adult ("Cluster 6")	NULL	20	3	SE	18		MBB	1998
79e70fbe-4c6c-4caa-94e2-c4c81dd8bd52	adbc638a-9792-4282-81b2-14df1d9867f2	23	t	Skin, bones, teeth; adult	NULL	21	1	SE	34		AWA	1998
d2c3ef21-1525-47c5-bf2b-1d4d64598867	9fa3f644-bb19-4306-9639-f71523a7e01a	7	f	5 teeth and tissue; adult ("Cluster 7")	NULL	22	1	SE	35		MBB	1998
4a471fac-504e-45f5-900d-85e77bb1078b	9fa3f644-bb19-4306-9639-f71523a7e01a	\N	f	2 TEETH, 2 RIBS; ADULT	NULL	22	2	SE	29		CIE	2000
d11a71f2-7ca6-497f-8ab7-a70c76762410	9fa3f644-bb19-4306-9639-f71523a7e01a	\N	f	RIBS AND TEETH	NULL	22	3	SE	29		GM	2000
dc387162-9ee8-45c2-9e57-b289c4933f31	99e73d14-87ab-4774-8723-8a23de10c5e8	\N	f	3 TEETH 2 RIB FRAGMENTS; ADULT	NULL	24	1	SE	30		CIE	2000
d3901306-6d9b-4b6c-bbfe-eabe84f770f3	99e73d14-87ab-4774-8723-8a23de10c5e8	\N	f	RIBS AND TEETH	NULL	24	2	SE	30		GM	2000
caff0658-e10c-4457-8160-c4ed6c8e9957	db005f2d-d39d-4f4e-b9e6-3d952730ff11	\N	t	4 TEETH AND FRAGMENTS	NULL	25	1	SE	3		GM	\N
b26f9c19-97c9-4e27-9b31-bd2ff788afa2	db005f2d-d39d-4f4e-b9e6-3d952730ff11	\N	f	4 teeth; adult	NULL	25	2	SE	6		MBB	\N
916dead3-522a-4cda-a225-56a22c35c719	db005f2d-d39d-4f4e-b9e6-3d952730ff11	\N	f	2 bones (foot) and tissue; UKN	NULL	25	3	SE	16		MBB	\N
db95e8e4-ff94-4bff-8c78-09a3427c9e7e	db005f2d-d39d-4f4e-b9e6-3d952730ff11	\N	f	11 teeth; adult	NULL	25	4	SE	9		MBB	\N
51da3237-b5b4-4bab-820d-c28a44f22ffe	db005f2d-d39d-4f4e-b9e6-3d952730ff11	\N	f	6 TEETH; ADULT W/ TISSUE	NULL	25	5	SE	12		CIE	\N
395a4ce6-f556-4fe9-9a7c-dc7ee85eaeb1	f1c0d7b9-708b-484f-ae76-73b4197a694d	\N	f	~6 rib fragments; adult	NULL	26	1	SE	14		MBB	\N
2400fd22-c220-481a-8616-e39ef68eb4d3	f1c0d7b9-708b-484f-ae76-73b4197a694d	\N	t	10 teeth; adult	NULL	26	2	SE	1		AWA	\N
25ac7cc9-c9bf-4e4f-b517-f1fb07e9e245	f1c0d7b9-708b-484f-ae76-73b4197a694d	6	f	Bone fragments from foot; adult ("Cluster 6")	NULL	26	3	SE	18		MBB	1998
1178fd29-65be-421a-98a2-fe4f91554f96	b309a563-a635-4301-94cc-faba9f06685f	15	f	Rib and fungus	NULL	27	1	SE	31		AWA	1998
3e964ed6-c4c4-4dfc-87c5-86dd2b7caa42	b309a563-a635-4301-94cc-faba9f06685f	15	f	Hair and Scalp	NULL	27	2	SE	31		AWA	1998
791639c3-4ec9-4ed9-a5ae-3b7859404f32	42c6465c-dfd2-441f-88a5-8242a1decd4d	9	f	Brain	NULL	28	1	SE	33		AWA	1998
1369f892-4531-4640-ae9a-1e20c80d0702	\N	9	f	Rib; UKN	NULL	28	1	SE	33		AWA	1998
73100936-a869-4810-8d0a-f3840c811762	42c6465c-dfd2-441f-88a5-8242a1decd4d	9	f	"Internal - lung?	NULL	28	1	SE	32		AWA	1998
71d76955-f254-4fd2-b1c2-3789fa17ce8c	42c6465c-dfd2-441f-88a5-8242a1decd4d	9	t	3 teeth; adult	NULL	28	2	SE	32		AWA	1998
8abff871-c5c7-4e56-bf82-de5992e2e12a	3da8b8f3-e50c-47a7-85cf-1e33a081374d	9	f	Ribs and skin	NULL	29	1	SE	32		AWA	1998
1cb361c2-ef0f-44d3-9f6b-711e6fa07ed8	3da8b8f3-e50c-47a7-85cf-1e33a081374d	\N	f	3 RIB FRAGMENTS, 2 TEETH; ADULT	NULL	29	2	SE	30		CIE	2000
03c821a8-a154-4975-8f3e-78f19a7bfd15	3da8b8f3-e50c-47a7-85cf-1e33a081374d	\N	f	RIBS AND TEETH	NULL	29	3	SE	30		GM	2000
0c43aad9-b6e6-4740-8bbf-9ecc0462b041	3da8b8f3-e50c-47a7-85cf-1e33a081374d	\N	f	UNK NUMBER OF TEETH, ADULT, FRAGMENTED AND DECAYED	NULL	29	4	SE	12		CIE	\N
4037004d-cd72-473d-873f-5dc8f14e51e9	a5797565-b719-47f2-9f2e-f430af02e263	\N	t	13 teeth; adult	NULL	30	1	SE	1		AWA	\N
e569d822-4f82-4d51-928f-a23fb026f732	a5797565-b719-47f2-9f2e-f430af02e263	15	t	Teeth; UNK	NULL	30	2	SE	31		AWA	1998
bc458973-6938-461f-ab68-1f48692c5c9c	a5797565-b719-47f2-9f2e-f430af02e263	\N	f	Skull membrane	NULL	30	3	SE	31		AWA	1998
75f0470d-0afb-4d04-9b96-b26f4d3fa4d1	a5797565-b719-47f2-9f2e-f430af02e263	\N	f	Ribs; child	NULL	30	4	SE	31		AWA	1998
0cd11f65-60dd-4d63-aa61-04a7faacb06d	a5797565-b719-47f2-9f2e-f430af02e263	\N	f	LONG BONE AND TEETH	NULL	30	5	SE		6	GM	1998
f61b3f0e-3ad5-4d55-bbc0-4f2e15208297	a5797565-b719-47f2-9f2e-f430af02e263	2	f	Unknown bones	NULL	30	6	SE	31		AWA	1998
f8fc93dd-eb81-4c3c-8724-a89152e320fa	a5797565-b719-47f2-9f2e-f430af02e263	21	f	Bone fragments; adult or sub-adult ("Cluster 21")	NULL	30	7	SE	35		MBB	1998
f19f6c74-808f-4dc3-be34-4ce1ddf00a33	a5797565-b719-47f2-9f2e-f430af02e263	\N	f	RIBS AND TEETH	NULL	30	8	SE	29		GM	2000
9feb1a07-5a3c-4450-8669-0542e556d7f3	651a0614-27f9-4454-ba5f-1c79a895fabc	\N	f	"HIFFI SI LINEN"	NULL	31	1	SE		3	CIE	34442
8356a86a-620a-4a63-901f-457c49b465df	651a0614-27f9-4454-ba5f-1c79a895fabc	\N	f	2 TEETH AND A TUBE LABELED "CONTEMP TOOTH"	NULL	31	2	SE	23		GM	35386
9593dc31-37f6-49d1-b59a-3d05b7b6a8e0	cda5baa9-e271-4c3c-84c2-8064c129afbd	\N	f	Child rib	NULL	32	1	SE	25		AWA	\N
a94712ef-00b7-4359-b6b4-2a95ca387fe5	cda5baa9-e271-4c3c-84c2-8064c129afbd	\N	f	HAIR	NULL	32	2	SE	22		GM	\N
72d868ac-1af3-42d4-92e2-885f00cceb3c	cda5baa9-e271-4c3c-84c2-8064c129afbd	\N	f	4 TEETH; ADULT W/ TISSUE AND BROKEN	NULL	32	3	SE	12		CIE	\N
410b43a6-fdbe-43f9-a3dd-b5f6a88c42eb	cda5baa9-e271-4c3c-84c2-8064c129afbd	\N	f	SKIN ?- RC	NULL	32	4	SE	11		GM	\N
bcf3a8a4-ae06-46d7-93eb-b833c3929d9f	cda5baa9-e271-4c3c-84c2-8064c129afbd	21	t	Humerus fragment; child ("Cluster 21")	NULL	32	5	SE	18		MBB	1998
29688497-a477-410b-8af7-1c75bb92fb35	69b645c6-3923-482b-9cdd-82f0a371a96b	21	f	Tissue from ribs; UKN ("Cluster 21")	NULL	33	1	SE	18		MBB	1998
6c6afc3c-cc4a-4d53-a453-06c9c61cc8d2	69b645c6-3923-482b-9cdd-82f0a371a96b	21	f	Tissue; UKN ("Cluster 21")	NULL	33	2	SE	18		MBB	1998
367c294d-d5d9-4e87-a8d2-87e25ebc7bb1	69b645c6-3923-482b-9cdd-82f0a371a96b	7	f	Lung tissue; UKN ("Cluster 7")	NULL	33	3	SE	35		MBB	1998
06e7e801-3128-4433-bebd-c7df47ea6eca	2a43a395-c2b3-4182-a5a2-5258e68dc49a	\N	f	RIBS, UNK LONG BONE; INFANT	NULL	35	1	SE	30		CIE	36578
3c25e96d-36e3-42b2-a3c6-4c503affe18d	2a43a395-c2b3-4182-a5a2-5258e68dc49a	\N	f	RIBS	NULL	35	2	SE	30		GM	36578
2d3e3a3e-e1e9-4659-9fae-7a6cfffcc381	2a43a395-c2b3-4182-a5a2-5258e68dc49a	\N	f	Child ribs	NULL	35	3	SE	25		AWA	\N
743d5a94-9187-44d6-b5f4-a6a52d05a362	2a43a395-c2b3-4182-a5a2-5258e68dc49a	\N	f	4 teeth; adult	NULL	35	4	SE	4		MBB	\N
7f11be59-dfa7-4f40-8266-c4d260dc8c35	2a43a395-c2b3-4182-a5a2-5258e68dc49a	\N	f	7 bone (toes); adult	NULL	35	5	SE	16		MBB	\N
2b9d852c-8ea8-4f5a-abde-f8aec52f169e	2a43a395-c2b3-4182-a5a2-5258e68dc49a	\N	f	6 TEETH AND BONE FRAGMENT; ADULT, ONE TOOTH BROKEN	NULL	35	6	SE	12		CIE	\N
4bc980c4-d53b-4c52-aeeb-f8fd42e5da39	785cd5cc-6ccf-4805-85cc-f7e6f09c2f52	\N	f	1 rib fragment; adult	NULL	36	1	SE	14		MBB	\N
0a7a280f-a22d-4d1b-a46f-3cd443330ddb	785cd5cc-6ccf-4805-85cc-f7e6f09c2f52	\N	f	1 bone fragment and 3 tubes with bone dust and chips; UKN ("SOHAG") written on bag	NULL	36	2	SE		5	MBB	1993
89aa7d22-3f6a-43d7-a02c-a4150c3eefb9	785cd5cc-6ccf-4805-85cc-f7e6f09c2f52	2	f	Tibia	NULL	36	3	SE	31		AWA	1998
288f2f41-7666-4772-b4b4-47bb130a6c7f	549fdf53-8807-4ed5-8019-955ed01c8823	25	f	"Not tooth or bone"; tissue	NULL	37	1	SE	35		AWA	1998
79da0f5c-d93a-4205-927f-777e44048a57	549fdf53-8807-4ed5-8019-955ed01c8823	\N	f	Powdered tooth; "NCNA 2 gm"	NULL	37	2	SE	34		AWA	36647
071c25aa-1da8-45f1-a2b7-f64704705c1f	549fdf53-8807-4ed5-8019-955ed01c8823	\N	f	BONE POWDER	NULL	37	3	SE	23		GM	36797
034ef3ce-d302-49bc-932f-17c1257faf55	549fdf53-8807-4ed5-8019-955ed01c8823	\N	f	5 bones from foot and tissue; adult	NULL	37	4	SE	27		MBB	\N
e4b26cd5-ff09-4d2a-afc3-5234180c3088	549fdf53-8807-4ed5-8019-955ed01c8823	\N	t	2 teeth; adult	NULL	37	5	SE	5		MBB	\N
3c5645d9-8352-4255-b068-b9f1f5f3654d	608b7610-08ee-48bf-a265-22b178b1c1c5	20	f	Bone fragment; UKN ("Cluster 20")	NULL	38	1	SE	14		MBB	1998
bc5c7158-5412-43d5-9529-e5a40b80db4d	608b7610-08ee-48bf-a265-22b178b1c1c5	25	f	Tissue	NULL	38	2	SE	35		AWA	1998
6b8e183b-1138-41a3-a2a1-50d1990c92a2	608b7610-08ee-48bf-a265-22b178b1c1c5	25	f	Bone	NULL	38	3	SE	35		AWA	1998
3512f061-1620-4b05-a662-a366ba595302	608b7610-08ee-48bf-a265-22b178b1c1c5	\N	f	Powder	NULL	38	4	SE	7		GM	36808
5107d192-634e-4da6-81ea-f7723a158763	608b7610-08ee-48bf-a265-22b178b1c1c5	\N	f	BONE POWDER	NULL	38	5	SE	23		GM	36823
2eeed525-eeb7-41d3-a3a8-733afb8a18e6	608b7610-08ee-48bf-a265-22b178b1c1c5	\N	f	Powdered tissue sample	NULL	38	6	SE	21		MBB	\N
1b931157-bdf2-4c59-af82-cbf8733661c4	8b09b01d-e37c-4013-bfb2-21550f998a2d	8	f	Lung	NULL	39	1	SE	32		AWA	1998
e5a1e85c-d337-42e7-a276-5510915624ba	8b09b01d-e37c-4013-bfb2-21550f998a2d	8	t	"teeth - molars - + ind. 2 incisors +++"	NULL	39	2	SE	32		AWA	1998
d893349f-32ed-4e38-95d7-7c15cd10bd73	8b09b01d-e37c-4013-bfb2-21550f998a2d	9	f	Skin	NULL	39	3	SE	32		AWA	1998
520be4d8-f33a-41e8-a539-f26bd513f32e	6a450667-c50c-41a5-88d1-5a2444b9c71d	9	f	Skin	NULL	4	1	SE	32		AWA	1998
1fafaeb0-1711-4501-a063-783341d49331	d0730ae9-188d-4f93-b182-83556e89fcb1	\N	f	RIBS AND INTERNAL SAMPLE	NULL	41	1	SE		6	GM	1998
2b0a49d7-048a-45a8-85f7-7422b338637e	d0730ae9-188d-4f93-b182-83556e89fcb1	\N	f	4 TEETH, 5 RIBS; CHILD	NULL	41	2	SE	30		CIE	36874
1d84f791-4099-4a25-97ca-94b44e2f47e1	b2126e35-0136-471f-8943-04db3ffcd0f5	\N	f	BONE POWDER	NULL	42	1	SE	23		GM	37020
bc2ee182-c650-4714-a3b0-015c5f019690	b2126e35-0136-471f-8943-04db3ffcd0f5	\N	f	BONE POWDER	NULL	42	2	SE	23		GM	37020
58feee78-285a-494c-a5c3-edd92c542314	b2126e35-0136-471f-8943-04db3ffcd0f5	\N	f	BONE POWDER	NULL	42	3	SE	23		GM	37020
e01d3da1-c9dc-4396-bea2-ca9f9133ea8f	33b0e82d-7378-4ac3-8f21-4c3ac05e3557	\N	f	Ribs, vertebrae, skin, teeth; child	NULL	43	1	SE	19		MBB	\N
1b0bda62-82a8-4c1d-b941-23c4b84a84ee	33b0e82d-7378-4ac3-8f21-4c3ac05e3557	\N	t	2 teeth; child	NULL	43	2	SE	5		MBB	\N
0b94d574-b670-4dfd-a933-eba4e7a28b78	33b0e82d-7378-4ac3-8f21-4c3ac05e3557	\N	f	~5 broken teeth; fragment of textile; child	NULL	43	3	SE	5		MBB	\N
ad084605-0e6b-4e0d-b468-f1053f1808d7	55c75c79-31ab-4439-9368-244d60a71446	8	t	Skin - femur	NULL	44	1	SE	32		AWA	1998
b56785af-19aa-4e9b-b8c0-01fa7870dd77	55c75c79-31ab-4439-9368-244d60a71446	8	f	Skin - mouth	NULL	44	2	SE	32		AWA	1998
1d120eab-154e-4299-9cc2-984917af7b01	55c75c79-31ab-4439-9368-244d60a71446	16	f	Humerus	NULL	44	3	SE	31		AWA	1998
5d51be02-9d17-4ff9-a55d-795cb69a8405	55c75c79-31ab-4439-9368-244d60a71446	16	f	Skin - mandible	NULL	44	4	SE	31		AWA	1998
37b542a5-5e6e-4027-a060-213478cedcb2	55c75c79-31ab-4439-9368-244d60a71446	\N	f	Vertebrae - Tibia	NULL	44	5	SE	31		AWA	1998
c04eeed2-ab2d-4e7c-a50a-fd098bc079ed	55c75c79-31ab-4439-9368-244d60a71446	25	f	Teeth, brain, skin, bone; adult	NULL	44	6	SE	35		AWA	1998
f5b8751a-e0b9-4d4b-b1ad-0e496f17acd4	55c75c79-31ab-4439-9368-244d60a71446	\N	f	BONE POWDER	NULL	44	7	SE	23		GM	37020
9d6e7876-9b2d-4999-b0d2-f3e1a82fb983	55c75c79-31ab-4439-9368-244d60a71446	\N	f	BONE POWDER	NULL	44	8	SE	23		GM	37020
fe64cf41-9a24-4b49-9346-269370a3e168	d9fac7e4-879a-4b14-b068-e016797e6742	\N	f	POWDER	NULL	45	1	SE	23		GM	37020
fb53114e-2387-4959-b400-1b593b846a58	d9fac7e4-879a-4b14-b068-e016797e6742	\N	f	BONE POWDER	NULL	45	2	SE	23		GM	37527
fbf04088-ab4e-4004-b372-64673c6ef5d5	d9fac7e4-879a-4b14-b068-e016797e6742	\N	t	~13 broken teeth and fragments; adult	NULL	45	3	SE	6		MBB	\N
abc4cb8b-1d0b-4f09-adf7-a127c2492be6	c2211a2d-1e81-4699-80e0-ecb84c2d8908	20	f	1 tooth, bone fragment and tissue; child ("Cluster 20")	NULL	46	1	SE	14		MBB	1998
89912675-7f0f-4bf1-9182-539bae3b80c9	8dbdedcf-8b90-46dd-bef7-d540bd0deac0	20	f	1 bone; UKN ("Cluster 20")	NULL	47	1	SE	14		MBB	1998
b9da8ef9-6145-419b-93f1-0051c2268242	8dbdedcf-8b90-46dd-bef7-d540bd0deac0	26	f	Teeth and rib; child (?)	NULL	47	2	SE	31		AWA	1998
f33d6028-993c-4fc8-8aac-8e2599f8ef2e	8dbdedcf-8b90-46dd-bef7-d540bd0deac0	\N	f	Child ribs	NULL	47	3	SE	25		AWA	\N
07e3291f-4ce8-449c-911f-eddf897cd770	8dbdedcf-8b90-46dd-bef7-d540bd0deac0	\N	t	8 TEETH- CHILD	NULL	47	4	SE	3		GM	\N
819908ee-ee32-4f6d-82ef-9c9f1b00cd1d	cf72a138-d3cd-45d6-bf04-7d9bb572860a	\N	f	8 TEETH, ADULT, SOME BROKEN	NULL	48	1	SE	12		CIE	\N
2333742c-3bab-45f0-9f14-21244a32e656	cf72a138-d3cd-45d6-bf04-7d9bb572860a	\N	f	Empty tube with dust residue	NULL	48	2	SE	17		MBB	\N
4d01518d-0538-495a-bb65-414123563108	cf72a138-d3cd-45d6-bf04-7d9bb572860a	\N	t	1 tooth; child	NULL	48	3	SE	21		MBB	\N
48eed0c0-6c10-4a77-b462-292d73ff8288	cf72a138-d3cd-45d6-bf04-7d9bb572860a	\N	f	Powdered tooth sample	NULL	48	4	SE	21		MBB	\N
51bd0499-4fe2-4bfe-a532-8b682c56e735	aadeb217-eaae-4d3b-868a-5fbbec25e091	7	f	Humerus fragment; 2 teeth; tissue from brain; adult ("Cluster 7")	NULL	49	1	SE	35		MBB	1998
8337c18c-c61d-4b0d-9fad-5e67ebea9659	\N	20	f	1 tooth, vertebra and bone fragment; child ("Cluster 20")	NULL	5	1	SE	14		MBB	1998
44c43806-d235-418e-b2a7-bc0b43831909	83a35520-6089-4c75-9273-c0c41f9660c7	26	t	Skin, bones; UKN	NULL	50	1	SE	35		AWA	1998
469e3d77-4486-49bb-a223-ef0207e8a968	83a35520-6089-4c75-9273-c0c41f9660c7	\N	f	LONG BONE	NULL	50	2	SE		6	GM	1998
798c73a9-2f89-49a3-8542-4c299573d458	83a35520-6089-4c75-9273-c0c41f9660c7	26	f	Scapula (?) and skin	NULL	50	3	SE	31		AWA	1998
d4220289-cfc7-454a-ae4c-0c2d3ea80ef7	83a35520-6089-4c75-9273-c0c41f9660c7	\N	f	SKIN, MUSCLES AND RIBS	NULL	50	4	SE		8	GM	0
4444bbaa-d4c6-4a82-ac42-c2a9a8a40be2	83a35520-6089-4c75-9273-c0c41f9660c7	\N	f	3 rib fragments; adult	NULL	50	5	SE	14		MBB	\N
4c56e969-7624-4161-9c47-1645c9fae320	2d765fea-7137-44c0-8185-8a38029f06d1	\N	f	5 teeth; adult	NULL	52	1	SE	1		AWA	\N
6d25aea0-0c16-48c4-9e79-b1d30a92bbcc	8283b0b2-1c77-4408-95c6-14361a4ed399	\N	f	SKELETON #1 VERTEBRAE	NULL	53	1	SE	23		GM	\N
88002cf7-c396-46ad-8dcf-32cd5a582d3c	8283b0b2-1c77-4408-95c6-14361a4ed399	\N	f	"CAT #1", TISSUE	NULL	53	2	SE	29		CIE	\N
bc4f01f6-3081-4f5e-9f39-76b133adce96	\N	\N	f	HUMOROUS; ADULT	NULL	55	1	SE		3	CIE	\N
8e149d4a-81cf-43f6-beb2-62dd002ca648	\N	\N	f	~13 broken teeth and fragments; adult	NULL	6	1	SE	4		MBB	\N
da3077a1-3bf2-42c4-bf2d-45a3bfec126d	6ba8a199-9e87-4f88-bbf2-532f45518abd	\N	f	8 broken teeth and fragments of tissue; adult	NULL	6	1	SE	9		MBB	\N
67780afa-ddc6-4401-b79d-57cc93adfa89	6ba8a199-9e87-4f88-bbf2-532f45518abd	\N	f	~5 rib fragments; adult	NULL	6	2	SE	14		MBB	\N
dbad3304-024e-4034-b62f-ec37ced0c362	805779a5-547d-47b7-9870-43f28ac49dfc	\N	f	EYE	NULL	7	1	SE	22		GM	\N
a9abc679-0d2b-46a1-9a40-ee696d03c4a6	\N	5	f	Tissue; UKN ("Cluster 5")	NULL	7	1	SE	18		MBB	1998
97610c25-011d-457e-a5dc-17ab48d54518	805779a5-547d-47b7-9870-43f28ac49dfc	5	f	3 teeth; adult ("Cluster 5")	NULL	7	1	SE	18		MBB	1998
44317451-617d-4734-b44a-5edfa147e115	805779a5-547d-47b7-9870-43f28ac49dfc	\N	f	Powdered tooth sample	NULL	7	2	SE	21		MBB	1998
0e7563db-ab86-48b9-94c0-672b72d833a3	\N	\N	f	HAIR	NULL	8	1	SE	22		GM	\N
76b574d8-6f37-4430-9e52-e58a55e2f6ea	\N	\N	f	4 TEETH; SMALL ADULT OR CHILD	NULL	8	2	SE	29		CIE	\N
c3d03d6c-188c-45fd-b195-de1bcab58e9a	1d0a28fc-42b9-4572-904c-920e001cfc10	\N	f	TEETH	NULL	8	1	SE	29		GM	\N
8891e5d6-16db-4195-ae05-eb7ec413f279	66d70415-e9eb-4783-a1c3-e4659ff52bd8	\N	f	TEETH- POSSIBLY 1998	NULL	9	1	SE		6	GM	\N
3c6d5369-f2d7-40cb-a650-df6d7ed9f837	\N	\N	f	14 TEETH; ADULT	NULL	9	1	SE	29		CIE	\N
195d2af0-ff6d-473f-90f5-fe68752a2c4c	a5797565-b719-47f2-9f2e-f430af02e263	\N	f	Tooth fragments	NULL	30	1	SE	17		MBB	\N
27f18161-153b-46c7-bab7-6e9e196305bb	22981d35-6537-4ec2-9856-f1698c95c043	\N	f	1 BROKEN TOOTH, 2 RIB FRAGMENTS; CHILD	NULL	3	1	SW	30		CIE	2000
0c15d7d1-9f69-471a-9c64-2a73dca54043	507a8513-0e25-47e2-8511-01c18ba2ac95	\N	f	RIBS AND TEETH	NULL	4	1	SW	30		GM	2000
43adee04-37cf-4aed-9a2c-a232230ad333	5afacd6c-c213-4969-ac1f-90ecb1447bf4	\N	f	Ribs; child	NULL	5	1	SW	25		AWA	\N
7777139b-2d8f-46fc-afed-62de249b099e	7333a417-e9a1-4f60-b0d6-d8f622340673	\N	f	4 TEETH; ADULT W/ TISSUE ATTACHED	NULL	7	1	SW	13		CIE	\N
072ffa4c-8651-4a17-ba93-cccda9353206	7333a417-e9a1-4f60-b0d6-d8f622340673	\N	f	9 TEETH; ADULT	NULL	7	2	SW	13		CIE	\N
0d19e86d-9158-48ad-9ecb-83ce996d935e	5dca7e18-3994-4f50-bd95-cda1e0db1cdf	\N	f	8 TEETH; ADULT	NULL	8	1	SW	13		CIE	\N
6f33ed0d-ff22-4df1-8961-d8e107a8cadb	f89e0252-3df2-40d1-b9f9-b7ef40ab966d	\N	f	Ribs; child	NULL	10	1	SW	25		AWA	\N
89242a71-1eb3-4079-b6b4-eca800d4fd6f	9f4b8e0d-f7ca-453f-af42-73a1a7c7b0b8	\N	f	HAIR	NULL	11	1	SW		1	CIE	\N
b2ea357a-59dc-49a1-a749-88446ac1254d	84ec6f73-50e4-4c53-a2cf-f7eeb3af43cf	\N	t	7 TEETH	NULL	12	1	SW	3		GM	\N
fbb924d9-a94c-44a5-a496-e85488c26dad	313691f9-169e-4227-bd70-05ca1e16d0a7	\N	f	3 TEETH	NULL	13	1	SW	3		GM	\N
7cbcae93-9d74-4d08-821f-70b96ff0b943	2561ac84-6949-4850-99bb-f928e176dac8	\N	f	Foot sample; sub-adult	NULL	26	1	SW	19		MBB	\N
fcefbb24-e3cb-4664-9f40-05a3354de042	9f15aa46-2737-4e5c-97e7-4e9440c8315d	\N	f	13 teeth; child	NULL	60	1	SW	5		MBB	\N
9be6efd1-402c-4b5d-abed-843308e248b4	\N	\N	f	~7 bone fragments; child	NULL	2	1	SW	14		MBB	\N
83a49082-a7de-49ef-8338-8f93843ccfb4	\N	\N	t	11 teet; adult	NULL	2	2	SW	1		AWA	\N
17abb22f-af69-4276-9f42-d38a419c1b27	\N	21	f	Tissue and hair; UKN ("Cluster 21")	NULL	2	3	SW	18		MBB	1998
22ee40f2-d84f-4e88-bb8d-b8fb008a9c52	\N	21	f	Empty tube labelled "Clavicle"; UKN ("Cluster 21")	NULL	2	4	SW	18		MBB	1998
193b036a-6881-43a3-88df-915f8a2e55d8	\N	\N	t	3 teeth	NULL	2	5	SW	31		AWA	35833
7da80b41-7322-4a35-832e-1a0b106faa5a	\N	\N	f	6 teeth; adult	NULL	5	1	SW	1		AWA	\N
5da68ed1-c585-4b3c-9eba-32f4131f5910	\N	\N	f	9 TEETH; ADULT, FRAGMENTED	NULL	9	1	SW	12		CIE	\N
87665a93-2761-407e-8e2a-92125fd3a4f6	\N	\N	f	TEETH	NULL	9	2	SW	29		GM	\N
e7328f5b-77d0-4103-beaf-3face6eaf7b9	cde8f926-4aef-4e69-838b-ae9c26274243	\N	f	TEETH	NULL	10	1	SW		7	GM	\N
f0db5b90-19c8-4fe0-847b-7b72d02f8c2f	cde8f926-4aef-4e69-838b-ae9c26274243	\N	f	BONE POWDER	NULL	10	2	SW	23		GM	\N
e156e8f3-2d07-4d6f-8bd9-56c5e0f8d8a9	cde8f926-4aef-4e69-838b-ae9c26274243	\N	f	5 bones from legs and rib fragments; child	NULL	10	3	SW	28		MBB	\N
52a51560-d6be-429f-8b75-b45363c3e844	cde8f926-4aef-4e69-838b-ae9c26274243	\N	f	~9 skull fragments and skin; child	NULL	10	4	SW	28		MBB	\N
1b604235-f700-49c0-8425-178665f71b1f	cde8f926-4aef-4e69-838b-ae9c26274243	\N	f	~ 6 bone fragments (long bones, jaw); hair; child	NULL	10	5	SW	19		MBB	\N
6e3611a6-8456-4c47-9fbf-1c86466adc94	\N	\N	f	TEETH- POSSIBLY 1998	NULL	\N	1	SW		6	GM	\N
2332dca9-8db4-4a66-8b60-3238f7c9d461	7d6d851f-b320-4719-b715-542614bd97b6	21	f	Tissue from inside thoracic vertebra; UKN ("Cluster 21")	NULL	11	1	SW	18		MBB	1998
496a9344-3841-47fa-9b7d-26c1d563699f	e8596c68-ce26-4f42-b4a9-d77a78e0ddd8	2	f	Skin	NULL	13	1	SW	31		AWA	1998
038f876b-58fb-4f52-9171-a5d312d34792	d41fdbe5-798e-4d73-b084-942c30540f0e	\N	f	Skin	NULL	14	1	SW	31		AWA	35833
208b2788-e975-412c-a26b-f8b8642ee810	d41fdbe5-798e-4d73-b084-942c30540f0e	\N	f	Broken tooth; UKN	NULL	14	2	SW	18		AWA	\N
6ab5d65e-7506-4de3-8d32-cab1fcb210a8	512a2a61-24dc-425f-8fab-e4508ec10804	\N	f	SKIN AND TISSUE FROM ARM; UNK AGE	NULL	15	1	SW	29		CIE	\N
cf950e45-7131-4a04-8a90-5998009b27b7	512a2a61-24dc-425f-8fab-e4508ec10804	\N	f	SKIN AND TISSUE FROM ARM	NULL	15	2	SW	29		GM	\N
44f939eb-a697-4fac-8bb8-b9ae0dd974a3	512a2a61-24dc-425f-8fab-e4508ec10804	\N	f	Powdered tooth sample	NULL	15	3	SW	21		MBB	\N
3ec0eff0-8324-4ac9-a6f6-491cc9201a4b	512a2a61-24dc-425f-8fab-e4508ec10804	\N	t	3 teeth	NULL	15	4	SW	31		AWA	35833
a57068d5-c63c-4ac4-b6de-ac5227b4067b	6992e341-a6d7-4265-b79b-c11af4513a52	\N	f	Skin	NULL	16	1	SW	31		AWA	35833
daaea42f-fa49-4e43-ac02-154a835817fc	6992e341-a6d7-4265-b79b-c11af4513a52	\N	f	Hair	NULL	16	2	SW	31		AWA	35833
4688cc10-f3f5-4343-a746-ca93d5ecf167	6992e341-a6d7-4265-b79b-c11af4513a52	\N	f	Skin	NULL	16	3	SW	31		AWA	35833
76bd787d-4f77-4551-99a8-46c668197471	6992e341-a6d7-4265-b79b-c11af4513a52	\N	f	2 teeth	NULL	16	4	SW	31		AWA	35833
3debabeb-a3dd-47ae-8677-1c78c11c02f6	6992e341-a6d7-4265-b79b-c11af4513a52	\N	f	Rib fragment; sub-adult	NULL	16	5	SW		5	MBB	\N
206388c0-97fa-465d-b4d4-439e30c2a243	2c47f270-5a47-4387-ab88-bea6993d7b66	\N	f	4 DECAYED TEETH; ADULT	NULL	17	1	SW	29		CIE	\N
4f353eae-c2c5-4f24-a71f-67dd21ad5cb1	8aecb88b-9f44-46de-9eb7-3e542fd8ad4a	\N	f	HAIR AND SKIN	NULL	18	1	SW	11		GM	\N
6db65e3a-faf2-4399-9d23-b5e9ddfe1bd3	8aecb88b-9f44-46de-9eb7-3e542fd8ad4a	2	f	Skin - feet	NULL	18	2	SW	31		AWA	1998
f523395f-375c-4f47-9c58-175f2acad32f	8aecb88b-9f44-46de-9eb7-3e542fd8ad4a	2	f	Humerus	NULL	18	3	SW	31		AWA	1998
00ab8ad7-dd09-4d88-a652-9c18d6951dd1	0e809fd1-c6d0-4693-ad45-1d5abee60b96	2	t	2 teeth; adult	NULL	20	1	SW	31		AWA	1998
ac799f09-90c9-4b25-8adc-49214e5eafb0	0e809fd1-c6d0-4693-ad45-1d5abee60b96	22	t	Long bone and muscle	NULL	20	2	SW	34		AWA	1998
9dc54fea-c751-4b9c-91e7-a00312b1225a	0e809fd1-c6d0-4693-ad45-1d5abee60b96	1	f	Skin	NULL	20	3	SW	31		AWA	35833
b4279c6e-5b60-4c1e-ab66-7fe023325edb	0e809fd1-c6d0-4693-ad45-1d5abee60b96	1	f	Beard	NULL	20	4	SW	31		AWA	35833
f3ee7589-af0e-4351-b49d-f5426475dd49	09b46f05-f179-4ab3-aede-f49fc05332cf	1	t	3 Teeth; adult	NULL	21	1	SW	31		AWA	35833
87d2b06b-bb59-4913-bf1f-65d6f8a374df	09b46f05-f179-4ab3-aede-f49fc05332cf	\N	f	TEETH	NULL	21	2	SW	29		GM	\N
e78ae3b3-6af9-4272-b415-66414ebad6d6	e4939faf-68a4-43e3-be82-bda1464b65fd	\N	f	TEETH- POSSIBLY 1998	NULL	22	1	SW		6	GM	\N
3c3ea2c8-bc0b-4b57-9445-4548e8998828	e4939faf-68a4-43e3-be82-bda1464b65fd	\N	f	BRIAN	NULL	22	2	SW	11		GM	\N
d568e48a-9651-4344-8819-4cac053676cc	e4939faf-68a4-43e3-be82-bda1464b65fd	\N	f	Empty tube with dust residue	NULL	22	3	SW	17		MBB	\N
70a11d9a-6945-4395-b06b-96945919a9d9	efaac7fd-1bba-4485-b0c2-1ffcd7be17d9	\N	t	2 teeth;; adult	NULL	24	1	SW	10		MBB	1998
8612be8f-fc74-48e2-bab6-56e1e32dbc58	efaac7fd-1bba-4485-b0c2-1ffcd7be17d9	\N	f	TEETH	NULL	24	2	SW		7	GM	\N
f02478ee-9728-42c5-b56a-f9676eb3c19e	b60567b0-c240-4f4d-b829-f964d8484871	\N	f	SKULL AND TEETH POWER	NULL	25	1	SW	23		GM	\N
e9903f45-2a62-4197-ab20-d71d3b942fce	b60567b0-c240-4f4d-b829-f964d8484871	\N	f	SKULL POWDER # 11	NULL	25	2	SW	23		GM	\N
c7660692-76fc-4fbe-b64c-cfd8b5bfdd7d	b60567b0-c240-4f4d-b829-f964d8484871	\N	f	Skin; UKN	NULL	25	3	SW	10		MBB	1998
79025559-0dfa-4777-b5ec-2a928aa3f080	b60567b0-c240-4f4d-b829-f964d8484871	\N	f	Rib fragments; adult	NULL	25	4	SW	10		MBB	1998
544f4885-6de4-423f-b5f7-800447c66f0c	b60567b0-c240-4f4d-b829-f964d8484871	1	f	Skin	NULL	25	5	SW	31		AWA	35833
8bc9a6b5-1a4f-410f-8417-576a96e86e86	2561ac84-6949-4850-99bb-f928e176dac8	1	t	2 teeth; adult	NULL	26	1	SW	31		AWA	35833
05627504-0dcc-4329-b64f-b84d2c3f94f9	2561ac84-6949-4850-99bb-f928e176dac8	\N	f	7-9 BROKEN TEETH; ADULT	NULL	26	2	SW	12		CIE	\N
960a76ac-45ac-4ab4-ad8f-a86e87465926	2561ac84-6949-4850-99bb-f928e176dac8	\N	f	Rib fragments; child	NULL	26	3	SW		5	MBB	\N
68013d93-a25f-4879-a82f-a7f0286a5c9a	2561ac84-6949-4850-99bb-f928e176dac8	\N	t	Tooth; UKN	NULL	26	4	SW	18		AWA	\N
6bd28528-33a6-4e9e-a284-3cc883980736	2561ac84-6949-4850-99bb-f928e176dac8	\N	f	Tube with rib fragment; adult	NULL	26	5	SW		5	MBB	\N
bcf87d44-49d6-4066-ac80-0cba62240dc6	2561ac84-6949-4850-99bb-f928e176dac8	\N	f	TEETH- POSSIBLY 1998	NULL	26	6	SW		6	GM	\N
17ec33f9-45c9-41f9-8d92-ccabc656e20e	2561ac84-6949-4850-99bb-f928e176dac8	\N	f	Salt wrapped with hand; whole hand	NULL	26	7	SW	LARGE ITEM	4	AWA	35833
a454a1e3-d93e-4613-a789-ad3a9ce31224	22b620d8-5da5-45ea-8187-a17639a2ce8b	\N	f	MOUSE HAIR AND BONES, "NORTH WALL"	NULL	27	1	SW		5	CIE	\N
528a7176-7479-40ea-8766-f1f08354ea18	22b620d8-5da5-45ea-8187-a17639a2ce8b	\N	t	Tooth	NULL	27	2	SW	18		AWA	\N
8c1081a4-5cc7-4137-9bf1-ae96b06fa4f8	22b620d8-5da5-45ea-8187-a17639a2ce8b	\N	f	BONE POWDER	NULL	27	3	SW	23		GM	\N
244c6e9a-4289-4047-9eb0-22ded766ea82	22b620d8-5da5-45ea-8187-a17639a2ce8b	\N	f	5 TEETH; ADULT	NULL	27	4	SW	29		CIE	\N
ec9a53db-d11f-44ef-b13e-04b48e66eda2	6a685714-ec97-4f09-a6ef-f313508d8b1d	\N	f	Skin - jaw and skull	NULL	28	1	SW	31		AWA	1998
b0f1ea49-b5aa-46f3-b60d-72a28a5d9601	6a685714-ec97-4f09-a6ef-f313508d8b1d	\N	f	Scalp and hair; UKN	NULL	28	2	SW	10		MBB	\N
bb33a7bc-7af7-4206-928c-b5944966eafd	6a685714-ec97-4f09-a6ef-f313508d8b1d	\N	f	ROCK	NULL	28	3	SW		6	GM	\N
44578f88-d97a-426c-acd6-693bddfdfcda	6a685714-ec97-4f09-a6ef-f313508d8b1d	\N	f	HAIR AND SCALP	NULL	28	4	SW	11		GM	\N
87dd2630-a8fa-4ed0-81d3-9b82bd998790	6a685714-ec97-4f09-a6ef-f313508d8b1d	\N	f	Humerus	NULL	28	5	SW	31		AWA	1998
8a471992-09bc-4a63-8c83-e451d9eab39f	6a685714-ec97-4f09-a6ef-f313508d8b1d	\N	f	Hair and scalp (?)	NULL	28	6	SW	31		AWA	\N
192eada2-5f83-4109-b38e-11bbdbea7224	6a685714-ec97-4f09-a6ef-f313508d8b1d	\N	f	Clavicle; child	NULL	28	7	SW	31		AWA	\N
174b77a5-787b-46b0-8b42-751c9a174299	6a685714-ec97-4f09-a6ef-f313508d8b1d	\N	f	Skin	NULL	28	8	SW	31		AWA	\N
0cf77b65-3e80-4b37-817e-8d769ce719e9	afe2d3bf-50af-447a-9e90-11d92c59be69	\N	f	TEETH	NULL	29	1	SW	29		GM	\N
ffdb8add-3849-47be-93fa-634ce79a3c8e	afe2d3bf-50af-447a-9e90-11d92c59be69	\N	f	Fibula	NULL	29	2	SW	31		AWA	1998
2d000789-d40f-4dc6-a876-69b31ff634db	afe2d3bf-50af-447a-9e90-11d92c59be69	16	f	Clavicle; child	NULL	29	3	SW	31		AWA	1998
eec2a76f-cd0a-4bfb-ab5f-dc4da36282d8	ff8b66a0-560a-41f2-bae4-6e15d140057a	\N	f	1 bone fragment; 2 teeth; adult	NULL	32	1	SW	35		MBB	1998
8b7e2bc4-4d09-4ad1-a39c-ec65dea76963	ff8b66a0-560a-41f2-bae4-6e15d140057a	\N	f	Skin	NULL	32	2	SW	25		AWA	\N
caa6cb26-77d3-4206-bd17-8887fc88f47e	ff8b66a0-560a-41f2-bae4-6e15d140057a	\N	f	BONE ?- RC	NULL	32	3	SW	7		GM	\N
a4b12d9c-bdc1-47c8-9be6-c5c7d4ac8b53	ff8b66a0-560a-41f2-bae4-6e15d140057a	6	f	Fragment of humerus; child ("Cluster 6")	NULL	32	4	SW	18		MBB	1998
2da3dfef-0ca2-4cad-8dce-3ab927f28955	ff8b66a0-560a-41f2-bae4-6e15d140057a	22	f	Skin	NULL	32	5	SW	31		AWA	1998
916a6630-495b-46f0-b881-1b320b0a06cd	ff8b66a0-560a-41f2-bae4-6e15d140057a	22	f	6 teeth; adult	NULL	32	6	SW	31		AWA	1998
cf01c39f-b19f-4fe3-837d-e5ccbf501164	ff8b66a0-560a-41f2-bae4-6e15d140057a	\N	f	RIBS AND BONE. "REVERSAL"	NULL	32	7	SW		6	GM	\N
8540d6b6-590c-4ede-92ff-390098a9dbc5	bbd3b4a2-69aa-4bd9-baf0-e86086fc90cb	\N	t	2 teeth	NULL	33	1	SW	31		AWA	\N
2c5926d4-022e-484e-8223-1859bd7ef42e	bbd3b4a2-69aa-4bd9-baf0-e86086fc90cb	\N	f	Bone fragments	NULL	33	2	SW	31		AWA	\N
9f3e117e-e016-4034-aada-3b9380f8e540	ca42b030-f1a1-4a16-9e8f-fbdb59d4fe42	\N	f	SKIN ?	NULL	34	1	SW	11		GM	\N
0e92a2a9-f82e-4e8b-bb57-45f392103a3a	ca42b030-f1a1-4a16-9e8f-fbdb59d4fe42	\N	f	5 teeth; adult (4 tissue samples)	NULL	34	2	SW	9		MBB	\N
3932b708-4d51-49e0-92bc-ac088481e437	ca42b030-f1a1-4a16-9e8f-fbdb59d4fe42	\N	f	3 rib fragments; adult	NULL	34	3	SW	14		MBB	\N
b787620a-59bc-4f92-99b4-69b2187604f7	ca42b030-f1a1-4a16-9e8f-fbdb59d4fe42	\N	f	Skin	NULL	34	4	SW	31		AWA	\N
6df22cb2-e80b-4017-a813-6cf9890c6812	ca42b030-f1a1-4a16-9e8f-fbdb59d4fe42	\N	f	LUNG POWDER	NULL	34	5	SW	23		GM	\N
da016d12-02c6-4a7f-b79c-f0c61b85cc74	ba2f59e4-3a90-4dec-8ddb-c39221b7926b	\N	f	Scalp and hair; UKN	NULL	35	1	SW	5		MBB	\N
74ffe5e2-012f-44da-80ee-2724d8441d40	ba2f59e4-3a90-4dec-8ddb-c39221b7926b	\N	f	Bones from foot and rib fragment; sub-adult	NULL	35	2	SW	28		MBB	\N
f119245e-2796-467f-bda7-229ba6a2611d	ba2f59e4-3a90-4dec-8ddb-c39221b7926b	\N	f	Scapula (?)	NULL	35	3	SW	31		AWA	\N
78f07476-f437-457f-9a71-fcdbfd706c37	ba2f59e4-3a90-4dec-8ddb-c39221b7926b	\N	f	TOOTH- RC	NULL	35	4	SW	7		GM	\N
26c20b30-fae5-4e1e-835c-c2195983d072	8ebde29d-c51c-4a02-ae30-7a5413c09ba5	\N	f	TOOTH-RC	NULL	36	1	SW	7		GM	\N
99a65876-0ce8-4587-967b-f6879e09997c	8ebde29d-c51c-4a02-ae30-7a5413c09ba5	\N	f	TOOTH- RC	NULL	36	2	SW	7		GM	\N
5c9f2047-41ae-4044-88d8-d39dcec4c773	8ebde29d-c51c-4a02-ae30-7a5413c09ba5	\N	t	Bone and tissue; UKN	NULL	36	3	SW	35		MBB	\N
166851c4-8310-4f38-9070-e3446943137c	8ebde29d-c51c-4a02-ae30-7a5413c09ba5	\N	f	TOOTH- RC	NULL	36	4	SW	7		GM	\N
0821445b-75e1-4e53-9384-a2113383dfd4	58c5a654-1a27-457d-ad63-758bff527b3a	\N	f	Powdered tissue sample	NULL	37	1	SW	21		MBB	\N
9882d9bb-8e1c-4c02-b2b9-91ad33cef1c0	58c5a654-1a27-457d-ad63-758bff527b3a	\N	f	Bone dust	NULL	37	2	SW	21		MBB	\N
201dff73-3bda-49ec-9022-52b3400e9817	58c5a654-1a27-457d-ad63-758bff527b3a	\N	f	Skin sample	NULL	37	3	SW	21		MBB	\N
8602bf41-fb54-4112-8ab3-33c08ee0369c	58c5a654-1a27-457d-ad63-758bff527b3a	\N	f	Tissue from between vertebrae; UKN	NULL	37	4	SW	26		MBB	\N
9bde25e2-3b36-4e37-8d68-6b8567f5f2e3	58c5a654-1a27-457d-ad63-758bff527b3a	\N	f	BONE POWDER	NULL	37	5	SW	23		GM	\N
6590402b-cfba-4ce7-bc9a-288ab040a0d2	58c5a654-1a27-457d-ad63-758bff527b3a	\N	f	Empty tube with dust residue	NULL	37	6	SW	17		MBB	\N
f232e93c-02e4-4f9d-9a59-fb9d67bfe808	58c5a654-1a27-457d-ad63-758bff527b3a	\N	f	Powdered tooth sample	NULL	37	7	SW	21		MBB	\N
0b7ff305-823c-4868-9218-31abf33f3791	58c5a654-1a27-457d-ad63-758bff527b3a	\N	f	15 broken teeth; adult	NULL	37	8	SW	2		MBB	\N
e43c440a-055c-488c-9313-3f4765a9f0ce	70c28b28-4b41-47b3-9cf7-b7099f648135	\N	f	14 TEETH; ADULT	NULL	38	1	SW	10		CIE	\N
c9713dca-267c-47f8-8f50-e43cce4c3885	70c28b28-4b41-47b3-9cf7-b7099f648135	\N	f	2 TEETH; ADULT	NULL	38	2	SW	29		CIE	\N
b3ca1d42-48b7-479f-bc42-225716c7f072	70c28b28-4b41-47b3-9cf7-b7099f648135	\N	f	REED FOR CARBON DATING	NULL	38	3	SW		3	CIE	\N
65725ebf-16e7-44d0-97d9-0827b14ebfb2	70c28b28-4b41-47b3-9cf7-b7099f648135	\N	f	8 TEETH; ADULT	NULL	38	4	SW	12		CIE	\N
4079fd92-b19f-4515-90bb-82db46652d5c	70c28b28-4b41-47b3-9cf7-b7099f648135	\N	f	8 teeth; adult	NULL	38	5	SW	5		MBB	\N
b9b34a4e-7af3-49ca-9146-4357d5cd06b0	70c28b28-4b41-47b3-9cf7-b7099f648135	\N	f	13 TEETH; ADULT	NULL	38	6	SW	12		CIE	\N
194766f6-573d-4bca-9a0e-dbe51673d270	70c28b28-4b41-47b3-9cf7-b7099f648135	\N	f	Skin from mandible; UKN	NULL	38	7	SW	26		MBB	\N
61674041-7c46-41db-a0c1-1c73229c80c3	70c28b28-4b41-47b3-9cf7-b7099f648135	\N	f	~11 broken teeth and fragments; adult	NULL	38	8	SW	2		MBB	\N
01da18d4-efc2-42ba-bae4-0bdd5876425e	70c28b28-4b41-47b3-9cf7-b7099f648135	\N	f	Scalp and hair; UKN	NULL	38	9	SW	5		MBB	\N
ebedf7ad-d8e8-43e0-be25-c62a8a9189c6	92fbe8df-a729-4003-b096-684363ca6323	\N	f	2 TEETH; ADULT	NULL	39	1	SW	12		CIE	\N
e0ed1809-a3ba-47a7-8b43-ac8cfe206aa6	92fbe8df-a729-4003-b096-684363ca6323	\N	f	2 bones (hand and arm) with tissue; UKN	NULL	39	2	SW	24		MBB	\N
80ca8dbf-296f-4fdc-b3aa-5f914fa56546	\N	\N	f	14 TEETH; ADULT	NULL	4	1	SW	12		CIE	\N
5456cae2-24c6-4882-8994-48a183b3af5e	\N	\N	f	15 TEETH; ADULT, FRAGMENTED	NULL	4	2	SW	10		CIE	\N
f3c90f23-aefd-4352-bd51-6d29783613ea	\N	\N	f	Skin and tissue from tibia	NULL	4	3	SW	20		AWA	\N
0cb95610-fbe6-4c07-a33c-10db2a90fdcf	9eca8797-53bb-462a-8b1d-d29d10a74371	\N	t	8 TEETH; ADULT	NULL	40	1	SW	12		CIE	\N
c8487aa0-89e2-4c3b-aff1-02ec2431bfa8	9eca8797-53bb-462a-8b1d-d29d10a74371	\N	f	Scalp with hair; UKN	NULL	40	2	SW	26		MBB	\N
97bde719-98da-48d8-b35c-4143d529cc60	9eca8797-53bb-462a-8b1d-d29d10a74371	\N	f	Scalp samples; UKN	NULL	40	3	SW	24		MBB	\N
bc3b403d-727a-4396-98f6-5b08db7af8ac	9eca8797-53bb-462a-8b1d-d29d10a74371	\N	f	Foot	NULL	40	4	SW	20		AWA	\N
f494bf57-22bd-4431-93fb-83768a861508	0dca0ead-7229-4237-937e-8bb5cbccf342	\N	f	4 TEETH; ADULT W/ SOME TISSUE ATTACHED	NULL	41	1	SW	10		CIE	\N
45306643-5cec-4455-a34c-48f3574a12f4	1cbe9a04-6c84-4d6e-b901-0b6966002525	\N	f	4 bones from foot; adult	NULL	42	1	SW	28		MBB	\N
35a82cab-9160-4e1b-9cb7-b8c2a18b1204	1cbe9a04-6c84-4d6e-b901-0b6966002525	\N	f	4 bones and tissue from foot; adult	NULL	42	2	SW	28		MBB	\N
8e9e5cf7-9e47-4929-a69c-1eabfab23ca2	1710d5e0-2592-49cb-8c24-4aac8c2eb866	\N	t	11 TEETH; ADULT	NULL	43	1	SW	12		CIE	\N
26805d71-9dfd-44f3-84f9-ac5ff3aaf721	1710d5e0-2592-49cb-8c24-4aac8c2eb866	\N	f	HAIR	NULL	43	2	SW		4	CIE	\N
ebd898ff-2dee-4ac0-86df-0f25692dcd67	1710d5e0-2592-49cb-8c24-4aac8c2eb866	\N	f	5 rib fragments; child	NULL	43	3	SW	24		MBB	\N
dc7d9776-a41d-464c-b933-900af44a033a	565ac1c0-3331-4fa6-b086-bb120cdb4ad1	\N	f	Scalp samples; UKN	NULL	44	1	SW	24		MBB	\N
5633eed1-8454-484e-82b3-9f2d9755ec9c	565ac1c0-3331-4fa6-b086-bb120cdb4ad1	\N	f	Skin from arm and leg; UKN	NULL	44	2	SW	24		MBB	\N
3ec1e407-8ffd-40aa-9742-0a80ed5e67e3	565ac1c0-3331-4fa6-b086-bb120cdb4ad1	\N	f	Skin and tendons (from knee); UKN	NULL	44	3	SW	24		MBB	\N
813410c5-d757-4303-bb2a-b66c4ffc0b86	565ac1c0-3331-4fa6-b086-bb120cdb4ad1	\N	f	~12 broken teeth and fragments; adult	NULL	44	4	SW	2		MBB	\N
7ea399ec-219f-480d-ab55-80e747dc65e6	565ac1c0-3331-4fa6-b086-bb120cdb4ad1	\N	f	7-9 TEETH; SMALL, POSSIBLY YOUNG ADULT	NULL	44	5	SW	10		CIE	\N
a39cf30d-3fbe-4d24-aa3c-3b1cdbf13fb9	7cd3bfe8-e893-44db-9799-e5a2d54e0a05	\N	f	Bamboo	NULL	45	1	SW	5		MBB	\N
eb0de5a6-ada9-409c-8211-e9589958c2d8	7cd3bfe8-e893-44db-9799-e5a2d54e0a05	\N	f	WHOLE FOOT, INTACT; INFANT	NULL	45	2	SW		2	CIE	\N
a5b9e648-5b8f-4210-8dd0-21b53b0be80e	7cd3bfe8-e893-44db-9799-e5a2d54e0a05	\N	f	6 BROKEN TEETH AND BONE FRAG; ADULT	NULL	45	3	SW	12		CIE	\N
1eb4ea6e-d289-466a-8e15-0ec4e6371493	7cd3bfe8-e893-44db-9799-e5a2d54e0a05	\N	f	1 rib; sub-adult	NULL	45	4	SW	25		MBB	\N
c8d4c4cc-69f0-4ed8-8c4f-a7cbaa0c6e5e	7cd3bfe8-e893-44db-9799-e5a2d54e0a05	\N	f	RIBS	NULL	45	5	SW	7		GM	\N
fdc974a9-7696-4bb7-b9c9-63b40fe50f1a	22990cc0-1ba0-4c3d-8405-a7a16558c0ce	\N	f	5 rib fragments; child	NULL	46	1	SW	24		MBB	\N
9e83e629-8029-47eb-9d80-301150cce77d	5aab2211-b5e0-4557-acf4-138c87a7c64d	\N	f	Tissue; UKN	NULL	47	1	SW	24		MBB	\N
06140d73-c3a2-4f0e-9d80-55ea42d664ff	5aab2211-b5e0-4557-acf4-138c87a7c64d	\N	f	12 TEETH; ADULT	NULL	47	2	SW	10		CIE	\N
4fb4779d-58ad-48a1-8be2-2877db8da795	5aab2211-b5e0-4557-acf4-138c87a7c64d	\N	f	WOOD	NULL	47	3	SW		3	CIE	\N
c133bd95-d077-4e01-a953-9e4a06a33b46	5aab2211-b5e0-4557-acf4-138c87a7c64d	\N	f	1 rib fragment and tissue; child	NULL	47	4	SW	16		MBB	\N
2d56e608-80a4-4ea2-8be1-d5d981988ed4	60f71172-15da-440b-9641-efdca1d47c6c	\N	f	Tissue (skin and vertebra); UKN	NULL	48	1	SW	24		MBB	\N
30997a58-8065-46c6-9429-ad43cd887151	\N	\N	f	TEETH	NULL	5	1	SW	29		GM	\N
c9ce63ed-77e0-44eb-8584-d9e0a17ab3ef	\N	\N	f	Broken tooth; child	NULL	5	2	SW	18		AWA	\N
2f16c5c7-829f-45e8-8b72-b02e166b3cf3	\N	\N	f	Reed	NULL	5	3	SW	26		MBB	\N
076f5366-5576-4f74-908a-33b906e04b70	\N	\N	f	10 teeth; adult	NULL	5	4	SW	5		MBB	\N
6086e934-e1ae-47d9-a781-9126dd5e7b66	c97b9ba4-b497-4893-8b9c-dad4d92509b8	\N	f	10 TEETH; ADULT, BLACK CROWNS (DECAY?)	NULL	50	1	SW	13		CIE	\N
0733cfe1-1e8f-4c3a-b607-88914bae6fbe	c97b9ba4-b497-4893-8b9c-dad4d92509b8	\N	f	Soft tissue	NULL	50	2	SW	21		MBB	\N
4c6e4085-507c-4994-9509-c7ad99fec827	c97b9ba4-b497-4893-8b9c-dad4d92509b8	\N	f	Tissue; UKN	NULL	50	3	SW	24		MBB	\N
7228354a-e8bc-4d49-880b-841d1aefbb8c	c97b9ba4-b497-4893-8b9c-dad4d92509b8	\N	f	18 TEETH; ADULT	NULL	50	4	SW	10		CIE	\N
d6f8fa3c-4d2b-4509-b376-247ae71d9a40	c97b9ba4-b497-4893-8b9c-dad4d92509b8	\N	f	18 teeth; adult	NULL	50	5	SW	5		MBB	\N
18cbd9a2-11d6-4ec2-8007-4eb52888633a	c97b9ba4-b497-4893-8b9c-dad4d92509b8	\N	f	TEETH	NULL	50	6	SW	15		GM	\N
9239b3dc-de6a-44f5-98b7-4dbf42e6eb6b	c97b9ba4-b497-4893-8b9c-dad4d92509b8	\N	f	Powdered tooth sample	NULL	50	7	SW	21		MBB	\N
02112a82-ed33-4203-84d1-71ef5efa38b8	c97b9ba4-b497-4893-8b9c-dad4d92509b8	\N	f	8 TEETH; ADULT	NULL	50	8	SW	10		CIE	\N
d89f3eca-d3fa-4013-a268-05fd806e07ca	c97b9ba4-b497-4893-8b9c-dad4d92509b8	\N	f	11 TEETH; ADULT	NULL	50	9	SW	12		CIE	\N
5d322f21-74ad-42fa-8aa9-c4472a1e9c54	c97b9ba4-b497-4893-8b9c-dad4d92509b8	\N	t	Bones and tissue (membrane from skull); UKN	NULL	50	10	SW	28		MBB	\N
1d68c66c-8326-4604-bf38-842de7c4b06e	c97b9ba4-b497-4893-8b9c-dad4d92509b8	\N	f	Skin	NULL	50	11	SW	20		AWA	\N
ee52a269-d6af-4b52-801a-20a9e7af31b2	c97b9ba4-b497-4893-8b9c-dad4d92509b8	\N	f	Skin from face and inside mouth	NULL	50	12	SW	20		AWA	\N
e01b6c10-c2b8-44c9-ba02-1f8dcf6051db	aad3dcb2-2175-4e19-a812-3aaf550b0532	\N	f	Bones; UKN	NULL	51	1	SW	28		MBB	\N
e2dce6cc-169e-4403-9a31-2f50fd020765	aad3dcb2-2175-4e19-a812-3aaf550b0532	\N	f	5 rib fragments; sub-adult	NULL	51	2	SW	14		MBB	\N
e5fdbab1-537e-49ce-ac66-9abb1251326f	aad3dcb2-2175-4e19-a812-3aaf550b0532	\N	f	Skin	NULL	51	3	SW	20		AWA	\N
6b64a018-6f57-4978-8f0c-beb7368d5779	aad3dcb2-2175-4e19-a812-3aaf550b0532	\N	f	TISSUE FROM MOUTH	NULL	51	4	SW		7	GM	\N
2a772021-3c5d-4886-bed4-dd02577ad1c6	aad3dcb2-2175-4e19-a812-3aaf550b0532	\N	f	~10 teeth; child	NULL	51	5	SW	1		AWA	\N
a8e98f74-0a8b-45b4-8a6a-5161907872e6	aad3dcb2-2175-4e19-a812-3aaf550b0532	\N	f	Wasp and seed samples	NULL	51	6	SW	21		MBB	\N
26245ae1-cae0-4ed5-9a50-a1384bbeb019	ac4edf78-a0a1-43bd-ad73-9e7eebb4ca94	\N	f	Powdered rib sample	NULL	52	1	SW	21		MBB	\N
d715779e-fbb5-4d8f-87b5-cfb5b43d9bfb	ac4edf78-a0a1-43bd-ad73-9e7eebb4ca94	\N	f	Empty tube with dust residue	NULL	52	2	SW	17		MBB	\N
3033d7ae-f6fd-4c12-a4cc-b61f5287cf5c	ac4edf78-a0a1-43bd-ad73-9e7eebb4ca94	\N	f	1 tooth; child	NULL	52	3	SW	9		MBB	\N
d0b2f162-36e3-4217-ad54-9ee7197ea00c	ac4edf78-a0a1-43bd-ad73-9e7eebb4ca94	\N	t	TOOTH-RC	NULL	52	4	SW	11		GM	\N
b06f46bd-1a81-40c6-b7bf-6ac21675b191	ac4edf78-a0a1-43bd-ad73-9e7eebb4ca94	\N	t	TOOTH-RC	NULL	52	5	SW	11		GM	\N
cb626f0d-2bba-407f-a377-5c43da07d675	ac4edf78-a0a1-43bd-ad73-9e7eebb4ca94	\N	t	7-8 BROKEN TEETH; ADULT	NULL	52	6	SW	12		CIE	\N
8899e284-6825-4875-bfb9-168f67e2898a	ac4edf78-a0a1-43bd-ad73-9e7eebb4ca94	\N	f	Tissue (skin and muscle); UKN	NULL	52	7	SW	24		MBB	\N
4e3c3749-dc10-42b3-933b-b1687333fffe	ac4edf78-a0a1-43bd-ad73-9e7eebb4ca94	\N	f	12 rib fragments; sub-adult	NULL	52	8	SW	14		MBB	\N
1b17c313-83d2-4249-91c9-221248cc9df0	ac4edf78-a0a1-43bd-ad73-9e7eebb4ca94	\N	f	5 bones (foot); tissue; UKN	NULL	52	9	SW	25		MBB	\N
8f2d8c57-da5e-4638-9fe4-a1ae118cce76	ac4edf78-a0a1-43bd-ad73-9e7eebb4ca94	\N	f	Tissue (foot and leg); UKN	NULL	52	10	SW	24		MBB	\N
f400b6ff-ec9e-43d1-b084-a868a4dd9935	ac4edf78-a0a1-43bd-ad73-9e7eebb4ca94	\N	f	14 teeth; adult	NULL	52	11	SW	9		MBB	\N
6f5ba128-9854-4e74-b720-9946c99d18c9	ac4edf78-a0a1-43bd-ad73-9e7eebb4ca94	\N	f	Jaw and teeth; child	NULL	52	12	SW	28		MBB	\N
a2bd4f8c-8dee-46d4-96d4-ced731b4b6d8	ac4edf78-a0a1-43bd-ad73-9e7eebb4ca94	\N	f	8 bone fragments (foot); UKN	NULL	52	13	SW	16		MBB	\N
ecd6a760-532a-4f63-aacd-e1fd5a561fbf	703b8842-6466-4b14-9bf4-f0574e0b0c17	\N	t	TOOTH-RC	NULL	53	1	SW	11		GM	\N
f702aa89-5654-4b23-a4c2-0e06e3452d62	703b8842-6466-4b14-9bf4-f0574e0b0c17	\N	f	Tissue (muscle and skin from leg); UKN	NULL	53	2	SW	24		MBB	\N
64463140-7ba3-4123-adcc-3ca4b6e4fae9	703b8842-6466-4b14-9bf4-f0574e0b0c17	\N	f	~15 broken teeth and fragments; adult	NULL	53	3	SW	2		MBB	\N
2174ed80-66f9-4e7e-818d-ffee50dee392	703b8842-6466-4b14-9bf4-f0574e0b0c17	\N	f	5 TEETH AND BONE FRAGMENT; ADULT	NULL	53	4	SW	12		CIE	\N
fdaee869-a398-4974-b55d-0560ea03ac88	870efd5e-a937-499d-aa0a-088f3f3ce16d	\N	f	TISSUE FROM MOUTH	NULL	54	1	SW	22		GM	\N
1bc1b6e0-4946-4678-958a-819bce5797ac	870efd5e-a937-499d-aa0a-088f3f3ce16d	\N	f	Eye and mustache; UKN	NULL	54	2	SW	24		MBB	\N
a43e37af-a543-460f-8762-d7ec11b2e42f	870efd5e-a937-499d-aa0a-088f3f3ce16d	\N	f	Beard and skin; UKN	NULL	54	3	SW	24		MBB	\N
4a82f0ab-feeb-4bce-b240-ebc339fba2be	870efd5e-a937-499d-aa0a-088f3f3ce16d	\N	f	Tissue from mouth and nostrils; UKN	NULL	54	4	SW	26		MBB	\N
64e443e9-2d0f-464b-9c73-931eeee07594	870efd5e-a937-499d-aa0a-088f3f3ce16d	\N	t	8 teeth; adullt	NULL	54	5	SW	2		MBB	\N
0a2bee4b-d092-46a9-bb61-f8e9fa6fd110	870efd5e-a937-499d-aa0a-088f3f3ce16d	\N	f	9 teeth; child	NULL	54	6	SW	9		MBB	\N
723680d5-fbe9-4005-8fd2-9cb4dcd27b90	b3e2bda3-476f-4af6-bbe3-f2e90d126958	\N	t		NULL	55	1	SW	18		AWA	\N
b4c147dc-8863-442a-a269-815cd86a7a76	b3e2bda3-476f-4af6-bbe3-f2e90d126958	\N	f	Powdered tissue sample	NULL	55	2	SW	17		MBB	\N
275fea72-2856-46a1-85ed-bcff9c0bd7fc	b3e2bda3-476f-4af6-bbe3-f2e90d126958	\N	f	Scalp and hair; UKN	NULL	55	3	SW	24		MBB	\N
bb77d030-984f-4e1b-b6ba-f0041882c28c	b3e2bda3-476f-4af6-bbe3-f2e90d126958	\N	f	Tissue; UKN	NULL	55	4	SW	24		MBB	\N
714e99f0-da7d-4b8f-9f73-3c6b8235b716	b3e2bda3-476f-4af6-bbe3-f2e90d126958	\N	f	Tissue lining inside of skull	NULL	55	5	SW	21		MBB	\N
f18b2600-1ec4-4594-a9f9-a7069d443c51	b3e2bda3-476f-4af6-bbe3-f2e90d126958	\N	f	6 TEETH; ADULT	NULL	55	6	SW	10		CIE	\N
fe2ff5a9-1e37-4b04-ada6-3fffb99b022a	607af69c-1c2f-42bd-a316-fc85c3e69f78	\N	t	5 teeth; adult	NULL	56	1	SW	9		MBB	\N
a76506a0-d69e-4c98-a734-537733578821	607af69c-1c2f-42bd-a316-fc85c3e69f78	\N	f	Bone fragments (foot); UKN	NULL	56	2	SW	24		MBB	\N
031c81ba-5634-484b-bc26-cc36a7026f7d	607af69c-1c2f-42bd-a316-fc85c3e69f78	\N	f	9 TEETH; ADULT *1ST VILE W/ #30 TEETH	NULL	56	3	SW	10		CIE	\N
6f541b50-b2fa-489b-bd8a-c6f04d35295c	607af69c-1c2f-42bd-a316-fc85c3e69f78	\N	f	HAIR IN SCALP	NULL	56	4	SW	22		GM	\N
cfbb771e-a11e-4c25-afda-c95e0c46b299	95931441-c7eb-4ac5-a5e6-57afdfa4788b	\N	f	7 tubes with tissue, including intestinal fragment; UKN ("SOHAG") written on bag	NULL	57	1	SW		5	MBB	1993
970a8c6f-fff9-4b10-86b4-d0292d95b98a	95931441-c7eb-4ac5-a5e6-57afdfa4788b	\N	f	8 teeth; adult	NULL	57	2	SW	2		MBB	\N
d7dcfe00-ea3a-445d-b510-a96e79db983e	95931441-c7eb-4ac5-a5e6-57afdfa4788b	\N	f	Tissue sample	NULL	57	3	SW	21		MBB	\N
1d7b5b1c-e233-44af-9dd4-ed3b52fee793	95931441-c7eb-4ac5-a5e6-57afdfa4788b	\N	f	16-18 TEETH; ADULT, FRAGMENTED *2ND VILE W/ #30 TEETH	NULL	57	4	SW	10		CIE	\N
9f4aff57-47a3-4fcf-8863-491f8a6aff61	95931441-c7eb-4ac5-a5e6-57afdfa4788b	\N	f	Scalp and hair; UKN	NULL	57	5	SW	24		MBB	\N
ccdb68d0-8e15-4a1b-81e3-365d5cca1e37	9be660c0-f07c-41cf-8ab9-cbc8d9cf8eca	\N	f	1 rib fragment; adult	NULL	58	1	SW	25		MBB	\N
40b41b1b-7d9f-485f-a4aa-ab97149cbb99	9be660c0-f07c-41cf-8ab9-cbc8d9cf8eca	\N	f	Brain; UKN	NULL	58	2	SW	26		MBB	\N
cb8d1bbd-1911-4b49-ae36-e78cf92cd792	9be660c0-f07c-41cf-8ab9-cbc8d9cf8eca	\N	f	Tissue from mouth and upper jaw	NULL	58	3	SW	21		MBB	\N
3fbd9a0b-c7d5-4517-b4ab-39b6d4217273	9be660c0-f07c-41cf-8ab9-cbc8d9cf8eca	\N	f	Rib fragment; UKN	NULL	58	4	SW		5	MBB	1993
6d4d1e34-cdbf-4337-8704-404e373377f0	9be660c0-f07c-41cf-8ab9-cbc8d9cf8eca	\N	f	MISC. TISSUE	NULL	58	5	SW	22		GM	\N
093e9429-abbb-44db-881b-8e5b015f584d	ad57cc36-a1e9-47b2-b7fc-48271481c85c	\N	f	Tissue from femur; UKN	NULL	59	1	SW	26		MBB	\N
9790b038-a298-4af7-8e45-00757206cf01	ad57cc36-a1e9-47b2-b7fc-48271481c85c	\N	f	4 rib fragments and tissue; child	NULL	59	2	SW	16		MBB	\N
d4b35d57-f774-428e-a1f2-966eb421b654	ad57cc36-a1e9-47b2-b7fc-48271481c85c	\N	f	TEETH- POSSIBLY 1998	NULL	59	3	SW		6	GM	\N
163bcfdd-1927-4ceb-bc03-19ce01aab70d	ad57cc36-a1e9-47b2-b7fc-48271481c85c	\N	f	"Mummy 23. Sample 2 F--- and Re-----" - written on bag "Beetle exoskeleton " - written on tube in bag	NULL	59	4	SW		5	MBB	1993
3b8e7e2c-16cb-4e26-90c2-cf5c275fe69d	\N	\N	f	Skin and muscle from femur; UKN	NULL	6	1	SW	24		MBB	\N
41fb9258-fbcd-49d8-9bd4-0079d3d350ee	\N	\N	f	bone fragments; UKN	NULL	6	2	SW	14		MBB	\N
aa2ce6e1-ec52-43f9-9025-73e8cb7b88a7	\N	\N	f	12 teeth; adult	NULL	6	3	SW	5		MBB	\N
a690decd-afa6-475f-a81b-24a4f27ac6c5	\N	\N	f	Scalp and hair; fragments of skull with membrane; UKN	NULL	6	4	SW	24		MBB	\N
4ae14df1-d050-49cd-bdf7-a4717863698e	\N	\N	f	INSIDE THE CHEST	NULL	6	5	SW		7	GM	\N
94355906-10b8-4b2d-b626-82c9f56fee9c	9f15aa46-2737-4e5c-97e7-4e9440c8315d	\N	f	16 TEETH AND FRAGMENTS; ADULT	NULL	60	1	SW	10		CIE	\N
265c325b-afc4-4352-96f3-d95b6961d3ee	9f15aa46-2737-4e5c-97e7-4e9440c8315d	\N	f	6 TEETH; ADULT	NULL	60	2	SW	10		CIE	\N
6830b9e3-3bbf-4754-8768-b2f734bab766	9f15aa46-2737-4e5c-97e7-4e9440c8315d	\N	f	12 teeth; adult	NULL	60	3	SW	5		MBB	\N
deedc2df-2303-452d-9a2b-3abbdb712188	b9fae272-6705-4326-9766-6d1680575ffa	\N	f	Tissue (muscle?); UKN	NULL	7	1	SW	24		MBB	\N
c2f78d4b-fb4d-47ca-877a-00d534a96a32	\N	\N	f	Bones (ribs and other); tissue; fetus	NULL	8	1	SW	19		MBB	\N
f48b9bf7-6ca6-4c68-a996-9296759dab82	\N	\N	f	~12 teeth; child	NULL	8	2	SW	1		AWA	\N
442ebd57-a544-49e7-9da7-f92ccc4ab20c	\N	\N	f	Internal	NULL	8	3	SW	34		AWA	1998
e8f72aff-5abf-4a90-9e47-67064c29bd23	\N	\N	f	2 teeth; adult	NULL	8	4	SW	14		MBB	\N
429c1eab-086f-4f79-86c6-e87a7527fdb2	\N	\N	f	6 teeth; adult	NULL	9	1	SW	4		MBB	\N
ec46b0d3-f1d5-4066-9f7a-d5b38c8cdde1	\N	\N	f	7 TEETH; ADULT (ONE IS BROKEN)	NULL	\N	2	SW	10		CIE	\N
2022f2e1-e768-4481-bb64-a5f254131107	\N	\N	f	Tooth fragments; UKN	NULL	\N	3	SW		5	MBB	1993
82a493a2-5195-4133-ade8-092b089fcabd	\N	\N	f	12 TEETH; ADULT	NULL	\N	4	SW	10		CIE	\N
aff3ca8f-bf8f-4c4d-a1ca-8d3ac8430bdc	\N	\N	f	HAIR	NULL	\N	5	SW		7	GM	\N
291b52f4-3d4a-42e2-8b40-d1d4db8d2866	1d3e8790-3942-4082-b0c9-3992c5e06684	\N	f	Hair; UKN	NULL	2	1	SW	5		MBB	\N
a3c8540c-b43b-41cc-ae31-cba6c4e8f37c	c56f8591-76f3-4eeb-9869-ce85bdf8f6b0	\N	f	Hair and scalp; UKN	NULL	4	1	SW	24		MBB	\N
0c954e52-11c5-4ebd-9cd1-0e51cf71faeb	c56f8591-76f3-4eeb-9869-ce85bdf8f6b0	\N	f	BONES	NULL	4	2	SW		7	GM	\N
6f307d70-1a98-48ea-ba3d-32736d6a9142	2bf69948-b0ca-44e8-b0cf-6cd1e2abca78	\N	t	6 TEETH, ADULT, UNK BONE FRAGMENTS *1ST #39 VILE W/ TEETH	NULL	5	1	SW	10		CIE	\N
1acf9ee1-2476-470a-8b8c-c52893f8868f	02c1bae1-3c78-435e-b093-7f4bb66434c4	\N	f	RIBS	NULL	10	1	SW	7		GM	\N
3e194ce7-c6e8-4447-9b47-a922e0de179d	569d4a8e-b4f0-4dac-b5a6-c3f3d8c5cb55	\N	f	RIBS	NULL	12	1	SW		7	GM	\N
16449fd0-3eef-47f4-8f54-d26a8d738c97	675ea5f7-8d82-4b9a-a976-d87cc3adc67b	\N	f	Powdered tooth sample	NULL	13	1	SW	21		MBB	\N
2b85f647-9448-4ffb-824a-e39a04fc0edf	6b04eb9b-fafc-4e7b-8896-65f119d844aa	\N	f	Powdered tissue sample	NULL	14	1	SW	17		MBB	\N
0e854351-9559-414b-92f7-c47c116c3d1d	38aaa6a0-74ed-4f80-9dcc-e29f325dfc48	\N	f	Powdered eye sample	NULL	15	1	SW	21		MBB	\N
51cc89f2-f1ce-499a-a0ec-08786d8a489d	f4e8db61-1f1d-4918-b9e2-b0436286cf4a	\N	f	Powdered tissue sample	NULL	16	1	SW	21		MBB	\N
68bc83b4-f3b6-4871-b6fe-0494267a4502	f4e8db61-1f1d-4918-b9e2-b0436286cf4a	\N	f	Empty tube with dust residue	NULL	16	2	SW	17		MBB	\N
2489a327-eefe-4b94-b894-8e54c975a33a	3353bf5e-cc5f-4e5d-9366-175e539e7ddc	\N	f	2 rib fragments; child	NULL	11	1	SW	16		MBB	\N
4b2aa174-ffc3-487d-9a07-19d21fcf8c17	569d4a8e-b4f0-4dac-b5a6-c3f3d8c5cb55	\N	f	~7 broken teeth and fragments; adult	NULL	12	1	SW	6		MBB	\N
dc18213d-e0c7-4911-9199-64736240a807	675ea5f7-8d82-4b9a-a976-d87cc3adc67b	\N	t	3 teeth; adult	NULL	13	1	SW	9		MBB	\N
580459c9-9555-4cb4-9a57-2140abd05a83	6b04eb9b-fafc-4e7b-8896-65f119d844aa	\N	f	~10 bone fragments (ribs); adult	NULL	14	1	SW	14		MBB	\N
e4d2cebc-1c7a-4c50-9088-328309dfac6e	38aaa6a0-74ed-4f80-9dcc-e29f325dfc48	\N	f	BONE POWDER	NULL	15	1	SW	23		GM	\N
b13cff2a-66f9-4144-acfe-04eaff7d2755	f4e8db61-1f1d-4918-b9e2-b0436286cf4a	\N	f	Tissue sample	NULL	16	1	SW	17		MBB	\N
aeecc73f-56bb-489f-81fb-c3f81d2a1721	0ed624af-870d-4c31-850b-1b97541fa363	\N	f	12 TEETH; ADULT AND FRAGMENTS *2ND #39 VILE W/ TEETH	NULL	17	1	SW	10		CIE	\N
61f2ebbb-5637-4ce8-9227-d077d530908e	1d3e8790-3942-4082-b0c9-3992c5e06684	\N	f	Tissue; UKN	NULL	2	1	SW	24		MBB	\N
ed2ff279-473e-41f7-85cc-171b3164676a	71a7eb7d-6808-440d-9ce0-cf72b49a9843	\N	t	TEETH	NULL	3	1	SW		7	GM	\N
76640e47-3b1d-4fb9-90ca-87ef7c0b08b5	2bf69948-b0ca-44e8-b0cf-6cd1e2abca78	\N	f	Brain; UKN	NULL	5	1	SW	24		MBB	\N
ffbc907a-31b7-427e-a43b-a008d0289a73	bf619cd1-72d9-4541-8f2f-1ed6bf6145df	\N	f	Powdered tooth sample	NULL	9	1	SW	21		MBB	\N
025f46a2-c3fb-4b17-996c-f867b9ce7ae4	\N	\N	f	Soft tissue	NULL	\N	1	SW	21		MBB	\N
aba8c923-5205-464f-a591-85f7f3517dd5	c7104449-54c8-4006-8c3d-2c7b797d1a32	\N	f	5 teeth; adult	NULL	10	1	SW	6		MBB	\N
63bd538c-0bd1-4778-ac04-a9787e875a32	d8ffc5e4-84e7-4aca-b76e-c696a32fbcd6	\N	f	1 bone; UKN	NULL	12	1	SW	14		MBB	\N
bdd840e0-86e4-44cc-96c5-6d6bbdf29cc8	99b28249-2645-4f36-a4b9-6d4ea10ac3f4	\N	f	~7 rib fragments; child	NULL	20	1	SW	14		MBB	\N
b436e178-d146-49c3-9d83-52731af42d4b	b0cd0111-72bb-48e1-aa22-e69659ef7fee	\N	f	RADIUS ??	NULL	26	1	SW		7	GM	\N
8409c08d-f6ee-493e-8e2f-67ab44eedab4	ab4bed37-f41a-4b73-8f9a-325b7f978dec	\N	f	Hair; UKN	NULL	27	1	SW	24		MBB	\N
506bd5c2-aeb4-40f9-bb3c-422a8839b9be	ffdac061-0918-4822-ad28-51c51d07caba	\N	f	Tissue; UKN	NULL	28	1	SW	24		MBB	\N
c8d10495-531a-401f-a2a9-dabd5099cdf5	\N	\N	f	5 teeth; adult	NULL	44355	1	SW	5		MBB	\N
dab43ee9-52f3-496e-be28-d7e47a992146	\N	\N	f	Eye; UKN	NULL	44460	1	SW	24		MBB	\N
6d0e9106-dd1f-44f8-bbe5-d9b071552bf3	\N	\N	f	bone fragments (skull, jaw); child	NULL	\N	1		25		MBB	\N
de435674-bdf6-4805-ac11-714e3e47959a	\N	\N	f	2 TEETH CHILD	NULL	47	1	SE	29		CIE	\N
6eeaef7a-2638-4d28-8457-514ce49ddc40	43f8641e-dea8-421f-975e-5c4627e0e84f	\N	f	5 TEETH; ADULT (ONE IS BROKEN)	NULL	2	1	SE	10		CIE	\N
bce7e011-eb94-48ee-9003-da8f38a2aa88	3579e73d-25b2-45ca-9817-65c1fff8ee0e	\N	f	Muscles from arm; UKN	NULL	6	1	SE	24		MBB	\N
00cd2c88-4822-47fe-a581-a620bb6b9cab	8798296e-1322-483d-951b-ae1d306f2636	\N	f	HAIR	NULL	7	1	SE	22		GM	\N
d4fb1103-a7f6-435b-a99c-512a0ae71491	64f29b22-5281-4d61-82f0-d7e0cb5c4021	\N	f	Muscle from femur; UKN	NULL	11	1	SE	24		MBB	\N
12e4c96c-aa47-499f-9130-427ff76a7150	2bf81165-412e-4cce-9d9e-ee8582ebeae3	\N	f	Brain; UKN	NULL	13	1	SE	24		MBB	\N
79c92d78-9645-4d37-9ebe-bdb7326af929	0099cddb-ced8-4042-b05a-33a161423ae9	\N	f	13 teeth; adult	NULL	19	1	SE	9		MBB	\N
399b4580-e78c-4171-a582-c81fc07f1fa0	f86fa873-3c52-423d-b5b8-3c00cac3979e	\N	f	Jaw with teeth and tissue; child	NULL	20	1	SE	19		MBB	\N
3136b211-b5fa-451d-a965-5e804ed9b4d1	5e753681-ac1a-406f-82e9-d64d849d4324	\N	f	"#3 or 2; ear"	NULL	21	1	SE	31		AWA	\N
0627f290-8196-40e0-9995-317691cef0f9	ee600623-61da-4487-ad81-3765b1bd964f	\N	f	6 teeth; adult	NULL	22	1	SE	5		MBB	\N
0b710679-f77d-41ce-88ac-5e653f7f3eee	a832ed19-3613-46a3-802e-e1d883eda958	\N	f	1 rib fragment; adult	NULL	24	1	SE	16		MBB	\N
fb295573-d2ee-44ac-ba6f-43600ab27881	19557d4c-38f5-444d-9f2d-b7b06374d745	\N	f	5 bones and tissue from foot; UKN	NULL	30	1	SE	27		MBB	\N
7d243dd4-933c-462a-a562-138a696232c6	f1b3187b-f3ce-4852-9c4d-f6b937a1209a	\N	f	TEETH	NULL	31	1	SE	29		GM	\N
1c71230d-e13a-46a2-87d2-e4293975bc57	c7a15827-3fe6-4f75-a1d9-102e86325992	\N	f	Empty tube with dust residue	NULL	32	1	SE	17		MBB	\N
fac3b7f8-fa3b-4ca8-a12f-14e95cb334de	086ab989-bfa2-40d5-a668-7e723d6654a8	\N	f	Bone fragments	NULL	33	1	SE	17		MBB	\N
6b6bf514-e88f-4a5a-aec4-2cc656c16fb8	96222eb2-e327-42d9-8a79-137c14719a04	\N	f	Scalp and hair; UKN	NULL	38	1	SE	24		MBB	\N
f9d8112f-7c56-4bbc-a96a-00447c31fbbd	078c6900-fb51-4b40-857a-8a49ded50147	\N	f	~10 teeth; child	NULL	41	1	SE	1		AWA	\N
da28f4d8-f935-4ed2-8035-907bf6ea17d3	7a03e87b-7c32-424d-b095-f879096edbdd	\N	f	Powdered tooth sample	NULL	46	1	SE	21		MBB	\N
69d7eb78-221c-4e9f-8137-a1df2de27aec	fc4fd552-a9b7-4f3b-9b79-9e2897c24f3c	\N	f	6 rib fragments; child	NULL	34	1	SE	14		MBB	\N
56a66eae-55a4-442e-b82b-7aea30420ad8	cee95185-7591-4c8b-94e3-65bdc1492f39	\N	f	Tissue from head; UKN	NULL	42	1	SE	26		MBB	\N
d7b60047-83d6-4e7e-98ec-c35c1e708da9	cee95185-7591-4c8b-94e3-65bdc1492f39	\N	f	~3 bone fragments (tibia);child	NULL	42	2	SE	14		MBB	\N
931ed0a8-14f9-4783-8f32-26e3ec32e97c	8798296e-1322-483d-951b-ae1d306f2636	\N	f	LEG TISSUE	NULL	7	1	SE	14		GM	\N
e2848723-66cd-446f-ba83-700f38467746	2b6ebff2-2f57-4062-b0b8-b1b46d30c66d	\N	f	10 teeth; adult	NULL	1	1	SE	5		MBB	\N
0c1bdd3a-610e-4c9f-82ab-d8c9a83039c6	429c1387-2ba7-4a17-861a-0c4ecaf1f933	\N	t	10 TEETH; ADULT, SOME FRAGMENTS AND 1/2 HAVE BEEN SAMPLED	NULL	2	1	SE	10		CIE	\N
06950f88-3cd7-4f91-8cb6-da6e9dd23c9e	429c1387-2ba7-4a17-861a-0c4ecaf1f933	\N	f	7 bones (foot) and tissue; child	NULL	2	2	SE	16		MBB	\N
a7481648-cada-408b-ae67-522cb9e31bc5	bd0fa971-455b-4bea-941c-4238f299e5fb	\N	f	TEETH	NULL	3	1	SE		7	GM	\N
6023726b-6b87-412f-99d4-474aab80dbee	34d8fff9-16a8-4d99-ad79-30a69017d87a	\N	t	Tooth; adult	NULL	5	1	SE	18		AWA	\N
3d206512-9d7c-4114-9fd7-a7a06026ee7f	34d8fff9-16a8-4d99-ad79-30a69017d87a	\N	f	Empty tube with dust residue	NULL	5	2	SE	21		MBB	\N
e53134fe-c62a-42a2-8e6e-cb9871310431	abf00f36-4ecd-425f-90b3-dbe629fc48a4	\N	f	Tissue from foot; UKN	NULL	6	1	SE	26		MBB	\N
ca1eeec1-aab0-4d64-8190-0de43b860bba	abf00f36-4ecd-425f-90b3-dbe629fc48a4	\N	f	7 teeth; adult	NULL	6	2	SE	1		AWA	\N
2d74578e-714f-41f9-b311-9c94bcd4f83d	abf00f36-4ecd-425f-90b3-dbe629fc48a4	\N	f	bone fragments (skull); child	NULL	6	3	SE	25		MBB	\N
04570b45-12a5-4b65-b4be-f70d6e7fc725	df520312-c1c3-495a-aea2-a86e90ac48fb	\N	f	bone fragments; UKN	NULL	7	1	SE	25		MBB	\N
885572d7-9002-435c-bea6-a0b1ab480023	9ec8c684-4c11-4d8f-87b7-bd41d5d13c3c	\N	f	5 rib fragments; child	NULL	9	1	SE	16		MBB	\N
8cd3489d-bd37-4e8b-961d-562419674446	7b85b5f4-2399-4bba-a056-98f9a2639dbe	\N	f	9 teeth; adult	NULL	10	1	SE	1		AWA	\N
5c1bd58a-ecd5-4934-a456-05bec0ba0107	\N	\N	f	SKIN/TISSUE	NULL	28	1	SE		7	GM	\N
47c0f22f-5144-4262-a6b3-ccc6ba0f3eea	7b85b5f4-2399-4bba-a056-98f9a2639dbe	\N	f	6 rib fragments; child	NULL	10	2	SE	16		MBB	\N
90a7316b-7698-4e8c-85d0-638597624265	0cb79a88-8d40-4305-9682-22a7d0a98929	\N	f	1 rib fragment; adult	NULL	11	1	SE	16		MBB	\N
187c5ddf-a965-486d-9bde-5efaff52b13c	0cb79a88-8d40-4305-9682-22a7d0a98929	\N	t	12 teeth; adult	NULL	11	2	SE	4		MBB	\N
fae500ce-6017-40a1-a07c-967cc5592662	0cb79a88-8d40-4305-9682-22a7d0a98929	\N	f	6 TEETH; ADULT	NULL	11	3	SE	10		CIE	\N
3952f12a-e8c3-4f2c-be09-3f33aa639fc8	\N	\N	f	Inside femur; UKN	NULL	12	1	SE	24		MBB	\N
91c82d05-a94d-47ef-a2af-0cb420fb6f69	\N	\N	t	9 teeth; adult	NULL	12	2	SE	6		MBB	\N
5daf91e6-287c-49cf-8a09-eef557e69f14	a46ffc88-a218-40c9-8ede-b529cb9cf5e5	\N	f	~4 bone fragments; UKN	NULL	13	1	SE	25		MBB	\N
6f6e1dcf-eebf-4826-a9ad-863bc80e053d	e26c7be4-4e16-4d69-9f52-10f91c820200	\N	f	"REED FOR CARBON DATING"	NULL	14	1	SE		2	CIE	\N
2c033bdf-2512-45bb-8dfd-18f30f196c88	e26c7be4-4e16-4d69-9f52-10f91c820200	\N	f	Tissue "prim?" - written on tube; UKN	NULL	14	2	SE	24		MBB	\N
d1846221-f4ee-4497-84aa-89fc20e2b4fc	e26c7be4-4e16-4d69-9f52-10f91c820200	\N	f	Hair; UKN	NULL	14	3	SE	24		MBB	\N
98291d03-48c9-4187-9087-2ecee087ff8c	2bc30bac-00b5-4a86-87b4-030085f94359	\N	f	Ribs	NULL	15	1	SE	31		AWA	\N
6c006688-4786-4c2d-9940-22c5b0199859	2bc30bac-00b5-4a86-87b4-030085f94359	\N	f	Powdered tissue sample	NULL	15	2	SE	17		MBB	\N
d7852cf4-40de-45fb-a8c7-2b0ec5f83025	3e590287-3a77-44bf-b039-9b1e9435e184	\N	f	7 teeth; adult	NULL	16	1	SE	13		MBB	\N
42daef42-5495-4234-b709-2aa772084147	92da0535-f5a8-4818-8466-b58c5540a6a5	\N	f	Broken tooth; child	NULL	17	1	SE	18		AWA	\N
e1d9b26b-6d6c-42a3-a247-60754b8d2e0d	8ca291d7-1322-46bd-b1e6-d1d4e7315fd2	\N	f	4 TEETH; ADULT AND 1 FRAGMENT	NULL	18	1	SE	10		CIE	\N
7e483191-ea4d-463a-9d10-284561f19cd5	4d634845-2295-4b6d-8ae7-9c2eff6749a2	\N	f	Brain; UKN	NULL	19	1	SE	24		MBB	\N
c0a467ec-0b37-41be-9dbc-8714999d5340	4d634845-2295-4b6d-8ae7-9c2eff6749a2	\N	f	Powdered tooth sample	NULL	19	2	SE	21		MBB	\N
6aace0bd-67dd-4b57-9e05-5146505254c4	4d634845-2295-4b6d-8ae7-9c2eff6749a2	\N	f	Tissue from skull	NULL	19	3	SE	21		MBB	\N
d40cc373-90e5-44eb-8c18-47b813720488	4d634845-2295-4b6d-8ae7-9c2eff6749a2	\N	f	Powdered tooth sample	NULL	19	4	SE	21		MBB	\N
a98b75e4-1767-4ec5-b08d-50ff7057056d	09dba05d-a5ff-4d59-a44e-7c265f572f31	\N	f	Soft tissue from skull; UKN	NULL	20	1	SE	24		MBB	\N
3f08e2c8-5a23-454a-8173-b475e000fdf4	7f5a2e6a-74e5-4809-812c-389c6ffcf460	\N	t	3 teeth; adult	NULL	21	1	SE	5		MBB	\N
c26409ed-cbcc-42e4-8d58-8ea7a96e9339	052a86d0-ae57-4d24-89ae-c15660f45e02	\N	f	TEETH	NULL	22	1	SE		6	GM	\N
65dd37fd-6f8d-4927-9c13-8e2d9c1f9149	052a86d0-ae57-4d24-89ae-c15660f45e02	\N	f	Tissue from foot; hair; UKN	NULL	22	2	SE	26		MBB	\N
6c388b7b-ef28-42a5-ae4b-24c0a9aa5010	2cf03596-59b5-41f6-aaef-38720155858a	\N	f	SKIN FROM FOOT	NULL	23	1	SE	22		GM	\N
05bcd804-ec4e-40f1-8897-e1d9f5e3de28	2cf03596-59b5-41f6-aaef-38720155858a	\N	f	8 rib fragments; sub-adult	NULL	23	2	SE	14		MBB	\N
77f3100d-1e77-4939-a8cc-c265cccec1c2	2cf03596-59b5-41f6-aaef-38720155858a	\N	f	Brain; UKN	NULL	23	3	SE	5		MBB	\N
d024f2cc-3462-44f8-a51c-b62e3660a386	2cf03596-59b5-41f6-aaef-38720155858a	\N	f	HAIR	NULL	23	4	SE	22		GM	\N
5c5187f5-8970-4c74-92d9-789a34c70798	a6e68b22-9d1e-4834-bada-68e2c1c9476a	\N	f	Hand sample (tissue and bone); adult	NULL	25	1	SE	19		MBB	\N
c8443684-1c2c-429b-86a5-b5cb6d5ee1d7	a6e68b22-9d1e-4834-bada-68e2c1c9476a	\N	f	Adult rib	NULL	25	2	SE	25		AWA	\N
6ac78261-7949-4dd7-8989-977b114fdde3	a6e68b22-9d1e-4834-bada-68e2c1c9476a	\N	f	4 rib fragments; sub-adult	NULL	25	3	SE	16		MBB	\N
c2e605d7-68ec-46f6-9b14-54474046a17d	2831ebbe-0c3e-4829-b7e7-0f84869f294a	\N	f	HAIR	NULL	26	1	SE	22		GM	\N
ef2fb98c-66b0-429a-afaf-5be304d4b5e3	0ca37573-5186-4cb1-aa8a-bee24be3b099	\N	f	BRAIN ?	NULL	27	1	SE	15		GM	\N
415196b5-99ea-4e4e-ae73-a54822363118	f468f41d-5bf3-4f24-9092-9b18c24b42c4	\N	f	5 teeth; adult	NULL	28	1	SE	13		MBB	\N
8cad8046-f96f-4fd0-a73f-b7c2d6af7db2	d21adc61-0442-4af1-af72-eabec59d4636	\N	f	TEETH	NULL	29	1	SE		7	GM	\N
cc090bc2-4dcc-42c2-a39a-150b935b4da8	d21adc61-0442-4af1-af72-eabec59d4636	\N	f	("Internal + skin") - written on tube	NULL	29	2	SE	21		MBB	\N
7798872c-d854-47ee-8fe5-526c7c214a32	f6cf58d2-268d-4d06-9dc9-b3bbc7f60613	\N	f	SKIN ?	NULL	30	1	SE	15		GM	\N
2ab55570-5e04-4ecb-9bb4-46b666771fc6	33e6afb7-bda5-4409-ad73-c981162057be	\N	f	FOOT	NULL	31	1	SE	22		GM	\N
9bd7d43b-5f0f-4a9e-8872-af4ba7dea823	33e6afb7-bda5-4409-ad73-c981162057be	\N	f	Hand sample (tissue and bone); adult	NULL	31	2	SE	19		MBB	\N
4adc7d91-38e9-494b-b89e-694ce6f37da0	33e6afb7-bda5-4409-ad73-c981162057be	\N	f	FOOT	NULL	31	3	SE	15		GM	\N
040573ce-4a51-44ae-a54e-82f1a7d5ab0b	bb709365-3694-4e8c-a26e-6c54a7455ada	\N	f	Tissue from foot; UKN	NULL	32	1	SE	26		MBB	\N
6eaf88b2-e8c0-4740-92d4-b8c87519f140	bb709365-3694-4e8c-a26e-6c54a7455ada	\N	t	2 teeth; adult	NULL	32	2	SE	5		MBB	\N
789498a9-334d-45ad-aebe-92bb0383d15c	bb709365-3694-4e8c-a26e-6c54a7455ada	\N	f	Powdered tissue sample	NULL	32	3	SE	17		MBB	\N
94384b62-f54d-4d66-9763-c514ace89d2f	bb709365-3694-4e8c-a26e-6c54a7455ada	\N	f	FOOT	NULL	32	4	SE	22		GM	\N
9924ce98-291f-4779-a907-10919d2f2741	bb709365-3694-4e8c-a26e-6c54a7455ada	\N	f	Hair and scalp; UKN	NULL	32	5	SE	5		MBB	\N
4ee83bbc-52fa-4264-a2fb-cb78a96e214f	bb709365-3694-4e8c-a26e-6c54a7455ada	\N	f	1 rib fragment; sub-adult	NULL	32	6	SE	14		MBB	\N
b25e80b3-c33d-4608-8c5c-24623da6f532	5943c7de-51ad-4ba6-b276-fb45cba4a3d5	\N	f	1 rib fragment; adult	NULL	33	1	SE	16		MBB	\N
aa387835-eb15-450b-9ab2-0ec9767436b1	5943c7de-51ad-4ba6-b276-fb45cba4a3d5	\N	t	2 teeth; adult	NULL	33	2	SE	5		MBB	\N
45ef2bf9-5085-492e-9ab2-a731b26230db	5943c7de-51ad-4ba6-b276-fb45cba4a3d5	\N	f	TEETH- CHILD	NULL	33	3	SE	15		GM	\N
d499a570-c13e-4759-a3fe-944b55a5fee7	556f5497-c434-4e4c-8539-7fb92ce9bfbc	\N	f	14 teeth; adult	NULL	34	1	SE	1		AWA	\N
b7d102a8-67c7-4b5f-a9d4-2b798b7fcf74	a4387af4-914c-42c3-be2e-14b85f96c5eb	\N	f	Tissue from foot; UKN	NULL	35	1	SE	26		MBB	\N
053bda5f-42d7-4fed-b8ce-712d1bef1237	8f839e60-1b01-4458-a415-3bbad015c79c	\N	f	FOOT	NULL	36	1	SE	22		GM	\N
b9cd9aac-c52b-4fa4-b81a-32d1afab2686	8f839e60-1b01-4458-a415-3bbad015c79c	\N	f	~10 bone fragments (ribs and skull); infant	NULL	36	2	SE	16		MBB	\N
64bbb51e-5bc7-4de3-b1aa-53e9ec6b16db	bea749f3-3695-4b57-befa-ba5a9e37dae7	\N	f	Tissue from skull; UKN	NULL	37	1	SE	5		MBB	\N
84709b7f-912c-4648-8b5c-bb0b527a5bba	bea749f3-3695-4b57-befa-ba5a9e37dae7	\N	f	FOOT	NULL	37	2	SE	22		GM	\N
868aafd4-57ef-46f1-b2e2-0fdaf8c8f18d	bea749f3-3695-4b57-befa-ba5a9e37dae7	\N	f	Tissue sample	NULL	37	3	SE	21		MBB	\N
2188b56f-8dfb-45d4-85d6-2fd6deba7204	bea749f3-3695-4b57-befa-ba5a9e37dae7	\N	f	Tissue from foot; UKN	NULL	37	4	SE	26		MBB	\N
79c16874-c35f-4ce6-a094-a024288fa61d	bea749f3-3695-4b57-befa-ba5a9e37dae7	\N	f	HAIR. SCALP, TISSUE FROM SKULL	NULL	37	5	SE	22		GM	\N
1b7c847e-8d0d-46df-bbe0-e31e725db1ee	4fade3c5-fda6-451c-bc19-f1d9dba06812	\N	f	Foot	NULL	38	1	SE	20		AWA	\N
1f1a4cf7-3086-44d9-9a7e-f7483291018e	4fade3c5-fda6-451c-bc19-f1d9dba06812	\N	f	Tissue from foot; UKN	NULL	38	2	SE	26		MBB	\N
bcb5bf95-76f3-45a9-b874-746863ec038b	868f6259-1b85-4bc9-ab9f-26b38c481603	\N	f	TISSUE FROM SKULL	NULL	39	1	SE	22		GM	\N
6ea10d2b-eae6-473a-8dfb-428f444d0733	868f6259-1b85-4bc9-ab9f-26b38c481603	\N	f	"Maxilla teeth, pieces of skull" - written on tube; child	NULL	39	2	SE	19		MBB	\N
7ae2b269-f618-4a90-940d-a08c8f4d6279	a35d6894-4a27-4726-9e48-172a1eb1a91b	\N	f	RIBS	NULL	40	1	SE		7	GM	\N
753ec9ce-6527-4b21-ba8b-1279aad6c7d7	a35d6894-4a27-4726-9e48-172a1eb1a91b	\N	f	~10 rib fragments; child	NULL	40	2	SE	16		MBB	\N
d954e096-2b00-4947-8ea2-a8dc810ec365	27c2bb52-cd3c-472a-ac9e-369733649568	\N	f	Empty tube with dust residue	NULL	41	1	SE	17		MBB	\N
8659fe08-b200-4607-9b6b-f5dbf14dc52a	27c2bb52-cd3c-472a-ac9e-369733649568	\N	f	3 tubes with resin, beetle samples, and tissue; UKN ("GOLDFINGER") written on bag	NULL	41	2	SE		5	MBB	1993
110f6b13-5eb4-4f31-b041-b887a19c2ba9	903ce7ec-90f6-4157-856d-c282bca0291b	\N	f	TEETH	NULL	42	1	SE	15		GM	\N
7f23ba71-9831-4b64-9fa7-0e24f488b81d	903ce7ec-90f6-4157-856d-c282bca0291b	\N	f	Tissue from foot; UKN	NULL	42	2	SE	26		MBB	\N
c6913548-3742-4c67-951b-dc16f62899f5	e020b1b9-7e95-498b-9605-38a849a3fd23	\N	f	10 RIB FRAGMENTS; ADULT	NULL	44	1	SE			CIE	\N
9eff0e62-42f1-416e-8c28-024b5e7e3a2e	e020b1b9-7e95-498b-9605-38a849a3fd23	\N	f	7 teeth; adult	NULL	44	2	SE	5		MBB	\N
ca0ab6f5-00a3-432d-9bbd-316af5b14bd7	e020b1b9-7e95-498b-9605-38a849a3fd23	\N	f	Tissue from foot; UKN	NULL	44	3	SE	26		MBB	\N
071b3592-4177-4684-89b2-5235e482a097	e020b1b9-7e95-498b-9605-38a849a3fd23	\N	f	9 teeth; child	NULL	44	4	SE	9		MBB	\N
4f705234-093b-493d-ae81-2f0c6f3caea7	4c9f8601-eaea-4ed6-8fae-f1b849b92177	\N	f	WHOLE FOOT, FRAGMENTED	NULL	45	1	SE		1	CIE	\N
29a550c0-fad1-471d-ac94-26578bccf590	5374d7ab-3b0f-4879-b966-25e2c5e39552	\N	f	Skin	NULL	46	1	SE	20		AWA	\N
7666dfaa-b8a1-48d7-b9e0-b9b19720ab99	5374d7ab-3b0f-4879-b966-25e2c5e39552	\N	f	TEETH	NULL	46	2	SE	15		GM	\N
0ebe30df-65b6-4858-924e-3cfed480db5a	f9c5acfd-bea4-40bf-80fe-1d8b41f01378	\N	f	Hair; UKN	NULL	48	1	SE	26		MBB	\N
e24e01bb-ba0c-483b-9373-91071a55535d	926ddeac-99a6-4940-a6e5-79e2a03a100e	\N	f	BRAIN	NULL	49	1	SE	15		GM	\N
ec0fab46-6f4e-491a-a503-e2cc3e012a93	4160cc24-1409-4b59-ad10-5f7fc562dc81	\N	f	Brain; UKN	NULL	50	1	SE	26		MBB	\N
c33d2083-8c8c-48b6-8140-5f4f2f7b43eb	4160cc24-1409-4b59-ad10-5f7fc562dc81	\N	f	2 rib fragments and tissue; adult	NULL	50	2	SE	16		MBB	\N
5d005431-e8dd-4b48-8b95-e6598ab6b10d	4160cc24-1409-4b59-ad10-5f7fc562dc81	\N	f	TOOTH-RC	NULL	50	3	SE	11		GM	\N
031a735c-43e6-4998-b92f-b248b2f0e90c	a96d3513-4723-4e2e-9915-4dbe187447b2	\N	f	Powdered tissue sample	NULL	51	1	SE	17		MBB	\N
cc394b9a-4a38-43a2-a034-d47db84054cc	27187a62-968d-49be-91a4-d9afd3389185	\N	f	5 teeth; adult	NULL	52	1	SE	9		MBB	\N
1acf2fd3-a624-4591-bc72-8389ad3def51	27187a62-968d-49be-91a4-d9afd3389185	\N	f	HAIR	NULL	52	2	SE	15		GM	\N
7fdfea57-ef0e-43b5-893a-1a91d6743040	3e590287-3a77-44bf-b039-9b1e9435e184	\N	f	18 teeth; adult	NULL	16	1	SE	9		MBB	\N
c5a19bbf-c6ae-43fa-b9f2-8a180c238f7d	5943c7de-51ad-4ba6-b276-fb45cba4a3d5	\N	f	HAIR	NULL	33	1	SE	15		GM	\N
f68dae4e-36da-41f2-b137-f24f55087de9	556f5497-c434-4e4c-8539-7fb92ce9bfbc	\N	f	5 rib fragments; child	NULL	34	1	SE	16		MBB	\N
b7f58927-ab43-4c0f-b14d-1a8363a046e7	a96d3513-4723-4e2e-9915-4dbe187447b2	\N	f	Scalp and hair; UKN	NULL	51	1	SE	26		MBB	\N
f30ee49b-f644-4114-86a8-1b0fdfb672c2	\N	\N	f	Rib; child	NULL	2	1	SW		5	MBB	1993
9f19a823-c567-479e-bbfb-c26a28a68b22	\N	\N	f	TOOTH- RC	NULL	2	2	SW	11		GM	\N
9ce5a462-8d34-4db8-81f2-4a9d4b14b967	\N	\N	f	TISSUE FROM TIBIA	NULL	8	1	SW	15		GM	\N
02e13943-a7d8-4328-b589-3a92f0ed01fc	\N	\N	f	2 rib fragments; sub-adult	NULL	8	2	SW	25		MBB	\N
b1ef9602-c811-49aa-a064-4032ffdfb8f7	\N	\N	f	6 rib fragments; child	NULL	8	3	SW	28		MBB	\N
56a53560-281f-494e-b6a8-09cdb8dafc84	\N	\N	f	RIBS	NULL	9	1	SW	7		GM	\N
13064f46-ea4f-48ef-97e1-73169dbe317a	\N	\N	f	Tissue from inside femur; UKN	NULL	9	2	SW	26		MBB	\N
e32cc667-1236-42cd-82dc-f60cbc61dfbb	\N	\N	f	TEETH	NULL	9	3	SW	15		GM	\N
09db6397-9aed-43d9-b8a6-7ffa717b7a68	\N	\N	f	Rib fragments; child	NULL	11	1	SW		1	MBB	\N
32265cef-07a7-4f42-bb4b-f9df1b61631a	\N	\N	f	5 RIB FRAGMENTS; INFANT	NULL	11	2	SW		4	CIE	\N
a50c7746-cecd-4c8b-ba46-e1ac31fdf7bc	\N	\N	f	BRAIN	NULL	11	3	SW	15		GM	\N
da0ba080-0dc5-4495-9720-97bf12258811	\N	\N	f	Tissue; UKN	NULL	11	4	SW	26		MBB	\N
d91e3712-0871-43a7-8b52-00c23fcf52fb	\N	\N	t	10-12 TEETH; ADULT, FRAGMENTED. NOT LABLED	NULL	13	1	SW	10		CIE	\N
bb711b68-63ea-41b9-98cc-7e1a334f3920	\N	\N	f	Tissue sample	NULL	13	2	SW	21		MBB	\N
5a2f776a-adb3-463c-afd2-41e8dd7e512a	\N	\N	f	~12 teeth; child	NULL	13	3	SW	1		AWA	\N
e4eb9215-b3ac-405e-bc0b-d56ffa7bc7a1	\N	\N	t	Tooth; UKN "M4"	NULL	14	1	SW	18		AWA	\N
40e246c4-4d30-4f3d-be73-3492bd72dcc5	\N	\N	f	TEETH- POSSIBLY 1998	NULL	14	2	SW		6	GM	\N
7a753794-c80c-429b-80a5-8eed415c6cd3	\N	\N	f	7 rib fragments; child	NULL	17	1	SW	14		MBB	\N
162fcf50-c634-4779-8d06-b8ad03b5b242	\N	\N	f	TEETH AND HAIR	NULL	18	1	SW	15		GM	\N
0eef2052-6d89-42b3-b826-19d90290caa5	\N	\N	f	Skin sample	NULL	18	2	SW	21		MBB	\N
fa465822-9e8d-416c-a55e-31304bac8e5f	\N	\N	f	5 rib fragments; sub-adult	NULL	18	3	SW	16		MBB	\N
99163ddd-2e85-4d20-b837-7b967d2e6c4a	\N	\N	f	Tissue from tibia	NULL	19	1	SW	21		MBB	\N
a7e84987-9d29-49ca-a7f2-4e9948fb7c90	\N	\N	f	1 bone and fragments; UKN	NULL	21	1	SW	25		MBB	\N
52586fee-dfa8-46b3-b502-da55e8130b22	\N	\N	f	Bones (longbone, pieces from skull); UKN	NULL	21	2	SW	28		MBB	\N
0819dc91-5904-469a-ad1d-f0f33d1dff74	\N	\N	f	6 teeth; adult	NULL	22	1	SW	5		MBB	\N
3cfd0c5f-c4e3-4174-8828-b1231cebe5b1	\N	\N	f	4 teeth; adult	NULL	23	1	SW	4		MBB	\N
02f1ec56-b99e-4bd0-99e0-948cf83b5f2d	\N	\N	f	"Mummified head old; #3 or 2; pieces from face"	NULL	23	2	SW	31		AWA	\N
e4d4748c-4060-4eb0-931d-8f2edd316278	\N	\N	f	"#3 or 2; nose"	NULL	23	3	SW	31		AWA	\N
9fc315d1-037f-46a1-8a0c-004823590b44	\N	\N	f	11 teeth; adult	NULL	31	1	SW	5		MBB	\N
9e3b334d-0289-43a5-a299-bdba06e3cb02	\N	\N	f	1 tooth; adult	NULL	31	2	SW	6		MBB	\N
f74c28ee-5375-4140-8a15-57a011607dcb	\N	\N	f	2 bones from foot; UKN	NULL	31	3	SW	27		MBB	\N
383659be-989b-4536-b5e2-600ea6d8d2cc	\N	\N	f	TOOTH-RC	NULL	31	4	SW	11		GM	\N
81c9ef55-9524-40f9-a87b-aaff20c67883	\N	\N	f	TOOTH- RC	NULL	31	5	SW	11		GM	\N
d0858a6b-965b-4f58-8353-276aeef366e6	\N	\N	f	Empty tube with dust residue	NULL	36	1	SW	17		MBB	\N
ac6edfb6-34a6-493a-bcbf-cedb619bede5	\N	\N	f	RIBS	NULL	36	2	SW	15		GM	\N
f05db954-b2cc-44eb-b408-acbc536fe146	\N	\N	f	HAIR FROM SCALP	NULL	36	3	SW	22		GM	\N
33a852e4-8494-48bc-bf7d-7ba45d9b0a4f	\N	\N	f	11 teeth; adult	NULL	\N	1	SW	2		MBB	\N
dc863368-0e1d-4415-ba6c-a4c045bf3dc6	aab3f20b-d0e0-4ca2-b5bc-5dfa24fc434f	\N	f	TEETH	NULL	1	1	SW		7	GM	\N
f5c0361f-8c35-4f83-9c92-155034c04252	aab3f20b-d0e0-4ca2-b5bc-5dfa24fc434f	\N	f	1 bone fragment (tibia); adult	NULL	1	2	SW	14		MBB	\N
7bd9ab54-bd44-4bdb-bfe9-59296fac8317	aab3f20b-d0e0-4ca2-b5bc-5dfa24fc434f	\N	f	HAIR	NULL	1	3	SW	22		GM	\N
9a78bd6e-f3f3-4b75-8e46-6b6f97871249	9fbceb3f-75f1-4127-aaaf-95dd945e281d	\N	f	5 bones (foot); UKN (some tissue)	NULL	3	1	SW	14		MBB	\N
8ad76e64-46aa-46b5-bf61-167313124911	9fbceb3f-75f1-4127-aaaf-95dd945e281d	\N	f	~10 teeth; adult	NULL	3	2	SW	1		AWA	\N
c1bb0b70-f631-4279-8997-70fac53baf78	9fbceb3f-75f1-4127-aaaf-95dd945e281d	\N	f	6 teeth; adult	NULL	3	3	SW	1		AWA	\N
1f1fec18-0273-49e1-9209-32f98062d81b	c60fd91d-344d-4156-98f5-cb872b3bccfc	\N	f	HAIR IN SCALP	NULL	4	1	SW	22		GM	\N
a1fce19d-31f5-484a-8795-e76614f5db3c	c60fd91d-344d-4156-98f5-cb872b3bccfc	\N	f	HUMOROUS POWDER	NULL	4	2	SW	23		GM	\N
c1479f85-9eca-46e7-ae98-2bb3110181f4	8aea66d5-1d89-4f27-b785-609ae626c181	\N	f	Jaw and teeth; tissue from skull; child	NULL	5	1	SW	28		MBB	\N
bea726c8-f9c4-4593-8ca9-dd23588287c7	8aea66d5-1d89-4f27-b785-609ae626c181	\N	f	HAIR IN SCALP	NULL	5	2	SW	22		GM	\N
05ee7606-097a-43eb-89da-846a81fb75b2	8aea66d5-1d89-4f27-b785-609ae626c181	\N	f	Broken tooth; child	NULL	5	3	SW	18		AWA	\N
5a30dfd7-80b7-4ce7-96ae-7c0e3111ef46	710157a3-3481-4e41-8e06-f1a7ef02972b	\N	f	BONE POWDER	NULL	6	1	SW	23		GM	\N
2214ee90-e80e-4a43-bf48-e4b3460dd141	710157a3-3481-4e41-8e06-f1a7ef02972b	\N	f	Skin dust	NULL	6	2	SW	21		MBB	\N
aac40857-6ec8-44b4-bdc5-eed59080212e	710157a3-3481-4e41-8e06-f1a7ef02972b	\N	f	Bone dust	NULL	6	3	SW	21		MBB	\N
7a19db6d-3bb3-4d0e-bcd7-a15356a72e53	f78a062c-0c07-4892-9e56-4ce47c3ee58a	\N	f	Powdered tissue sample	NULL	7	1	SW	21		MBB	\N
8ae52f7c-f655-4025-94f7-b165a547f0c0	f78a062c-0c07-4892-9e56-4ce47c3ee58a	\N	t	TOOTH	NULL	7	2	SW		6	GM	\N
5aa70d07-07f0-49a7-b92b-9d3bd8bd95fe	2acfd894-bd6d-4ca6-a0c0-79e074454ff1	\N	f	Bones (jaw, ribs, teeth); child	NULL	10	1	SW	28		MBB	\N
8316f0ec-ed63-40fe-9824-c95d08d4f478	2acfd894-bd6d-4ca6-a0c0-79e074454ff1	\N	f	Skin	NULL	10	2	SW	20		AWA	\N
56e9bc24-3c2f-4644-be62-b3e1d96bc68e	2acfd894-bd6d-4ca6-a0c0-79e074454ff1	\N	f	9 broken teeth and fragments; adult	NULL	10	3	SW	2		MBB	\N
eb591868-3194-443c-a4f0-38172b4f7e34	aa3556da-9f2c-42bf-87b2-1b0f83ee1e27	\N	f	Broken tooth; child "M18"	NULL	12	1	SW	18		AWA	\N
94e9a667-84d4-451a-900c-ed710d2efd3a	aa3556da-9f2c-42bf-87b2-1b0f83ee1e27	\N	f	Tissue sample	NULL	12	2	SW	17		MBB	\N
53f95307-c5e4-4c51-b360-0b8321789262	7d2a5c1f-a717-4b07-bb3f-a4ebf6997607	\N	f	HAIR IN SCALP	NULL	15	1	SW	22		GM	\N
a3ba93d1-9821-49d1-9b65-993c88c87d2a	7d2a5c1f-a717-4b07-bb3f-a4ebf6997607	\N	f	Fecal	NULL	15	2	SW	20		AWA	\N
e18e482d-d3eb-43b2-a6db-c84ce0a6b5fd	7d2a5c1f-a717-4b07-bb3f-a4ebf6997607	\N	f	Ribs; infant	NULL	15	3	SW	34		AWA	\N
8275edb7-41cf-45e6-97eb-9f9f10d84454	98502b4c-d6d1-4e1d-a247-0806047fb937	\N	f	8 bone fragments (rib, vertebra); child	NULL	16	1	SW	25		MBB	\N
908fd9f5-5cb6-44f8-aa45-8eb35cbe5be7	98502b4c-d6d1-4e1d-a247-0806047fb937	\N	f	3 teeth; child	NULL	16	2	SW	9		MBB	\N
136ca650-1a91-493f-b93a-2697a41b70ac	31d0cd86-c208-4625-83e0-7ff34346fb8c	\N	f	Skin	NULL	20	1	SW	20		AWA	\N
7f5a966c-6ac9-4d46-a82a-89fcee9e3522	31d0cd86-c208-4625-83e0-7ff34346fb8c	\N	f	2 rib fragments; adult	NULL	20	2	SW	14		MBB	\N
3199e4c6-b114-4ece-b577-b4d1534e5d6b	c468120a-a00b-417a-a017-f1843d8777a3	\N	f	HAIR	NULL	24	1	SW		1	CIE	\N
5a43db21-dc40-4402-a7ea-478e3892a95a	eed1e3bd-b921-42e9-9ec2-b6de8c366981	\N	f	Tissue sample	NULL	25	1	SW	21		MBB	\N
2b7ae20f-af1b-445c-a371-59ef1f509a17	eed1e3bd-b921-42e9-9ec2-b6de8c366981	\N	f	4 teeth; adult	NULL	25	2	SW	1		AWA	\N
08777e4e-c190-4d12-af4f-0df21a74ac01	eed1e3bd-b921-42e9-9ec2-b6de8c366981	\N	f	Tissue sample	NULL	25	3	SW	21		MBB	\N
c2e29e74-5a65-473f-8268-c81685d7a766	1de3db72-1d1c-4506-bed1-4624cd1b6bd0	\N	f	3 bones and tissue from foot; UKN	NULL	26	1	SW	27		MBB	\N
a2c01d99-b583-48c1-ac05-3cca78627ad8	fbcb5ddb-94c8-460a-9e95-bddf0170f067	\N	f	Skin	NULL	27	1	SW	34		AWA	1998
8e8dec38-386a-4c7a-9908-f64fc9747dc5	fbcb5ddb-94c8-460a-9e95-bddf0170f067	\N	f	12 teeth; adult (some bone)	NULL	27	2	SW	6		MBB	\N
4c0f9190-85d6-4a9d-99ca-80b8623b6c79	7ee9fb1d-9478-4931-a014-a55c3d1b9b19	\N	f	TEETH	NULL	28	1	SW	15		GM	\N
788ec52b-3064-4257-b0b3-7d64ec28096e	7ee9fb1d-9478-4931-a014-a55c3d1b9b19	\N	f	HAIR	NULL	28	2	SW	22		GM	\N
ef1e9bf3-875b-4024-9c3d-627824b2bc7c	7ee9fb1d-9478-4931-a014-a55c3d1b9b19	\N	f	FEMUR	NULL	28	3	SW	15		GM	\N
f6a654d3-f847-421b-9c54-17f1bdbe3da0	\N	\N	f	BRAIN	NULL	29	1	SW	22		GM	\N
e3c845f6-9803-4138-b35b-887b361b06ec	\N	\N	f	4 rib fragments; hair; child	NULL	29	2	SW	16		MBB	\N
dd15ecc6-79b3-44ad-8549-c2e3e1d6ecf7	277a16e9-f74e-4a3f-a37f-05c61350c62b	\N	f	8 teeth; adult	NULL	30	1	SW	34		AWA	1998
42e6c504-c008-4a30-8183-def4f73c494d	277a16e9-f74e-4a3f-a37f-05c61350c62b	\N	f	10 TEETH AND FRAGMENTS; ADULT W/ SOME TISSUE (INCORRECT LABELING OF E/W COORDINATES)	NULL	30	2	SW	12		CIE	\N
c224746f-dbb9-483c-97d7-82dca5c1c7b8	19fefc99-785e-4acb-9e3b-2d68de201e08	\N	f	SKIN ?	NULL	33	1	SW	11		GM	\N
15589d60-3039-4751-ae8d-4087fb68291d	e06835ac-0624-41c1-b1a6-83b8e69483fd	\N	f	HAIR AND SCALP	NULL	34	1	SW	11		GM	\N
8ff4a6b0-a779-444b-a1ed-78be5d077a9a	50e808b5-0f46-4453-892f-ae9af9dd578e	\N	f	BRAIN	NULL	35	1	SW	15		GM	\N
b086099d-c1fa-44b8-adc2-b1114cc2dc22	50e808b5-0f46-4453-892f-ae9af9dd578e	\N	f	RIBS	NULL	35	2	SW	15		GM	\N
8aaf3bbb-15bc-47c9-a1da-c2a17baba7ab	639181b2-8f70-4e15-9348-24219a84484a	\N	f	9 teeth; adult (some tissue)	NULL	37	1	SW	8		MBB	\N
7f63ac7c-9db6-4e7a-ad3b-d6ca88a60646	f0bbacc2-05a0-4751-a5c5-18699f6d7dfb	\N	f	3 bones (foot) and tissue; UKN	NULL	38	1	SW	16		MBB	\N
4661ae73-47ad-44f3-9588-289ad0d379d2	8aa20af8-8abf-4862-87a9-2698cd5d1bcd	\N	f	rib fragments; adult	NULL	39	1	SW	16		MBB	\N
153eb18d-56fd-4784-8c7f-aa38e8c7c794	8aa20af8-8abf-4862-87a9-2698cd5d1bcd	\N	f	SKIN FROM FOOT; UNK AGE	NULL	39	2	SW	29		CIE	\N
93eccc25-bdf8-400d-b98c-c33120906deb	8aa20af8-8abf-4862-87a9-2698cd5d1bcd	\N	f	Powdered tissue sample	NULL	39	3	SW	21		MBB	\N
09ae4303-2f84-47f0-9044-285f67e4748b	d574e404-629a-4fc2-bf2f-4f7113908f54	\N	t	Tooth; UKN	NULL	40	1	SW	18		AWA	\N
d6cbcbdc-54c9-4379-8408-a84834549d68	8844537c-6fa0-46c3-9680-cc6fd0fe9539	\N	f	SPIRT?	NULL	41	1	SW	22		GM	\N
ddd37cae-e5d4-4523-a007-b811bd8de3f7	198d21d4-c1f0-488e-af8d-025ee6dcd92c	\N	t	8 teeth; child	NULL	42	1	SW	5		MBB	\N
464bf05e-4fd5-4589-8f0c-968ea55ebb43	f6686cd7-58dd-4aa5-8043-2c7814b9634b	\N	f	HAIR IN SCLAP	NULL	43	1	SW	22		GM	\N
84939737-2d52-4265-974b-de63f37f59a7	f6686cd7-58dd-4aa5-8043-2c7814b9634b	\N	f	2 bone fragments; 4 teeth; child	NULL	43	2	SW	16		MBB	\N
dade2766-4f4f-43a9-994a-cdfe616ee6a5	f6686cd7-58dd-4aa5-8043-2c7814b9634b	\N	f	1 bone fragment (mandible) and skin; child	NULL	43	3	SW	26		MBB	\N
f730ee24-f9f2-4c39-9c12-9855498530cf	f6686cd7-58dd-4aa5-8043-2c7814b9634b	\N	f	6 rib fragments; child	NULL	43	4	SW	5		MBB	\N
26a45030-6f4d-4dd8-8170-abf3789794a9	f6686cd7-58dd-4aa5-8043-2c7814b9634b	\N	f	PIECES OF SKULL	NULL	43	5	SW	22		GM	\N
e801ce0d-6a15-453d-920e-3fb4e4843f45	7b225114-29ac-4170-8d2c-948fd0730e7f	\N	f	~7 ribs and fragments; child	NULL	44	1	SW	16		MBB	\N
6ebd6859-21ac-4b9f-84ed-9fc4b9c6aad3	7b225114-29ac-4170-8d2c-948fd0730e7f	\N	f	8 broken teeth; adult	NULL	44	2	SW	9		MBB	\N
d8ca7f73-f34d-48ee-b3ee-2e9b13c17bab	7b225114-29ac-4170-8d2c-948fd0730e7f	\N	f	2 bone fragments (tibia); child	NULL	44	3	SW	19		MBB	\N
7b32003c-fd53-4b91-934d-1fa55140e417	dae9ff02-dbb4-4608-9414-bf4039dda756	\N	f	7 TEETH; ADULT *1ST TUBE W/ #4 TEETH	NULL	46	1	SW	12		CIE	\N
d718a0f0-0cc5-4993-85f5-04eed8e5175b	dae9ff02-dbb4-4608-9414-bf4039dda756	\N	f	2 bone fragments; UKN	NULL	46	2	SW	16		MBB	\N
d0a38b80-2af4-462d-92eb-ce2f2b8ad2d2	5a8f7ed4-4594-4dd4-a79c-c6d8889a1e6c	\N	f	9 teeth; adult	NULL	47	1	SW	1		AWA	\N
4b4ffd19-6daf-478b-8a9e-94b6c0fd9121	38a89982-f038-4ee2-a244-c1609706d6c1	\N	f	~14 broken teeth and fragments; child	NULL	48	1	SW	9		MBB	\N
07d0bbab-510e-4c0f-ad1e-14580b609231	38a89982-f038-4ee2-a244-c1609706d6c1	\N	f	HAIR	NULL	48	2	SW		7	GM	\N
efabe721-3b1a-4c3b-b073-d889e5540259	13f36acf-cca6-4bce-9930-2351c8fe8751	\N	f	7 teeth; adult	NULL	49	1	SW	9		MBB	\N
11ae0a7e-715e-4fb8-b269-96e682608c85	13f36acf-cca6-4bce-9930-2351c8fe8751	\N	f	BRAIN	NULL	49	2	SW		7	GM	\N
05c119ad-8958-4d16-879d-056b6416838c	13f36acf-cca6-4bce-9930-2351c8fe8751	\N	f	SCALP AND HAIR	NULL	49	3	SW	15		GM	\N
2bf1dbf0-004f-401d-ba68-49eece7786f6	fc9a1128-aa74-47bd-a69e-6bdae1c84387	\N	t	Tooth; adult	NULL	50	1	SW	18		AWA	\N
647bf6f6-68f8-487f-9ccd-49c0d0762273	070432da-1605-4375-9b44-68f3ab8111d0	\N	t	Broken tooth	NULL	52	1	SW	18		AWA	\N
2d2313a0-2802-4b7c-a4fd-e491f6f9e13a	070432da-1605-4375-9b44-68f3ab8111d0	\N	f	~6 rib fragments; adult	NULL	52	2	SW	14		MBB	\N
948b3ba6-1e8b-4105-bbf5-5543ece22c3f	070432da-1605-4375-9b44-68f3ab8111d0	\N	f	Ribs; child	NULL	52	3	SW	31		AWA	\N
c4544ac3-f304-4351-9369-54178bd39ecc	b00127cb-71bc-4a67-b97f-84bddb16f6ed	\N	f	HAIR AND SCALP	NULL	53	1	SW	15		GM	\N
7297e500-4388-4ef0-b588-00589b7b8144	67ee82e5-b804-4abd-99f6-80019f9cea9e	\N	f	SKIN AND EYE	NULL	54	1	SW		7	GM	\N
ff93c8ab-9c5c-499d-9252-2a3d7877e7b5	edb53edb-4fb1-4908-8335-2748f7fb580d	\N	f	Scalp and hair; UKN	NULL	56	1	SW	26		MBB	\N
5f9e73a8-0f89-4cf0-bdd7-d632ace43e95	b9a2e9b1-ba5a-43fd-b62f-c1e3d14f52e1	\N	f	6 teeth; adult	NULL	57	1	SW	9		MBB	\N
089677fc-aa93-41cc-b9e9-df454e910dbe	2bd1360c-2386-4c58-8281-65bd614462b7	\N	f	RIBS	NULL	58	1	SW	15		GM	\N
2e6a1623-6269-4699-9f42-bd354deb5991	a77ecfc2-4b64-4a56-86a9-cf19b098e3a5	\N	f	~14 broken teeth; adult	NULL	31	1	SW	5		MBB	\N
9a8c4f96-7007-4e9a-bc83-e1abb84a2950	a77ecfc2-4b64-4a56-86a9-cf19b098e3a5	\N	f	HAIR	NULL	31	2	SW	22		GM	\N
011287ff-4747-4390-b48d-4e82427e56be	a77ecfc2-4b64-4a56-86a9-cf19b098e3a5	\N	t	TEETH	NULL	31	3	SW	15		GM	\N
1152abc8-4a71-436d-8e04-94fdb7bc682b	50e808b5-0f46-4453-892f-ae9af9dd578e	\N	f	BONES	NULL	35	1	SW		7	GM	\N
9c5b4b35-0469-437d-ac60-6c8cc10c869a	f0bbacc2-05a0-4751-a5c5-18699f6d7dfb	\N	f	VERTEBRA	NULL	38	1	SW	15		GM	\N
e892e99f-6ab2-461a-895c-ced0892a45a0	8844537c-6fa0-46c3-9680-cc6fd0fe9539	\N	f	TISSUE INSIDE TIBIA	NULL	41	1	SW		7	GM	\N
18d974b0-af29-4dc9-8d69-e9fb4c355194	8844537c-6fa0-46c3-9680-cc6fd0fe9539	\N	f	Powdered tooth sample	NULL	41	2	SW	21		MBB	\N
3864433a-1750-470d-bdd7-03e4dc65af84	198d21d4-c1f0-488e-af8d-025ee6dcd92c	\N	t	Broken tooth; child	NULL	42	1	SW	18		AWA	\N
8da3f865-ce23-4d9c-b35d-ab3e6218cdfe	198d21d4-c1f0-488e-af8d-025ee6dcd92c	\N	f	TEETH- POSSIBLY 1998	NULL	42	2	SW		6	GM	\N
f8d46576-d69b-407a-aaa2-bfe34a3bf3fa	f6686cd7-58dd-4aa5-8043-2c7814b9634b	\N	f	Tissue from between vertebrae; UKN	NULL	43	1	SW	26		MBB	\N
aff138c3-4362-45b8-a766-fc3856c211ce	dae9ff02-dbb4-4608-9414-bf4039dda756	\N	f	FOOT BONE	NULL	46	1	SW	15		GM	\N
87fac345-583b-4158-883a-68b8bc26c995	dae9ff02-dbb4-4608-9414-bf4039dda756	\N	f	TEETH	NULL	46	2	SW	15		GM	\N
912c1e7e-6133-4a9c-a06c-85707b4eb97d	423838e0-6cbe-427a-815f-1587cba6d9f0	\N	f	TEETH	NULL	55	1	SW		7	GM	\N
08dd7c1d-b399-40f4-b2ca-bfe582c0b7c5	edb53edb-4fb1-4908-8335-2748f7fb580d	\N	f	TISSUE FROM MOUTH	NULL	56	1	SW	22		GM	\N
661a0671-5d22-4030-87b0-8e811ecd9a4c	b9a2e9b1-ba5a-43fd-b62f-c1e3d14f52e1	\N	f	HAIR	NULL	57	1	SW	15		GM	\N
ecf6cf44-6ac9-4b86-b20e-3ae72b0e95ce	\N	\N	f	12 teeth; adult	NULL	\N	1	1	6		MBB	\N
307a0ca9-529d-43c7-b631-19048f56a0bb	\N	\N	f	RIBS	NULL	\N	2	1	7		GM	\N
be1daa2d-cbe5-4b5f-9bbd-040c0b8805ec	\N	\N	f	Broken tooth; child "M7"	NULL	\N	3	1	18		AWA	\N
9e6baec3-7382-458a-a224-0610e304c986	\N	\N	f	PIECE OF LEG BONE	NULL	\N	4	3	7		GM	\N
08dcd98e-e7c1-4436-8fac-364a6bfb90af	\N	\N	f	RIBS	NULL	\N	5	NNW		7	GM	\N
e41cc01b-5601-4b27-9baf-2d6a1ed560f9	\N	\N	f	FOOT TISSUE AND BONE	NULL	\N	6	NNW		7	GM	\N
b756e8ea-899c-4353-ad22-61d39dea5ae8	\N	\N	f	VERTEBRAE	NULL	14	1	NW		7	GM	\N
44093024-727d-4902-842b-372b6f7a6c78	\N	\N	f	HAIR/BRAIN ??	NULL	18	1	NW		7	GM	\N
156f9b45-dc2a-48ee-9d3f-1f7b2510e3c4	\N	\N	f	SKIN FROM FOOT	NULL	34	1	NW	29		GM	\N
09b6afe9-c792-4c5a-9e3e-0b819edf6a9b	\N	\N	t	Tooth	NULL	14	1	NW	18		AWA	\N
91899619-b0f3-45e9-99a6-4a208493a0c3	\N	\N	f	Tooth; child	NULL	15	1	NW	18		AWA	\N
8a46977b-a830-4557-847a-453cf0137a85	\N	\N	t	2 teeth; adult	NULL	15	2	NW	5		MBB	\N
df70ecde-76a0-411e-b1cf-b0ef39d2286c	\N	\N	f	2 rib fragments; adult	NULL	16	1	NW	26		MBB	\N
5b5bfb2e-0c4a-4c4f-9bea-ec724708b6fc	\N	\N	f	Bones and tissue from foot; UKN	NULL	26	1	NW	26		MBB	\N
07a3223c-fa66-4a28-bcbb-1cb8e89483f8	\N	\N	f	VERTEBRA	NULL	28	1	NW		2	CIE	\N
d417fe09-1e79-451e-8597-6e2d99faebd8	\N	\N	f	SKIN/TISSUE?	NULL	1	1	SE	22		GM	\N
558f8a69-4787-4886-a4b9-e540135e8a23	\N	\N	f	SCALP, HAIR, AND SKIN	NULL	6	1	SE		7	GM	\N
ba9f539d-7cf3-444f-8e45-f2b0955b9851	\N	\N	f	"#3 or 2; Muscle from face"	NULL	8	1	SE	31		AWA	\N
4a9c83b3-5570-4187-b1fb-4a0b7600d245	\N	\N	t	2 teeth; adult	NULL	8	2	SE	5		MBB	\N
4c78d742-22d7-48ba-b218-2dd42c36ce37	\N	\N	f	Skin	NULL	8	3	SE	20		AWA	\N
d2ec968a-2df0-4d80-87f1-6b6eef4a7a4b	\N	\N	f	INTERNAL AND SKIN	NULL	10	1	SE	7		GM	\N
0821d672-0938-4bec-a653-27a11c64ed2b	\N	\N	f	Rib	NULL	10	2	SE	31		AWA	\N
77fe18ff-29b7-4dfa-bd8a-25504b9d1798	\N	\N	t	10 teeth; adult	NULL	10	3	SE	8		MBB	\N
721ee57d-ca33-4fe6-9cb5-96d9bca88101	\N	\N	f	Tissue from femur; UKN	NULL	12	1	SE	26		MBB	\N
af6967a1-67c0-4b46-aee7-fae5d1c03462	\N	\N	f	BEARD	NULL	13	1	SE	22		GM	\N
3ca32130-cc12-4d3a-bd6e-d0cc50d8750e	\N	\N	f	BONE POWDER	NULL	13	2	SE	23		GM	\N
45d4425b-a906-4e29-89ab-a8df0f3109f5	\N	\N	f	SKIN ?	NULL	13	3	SE	11		GM	\N
049ccd8c-a602-41b2-8067-80f383f2827b	\N	\N	t	2 teeth; adult	NULL	13	4	SE	5		MBB	\N
a6f8e52f-944e-4ea9-af02-36561d13f153	\N	\N	f	7 teeth; adult	NULL	14	1	SE	8		MBB	\N
f1fed3b9-aa83-4440-b4e7-4b6f9400a42d	\N	\N	f	2 bones from foot and tissue; UKN	NULL	14	2	SE	28		MBB	\N
f40df339-9c5d-4b96-a27f-628aab156ee5	\N	\N	f	2 bones and tissue from foot; adult	NULL	14	3	SE	28		MBB	\N
38c874ec-4a4b-413b-add0-963b452d3b60	\N	\N	f	15 teeth; adult	NULL	15	1	SE	1		AWA	\N
e9b0c74b-c175-493b-afcb-47ef72f91e5c	\N	\N	f	Powdered tooth sample	NULL	15	2	SE	21		MBB	\N
8752ed46-75bd-41af-a294-3229a3f77669	\N	\N	f	Powdered bone sample	NULL	15	3	SE	21		MBB	\N
d77ffa66-dc3a-46af-8ddf-fe456b4b954b	\N	\N	t	Tooth; adult; "M8"	NULL	15	4	SE	18		AWA	\N
0fbf1c8b-5f31-4176-9aed-0e871b6451f2	\N	\N	f	Tooth fragments	NULL	16	1	SE	18		AWA	\N
ca180f5c-8f7d-4ee0-be48-c57ffb70f576	\N	\N	t	Tooth "M9"	NULL	16	2	SE	18		AWA	\N
1bafddac-62f4-46df-a953-c0b9bed8d4f9	\N	\N	f	~8 broken teeth and fragments; adult	NULL	16	3	SE	8		MBB	\N
c63b3afb-6223-487a-b69a-3f7cd0d50942	\N	\N	f	TISSUE/SKIN?	NULL	17	1	SE	22		GM	\N
7ecf06ec-1d0c-4a7b-a7ed-58d7165b8310	\N	\N	f	TEETH	NULL	17	2	SE		7	GM	\N
a3749bc6-2aea-4800-952a-6eb3575d3ce2	\N	\N	f	9 teeth, pieces of jaw bone; child	NULL	17	3	SE	1		AWA	\N
6dca5d35-39e5-4143-a827-423b96a78e25	\N	\N	f	5 teeth (some bone); adult	NULL	18	1	SE	13		MBB	\N
4d05ba78-9ee1-4024-9b75-5c9d1f3b95d0	\N	\N	f	4 teeth; adult	NULL	19	1	SE	13		MBB	\N
0470d9a6-e77b-45c7-9a8e-a124ac0ee18d	\N	\N	f	Powdered tooth sample	NULL	20	1	SE	21		MBB	\N
12d6682d-c24c-4ff5-b533-ce9c59866525	\N	\N	f	Powdered tissue sample	NULL	21	1	SE	21		MBB	\N
2ac7fee5-878f-45a9-88f5-107cf2c67053	\N	\N	t	Broken tooth; adult	NULL	21	2	SE	18		AWA	\N
ab5c6733-b18a-4685-bb56-692cf069e82f	\N	\N	f	Empty tube with dust residue	NULL	22	1	SE	21		MBB	\N
9bddfec0-848b-49e6-9112-f339d6f90599	\N	\N	f	5 ribs; child	NULL	22	2	SE	19		MBB	\N
9ae0ec24-a7b0-47cb-b7c9-5d74d44384ea	\N	\N	f	EYES	NULL	23	1	SE		7	GM	\N
5252aa1d-2386-4a31-8718-c3c942d17872	\N	\N	f	HAIR	NULL	23	2	SE	15		GM	\N
64a2d00e-fa2a-44a4-ad80-005877a0353c	\N	\N	f	WOOD FRAGMENTS	NULL	23	3	SE		2	CIE	\N
a3f707ec-d23d-4b43-9720-3dafa0d5711c	\N	\N	f	Powdered tooth sample	NULL	24	1	SE	21		MBB	\N
105b8761-fafb-40d0-9470-13e14d003434	\N	\N	t	2 teeth; adult	NULL	24	2	SE	5		MBB	\N
a3bec6f9-337c-4053-8485-9a0af63af8c7	\N	\N	f	Empty tube with dust residue	NULL	24	3	SE	21		MBB	\N
84e61f04-3a28-4920-9609-09e1760a6744	\N	\N	f	VERTEBRAE	NULL	25	1	SE		7	GM	\N
66bfd988-4bc3-4cc7-b6e6-984528c08595	\N	\N	f	TEETH- CHILD	NULL	25	2	SE	15		GM	\N
3ea5bada-3345-4043-b6e3-4afe2acfcea2	\N	\N	f	REED FOR CARBON	NULL	25	3	SE		7	GM	\N
6347f2f1-68ff-4084-9322-459674506709	\N	\N	f	CROSS SECTIONS OF LONG BONE	NULL	25	4	SE		7	GM	\N
d92fe3e7-f4fc-4388-891e-35daad161a29	\N	\N	f	3 bones and tissue (from arm); UKN	NULL	26	1	SE	26		MBB	\N
327f3fa8-265b-449c-a9f4-a732c6e7c097	\N	\N	f	HUMOROUS	NULL	27	1	SE	15		GM	\N
aec23c79-bb35-4e62-bb5d-ae86e6662cdc	\N	\N	t	1 TOOTH; ADULT * 2ND TUBE W/ #4 TEETH	NULL	27	2	SE	12		CIE	\N
91107a81-7971-4b6e-8092-ef558fdfb31f	\N	\N	t	"Found Floating"; tooth; UKN	NULL	28	1	SE	18		AWA	\N
9cc9a13a-c208-45b6-a051-e42457d65d9e	\N	\N	t	Tooth; adult	NULL	28	2	SE	18		AWA	\N
aa3d9a6a-932f-4eb1-9377-e0e167afd1be	\N	\N	f	Powdered sample	NULL	28	3	SE	21		MBB	\N
44ab891c-3b5a-4e12-95a0-6204a0e2ad33	\N	\N	f	BRIAN	NULL	28	4	SE		7	GM	\N
a45fbd8f-23da-462f-ab74-8acfb3a2c374	\N	\N	f	Skin from face; UKN	NULL	29	1	SE	26		MBB	\N
5528d570-c888-419c-a89e-a039cf5030ee	\N	\N	f	RIBS WITH TISSUE	NULL	29	2	SE	7		GM	\N
824a16d1-30cc-44ee-87ce-fdf272b85e2f	\N	\N	f	RIBS	NULL	29	3	SE	15		GM	\N
0e96e4b0-acdd-41c7-ba56-1968a2853c18	\N	\N	t	Tooth, "M10"	NULL	30	1	SE	18		AWA	\N
6850ea1f-debf-4752-89b4-ad09639e6076	\N	\N	f	MAXILLA AND SKIN	NULL	30	2	SE	7		GM	\N
511df2b3-8a78-4bb9-9f06-764d80e07e3b	\N	\N	f	5 ribs; sub-adult	NULL	30	3	SE	25		MBB	\N
89f3aa18-09b9-47bd-8648-8e74cd7afff5	\N	\N	t	2 teeth; adult	NULL	30	4	SE	5		MBB	\N
d8c35303-0ee3-48d5-acb1-9448a5eb3535	\N	\N	f	MANDIBLE WITH TISSUE AND SKIN	NULL	31	1	SE	7		GM	\N
1164be04-da69-4b0a-99fc-e9eada0b349e	\N	\N	f	TEETH AND BRAIN	NULL	31	2	SE	15		GM	\N
9d5f5d66-8485-4a94-bdc0-a2e548cddbe2	\N	\N	f	Brain and membrane from inside skull; UKN	NULL	32	1	SE	5		MBB	\N
d83d1e96-d91f-47f8-85bf-4da292bcee77	\N	\N	f	5 teeth; adult (some tissue)	NULL	32	2	SE	9		MBB	\N
e05e9d2f-e894-4c2e-9985-d12793dd81cf	\N	\N	f	FOOT; ADULT	NULL	32	3	SE		2	CIE	\N
b2889d0e-ff89-4901-bf92-e3076a75a4cc	\N	\N	f	Foot sample (tissue and bone); adult	NULL	33	1	SE	19		MBB	\N
e06cfd93-e1e9-4832-b6d0-b4611f1d5855	\N	\N	f	3 rib fragments; sub-adult	NULL	33	2	SE	25		MBB	\N
42d431c5-a9cd-427d-a1e8-ecc81af74a6e	\N	\N	f	Scapula? UKN	NULL	34	1	SE	18		AWA	\N
f460b5b6-b46f-4947-b8d4-88dad627950b	\N	\N	f	RIBS	NULL	34	2	SE	15		GM	\N
59c33c6c-91a5-47fa-bd97-07fcdc93984a	\N	\N	f	Tissue from skull and jaw (muscle); UKN	NULL	35	1	SE	26		MBB	\N
d1cfaacd-aadf-4187-9393-0ce190218921	\N	\N	f	HAIR	NULL	35	2	SE	15		GM	\N
91ab8307-999f-444f-84d6-4c36d2415e7c	\N	\N	f	16 teeth; adult (some tissue)	NULL	36	1	SE	9		MBB	\N
1c8a341a-de0c-45a4-be4a-4130cb97102d	\N	\N	f	TEETH	NULL	36	2	SE	15		GM	\N
636f72a2-46b2-4b95-bfb2-ca51661988aa	\N	\N	f	SMALL TUBE W/ MUSCLE FROM JAW	NULL	36	3	SE		3	CIE	\N
4191bf1f-da19-4705-8263-2fcd48a43b4b	\N	\N	f	6 teeth; adult	NULL	36	4	SE	8		MBB	\N
24f0ed45-c23c-4e12-aa0d-740feed5cfa9	\N	\N	f	~9 rib fragments; adult	NULL	37	1	SE	14		MBB	\N
69c6b1d9-d25a-4dab-8074-27997c7cb282	\N	\N	f	Powdered bone sample	NULL	37	2	SE	21		MBB	\N
abc19efb-a42c-4179-a268-df0487417693	\N	\N	f	Powdered tooth sample	NULL	37	3	SE	21		MBB	\N
e0574eed-750e-4c7f-b019-6ec2c00128e9	\N	\N	f	Empty tube with dust residue	NULL	37	4	SE	17		MBB	\N
b5f730e8-8234-43c4-844e-f1159b665fa6	\N	\N	f	Tissue sample	NULL	39	1	SE	17		MBB	\N
a1b57fe7-2517-4d5e-99bc-8e31d4a4aae4	\N	\N	f	Tissue from vertebrae; UKN	NULL	39	2	SE	26		MBB	\N
f18ae64b-0858-4424-998c-7c495801cbae	\N	\N	t	Tooth; adult	NULL	39	3	SE	18		AWA	\N
6731ae8f-3bcc-455f-895c-39a71361ae04	\N	\N	f	1 femur; infant	NULL	40	1	SE	16		MBB	\N
631d6c89-791b-4861-b176-ddd0f05a91d0	\N	\N	f	Tissue (muscle and other); UKN	NULL	40	2	SE	26		MBB	\N
bbc36eb8-83ce-4933-add3-0a4b0da1bb38	\N	\N	f	SCALP AND HAIR	NULL	40	3	SE	11		GM	\N
620a2889-bbf3-40d6-86c6-fc65e479b476	\N	\N	f	Tissue sample	NULL	40	4	SE	17		MBB	\N
3cbdbf6c-b462-46c9-b4f2-179349c644d5	\N	\N	f	BRAIN	NULL	41	1	SE		2	CIE	\N
4cf8ec89-a03b-4a01-ad2d-1a1f3718b9bf	\N	\N	f	Tissue sample	NULL	41	2	SE	17		MBB	\N
6d8dcb13-2eea-4da9-9d2c-30004b1a7c2c	\N	\N	f	"REED FOR CARBON DATING"	NULL	41	3	SE		2	CIE	\N
dd0e3a66-18f3-48e7-aea2-9c4d328371b4	\N	\N	f	10 rib fragments; infant	NULL	42	1	SE	25		MBB	\N
b971c05c-d724-4e8b-91ec-779960a71caa	\N	\N	t	Tooth; adult	NULL	42	2	SE	18		AWA	\N
a19a73b7-b8e2-4fcb-9354-01f6976f3ea1	\N	\N	t	Tooth "M11"	NULL	42	3	SE	18		AWA	\N
9d22872c-73f6-4e4d-9347-3eb6d4083eb3	\N	\N	f	Empty tube with dust residue	NULL	43	1	SE	17		MBB	\N
00ee70f9-364d-4515-9286-9da749192b36	\N	\N	f	REED FOR CARBON DATING	NULL	43	2	SE		3	CIE	\N
ed2d10e5-8f9e-40ff-95f7-54b230547919	\N	\N	f	Tooth; adult	NULL	44	1	SE	18		AWA	\N
d677fbf2-58ab-4919-81f0-f32ff870d1f7	\N	\N	f	6 rib fragments; child	NULL	44	2	SE	16		MBB	\N
e11c705b-1949-4dcd-899c-d98e57c99800	\N	\N	f	7 rib fragments; adult	NULL	45	1	SE	19		MBB	\N
67e82471-5e85-4b53-99ce-298dfdce3f2b	\N	\N	f	17 teeth; adult	NULL	45	2	SE	1		AWA	\N
6986a4f9-255a-4578-9dd3-5c711222a505	\N	\N	f	2 bones and tissue (hand); adult	NULL	45	3	SE	19		MBB	\N
ce080e06-01d0-459b-8032-aa4bb7b7f979	\N	\N	f	14 broken teeth and fragments; child	NULL	46	1	SE	9		MBB	\N
862e096d-fcf1-4c37-98ef-72b97e3fcf7c	\N	\N	t	Tooth; adult "M12"	NULL	46	2	SE	18		AWA	\N
9079284b-db60-4539-8ab0-1fbe141cf48d	\N	\N	f	Tissue sample	NULL	46	3	SE	21		MBB	\N
310fd411-724d-46e1-83c6-5ee1b3fb2be7	\N	\N	f	Jaw with teeth and tissue; child	NULL	46	4	SE	19		MBB	\N
a8b25a35-fb3a-4066-a3ff-9bcbc4a5b013	\N	\N	f	Empty tube with dust residue	NULL	47	1	SE	17		MBB	\N
736567d5-4d7c-4077-9546-0037305ea41d	\N	\N	f	9 TEETH	NULL	47	2	SE	3		GM	\N
6fef50be-ce99-4d88-8ac9-a6bd93eb4001	\N	\N	f	1 finger (bone and tissue); UKN	NULL	47	3	SE	26		MBB	\N
28cab2e6-b271-4d37-b634-41238a211d35	\N	\N	f	Tissue sample	NULL	49	1	SE	21		MBB	\N
d95ace66-511b-4e05-b95a-cf02f3c15226	\N	\N	f	BRAIN	NULL	52	1	SE	15		GM	\N
c66c7321-5448-47cc-abe4-ee60750ae077	\N	\N	f	Tissue from arm; UKN	NULL	53	1	SE	26		MBB	\N
c9b4ffc2-887f-4613-94e0-8cf3b233d596	\N	\N	f	RIBS	NULL	\N	1	SE	15		GM	\N
0df8302a-357f-41a4-b409-2a75aaee56ae	\N	\N	f	Powdered tissue sample	NULL	8	1	SE	17		MBB	\N
533351c5-2687-495b-8006-4d6305e82184	\N	\N	f	10 teeth; adult	NULL	8	2	SE	5		MBB	\N
9ebfd3cc-702e-463f-ba5d-bed4af23542c	\N	\N	f	Broken tooth	NULL	13	1	SE	18		AWA	\N
2c11a00b-a87c-45dd-a67c-3c03e4900ec8	\N	\N	t	Tooth fragments	NULL	15	1	SE	18		AWA	\N
c1c16671-5ab6-4fc3-9d20-ce29559a1a90	\N	\N	f	Skin from face; UKN	NULL	16	1	SE	26		MBB	\N
a29720e5-11d7-47dc-9448-4a6625587564	\N	\N	t	TEETH	NULL	17	1	SE	15		GM	\N
8034add2-41ee-4e32-b841-1c30a8cbd4fc	\N	\N	f	4 bone fragments (ribs); hair; child	NULL	19	1	SE	25		MBB	\N
065cb689-c68e-431b-bbb6-0c43d8ea040d	\N	\N	f	1 finger (bone and tissue); adult	NULL	2	1	SE	26		MBB	\N
b53f0d23-b600-4632-b1b6-c85507ec8271	\N	\N	f	~4 bone fragments (face and skull); UKN	NULL	20	1	SE	25		MBB	\N
a763ca87-c63d-4726-ba4b-d94dea3e1843	\N	\N	f	Tissue from mouth; UKN	NULL	20	2	SE	26		MBB	\N
3d640853-53f0-425b-ad8c-2d6533f1b421	\N	\N	f	Skin	NULL	22	1	SE	20		AWA	\N
fb5f8ad0-5428-4314-9152-6ed265328b0b	\N	\N	f	Tissue between vertebrae; UKN	NULL	24	1	SE	26		MBB	\N
d4ca8eeb-046c-4d06-9b7e-c79e7b9a857b	\N	\N	f	2 bone fragments; tissue sample; UKN	NULL	29	1	SE	25		MBB	\N
c80eddba-f1bb-4f48-85a3-209ee509e722	\N	\N	t	Tooth; adult	NULL	29	2	SE	18		AWA	\N
bd447d21-de47-47fc-9c95-f81b416f77bf	\N	\N	f	Scalp and hair; UKN	NULL	30	1	SE	26		MBB	\N
a82348e9-e375-4243-9080-eba001265357	\N	\N	f	Brain; UKN	NULL	30	2	SE	26		MBB	\N
8c015064-213a-49e9-819d-55f1d6a66e50	\N	\N	f	TEETH	NULL	30	3	SE	15		GM	\N
4e736e82-bf62-4c31-a639-65d4d82add53	\N	\N	f	1 bone (clavicle) and tissue; Child	NULL	30	4	SE	28		MBB	\N
87cec47f-d7ff-4a0d-a46d-f397d5e3824c	\N	\N	f	Skin	NULL	31	1	SE	20		AWA	\N
d22fe29b-a83d-43f2-8207-1d24228d4a56	\N	\N	f	SKIN FROM "CHEST?"	NULL	32	1	SE		2	CIE	\N
2d58a07e-88d3-4a44-9599-af742ff5cce8	\N	\N	f	SOFT TISSUE	NULL	34	1	SE	15		GM	\N
2fa33cc3-374e-491d-80e7-e80a3ac28dbb	\N	\N	f	7 teeth; adult	NULL	35	1	SE	13		MBB	\N
dbaf62f4-9e72-44d4-80f1-ca42e5549eed	\N	\N	f	SKIN, HAIR, TEETH, AND RIBS	NULL	37	1	SE		6	GM	1998
b41abc90-115f-419c-89aa-d662da648de9	\N	\N	f	Broken tooth	NULL	37	2	SE	18		AWA	\N
0b1582f8-652f-435b-b37b-4c985096c63a	\N	\N	f	TEETH	NULL	38	1	SE		6	GM	\N
9c4c1453-6345-4d2f-924e-49d11e359c80	\N	\N	f	Hair	NULL	38	2	SE	18		AWA	\N
b8e5c545-e3a1-4332-8f8c-eea11f8e0e8b	\N	\N	f	Skin	NULL	38	3	SE	18		AWA	\N
efd82317-b63c-45ee-a548-9299384ec692	\N	\N	t	Ribs	NULL	38	4	SE	18		AWA	\N
f9743cbe-f600-471f-989f-76bb3b13c5de	\N	\N	f	Brain	NULL	39	1	SE	18		AWA	\N
4252194d-af4f-4d68-bf34-8916f69b9f60	\N	\N	f	TIBUOLA	NULL	40	1	SE		7	GM	\N
5c61054f-ad67-4265-a95c-8fce70db85d0	\N	\N	f	SKIN ?	NULL	41	1	SE	11		GM	\N
c115533e-236e-439d-91e1-70fc3b70e913	\N	\N	f	9 teeth; adult	NULL	41	2	SE	1		AWA	\N
87895ce2-d20a-438c-9d18-74a3ba31ec35	\N	\N	f	Skin from femur; UKN	NULL	41	3	SE	26		MBB	\N
6749f8da-cc71-4a05-b3d0-1f48fa42b847	\N	\N	f	2 rib fragments; adult	NULL	42	1	SE	14		MBB	\N
99bc6ab1-ac5c-4d09-8da9-0b11cb5966ee	\N	\N	f	LEG W/ TISSUE; INFANT	NULL	44	1	SE		2	CIE	\N
ddf7b6e1-db8c-4535-918a-3b3087a8bf05	\N	\N	f	10 teeth; adult	NULL	44	2	SE	8		MBB	\N
9e32d9a3-0e51-463d-84d6-e99df574996e	\N	\N	f	Tissue; UKN	NULL	45	1	SE	26		MBB	\N
ca5c3af2-6896-4794-8cf6-fdef7d002296	\N	\N	f	Tissue from hand; UKN	NULL	47	1	SE	26		MBB	\N
106df40f-b79c-4608-b509-980d0cf2a9d0	\N	\N	f	Scalp with hair; UKN	NULL	48	1	SE	26		MBB	\N
b28dd95e-ab9a-4917-bf2c-987f94b0091a	\N	\N	f	Reed	NULL	48	2	SE	26		MBB	\N
2853e9f8-17be-42a6-8a7b-74f829ae0b98	\N	\N	f	Tissue (skin and muscle) from leg; UKN	NULL	48	3	SE	28		MBB	\N
1d48ab35-4877-466a-b0de-dccf600dc14e	\N	\N	f	Bone and tissue from hand; adult	NULL	49	1	SE	28		MBB	\N
2f858120-f98c-499b-9ff4-7295e4d98613	\N	\N	f	Skin from eyes and face (including eyebrows); UKN	NULL	50	1	SE	28		MBB	\N
096bd882-1e60-46f5-9ea9-72192fc2734d	\N	\N	f	SKIN FROM CHEST	NULL	50	2	SE		2	CIE	\N
6b1664eb-8e8f-455a-9130-c64b1a830835	\N	\N	f	HAIR	NULL	50	3	SE		2	CIE	\N
c6737644-7525-4636-aba7-1b030911129a	\N	\N	f	Tissue sample	NULL	52	1	SE	17		MBB	\N
9a2275e6-7a1f-43fa-8fd8-648f4d9c69cb	\N	\N	f	UPPER FEMUR AND SOCKET; ADULT	NULL	55	1	SE		3	CIE	\N
33939462-e35c-4679-8da2-a4b995e1b7fb	\N	\N	f	1 bone (femur); infant	NULL	7	1	SE	14		MBB	\N
a571836e-2b25-4586-b4b7-ab7454798872	\N	\N	t	Vertebrae; child	NULL	8	1	SE	5		MBB	\N
d4d202bd-6af2-4e85-93d3-1892902de812	\N	\N	f	2 femur fragments; child	NULL	22	1	SE	5		MBB	\N
334ac0eb-08a3-47e6-8d04-0352e9b21a35	\N	\N	f	1 bone fragment (radius); adult	NULL	44	1	SE	16		MBB	\N
1bf7778d-c1ff-4fe3-825b-7190cff3c6b6	\N	\N	f	9 teeth; adult	NULL	2	1	SW	5		MBB	\N
7e5f57c6-5969-4b46-8c34-bd130dc156ad	\N	\N	f	Broken tooth; child	NULL	4	1	SW	18		AWA	\N
69837ce8-5447-4432-b774-384d1c76223a	\N	\N	f	~8 broken teeth; child	NULL	10	1	SW	5		MBB	\N
2e5aaeae-3131-416b-b909-ce2202e95299	\N	\N	f	~6 rib fragments; child	NULL	12	1	SW	5		MBB	\N
150e87eb-c95a-43b4-a9c1-ac784d024bff	\N	\N	f	5 rib fragments; adult	NULL	16	1	SW	16		MBB	\N
6999fa02-6910-4a0e-9e87-f4855b0fb77d	\N	\N	f	Teeth; adult	NULL	20	1	SW	18		AWA	\N
9d621b1e-0da7-469f-8960-b83a24a67037	\N	\N	f	Powdered tissue sample	NULL	22	1	SW	17		MBB	\N
fd95cf7c-ad2f-4d24-ae98-679b397d8982	\N	\N	f	6 TEETH; ADULT	NULL	22	2	SW		4	CIE	\N
7226d5d7-e866-4e0f-b450-51e855f2ed60	\N	\N	f	SCALP AND HAIR	NULL	27	1	SW		4	CIE	\N
5984bd2b-b40b-4051-9907-54fc988d7fe7	\N	\N	f	Powdered tissue sample	NULL	32	1	SW	17		MBB	\N
4aa45466-9aa8-4bb0-88d4-6b5d7bf95ae8	\N	\N	f	Powdered tissue sample	NULL	34	1	SW	21		MBB	\N
10ec3283-c96d-4f8f-8d6f-114b79376aff	\N	\N	f	Powdered tissue sample	NULL	35	1	SW	17		MBB	\N
049f611f-6c4c-4abf-ae63-ca7c75397d5b	\N	\N	t	2 teeth; adult	NULL	36	1	SW	5		MBB	\N
afef864c-c46e-4d6b-b310-7fd1256d2a0b	\N	\N	f	EYE	NULL	38	1	SW		4	CIE	\N
5bb4c7ef-73aa-4c21-8a8c-d15c2336afc9	\N	\N	f	RIB FRAGMENTS	NULL	38	2	SW		4	CIE	\N
2cf81221-3047-4b29-9579-ec0f0a010794	\N	\N	f	WOOD FRAGMENTS AND SOIL?	NULL	38	3	SW		4	CIE	\N
50fb9adc-06c5-4fe8-973c-bd05c407559f	\N	\N	t	Tooth; adult	NULL	40	1	SW	18		AWA	\N
0e6d1029-3d9e-4ec9-85ba-f672fd2cadde	\N	\N	f	TEETH	NULL	42	1	SW	15		GM	\N
1dfe8835-0190-4a21-9df0-85f259001b7d	\N	\N	f	4 rib fragments; child	NULL	43	1	SW	16		MBB	\N
b564f541-1651-4db5-83a3-a29d176f38aa	\N	\N	f	TEETH	NULL	44	1	SW	15		GM	\N
26ebc616-6683-4446-a1aa-12d61401fdb6	\N	\N	f	SALT TISSUE	NULL	48	1	SW	15		GM	\N
a4b5e369-a15d-4c4f-bdf6-8eb35e0d9f68	\N	\N	f	RIBS	NULL	50	1	SW	15		GM	\N
015b40de-d1ba-47d9-8e85-2b8fb47a3aa5	\N	\N	f	Powdered tissue sample	NULL	54	1	SW	21		MBB	\N
30e7a7ac-1c5b-4975-b392-68276bee5a5e	\N	\N	f	BRAIN	NULL	55	1	SW	15		GM	\N
fdd4f713-e70c-4303-9844-05633e059709	\N	\N	f	BRAIN	NULL	55	2	SW	15		GM	\N
61a793b5-fc2e-45bd-bdff-5289a2710a83	\N	\N	f	TISSUE FROM FACE	NULL	56	1	SW	15		GM	\N
dd998b7c-385c-4127-85e0-d832461d870f	\N	\N	f	Powdered tissue sample	NULL	59	1	SW	21		MBB	\N
859548b4-6ae8-4d2f-9de0-558c91070666	\N	\N	f	Empty tube with dust residue	NULL	10	1	SW	17		MBB	\N
81675e54-adc7-4a21-a998-31cdf86fd5d6	\N	\N	f	Powdered tissue sample	NULL	11	1	SW	21		MBB	\N
f3d7a553-ba43-4270-9b13-deeda9ae3149	\N	\N	f	Powdered tissue sample	NULL	11	2	SW	17		MBB	\N
d2c22e51-b43a-493c-b362-1a81e1253e5f	\N	\N	f	5 rib fragments; child	NULL	12	1	SW	25		MBB	\N
b294e880-bad8-4bd0-9433-278a413936e0	\N	\N	f	13 teeth; child	NULL	13	1	SW	1		AWA	\N
fce1d9eb-85c1-45d6-bd0b-264b8c7a4a04	\N	\N	f	Soft tissue; UKN	NULL	17	1	SW	26		MBB	\N
e94c09de-c66f-40ea-a8ff-047381a040ea	\N	\N	f	1 femur fragment and other bone; child	NULL	2	1	SW	28		MBB	\N
8a191a0a-60f7-4de6-bf07-e48e2df14e47	\N	\N	t	~8 teeth; adult	NULL	2	1	SW	1		AWA	\N
204cf696-f717-47b9-88be-2f2e8a911c23	\N	\N	f	TEETH	NULL	24	1	SW	15		GM	\N
ffa00f78-1c98-4b51-a6ea-42de8089a10f	\N	\N	f	RIBS	NULL	24	2	SW	15		GM	\N
7ff14c7e-c231-4831-a130-91ab2e764f76	\N	\N	f	BRAIN	NULL	24	3	SW	15		GM	\N
423bd35f-8074-465a-8aa7-67721684b5c7	\N	\N	f	TISSUE FROM MOUTH	NULL	26	1	SW	15		GM	\N
da31a61c-69d7-475c-881d-8ca24917aa9f	\N	\N	f	TEETH	NULL	27	1	SW	15		GM	\N
fc2f9205-0432-485f-af3a-11489d67288a	\N	\N	f	Tooth fragments	NULL	27	2	SW	17		MBB	\N
b301fb0a-4b71-450d-b55c-dfe55b27a08f	\N	\N	f	Brain sample	NULL	28	1	SW	21		MBB	\N
91502268-796d-4c9e-9bfa-04100927cb59	\N	\N	f	CLAVICAL	NULL	3	1	SW	15		GM	\N
f571765a-27bd-400a-8e59-d07ab4300c7e	\N	\N	f	RIBS	NULL	3	2	SW	15		GM	\N
cb2beed9-9763-499a-b26e-8b4c9c8350f1	\N	\N	f	FEMUR	NULL	32	1	SW	15		GM	\N
b43a1430-4164-474c-a906-87279d270119	\N	\N	f	Empty tube with dust residue	NULL	34	1	SW	17		MBB	\N
5d003722-032a-4864-ba96-560353fed471	\N	\N	f	SOFT TISSUE	NULL	34	2	SW	15		GM	\N
28057c79-ce15-43fc-bb27-6d58e0ffb047	\N	\N	f	"#3 or 2; skin from head"	NULL	38	1	SW	31		AWA	\N
ef1257d1-d8d9-48a5-9dcf-091933b19355	\N	\N	f	13 teeth; adult	NULL	39	1	SW	5		MBB	\N
7ab7da0d-831e-478a-9690-86e4022aa69e	\N	\N	f	8 broken teeth fragments; adult	NULL	4	1	SW	13		MBB	\N
a33fd4e7-464b-47ba-9c4c-3501e361e5c1	\N	\N	f	1 rib fragment; sub-adult	NULL	40	1	SW	16		MBB	\N
8415c8b6-0511-4e08-af0c-b363078322f0	\N	\N	f	4 rib fragments; child	NULL	40	2	SW	16		MBB	\N
86b42b5a-86ff-4337-afd1-94df23361aff	\N	\N	f	Powdered tooth sample	NULL	42	1	SW	21		MBB	\N
bf142953-7f4f-4a15-86ad-19d3d401ce93	\N	\N	f	TISSUE	NULL	43	1	SW	15		GM	\N
aa5c7e93-2916-49b3-9a97-17bbf9891cc6	\N	\N	f	6 rib fragments; child	NULL	43	2	SW	16		MBB	\N
4a5f06e2-4436-44af-a39d-4616148915f6	\N	\N	f	Radius	NULL	44	1	SW	18		AWA	\N
7ead3f7f-f2e1-411c-bf3f-ab5c89978683	\N	\N	f	Brain	NULL	44	2	SW	18		AWA	\N
e7bc325c-629d-45a7-9073-02d1963d0686	\N	\N	f	MOUTH TISSUE	NULL	44	3	SW	22		GM	\N
98294295-59a5-47db-8add-c717cccbd034	\N	\N	f	Soft tissue from skull	NULL	46	1	SW	18		AWA	\N
2c03095f-6d69-4c1f-b2ab-58011276fc99	\N	\N	f	Ribs	NULL	48	1	SW	18		AWA	\N
ad932c5a-54fa-4574-a3c4-b06bf04d974b	\N	\N	f	REED	NULL	5	1	SW	7		GM	\N
90bbbcb1-3a6f-4d66-8769-b3ad82490202	\N	\N	f	Broken teeth	NULL	51	1	SW	1		AWA	\N
3d3b49cf-94a0-46f2-83a3-00c8be824ddc	\N	\N	f	Eyes, tissue and skin from head	NULL	53	1	SW	20		AWA	\N
5432133e-f0d5-482f-8b4d-d8e5379859cf	\N	\N	f	Foot	NULL	54	1	SW	20		AWA	\N
b4ed5386-8cd9-4724-96cd-02f9a74ca2ef	\N	\N	f	1 tooth; adult ("Green #2") - written on tube	NULL	54	2	SW	21		MBB	\N
7af723da-71c4-4bd7-80c8-529afe6ae55a	\N	\N	t	~8 broken teeth; adult	NULL	54	3	SW	5		MBB	\N
42323ed6-8e0d-4d01-b5ca-bfbf24e3faa2	\N	\N	f	~20 rib fragments; infant	NULL	55	1	SW	16		MBB	\N
a3d882e1-fdbe-42da-b599-4abc404dca50	\N	\N	f	Tissue from skull and hair; UKN	NULL	55	2	SW	5		MBB	\N
6200b1f7-ffd0-4a63-a2e5-0e006d11283d	\N	\N	f	11 teeth; adult	NULL	57	1	SW	2		MBB	\N
84db8159-668e-4d91-8f76-803dc655b2d2	\N	\N	f	6 rib fragments; child (some tissue)	NULL	57	2	SW	14		MBB	\N
68c5540b-2db0-4c7f-834e-a8b94e84f82d	\N	\N	f	4 teeth; adult	NULL	57	3	SW	13		MBB	\N
d68b1735-ae35-4a25-8f62-2c1a1cf82fa2	\N	\N	t	Tooth; child	NULL	59	1	SW	18		AWA	\N
cb7accb6-18af-4c72-8038-d5a4e2dbe425	\N	\N	f	Powdered tissue from tibia	NULL	59	2	SW	21		MBB	\N
d6fd3d4f-111d-4a88-a89b-82e9b48ee27b	\N	\N	f	TISSUE FROM FINGER	NULL	59	3	SW	22		GM	\N
6bbc9d04-33a0-4f4a-918c-7478ab889ba8	\N	\N	f	SKULL	NULL	6	1	SW	22		GM	\N
58ad260f-451d-4f5c-a2bc-df6a93c70e14	\N	\N	f	Foot	NULL	7	1	SW	20		AWA	\N
3ef73f99-5bbb-4c03-84eb-fa56ef021edf	\N	\N	f	tissue fragments; UKN	NULL	9	1	SW	16		MBB	\N
d9390285-c626-413c-bd33-793ba8be0a37	\N	\N	f	RIBS ENTAMANBLE	NULL	1	1		22		GM	\N
981ff856-509e-4d98-93eb-0e2206c7b1b3	\N	\N	f	SKIN FROM FOOT	NULL	1	2		22		GM	\N
48c791e3-845c-483a-bf11-4a76cb1d660c	\N	\N	f	HAIR IN SCALP	NULL	3	1		22		GM	\N
5dbc10b4-c12b-4486-9ec4-f76ae808782a	\N	\N	f	Foot sample and 2 broken tooth; child	NULL	3	2		19		MBB	\N
48123758-376e-4823-bc33-9501ba03f058	\N	\N	f	7 rib fragments and other tissue; infant	NULL	3	3		19		MBB	\N
53200aee-e1c0-4e5e-8099-0c0cbf1e659c	\N	\N	f	Tooth; adult	NULL	4	1		18		AWA	\N
f855897a-0dbe-4558-a9dc-9b19051a26c1	\N	\N	f	SKIN FROM FOOT	NULL	4	2		22		GM	\N
5c6bb1de-539e-4fd0-aa6e-4d32bfd5cc71	\N	\N	f	6 skull fragments; 12 broken teeth; child	NULL	6	1		16		MBB	\N
1d3278f3-adcd-443c-bfa6-0c85c8221da0	\N	\N	f	Tissue sample	NULL	6	2		17		MBB	\N
d972a6d5-1c7c-4861-9e67-dbd68d43ef9b	\N	\N	f	Bone fragments	NULL	7	1		17		MBB	\N
f0ee0482-8d65-4713-8ac6-61e36901350b	\N	\N	f	Tissue sample	NULL	8	1		17		MBB	\N
7fa6c874-9e31-418b-ad6d-590870f2cfb1	\N	\N	f	7 rib fragments; child	NULL	8	2		16		MBB	\N
85466df0-a666-41d8-949d-a7077afbccbd	\N	\N	f	Bone and tissue from foot; UKN	NULL	9	1		27		MBB	\N
ac37ff8b-096d-4d15-b8ed-46b436908dce	\N	\N	f	SKIN FROM FOOT	NULL	9	2		22		GM	\N
1813f7d0-da85-466d-bb75-7f5ef3b668e1	\N	\N	f	TEETH- CHILD	NULL	10	1		15		GM	\N
ec47ef1e-2789-4417-875a-d73147f420ec	\N	\N	f	SKIN?	NULL	11	1		22		GM	\N
c3854960-6cf6-4adc-8547-582fbe6d1f87	\N	\N	f	~7 broken teeth and some bone; adult	NULL	11	2		2		MBB	\N
ffd56545-596a-4e19-9adf-3571cfcd7a75	\N	\N	f	Skin?	NULL	11	3		25		AWA	\N
f10ab2e1-d4d4-444f-9a43-90fd24a32893	\N	\N	f	Rib; child	NULL	11	4		25		AWA	\N
005b44e9-a599-4e81-948d-9fb394d65b9b	\N	\N	f	RIBS	NULL	12	1		15		GM	\N
7e226553-fd29-43a7-82d1-5a473cbb9c77	\N	\N	f	"Rib #2 (diff)" - Written on the tube; 1 rib and fragments; adult	NULL	12	2		16		MBB	\N
79c990d4-d54c-4e11-bffc-0af283ca7e58	\N	\N	f	5 TEETH AND TISSUE; ADULT	NULL	16	1		12		CIE	\N
2dbdc438-1915-4776-b0fc-63e71762d1f9	\N	\N	f	11 teeth; adult	NULL	23	1		9		MBB	\N
248a06f7-d64a-408d-b963-a8e477c5edcd	\N	\N	f	10 teeth; adult	NULL	23	2		5		MBB	\N
30fbf11b-3841-487f-8fe4-c20e418e0aea	\N	\N	f	Tissue or maybe seed sample	NULL	23	3		21		MBB	\N
d77ebf06-6b60-4d46-982f-65d50b98df73	\N	\N	f	UNKNOWN TISSUE	NULL	24	1				CIE	\N
57899e7d-8151-48da-8e26-54f8b213cdc1	\N	\N	f	"Reed for c14" - Written on tube	NULL	25	1		16		MBB	\N
4f9a6f26-ba2c-4182-9a15-0c7373c33642	\N	\N	f	SKIN FROM FOOT	NULL	28	1		22		GM	\N
8e7f5520-5c8c-498d-b452-3c3b39dd8ff7	\N	\N	f	Part of mandible, pieces of skull, scalp and hair, tibia with some tissue	NULL	2172	1		20		AWA	\N
3ba2ab7d-efba-49c7-95ee-876acaaea096	\N	\N	f	Fragments of skull, scalp and hair, femur, clavicle, jaw; infant	NULL	2172	2		19		MBB	\N
5289490a-54bf-4dd1-b218-6ed7033195c0	\N	\N	f	Mouse fur; ("North wall") - written on bag	NULL	2249	1			1	MBB	\N
7bbbdd9d-35b0-4159-bacf-5706073f06c6	\N	9	f	Skin and piece of bone	NULL	1	1		33		AWA	1998
04a9a8b1-45ab-40ac-a993-bbc673b6a3f5	\N	\N	f	Powdered tissue sample	NULL	1027	1		21		MBB	\N
e7cd81d1-5200-4d86-9ee9-7b7cec0937a3	\N	\N	f	TEETH- AREA 18 # I	NULL	1027	2			7	GM	1989
61a496e9-7f69-48bf-ac44-05661bc282b7	\N	\N	f	6 tubes with tissue samples and bone fragments; UKN ("SOHAG") written on bag	NULL	1680	1			5	MBB	1993
6baa10a2-dd9e-4653-a0f7-5f0ee8c765c4	\N	\N	f	2 rib fragments; UKN ("SOHAG") written on bag	NULL	1680	2			5	MBB	1993
8d160b6c-d542-4ff0-87f6-a2cb0bd907c7	\N	\N	t	2 tubes with tooth fragments; UKN	NULL	1680	3			5	MBB	1993
7a738390-e671-4d1e-80d0-abf0c496fbed	\N	\N	f	Pupae cases; ("SOHAG") written on bag	NULL	1680	4			5	MBB	1993
d4140f8c-e796-4884-8716-d1de6b3b6ed6	\N	\N	t	Tooth fragments; UKN ("SOHAG") written on bag	NULL	1680	5			5	MBB	1993
f6ef7559-a8d4-48d7-a07f-9137e908451a	\N	\N	f	TEETH "ARIA I"	NULL	1777	1			6	GM	\N
2e46c259-0bc0-4c9d-b690-fb4060290b3e	\N	\N	f	TEETH "ARIA I"	NULL	1779	1			6	GM	\N
2aa11d79-9df2-4609-b4ad-24ebd73f8b03	\N	\N	f	TEETH "ARIA I"	NULL	1779	2			6	GM	\N
dab8103b-664b-4fd5-8ae9-85e7c281c7c0	\N	\N	f	11 teeth; adult	NULL	2	1		5		MBB	\N
09da1acb-0b2b-41ea-920c-bf4329a38d6f	\N	\N	t	~8 broken teeth and fragments: adult	NULL	20	1		8		MBB	\N
eef106c8-8b35-467a-85d6-eb36ab846d35	\N	\N	f	10 teeth; adult	NULL	2172	1		5		MBB	\N
656e91d3-f335-46c1-b283-2acfb2951ce8	\N	\N	f	Rib fragments; child	NULL	22	1		5		MBB	\N
ed019bb7-a5d4-449b-bd6a-97cbb985853a	\N	\N	f	Brain; UKN	NULL	22	2		5		MBB	\N
840c0f29-798f-4f7d-9908-c92ff71728ab	\N	\N	f	Radias; child	NULL	22	3		5		MBB	\N
f8a719bb-1eec-40e4-83ac-0d6590905313	\N	\N	f	11 teeth; adult	NULL	25	1		5		MBB	\N
2c263130-0213-4914-a359-71a5d1a3dd99	\N	\N	f	3 skull fragments; ("18B93") - written on tube	NULL	3	1		5		MBB	\N
278e90b7-3574-4a93-a473-a967f28d8967	\N	\N	f	"FOURTH ONE WITHOUT NUMBER" and "1989 Area 11 #9"	NULL	44325	1			3	CIE	\N
6a5a9d52-d1ea-4f98-b5b7-d0c7383ec003	\N	\N	f	Empty tube with dust residue	NULL	\N	1		21		MBB	\N
e6e811e6-724f-4d9d-acfa-ec7d4e1ceeb6	\N	\N	f	3 rib fragments; child ("Well wrapped burial?") - written on tube	NULL	\N	2		5		MBB	\N
1ac79aa5-2497-4c34-8ecd-14ad3255d672	\N	\N	f	("Unidentified") - written on tube	NULL	\N	3		5		MBB	\N
0809700f-1223-40e2-bc37-722b8e5c3849	\N	\N	f	Plant sample; ("Alexander") -written on tube	NULL	\N	4		17		MBB	\N
82f4b5f9-cc13-4c2b-a243-d5c3f893ea06	\N	\N	f	Empty tube with dust residue; ("ACHA2 15I92") - written on tube	NULL	\N	5		17		MBB	\N
75abc6af-7981-42e4-b908-c77ee70fc8fd	\N	\N	f	Powdered tissue sample; ("42BO 763 FS-41") - written on tube	NULL	\N	6		17		MBB	\N
2c882652-fb4c-4999-8e4b-47e7494492c9	\N	\N	f	Powdered tissue sample; ("42BO 763 FS-41") - written on tube	NULL	\N	7		17		MBB	\N
0bee0258-54bf-43c9-b8a9-e82b2e40c9b9	\N	\N	f	Bone dust; ("M+ Carm") -written on tube	NULL	\N	8		21		MBB	\N
dca8651f-9d96-42a3-a599-cfba2f3b736c	\N	\N	f	LONG BONE POWDER	NULL	\N	9		23		GM	\N
f2237ae2-8cdc-4532-8e9d-f8a0df0d8587	\N	\N	f	(CANT READ)..SOMETHING GRAVE.....JAW BONE POWDER	NULL	\N	10		23		GM	\N
0c5f341e-7c23-487a-90ff-72046bdfb366	\N	\N	t	3 TEETH (WITH FILLINGS?)	NULL	\N	11		23		GM	\N
c89a133f-af26-48ea-9481-de15b7e553cf	\N	\N	f	"Goldfinger"	NULL	\N	12		25		AWA	\N
39cd1c9e-320a-4e24-9975-4e92c348ef9a	\N	\N	f	6 teeth; adult	NULL	\N	13		25		AWA	\N
c57fb669-24c9-49d1-84b5-195c194563a6	\N	\N	f	"No head, no tag; child; ribs"	NULL	\N	14		25		AWA	\N
b44c471c-55a5-4829-a15d-a6f605d0adef	\N	\N	f	"Adult; No head, no tag; tissue from pelvis."	NULL	\N	15		25		AWA	\N
fc3a2099-0df2-423d-8041-8f023c276ad3	\N	\N	f	"Adult; No head, no tag; tissue from ankle."	NULL	\N	16		25		AWA	\N
c464b056-c020-48b1-9462-1bdaea07f9a9	\N	\N	f	"No head, no tag; child; skin tissue"	NULL	\N	17		25		AWA	\N
d8d19223-8679-470d-8aa7-60880bdcb1d2	\N	\N	f	CUT (OR CAT) #1	NULL	\N	18		29		GM	\N
06f399ce-984e-4342-999c-fba22d0caa1f	\N	\N	f	8 TEETH; ADULT "BLONDIE, OUT OF AREA"	NULL	\N	19			1	CIE	\N
906d03a8-a2d2-4242-83b6-13a3ed7bd862	\N	\N	f	TISSUE FROM PELVIC REGION; ADULT "NO HEAD, NO TAG"	NULL	\N	20			1	CIE	\N
f4f61b77-f11c-40fa-a12e-d2a9efdb54d9	\N	\N	f	THORACIC REGION MASS, UNK INDIVIDUAL	NULL	\N	21			4	CIE	\N
67c5122d-99d1-45e9-9eab-0632a7f39522	\N	\N	f	ABDOMEN?; UNK INDIVIDUAL	NULL	\N	22			4	CIE	\N
61522f7d-56f0-4a04-9169-571398fce21b	\N	\N	f	Rib fragment; UKN	NULL	\N	23			5	MBB	\N
37e480c1-c329-46cf-ac52-4fd95b5cb730	\N	\N	f	"004I" Cat skull	NULL	\N	24		LARGE ITEM	4	AWA	\N
14045cad-1f82-4ad2-b99c-3b048c3a38be	\N	\N	f	TEETH- POSSIBLY 1998- BLANK SAMPLE	NULL	\N	25			6	GM	\N
4595c95a-6c8b-4558-8854-ace150c71c5c	\N	\N	f	TEETH- POSSIBLY 1998- BLANK SAMPLE	NULL	\N	26			6	GM	\N
87508d4e-c0d0-460f-9656-eb07cc0f0e63	\N	\N	f	TEETH- NO LABEL	NULL	\N	27			7	GM	\N
a0662f3e-f3fe-41c8-88d1-c50805b92884	\N	\N	f	TEETH- NO LABEL	NULL	\N	28			7	GM	\N
4b6f38fd-5307-4de5-a42d-8c0387b67f5a	\N	\N	f	TEETH- AREA I	NULL	\N	29			7	GM	\N
c262efc4-4dd1-4b00-9de0-46919685bd57	\N	\N	f	TEETH- "A 27 ACQUOR FOUND 88"	NULL	\N	30			7	GM	\N
e674c2a9-b4ed-44c7-9c8b-42b6aad3b5c5	\N	\N	f	TEETH- "18 W/ A"	NULL	\N	31			7	GM	\N
e1a47f69-27ac-47fb-975c-79304d6bbcdc	\N	\N	f	TEETH- "SQ I # 3"	NULL	\N	32			7	GM	\N
de75e022-d90b-46de-899d-347a6b3357b9	\N	\N	f	LEFT LITTLE FINGER AND NAIL; MUSCLE FROM INSIDE FOREARM	NULL	\N	33			8	GM	\N
11480912-6218-4384-844b-2748a45337dd	\N	\N	f	SKULL ?	NULL	\N	34			8	GM	\N
c48ec965-f2c0-44c6-93d8-d22ca6cb5f20	\N	\N	f	SKIN ?	NULL	\N	35			8	GM	\N
de2294b5-641b-41af-a83e-2edc766ceaa1	22b620d8-5da5-45ea-8187-a17639a2ce8b	\N	f	Brain and membrane from inside skull; UKN	NULL	27	1	SW	5		MBB	\N
2390fde2-02be-40ce-8fac-8e4905829944	fd0df308-3bb4-4b07-a0b4-6a8ddf4e682e	\N	f	10 teeth; adult	NULL	18	1	SW	5		MBB	\N
7509126d-c340-42ff-8511-a46f0dd0cd4e	4bf59054-2542-4f6b-a570-e7371723e2b0	\N	f	10 teeth; adult	NULL	9	1	NW	5		MBB	\N
d704e3f8-c524-4112-9e1f-9a761e97dce8	3a4a0f8e-0e66-4339-a425-3bec2f5c7061	\N	f	10 teeth; adult	NULL	33	1	NW	5		MBB	\N
99ec933a-a093-4645-972f-e12db19fcd86	\N	\N	f	18 teeth; adult	NULL	2	1	18	5		MBB	\N
ec55153f-72ae-42b9-87a8-434b6a871ac3	f8ae9c87-8f94-48b2-91a0-1ded77135c2a	\N	f	8 teeth; adult	NULL	9	1	SW	5		MBB	\N
1d57bbaa-a7f3-4ab8-a030-fc03298b73e7	\N	\N	f	10 teeth; adult	NULL	44355	1	SW	5		MBB	\N
20fbb198-eefd-4baf-ab1a-97129806b830	\N	\N	f	11 teeth; adult	NULL	15	1	NW	5		MBB	\N
2d4c2310-6e1b-469c-a72b-c73c95be8b39	3e2a1332-e0b8-47b7-b024-c87f9ee02c82	\N	f	5 teeth; adult	NULL	36	1	NW	5		MBB	\N
c657c75b-1e21-487b-b2d3-48dafd66199e	19a342f9-d4d4-4226-9422-a860d43eba02	\N	f	11 teeth; adult	NULL	7	1	NW	5		MBB	\N
41eef875-7615-4610-b7c9-729e4e315aac	df3a2d76-ae81-4c95-9191-03ad025cbaba	\N	f	~14 broken teeth; adult	NULL	44	1	NW	5		MBB	\N
1e60fa85-1b1c-4fff-a42c-6379f7f93f4f	94eb8d9a-5b30-415e-90f2-4b497cab9a25	\N	f	~5 broken teeth; fragment of textile; child	NULL	13	1	NW	5		MBB	\N
bc059ea8-016c-4a3e-aec2-a63bf863de0e	32482789-c995-4258-97be-f288b85ddbe7	\N	f	13 teeth; child	NULL	14	1	NW	5		MBB	\N
41e5c3bb-0c3c-4bbb-b998-2a57dc42357d	6c9c0b1b-d740-4c1b-8ee4-9570c634f3f7	\N	f	7 teeth; adult	NULL	20	1	NW	5		MBB	\N
7a8cc5c7-75c6-4fc7-a8c8-34a150ff00f6	3e1bf414-67f3-4e83-bd6f-803dff798ecb	\N	f	9 teeth; adult	NULL	30	1	NW	5		MBB	\N
12e980b2-856e-4237-8f61-4088285bab32	\N	\N	f	13 teeth; adult	NULL	10	1	11	5		MBB	\N
8827047b-1481-49de-bc13-dc886c729c3b	\N	\N	f	14 teeth; adult	NULL	6	1	11	5		MBB	\N
6497b9cf-0b5c-4f2a-b9b8-2cea7dda10d0	\N	\N	f	10 teeth; adult	NULL	3	1	4	5		MBB	\N
58ba97c0-50aa-4a66-be92-393a4162c0fb	\N	\N	f	6 teeth; adult	NULL	5	1	4	5		MBB	\N
3d3807d3-258c-4ac9-ad3a-167606259f3a	\N	\N	f	11 teeth; adult	NULL	2	1	4	5		MBB	\N
2650b9ba-8ffe-40fe-ac85-35120c78712a	\N	\N	f	9 teeth; adult	NULL	2	1	3	5		MBB	\N
b891e4b9-4256-4f5d-b118-8e5bcc8428cb	\N	\N	f	11 teeth; adult	NULL	2	2	3	5		MBB	\N
0bb382ac-9ac1-4a87-a74d-deef1d2ce86c	\N	\N	f	15 teeth; adult	NULL	3	1	3	5		MBB	\N
b5fa7564-2648-41c7-b42f-86e21a9eab38	\N	\N	f	9 teeth; adult	NULL	4	1	3	5		MBB	\N
7735ee12-1c61-499b-852a-c04dacec6c6d	\N	\N	f	6 teeth; adult	NULL	6	1	3	5		MBB	\N
5eff6c83-ff31-420a-9875-25a3b943f561	1cbe9a04-6c84-4d6e-b901-0b6966002525	\N	t	8 teeth; child	NULL	42	1	SW	5		MBB	\N
97c79ece-5f85-46c3-95c2-96e83d497c8c	6ce9c973-c6d8-4c18-a505-9bd3a38523ad	\N	f	Tissue; UKN	NULL	10	1	SE	5		MBB	\N
5ff2ddd9-3a81-4fd1-adc0-d33ddadf194e	6ce9c973-c6d8-4c18-a505-9bd3a38523ad	\N	f	~14 rib fragments; child	NULL	10	2	SE	5		MBB	\N
a36a3d8d-b0c3-4823-8949-609a291d9a69	6ce9c973-c6d8-4c18-a505-9bd3a38523ad	\N	f	2 bone fragments; UKN	NULL	10	3	SE	5		MBB	\N
a77e2ec0-22ee-4c80-bca7-801d7099db82	\N	\N	f	Tissue from skull and hair; UKN	NULL	6	1	SW	5		MBB	\N
cfc2342b-51a4-4a38-8211-d0a4aa009ec4	\N	\N	t	~8 broken teeth; adult	NULL	6	2	SW	5		MBB	\N
bb451e27-f4d7-4467-a0f5-e40b2123fac5	1cbe9a04-6c84-4d6e-b901-0b6966002525	\N	f	6 rib fragments; child	NULL	42	1	SW	5		MBB	\N
72cb2674-cd5c-4c84-8ef1-910afaa17715	9f15aa46-2737-4e5c-97e7-4e9440c8315d	\N	f	Brain; UKN	NULL	60	1	SW	5		MBB	\N
1c93b9fc-9421-4086-b813-bb5ab2a68dcd	9f15aa46-2737-4e5c-97e7-4e9440c8315d	\N	f	Radias; child	NULL	60	2	SW	5		MBB	\N
b6863f5b-b068-481c-a617-27828a03090f	9f15aa46-2737-4e5c-97e7-4e9440c8315d	\N	f	Rib fragments; child	NULL	60	3	SW	5		MBB	\N
e4b0dfa2-d7b2-4e08-871c-ef444ea54655	549fdf53-8807-4ed5-8019-955ed01c8823	\N	f	Brain; UKN	NULL	37	1	SE	5		MBB	\N
cf4e30b5-6bb1-4b4f-b9c2-3d23e328ee91	549fdf53-8807-4ed5-8019-955ed01c8823	\N	f	Hair and scalp; UKN	NULL	37	2	SE	5		MBB	\N
ff16dfae-4e42-4fa6-aa26-c2cc6365d482	549fdf53-8807-4ed5-8019-955ed01c8823	\N	t	3 teeth; adult	NULL	37	3	SE	5		MBB	\N
66cb77b6-1d5a-4597-ad59-1332ce14acae	703b8842-6466-4b14-9bf4-f0574e0b0c17	\N	f	~6 rib fragments; child	NULL	53	1	SW	5		MBB	\N
efd677d7-52ad-4b92-846e-92e23eb65930	703b8842-6466-4b14-9bf4-f0574e0b0c17	\N	f	2 femur fragments; child	NULL	53	2	SW	5		MBB	\N
9a4b2509-88aa-4668-917f-52b42e5eecf0	ba2f59e4-3a90-4dec-8ddb-c39221b7926b	\N	f	Hair; UKN	NULL	35	1	SW	5		MBB	\N
6bac52f9-194e-4329-8500-dd0c6693990f	ba2f59e4-3a90-4dec-8ddb-c39221b7926b	\N	f	12 teeth; adult	NULL	35	2	SW	5		MBB	\N
95dec807-4705-49ca-810f-30444066270a	ba2f59e4-3a90-4dec-8ddb-c39221b7926b	\N	f	12 teeth; adult	NULL	35	3	SW	5		MBB	\N
f4752772-fe47-4b4d-a944-d7658eefab26	549fdf53-8807-4ed5-8019-955ed01c8823	\N	f	Tissue from skull; UKN	NULL	37	1	SE	5		MBB	\N
8c0ca8fa-533c-48f0-897e-76ab33c162c5	703b8842-6466-4b14-9bf4-f0574e0b0c17	\N	t	Vertebrae; child	NULL	53	1	SW	5		MBB	\N
7bf37b29-7acc-45fd-a0b1-690e287b120e	703b8842-6466-4b14-9bf4-f0574e0b0c17	\N	f	~8 broken teeth; child	NULL	53	2	SW	5		MBB	\N
234dcf16-2ec3-4594-9b00-82e5d594af0d	001c8dac-0f7e-4a7f-ac16-fdd47fca4262	\N	f	Bamboo	NULL	15	1	NW	5		MBB	\N
56cf31e8-2575-4008-a2ae-b2f65d0c86fa	001c8dac-0f7e-4a7f-ac16-fdd47fca4262	\N	f	Scalp and hair; UKN	NULL	15	2	NW	5		MBB	\N
13e07baa-c4af-4ad7-b983-ee7954c080c9	001c8dac-0f7e-4a7f-ac16-fdd47fca4262	\N	f	Scalp and hair; UKN	NULL	15	3	NW	5		MBB	\N
cc925b74-14c5-4098-b484-b38151b837de	001c8dac-0f7e-4a7f-ac16-fdd47fca4262	\N	f	8 teeth; adult	NULL	15	4	NW	5		MBB	\N
a8ad209e-4b7c-434f-809b-08767139ff65	\N	\N	t	2 teeth; adult	NULL	25	1		5		MBB	\N
41087d3d-27d7-45ab-8457-d92d3c666a97	\N	\N	t	2 teeth; adult	NULL	20	1		5		MBB	\N
42b8307f-b85b-4f6f-86da-fd5f9a9b0cd4	\N	\N	t	2 teeth; adult	NULL	34	1	SW	5		MBB	\N
f44598b9-4cfc-4858-aea3-c1590173a082	\N	\N	t	2 teeth; adult	NULL	28	1	SW	5		MBB	\N
c19c24f0-49cb-481e-a19a-8fb0390062c4	\N	\N	t	2 teeth; adult	NULL	4	1	SW	5		MBB	\N
ccf56446-4d34-4f5a-aa5a-e5487f02157c	\N	\N	t	2 teeth; adult	NULL	3	1	SW	5		MBB	\N
3a0b24b3-65ad-42a3-8a04-4b4f1c1f7a5c	\N	\N	t	2 teeth; adult	NULL	7	1	SW	5		MBB	\N
1d7dafe3-a03d-40de-98e6-809bcb9ef650	\N	\N	t	2 teeth; adult	NULL	27	1	SW	5		MBB	\N
9255b67c-5eea-4858-a58f-43c739071891	\N	\N	t	2 teeth; adult	NULL	10	1	SW	5		MBB	\N
11ea6c27-92c7-4faa-b3f6-a264de6c3d29	\N	\N	t	2 teeth; adult	NULL	11	1	SW	5		MBB	\N
c3ba2d33-de6b-418f-9648-09ac35f79202	\N	\N	t	2 teeth; adult	NULL	5	1	SW	5		MBB	\N
387855e9-95e0-45f9-9106-c9f804d01471	\N	\N	t	2 teeth; adult	NULL	26	1	SW	5		MBB	\N
3cc34c54-e6e3-491c-b172-3060ec48ba6c	\N	\N	t	2 teeth; child	NULL	12	1	SW	5		MBB	\N
2d2a1aa6-627e-4052-9095-4d9ee3c16b22	\N	\N	f	3 rib fragments; child ("Well wrapped burial?") - written on tube	NULL	\N	1	NNW	5		MBB	\N
532a7b05-6ea5-445c-b985-e3595f18789e	66d70415-e9eb-4783-a1c3-e4659ff52bd8	\N	f	3 skull fragments; ("18B93") - written on tube	NULL	9	1	SE	5		MBB	\N
e54f4d74-84a8-4c1d-b13f-bdbb99600f7a	\N	\N	f	("Unidentified") - written on tube	NULL	\N	1	NNW	5		MBB	\N
c12e8628-0157-465c-a53f-662d573a6fc8	\N	\N	f	("Flowers?? Over face") - written on tube	NULL	16	1	NNW	5		MBB	\N
b9665483-0a25-4d81-8307-865d71eafe06	a77ecfc2-4b64-4a56-86a9-cf19b098e3a5	\N	f	Bone dust	NULL	31	1	SW	21		MBB	\N
1c4e2a6c-8a9a-4561-be97-4a34fdfe7162	a77ecfc2-4b64-4a56-86a9-cf19b098e3a5	\N	f	Skin dust	NULL	31	2	SW	21		MBB	\N
50c85f9b-61c0-4fec-a8ef-3ad87e59ab1e	a77ecfc2-4b64-4a56-86a9-cf19b098e3a5	\N	f	Bone dust	NULL	31	3	SW	21		MBB	\N
c9de015d-047a-4ad6-85d1-e516a0301de0	\N	\N	f	Powdered sample	NULL	29	1	SE	21		MBB	\N
b9a2959f-df4f-498c-bf71-c11eb47663bf	\N	\N	t	1 tooth; child	NULL	13	1	SE	21		MBB	\N
d5424749-b46c-4f51-a182-464f3740a445	\N	\N	f	Skin sample	NULL	17	1	SE	21		MBB	\N
04a2b9d3-1f76-4a82-8fda-eb588806c8ec	\N	\N	f	Brain sample	NULL	37	1	SE	21		MBB	\N
bd5600c6-8346-4aec-a3bf-48140f4dfd9c	\N	\N	f	Tissue or maybe seed sample	NULL	38	1	SW	21		MBB	\N
5135a328-1b2b-4d96-8d93-94a806e505bf	\N	\N	f	Skin sample	NULL	9	1	SE	21		MBB	\N
84691240-66a1-46c2-8498-2c4f5d4ac543	\N	\N	f	Tissue sample	NULL	4	1	SW	21		MBB	\N
f45d0393-0587-46c7-b390-dfc6d710e161	\N	\N	f	Tissue sample	NULL	4	2	SW	21		MBB	\N
5349f0c1-88de-4f80-ae91-a5f3f1c2e297	6992e341-a6d7-4265-b79b-c11af4513a52	\N	f	Tissue from mouth and upper jaw	NULL	16	1	SW	21		MBB	\N
aecdebce-8892-4f14-8c5a-ed7f3ddd64c9	6992e341-a6d7-4265-b79b-c11af4513a52	\N	f	Tissue lining inside of skull	NULL	16	2	SW	21		MBB	\N
0d0a11de-baeb-43e7-a228-93455327bbb6	\N	\N	f	Tissue sample	NULL	8	1	SW	21		MBB	\N
d625efdf-9300-4701-8391-b6c7cab142a1	\N	\N	f	Bone fragments	NULL	8	2	SW	21		MBB	\N
783a24e1-0a5e-4d92-955c-8f68bacc1eaf	\N	\N	f	Tissue sample	NULL	2	1	SE	21		MBB	\N
e9ab3f3d-1855-4525-a7e9-a93fbd32ae37	8b09b01d-e37c-4013-bfb2-21550f998a2d	\N	f	Tissue from tibia	NULL	39	1	SE	21		MBB	\N
877ca736-1487-4e3b-9737-f2fc91a3cec9	\N	\N	f	1 tooth; adult ("Green #2") - written on tube	NULL	\N	1	SW	21		MBB	\N
f59d36c7-8141-4b80-862e-8fba67105657	d26af406-3b50-4be4-9f89-e43db65754db	\N	f	Tissue sample	NULL	20	1	SE	21		MBB	\N
4b7ba6bc-307b-4b89-9c7e-f377be1f2e07	3da8b8f3-e50c-47a7-85cf-1e33a081374d	\N	f	Tissue sample	NULL	29	1	SE	21		MBB	\N
6c742235-1a4a-4d17-9913-fc0bd485d905	adbc638a-9792-4282-81b2-14df1d9867f2	\N	f	Skin sample	NULL	21	1	SE	21		MBB	\N
fa5c1120-230c-4c8f-bcea-1ac743d4c0e8	3da8b8f3-e50c-47a7-85cf-1e33a081374d	\N	f	Tissue sample	NULL	29	1	SE	21		MBB	\N
8249fd2b-3b19-49cd-a97d-65b1cb871529	69b645c6-3923-482b-9cdd-82f0a371a96b	\N	f	Wasp and seed samples	NULL	33	1	SE	21		MBB	\N
4e48e5a3-bd78-49d5-b3ce-be1ee34c1c9c	\N	\N	f	("Internal + skin") - written on tube	NULL	2	1	SW	21		MBB	\N
10be2ef4-049a-48d6-aaec-6d528f46d424	\N	\N	f	Bone dust; ("M+ Carm") -written on tube	NULL	\N	1		21		MBB	\N
0acd78b9-f1c2-4451-b546-2b1ba2df3dfc	\N	\N	f	Tissue from skull	NULL	59	1	SW	21		MBB	\N
c2a88a6d-bf7e-4035-a09e-016ef57d39f3	\N	\N	f	Tissue from intestine and tibia	NULL	44	1	SE	21		MBB	\N
a344cc9e-175c-4aea-8d78-58013b6e0054	\N	\N	f	Powdered brain sample	NULL	48	1	SE	21		MBB	\N
45c85319-457f-47c6-b194-082f085e3140	\N	\N	f	Powdered tissue from tibia	NULL	38	1	SE	21		MBB	\N
72a48797-50a3-4daf-a4ff-13b252c0d898	\N	\N	f	Soft tissue	NULL	50	1	SE	21		MBB	\N
ad3f912a-ddba-4a80-9fcb-0143f9c8bcf1	\N	\N	f	Soft tissue	NULL	55	1	SE	21		MBB	\N
532628f1-969f-43f3-ae35-f7e6082f5f83	\N	\N	f	Powdered eye sample	NULL	54	1	SW	21		MBB	\N
d9f87d24-8f42-45bf-ae8f-2c5d792efaaf	\N	\N	f	Powdered foot sample	NULL	44	1	SW	21		MBB	\N
fdfb4f84-c4c9-49d0-a591-6c243b3d188c	\N	\N	f	Powdered tooth sample	NULL	59	1	SW	21		MBB	\N
ae61fc04-905f-489a-835a-311e2f71b4fd	\N	\N	f	Empty tube with dust residue	NULL	9	1	SW	21		MBB	\N
242c4641-9729-470c-8e5d-1d307022f968	edb53edb-4fb1-4908-8335-2748f7fb580d	\N	f	Powdered tissue sample	NULL	56	1	SW	21		MBB	\N
a7a82ddf-fba0-4739-ae43-22024cb56a15	a96d3513-4723-4e2e-9915-4dbe187447b2	\N	f	Powdered tissue sample	NULL	51	1	SE	21		MBB	\N
6429be1b-a5e6-470c-af49-0d9322c7b8c0	3e590287-3a77-44bf-b039-9b1e9435e184	\N	f	Powdered tissue sample	NULL	16	1	SE	21		MBB	\N
d6dc3cd1-492c-453a-9fc7-da8e14771189	198d21d4-c1f0-488e-af8d-025ee6dcd92c	\N	f	Powdered tissue sample	NULL	42	1	SW	21		MBB	\N
f1e45195-c08b-42ab-abfb-0db6b4869629	556f5497-c434-4e4c-8539-7fb92ce9bfbc	\N	f	Powdered tissue sample	NULL	34	1	SE	21		MBB	\N
2d788e84-0bd5-4bc1-a5a1-f93276c9aff4	f0bbacc2-05a0-4751-a5c5-18699f6d7dfb	\N	f	Powdered tooth sample	NULL	38	1	SW	21		MBB	\N
01112cae-c6ab-4e22-91d1-f7d290a646a2	\N	\N	f	Powdered rib sample	NULL	51	1	SW	21		MBB	\N
4107a9e9-2357-45f9-b721-5818480d1766	\N	\N	f	Empty tube with dust residue	NULL	40	1	SW	21		MBB	\N
e4d014e1-2dcb-4c48-857d-0e3c8680f3a8	\N	\N	f	Powdered tooth sample	NULL	15	1	NW	21		MBB	\N
58dc7e96-6f57-4cdc-a79a-276a48e3ec18	f6686cd7-58dd-4aa5-8043-2c7814b9634b	\N	f	Powdered tooth sample	NULL	43	1	SW	21		MBB	\N
3a38a859-1451-471c-bda0-f8a235b85f5c	\N	\N	f	Powdered tooth sample	NULL	14	1	NW	21		MBB	\N
0c2e0563-2f8b-44db-b472-901d6e9b22a3	\N	\N	f	Empty tube with dust residue	NULL	39	1	SW	21		MBB	\N
4fb9cdc5-1707-42b1-a618-1c5e6a491e1d	\N	\N	f	Powdered tooth sample	NULL	44	1	SE	21		MBB	\N
10fd5d94-8ad5-417e-8b18-9fcc4a33f951	8844537c-6fa0-46c3-9680-cc6fd0fe9539	\N	f	Powdered bone sample	NULL	41	1	SW	21		MBB	\N
04737a3d-96f4-46ee-9cfe-36ec2ddba853	\N	\N	f	Powdered tooth sample	NULL	43	1	SW	21		MBB	\N
26b0cbb7-eade-488f-8394-2d7b3bda2c1c	\N	\N	f	Powdered tooth sample	NULL	6	1	SW	21		MBB	\N
335a4bf1-faca-422c-be6e-adeb72384ac9	50e808b5-0f46-4453-892f-ae9af9dd578e	\N	f	Powdered tooth sample	NULL	35	1	SW	21		MBB	\N
049fccde-70be-4c6a-99b3-72f4865c3485	5943c7de-51ad-4ba6-b276-fb45cba4a3d5	\N	f	Powdered tissue sample	NULL	33	1	SE	21		MBB	\N
fb5858bc-f4df-467c-8f76-ee6c81a4c35d	\N	\N	f	Powdered tissue sample	NULL	11	1	SW	21		MBB	\N
b2eb4482-d622-40b8-bc9c-af5bc99f5316	\N	\N	f	Empty tube with dust residue	NULL	27	1	SW	21		MBB	\N
1f7f4e85-4443-475b-b74c-fdd73ea72f42	8844537c-6fa0-46c3-9680-cc6fd0fe9539	\N	f	Powdered tooth sample	NULL	41	1	SW	21		MBB	\N
356f1a77-f1e5-4876-b6b6-540e692d9657	\N	\N	f	Powdered tooth sample	NULL	53	1	SW	21		MBB	\N
91a56541-3d97-423b-b4e4-23ccf7d1c436	\N	\N	f	Powdered tooth sample	NULL	38	1	SE	21		MBB	\N
47f3fed8-2f61-4c5d-bbae-521be5a77efd	\N	\N	f	Powdered tooth sample	NULL	2	1	SW	21		MBB	\N
84d0ff20-6bd0-4351-a28a-75f379a16ca0	\N	\N	f	Powdered tissue sample	NULL	54	1	SW	21		MBB	\N
46baba7e-3dfa-4dcb-9f65-947d8a55ccf5	\N	\N	f	Powdered tissue sample	NULL	34	1	SW	21		MBB	\N
e22b25c2-b19c-44b6-993a-ff4b06332fb0	\N	\N	f	Powdered tooth sample	NULL	17	1	SW	21		MBB	\N
78f1b050-b612-4559-8873-b4bf17fada40	\N	\N	f	Powdered tooth sample	NULL	48	1	SE	21		MBB	\N
3b151485-d520-4310-ab09-d12b240d84e6	\N	\N	f	Powdered tooth sample	NULL	55	1	SW	21		MBB	\N
7a4de457-bb0c-40f6-bbb6-45a0bbf4b2fc	\N	\N	f	Powdered tooth sample	NULL	44	1	SW	21		MBB	\N
7bbafbe8-1297-44e9-ab3c-9c1ddacd84c7	\N	\N	f	Empty tube with dust residue	NULL	57	1	SW	21		MBB	\N
9b290e1e-f062-4e5c-bca9-18486f4e92b0	198d21d4-c1f0-488e-af8d-025ee6dcd92c	\N	f	Powdered tooth sample	NULL	42	1	SW	21		MBB	1998
158187ed-a3a3-4fa1-89a4-b4f7ffcae1df	dae9ff02-dbb4-4608-9414-bf4039dda756	\N	f	Powdered bone sample	NULL	46	1	SW	21		MBB	\N
2d39b7ee-47b7-4096-b4a1-47884f9fd816	dae9ff02-dbb4-4608-9414-bf4039dda756	\N	f	Powdered tooth sample	NULL	46	2	SW	21		MBB	\N
880d2213-97d1-48ca-9202-3872526ab47a	\N	\N	f	Empty tube with dust residue	NULL	28	1	NW	21		MBB	\N
94bb8363-f3da-4424-ac58-9db4bc16651c	\N	\N	f	Powdered tooth sample	NULL	50	1	SE	21		MBB	\N
9d3ccab4-998b-4023-87f3-044db47474df	b9a2e9b1-ba5a-43fd-b62f-c1e3d14f52e1	\N	f	Powdered tissue sample	NULL	57	1	SW	21		MBB	\N
8f38c118-7c44-4a17-b803-92c20022b45d	423838e0-6cbe-427a-815f-1587cba6d9f0	\N	f	Powdered tissue sample	NULL	55	1	SW	21		MBB	\N
c5f98b05-68dd-437f-a4be-22184e08e43d	\N	\N	f	Tissue sample	NULL	5	1	SW	17		MBB	\N
e04c5d1f-deb3-43aa-b378-37a9c68a34fe	\N	\N	f	Tissue sample	NULL	5	2	SW	17		MBB	\N
24edaf88-e30c-467e-a01d-c002d9ac22ef	\N	\N	f	Tissue sample	NULL	5	3	SW	17		MBB	\N
d1bf17f2-a696-4fc1-9550-9c1984d183f4	\N	\N	f	Tissue sample	NULL	9	1	SW	17		MBB	\N
73bcd220-a9d1-4eb7-92b9-c9747a3c1883	\N	\N	f	Tissue sample	NULL	9	2	SW	17		MBB	\N
b3bcbf59-5b1f-4ea9-a719-a645a2de47e5	\N	\N	f	Tissue sample	NULL	6	1	SW	17		MBB	\N
b39359c3-6834-49c3-bdbe-09c232385882	\N	\N	f	Tissue sample	NULL	6	2	SW	17		MBB	\N
3dffa0ec-77d3-498b-91ad-ea06678b0bef	\N	\N	f	Bone fragments	NULL	6	3	SW	17		MBB	\N
ec34e356-6f2f-4758-8064-66ed931d3af6	\N	\N	f	Empty tube with dust residue	NULL	55	1	SW	17		MBB	\N
f5b5c405-6968-4559-8aa8-5fc56907c9b0	\N	\N	f	Plant sample; ("Alexander") -written on tube	NULL	\N	1		17		MBB	\N
4d9e5e37-d5c7-40fb-bb59-3cb98b2bc0a0	\N	\N	f	Powdered tissue sample	NULL	42	1	SE	17		MBB	\N
293c8c07-291c-40e2-b568-f9107bf2a62e	\N	\N	f	Tissue sample	NULL	2	1		17		MBB	\N
9f01371f-a410-4c25-bbfd-6f28317a9297	\N	\N	f	Empty tube with dust residue	NULL	3	1		17		MBB	\N
39b470da-5383-47ea-a1fc-4b3f534b69b7	\N	\N	f	Empty tube with dust residue	NULL	50	1	SE	17		MBB	\N
dee84c55-fe6e-49d0-993a-c0341f49daf6	\N	\N	f	Tooth fragments	NULL	15	1	SE	17		MBB	\N
78a98338-9f85-4f74-aca6-ab259099c757	\N	\N	f	Powdered bone sample	NULL	44	1	SW	17		MBB	\N
d08c03a4-6e46-4799-bf1d-3d7d27867633	\N	\N	f	Empty tube with dust residue	NULL	3	1	SW	17		MBB	\N
d1b293f1-2252-4c88-9df6-2b0d45b129f2	\N	\N	f	Empty tube with dust residue; ("ACHA2 15I92") - written on tube	NULL	\N	1		17		MBB	\N
61c69e65-3702-472f-9dc4-025a249ba119	\N	\N	f	Powdered tissue sample	NULL	32	1	SW	17		MBB	\N
cdd84cc5-40ce-458f-b9d5-ea44c15ab40d	\N	\N	f	Powdered tissue sample	NULL	48	1	SW	17		MBB	\N
e68fda6e-1c8c-4310-bab4-3f534c34e8d0	\N	\N	f	Bone or tooth fragments	NULL	47	1	SE	17		MBB	\N
4e819867-1e96-4b81-890d-4475de5446b4	\N	\N	f	Powdered tissue sample	NULL	35	1	SE	17		MBB	\N
447eac02-34b9-4c6d-86b1-1060429a7d0a	\N	\N	f	Powdered tissue sample	NULL	54	1	SW	17		MBB	\N
4f302914-1f36-4cc8-89fc-55ec801ee5ed	\N	\N	f	Powdered tissue sample	NULL	8	1	SE	17		MBB	\N
1c6d49e0-53bd-45c8-b29e-2a09398e3912	\N	\N	f	Powdered tissue sample	NULL	19	1	SE	17		MBB	\N
494a3eb7-ea40-49fe-bbe0-c4e488ae012f	\N	\N	f	Powdered tissue sample; ("42BO 763 FS-41") - written on tube	NULL	\N	1		17		MBB	\N
307dcd3d-662f-4bcc-bedd-2447a54ce8e7	\N	\N	f	Empty tube with dust residue	NULL	42	1	SW	17		MBB	\N
0a079949-2ced-4771-9611-b77f725385dd	\N	\N	f	Powdered tissue sample	NULL	59	1	SW	17		MBB	\N
b9a4735c-eca5-4d8e-b0bb-edffb7ac6372	\N	\N	f	Empty tube with dust residue	NULL	46	1	SW	17		MBB	\N
e34d8abd-1214-4f8e-abb0-8aa1ba6c65e2	\N	\N	f	Empty tube with dust residue	NULL	48	1	SE	17		MBB	\N
bc659e91-f8b5-4f02-8fd1-253ef9a3ea3e	\N	\N	f	Empty tube with dust residue	NULL	16	1	SE	17		MBB	\N
31cf6d4b-37e6-4ccd-a62f-65a9bceceaf7	\N	\N	f	Empty tube with dust residue	NULL	30	1	SE	17		MBB	\N
d31b25b8-2e85-4ab6-af42-823d9b682ead	\N	\N	f	Powdered tissue sample	NULL	57	1	SW	17		MBB	\N
259d25d6-abc2-4b53-a48b-c0a1ee1de742	\N	\N	f	Powdered tissue sample; ("42BO 763 FS-41") - written on tube	NULL	\N	1		17		MBB	\N
96b3e4bc-32cd-45b1-9502-c977609c0292	\N	\N	f	Empty tube with dust residue	NULL	13	1	SW	17		MBB	\N
904823fc-1708-44a1-a709-20c85a06718d	\N	\N	f	Tooth fragments	NULL	37	1	SE	17		MBB	\N
8f6da949-54db-4ac8-bffe-f7eeaf1bfebf	\N	\N	f	Powdered tissue sample	NULL	43	1	SW	17		MBB	\N
95f7e968-8311-450e-90d3-1ea400eec4ee	\N	\N	f	Powdered bone sample	NULL	40	1	SW	17		MBB	\N
a9deebff-6aa4-4625-8e50-c50244b9aa2c	\N	\N	f	Empty tube with dust residue	NULL	52	1	SE	17		MBB	\N
d212743b-4bad-4864-8f15-ec437b215d62	\N	\N	f	Empty tube with dust residue	NULL	41	1	SE	17		MBB	\N
c2ab4007-3cff-439f-8d81-1dd1ca8197f2	\N	\N	f	Powdered tissue sample	NULL	40	1	SE	17		MBB	\N
2125c8c0-d8a1-4c19-a41e-72da63ab795e	\N	\N	f	Empty tube with dust residue	NULL	1	1		17		MBB	\N
3c3e3691-4286-44e8-8655-6d1e7ead9997	\N	\N	f	Empty tube with dust residue	NULL	34	1	SE	17		MBB	\N
038db2b4-91ad-4251-8f03-7d9014cb0ea9	\N	\N	f	Tissue sample	NULL	30	1	SE	17		MBB	\N
50dbfc1c-8d3a-455d-bd2e-91db59d14d35	\N	\N	f	Tissue sample	NULL	24	1	SE	17		MBB	\N
564b8ba1-53bb-417f-a2c4-5afd592ca891	\N	\N	f	Empty tube with dust residue	NULL	41	1	SE	17		MBB	\N
bd8aa327-2122-4997-a4e2-f895e0b52226	\N	\N	f	Powdered tissue sample	NULL	31	1	SE	17		MBB	\N
dc274f04-f1a6-43d0-af86-06625b51d126	\N	\N	f	Powdered tissue sample	NULL	39	1	SE	17		MBB	\N
893dc54a-f9bb-4f50-886a-2770c6433267	\N	\N	f	Powdered tissue sample	NULL	41	1	SE	17		MBB	\N
81dfdfc0-b500-4b94-829d-18b224582a15	\N	\N	f	Powdered tissue sample	NULL	20	1	SE	17		MBB	\N
e1a54324-5995-45b2-a849-a7c8631917e1	\N	\N	f	Empty tube with dust residue	NULL	20	2	SE	17		MBB	\N
3d06213d-da71-4064-a573-60f991b9a219	\N	\N	f	Powdered tissue sample	NULL	32	1	SE	17		MBB	\N
f1883bcb-1564-4b59-8809-ebd7406d3430	\N	\N	f	Powdered tissue sample	NULL	22	1	SE	17		MBB	\N
cf7ef5ca-6f9e-4f69-8ef2-5326ae67f53d	\N	\N	f	Bone fragments	NULL	57	1	SW	17		MBB	\N
80f8257e-bb1c-4333-9e85-36673146e4d8	\N	\N	f	Empty tube with dust residue	NULL	2	1	SE	17		MBB	\N
d51a64c8-f1d1-4254-a144-e2a7fec630ce	\N	\N	f	Empty tube with dust residue	NULL	38	1	SE	17		MBB	\N
1a3caed3-1882-4707-b079-073636044bb0	\N	\N	f	Empty tube with dust residue	NULL	7	1	SE	17		MBB	\N
9898a2e5-432c-4d20-8f70-a9d901a87b50	\N	\N	f	Empty tube with dust residue	NULL	45	1	SE	17		MBB	\N
e2b7c50c-a50b-45d1-aec8-7f2beab74a2d	b3e2bda3-476f-4af6-bbe3-f2e90d126958	\N	f	TISSUE FROM FACE	NULL	55	1	SW	15		GM	40500
8bb5ea5b-6918-41d5-876a-b5dc08510620	b3e2bda3-476f-4af6-bbe3-f2e90d126958	\N	f	RIBS	NULL	55	2	SW	15		GM	40500
8497bd21-d717-474f-8063-302272f95be5	b3e2bda3-476f-4af6-bbe3-f2e90d126958	\N	f	BRAIN	NULL	55	3	SW	15		GM	40500
40fb8378-c02d-49df-9371-97bd7239bd08	b3e2bda3-476f-4af6-bbe3-f2e90d126958	\N	f	SALT TISSUE	NULL	55	4	SW	15		GM	40500
5acb3ad4-237a-4fbb-beb0-5c3079c3202d	b3e2bda3-476f-4af6-bbe3-f2e90d126958	\N	f	TEETH	NULL	55	5	SW	15		GM	40500
53f2be72-989d-474e-9f97-fcd4f067a6bd	b3e2bda3-476f-4af6-bbe3-f2e90d126958	\N	f	TEETH	NULL	55	6	SW	15		GM	40500
83652f84-fb8c-4fdc-85e7-6953e7b01f14	70c28b28-4b41-47b3-9cf7-b7099f648135	\N	f	TEETH	NULL	38	1	SW	15		GM	40500
0b9716f4-90fb-45bb-a76c-66a01175a31e	\N	\N	f	BRAIN	NULL	55	1	SE	15		GM	40500
c14540ec-7f88-4836-9db9-e43905330f9f	608b7610-08ee-48bf-a265-22b178b1c1c5	\N	f	TEETH	NULL	38	1	SE	15		GM	40500
5ac7caed-e88f-448f-8b0b-9e3b3f6f45c6	608b7610-08ee-48bf-a265-22b178b1c1c5	\N	f	BRAIN	NULL	38	2	SE	15		GM	40500
6ad4f8a0-fb75-4071-9b1f-ec0e20fd7b93	608b7610-08ee-48bf-a265-22b178b1c1c5	\N	f	TISSUE FROM TIBIA	NULL	38	3	SE	15		GM	40500
00c62970-26e3-44e6-88a3-cce3fb1783ba	608b7610-08ee-48bf-a265-22b178b1c1c5	\N	f	HAIR	NULL	38	4	SE	15		GM	40500
b1be9b75-d2b0-4b2a-94a0-e6763e365ff5	608b7610-08ee-48bf-a265-22b178b1c1c5	\N	f	HAIR	NULL	38	5	SE	15		GM	40500
4bf948c7-015a-4f6d-ae47-2004e99e7960	\N	\N	f	TISSUE	NULL	2	1	SW	15		GM	40500
98e74336-40b3-4a39-bc6c-27db3be9613d	\N	\N	f	RIBS	NULL	2	2	SW	15		GM	40500
fb7182a4-7ef8-4fde-9366-d715b4d00d6c	\N	\N	f	TEETH	NULL	2	3	SW	15		GM	40500
b16637da-b2b9-48f9-878f-942f0c06ac26	9eca8797-53bb-462a-8b1d-d29d10a74371	\N	f	FEMUR	NULL	40	1	SW	15		GM	40500
09e37b25-a1be-467b-a1bf-1ed5b5e7b0ef	95931441-c7eb-4ac5-a5e6-57afdfa4788b	\N	f	RIBS	NULL	57	1	SW	15		GM	40500
93959a14-5909-4128-89ef-0d8898b39bd3	95931441-c7eb-4ac5-a5e6-57afdfa4788b	\N	f	TEETH	NULL	57	2	SW	15		GM	40500
f909a0c7-9603-4525-987f-1cf328dae98f	95931441-c7eb-4ac5-a5e6-57afdfa4788b	\N	f	TISSUE FROM MOUTH	NULL	57	3	SW	15		GM	40500
b04340ed-7ebf-4deb-9f33-66789528c38e	9eca8797-53bb-462a-8b1d-d29d10a74371	\N	f	TEETH	NULL	40	1	SW	15		GM	40500
bf9496ec-778b-49de-95eb-268d07ae53a6	9eca8797-53bb-462a-8b1d-d29d10a74371	\N	f	BRAIN	NULL	40	2	SW	15		GM	40500
df4858d3-50e2-4c62-9ed3-3f205d93f89e	9eca8797-53bb-462a-8b1d-d29d10a74371	\N	f	RIBS	NULL	40	3	SW	15		GM	40500
5e2c2244-e701-461d-a137-a0f83163f701	95931441-c7eb-4ac5-a5e6-57afdfa4788b	\N	f	BRAIN	NULL	57	1	SW	15		GM	40500
580df626-cd28-4ab1-a242-bfbaecede0eb	\N	\N	f	TEETH- CHILD	NULL	5	1	SW	15		GM	40500
5dcf5db8-3810-428a-80ba-48652931291f	cf72a138-d3cd-45d6-bf04-7d9bb572860a	\N	f	TEETH AND BRAIN	NULL	48	1	SE	15		GM	40500
90490192-4699-49c0-a0b3-ae51369eeed4	cf72a138-d3cd-45d6-bf04-7d9bb572860a	\N	f	RIBS	NULL	48	2	SE	15		GM	40500
9a57f079-8c50-48d0-9ba1-4303230564c4	cf72a138-d3cd-45d6-bf04-7d9bb572860a	\N	f	TEETH	NULL	48	3	SE	15		GM	40500
2ba6b0c6-5e07-4747-885b-c45d0c64b4f6	cf72a138-d3cd-45d6-bf04-7d9bb572860a	\N	f	HAIR	NULL	48	4	SE	15		GM	40500
1ceff4f9-7c04-4e4a-8edb-189089e39d25	9be660c0-f07c-41cf-8ab9-cbc8d9cf8eca	\N	f	TEETH	NULL	58	1	SW	15		GM	40500
69d26bd8-69a3-4ca9-8554-a06678376f9b	9be660c0-f07c-41cf-8ab9-cbc8d9cf8eca	\N	f	CLAVICAL	NULL	58	2	SW	15		GM	40500
537c557a-c485-4812-9515-2195d3853788	db005f2d-d39d-4f4e-b9e6-3d952730ff11	\N	f	TEETH	NULL	25	1	SE	15		GM	40500
f28d3f48-5673-4796-ba5d-c5418d0ed39d	db005f2d-d39d-4f4e-b9e6-3d952730ff11	\N	f	SCALP AND HAIR	NULL	25	2	SE	15		GM	40500
c7a3830d-d441-446e-bd65-ebcdc4e812b1	db005f2d-d39d-4f4e-b9e6-3d952730ff11	\N	f	RIBS	NULL	25	3	SE	15		GM	40500
cccaa5f7-214f-4430-adf4-74ba70fe5627	db005f2d-d39d-4f4e-b9e6-3d952730ff11	\N	f	HAIR AND SCALP	NULL	25	4	SE	15		GM	40500
44a7d731-4e89-462d-9cf5-28f1e11bb247	9be660c0-f07c-41cf-8ab9-cbc8d9cf8eca	\N	f	RIBS	NULL	58	1	SW	15		GM	40500
a730715d-18af-4ecb-9fe0-7841a88a18c4	9be660c0-f07c-41cf-8ab9-cbc8d9cf8eca	\N	f	FEMUR	NULL	58	2	SW	15		GM	40500
30635505-185e-43e7-b9f6-1b79b394d5e5	9be660c0-f07c-41cf-8ab9-cbc8d9cf8eca	\N	f	SOFT TISSUE	NULL	58	3	SW	15		GM	40500
622a91a3-cd63-4e4b-94ff-43755b812a7d	83a35520-6089-4c75-9273-c0c41f9660c7	\N	f	TEETH	NULL	50	1	SE	15		GM	40500
16834b46-48b0-47a3-ab53-98892c15c56f	83a35520-6089-4c75-9273-c0c41f9660c7	\N	t	TEETH	NULL	50	2	SE	15		GM	40500
f89d0d2b-8a3d-4fe7-b5f6-33cfa74cb964	83a35520-6089-4c75-9273-c0c41f9660c7	\N	f	BRAIN	NULL	50	3	SE	15		GM	40500
a7070911-9d5f-4fc1-8c37-f791660bad67	8dbdedcf-8b90-46dd-bef7-d540bd0deac0	\N	f	RIBS	NULL	47	1	SE	15		GM	40500
40a8ec4d-f87a-4086-a19a-d1dd5377e883	8dbdedcf-8b90-46dd-bef7-d540bd0deac0	\N	f	HUMOROUS	NULL	47	2	SE	15		GM	40500
5b9ad4fb-8172-4ac3-a941-c7d7336c768f	\N	\N	f	HAIR AND SKIN	NULL	9	1	SW	15		GM	40500
e721833d-50bb-4ef8-9e1b-b49f676ccddb	\N	\N	f	TEETH	NULL	9	2	SW	15		GM	40500
e64e3b8b-ee22-4bed-8ba7-5af86673fe14	83a35520-6089-4c75-9273-c0c41f9660c7	\N	f	SOFT TISSUE	NULL	50	1	SE	15		GM	40500
608ee83d-269e-400b-934d-79c845b5564c	83a35520-6089-4c75-9273-c0c41f9660c7	\N	f	RIBS	NULL	50	2	SE	15		GM	40500
8785cb5b-2918-4fdc-b846-d44bee9d5045	8dbdedcf-8b90-46dd-bef7-d540bd0deac0	\N	f	HAIR	NULL	47	1	SE	15		GM	40500
99d8b627-328c-4fe0-a3c7-6f4d2be9c278	8dbdedcf-8b90-46dd-bef7-d540bd0deac0	\N	f	TEETH- CHILD	NULL	47	2	SE	15		GM	40500
7b1a09f8-b6d4-4f9b-b75a-ee46c0241aa5	92fbe8df-a729-4003-b096-684363ca6323	\N	f	BRAIN	NULL	39	1	SW	15		GM	40500
5349daff-3ae7-422f-8b05-41abf9bba53f	92fbe8df-a729-4003-b096-684363ca6323	\N	f	TEETH AND HAIR	NULL	39	2	SW	15		GM	40500
2ffd7437-f27a-4e36-8623-7b0067089c00	\N	\N	f	TEETH- CHILD	NULL	1	1	SE	15		GM	40500
95bbb1d3-5ffc-44e0-8474-397926be8d8d	\N	\N	f	BRAIN ?	NULL	1	2	SE	15		GM	40500
08b4dae1-b2cf-4624-aa2b-9bce049ca79a	977d6d89-41a5-4830-a51e-de899e1bf0da	\N	f	RIB	NULL	11	1	SW	15		GM	40500
86de6a8a-f7e1-4d14-9fc8-9a2995d7827a	977d6d89-41a5-4830-a51e-de899e1bf0da	\N	f	TEETH	NULL	11	2	SW	15		GM	40500
26e42749-003d-4fde-a162-24a8c0953614	\N	\N	f	TEETH	NULL	28	1	NW	15		GM	40500
3b007cf1-7f24-4a33-bb91-96d27fad4e5e	ef336535-f973-475e-990b-fbbaa40eb468	\N	f	TEETH- CHILD	NULL	8	1	SW	15		GM	40500
51284b48-25d8-4289-9e10-38841db5bf25	\N	\N	f	FOOT	NULL	1	1	SE	15		GM	40500
fc6e0f6f-6120-4f2e-9399-f0d6d3d40226	\N	\N	f	SKIN ?	NULL	1	2	SE	15		GM	40500
f72710c9-9fcc-44fa-aeb5-8b6d3eb93b21	565ac1c0-3331-4fa6-b086-bb120cdb4ad1	\N	t	TEETH	NULL	44	1	SW	15		GM	40500
9f80806c-ae05-4b5a-a407-a66e5cb43954	565ac1c0-3331-4fa6-b086-bb120cdb4ad1	\N	f	HAIR	NULL	44	2	SW	15		GM	40500
4d16145c-47d6-411c-aa50-a9fe6c98a476	565ac1c0-3331-4fa6-b086-bb120cdb4ad1	\N	f	VERTEBRA	NULL	44	3	SW	15		GM	40500
8c05131e-b4ac-4e7d-ad94-6298c98c9058	565ac1c0-3331-4fa6-b086-bb120cdb4ad1	\N	f	FOOT BONE	NULL	44	4	SW	15		GM	40500
75f46954-7eb0-4322-9b25-114729241d79	ef336535-f973-475e-990b-fbbaa40eb468	\N	f	RIBS	NULL	8	1	SW	15		GM	40500
c26e2203-f779-4a3b-ab2b-40253681c6de	\N	\N	f	RIBS	NULL	48	1	NW	15		GM	40500
004a5e7b-49a5-4e8e-8cac-2153c37736d8	\N	\N	f		NULL	\N	1					\N
55a7e91c-6ebf-4cd5-b481-7257cf49e9f7	\N	\N	f	SKIN ?	NULL	50	1	SW	11		GM	40500
410ba115-2b9d-4f04-ba2d-4dc5ba96f095	\N	\N	f	SKIN ?	NULL	27	1	SW	11		GM	40500
1a6e13d4-0a87-49c8-a836-e4d5465f0cc6	\N	\N	f	HAIR AND SKIN	NULL	15	1	NW	11		GM	40500
82ca4448-e377-4306-b479-f7728328342c	\N	\N	f	BRAIN	NULL	59	1	SW	11		GM	40500
ba744f17-dd4d-4794-8397-95da570c2ccd	\N	\N	f	HAIR AND SCALP	NULL	16	1	NW	11		GM	40500
cca4a7c7-f8ce-43c7-8330-91d16ee3cfde	\N	\N	f	SKIN ?	NULL	14	1	NW	11		GM	40500
5a55040a-1731-41f5-8dfd-bc1d53e9fc1a	\N	\N	f	SKIN ?	NULL	26	1	NW	11		GM	40500
c2c9b4d5-dc76-4fd8-a6e1-1f625c28afa3	\N	\N	f	HAIR AND SCALP	NULL	24	1	SW	11		GM	40500
4c7f19f6-f22b-426d-be8c-518afcc1ef99	\N	\N	f	TOOTH	NULL	22	1	RC	11		GM	40500
a23a2aba-8730-4f8e-8a63-76721d2d5c3f	\N	\N	f	SKIN ?	NULL	55	1	SW	11		GM	40500
22454ac9-5f05-49c1-bcdf-bd7fcbcea0b6	\N	\N	f	BRIAN	NULL	55	2	SW	11		GM	40500
dfcc16cd-83b3-4a7f-80b5-c279a5a46b86	\N	\N	f	TOOTH	NULL	22	1	RC	11		GM	40500
48146225-0e21-47aa-8233-b4eb5c9369f8	\N	\N	f	TOOTH	NULL	22	2	RC	11		GM	40500
b2b67c59-2b3a-4cc6-acee-7f90265cdf23	\N	\N	t	TOOTH	NULL	1027	1	RC	11		GM	40500
0bb26d6a-8c86-4d0d-b4e0-7bf350685d6c	\N	\N	t	TOOTH	NULL	1777	1	RC	11		GM	40500
4ec289b5-d282-4a41-941a-f50c8d05eedd	\N	\N	f	TOOTH	NULL	2249	1	RC	11		GM	40500
6d2a0dd2-20a0-4fb5-be36-1c387890861b	\N	\N	f	SKIN ?	NULL	1027	1	RC	11		GM	40500
7f46fc4c-a8ad-411e-a5a6-d366e845d1ee	\N	\N	t	TOOTH	NULL	1779	1	RC	11		GM	40500
bac73967-f906-4c7c-8f9c-e790d841f988	\N	\N	t	TOOTH	NULL	1779	2	RC	11		GM	40500
d6cacbe0-f57b-406a-ac65-e12d1416df64	\N	\N	f	TOOTH ?	NULL	2172	1	RC	11		GM	40500
eb374089-8f79-4181-a201-833f8abd1b7e	6a685714-ec97-4f09-a6ef-f313508d8b1d	\N	f	SCALP AND HAIR	NULL	28	1	SW	11		GM	40500
44622ef4-a019-4cbd-ab42-0132fca07fcf	\N	\N	f	RESIN	NULL	2172	1	RC	11		GM	40500
e56b119a-af1f-47d9-b5e7-2604ff02238d	\N	\N	t	TOOTH	NULL	2172	2	RC	11		GM	40500
ef12be5e-1d57-4eff-94e3-a17e137340e0	\N	\N	t	Tooth	NULL	\N	1		31		AWA	\N
cc08a88e-b53e-4656-8aa9-f8d649299257	2d765fea-7137-44c0-8185-8a38029f06d1	\N	f	Ribs	NULL	52	1	SE	31		AWA	\N
1f66a9c7-43dd-41e9-8b3e-d77b6541ba42	1710d5e0-2592-49cb-8c24-4aac8c2eb866	\N	f	Ribs; child	NULL	43	1	SW	31		AWA	\N
71cffd7b-68ba-440c-b15b-3cb0243be194	d9fac7e4-879a-4b14-b068-e016797e6742	\N	f	Rib	NULL	45	1	SE	31		AWA	\N
821945fc-50d4-4270-91b9-53835c949af9	aa3556da-9f2c-42bf-87b2-1b0f83ee1e27	\N	f	"Internal"	NULL	12	1	SW	31		AWA	1998
18fced50-f02d-4b2c-8f17-bcd93742a7d0	aa3556da-9f2c-42bf-87b2-1b0f83ee1e27	\N	f	Ribs; child	NULL	12	2	SW	31		AWA	1998
df307f89-3fb1-4cc7-a455-38d5a6fbc4c6	09dba05d-a5ff-4d59-a44e-7c265f572f31	\N	f	Vertebrae - Tibia	NULL	20	1	SE	31		AWA	1998
c3c2e0ef-efee-47a9-9d19-442bb9f60f2c	33e6afb7-bda5-4409-ad73-c981162057be	\N	f	Hair and scalp (?)	NULL	31	1	SE	31		AWA	\N
9679a7b6-0a93-45a8-8fc4-ea73aee01d6d	33e6afb7-bda5-4409-ad73-c981162057be	\N	f	Clavicle; child	NULL	31	2	SE	31		AWA	\N
cd37ab3c-82cd-491d-87d8-7d30cc5226c2	33e6afb7-bda5-4409-ad73-c981162057be	\N	f	Skin	NULL	31	3	SE	31		AWA	\N
4497702e-bffd-40db-8160-da9f24476480	2bd1360c-2386-4c58-8281-65bd614462b7	\N	f	Scapula (?) and skin	NULL	58	1	SW	31		AWA	1998
95393637-969a-4bcf-bc41-2e68ccffaaaa	710157a3-3481-4e41-8e06-f1a7ef02972b	\N	f	Hair	NULL	6	1	SW	31		AWA	35833
64a23656-f689-43db-8e96-9ea51fcd148a	710157a3-3481-4e41-8e06-f1a7ef02972b	\N	f	Skin	NULL	6	2	SW	31		AWA	35833
a303e589-757c-4a96-ba0d-35bbb06377fb	710157a3-3481-4e41-8e06-f1a7ef02972b	\N	f	2 teeth	NULL	6	3	SW	31		AWA	35833
43938615-ded1-45a7-816c-bd623e3fd203	c60fd91d-344d-4156-98f5-cb872b3bccfc	\N	f	"Fibula"; child	NULL	4	1	SW	31		AWA	1998
f80ed90b-bbf3-4cd4-8544-488e72b1accc	c60fd91d-344d-4156-98f5-cb872b3bccfc	\N	f	Skin; femur	NULL	4	2	SW	31		AWA	1998
68b90eca-b688-4ca8-85f7-5383f4398dcf	eed1e3bd-b921-42e9-9ec2-b6de8c366981	\N	f	Skin - jaw and skull	NULL	25	1	SW	31		AWA	1998
a2fe31af-115d-46c2-b741-77564b62a783	eed1e3bd-b921-42e9-9ec2-b6de8c366981	\N	f	Humerus	NULL	25	2	SW	31		AWA	1998
49723738-b228-4e2d-9c7c-d9ccf94dba74	eed1e3bd-b921-42e9-9ec2-b6de8c366981	\N	f	Fibula	NULL	25	3	SW	31		AWA	1998
c1ca9f4a-8255-4394-a04f-00d003ebc720	8aa20af8-8abf-4862-87a9-2698cd5d1bcd	\N	t	2 teeth	NULL	39	1	SW	31		AWA	\N
2d348009-80ed-4c32-978b-57b64aee465c	8aa20af8-8abf-4862-87a9-2698cd5d1bcd	\N	f	Bone fragments	NULL	39	2	SW	31		AWA	\N
39d96a8d-2665-4dd1-9a9d-189f9f9d6693	8aa20af8-8abf-4862-87a9-2698cd5d1bcd	\N	f	Skin	NULL	39	3	SW	31		AWA	\N
f83011d0-b9ba-4884-9ffe-ab78505210dd	\N	\N	t	3 teeth	NULL	2	1	SW	31		AWA	35833
7880b109-83ff-4a45-a7a3-556eaa716f83	\N	\N	f	Skin	NULL	2	2	SW	31		AWA	35833
f6306d25-52e4-4a98-aced-5ad652414bf3	aab3f20b-d0e0-4ca2-b5bc-5dfa24fc434f	\N	t	3 teeth	NULL	1	1	SW	31		AWA	35833
2c08b71a-1f43-483b-a876-e0085b892168	aab3f20b-d0e0-4ca2-b5bc-5dfa24fc434f	\N	f	Skin	NULL	1	2	SW	31		AWA	35833
ad95ea80-a8ca-4580-93d5-16e9b61475e0	2acfd894-bd6d-4ca6-a0c0-79e074454ff1	\N	f	Skin	NULL	10	1	SW	31		AWA	1998
c15f5bcf-c9a0-4844-bffc-25725ce54f4b	2acfd894-bd6d-4ca6-a0c0-79e074454ff1	\N	f	"Internal"	NULL	10	2	SW	31		AWA	1998
ec37c61e-3f75-4d3f-a623-6f97cbfb5395	2acfd894-bd6d-4ca6-a0c0-79e074454ff1	\N	t	4 teeth; adult	NULL	10	3	SW	31		AWA	1998
c9b691d1-e050-412f-922b-84a623b45bbe	\N	\N	f	Skin	NULL	29	1	SW	31		AWA	1998
194d9300-553e-48f1-b433-12bd639fdfbc	\N	\N	f	Scapula (?); child	NULL	29	2	SW	31		AWA	1998
f846cf4a-026a-468b-b076-1bba2745b920	d574e404-629a-4fc2-bf2f-4f7113908f54	\N	f	Scapula (?)	NULL	40	1	SW	31		AWA	\N
fc2752a7-198d-4afc-a230-cf885c98622b	98502b4c-d6d1-4e1d-a247-0806047fb937	\N	f	Skull membrane	NULL	16	1	SW	31		AWA	1998
803a55ab-ed9f-46dd-bc5c-6e135cb20268	98502b4c-d6d1-4e1d-a247-0806047fb937	\N	f	Ribs; child	NULL	16	2	SW	31		AWA	1998
e5ccff13-d04d-47b6-88a3-95e77ebb065f	9fbceb3f-75f1-4127-aaaf-95dd945e281d	\N	f	Skin and fungi	NULL	3	1	SW	31		AWA	1998
7a33da54-997a-4913-b5b2-9bdb22252577	9fbceb3f-75f1-4127-aaaf-95dd945e281d	\N	f	Bone	NULL	3	2	SW	31		AWA	1998
e6d41c1e-b7e8-48d2-b0e3-6174175e637d	9fbceb3f-75f1-4127-aaaf-95dd945e281d	\N	f	Teeth; adult	NULL	3	3	SW	31		AWA	1998
07e2705c-fd43-46d4-87f9-8bf6dca018e8	f78a062c-0c07-4892-9e56-4ce47c3ee58a	\N	f	Long bone	NULL	7	1	SW	31		AWA	1998
831115a9-ffce-45b9-83a9-c0f0fb9eccf2	f78a062c-0c07-4892-9e56-4ce47c3ee58a	\N	f	Teeth; child	NULL	7	2	SW	31		AWA	1998
87718820-7968-459e-9c11-bc1b7759e107	7d2a5c1f-a717-4b07-bb3f-a4ebf6997607	\N	f	Rib and fungus	NULL	15	1	SW	31		AWA	1998
318e0861-d611-48be-83b1-6ff1c7f9bb25	7d2a5c1f-a717-4b07-bb3f-a4ebf6997607	\N	f	Hair and Scalp	NULL	15	2	SW	31		AWA	1998
9c59fdd1-935f-4d66-bd42-715aa1fda2c3	7d2a5c1f-a717-4b07-bb3f-a4ebf6997607	\N	t	Teeth; UNK	NULL	15	3	SW	31		AWA	1998
98f81d08-df41-4645-863f-ac492a8af308	31d0cd86-c208-4625-83e0-7ff34346fb8c	\N	f	Humerus	NULL	20	1	SW	31		AWA	1998
1944fc23-0cb3-4a72-989c-69179f7a9cae	31d0cd86-c208-4625-83e0-7ff34346fb8c	\N	f	Skin - mandible	NULL	20	2	SW	31		AWA	1998
65a2e2a5-c94a-4085-a1cf-075a5bf7da31	1de3db72-1d1c-4506-bed1-4624cd1b6bd0	\N	f	Clavicle; child	NULL	26	1	SW	31		AWA	1998
e77b5cbc-b8aa-45ca-8041-3a650527f216	\N	\N	f	"Mummified head old; #3 or 2; pieces from face"	NULL	\N	1	Area 1	31		AWA	\N
300f7d97-6a6c-415b-9d57-c718dd551331	\N	\N	f	"#3 or 2; nose"	NULL	\N	2	Area 1	31		AWA	\N
c3a73d63-322e-491a-9a29-18c465c2904c	\N	\N	f	"#3 or 2; Muscle from face"	NULL	\N	3	Area 1	31		AWA	\N
6f81d91c-b4e7-4cea-b838-9529cd03d3ce	\N	\N	f	"#3 or 2; skin from head"	NULL	\N	4	Area 1	31		AWA	\N
8ebf90c9-9035-4345-9443-a1691f4fb100	\N	\N	f	"#3 or 2; ear"	NULL	\N	5	Area 1	31		AWA	\N
74d36654-1177-427c-a74f-edb1c9e25bd1	50e808b5-0f46-4453-892f-ae9af9dd578e	\N	f	3 molars; child	NULL	35	1	SW	31		AWA	1998
dcbb066a-2642-45a3-883a-ca7b3a5af546	50e808b5-0f46-4453-892f-ae9af9dd578e	\N	f	Broken rib pieces	NULL	35	2	SW	31		AWA	1998
c346db4e-dae2-4ad9-b90d-dd49e3fd9729	277a16e9-f74e-4a3f-a37f-05c61350c62b	\N	f	Tissue	NULL	30	1	SW	31		AWA	1998
a55caf19-6baf-4a6a-b521-0eada045cb6a	277a16e9-f74e-4a3f-a37f-05c61350c62b	\N	t	5 teeth; adult	NULL	30	2	SW	31		AWA	1998
ef13a69d-803c-4d74-8f94-9be7bcdbca43	fbcb5ddb-94c8-460a-9e95-bddf0170f067	\N	f	Skin	NULL	27	1	SW	31		AWA	1998
5b170d86-fb56-45b2-ba77-deafb281e934	fbcb5ddb-94c8-460a-9e95-bddf0170f067	\N	f	6 teeth; adult	NULL	27	2	SW	31		AWA	1998
57ea8c30-3d4d-4344-b24f-ae3f97662d46	5a8f7ed4-4594-4dd4-a79c-c6d8889a1e6c	\N	f	Teeth and skin; UKN	NULL	47	1	SW	31		AWA	1998
15502863-f0d5-41e5-9f93-64fe870e7d85	67ee82e5-b804-4abd-99f6-80019f9cea9e	\N	f	Teeth and rib; child (?)	NULL	54	1	SW	31		AWA	1998
f70dbe78-9914-4650-b8bf-030eed7a9bd5	7ee9fb1d-9478-4931-a014-a55c3d1b9b19	\N	f	Internal	NULL	28	1	SW	37		AWA	1998
ebba44b4-32f6-44ae-8ff6-b073f096b22a	7ee9fb1d-9478-4931-a014-a55c3d1b9b19	\N	f	Skin	NULL	28	2	SW	37		AWA	1998
1a64e4b9-b806-4316-9592-534bf12cfcc3	7ee9fb1d-9478-4931-a014-a55c3d1b9b19	\N	f	8 teeth; adult	NULL	28	3	SW	37		AWA	1998
64cbba4e-672c-4beb-b0d4-9a9fc022647c	7b225114-29ac-4170-8d2c-948fd0730e7f	\N	f	Internal tissue	NULL	44	1	SW	37		AWA	1998
217b80cf-5a1a-4de5-b81e-1719555dfe76	7b225114-29ac-4170-8d2c-948fd0730e7f	\N	f	Skin	NULL	44	2	SW	37		AWA	1998
0fdab5c3-8607-4b9d-8848-7f5917e7730b	7b225114-29ac-4170-8d2c-948fd0730e7f	\N	f	Ribs and teeth; child	NULL	44	3	SW	37		AWA	1998
33ffbc1a-0170-42ff-b4b6-a91b20d525a1	38a89982-f038-4ee2-a244-c1609706d6c1	\N	f	Bone, skin, and teeth; adult	NULL	48	1	SW	37		AWA	1998
4816e4db-e6ca-4ac3-9751-ae75990ecbff	38a89982-f038-4ee2-a244-c1609706d6c1	\N	f	Tissue from pelvic area	NULL	48	2	SW	37		AWA	1998
6922175d-23f8-4075-a9b6-995b525960a4	8aea66d5-1d89-4f27-b785-609ae626c181	\N	f	"Thoracic along vertebrae"; 2 metal rings	NULL	5	1	SW	37		AWA	1998
c35589e1-d5e6-4b35-a056-fbcdb6b16616	8aea66d5-1d89-4f27-b785-609ae626c181	\N	f	Broken teeth; UKN	NULL	5	2	SW	37		AWA	1998
59277644-c8ed-4026-ae93-af936560655b	8aea66d5-1d89-4f27-b785-609ae626c181	\N	f	Skin	NULL	5	3	SW	37		AWA	1998
02782b03-9304-4858-a418-f607f754250b	6a450667-c50c-41a5-88d1-5a2444b9c71d	\N	f	Ribs; infant	NULL	4	1	SE	37		AWA	\N
f86791bb-cd0b-4073-94b1-88070ac83657	\N	\N	f	Powdered tooth; "NCNA 2 gm"	NULL	\N	1		37		AWA	36647
7b062686-b5cb-4140-ba0c-4f346a9c3e71	f6686cd7-58dd-4aa5-8043-2c7814b9634b	\N	f	Lung	NULL	43	1	SW	37		AWA	1998
9d07f182-33ee-4794-a3ab-fc8bb27ff672	f6686cd7-58dd-4aa5-8043-2c7814b9634b	\N	f	4 teeth; adult	NULL	43	2	SW	37		AWA	1998
e28251c1-6cf0-4da9-accb-412f5e64dbd6	f6686cd7-58dd-4aa5-8043-2c7814b9634b	\N	f	Skin	NULL	43	3	SW	37		AWA	1998
1351ef66-c211-4349-972a-6a924ee059ca	f6686cd7-58dd-4aa5-8043-2c7814b9634b	\N	f	Scat.	NULL	43	4	SW	37		AWA	1998
5ecb03dc-4aaa-4419-ae5d-3471cf45e006	dae9ff02-dbb4-4608-9414-bf4039dda756	\N	f	Skin, teeth, and bone; adult	NULL	46	1	SW	37		AWA	1998
053d99a0-8e2f-4066-b205-c35484d3cdb1	dae9ff02-dbb4-4608-9414-bf4039dda756	\N	f	Long bone	NULL	46	2	SW	37		AWA	1998
d9d0064d-16de-4731-9894-fdd30891c9f9	c468120a-a00b-417a-a017-f1843d8777a3	\N	t	Long bone and muscle	NULL	24	1	SW	37		AWA	1998
635ddba0-fc21-4c5c-9e88-d81f53c4d5da	13f36acf-cca6-4bce-9930-2351c8fe8751	\N	f	Lung	NULL	49	1	SW	37		AWA	1998
8c9abe7f-645e-46d2-8ade-c62330a17026	13f36acf-cca6-4bce-9930-2351c8fe8751	\N	f	Rib/skin	NULL	49	2	SW	37		AWA	1998
765d54e0-495f-40b7-9c58-4d46836979c7	13f36acf-cca6-4bce-9930-2351c8fe8751	\N	f	Teeth and skin; adult	NULL	49	3	SW	37		AWA	1998
f71d3fc8-4133-4be8-92f6-db094bbc1e0f	fc9a1128-aa74-47bd-a69e-6bdae1c84387	\N	t	Skin, bones, teeth; adult	NULL	50	1	SW	37		AWA	1998
dda18807-972b-4188-a404-88c6cc9057a4	b00127cb-71bc-4a67-b97f-84bddb16f6ed	\N	f	Teeth, brain, skin, bone; adult	NULL	53	1	SW	38		AWA	1998
a015db9f-2049-46a9-8adb-6002ff6cdada	070432da-1605-4375-9b44-68f3ab8111d0	\N	f	"Not tooth or bone"; tissue	NULL	52	1	SW	38		AWA	1998
f9955db7-0543-42f1-8e6b-42a01c293133	070432da-1605-4375-9b44-68f3ab8111d0	\N	f	Tissue	NULL	52	2	SW	38		AWA	1998
9b606a88-4806-4a2f-ac37-be18dbb654dc	070432da-1605-4375-9b44-68f3ab8111d0	\N	f	Bone	NULL	52	3	SW	38		AWA	1998
7a4914aa-538c-415b-8bda-3fe8cfcf7237	edb53edb-4fb1-4908-8335-2748f7fb580d	\N	t	Skin, bones; UKN	NULL	56	1	SW	38		AWA	1998
97d424a1-4c1c-4d24-8e77-f627731cce05	\N	\N	f	Salt wrapped with hand; whole hand	NULL	\N	1	SW	LARGE ITEM	4	AWA	35833
aff49ec2-ff13-4b25-a131-adcd5458a0b9	\N	\N	f	"004I" Cat skull	NULL	\N	1		LARGE ITEM	4	AWA	\N
b9b38dff-e1b1-4de7-b623-4ac5a09a5178	903ce7ec-90f6-4157-856d-c282bca0291b	\N	f	TEETH, TISSUE, AND VERTEBRAE	NULL	42	1	SE		6	GM	1998
b340d441-b116-4107-b67e-bda065bbf052	bd0fa971-455b-4bea-941c-4238f299e5fb	\N	f	SKIN AND JEWELLERY	NULL	3	1	SE		6	GM	1998
64ff03f8-3757-4c8c-803c-03613b767fe8	aab3f20b-d0e0-4ca2-b5bc-5dfa24fc434f	\N	f	ROCK	NULL	1	1	SW		6	GM	\N
f7bdef23-be73-400a-868b-7f094f1531f8	639181b2-8f70-4e15-9348-24219a84484a	\N	f	RIBS AND INTERNAL SAMPLE	NULL	37	1	SW		6	GM	1998
b628cee5-6932-45b1-b1e3-1e528231e72b	\N	\N	f	TEETH- POSSIBLY 1998	NULL	10	1	SE		6	GM	\N
38fdff58-776b-4e2f-b677-45f12f4ae35e	\N	\N	f	TEETH- POSSIBLY 1998	NULL	16	1	SW		6	GM	\N
1a6080d6-b648-4342-8c73-b37cdd611367	\N	\N	f	TEETH- POSSIBLY 1998	NULL	12	1	SW		6	GM	\N
3fbc28ff-4310-443b-a738-6f2f704ebf80	\N	\N	f	TEETH- POSSIBLY 1998	NULL	16	1			6	GM	\N
c88a285a-0766-440b-ba4a-b0686e1a2509	\N	\N	f	TEETH- POSSIBLY 1998	NULL	34	1	NW		6	GM	\N
4b686ac2-b696-4340-bc7e-7158519c5bdd	\N	\N	f	TEETH- POSSIBLY 1998	NULL	3	1			6	GM	\N
d57bc221-4479-459d-978d-4aaf34e45208	\N	\N	f	TEETH- POSSIBLY 1998	NULL	22	1	SW		6	GM	\N
5f0d9d6c-54ce-480a-a676-b0065a20206c	\N	\N	f	TEETH- POSSIBLY 1998- BLANK SAMPLE	NULL	\N	1			6	GM	\N
d736ac94-42ac-4fbd-8620-9b38a7f7d34c	\N	\N	f	TEETH- POSSIBLY 1998- BLANK SAMPLE	NULL	\N	2			6	GM	\N
09443a00-5350-4a26-b081-bc3a7b63f715	aad3dcb2-2175-4e19-a812-3aaf550b0532	\N	f	TEETH	NULL	51	1	SW		6	GM	\N
99154e07-679b-4e22-82e0-9d0f5376374a	\N	\N	f	TEETH "ARIA I"	NULL	2	1			6	GM	\N
25998c90-5aaa-43dd-ad31-3ca8f25911f3	\N	\N	f	TEETH "ARIA I"	NULL	1	1			6	GM	\N
29a8e118-b2a0-468a-be09-9e710f02d78d	\N	\N	f	TEETH "ARIA I"	NULL	3	1			6	GM	\N
0d30d03a-7355-4465-852e-59da09a1af43	f468f41d-5bf3-4f24-9092-9b18c24b42c4	\N	f	SKIN, HAIR, TEETH, AND RIBS	NULL	28	1	SE		6	GM	1998
917fc3ef-e151-4928-9626-cd50bb20ddf7	556f5497-c434-4e4c-8539-7fb92ce9bfbc	\N	f	RIBS AND BONE. "REVERSAL"	NULL	34	1	SE		6	GM	\N
f4d5e28e-528b-453e-850b-4b9dc683b25f	f6cf58d2-268d-4d06-9dc9-b3bbc7f60613	\N	f	SKIN, TEETH, AND INTERNAL TISSUE	NULL	30	1	SE		6	GM	1998
e273545a-7b8d-4aeb-ab6e-4212d9ae7c11	f0bbacc2-05a0-4751-a5c5-18699f6d7dfb	\N	f	RIBS, TEETH, AND SKIN OR TISSUE	NULL	38	1	SW		6	GM	1998
0aaeb44b-5c47-4abb-9060-2ed763c46b30	e06835ac-0624-41c1-b1a6-83b8e69483fd	\N	f	RIBS AND TISSUE	NULL	34	1	SW		6	GM	1998
1dfae800-2c1e-4e93-a046-0c2d7d1b47c4	9f15aa46-2737-4e5c-97e7-4e9440c8315d	\N	f	TEETH	NULL	60	1	SW		6	GM	\N
2ba9a334-807d-4179-8b17-accb809d74bf	5943c7de-51ad-4ba6-b276-fb45cba4a3d5	\N	t	TEETH	NULL	33	1	SE		6	GM	1998
d0a37a2f-aa9b-489d-9ba0-44124c8db94a	b9a2e9b1-ba5a-43fd-b62f-c1e3d14f52e1	\N	f	LONG BONE	NULL	57	1	SW		6	GM	1998
3866a3c2-6ff5-4c5c-818d-5753e2bca5ee	19fefc99-785e-4acb-9e3b-2d68de201e08	\N	f	SKIN	NULL	33	1	SW		6	GM	1998
1c53cb80-b70a-45cc-8f0d-94210bc52ad0	a4387af4-914c-42c3-be2e-14b85f96c5eb	\N	f	LONG BONE, SKIN, AND INTERNAL?	NULL	35	1	SE		6	GM	1998
5f05f0ce-536f-4075-9e86-65f5888082d8	8844537c-6fa0-46c3-9680-cc6fd0fe9539	\N	f	TEETH AND LONG BONE	NULL	41	1	SW		6	GM	1998
58e57119-bfe5-42c5-b4c4-e06c627d0fea	f6686cd7-58dd-4aa5-8043-2c7814b9634b	\N	f	SKIN AND TEETH	NULL	43	1	SW		6	GM	1998
b1b45582-9bc2-4a44-9e27-557817700b1b	198d21d4-c1f0-488e-af8d-025ee6dcd92c	\N	f	RIBS, SKIN, AND TEETH	NULL	42	1	SW		6	GM	1998
c0d51b17-27b6-47e8-95ba-550ae536325f	3e590287-3a77-44bf-b039-9b1e9435e184	\N	f	LONG BONE AND TEETH	NULL	16	1	SE		6	GM	1998
e9115470-15ea-4523-91c7-3c61526968c2	\N	\N	t	TOOTH	NULL	25	1	SE		6	GM	\N
4fc1fc36-ea98-4b7c-909b-3ef9e5809309	aad3dcb2-2175-4e19-a812-3aaf550b0532	\N	f	TIBUOLA	NULL	51	1	SW		7	GM	\N
6dc5e38b-4de3-4f65-9ab2-321e55eb465d	2561ac84-6949-4850-99bb-f928e176dac8	\N	f	EYES	NULL	26	1	SW		7	GM	\N
aea2f499-7ff3-43ae-ab44-294d254afadd	2561ac84-6949-4850-99bb-f928e176dac8	\N	f	SCALP, HAIR, AND SKIN	NULL	26	2	SW		7	GM	\N
2c2ecf32-fc0a-46e7-84dc-79a3c1020c9c	2561ac84-6949-4850-99bb-f928e176dac8	\N	f	TISSUE FROM MOUTH	NULL	26	3	SW		7	GM	\N
be10d793-d78f-44d1-9a7a-10240022f478	2561ac84-6949-4850-99bb-f928e176dac8	\N	f	BRIAN	NULL	26	4	SW		7	GM	\N
b83a6479-71ee-476d-b2dd-7912c49bcfda	2561ac84-6949-4850-99bb-f928e176dac8	\N	f	CROSS SECTIONS OF LONG BONE	NULL	26	5	SW		7	GM	\N
5d16ae0f-6265-46d2-8419-3a8883df3cc5	2561ac84-6949-4850-99bb-f928e176dac8	\N	f	TEETH	NULL	26	6	SW		7	GM	\N
4d4151c9-2a80-4255-8584-517278df6bef	2561ac84-6949-4850-99bb-f928e176dac8	\N	f	REED FOR CARBON	NULL	26	7	SW		7	GM	\N
e84d3339-7362-4590-932b-848f38586880	2561ac84-6949-4850-99bb-f928e176dac8	\N	f	VERTEBRAE	NULL	26	8	SW		7	GM	\N
5380cce2-0d36-4358-be9d-b883b05b5535	33b0e82d-7378-4ac3-8f21-4c3ac05e3557	\N	f	HAIR	NULL	43	1	SE		7	GM	\N
e93a1b0b-0902-42a4-af1c-902ef707e97a	33b0e82d-7378-4ac3-8f21-4c3ac05e3557	\N	f	BRAIN	NULL	43	2	SE		7	GM	\N
476f06be-b7bc-4787-aa12-1ccc0b5aec1a	33b0e82d-7378-4ac3-8f21-4c3ac05e3557	\N	f	SKIN AND EYE	NULL	43	3	SE		7	GM	\N
bd2b3511-b613-48b1-a1ce-15aa3fda7715	2a43a395-c2b3-4182-a5a2-5258e68dc49a	\N	f	INSIDE THE CHEST	NULL	35	1	SE		7	GM	\N
10cc2451-70ea-48dc-95f6-34e56a75e20c	2a43a395-c2b3-4182-a5a2-5258e68dc49a	\N	t	TEETH	NULL	35	2	SE		7	GM	\N
6d7572f7-8b29-40f0-addc-6b7075f742c8	2a43a395-c2b3-4182-a5a2-5258e68dc49a	\N	f	RIBS	NULL	35	3	SE		7	GM	\N
9e9cdd0c-46f3-4aeb-b0ac-9f031a896f44	2a43a395-c2b3-4182-a5a2-5258e68dc49a	\N	f	BONES	NULL	35	4	SE		7	GM	\N
5c78369c-adbf-4e5f-880b-da4c030cd2be	2a43a395-c2b3-4182-a5a2-5258e68dc49a	\N	f	HAIR	NULL	35	5	SE		7	GM	\N
b9722b26-0528-46a4-b698-6c3e9adf1a11	2a43a395-c2b3-4182-a5a2-5258e68dc49a	\N	f	RADIUS ??	NULL	35	6	SE		7	GM	\N
ba04f3ef-ddcf-434e-822c-defddd660d89	55c75c79-31ab-4439-9368-244d60a71446	\N	f	BONES	NULL	44	1	SE		7	GM	\N
29f3e516-de04-49bf-868a-1d70ec09e710	55c75c79-31ab-4439-9368-244d60a71446	\N	f	FOOT TISSUE AND BONE	NULL	44	2	SE		7	GM	\N
8766a3a2-76e0-4ca0-9442-502f7b5a4840	55c75c79-31ab-4439-9368-244d60a71446	\N	f	RIBS	NULL	44	3	SE		7	GM	\N
4d245db3-7e7c-45d3-8cf6-4fb2378140e2	55c75c79-31ab-4439-9368-244d60a71446	\N	f	HAIR/BRAIN ??	NULL	44	4	SE		7	GM	\N
4a69a431-62a1-4baa-a04b-945c844ab452	55c75c79-31ab-4439-9368-244d60a71446	\N	f	VERTEBRAE	NULL	44	5	SE		7	GM	\N
dd4f5c7f-d122-4910-be62-42c9859ca820	55c75c79-31ab-4439-9368-244d60a71446	\N	f	TEETH	NULL	44	6	SE		7	GM	\N
26d22104-bd71-481e-b228-ef2dbc85a5ab	55c75c79-31ab-4439-9368-244d60a71446	\N	f	SKIN/TISSUE	NULL	44	7	SE		7	GM	\N
0aa41cbc-a631-44b7-8b80-efc21e9753e3	55c75c79-31ab-4439-9368-244d60a71446	\N	f	TISSUE INSIDE TIBIA	NULL	44	8	SE		7	GM	\N
acd94ba2-2441-446f-a06d-4cf05553cb4f	549fdf53-8807-4ed5-8019-955ed01c8823	\N	f	RIBS	NULL	37	1	SE		7	GM	\N
57d13012-a0ee-4506-843e-591f50a0bb98	\N	\N	f	TEETH	NULL	4	1	SW		7	GM	\N
b2834aeb-40b7-48ea-b8e5-397af13ec3da	\N	\N	f	TEETH	NULL	18	1	NW		7	GM	\N
df931d92-64a8-4b6d-b4e9-2962c31e7da0	\N	\N	f	TEETH- NO LABEL	NULL	\N	1			7	GM	\N
d2368d0c-7c73-49e0-83bb-c9f4638f3195	\N	\N	f	TEETH- NO LABEL	NULL	\N	2			7	GM	\N
a849e2be-c935-40aa-911f-b4711564773c	\N	\N	f	TEETH- AREA 18 # I	NULL	\N	3			7	GM	1989
cd766937-11d3-45a0-b6ef-71b7100e97d1	\N	\N	f	TEETH- AREA I	NULL	\N	4			7	GM	\N
7fecb557-98b4-434e-b6c1-81ba7620cbc3	\N	\N	f	TEETH	NULL	20	1	SW		7	GM	\N
92baede1-596d-41cc-86c8-064cdd9029b5	\N	\N	f	TEETH	NULL	10	1	SW		7	GM	\N
f366944b-6af1-45ab-9a39-55094328846c	\N	\N	f	TEETH	NULL	22	1	SW		7	GM	\N
7f3118aa-30a4-4672-a93a-3b74f5212b7b	\N	\N	f	TEETH- "A 27 ACQUOR FOUND 88"	NULL	\N	1			7	GM	\N
91b00e11-de95-490b-926c-f521bced3947	\N	\N	f	TEETH- "18 W/ A"	NULL	\N	2			7	GM	\N
4214382d-faa4-4b4e-b2f7-b3d055e601ea	\N	\N	f	TEETH- "SQ I # 3"	NULL	\N	3			7	GM	\N
\.


--
-- Data for Name: burial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.burial (burial_id, head_direction, burial_depth, south_to_head, south_to_feet, west_to_head, west_to_feet, estimate_age, estimate_living_stature, osteophytosis, pathology_anomalies, artifacts_description, hair_color, preservation_index, artifact_found, description_of_taken, hair_taken, soft_tissue_taken, bone_taken, tooth_taken, notes, location_id, skull_id, pelvis_id, date_found, femur_id, humerus_id, tibia_id, body_analysis_year, needs_confirmation, length_of_remains, burial_number, sample_number, "gender_GE", gender_body_col, textile_taken, postcrania_at_magazine, postcrania_trauma, has_byu_sample, preservation_comments, burial_wrapping, burial_adult_child, burial_gender_method, age_code, "GE_function_total", burial_age, burial_sample_taken, goods, face_bundle, field_book, field_book_page_number, osteology_unknown_comment, rack_shelf, hill_area, tomb, osteology_notes, excavation_recorder, shaft, cluster, shared_shaft, cluster_number, calculated_length_of_remains, burial_materials, photo, hair_present) FROM stdin;
ea6f87d2-f393-462e-9181-418a6babc45c	West	1.9	0.21	0.59	3.44	2.14		\N				Brown		f		f	f	f	f	bones and skull\n\nAge: 18-24 years	6ae73f8b-faf7-4f0e-99e4-9e160734f5cb	d3dba6f1-1e62-40b8-88c7-22da544dea44	\N	\N	\N	\N	\N	\N	\N	\N	20	46	Female	Female	f	\N	\N	\N						890.9264	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
c1b91203-02b5-485a-8318-babc12f74fa4		0.9	3.7	3.7	2.5	4.06		\N						f		f	f	f	f		b4f4ae59-1a57-43c4-9cb4-0fbc5273c57c	bc3489c1-2885-456f-bdb4-fd68fdcee6b9	\N	\N	\N	\N	\N	\N	\N	\N	9	24	Female	Female	f	\N	\N	\N						840.9778	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
b965244f-4252-4434-a4cb-5033f39439af	West	1.3	5.4	4.5	2.1	4.4		\N				Brown		f		f	f	f	f		4db68e1e-0c36-4cb7-a51e-4263c411b421	20f669e1-b21e-4b5a-b069-bfd5b5dea4d0	\N	\N	\N	\N	\N	\N	\N	\N	23	65	Female	Female	f	\N	\N	\N						836.4952	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
12ed6677-6e69-43f6-ad82-f27cb745d7b1	West	0.6	2.37	2.4	3.7	4.28		\N						f	2 Ribs sampled	f	f	t	f	Basket case NO SKULL, NO FEMUR, NO HUMEROUS	6bb15e96-a557-4696-b8ba-07aa4650f4b0	99563f98-0e6a-4e63-8c15-8a1e6c077fb5	f01cf259-18d6-46b0-8854-83c383c49ae2	2000-02-15	\N	\N	\N	\N	\N	0.7	1	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
b9343cb8-c0fc-441d-b674-d7efd3ced858	West	0.45	4.29	5	3.5	5		157.84	Heavy			Brown		f		f	f	f	t	Hair: Auburn\n\nTextile: Black, white, red ribbon criss-crossing outer\nProfuse red at feet\nBlack ribbon too fragile to collect\n2 hats on back on head next to hair - open weave w/ border\n\n4 reed sticks under body inside wrap from shoulder to feet - for support?	354d9720-888d-4692-b8c8-25dff3910636	786ab9e0-7d14-42e7-895a-c5ea9f947f88	9d744b27-88d4-4cf0-919c-8860b97d19b4	2000-02-14	470c635a-a44b-4ae1-b6ed-870dd837c77f	a7d2f229-0beb-45a5-a331-eda839a2262e	\N	\N	\N	1.62	10	\N	Undetermined	Female	t	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
48600b03-0235-4eb5-b6bf-ad5799e411f7	West	0.23	1.91	1.83	2.39	4		179.21						f		f	f	f	f	NO SKULL\n\nTextile: Top layer 50cm wide\n0.5cm band without waft on backside  ________\n  |  |  |  |\n  |  |  |  |\n  |  |  |  |\n  |__|___|__|\n  || || || || || || || |\n  || || || || || || || |\n3 coarse layers w/ 15cm fringe - cross wrapping ribbon (was descent) on layer immediately next to skin.	ac929b36-338d-4ce9-a01c-8b49c46ff0c5	e5cc24f6-398f-40d5-bf22-1496866de1a8	c417607e-ca4f-4d5d-858a-15e98191e256	2000-02-15	f7413bbf-9291-4d11-a7ef-36163bbd74ab	\N	\N	\N	\N	1.82	11	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
4949287e-e88c-494b-b9f3-db36e663b0b1	West	1.73	1.07	1.13	2.09	3.65		172.25					II	f		f	f	f	f	NO SKULL\n\nTextile: Well wrapped: extensive 4-strand red ribbon - linen in uniform bunch at head postion - looked like it was a wad\n2 layers then strips crossing: wrap pattern repeated 6 times\none stick on each side 3 cloth layers up from body\n\n(details for head wrap missing)	ae0c85e6-8d44-448b-bc1c-155c74991654	1d4f7faa-295d-4aab-a3db-a4b689bbffac	6f8cf2cb-10a9-44e5-b2b5-23da08d72385	2000-02-14	97e4b43d-6a68-4bfe-a998-21661ea20e7c	9b2b96e2-c2e2-410c-a1ad-0a878c9758fd	\N	\N	\N	1.55	12	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
c00a4576-383a-4f92-bb12-15a29c49f507	West	0.55	4.47	5.3	4.4	5.95		228.67	Moderate			Red		f	Lung	f	t	t	t	Hair: Brown / Red\n\nTextile: 34cm x 5cm PURPLE ribbon - 2 bands of PURPLE\n5 sticks under body - each hold together w. coarse cord.	35cdae3c-1c8e-4fdc-97f2-508e869d7795	5403f555-9dee-4ed3-aa90-72666729e19a	1cedc949-e22b-47c8-be4f-0f802d3aaa79	2000-02-14	ca2c6c2a-5ef0-43a1-bee1-63601b407ebd	b977bd65-f6e4-429d-b65f-752c5e76225a	8cfc74b2-543b-47be-bf00-5c7c8177fa52	\N	\N	1.76	13	22	Female	Male	t	\N	\N	\N						883.0004	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
e7fcac0e-9b76-4259-ad25-a1ca80a693bc	West	1.6	1	1.1	2.1	3.6		\N				Brown		f		f	f	f	f		b5b2126b-9455-4fe3-8b2c-071dda21f825	3971759c-f8d1-4a73-8f3d-f81c6b7f7811	46ebfe0b-e22e-4aba-9c24-e7264e4c4118	2000-02-15	1a66150b-b69c-4d58-aa9f-aa707eafa56e	ce0bf4c8-5330-4cd1-85b0-70f65694b663	\N	\N	\N	1.6	14	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
1a7e4796-9b8a-4635-9b09-8e555cd4cfb9	West	1.6	0.75	0.96	2.15	3.75	25	\N	Slight	1 lower incisor crowded & puched inward\n\nCavities in back 3rd molar - lower jaw	Wood	Brown	II	t	Rib\n1st molar - 2nd upper molar\nRed & white ribbon / face pack	f	f	t	t	ROMAN PERIOD\n\nRed & white ribbon\n\nTextile: 7 layers + out wrap - twigs & palm sticks associated w/ burial wrapped w/ red & white ribbon\nouter wrap coarse linen - 7 finer woven lineninside - Face bundle = many layers of folded linen wrapped w/ red & white ribbon - linen strap tied w/ thread over nose\n\nTeeth: little chip in #9 - beautifully developed teeth, cavities in 2 back 3rd molars, front right tooth chipped slightly\n\nComments: Linen folded over feet toward front of body / palm sticks are inside wrappings - 7 layers inside tied w/ 2-3cm wide linen bands - a lot of palm rods inside coarse wrappings - outside - above fine wrapping inside.	16f1e3f2-b57b-41f0-9746-97e2a5843850	ac061b7a-3139-478f-98d0-94ccf3611079	710657e4-4975-4411-9879-4d22438c2db6	2000-02-21	b581d926-8acb-4605-b44b-1137c4530f13	f72d7ebe-ac79-48dd-a2ed-ff38dab49d93	\N	\N	\N	1.65	15	\N	Undetermined	Male	t	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
518fea4c-0d82-47f4-9e78-1a087fb8acc7	West	0.75	5	4.85	3.5	5.1	35	\N		Upper molars lost - periodontal disease#3 / bad absess on lower right mandible\n\nCavities in molars - all of them.		Brown	IV	f	Taking lower right molar & lower left molar	f	f	f	t	ROMAN PERIOD\n\nPOORLY PRESERVED/WRAPPED\n\nFlat chin indicates a MALE\n\nTextile: coarse outer wrap - multiple inner wrapping - 14+ coarse outer wraps\n\nFace bundle - not well preserved - many layers in face bundle\n\nBeautiful long ft. / Right foot place over left foot in burial.	6f4c401a-d141-415a-a306-3703cd29beab	2b9734b5-803a-4e0e-96c7-9522b53b0830	ccbca016-cf30-45eb-9c8b-b36ab07f0e62	2000-02-21	2ff58043-a072-47f6-b7ed-792cf576a110	3fb69d89-da13-43e0-9d60-d0f148762a2f	\N	\N	\N	1.72	16	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
120051ee-559d-4a27-a85c-5373aa4b6a67	West	0.83	4.8	4.75	3.55	4.2	7	\N				Brown	III	f		f	f	t	t	BURIED W/ 2 ADULTS (SE#17,18)\n\nTextile: linen w/ PURPLE stripe - PURPLE stripe down length - front - PURPLE stripe goes over the head.	c10a217c-6082-4a05-9ef0-04250112b241	37cc8bc8-0f12-453e-ae30-d6d55e5e6e96	\N	2000-02-16	\N	\N	\N	\N	\N	0.84	17	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
f7d0ec48-1804-4000-bfa4-cdb8f760fa37	West	0.9	4.75	4.7	3.4	5	30	\N				Red	IV	f	Taking 2nd lower molar & 1 upper 2nd molar	f	f	f	t	ROMAN PERIOD\n\nHair: Red / Brown\n\nTextile: Face bundle - nice\nBADLY PRESERVED\n\nHemp rope - face bundle - beautiful hair	a84e8593-853b-4cf8-9c5b-85336461a2e0	abd1a9f2-88a0-4749-82d9-ca99df7a884e	307c4af5-790b-4da7-8553-54a60e1033c4	2000-02-21	\N	ae8d261d-a7c7-4e8e-a321-b82ee7d84734	\N	\N	\N	1.76	18	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
b856278e-65f4-4978-95a5-5bd0ee511f2d		0.51	2.05	2.05	1.17	1.17		\N						f		f	f	f	f	UNDER PLUNDERED BURIAL - NO HONORS\nONLY KNEES TO FEET PRESERVED\n\nLINEN WRAPPED - Red & White Ribbon\n\nRIGHT FOOT OVER LEFT FOOT.	29862e91-f97c-4ee6-84e6-6f06897b6666	0826ae42-9716-4a26-81e3-11c4ae3dce70	\N	2000-02-21	\N	\N	\N	\N	\N	0.56	19	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
21f4d50f-62e9-4390-84d9-da42b0b08980		0.47	0.66	0	2.5	5		165.25						f		f	f	f	f	MISSING PELVIS, MISSING SKULL\n\nMISC. BONES	4daaba8d-15b6-48d8-a758-9fb65bf83409	95b2365c-c73e-40f4-a665-0c4929675579	\N	2000-02-21	01f2decb-87c4-4f48-b9b8-ec1aeea21de1	df01886c-7b1d-4995-a1f1-bc545f914faa	a202c158-1f4b-4777-b71b-071a665aa6ff	\N	\N	\N	2	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
aa763876-68b0-4033-8202-f056a3049e51	West	0.7	2.15	2.4	-0.7	1.3		\N				Brown	IV	f		f	f	f	f	Palm branches w/ burial - multiple layers - POORLY PRESERVED - TALL PERSON - larvae in cloth & hair - wide pelvic notch - \n\nTextile: rope around linen - lower body (slide) - salt crystals underneath linen\n\nA lot of dorsal pitting - deep.	76cb538f-74ce-4111-b2ea-faee8b031652	31f5b508-6890-49cd-aa31-7964231c2f78	ef830645-bec3-41ee-9700-22a96f33cf5a	2000-02-21	\N	\N	\N	\N	\N	1.98	20	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
e5275e46-467a-4425-b3a2-bd74f4258653	West	2.3	1.3	0.4	4	5.29	40	\N		No upper teeth - pre (anti) mortom - periodontal disease (advanced).				f		f	f	f	f	SKELETON ONLY - NO TEXTILES - BURIED NAKED\n\nnot tall.	d31ea56e-bfc6-457a-a044-66eb924998a4	4c37122f-0dc7-4d55-a72c-aabee2b27c44	597ac647-0776-423c-ae52-782b75d7a330	2000-02-21	274bf38a-ce3b-4be7-a035-7e5df642557d	c11a2be2-c124-4697-b173-2db8e552747d	\N	\N	\N	1.59	21	39	Female	Female	f	\N	\N	\N						889.0782	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
771934d1-6ee3-4bbf-b75a-c96528810f6d	West	1.75	3.05	2.8	0.8	2.5	40	222.87	Slight			Brown	IV	f		f	f	f	t	POORLY PRESERVED / FEW TEXTILES\n\nTextile: linen - little ribbon\nsome linen scraps	017a001e-ae78-4d5d-87ac-b472e03c1caf	9b6595be-d28c-4abe-8764-4c1a9d2bf347	61232c64-b649-4041-bc30-bbbe11c366c9	2000-02-21	77a5163e-f9b7-45b2-a9cd-c071893714c5	b44be30f-5248-4419-bd7a-6eefb9196d4d	\N	\N	\N	1.6	22	23	Male	Male	f	\N	\N	\N						917.6714	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
84dc1579-2d7d-423a-85eb-37dafd5ba15f	West	1.95	3.35	3.35	1.5	0.85	2.5	\N				Red		f	3 Ribs	f	f	t	f	CHILD\n\nTextile: Beautiful PURPLE strip - PURPLE stripped linen bag w/ draw string - baby inside	98aaa2d7-05ea-41a3-a94e-4a85e09c6c07	55c81b11-8344-4ee9-91b9-3ba0a5c2423d	\N	2000-02-21	\N	\N	\N	\N	\N	0.45	23	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
e3f5d2c2-a405-4660-8309-eb4e47e599b0	West	1.9	2.85	2.6	0.75	2.35		\N				Black	IV	f	Upper & lower molars - have samples	f	f	f	t	Preservation Index: bewtween III & IV\n\nTextile: (slide & sample) - long straight fringe linen - palm leaves / fronds - palm branches under outer wrap - coarse outer wrap w/ red & white ribbons - 7 wraps total inclupin (?)\n\nLong straight black hair\nOsteoporosis\nBeautiful teeth	862a0002-6f16-4982-b8e8-d32c4ed520b1	4eac084a-3b04-4718-aa3d-fed5c208a815	d944ce35-1941-425f-91d9-94324681e23e	2000-02-21	0793295d-47b5-4c0e-94fb-38bcaab0e8ef	fc3742b6-781b-4d8f-a33b-167582b74a6f	\N	\N	\N	1.65	24	31	Male	Male	f	\N	\N	\N						934.8716	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
60efc72b-5944-4209-bc00-c16159d9e1e0	West	1.35	3.1	3.25	3.1	5		\N						f		f	f	f	f	PURPLE wool in linen wrap / wool disintegrating (slide taken) - LEAVING IN MAGZIN FOR FUTURE ANALYSIS.	ecd4e12d-0569-4edd-b893-a10b9099858e	5b06877d-f377-4bba-ab0d-a8ade86531c1	\N	2000-02-21	\N	\N	\N	\N	\N	1.8	25	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
7f7f9902-4f17-475a-bbec-5c8aca782e3d	East	2.4	2.8	2.9	2.1	1	14	\N				Brown	II	f		f	f	f	t	YOUNG PERSON\n\nTextile: linen wrap\n\nfemur head no developed - too young\nbasilar suture not closed all the way\n\nTeeth: Hardly worn teeth - 2 molars on each side - bottom & top in - 3rd molar not in yet - ridges on bottom teeth indicating youth.	72ef9909-930b-44ad-ac64-2fc9582fa3da	f05d0cb8-6b3f-45b2-89d1-8bce348a7410	b90f0562-f8a8-422b-9a00-a827a2b38351	2000-02-21	\N	\N	\N	\N	\N	1.1	26	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
0278667f-d8c7-4b22-abe4-befdc77c9899	West	1.25	4.2	4.25	0.9	1.5	6	\N				Blonde	IV	f	2 teeth (molars)\nRibs	f	f	t	t	POOR PRESERVED - linen wrap, linen strips banding\n\nHair: blond / red\n\nTextile: 7 layers of linen on head.	447b8825-50e6-4b83-8353-13be861be223	9dc86d1b-b006-4fac-aa60-dde4612d3a06	\N	2000-02-22	\N	\N	\N	\N	\N	0.65	27	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
eaa3d69f-2e27-4d73-bead-4e1f5cac5477	West	1.3	2.4	2.45	0.4	1.05	3	\N				Blonde	V	f	crystal from body	f	f	f	f	YOUNG - Badly preserved\n\nCrystalline formation	d3181ace-ef57-4ad4-8f60-25fe5bd4c48d	b60f5baa-6799-4683-9d7b-c13260dc3956	874c1c78-be4a-4a2e-b20f-043cf2a18f89	2000-02-22	\N	\N	\N	\N	\N	0.65	28	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
5c20f505-6de5-40a2-b662-80bf7eaa6cc0	West	1.35	2.3	2.35	-0.35	0.45	12	\N					IV	f		f	f	f	f	CHILD\n\nTextile: coarse linen - 3 layers - linen bands.	302c250b-f8e2-4326-ab14-90f2f3270316	e7deddad-5be1-4d3e-a394-9cd93fe32603	8bfd2ba5-3afe-4532-8887-bad6385f9efe	2000-02-22	\N	\N	\N	\N	\N	0.85	29	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
cfa91b40-5db4-42a1-bed5-094a4818592d	West	0.55	3.65	3.69	2.53	3.94		156.605	Heavy			Blonde		f	Lung\nRib	f	t	t	t	Hair: Blond / Brown\n\nArms @ side - left foot crosses right foot\n\nTextile: 4-strand red ribbon outer wrap - some crossing - 10 layers of outer wrapping - exterior layer = finer weave than 9 interior layers\n2cm wide coarse strips / wrapping under outside fine layer\n\nBound w/ reed stick interior along legs up to mid-rib cage.	cf9baa25-a721-436c-a59c-7e14bfc2ee82	d7f0b6ed-a1fe-4670-a75d-4da01769f942	d3c887cd-1e44-4402-9266-5a2cfe8d9857	2000-02-12	8fca0172-3883-491a-b526-6c5e108db33f	fb35665d-7647-4720-ac27-37df82e8c8bb	284f8ce6-a333-471b-a36c-8f4fe2bef0fa	\N	\N	1.56	3	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
06ee70b2-7f2c-4dab-ba73-a8a9bc1f6eeb	West	1.3	3.45	3.25	3.15	4.8	23	\N				Brown	III	f		f	f	f	f	A LOT OF SKIN / BITOMINOUS MATERIAL (BLACK)\n\nBugs in pelvis\n\nRIGHT FOOT OVER LEFT - Right upper orbit broken near nose\n\nTextile: Face bundle - \n\nHair: long brown hair	d89b8813-e22b-47f4-9483-06cd379aac91	383774b8-3c1a-42f5-b897-531e117eb08f	2cc6ca21-57d7-40b0-bf49-c01efa8e6767	2000-02-22	c77f8e62-517d-4b74-beac-25f54a313218	655fa739-341a-418e-a581-bfd74c8e178c	\N	\N	\N	1.7	30	106	Female	Female	f	\N	\N	\N						863.8136	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
9570ce39-eed0-4095-bc1d-a4100323fef4	West	1.45	2.9	2.65	3.25	4.45		\N				Brown	III	f		f	f	t	t	BADLY DETERIORATED CHILD\n\nTextile: No ribbons or banding - shrouded in coarse linen - finer underneath - then under that coarse w/ linen binding - then 15 layers of linen wrapping underneath.	7e375f51-b5d1-471f-944d-601ff8ab1613	f013500f-dd17-4570-ba2b-c0ec9bee06ce	\N	2000-02-23	\N	\N	\N	\N	\N	1.25	31	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
b5f788b4-fc87-410e-a69d-2b13240a9597	West	1.25	4.7	4.8	0.3	1.8	38	\N		Tooth attrition: between III & IV\n\n3rd molar in then lost.		Red	IV	f		f	f	t	t	Textile: Linen - red & white ribbon\n\nFace bundle - in bad condition.	9ecf49d3-040b-405f-981a-7456575be39f	5d153846-458a-4022-8870-3ed2b03886f6	3b92b654-cde4-4015-8be7-18182ef041bb	2000-02-23	5350041d-9430-4e15-9061-ca037f4a7aa3	a501014d-08b7-4d77-aba0-90de52ac2aea	\N	\N	\N	1.6	32	80	Male	Male	f	\N	\N	\N						896.1484	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
aae56282-8f9a-460a-b3e0-98d366d84105	West	1.35	4.7	4.7	0.2	1.8		\N		Upper & lower molars missing - 3rd molar had erupted.		Red	V	f	red & black threads on linen wrapped w/ red & white ribbon - palm branches inside wrapof feet.	f	f	t	f	Preservation Index: between III & V\n\nPalm branches inside wrapping\n\nTextile: red & white ribbon\nFace bundle - coarse - fine - coarse\n\nAll layers next to body carbonized - photo taken	482e512d-abb7-4bd4-83e4-da8ae1dadd8d	d6ad4263-37c4-4bd3-a69d-8a585465a871	1b9269b1-7e61-4ef5-982c-8becc4808187	2000-02-23	d246ed23-0bd0-46af-b4e0-411e2e48caa4	657321a1-987b-4f3f-8c07-bb6ea6b993ff	\N	\N	\N	1.74	33	81	Male	Male	t	\N	\N	\N						932.9494	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
8ee3a369-08c4-46f6-8698-1017dc642ce7	West	0.75	0.4	0.5	1.25	1.95	7	\N			Pottery - wine drinking cups - Roman dishes (ridges & shapes) - Glass beads found w/ burial around neck.	Red	IV	t		f	f	t	t	POORLY PRESERVED - Dates listed w/ burial\n\nHair: red / brown\n\nHands: Fingers, fingernails well preserved\n\nTextile: Red & white ribbon & cord - heavy coarse weave - wrappings = rope wrap underneath & on top.	7800a002-4d7d-41d7-8837-8c6273c333c4	963e0499-ea17-4799-95d3-42fd709e66c0	\N	2000-02-23	\N	\N	\N	\N	\N	0.8	34	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
1b4be0aa-4d04-48f3-8b9f-96c31f3468d2	West	1.45	3.35	3.3	3.2	5		\N		1st molar missing below	Wood piece found on shoulder	Red	III	t	Wool Fabric in welf of linen - nice samples	f	f	t	t	Hair: red / brown\n\nTextile: heavy linen wrappings w/ red & white ribbon - 2 layers of linen fine then red thread - LOTS OF BUGS / larvae (flourescent) in head / hair\n\nPHOTO TAKEN - \nLARGE KNOT -	226ab9da-d02f-4159-bdc4-57a88778a514	84035a23-d849-4e56-bd11-428a5098f51b	907a5eb2-84d5-4924-8604-ef4e98788306	2000-02-23	7a15b79e-4613-4410-ab15-79e31836ee1a	8bf61fec-314c-4563-a38c-cfd44e59649b	\N	\N	\N	1.85	35	90	Male	Male	t	\N	\N	\N						941.2778	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
7746dcd8-5487-4387-86c4-37cfa698d910		0.95	1.1	0	0.6	5	1	\N				Red		f	Ribs\nCloth taken	f	f	t	f	IN PIECES - ONLY CLOTH\n\nNEW BORN to 1 YEAR	5e246299-b1db-43a8-bb51-6066ad297744	baeee843-c03d-4a8d-9680-d33739443fad	\N	2000-02-23	\N	\N	\N	\N	\N	\N	36	\N	Undetermined	Undetermined	t	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
8d08c438-e5a5-437b-b4bf-4764b931bcdc	West	1.68	4.15	4.17	0.25	0.8	3	\N				Red	V	f		f	f	f	f	SMALL CHILD - POORLY PRESERVED	8aba9ecc-20b0-4d89-b820-55d4a2f229a9	f1b7f6e7-8527-4ecc-a2a7-cd146827324e	72337b24-fe33-4ed2-bb37-ccbf1d4d891c	2000-02-23	\N	\N	\N	\N	\N	0.7	37	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
3cef85b1-c9da-42c4-b58d-89ac5ee4a42a	West	1.75	4.2	4.2	0.9	1.65	11	\N				Blonde	III	f		f	f	f	f	CHILD\n\nTextile: Linen plain - coarse linen next to skin - finer on exterior on head - coarser exterior on legs - finer exterior linen begins at thighs & going over body - fiber rope wrap - finen linen only in on front - wrapping on interior = coarse / fine / coarse - rope holding 3 layers linen.	095058b7-9976-4b32-be4f-057abd729471	28782f7f-e2e9-4f7c-b59b-52b7fc327620	\N	2000-02-23	\N	\N	\N	\N	\N	0.8	38	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
a78d99a5-2f11-49ff-a3a6-b2a29618c809	West	1.95	4.25	4.25	0.25	1.75		\N	None	No cavities			III	f	Fabric	f	f	f	f	Head west\n\nTextile: Linen nubby - rough exterior linen becoming finer inside - under layers linen also wrapped & tied linen strips - under outer wrap 3 BIG layers w/ fringe - sample taken - bottom layer was rope fringe - 3 layers w/ rope fringe then another w/ loose fringe - Face bundle - many layers of linen - 7 layers linen - linen strips tied in knot in back - looped through self for half-hitch knots.\n\n3 PHOTOS TAKEN	0abbb673-f970-43fc-b70e-de7f3ff91b02	76e8002a-e3cb-4823-8871-c2461801aff2	18f45b65-73be-4036-8d01-44cc612ec0c0	2000-02-22	4b82f5fc-1966-450e-af5f-17ec56631469	52850cf6-509c-4335-a97d-ece60c24ee1b	\N	\N	\N	1.7	39	\N	Undetermined	Undetermined	t	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
1128459f-8fbe-44c6-bc13-e53e83d2db99	West	0.46	3.55	3.54	3.33	4.06	5	93.62			Brass bracelet\nBead bracelet	Brown		t	Chest area	f	t	f	f	INFANT\n\nHair: auburn\n\nTextile: coarse weave / red & white ribbon\n\nCrosote hay on chest	fa3f8a3f-a58b-423b-804d-43fcc3690336	99ad8454-8d17-4eb5-8a55-a458a29ea6f6	\N	2000-02-12	eb8a1ea5-0395-4177-a1c0-2f6a5b39d87c	\N	\N	\N	\N	0.85	4	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
76218ec7-5a48-4ec0-b07e-7a6c44063b54	East	2.57	2	1.9	1.1	-0.1	15	\N				Brown		f		f	f	f	t	REVERSAL	6c02a2a7-2668-4a1f-9518-49591192c211	4f35f422-7f69-48e6-ba44-b012a3f83ee9	\N	2000-02-23	\N	\N	\N	\N	\N	1.4	40	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
9af52b1d-b882-4bad-aa24-4ea26c33dae2	East	2.6	2.2	2.1	1.07	-0.15		\N				Brown	V	f		f	f	t	t	REVERSAL - HEAD EAST\n\nNo textile	132b340f-92e4-44e3-80f2-40a61c68849d	f62158da-8bb8-418e-911a-68295fe50674	e82d5217-fb28-42cf-a6ca-2a544a45fb80	2000-02-23	40cb287c-9e4c-4b02-acff-d0176279e07f	46bad1c0-af98-4c12-b0d2-dad5e0f707cb	\N	\N	\N	1.45	41	87	Female	Female	f	\N	\N	\N						842.7956	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
26ab3ac0-9e01-4b56-b5b9-ee565955f3c9	West	2.1	2.7	2.8	3.4	4.8		\N	None			Brown	V	f	Tooth for DNA	f	f	f	t	Head West	2f41882d-3c19-4172-b39a-4c01892717ea	2576776e-e56a-4823-94bb-52907dbdf5ea	0594d451-5a79-42bf-b2fa-5379c02e84f4	2000-02-23	c6209499-ec50-4546-94aa-118f9c02e6a7	ec4b7c0b-7821-4417-af9b-e734d83437a9	\N	\N	\N	1.4	42	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
711cc456-b320-418a-8b3b-456ed27995a9	West	2.2	4.4	4.5	-0.1	1.65		\N		All teeth gone except #9 - #9 has a cavity		Brown	V	f		f	f	t	f	Head West\n\nHair: Brown / Red\nBeard: Red beard\n\nPHOTO TAKEN	9a5d1442-f6b2-4ac4-a882-f55247d4e87b	2d56dc33-c2b4-470b-ae59-760b4ff888e9	14372018-676b-4241-bef6-723ad4e2d865	2000-02-23	7e57b81b-1ad6-4210-9516-9fa4354e0802	60940369-7629-45fe-b738-e2edc53c8dc4	\N	\N	\N	1.65	43	77	Male	Male	f	\N	\N	\N						925.6816	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
2e9c1f20-15b1-4449-a09a-9e391a2477ce	East	2.2	4.2	4.1	2.45	1.65	12	\N					V	f	Textile: green w/ dark strip	f	f	t	t	REVERSAL - HEAD EAST (PRECHRISTIAN)\n\nVERY POORLY PRESERVED SKELETON\n\nSmall amount of textile	bdfc11bc-d2f1-45c6-a382-13f901d4a017	7eda748d-3d83-43b6-bda2-45a446c899ef	\N	2000-02-23	\N	\N	\N	\N	\N	0.8	44	\N	Undetermined	Undetermined	t	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
5a2d4f6a-0afa-46f0-9589-6f0766ed89d2	East	2.45	3.1	1.5	1.4	1.6	25	\N		Upper molars lost during life		Brown	V	f	Ribs\nUpper molar	f	f	t	t	REVERSAL - HEAD EAST\n\nSKELETON ONLY\n\nHair: brown / red\n\nTextile: linen scraps - medium weave	5c0c1333-78ab-4bd6-86d2-bc31c2188c36	784b8714-d4b9-49e4-87bf-2d05fbcf9a9e	d63a57c6-0388-4fdd-bc89-e0a10a1a6197	2000-02-23	9d76b97b-c3bd-4f61-8baf-61651e9bddbb	a2cc4f46-1b6b-4058-9dd9-6fa01ae5c09a	\N	\N	\N	1.8	45	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
21c3b37c-4718-4292-b715-3568da2c9cf0	West	2	4.2	4.3	3.25	5	30	\N				Brown	IV	f		f	f	f	t	POORLY PRESERVED - SEEMS TO BE WEALTH B/C 21 LAYERS OF COARSE LINEN\n\nHead West\n\nTextile: Large face bundle - many layers - large rope twist - 7 layers - 25 folded layers over face	98fefafe-3220-4d66-8e9c-7939c2d1bbe8	551238a8-6cc3-402d-b2ac-5631dd292581	14caddb9-8eec-45c9-9c43-de2d4b40249d	2000-02-23	334379c5-537c-4686-9127-b1c6cff3cea4	9b8bd632-05c5-432d-b1e2-2705144f5d85	\N	\N	\N	1.78	46	86	Male	Male	f	\N	\N	\N						895.9896	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
9aaafd10-2994-4d23-9d15-8090aa48b2a8	East	2.55	2.1	0.5	1.05	0.9		\N		Upper teeth missing		Brown	V	f		f	f	t	t	REVERSAL - HEAD EAST\n\nPOORLY PRESERVED	335a59d5-56ba-4d49-9f84-5416272617a5	7cd9fe70-52e2-431a-ad7f-86791d4e1dd4	ca3d6630-734d-4f95-84b1-c3a304f8b437	2000-02-23	17297c67-1f7c-440b-8bc1-9f937c667d18	0e219021-a3a1-40f8-bd00-444e2452bbff	\N	\N	\N	1.8	47	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
496df30f-fe73-4a01-bde7-13a197ed3746	West	0.74	3.2	3.57	1.81	3.31		172.25				Brown		f		f	f	f	f	NO SKULL\n\nHair: Auburn\nPubic hair:\n\nHeavy resin in abdomen\n\nTextile: 4 layers coarse cloth - ? Coat on ventral	540d0d76-c9e3-45bf-a1d7-534e9d44bbc3	bd1bf2bd-01d0-4565-9fdd-ee2539b72558	aef5af9b-d683-4dcd-9bb3-4bb01eececb2	2000-02-12	1506d056-4494-476c-a448-4448e4628728	9a480324-82b2-4615-82be-433b37fc2a7d	52f29726-5e94-40e0-9805-37efd6e29fb3	\N	\N	1.47	5	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
44f9d4a8-bca2-4ebd-8fb1-31326d62d6e9	West	0.61	2.05	2.1	2.61	4.1	20	150.43	Slight			Brown		f		f	f	f	f	Hair: auburn\n\nTextile: coarse outer, multiple linen interior\n\n4 layers coarse\n7 layers line	0c9c44a0-2de5-428d-8985-7686637fe20f	1b47695d-693f-4160-ae6c-6ce94bd9b930	176ad77d-fe23-4864-94d6-575292e0b2e9	2000-02-12	52ed5c2b-9acf-4605-b0f2-3c2ffd4e4403	836ce9ec-3df8-4725-b3f3-f42807796985	3b72c056-0b70-4011-bf6c-75f7ae5ed64a	\N	\N	1.6	6	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
9f3da3bd-228a-4252-acff-da4d5bc28a20		0.23	2.04	0	0.15	5		167.61				Red		f		f	f	f	f	DISTURBED - Plundered / Distrubed\n\nCHILD / INFANT skull in magani red hair\n\n2 humerous of different sizes\n2 mandibles - exterior peaudo?\n\n1 left pelvic girdle\n2 femurs\n\nTextile: Red, PURPLE fine weave pattern - coarse weave w/ 6 fringe - yellow, red, blue.	3b8767d4-88ac-4943-8ca6-259b6d97acaf	e51a916e-81c6-4cfa-8ffb-431373a83ad4	10bd85a6-4de2-4e36-b7d9-a09df0340bfb	2000-02-13	5bef8569-1fbf-40bd-800e-eb7a47308471	\N	\N	\N	\N	\N	7	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
8da14029-2900-4e56-9cb1-9f55015aa8a9	East	0.7	3.81	0	4.72	4.31		74.354						f	Rib sampled	f	f	t	f	INFANT \n\nTextile: coarse yellow w/ blue thread outer layer - multi patched inner fine linen\n\nNo evidence of tooth eruption.	f839f131-398e-4823-a43a-cbbc1314766f	59e33c19-4a04-4eb4-9eb5-a3d01ee4ef17	a77fd001-c578-43cd-93e9-7b203cc9acc9	2000-02-13	1dd9b76e-36c6-45fe-acae-8b68e97788dd	\N	\N	\N	\N	0.4	8	\N	Undetermined	Undetermined	t	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
0a048a5d-151a-48ab-a027-ebf29d671ead	West	0.27	5	5	3.35	5		212.43				Brown		f		f	f	t	t	chest area affected by salt deposits from rock\n\nTextile: 9 layers of wrap - each uniform\n\nsome wraps between legs - reed sticks on both sides (3 left, 2 right) - 3-strand red ribbon over outer body w/ crossing pattern\nHead wrap - multiple layers w/ strips - bunched at maxilla and tucked under  \n  \n3 layers of wrapping next to body / sticks / one layer coarse wrapping.	57782348-f7f3-4b3b-bb84-cf8271183ac0	4ddac89c-fe4a-4b87-b0b7-e851da8e7f14	82573bad-6bfe-4db3-9243-6e7c269998b5	2000-02-13	f9324a2a-ee68-477a-b3dd-a7c822272c05	680dc237-15d5-4a6a-a157-f8af6cd9bd8f	da491ed3-61b3-47b1-9991-3870f91c6430	\N	\N	1.65	9	26	Female	Male	t	\N	\N	\N						859.1662	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
67edf67b-d127-4d0c-92c8-a7fc72e8296b		0	0	0	5	5	2	\N			Necklace - woven of 13 red threads - twisted w/ 2 bone beads at each end to act as the end holders - like on shoelaces.	Brown	IV	t	Bone: ribs	f	f	t	f	On edge of area - sole burial \n\nTextile: outer= coarse linen - jute twine - double strand rope - twine wrap\nred threads in outer linen at feet .75cm wide running length of body\nfine linen w/ wool thread woven some hem evident	6e6df8a9-d96b-4d49-9ac6-35b65fff6dcd	52d1b8f9-4566-42b1-b21c-edef8541bb2f	\N	2003-02-03	\N	\N	\N	\N	\N	\N	23	\N	Undetermined	Undetermined	t	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
ac9da490-145b-4d1a-831a-08aad63ce0b8		2	0	0	5	5	12	104.735				Brown	V	f		f	f	f	f	In a shaft - bottom burial\n\nTextile: 2 types of textile - outer = coarse & fragile linen\ninner = fine\n\nAge: between 12-13 yrs.\n\nStature: femur & humerus measured w/o heads	3f8191e8-186e-4db0-a931-5cc42fb6dbfa	7784d1eb-fd27-45e1-9936-bb75ee55a3e4	432f3a0f-1753-4352-8b80-6fe3020e1b4f	2003-02-03	fd979420-802c-4cd9-8f57-eeaa8ec8ed58	d34cc6f3-9d64-4fa3-b936-f276e13463ac	\N	\N	\N	\N	24	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
1077b21a-dd23-425d-a5fb-6c774b68367f		0	0	0	5	5		\N						f		f	f	f	f	(RPE 5/12/03)\n\nNUMBER NOT USED	611b7649-8eb2-4689-8946-9511426e7079	6f93bbf7-4958-4c17-93db-99adb265583d	\N	2003-02-03	\N	\N	\N	\N	\N	\N	25	\N	Undetermined		f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
85afda05-7284-42a5-9bd6-fbefa89b0ccb		0	0	0	5	5		\N						f		f	f	f	f	RESERVED FOR ANALYSIS IN FUTURE SEASONS @ REQUEST OF Fayum Antiquetic - Ali Bazeedi (RPE 5/12/03)	a78619f6-95c3-4f02-a856-cff66e3b1f3b	3b4341e9-9e3c-427e-b2c4-6558990ff5d8	\N	2003-02-04	\N	\N	\N	\N	\N	\N	26	\N	Undetermined		f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
792b5cb5-4e4d-4db7-a3d4-ff83e80b9422		0	0	0	5	5		171.554		extensive periodontal disease - missing teeth & reabsorbtion of bone		Brown	V	f		f	f	f	f	Skull & feet ok - middle of body not well preserved\n\nTextile: square ribbon wrapon head - criss-cross on body\ncoarse exterior \nfine interior w/ red & green band in linen fragment\nextra linen turned up over feet\n\nFace bundle - with folded linen & twisted linen on top\n2 kinds of ribbon = 1) regular linen w/ wool threads (red) 2) torn & folded for outer wrapping coarse	872c36d9-53dc-4b90-a0d7-9535cff43cf1	b6cd5025-7e83-43bd-b135-3aa0093a6ddb	1cbf4330-7293-4062-8060-c182e7acd87e	2003-02-04	8b48f80f-54e7-418d-a576-4632c8e7e886	d806283e-6096-4119-88c3-fc1fa618e62a	\N	\N	\N	\N	27	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
785306e6-f2a9-4609-bf05-62f75a56a8ff		0	0	0	5	5		173.41		Molars gone, bone reabsorbed - abscess on right mandible - most teeth badly worn away		Red		f		f	f	f	f	In shaft w/ rocks on southside\n\nHair: beard & mustache = a lot\n\nTextile: coarse linen has 3-cord weave as in past\n\nFace bundle - with folded linen & twisted linen on top\n\nfrom outer to in:\n------- wrap\n==== coarse & wrap \n==== fine\nfine exterior linen = criss-cross wrap of ribbons, some fine, some torn & rough some wrappings & riboons under outer layer\n2 layers then 5 fine layers in interior\nends of linen - 3cm of fringe.	8367e6a4-643b-43b8-9218-a680ee370611	9a84f37a-db88-4a9f-a0be-ec316a109cca	eb86b087-2353-4c3a-a1cc-150f12b846fc	2003-02-04	750ad69c-e739-4b18-8c09-08f7b472d0f1	5abe5208-2bc1-41b1-8755-2c564e58db5a	\N	\N	\N	\N	28	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
3d41fc98-eb65-4a74-9ef0-82f6356be219		0	0	0	5	5		161.81		3rd molars have carries - no periodontal disease - cusps still defined		Brown		f		f	f	f	t	Deep skeleton - in shaft\n\nHair: brown, long, curly\n\nTextile: a small amount of fine linen on the head	5ea8fd5c-efb1-49cc-85c6-1043a61810d0	805b1a6a-358d-43ee-a596-f8b8c3f1e9c0	43b7d548-61bc-44fe-b299-2f17bd44f697	2003-02-04	758f5db5-3c1e-4f4a-add2-5642f2803f53	9a8e3b20-fa8d-472c-bb15-98370afc9703	\N	\N	\N	\N	29	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
fb90d696-9be2-4d19-aaf0-3fdaf02dcc6f		0	0	0	5	5	5	\N		No molars erupted but 1st molars almost erupting		Blonde	IV	f		f	f	f	f	CHILD\n\nTop of 3 burial unit\n\nHair: golden brown, blond, very fine\n\nTextile: 7 layers of cloth on head - 2 inner most layers = fine\noutside wrap - medium coarse - double twist jute twine over linen, knotted @ chest\n\nNO RED RIBBON on this burial, but 2 below it had red ribbon wrapping.	ead5649f-23d8-45dd-9925-ad9698488fb9	de86552c-f385-4c5e-94ee-ad04ee55f5de	\N	2003-02-05	\N	\N	\N	\N	\N	\N	30	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
586707ed-54ae-4534-9fd9-88b9a8402e7d		0	0	0	5	5	12	\N				Red	III	f		f	f	f	f	CHILD\n\nMiddle of 3 burials\n\nHair: red/brown\n\nTextile: 7 coarse layers inside 2 fine layers outside\nfine layers have purple thread pattern in them\n\nouter ribbon = 4-strand red ribbon\n\nFace bundle - inner layer of red ribbon as well as outer and so on - 3 in total - folded not twisted \n\nFeet - wrapped w/ coarse linen strips.	76e1cab8-39e0-453c-a626-c01c57674f55	3973ed52-830f-4f93-8a78-a5e619c22dff	\N	2003-02-05	\N	\N	\N	\N	\N	\N	31	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
fc6667dd-e81c-4c87-9b85-62204347d3d3		0	0	0	5	5		157.593		3rd molars near eruption\n\nHumerous w/o head\n\nTooth attrition - between 1 & 2		Red	II	f		f	f	f	f	Bottom of 3 burial cluster\n\nHair: red/brown\n\nTextile: Outer layer wraps - white ribbon for most of body - red - 4-strand ribbon on feet & head - good head bundle, but only folded - not twisted\n\nlayering of linen - \n1 ribbon\n1 linen fine\n1 linen strap\n3 wave wrap \n1 wave strap\n4 rough wave linen	7dc1faf1-213b-429b-9439-e79982677839	9168a1d0-689c-48c1-93ad-0d63265d77a7	71806c1f-0711-43d8-b269-2d01ce1b8f66	2003-02-05	e6e7c7b4-ba69-4a42-b2ee-2b6c42ad11a0	c018223d-3546-4269-95cc-c7d3b68349bd	\N	\N	\N	\N	32	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
02219761-b1a0-4dc2-a50d-738fd566da31		0	0	0	5	5		179.21		Extensive perio\n\nTooth attrition - between III & IV\n\nmost teeth missing - much bone reabsorbtion & abscess in left mandible		Brown	V	f		f	f	f	f	ADULT LARGE - match in garlands (2) & wraps for NW26\n\nPreservation Index: between IV & V\n\nTextile: 2 reed-palm garlands around neck\n\nmultiple layers of linen at feet -\n4-strand - red ribbon fringe 2-3cm long\n8 layers of fine weave close to body then 2 layers of medium then 13 layers of coarse outer wraps\n\nAT LEAST 23 LAYERS	73794510-c63f-43ef-b4d2-dfbf9c3d7993	f57570ae-41fa-4e23-bb81-1f3b5e3f4f5b	236d7ca5-c07e-433c-aa9f-7d5ca8f5015c	2003-02-13	ee63666c-27cf-4278-aa93-234b57ca6b1f	fe330599-e45f-4d3f-ba48-c00dce64e49f	\N	\N	\N	\N	33	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
f1289f19-7763-4b66-a677-621cf1c20a92		0	0	0	5	5	12	96.09		Femur & Humerous measured w/o heads				f		f	f	f	f	Textile: fine linen - not marked or colored	3e94da93-7bb4-4f33-a4e9-f809c1c75169	8f62979e-ba14-4385-a564-871935a4091a	\N	2003-02-08	3a2583c0-04df-4ace-acf2-cddf346f162b	b07c0b3a-478f-4b3a-8164-4adf82358136	\N	\N	\N	\N	34	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
9e865cb9-6f11-4b96-8577-3415f167b569		0	0	0	5	5	16	160.063		Femur & Humerous measured w/o head		Brown	V	f		f	f	f	f	Textile: fine weave inside & outside w/ several coarse layers inbetween -\nouter layer w/ red banding\n\nFace bundle - large face bundle, but just wads of cloth.	32fcd020-4d67-4e80-95a2-8be426f60b66	47c03b11-6122-4b4d-b327-2422cf815a8b	50a9a1fb-6eaa-4221-8c8a-02583746d617	2003-02-13	7082e661-469e-4579-84b3-454183db3251	08ff9297-8d4e-4f9c-aad6-19192f24135f	\N	\N	\N	\N	35	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
c12ebd0c-4347-4718-8f6c-b39031087bfa		0	0	0	5	5		\N						f		f	f	f	f	RESERVED FOR ANALYSIS IN FUTURE SEASONS AT REQUEST OF Fayum Antiquities - Ali Bazeedi (RPE 5/12/03)	2c062a2f-6444-44d2-8aae-02c23991d011	9440b1a5-9961-469a-940c-dd2134926056	\N	2003-02-08	\N	\N	\N	\N	\N	\N	36	\N	Undetermined		f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
5943a683-e1e0-424e-aa1c-a1c67202a29b		0	0	0	5	5		161.114		Tooth attrition: between III & IV\n\nsome carries on 1st molar - some periodontal disease		Brown		f		f	f	f	f	No Textiles	9f92f36a-70b2-4483-aabd-a5af2dbdde6e	2981ac6e-b457-4910-8a1d-5c19ed71628b	d4931160-5828-4e0b-be63-8c4ae473f1a3	2003-02-08	67a0e397-da4c-4eb8-96c8-1e498d2b8956	5fbe7df3-b12a-44d6-bf51-79695f70d333	\N	\N	\N	\N	37	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
78a11093-1e13-4d6a-9368-fa2e98814c94		0	0	0	5	5	1.5	\N					V	f		f	f	f	f	In small chamber to south of shaft adjacent to NW24\n\nCHILD\n\nNo Textiles	9d5dc364-1756-428e-a405-f57760004fbb	c51d9044-5ef1-4756-a5dc-ee5ee690bd3c	\N	2003-02-08	\N	\N	\N	\N	\N	\N	38	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
af4158a5-7e12-4ee4-966a-d834bebeec96		0	0	0	5	5		\N						f		f	f	f	f	RESERVED FOR ANALYSIS IN FUTURE SEASON AT REQUEST OF Fayum Antiquities - Ali Bazeedi (RPE 5/12/03)	26d12484-e6f6-48f9-ae7a-2845b9625ed5	8341bf3c-cfa0-43e9-8af3-635b5be9a3c2	\N	2003-02-09	\N	\N	\N	\N	\N	\N	39	\N	Undetermined		f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
492e0ac1-3a64-41b4-9a32-821b796bdb49		0	0	0	5	5	40	161.578		Large cavity on 2nd molar - left mandible\n\nNo perio		Brown	V	f		f	f	f	f	REVERSAL - HEAD EAST in offset of shaft\n\nNo Textiles	288c280f-e024-4cbd-92e3-79b34bfe2327	a1427ba4-204b-4180-81fb-65059eea467d	476c55e5-be38-4d14-a6b8-995960ef8dd5	2003-02-09	fc5497ed-a817-4b03-86fa-4ad857d06d50	df67a2ea-b850-4f4b-88e0-65350ed95205	\N	\N	\N	\N	40	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
12aabc52-93f3-4c26-8e01-341ed668a574		0	0	0	5	5	12.5	\N					IV	f		f	f	f	f	MISSING SKULL - except part of mandible\n\nTextile: some jute rope wrapped around linen\nyellow & green wool - closest to body - but maybe more - \nsome red anciently & blue - only thread now.	06f38ecb-d1d8-4a25-9367-dc9f9009c9c3	064b46c7-e909-400c-9891-9330bf9309db	\N	2003-02-09	\N	\N	\N	\N	\N	\N	41	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
6a30493d-d535-4345-a135-83dab7205fb6		0	0	0	5	5	8.5	\N		2nd molar beginning to erupt	7 glass beads -\n4 blue\n1 green-black\n1 silver\n1 bone		IV	t		f	f	f	f	Textile: Face bundle - reeds & linen - 1 part braided & tied on head - totally decomposed.	ca230ace-8f41-4ad8-a136-9aa25cd6c024	e3969266-1521-4182-94bc-fe1ef9087002	\N	2003-02-09	\N	\N	\N	\N	\N	\N	42	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
0101f2ee-74a0-46f0-912e-f107d5e19bdd		0	0	0	5	5		\N				Brown	IV	f	Ribs sampled	f	f	t	f	PART OF CLUSTER OF 5 CHILDREN\n\nTextile: fabric on head - some at feet \nin most fabric - medium fine linen w/ no obvious pattern or color\n4 layer on the head\n\nFace bundle - has fiber - 10cm2 after being folded - another piece folded 4 times (1/2, 1/2, 1/2, 1/2) - some fibers in bundle - horizontal jute rope around face w/ 2 vertical around the bundle - 2 layers of fine & 1 or coarse linen.	a98d6f65-1ddb-4b91-af75-30dd6ed6462e	c0df199e-efdf-414e-bbda-1721b7d74c6f	\N	2003-02-09	\N	\N	\N	\N	\N	\N	44	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
a3d9f1cc-6c9d-44b0-966d-e4d99a264c92		0	0	0	5	5	1	\N				Brown	V	f	Ribs sampled	f	f	t	f	PART OF A CLUSTER OF 5 CHILDREN\n\nTextile: fine linen on head - some design - red maybe hairnet - fragile.	643d0d59-81b1-4528-bb1e-534406a72442	8bf705c9-2439-42b6-a072-067ff4afa082	\N	2003-02-09	\N	\N	\N	\N	\N	\N	45	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
ed1f4e40-cde2-4f12-b405-70678a9f078a	West	0.1	1.14	1.16	3.4	2.74		\N						f		f	f	f	f	NO DATASHEET (RPE 5/12/03)	7a68d181-85bc-40d6-843f-1b407b3ff76a	aa575015-68a7-480d-9b81-19d8188fd811	\N	2003-02-09	\N	\N	\N	\N	\N	0.69	1	\N	Undetermined		f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
a3d45155-a4f3-4eee-b97a-99ec22ba78ca	West	0.8	3.5	3.5	3.5	5		160.063		Tooth attrition: between II & III\n\nNo carries, some perio in molar area			IV	f		f	f	f	f	Skin: skin on lower portion\n\nTextiles: textiles under the head\n1) both fine & coarse \n2) 4 medium coarse, covered by 1 fine\n3) ribbon - 4 red-strand ribbons\n4) no color in fabric - long fringe 6cm\n\ndouble twisted hemp to hold reed garland in place\nreed garland tied w/ palm strands - palm strips - all braided in triple strands.	0fa12746-d934-4ae0-aa4c-3a3f3181c811	098eecd9-cc3f-46c7-a5be-5cf334663be6	55033f16-1625-4814-9e19-6165a2e39578	2003-02-08	e473bc6c-474c-46ec-bc7f-4dc6360765d0	21487760-c9c1-4963-a4cc-235e89156962	\N	\N	\N	1.5	10	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
fe3b5fe3-a7b0-4f27-b0a8-3546feae13db		0	0	0	0	0		\N						\N		\N	\N	\N	\N		3781b4d1-c174-4091-8ae3-1981cd935deb	70375083-3ad4-4afb-afea-d66025accb4a	\N	\N	\N	\N	\N	\N	\N	\N	43	\N			\N	f	f	f						\N	\N	f		f				1C.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
2e34a6d5-0b54-4839-b4fc-56cb28381e64	West	0.9	1	1	2.95	3.7	12	\N					III	f		f	f	f	f	Burial adjacent to woven basket\n\nCHILD\n\nSkin intact\n\nTextile: textiles at feet - coarse w/ fringe 6-8cm\nalso a fine linen	2a778220-2d5b-499b-95c7-5d92f0063aef	2b715a38-5229-46f0-ad47-29bbce63c6c4	\N	2003-02-08	\N	\N	\N	\N	\N	0.85	11	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
7d26f8e9-35e5-4223-89ef-31a566af274d	West	0.75	4.15	4.7	1.35	2.8		165.25		Some perio				f		f	f	f	f	MATCHED W/ SKULL #7\n\nSkull and body seperated - we guessed on the bone coloration and general location\n\nNo textile\nNo hair	088839bd-b037-4a6c-b7c3-78b37a6746b9	d70e1b3a-fc7f-4e22-a496-d4da278a2758	\N	2003-02-08	10bfee7b-8896-466c-9063-a2f89fefe7cb	48eb4458-1850-4b7a-b922-9bdb26b682d6	\N	\N	\N	1.5	12	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
320b264e-a42f-4d06-ba22-51dd050f18a4	West	0.6	4	4.65	4.8	6		\N						f		f	f	f	f	RESERVED FOR ANALYSIS IN FUTURE SEASON AT REQUEST OF Fayum Antiquities - Ali Bazeedi	34b57151-e52f-4a64-b455-a645d6a2530a	d5a19b2c-83a1-43a9-a2ad-6da84684d8e2	\N	2003-02-08	\N	\N	\N	\N	\N	1.62	13	\N	Undetermined		f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
a173ba46-b109-406e-82c9-7bcb689913fa	West	1.2	4.22	3.84	2.42	3.06	12.5	\N				Brown	V	f		f	f	f	f	PART OF A CLUSTER OF 4 - (2 young, 2 old)\n\nNo obvious trauma\n\nTextiles: bundle of fragemnts at the head\n\nThough only a trend, bossing suggests a FEMALE	6b2c3d0e-2e9d-4ce6-aec7-9f89aa237721	3e43ff7d-c55e-4667-9b12-39c98d0f2507	\N	2003-02-09	\N	\N	\N	\N	\N	0.78	14	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
f900a32f-a044-43a1-ac74-b903915a1740	West	1.17	4.25	4.25	1.4	2.21	12.5	\N		No carries		Brown		f		f	f	f	f	PART OF CLUSTER OF 4 - (2 young, 2 old)\n\nTextile: some fragment of textiles, coarse & fine	d641c84f-51cd-465b-8dad-c575a8e4a707	a26fe257-0e13-4aea-b348-26ea1716685e	3e6211d5-280d-457b-96e2-c401749702a9	2003-02-09	\N	\N	\N	\N	\N	0.92	15	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
7aa84adf-7c0f-448a-9dfd-73758e91420c	West	1.22	4.27	0.81	1.28	2.78	35	163.768		Upper maxilla - massive perio - 2nd molar only, lowerleft 4 front teeth all else lost, bone reabsorbed - hardly any teeth in the skull\n\nTooth attrition: between III & IV		Brown	IV	f		f	f	f	f	PART OF CLUSTER OF 4 (2 young, 2 old,) - SW14, 15, 16, 17\n\nBottom of a clust of 4\n\nHair: golden brown\n\nInjuries: left humerous broken & healed before death (3 humeri?)\nright humerous = 30cm, left = 31.2cm\n\nTextile: PURPLE & red threaded fine fabric - folded over many times, many layers of coarse minen - fragile, \nSHE was covered by 5 CHILDREN & many limestones placed vertically between burials SW14 & SW15 on one side & SW17 on the other.	2bfcb9cd-ba2a-43c3-9bd9-88af7e1168ca	62df3b10-c3d6-4ff9-86ac-6e0c7d1c623d	f2b8736e-a56f-488e-b7a0-db09b3901d96	2003-02-09	5bcb6e4c-63e4-44dc-b1f0-6014a43a449c	e7e67ccb-ff5b-4a16-a524-7ebc2855d410	\N	\N	\N	1.52	16	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
f088d641-4f69-481f-a10b-f4dae92c858f	West	1.19	4.12	3.84	1.32	2.66	35	157.593		Some perio - 2nd & 3rd molars, mandible rt. - missing, bones reabsorbed - left 1st molar gone		Brown	IV	f		f	f	f	f	PART OF A CLUSTER OF 4 (2 young, 2 old) SW14, 15, 16, 17\n\nAtop SW16 but opposite SW14, 15, seperated by vertically placed limestones\n\nTextile: fabric on head - poor condition some fine, some coarse.	37b42088-2efd-4e11-974d-63015afffde0	5c42a890-2f11-4342-b047-426cdb7946fc	575e3353-4248-4a4f-9e1e-e1623c217e2e	2003-02-09	dba873bc-38d3-424e-937e-6f68f356af22	c4a0e345-0591-46b6-b0a8-0f8b7e6d3115	\N	\N	\N	1.54	17	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
f1fe3d52-bb24-4ec4-a5ff-ed3e09e80ca1	East	1.2	0.65	0.7	1.37	2.9	25	168.538		Tooth attrition: between II & III		Brown	IV	f		f	f	f	f	Buried under rocks\n\nNo trauma\n\nReed along body, both top & bottom\n\nHair: dark brown, short\n\nTextile: orange, blue green\nFace bundle - red ribbon - (4 reds) linen strips under ribbon - \n4 bundles of linen folded - linen twine ties each bundle - only a few remt pieces - fine outer linen - at feet had at least 7 lines of color\nhead to toe (1/2cm seperated) =\ngreen\norange\norange\norange\nblue\nblue \norange\n\ntwo PURPLES about 5cm - shoulder had PURPLE band & maybe hem 3cm wide.	1db5197f-b345-4dc2-8947-6bc9860cc1f9	6742d021-17cb-4370-b4e0-97f4e2a9fea6	976a30d7-80a2-42a5-8e88-07b13e038f56	2003-02-09	020c87e0-ec79-44c8-acd5-20e0752098a7	97dbfc55-66f4-41b9-87e9-6f7dfb569039	\N	\N	\N	1.73	18	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
a2d54847-3ffb-403c-9e7e-2e7efa1ae913	West	2.1	4.76	4.6	3.54	5	18.5	157.84		Tooth attrition: between I & II\n\nExcellent teeth\n\nNo periodontal disease\n\nHumerous & Femur measured w/o heads		Brown	V	f		f	f	f	f	Hair: lots of dark brown hair\n\nTextile: Wrapped w/ linen straps\nlarge red cloth on head - lots of layers -\nextensive pattern development in red & PURPLE bands of head wrap\n\nPurple, red, .. - banded cloth down body - fine cloth w/ red, green, PURPLE - all down the body\n\n1 fine outer layer, & 8 or 9 coarse layers beneath.	0ad94651-f91e-48b5-abbd-cc54340c7b43	be5ebe90-7d1b-4a11-92c0-1b1a7224bc5a	20bef935-3e72-4296-bca0-22c302d94b91	2003-02-13	bd0ead83-eb42-4892-bd5c-4385ef1ea729	79f79240-e7ba-42b8-a5ac-76d5f0985c95	\N	\N	\N	1.46	19	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
f5aeb75a-1c2a-433d-8909-e3af4e383fec	West	0.3	1.6	1.9	0.7	2.1		163.274		Excellent teeth - no carries - no periodontal disease		Brown		f		f	f	f	t	Rear surface of area - under limestone rocks\n\nNewborn infant buried w/ her - infant placed at her knees\n\nBIG WOMAN\n\nHair: curly\nPubic hair: red\n\nTextile: coarse linen (2) outside \nfine linen w/ wool threads woven to give a quilted pattern - red piece of cloth at head - big robe has 8x15cm design w/ 1cm border - fine cord wave in head part of garment\n\nHead cap - w/ multiple angle weave\n\n2 long reeds - length of body (under)	8718f78a-65d4-4969-9ea4-28a91fc251e7	1a02267d-cc3f-49b8-92a7-213579c31284	cfc588ee-407b-409e-ba49-b8fb8f3b23b1	2003-02-03	8f736462-17b3-4565-8ad4-7ddc108dc31f	70efafe0-b613-40bd-af27-fa3b49f17829	\N	\N	\N	1.6	2	\N	Undetermined	Female	t	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
e826dc44-3a37-42e9-aea2-09c7569e7a25	West	1.25	1.68	1.34	1.48	3.04		162.533		Tooth attrition: between II & III\n\nSome periodontal disease\n\n2 3rd molars lost - bone reabsorbed		Brown		f		f	f	f	f	Hair: dark brown, curly, long\n\nHands: Left hand preserved - clenched, good nails - right hand ok\n\nSkin: skin intact on some bones\n\nTextile: red ribbon - 4-strand red\nFoot bundle - foot bundle most intact - not good\nfine exterior linen, 6+ layers of coarse linen beneath\n\nribbon- criss-crossed pattern on outside linen strips under fine, above coarse.\n\nFace bundle - face bundle w/ folded linen pieces\n\nNEXT TO BODY - PURPLE ROBE - BROAD BAND OF PURPLE w/ RED THREAD.	fc9f432b-7c8d-4536-927f-aa590e9ee679	4ab06945-5a11-46ab-b09a-b239b056770d	2290b1be-8720-4481-a79b-cb3ee8ae6b60	2003-02-15	309f6821-3bd6-4c66-8cb7-5e290be80d08	bf91ee5b-303b-4365-a40f-2a1c840e984d	\N	\N	\N	1.68	20	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
e521e95f-8e8e-463b-b78e-637f845dff70	West	1.37	1.49	1.34	2.34	3.04		\N				Brown	IV	f	Teeth\n\nRibs sampled	f	f	t	t	Buried below pelvic and between legs of SW20\n\nSkin: skin intact\n\nTextile: no evidence of textiles - when in situ, red ribbon noted on north side of body.	058d3e9c-d7e2-468f-9cae-d6ae67e80ec0	20db8eb3-8fd3-43c0-b93f-58e8afe8e6c6	76345c5c-7796-4360-9ac9-ef8f480813b5	2003-02-15	\N	\N	\N	\N	\N	0.81	21	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
fe54dcda-eea9-416b-9628-2a6de3c1ad02		1.6	1.9	0	2.3	5	13	\N					VI	f		f	f	f	f	2 CRANIA, NO BODY\n\nsmall cranium	54202752-d3ba-4c94-b464-b6e7f66bd2e4	3d88809a-9de8-47bf-9fcb-dd6e4665da52	f15649c8-275f-4eb4-9b96-df28231602bb	2003-02-15	\N	\N	\N	\N	\N	\N	22	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
fe754099-e639-4119-94ac-c527b952fa37	West	2.5	1.3	1.29	3.96	4.41		98.066					V	f	Ribs sampled	f	f	t	f	MISSING SKULL & FEET\n\nOffset burial for SW19\n\nHumerous & Femur measured w/o heads	c1cf13de-2abb-4e87-9d60-0b9d03c3b8ba	87c3927d-44ee-449d-b0f3-15faa855b6f1	\N	2003-02-15	e6e36b23-c21f-4db1-a7e7-cfef999fc272	7a6b55ad-d84e-4fd3-ab4f-3dd5c1c9813d	\N	\N	\N	0.6	23	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
5cca7466-adf0-4c01-8954-41fefe88c7c8	West	1.52	2.44	2.41	1.83	3.24		157.593		No perio - no carries		Brown		f		f	f	f	f	Hair: dark brown, curly, long\n\nTextile: Foot bundle - foot bundle ONLY surviving textiles\nred ribbon - 4 strand red\nouter layer of fine linen - at least 7 layers of coarse linen beneath, 15cm long fringe on coarse linens, next to skin = PURPLE bands and fine linen.	307fb4eb-a122-4b07-8719-66178c4bb9c7	e9233d5f-4dd2-4796-bec5-4183786ed26a	46bf85fd-02dd-4c11-b796-700b80aa1597	2003-02-15	bdb8aac9-f742-4cb0-a100-a8d29a24e6da	a755e5e4-1b5c-457f-af5e-64bf83654a8c	\N	\N	\N	1.6	24	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
5608535b-051e-4fe3-ab84-f80e18f6b54c		1.9	2.85	2.6	0.75	2.35	U	\N						\N		\N	\N	\N	\N	Head West	5ea8977c-f8b6-4f95-a6a6-d4b504b3286c	f6d821c6-9154-4a87-9abb-6904bb84fc32	\N	\N	\N	\N	\N	\N	\N	\N	24	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	t		f				1C.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
cc8b2221-3a54-42c9-a18f-489c8b88d81a	West	1.47	1.79	1.69	1.61	3.02		158.087		Some carries - no significant periodontal disease\n\nLipping on heads		Brown	V	f		f	f	f	f	Hair: medium light brown, curly\n\nTextile: PURPLE and red threads in head bundle , PURPLE material @ head.	b53cd1db-930c-456c-907e-eab4f7bef155	1c301601-f75a-450d-9a5f-0d39bf9d6f42	af026a38-b04c-405d-bb5e-a4e2d90c7512	2003-02-15	158f07f3-7b56-4cf2-b996-3e0a05e9c360	462ffeaa-0ec0-4b72-b9ef-bd37dc96d86a	\N	\N	\N	1.55	25	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
90086175-e13c-4921-a0cc-4e126df936a0	West	1.72	4.37	4.12	1.4	3.1		183.618		Tooth attrition: between II & III\n\nSome perio			V	f		f	f	f	t	SKELETALIZED ADULT\n\nTextile: little cloth - no red ribbons, linen straps\n10 coarse layers -\nFoot bundle - fringe of 10 cm - weave - 2 over / 2 under.	fe9bb52f-b8e4-4827-8080-40c922fee6b3	486e9d84-8620-4f78-ab19-0437431af062	78230f76-0329-4573-99e1-8440d8c3ec9a	2003-02-17	9b253020-d990-485a-82f6-b9166ba24158	ce4e1aa3-4f83-4d4c-ad17-9234161c86cd	\N	\N	\N	1.75	26	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
0f6f386d-71e7-4ef7-b8a8-a375809ddee5	West	2	2.94	2.97	2.38	3.9		163.434		No perio - No carries		Brown	V	f		f	f	f	f	Hair: brown hair - fine\n\nTextile: some fabric over eyes	af046555-055b-413a-bce9-02da0c06d1e2	6b87cbe7-d816-47e4-9d42-a6019dddfff5	82a3ac92-7e35-4b09-a742-cea5c775d1cb	2003-02-17	882d914b-aaea-4995-8bc3-692bfbf048f3	0e6fd817-9c5b-4618-a98c-d5bad43f943a	\N	\N	\N	1.6	27	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
a0d91e8b-0e9d-4a02-9d7c-0e0e76fe41fc	West	1.52	1.63	1.72	-0.86	0.86	17	161.114		Tooth attrition: between I & II\nLower molar erupted, Upper no.\n\nHunerous & Femur measured w/o heads		Brown		f		f	f	f	t	Pelvic - not defined\n\nTextile: Head bundle - red ribbons - folded & twisted piece\n4 folded packets of linen\n\n1 fine layer outside\n6-10 more coarse inner layers	bfba23c3-a8f5-479e-b945-2412172ca727	395d9c45-a617-41c4-9990-08fdc28bb174	fd039661-36f6-4eed-a273-d99a5a1a6b12	2003-02-17	1080a55a-82aa-479e-9a85-6d75ee412172	4a851e30-6e7e-4080-9b7b-99259d8c0cb3	\N	\N	\N	1.63	28	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
cf5561d2-5b07-45fc-a1d7-a8674bbc3322	West	2.09	3.74	2.79	1.48	2.78		178.05		Some teeth pulled - bone reabsorbed		Brown	V	f		f	f	f	f	Hair: medium to short, curly\n\nNo textiles	f696b452-8730-4e49-ab56-255625d1b4b7	cce0d746-1980-409c-b0e1-6a76ea8d82fa	72f07107-1436-4c97-a267-1451c03744fc	2003-02-17	a3428721-ba7c-4300-bb29-4b7c1d17ad6d	2c79f401-2028-447a-bfd9-5c72f5bd378d	\N	\N	\N	1.73	29	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
957249d7-c3ad-41c4-b00c-6e631d349ff6		0	0	0	5	5		\N						f		f	f	f	f	NO DATA SHEET (RPE 5/12/03)	19839cd0-d721-477d-84ca-4f06e2b19988	a57a4d04-8c92-4bdb-be8d-c5d56aca7bf7	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	Undetermined		f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
298d56cc-136c-465a-9ace-d3db901c326e		2.14	0	0	1.87	5	14	\N				Brown		f		f	f	f	f	Textile: coarse exterior \nFace bundle - folded & twisted\nInterior - w/ red & green threads\nfine - many layers, but cannot be determined	8f7d69db-fe83-4524-83f9-032ab2daf20e	af77c305-68b0-42ac-8cd6-179b80fa641c	\N	2003-02-17	\N	45e59741-fd9a-4702-a4f3-d7df949d826e	\N	\N	\N	\N	30	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
bbaf9b16-b2fa-4cff-a791-73ae2d45974c		2.25	-0.2	0	2	5	11	\N		2nd molar coming		Brown		f		f	f	f	f	SKULL & FEW BONES ONLY	9f07ff0b-9cfe-44f1-ae86-706e78d1cd57	87088867-47de-45bd-ad21-7f5c714ae57d	\N	2003-02-17	\N	\N	\N	\N	\N	\N	31	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
8183570a-49d1-4360-8bea-3c0308be056d		2.03	-0.1	0	2.17	5		\N		1st molars gone - bone reabsorbed\n\nNo 3rds.				f		f	f	f	f	SKULL & FEW BONES\n\nTextile: good Face bundle - folded & twisted\nred ribbons - 4-strands red\npalm reed garland\nsquare ribbon wraps\nfine linen over linen strips - then medium coarse with PURPLE stripes in it.	aa66170f-ceac-4f2a-9775-6cd864eb4ebe	0ade5c6b-8ce4-49ea-a48c-ae4c220dc137	\N	2003-02-17	\N	a96f062b-17be-4a8c-9f2d-388e37eb072d	\N	\N	\N	\N	32	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
82c9fdc0-5d5a-4732-a227-8f8810c3bf20		1.97	-0.15	0	2.73	5	13	\N				Brown		f		f	f	f	f	HEAD & FEW BONES ONLY\n\nHair: light brown, longer than shorter	ddb7589a-a131-4e32-9f7d-2351e88ce623	da34df80-71e3-451e-9034-1f73fdfab45a	\N	2003-02-17	\N	\N	\N	\N	\N	\N	33	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
0875a91e-ed76-4e26-a80d-46dede87803e		0	0	0	5	5		\N						f		f	f	f	f	DISTURBED\n\nbones from at least 2 people	dcd0e23e-789c-44d7-8d5c-ff2d3dffc088	69f9761e-bfaf-4380-a138-fa1058897fcb	\N	2003-02-17	\N	\N	\N	\N	\N	\N	34	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
83c920b5-2a0a-49e8-96a7-4f755eb840b8	East	0	0	0	5	5		165.25					VI	f		f	f	f	f	REVERSAL\n\nFROM PELVIS & FEET - rest of body inaccessable\n\nLarge burial at base of offset chamber in shaft running along south of area.	6cf00c15-f9a0-4ad3-a51a-fdc4e12095a4	1a0731b0-3c23-450c-b4a4-1c145efff8d6	df90b510-cff2-4f71-b950-7446fa3469e6	2003-02-17	0763f2fc-a862-4c20-99e0-4fe7aa2886b6	\N	\N	\N	\N	\N	35	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
2b909c93-f11a-4811-ba46-7c0db49fee9a	West	0.45	1.75	1.57	3.4	4.95		160.31				Brown	III	f		f	f	f	f	Encased in hard mud - rear surface - chest abdly caved in\n\n4 reed sticks under body\n\nHair: brown/red\nPubic hair: dark brown/red\n\nTextile: 4 coarse outer layers of linen\nribbon - 3 light & 4 dark strands\n\n=================  \\\n|  |  |  |  |  |  |  |  |  |  |  |  |  \\\n|=|=|=|  |=|=|=|  |=|=|=|  |=  \\\n|  |  |  |  |  |  |  |  |  |  |  |  |  > dark strands (horz.) \n|=|  |=|=|=|  |=|=|=|  |=|=|=  /  & light strands (vert.)\n|  |  |  |  |  |  |  |  |  |  |  |  |  /\n==================/\n\nFoot bundle - extra cloth turned up over feet criss cross wrap of ribbon over body and all over foot bundle.	d9f9ac16-cc15-4c58-b53d-5abda36d553b	8d65fad6-0f5a-4b7b-9d4d-f6aa5d5bb96e	\N	2003-02-04	b154a0af-5eab-4bdd-86b6-7db6044cf3fa	81f22f0f-a4c0-419c-99e8-38235ff0c65f	\N	\N	\N	1.61	4	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
b62aae86-84a3-4a51-b1cc-c05a81a14baf	West	0.32	2.9	3.37	2.18	3.63		155.617		1st molar on left gone w/ bone reabsorbtion				f		f	f	f	f		19778ea4-120c-4bcb-a83f-ec933aff6a8e	8d5c95ea-00a7-4e3e-a59c-cc8891f02d9a	ccb8eee4-bbfb-46be-af85-659916ceaa58	2003-02-04	a5a03b01-0a1e-4fcd-b6ab-73e4fad6ddc0	e8682242-0f34-4172-898d-0ec050a3337b	\N	\N	\N	1.59	5	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
faf47ea5-a8d4-44d4-b2f0-994a7728d4ad	West	0.31	4.16	4.55	1.24	2.55	17.5	137.339		Femur & Humerous measured w/o heads\n\nLower wisdom teeth not erupted \n\nCusps are lovely - no wear\n3rd molars erupted on top 2nd in mandible			V	f		f	f	f	f	Very close to the surface\n\n1 of 2 BURIED TOGETHER\n\nPART OF SKULL DESTROYED\n\nBones bleached & salt crystals growing from them - bones are white from some chemical reaction - but what? Lime? Salt?	8c0350f0-d39a-4740-984c-4fbd5ad882d7	0e9db0de-4070-434f-9625-7f9d9e901312	c1f14abc-785d-4ef5-b5d5-884e7d3937c6	2003-02-05	1555ddfe-bfac-48fe-a752-ce3f045c9c2d	6cb4382a-6e67-43d9-9ca3-18a0b46a6b52	\N	\N	\N	1.49	6	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
1a82133e-32e6-4abc-9e91-33ca94472f89		0	0	0	5	5		\N						f		f	f	f	f	NO DATA SHEET (RPE 5/12/03)	faa44a77-e2e5-457a-8573-5cd0bacece67	fd7b05b8-f209-4181-8a5a-de3d4162547c	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	Undetermined		f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
76e8762b-66fd-4315-841d-37407999f182	West	0.21	2.27	2.15	1.47	2.6		136.104		No perio - some wear on cusps\n\nTooth attrition - between II & III\n\nFemur & Humerous measured w/o heads	1 bronze & 2 ivory hairpins	Brown		t		f	f	f	f	Hair: curly\n\nHair braided - forward & to one side - her left side\n\nTextile: layer of fine linen over hair net, & 3 layers of coarse linen above that - PURPLE cloth in linen above hair net\n\nFace bundle - not twisted just folded\n\nHair net - red hair net (PURPLE cloth above red hairnet) - across brow & the back of head - red thread in <><><> & bigger diamonds - all in pattern	29371350-4303-4ef1-8958-56d8a786e778	f81760f4-77a3-4694-bcea-bc391e2cac82	04fb6893-f64c-4361-bd6b-4d47715c2292	2003-02-05	31d105d7-eafd-4ce0-90eb-44e90a30db58	350af0a4-2e4a-449b-838c-8072f7ca16ed	\N	\N	\N	1.25	8	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
bf9658ad-5d41-4329-9cbf-54526e623b99	West	0.7	3.1	3.6	-0.3	1		168.074					V	f	Ribs sampled	f	f	t	f	Close to surface - NO SKULL\n\nNo textile\nNo skin\n\nHEADLESS MALE	66dd8177-7175-4021-ac1a-f3170a12c805	319882d9-2ca5-4c84-a4e0-d4a1d74991ef	2553b412-3e21-438a-b1f9-d3279eced0ef	2003-02-08	84b9c3b0-e458-441f-a14f-2a43c17847df	92f55f1d-fc0c-4b6f-9abe-ecc6c1497a76	\N	\N	\N	1.55	9	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
4717458d-e2c0-4360-9b19-91eb45eaa087	East	0.74	3.78	3.74	1.75	1.15	1.5	\N				Brown	III	f		f	f	f	f	Textile: single layer with 2 green stripes (2 thread wide)	a0619b63-6485-43dd-9e46-c38680ac3cb9	8ee6de19-692a-4cd6-b89b-07e39c068072	\N	2005-02-03	\N	\N	\N	\N	\N	0.63	1	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
8f81e4d4-617e-4430-a245-c77626f66554		0	0	0	0	0		\N						\N		\N	\N	\N	\N		1f6b9954-b84c-4ec7-8dc0-4f5bdc062c42	6761e5ea-0af4-4dfa-bab8-2c65a01890b9	\N	\N	\N	\N	\N	\N	\N	\N	27	\N			\N	f	f	f						\N	\N	f		f				1D.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
c92d8414-931f-4d7b-8cdc-95c70ea14d96	West	0.8	3.92	4.66	2.7	4		153.458		advanced periodontal - many teeth missing, only incisors & pre-molar on mandible & incisors on upper jaw		Blonde	V	f		f	f	f	f	Hair: blonde w/ curls\n\nTextile: red ribbon 5 strands wide\n  multiple irregular wraps around head\n  4 outer layers coarse cloth, 6 layers fine weave inside	d1137399-5d5b-4e31-8682-085ba1fbf826	56b387ca-0223-4614-925b-121376e0a1cc	3db60a01-6482-4843-b6ed-26e289ae22a9	2005-02-05	f3a23ed8-ec9f-48fc-9066-d9d364fa9a23	\N	\N	\N	\N	1.52	10	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
67bfc73f-695b-4666-85ba-bca693d1126d	West	0.98	0.96	0.85	3.58	4.37		\N						f		f	f	f	f	CHILD\n\nTextile: medium quality linen shrouding the body\ncoarse linen stripes diagonally over shroud\nPurple & Green design in textiles - nicely wrapped \n\n1) outer layer medium quality weave\n2) 2nd layer also covered w/ diagonal pattern strips\n3) 3 layers fine linen\n4) 5 layers probably folded from 1 piece of cloth - nice green wool band in cloth\n\nHead Bundle: w/ irregularly folded linen cloth inside/ twisted cord linen also. Cloth decorated w/ purple band & rounded	a1c8f6ed-7787-4f86-8e2e-dc99143c6234	f0cc5d9e-1bdd-4e28-8283-8e7a11f275e8	\N	2005-02-05	\N	\N	\N	\N	\N	0.9	11	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
e666fe14-1d29-44d1-a1d8-4b2ad323b0d5	West	0.97	1.03	0.85	2.84	4.48		172.25		No canines - no perio		Brown		f		f	f	f	f	Hair: Dark brown\n\nTextile: Palm material - braided rope about neck twice down to pelvis - under braid on top\n\nred ribbon - 4 threads evenly spaced\ntwisteted linen - 10 in. (25 cm) long\n\n3 layers of fine linen woven in tufting\n\nreeds under body	f20a2fe6-82bd-4603-ae2d-58be00812119	e78cd338-4896-415b-855c-a0bc3722f834	edd2edd5-9a51-4b35-a3b7-7536402ca3a2	2005-02-05	6efd5366-597e-4bfd-afc8-6f4c54884da2	91f60fed-4ae1-46cd-92bf-7ef616518738	\N	\N	\N	1.72	12	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
3c80d9f8-5cfd-48f2-9487-0bc00e4f8ce4	West	0.99	0.39	0.25	3.91	4.46	1.5	\N						f		f	f	f	f	Found on top of (N190/200 E40/50 SE #14)\n\nINFANT\n\nTextile: dense diagonal torn linen stripes\nmuch purple - 1 band (8cm wide) goes from head to toe - part of larger piece of cloth, but folded under at top and folded so that purple band is on top of body\n\nat least 11 layers of linen below multiple layers of folded purple\n\nmore than 11 layers in toto\n\nHead Bundle: Medium quality linen outside w/ knots of strips at neck, chest, & abdomen, wrapped about head but not at face.\n\nBroad bands of purple folded double in form of a cross over face of burial 7 cm wide across, 6 cm wide verticle.	7ab4830c-a36a-4a3c-a81e-fa0abebf8ea3	73fbb3a7-231b-488c-b113-8dd387de3f82	\N	2005-02-05	\N	\N	\N	\N	\N	0.69	13	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
93669230-11ff-47be-9aa7-a41072ee8572	West	0.83	0.28	0.25	2.9	4.54		169.93		some perio on upper molars		Blonde	IV	f		f	f	f	f	ADULT with child buried on top from waist to feet\n\nHair: Very blonde - blonde beard & mustache\n\nSkull: skull left w/ skin and hair in place - no analysis of cranium apart from teeth\n\nTextile: red 4 strand ribbon overwrap\n15 wraps (at least) over head\nLayers:\n1) torn linen strips - 5cm wide folded to 1 cm\n2) 6 layers of fine weave linen\n3) 4 layers of medium\n4) 3 layers of fine	ceb7e060-71c6-4da7-8a19-8cd4ec283247	de70361a-036e-4393-b5b1-2722239d3f01	39746d5e-e1cc-4dc0-8756-ac6b370cb24f	2005-02-16	8417c608-1e60-4a2d-bae1-376b497a3422	4ca125f3-0c35-4a3b-a2ef-0c0abe206ac3	\N	\N	\N	1.77	14	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
38cb1ef4-7f1a-4f6c-a0bc-5f20573d0b25	West	1.14	2.2	2.05	2.97	4.6		166.914		No teeth left on upper - permolars on both L & R on mandible (1 on left)		Blonde		f		f	f	f	f	Mostly skeletalized\n\nBeard: blond	d694cabc-75c1-4767-8487-38d43f1309e3	3b27e924-e2ae-4376-a849-83811a95b423	0740a09c-f79a-42cf-ae4c-0d527e57058c	2005-02-05	34f1ee4f-f115-44d2-9597-2b002211e4f1	269e02b7-bea9-4b1c-8ef5-6638c1dea316	\N	\N	\N	1.63	15	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
4fe87a79-5017-4f8a-9476-f812f09ff4e3	West	1.12	3.85	3.96	2.98	3.79		\N						f		f	f	f	f	INFANT\n\nBasket containing burial 16 was mistakenly reintered before study	b8be779f-0114-46af-b696-dccea7183b76	deea7cb7-8922-4a7f-9c84-53cbd2a74939	\N	2005-02-06	\N	\N	\N	\N	\N	0.92	16	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
9ba5c903-d171-4477-aa44-872043d3d285	West	1.23	4.22	4.48	1.76	3.29		\N		No Perio	2 palm frond necklaces over wrapped w/ palm strings	Blonde	III	t		f	f	f	f	Face crushed & some bones broken (modern) - workers\n\nHARD TO ANALYZE A BODY THAT HAS BEEN TAMPERED WITH BY WORKERS\n\nTextile: 1 medium quality weave linen outer wrap over laid with torn linen strips horizontal over body/ diagonal over feet, many times around neck, mass of linen strips gathered and placed over waist (gathered end and last 1 or 2 meters of strips)\nlinen wrapping strip tied to 18 cm long fringe of linen enclosing head:\n2 pieces 18 cm fringe under outer layer\n2 layers of same below that\n2 layers of same below that\n\n4 layers of cloth, each folded twice over body.	ea5b1a87-c707-4f8b-be21-28fb2f184b3b	28e23b60-1968-4362-8bea-8672913d956f	\N	2005-02-16	\N	\N	\N	\N	\N	1.68	17	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
b8163bea-8bb0-437d-95fe-7dd1492cf927	West	1.5	3.01	3.1	3.02	3.54		\N		No molar in maxilla		Brown		f		f	f	f	f	Found next to #19 - possible sibling to SE19?\n\nHair: light brown (auburn) coiffed\n\nTextile: cloth NOT the same as SE19 - weave is 1x2 not 1x1 as in SE19, not as coarse or heavy as SE19.	6af149cc-a528-4c18-8410-28420bf5d893	a7d06f6a-1eff-4d5e-8102-9df46912b3eb	\N	2005-02-06	\N	\N	\N	\N	\N	0.65	18	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
c721c0d6-17ea-42c7-bd12-f5c2a1480a67	West	1.56	3.26	2.88	3.02	3.54		\N						f		f	f	f	f	CHILD\n\n6mo-1yr. Next to SE18 - possible sibling to S18?\n\nSamples taken to check relationship to SE18.	937267dd-87c7-48fc-ad5c-6eff36461f34	389c00c8-d20e-41ba-8f38-6d446d50d39e	\N	2005-02-06	\N	\N	\N	\N	\N	0.64	19	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
df373b56-3703-40f6-9248-e86988d985bb	West	0.48	1.72	2.04	-0.62	0.36		\N				Brown	III	f		f	f	f	f		3fa462f3-b60d-466f-aad8-9189a0afcab9	22ac4d6f-9927-4491-95fb-e7c7d7e628ef	\N	2005-02-03	\N	\N	\N	\N	\N	1.03	2	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
77aac0c8-b43c-469d-b6a3-3856ef509b37	West	1.41	0.74	0.72	1.58	3.3		173.874				Brown	VI	f	Molar 31,32	f	f	f	t	Textile: torn linen & ribbons evident on a medium coarse linen exterior cloth - only linen rements on feet	cae0d540-0f9d-41cb-a51d-eb24d28fe87d	c1c27452-9bdc-4ad6-b1db-603c11413723	2abf2ef7-dfa2-45b3-942f-b2241dbe876d	2005-02-08	b422b9e9-a5b5-4998-87ac-b1ee90c3ff9b	cda018f1-44dd-4d79-ba65-4cc354e21d20	\N	\N	\N	1.75	20	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
5fb5042d-eaad-4b27-bf64-f9540e8c36c6	East	1.46	0.94	0.94	2.75	2.28		\N				Brown	V	f		f	f	f	f	INFANT\n\nHair: Light brown\n\nTextile: coarse plain linen cloth - totally\n1 large piece of cloth wrapped several times around body	30d36660-3eaa-4011-9563-e67758385ec3	df1af629-dfc0-48f9-b32f-d5a9519f0e5a	\N	2005-02-08	\N	\N	\N	\N	\N	0.64	21	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
1fd6813e-c5ab-4b5b-b307-20611692820e		1.58	2.06	0	1.91	5		\N				Brown	V	f		f	f	f	f	Textile: Yellow bundle - (30 cm2) likely associated w/ this skull, since some yellow cloth attached to forehead.	87b4aad7-7e38-4538-9e11-2114313580f9	ba49263f-d65d-46ed-84ae-c2840f44b4d9	78439018-ab30-40e9-a7ae-3ae956a745a7	2005-02-08	\N	\N	\N	\N	\N	\N	22	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
c8e824d0-59ed-4bc0-957f-138308011fad		1.52	2.36	0	1.85	5		\N				Brown		f		f	f	f	f	SUB-ADULT\n\nHair: Light Brown\n\nBRAIN IN SKULL	29f9cffe-e5d0-48cd-9b19-4e14fc860f21	f8b1f595-904a-4370-951c-06e0248fbb0b	f4b4d813-160c-4783-896b-7a17291b8bf0	2005-02-08	\N	\N	\N	\N	\N	\N	23	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
9b8e7164-5193-4914-9de9-21cdc436a712		1.6	2.42	0	1.82	5		\N		nice teeth - no perio		Brown		f		f	f	f	f	SKULL ONLY\n\nHair: lots of dark brown hair 4-5cm long.	f832b180-0f8c-44ca-b1b1-67d45eba1343	4a268f8f-3e89-4476-a541-ca00a171d391	\N	2005-02-08	\N	\N	\N	\N	\N	\N	24	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
f550373b-245d-421f-9e13-9c99d48a38a5		1.74	2.26	0	1.98	5		\N						f		f	f	f	f	SUB-ADULT\n\nSKULL ONLY	bf693922-713a-4cc9-a0f5-228a66557f2b	dd7bf41b-617b-4e10-afb9-1046b05ff9c0	\N	2005-02-08	\N	\N	\N	\N	\N	\N	25	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
1f48a247-1575-43e0-a4fe-c9ada6e59cb9	East	2.12	3.79	4.17	3.65	2.2		154.382		Extensive periodontal disease - most molars missing		Brown	VI	f		f	f	f	f	REVERSAL\n\nHair: Long curly brown\n\nTextile: Medium coarse linens over feet, torn linen strips for wrapping.	be28fb0d-66c4-41ba-ae2c-6884dd3d32a0	097a9848-c11b-4b4d-ae20-655d1132c8dd	320dc3ce-5cd3-446a-bed6-fcc1ee3de260	2005-02-12	189c5e9c-5ca3-4afa-b9a7-79bed97259f1	9cd8de9f-cf76-4712-86d3-e0fe31a0fa23	\N	\N	\N	1.5	26	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
55054886-0b9d-41e6-84bd-8ee676747715	West	1.78	3.12	2.69	0.84	2.3		171.786					V	f		f	f	f	f	Large Skull\n\nTextile: textile on feet - torn linen strips, knotted on end\nmed coarse outer wrap then more torn linen strips - diagonal wrap - layer of linen w/ 2cm fringe next layer linen w/ 15c, fringe\n  no evidence of face bundle - 7 layers of fine linen over head\nlinen layers up to 12 layers of coarse outer wraps.	51e339dc-84af-40f0-a867-8b8c190c3351	c0854fc8-01aa-46a0-8c71-35009c71ef0d	3eb4f044-c89b-4df0-962b-7de79c9b2148	2005-02-12	f345f87d-4c92-41a7-a64b-fa0d62e7fca2	868cb273-9b84-436e-9f2b-32f46e401e68	\N	\N	\N	1.65	27	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
5e57cbaa-38a3-49b5-bddc-f3f16402dfe7	West	2	2.34	2.19	1.58	2.99		162.78						f		f	f	f	f	Textile: some fabric - torn linen ribbons - 1 made by double folding of torn strip\nMedium coarse linens at least 5 layers	cd879eeb-c09b-4308-a89a-08e837bbdb73	d5279e3a-8965-48c7-a60b-ca833057b87d	56031b76-4e0c-49d1-bb3c-b3c7a3bc447c	2005-02-08	932afdce-884d-4ad6-bade-94e911c8b52f	dd4658a4-e8e8-422d-9007-c1c788d55830	\N	\N	\N	1.41	28	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
5a8cd9ea-75e2-41c3-bace-2964bfb7a90e	West	0.76	3.32	2.95	4.19	5.63		151.912		3rd molar erupted once - but perio has taken many teeth		Brown	V	f		f	f	f	f	Much resisn on body making analysis of pelvis and body difficult\n\nReed stick beneath body\n\nTextile: Red 4 strand ribbon on outside\nouter layer - fine weave linen\nthen 12 layers of coarse linen under outer layer\nface bundle w/ red  ribbons - fibrous mass in face bundle - palm?\nFiber mass also on feet.	d216b656-5cdb-4456-9bf5-b51858fdff6a	1af26b61-9804-4f60-92b7-24d95c05b008	93ea69bb-6ca2-4925-b6e8-0ed20905be54	2005-02-12	c2befbe0-b177-4cec-9213-152b538bb0bd	\N	\N	\N	\N	1.57	29	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
8c3d255c-baa6-4405-a31d-fc6246b55ece	West	0.79	0.65	0.76	2.15	3.8		157.84			blue glass beads\n3-4 reeds asback support for burial\n4 layer coaru weave\n2 twist wpe w/ kast @ end (overhand kast)		IV	t		f	f	f	f	No Head	33115e24-63fe-4d1a-ac29-55f74a203539	f2ac13a0-2634-484d-8efb-252f9925a6bd	230905e3-8f6e-4157-a4ee-8b630a88596b	2005-02-03	81d1f024-290a-4e49-8f4b-f4368cbf5b18	\N	\N	\N	\N	1.82	3	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
4dd58f49-eaaf-4c92-baff-03d320cdc452	West	0.74	2.92	2.83	4.16	5.61		168.955		no perio		Brown		f		f	f	f	f	Textile: extensive remts of textiles at feet w/ footprints (skin) attached to linen layer\n\n4 strand red ribbon\nouter layer - medium coarse\n5 layers of coarse then many layers of fine-intermediate\n\nface bundle - 4 strand red ribbon bundle disintegrated.	0096c38f-0435-4a14-88de-8e6154d7a0ce	291db70d-5007-4676-8c64-a48fdbdaf7db	602178f2-b49c-4d5c-95c0-30a0c045a8ab	2005-02-08	9a8e633b-7ccc-45c3-954f-ac258922f819	be94c03c-ec64-4017-9084-b497dc5ef025	\N	\N	\N	1.68	30	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
66c9a3bc-8184-4fd9-ba37-d03b966a583c	West	1.9	3.65	3.45	-0.14	1.41		170.437		only front teeth remain - extensive perio\nmolars erupted & disappeared		Brown		f		f	f	f	f	ADULT\n\nHair: Bright brown\n\nPelvis: damaged\n\nTextile: coarse linen fragments	040d21db-1cfc-49a8-b5e3-2aa317447fc3	54413f7c-e51b-490b-b20e-56d5f2c30c06	5d60d028-0af3-4b26-a410-1baf61a17c14	2005-02-08	36be0d93-750c-4813-a8ef-e78d0ceb3e56	e128f6dd-ae11-4d18-a66e-2199adf22d1c	\N	\N	\N	1.7	31	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
2834d56c-2d0c-4f3a-b061-38cbd957ef08	West	0.92	4.32	4.14	-0.48	0.35		\N				Brown	II	f		f	f	f	f	SUB-ADULT\n\nTextile: 1m wide cloth outer wrap has a purple band 3-4cm wide - wrapped diagonally around the body\nnext cloth 120cm wide over laid w/ torn linen strips - long fringe (18cm long) gathered & folded over feet & tied in a knot @ the end of the 3rd piece has some fringe (18cm long) but wrapped w/ fringe going up te body\n4th piece of linen = fine w/ open weaqve band (3.5cm wide) then linen & another open weae before end of cloth\n5th piece is ribbed weave w/ little silverfish still crawling around the cloth\n\nFace bundle: bundle is held to skull w/ 4-strand red ribbons - multiple wraps - fine outer wrap - 3 coarse under face bundle - multiple packs of folded linen each bound w/ twine - NO TWISTED LINEN	6557aac2-9a56-49e4-8f78-546d0fcdf60b	3f304e90-09ee-470d-aee5-0a49cb330b2c	\N	2005-02-16	\N	\N	\N	\N	\N	1.11	32	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
8c70b37d-297e-4fe8-b2d5-73adefb9facb	West	1.28	2.9	2.79	4.16	5.78		159.322		canines on 2nd molars-outside		Brown	V	f		f	f	f	f	Found w/ SE34 - child\n\nTextile: ribbon - no color - diagonal wrap preserved @ feet\nvery fine linen next to body (5cm fringe) - 2 layers coarse next, then medium weave w/ torn linen strips from wrap this layer (medium weave) has 8cm fringe	db826330-5838-453b-ba2c-66cc0200a347	e6da1f34-29aa-40bf-a9d4-7f9737068ab9	9acbfc4d-d9b6-4e68-9e13-6bf4ee573ed5	2005-02-12	f21e8778-c061-4b1a-9a9f-dd6c6fc784cf	\N	\N	\N	\N	1.72	33	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
53aa1146-cdf9-492c-823b-2606f191c085	West	1.3	3.02	2.93	5	5.5		\N		Part of right mandible-incisors NOT erupted - pitting on mandible (porosity of bone)		Brown	VI	f		f	f	f	f	INFANT - buried w/ adult SE33\n\nHair: medium to bright brown hair\n\nPreservation Index: between V & VI\n\nSkull: pieces of skull oddly shaped\n\nTextile: medium fine weave linen - 1 piece of cloth folded over & over - no markings or color\n2nd textile -	52b34b8c-7b34-40ff-8506-328c36a3f5a9	7000f740-846a-4797-bc3a-d921b6477273	\N	2005-02-12	\N	\N	\N	\N	\N	0.5	34	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
cb80973d-3674-4ad2-bd58-149731b24b7f	West	0.74	1.7	1.81	0.16	0.81		\N		1st molar not erupted		Brown	IV	f		f	f	f	f	INFANT\n\nTextile: 3 layers medium weave linen & one fine layer & 3 additional layers, perhaps once colored..\n(internal fringed on fine layer - OPEN WEAVE of 1cm width)	46e58295-9135-43a5-94ff-f8d89ab7d668	b00e3bb0-6254-40b3-b7c5-7330b8e7847c	\N	2005-02-14	\N	\N	\N	\N	\N	0.56	35	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
1b2a0ae6-e8b1-4799-8e1f-9602c9475e62	West	0.5	4.69	5	0	1.26		\N				Brown		f		f	f	f	f	Hair: long auburn\n\nTextile: Hiarnet covers eyes & nose\n\nunder outer layer - reeds going length of body - under - for support LOTS of rope in under layers also\n10-12 wraps - insect infestation - living sliverfish - also purple-blue irridescent sheels of insects\n\nFace bundle - overlaid w/ 2 strand twisted rope, 1 strand goes down center of body - lots of excess rope about the feet - face bundle consists of 2 bundles of palm fiber	f9a76657-1a61-46c8-946c-db1fb9977687	1833ac62-23ff-478a-9d1c-046234f0ec39	\N	2005-02-16	\N	\N	\N	\N	\N	1.32	36	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
28d3331f-5a1d-4274-9c0f-35507a45125e	West	0.59	5.02	5.31	-0.03	1.55		155.123		No mandible - no canines		Brown	IV	f		f	f	f	f	Preservation Index: between III & IV\n\nHair: light brown very long curly\n\nTextile: twisted palm material rope over coarse outer layer - 20 palm stems as supports under body 1 fragment of textile with colored pattern\nfine linen next to the skin - undefined mass of folded linen over face - nice hair net over light brown hair - foot bundle w/ lots of rope wrapping\n\nUNIQUE - coarse outer wrap - lots of rope underneath (double strand weave rope) palm sticks under feet - a bundle of them solled up in linen over the feet - stick bundle tied with twine linen over sticks very loose weave - not even gunny sack quality (60x67cm)	9fdf9847-b3bf-4e14-8fbb-a2954e8ac92c	77406f36-b3b9-41e9-9fc6-c5e74d060401	510f5f3a-134d-453f-a9be-0d8117a03ca0	2005-02-14	b6f30ba2-eb4e-4be5-b05e-5cfc664b8ad4	0e852679-6ab2-471c-8ac3-540662dd2825	\N	\N	\N	1.62	37	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
fc85ce75-5026-46f5-a864-5261a64f989e	West	0.85	2.77	2.63	3.02	3.58		\N					V	f		f	f	f	f	Textile: evidence of diagonal ribbons some fine weave linen remaining ~ 4 layers\n\nlinen with pattern @ fringe	bd032b4d-a982-43c5-a4c6-7db7e21c6436	81f15491-196a-48c1-abdc-f2a66e67f95f	\N	2005-02-03	\N	\N	\N	\N	\N	0.55	4	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
0e852390-379e-4215-b5ef-72db722970f0	West	0.95	3.38	3.14	1.65	2.6		\N					IV	f		f	f	f	f	some skin intact on lateral of skull\n\nTextile: diagonal wrap (ribbon)\n2 double red thread ribbons\n1 ribbon running head to toe in top of body\nfine linen layer under ribbons\nthen coarse layer\nthe coarse white ribbon both diagonal & 1 down length of body\n2 layers coarse linen\nthen 6 layers coarse linen folded up & over feet - best perserved there.\n\nHead: no canines, tongue intact\nfront lower incisor (right) not erupted\n\nBody: toes curled from rigor mortis	a4976fef-4930-40e5-9754-f398d86a043b	f729ff39-b9f7-43b4-a4f3-604c7fe213da	\N	2005-02-03	\N	\N	\N	\N	\N	1.01	5	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
429bf8cc-8686-4a6a-bcfa-1792d6885a49	West	0.6	3.74	3.84	3.63	5.2		165.754		Extensive periodontal upper & lower	reed sticks for support for the burial		V	t		f	f	f	f	Textiles: coarse linen only - most missing\n\nFace : beard - reddish brown	2b720f0f-8187-408a-827d-f62db906002c	9d00b3b4-24c0-4d83-9275-c9f09a48f202	8db293aa-6e0a-42f1-aaea-08109c3a7584	2005-02-03	63517509-ef24-49a0-924a-ad5588520cf6	\N	\N	\N	\N	1.6	6	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
662e9451-ea7c-4601-add5-7fe9b083f150	West	0.68	2.6	3.21	-0.67	0.96		165.744				Red	III	f		f	f	f	f	Head found seperately on 16 Feb 2005\n\nFace bundle: huge face bundle - \n\nTextile: 2 layers coarse linen	c13e4a6f-5d81-4e9a-883e-4dd1d0c3001e	3ab4416f-e511-4409-87e6-8039fee941f9	daf6bd41-40c3-43dc-8900-df6a58c04184	2005-02-03	4baae076-18fb-4cdb-a910-69b03ff32582	b3f65777-84a7-4e41-918f-e0638ed1a728	\N	\N	\N	1.66	7	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
62636b54-3de3-4491-8e36-0dc3e2547211	West	0.73	3.09	2.94	1.08	2.1		128.2			iron necklaces - hook shape\n  2 pieces - hook together - back\n  missing	Red	IV	t		f	f	f	f	Hair:Long Blonde/Red\nkept in nice hair net cap\n\nTextile: 3&2 braid twisted rope w/ end 'splice' & interior 'splice' - nicely done to keep from fraying\n\nSupport: up to 20 reed supports running length under body	57726f3b-8b22-4c1a-a85b-e401b7abe7ae	e6f1fa43-f72f-41c5-b40c-315c06e731e7	\N	2005-02-03	c8605463-af73-4da0-bdcc-d1a631cad044	\N	\N	\N	\N	1.15	8	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
3de01baa-3a81-47e8-ac8b-7510ffbab574	West	1.02	3.2	2.81	1.21	1.93		\N				Brown	IV	f		f	f	f	f	Hair: long auburn - not curly\n\nTextile: double red thread on ribbon - bordered as in (N 190/200 E 40/50 SE #5)\n\nlinen w/ red ribbon diagonal wrap feet wrapped w/linen & folded over long (6cm) fringe\nMedium quality weave at least 5 layers	1fab793f-ad85-43b6-9d82-af3f94a965b5	ed5f3541-75e2-488a-8d77-683600389cfd	\N	2005-02-03	\N	\N	\N	\N	\N	1.01	9	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
52374906-4df0-40ac-99f6-533f5f6143cc	West	0.42	2.66	2.64	2.62	4.24		162.039		no canines - no perio		Brown	II	f		f	f	f	f	Textile: (going in) 1st layer - medium qualtiy outer layer\n2nd layer - color ribbon over next coarse (3 layers) then palm stems for support of body - all around body\n3 layers of coarse linen\n2 layers of medium quality linen\nfive rows of green/red pattern on outer layer folded up over feet\n\nBIG TOES TIED W/ LINEN TWINE - W/ SLIP KNOT	cc629d70-8948-47af-b31c-f87452848609	9fd9948a-5fea-4937-a634-da9b11293bb4	dca8c1ef-d9c2-46ec-95e7-afc13becc385	2005-02-16	08032832-f0c1-4661-9154-8b5d3da99d72	adba6381-8e03-4227-8caa-fab56f77d542	\N	\N	\N	1.7	1	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
c5d4202a-d6eb-4d26-a640-7039eac5bb17	West	0.73	2.83	2.78	2.17	2.65		\N					V	f		f	f	f	f	INFANT\n\nTextile: 5 layers medium weave linen - all same - deteriorated - torn linen strips are overwrap	b7724015-3799-4506-8f22-9edeb983bc2a	8482956b-78d0-46b4-a1a2-5e94852d3e26	\N	2005-02-09	\N	\N	\N	\N	\N	0.68	11	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
b723e0ca-bcad-4db4-b269-5640efca22da	West	0.86	3.09	3.08	2.01	2.57		\N		1st molars not erupted only incisors		Brown	IV	f		f	f	f	f	Buried next to SW#11 - younger than SW#11\n\nTextile: Face bundle - medium quality linen w/ torn linen strips for over wrap - red, yellow, green thread in one of the linen strips - (red-green, red-green, yellow) - some have PURPLE, red, blue thread -\n\nlinen layer, strips, linen layer - folded ot wadded & piece of linen, 4 layers of fine linen.	b8e689ea-1e33-46fc-af94-7eb5baab73ca	43330083-c56a-448b-8552-be183fff03e2	\N	2005-02-09	\N	\N	\N	\N	\N	0.7	12	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
fe72cbdd-f428-458f-bf43-3e291f5dc774	West	1.03	2.43	2.5	-0.56	0.7		176.118					IV	f		f	f	f	f	HEADLESS - no skull\n\n5 total reed sticks over and under to provide support\n\nTextile: all red ribbon & striped ribbon over foot bundle\ntorn linen strips & red ribbon over next layer - 2 layers, folded then red ribbon over folded linen (2 layers) then torn linen strips tied over next layer of material (folded) much SALT extruding from feet - some kind of bug ate a tunnel into the foot bundle.	6ee8cdf1-2994-432e-aa4f-1e11414e062b	0850e5b6-b2d3-4994-9471-5f0f536904f8	a4e6d1f6-8d79-4472-bcf5-e1a276257438	2005-02-14	e0ddcd85-0bcc-4050-9ffb-572556d8bf5a	\N	\N	\N	\N	1.63	14	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
3ae88bd5-64cf-4e94-a6bd-55ac758c5c48	West	0.97	2.12	2.37	-0.47	0.67		160.804				Brown	V	f		f	f	f	f	SKULL MISSING\n\nPreservaton Index: between IV & V\n\nHair: Brown pubic hair\n\n2 Reed sticks under body\n\nTextile: tufted linen wrap - medium quality\ndiagonal wrap red ribbon 3 strand - irregular quality\nthen 5 layers coarse linen\nnext layer - torn linen strips wrap diagonal criss-cross in large design - linen folded up over feet  w/ fringe of 10cm  - wrapped around body twice 110cm wide piece\n2 more pieces of linen underneath folded in similar fashion \nnext layer  - fine linen has band composed of 2 red-orange lines & central green band inbetween 2 red ones\n\nCord wrapped around feet beneath 1st fine layer\n\nouter layer =  {  }  \\\n  {  }  \\ wrap fold over feet\n  {____}  /\n  ||||||||||||||  /\n\nnext 2 layers = {  }  {  }  \\\n  {  }  {|||||||||||||||||||}  \\ fold fringe up to give\n  {_____ }  {______ }  / solid edge THEN\n  |||||||||||||||||||  / wrap around the body	5fd31098-daaa-4e7c-96c6-bf74fc76331c	e03c0725-a361-428f-8828-7ce9d22fb115	4829543d-98a5-465d-9ba6-14bd0841115a	2005-02-12	c0abe396-3e2f-49c1-90af-87701d1085cc	292a6e9f-495a-46fc-b546-2b63bdb4bb7e	\N	\N	\N	1.46	15	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
30c2cf04-b998-4955-8ff1-fc7fe5d7d100	West	0.52	0.5	0.4	4.73	5.4		\N				Brown	VI	f		f	f	f	f	INFANT\n\nHair: Brown approx 6cm long\n\nNOT MUCH TO SAY\n\nNo remaing skull part with identification properties\n\nTextile: fabric poorly preserved - medium quality linen	1607ba07-b1c6-4942-9fc9-78828093b565	380d632a-8d90-4212-9933-e746a4f8a095	\N	2005-02-13	\N	\N	\N	\N	\N	0.69	16	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
23895fa3-0ce9-46e9-aae8-6001d702c954	West	0.57	4.5	4.4	0.14	1.61		\N		right lower 2nd molar gone anciently		Brown	V	f		f	f	f	f	3 femurs w/ buried, 1 1 cut through anciently - epiphyseal cap broken off	104143bf-21af-4bc9-9db9-2ef594e8bef7	a534fe6c-19d1-4aa7-9f17-697f1374e42b	7491eaa1-51eb-4db8-9016-bf59fc99a3e0	2005-02-13	\N	bedc353e-13dc-4ea2-b972-224daae4b56b	\N	\N	\N	0.57	17	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
9d4ba1ee-1191-48e3-8dc2-7d4080850e43	West	0.82	3.31	3.22	1.88	3.03		\N		not pre-molar eruption\n3rd molar in bone but no space for eruption in maxilla - - there is room in the mandible		Brown	II	f		f	f	f	f	ADULT - well wrapped\n\nSupraorbital ridges: porosity in orbits\n\nTextile: lots of ribbon wrapping\nfrom inside : 4 layers coarse - torn linen strips w/ random knots \n4 layers coarse - diagonal torn linen strips\nfine layer & red ribbon on surface \n\ngoing to body: 4 pieces of linen each wrapped around body numerous times:\nouter layer w/ 3cm fringe, piece 117cm wide\nnext layer has 10cm fringe\n3rd layer has 16cm fringe\n4th layer has shorter fringe of 3cm\n\nFace bundle - multiple red ribbon wraps\n3 packets of triple-fold linen (fold in half then lengthwise in thirds) NO TWISTED LINEN - packets tied w/ twine - red ribbon = 4-strand red ribbon knotted @ foot , to use as beginning of diagonal wrap - one ribbon going down top of body FULL - length\n\nribbon down middle around feet & then back up in diagonal wrap\n1 layer - medium qualtiy outer wrap 2 red threads open weave, 2 red threads pattern often seen  | |\n  | |\n5 piece of linen - multiple folds for each linen strips torn -	d15fa54a-bf63-4b37-9a54-07d5aee93e62	3552d383-00c6-44e1-8a67-1b719a6e1b02	070b9c0e-e9f7-4087-a2b1-1b3b5873f21c	2005-02-15	\N	\N	\N	\N	\N	1.26	18	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
bf35a421-38b2-4822-86c9-207fc8d0ab00	West	0.71	0.52	0.2	4.54	5.57		\N						f		f	f	f	f	Palm fiber on face - to give definintion?\n\nTextile: coarse outer linen wrap w/ 10cm long fringe\n2 layers torn linen strips wrapped over outerlayer - diagonal wrap	8f3655ee-02de-4ad9-8994-f1154d1dd1e6	bb03ebd3-990c-406c-9272-7d3bf03656a6	\N	2005-02-13	\N	\N	\N	\N	\N	1.13	19	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
d82e5d5e-68b1-4083-9126-9470128d28a6	West	1.26	2.71	2.63	3.95	5.27		\N				Brown	III	f		f	f	f	f	CHILD\n\nTextile: coarse outer layer\nlinen strips (torn) folded in half and wrapped diagonally over outerlayer - multiple layers below\n2 knots @ feet - at least 5 layers	554d4d5b-7237-47bf-8bad-2b91b4eae150	775f8f37-aac7-424d-a993-6d9b42dbdcc2	\N	2005-02-13	\N	\N	\N	\N	\N	1.2	20	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
617f1756-9b5e-4040-9b6a-2cca39512961	West	1.22	2.62	2.59	3.73	5.2		\N		some perio - 1st molar on left - carries on medial of upperr 1st molar		Brown	III	f		f	f	f	f	Buried beneath SW20 - both partially covered w/ limestone slabs\n\nTextile: linen wrap has 2cm fringe then 2 red threads woven into cloth, then open weave & 2 red threads again - linen 67cm wide - then linen w/ linen strips (torn) over inner layers\n\nred ribbon, 4-strand, over the face \n1 fine layer outeside \n2 layers of coarse weave inside\nbeautiful ribbon wrapping over lower body\nribbon down body, around front, & then up body in diagonal - -\n4 major pieces of linen folded twice over body & then folded over feet to back.	b440dfa6-d561-4e83-ae44-403ff6e85582	004b59ee-3a91-4cec-acdc-7f7053b36ed1	62387b68-864e-496c-a413-26c2eaf0902b	2005-02-13	\N	\N	\N	\N	\N	1.45	21	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
486f9a33-7bd7-4047-be16-5faba244a06d	West	0.77	3.21	3.26	-0.83	0.36		\N		no adult teeth		Brown	V	f		f	f	f	f	Hair: almost 4cm long\n\nSkull: skull fragmented\n\nTextile: 4 layers - coarse fabric (fringe 10cm long)\n4-strand red ribbon = over all good quality\nfine linen next to skin - 3 layers no decorations\n\nSkin: skin & tendons still extant on ankles	c8f08bcf-8da7-44ea-ab25-a01039010843	92589f36-9250-460e-a8fd-131cdde661c4	\N	2005-02-13	\N	\N	\N	\N	\N	1.21	23	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
0766d877-a633-47c5-9c0c-c72bc8a57f0e	West	0.7	0.42	0.15	2.95	4.08		164.015				Red	III	f		f	f	f	f	Hair: nice RED hair\n\nSkin: very waxy skin on cranium & feet\n\nTextile: some palm stems supporting body\nfine linen outer wrap\nmultiple coarse weave layers underneath\ndesign layer\n10 layers of coarse linen underneath design layer\nsome decors - photographed - 2 kinds of colored ribbon = red & perhaps purple\n\nDesign layers: 3 flower plant - like lotus - over forehead\nfragile hairnet - photographed - went over the eyes down to mouth.	b4fb7476-7fdc-47ed-956e-7db16ac887e1	64b71295-23c9-4c7a-b8dd-471775419b86	99f775b3-3a44-4144-88f0-e68d725dfc14	2005-02-15	d088e90c-8724-4009-affe-4ee8cc67b67a	5cb256cd-f06e-41ec-ba33-d4e2407e25c6	\N	\N	\N	1.7	24	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
f36e661d-427e-46b8-91c0-c51656f30ce7	West	0.75	1.48	1.83	0.62	2.29		\N		no perio - only a couple of carries	buried with rings, leather strap etc..	Brown		t		f	f	f	f	Hair: long brown hair\n\nTextile: hairnet in poor condition - group of hairnets bunched up = blue, gold, w/ red threads woven into them - from where? head, feet?\n\nMany layers of line linen close to body - badly DECOMPOSED cannont count\n3 layers fine linen outside - then folded irregularly fine linen, good hem - green, red, green lines woven into cloth - narrow, wide narrow, etc...	6b147386-4a6a-4200-ba9d-44f0dc0c28d7	50a992fc-c517-4a82-8cd4-80a5834aea95	\N	2005-02-15	\N	\N	\N	\N	\N	1.59	25	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
c5e8d6e4-ce35-483f-9fe7-8c2824eee368	West	2.45	3	2.87	3.84	5.52		163.202		perio - rampant		Brown	VI	f		f	f	f	f	Preservation Index: between V & VI\n\nTextile: torn linen strips over outer medium coarse linen - 8 layers poorly preserved	362a8e8b-926a-45e6-b851-3d8b8ba7b8d3	e13e5539-167c-4c34-8887-a4058fc6a629	cf1bf078-7896-4188-8774-da6c0e277305	2005-02-14	09488e72-5034-4803-8cf5-a035f7ede725	8f3dcefc-399a-47f1-b46b-b1994dc90700	\N	\N	\N	1.76	27	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
2c672331-9224-4863-970e-a4e874062706	West	1.1	1.4	1.64	0.7	2.3		166.45		no perio, no carries		Brown	III	f		f	f	f	f	Hair: brown slightly curly hair - beard a lot\n\nTextile: 1st layer medium quality linen - torn strips NOT diagonal\nthen 5 layers of medium coarse weave torn ribbon strips of linen\n4 more layers of medium coarse linen\n4-strand red ribbon diagonal wrap over feet bundle\n10cm long fringe on linen folded over feet \nlayer closest to body = differing weave w/ 20cm long fringe (folded 5 times around feet)	fa8e7789-cafc-4b60-bd1a-0f82cad2417f	7a2da8b2-4f7f-464b-bd72-2addc35b937b	92c52bc9-1379-442b-bd8b-0c6a4f8e8eb5	2005-02-14	b016012a-44f0-4685-be31-4a2dd834b236	8aff935a-47f0-404e-9a9e-30484352f684	\N	\N	\N	1.69	28	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
f1974c33-fe69-48aa-9a94-4982bbdb047d	East	1.5	1.48	1.66	5.78	4.43		150.43				Blonde	VI	f		f	f	f	f	REVERSAL - skeletalized\n\nPreservation Index: between V & VI\n\nHair: 4-5cm long\n\nTextile: medium quality fabric, perhaps 5 layers once.	fc59364b-7a39-4aaf-a1ef-fe13e8f16499	ccbbe5f8-762e-43a1-8fef-e64fc6d58de9	12beead8-3497-4052-bff8-b431a332935d	2005-02-14	3ae42523-ea42-4b1f-8b4c-fb7118e9f980	7aa245ec-d518-41e6-8414-277dc1de5e0e	\N	\N	\N	1.57	29	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
176c0e9b-e648-4621-a066-af764e2b9bbd	West	0.38	3.03	3.1	1.1	2.35		\N			Bronze (GOLD)  bracelet (left arm)			t		f	f	f	f	Bundle of reeds (6 or more) under body\n\nTextile: 3 strand red ribbon over face - rope criss-cross over face then twine & coarse outer layer - blue decorative pattern woven into next linen layer - rounded w/ crossing linen bands through rounded - then another design - outer wrap then rop diagonal (criss-cross) tie over next layer\n\n-------------------- red  \\\n ||||||||||||||||||||||||  blue  > 2 red threads like a border along design\n-------------------- red  /\n\nFace bundle: bound w/ twine rope - knot on top - coarse linen weave w/ red & blue wool thread pattern in it.	fbdf124e-6fe4-4f7d-97df-ffd97d3a45a0	d03153a8-7b6e-4df2-9c76-1334a469211a	\N	2005-02-03	\N	\N	\N	\N	\N	1.25	3	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
f99998c0-d980-42e7-af36-2b9006330ffd	West	2.4	0.98	0.77	4.01	5.74		172.714		Tooth attrition: between III & IV\n\ngreat mouth - no perio - good teeth but worn		Brown	V	f		f	f	f	f	Hair: brown & curly\n\nTextile: coarse linen wrap @ feet 4 or more layers - 2 fine layers beneath	0cb09b06-8b4b-46c1-bff0-c9b6684a0968	8d86e8d7-fe24-45d5-b911-c5e8ef9368a0	\N	2005-02-15	4779a470-8a0b-4a7b-b926-9277e36e1386	18326910-78cf-40da-bd4a-2156fb6fc987	\N	\N	\N	1.89	30	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
8e295c36-94a9-4356-839d-1c07366a65f8	West	1.38	2.55	2.97	1.22	2.88		173.874		Tooth attririon: between III & IV\n\nmuch perio - no carries			V	f		f	f	f	f	Textile: partial fabric on feet - 10 layers inside medium quality\n4 layers medium quality outside\ntorn linen strips wrapping - 2cm wide	80ee2e0d-41f2-4ad9-accf-052161a16bea	c771661d-5def-4c78-ae0b-4e7e5bf75e03	b1e2560c-9a13-4e85-9a04-e41b83e8fb25	2005-02-15	daf04cf9-645b-4800-b84e-9d4d5c52452f	eca452c9-387e-4e07-87dc-42c49bb29989	\N	\N	\N	1.79	31	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
2bac0a43-0d42-4698-be9b-325f0a6ef3ef	West	1.11	1.59	1.5	0.57	2.25		167.842		maloclusion - some perio		Brown		f		f	f	f	f	Textile: 4-strand red ribbon wrap - diagonal wrap\noutside wrap = medium quality weave \ntorn linen strips - 2cm wide over coarse inner layer - diagonal 5 layers of coarse \nthen another torn linen strips horizontal arounf body - 3 more layers coarse then linen strips horizontal wrap\n 4 layers coarse\n\nface bundle - structured - multiple bundles of folded linen (6 of them) "no twisted" linen - red thread near top of face bundle.	0f1cba9a-5436-4591-8ae7-35c1bc98e12f	01b8df28-635c-421a-b235-aaf40f61d517	06f0a086-9116-4276-8454-6836104f3870	2005-02-15	370852e9-6f67-4bb7-8a12-80f69f63e9be	ff7534cb-9793-41e7-8e83-dce2aa6205bb	\N	\N	\N	1.71	32	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
17e7d441-e2d6-49dc-a16d-8fe7f702c381	West	1.06	1.15	1.21	0.63	2.12		157.346		no carries - some perio esp. upper left maxilla		Brown	III	f		f	f	f	f	One of a trio - this one buried on top of SW34\n\nPresevation Index: between II & III\n\nHair: long brown hair curled\n\nTextile: lots of textiles on burial\ntorn line strips in diagonal wrap, medium quality outer wrap\nrough linen strips -\nthen medium quality linen w/ nice red thread (folded so that red thread directly over feet - red thread also centered over middle of body)\n\n4 pieces of linen wrapped over & over again - \n1st = foot structure made large by folding linen over feet\n2nd = then coarse plain linen\n3rd = another " " " " \n4th = another " " " "\n\nFace bundle -	a9e3e8a4-1748-44f1-a7d2-54570dc318f3	ccdce897-6fbf-4ce7-9dd8-53591affbc43	2bcd9520-cb2c-48de-845d-4694e997edad	2005-02-15	51d4f64c-8835-476e-9def-3e37381273f3	1b6daea5-9adc-4240-9f02-fcf29404e9bf	\N	\N	\N	1.6	33	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
fcf4942e-109e-4c28-9c8b-e2e7bc812bb3	West	1.26	0.97	0.89	0.67	2.03		\N				Brown	IV	f		f	f	f	f	Part of trio - buried underneath SW33\n\nHair: long brown hair\n\nTextile: 14 layers coarse linen - torn strips over wrapping 3cm wide\n3 layers of fine linen inside	df89d114-e4ff-4f6c-a485-36b585dd29c5	6ccedd0a-2a00-4795-8d8f-7338e11fce47	2114cecd-4850-4461-bad9-6a95f2b41963	2005-02-15	\N	\N	\N	\N	\N	1.45	34	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
27a0890e-3302-4ccf-9e92-f150229008e7	West	2.27	1.46	1.36	1.37	3.1		164.594		no carries - some perio\n\nlower 2nd molar extruded because opposite upper molar was gone		Brown	V	f		f	f	f	f	Offset chamber - POOR PRESERVED\n\nHair: dark brown\n\nTextile: fragments of medium quality linen\n\nInjuries - left arm broken then healed , skull has some trauma on left side	fa28461a-6194-414d-940a-052c1a9b3eff	576aa561-88f4-44fe-ad3d-98bdc8d5bec1	9c7dc8fc-6d24-41f2-bbab-b41efb0433a2	2005-02-15	0c97c6ac-5c34-40f3-834a-7ebd316823d7	051ce160-e214-49cd-b160-6f98387bd307	\N	\N	\N	1.78	36	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
fd99bc08-9e0e-4d4d-bd96-4e4fc5f7c40e	West	1.27	4.43	3.92	-0.06	1.29		217.07		Tooth attrition: between IV & V\n\nextinsive carries - loss of bone in molar region - 2nd on LR mandible nearly gone from decay		Brown	V	f		f	f	f	f	Hair: drak brown hair - VERY TIGHTLY curled\n\nBIG EYE SOCKETS - VERY WIDE BONE BETWEEN EYES\n\nTextile: coarse fragments of textiles - \n2 coarse outer layers\n2 fine inner layers\ntorn linen strip wraps 2cm wide.	f765e30d-b103-43c3-9d52-a74180ab7ae3	3f361239-cbed-4313-958a-e2570267647b	85c5ef23-fbd9-452e-9488-5b6f4415c049	2005-02-15	76d84eb9-b93d-4059-aa36-e86431952205	577663ae-5073-4b35-abf9-23ac16357acc	\N	\N	\N	1.52	37	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
0846c7fe-64bb-49d1-8afb-a9f0c7769435	West	1.17	4.48	4.32	4.01	5.5		155.864		perio took almost all teeth from mandible - only front teeth in mandible		Blonde	V	f		f	f	f	f	Hair: blond/brown\n\nTextile: coarse outer layer of linen, overlaid w/ torn linen strips 2cm wide\n5 layers total - all the same to the skin\nnon-structured material in foot bundle w/ 2cm fringe.	8b9fc3bc-0b3f-401a-bfd3-241c0b088331	17031d89-3def-4350-a8a8-9b5b4fb02315	44ccb2f3-097a-4ec8-9780-0dec0f416508	2005-02-15	08818a08-4c9c-46fa-a9b5-0eae44a97d28	\N	\N	\N	\N	1.51	38	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
879b6442-12e8-48b4-84be-4d03d6242be7	West	0.65	1.12	1.33	4.5	5.13		\N		all pre-molars (maxilla & mandible)		Blonde		f		f	f	f	f	CHILD buried w/ SW#5 - another child\n\nHair: blond/red - reddish auburn\n\nTextile: coarse linen - body filled w/ sand - braided linen beneath outer layer - yellow coarse linen underlayer\n\n4 reeds under body - full length	67f4fe06-2ce0-424a-a5e4-f82fce359774	048bd401-aaef-4bb0-827e-6ec78a7a03ef	\N	2005-02-09	\N	\N	\N	\N	\N	0.82	4	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
b57156c1-3720-4285-80b5-9688fe589711	West	0.65	1.02	0.9	4.75	5.58		\N			Jewelry - some beads (glass)\n-bronze earings for pieced ears\n-beads on leather string (8 beads 1 pearl)	Brown	V	t		f	f	f	f	CHILD buried w/ SW#4 - another child\n\nTextile: decorative threads in textiles - red - coarse outer layer w/ \n\n4 strand red ribbon - inner layer not well preserved \n\nFace bundle: face bundle w/ twisted then over face  = <>\n <>\n <>\n <>\n <>\n /\\	b6dd0e01-22a8-4652-a4cd-6f36724d4ecb	cb10c987-97b5-40bf-9fc9-e6ef4ad8283e	\N	2005-02-05	\N	\N	\N	\N	\N	0.9	5	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
afce8964-29ae-468a-9868-eb82aa43222c	West	0.8	3.85	3.9	1.97	3.68		\N				Brown	IV	f		f	f	f	f	Buried w/ SW#7 - a child\n\nHair: brown curly\n\nPalm frond stems for body support (7 of them)\n\nTextile: textiles on feet - big toes tied together to keep feet together - tied w/ a looped slip knot\n - some red thread over patella in linen\n\nFace bundle - thick palm fiber mass -bound w/ plain ribbon then wadded linen - all for mass	de112695-d8ae-4b95-a52e-70d0a2b8e8a2	61d2dde5-e7e0-4f10-a072-8d1ecf4401b7	c8606dda-0060-4e9b-87b8-45cd1d8546a6	2005-02-12	\N	\N	\N	\N	\N	1.69	6	\N	Undetermined	Male	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
90f0c92c-1684-4785-99ab-77c9f5ca6ab4	West	0.8	4.04	4.1	2.8	3.7		\N				Red	II	f		f	f	f	f	CHILD\n\nHair: red-brown\n\nTextile: burlap quality weave - long fringe on inner layer (18cm long)\n\ncoarse outer wrap - held on by torn linen strips folded around body\nnext linen layer also held on by torn linen strips - diagonal tied at feet - palm sticks inside layers to give support\n\n4 strand red ribbon - not neat but diagonal wrapping knot at waist\n\nFace bundle - cloth encrusted with salt and attached to body - held to body by 2 wraps of torn linen strips - palm fiber bundle tied w/ twine - 3 bundles of fiber folded & twisted once, 1 bundle folded & twisted (as w/ linen) ->  <>\n  <>\n  <>\n  /\\	0021e110-4998-495e-a248-92b285bc9793	518edd4c-a504-4864-b1f2-d984210afaeb	\N	2005-02-14	\N	\N	\N	\N	\N	0.9	7	\N	Undetermined	Female	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
70567c6e-8c65-4cc4-bbdc-eac37ff47fcc	West	0.35	1.12	1.24	0.7	2.05		\N					II	f		f	f	f	f	Big toes tied together - palm stems along back of body for support\n\nLots of rope wrapping over 3 layers of coarse linen - rope = 2 strands but a pair used for wrapping\n\n2nd layer has a 2 strand rope - singles this time, holding next layer around body twist on itself, down body 20cm, twist on itself, 20cm down body , twists on itself, etc..	4a6c11fa-d698-4ae9-ba80-29250febbf1b	a5985073-9feb-460c-a131-88cb44cfa57f	\N	2005-02-08	\N	\N	\N	\N	\N	1.33	8	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
5833b00b-0fb2-4566-8305-0636681c65aa	West	0.55	1.87	1.87	0.77	1.16	0.5	\N			Fine glass fragments associated w/ burial			t		f	f	f	f	INFANT 0-6mo.\n\nTextile: twisted rope bundled on outside - palm fiber decorative weave on lots of textiles - linen & wool - decorative hem on cloth\n\nskull fragments	9815d66c-f944-4847-9ec6-9fa7dc1f976c	3b45905a-c6f6-4659-94c9-4b77e4fe423a	\N	2005-02-09	\N	\N	\N	\N	\N	0.4	9	\N	Undetermined	Undetermined	f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
3cc0f1f0-5a3d-4b43-9547-5191c8b9589b		0.55	1.67	1.79	3.27	3.9		\N						f		f	f	f	f	Child	ca0899d8-9002-46ff-941a-998f1f9c776d	0c71bc73-243e-4341-8d3d-b2d75c622b38	\N	1998-01-01	\N	\N	\N	\N	\N	0.77	1	\N	Undetermined		f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
e908171d-5f55-460c-b21d-7c4dbf511df3		0.92	3.67	4.24	1.77	3.4		\N						f		f	f	f	f	burials 6 & 10 together, 6 over left shoulder & touching 10, both wrapped, ribbons, face bundles	36b531fe-dd08-480b-af0a-1a8e965327ef	04dfc66b-9b6e-4bd4-8c51-56f81d2f3da9	\N	1998-01-01	\N	\N	\N	\N	\N	1.74	10	\N	Undetermined		f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
a0e79694-b2d1-430b-9b95-04873dd28f6e		0.9	3.87	4	3.35	4.35		\N						f		f	f	f	f		beaaa7ba-03c9-4f4f-ba07-f1fa0ded292d	5debfe61-a6cc-46dc-99fc-74c6ac1c5a9f	\N	1998-01-01	\N	\N	\N	\N	\N	1.1	11	\N	Undetermined		f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
62602bf9-6301-447d-8a41-8b6df1104103		0.56	1.44	2.02	2.18	3.47		\N						f		f	f	f	f	Adult (?) - Feet missing	39efdd2b-a2af-4e48-ac7c-1d262de88723	e0f32819-a02a-4ffe-b82b-102f82aaba42	\N	1998-01-01	\N	\N	\N	\N	\N	1.65	2	\N	Undetermined		f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
4a6828fd-45b7-4901-b84b-b03069c65474		0.72	1.34	1.24	1.17	1.85		\N						f		f	f	f	f	Child	29b75ad9-370e-4733-a5db-9e2df8f7629d	71184bc9-cc42-49eb-b094-ef054a47ebb4	\N	1998-01-01	\N	\N	\N	\N	\N	0.67	3	\N	Undetermined		f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
8ffca475-2a54-4757-b8ef-c361a16b130e		0.6	0.84	1.02	2.13	2.72		\N						f		f	f	f	f		a2024b62-d21b-469f-8401-9d092ccd6942	d9b787ab-eed0-4fe5-b43a-fafa04024e73	\N	1998-01-01	\N	\N	\N	\N	\N	0.61	4	\N	Undetermined		f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
78a4ab42-2453-4afb-8d2b-ba38fca7ec77		0.95	2.87	3.03	0.9	2.31		\N						f		f	f	f	f		d86f79fc-c1ce-43b6-a71b-ff28b48e40ae	b3e38ec8-b06a-4bd0-820f-c5d5f6392b2e	\N	1998-01-01	\N	\N	\N	\N	\N	1.49	5	\N	Undetermined		f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
899dbdc2-4668-4441-a35a-48a7319d0794		0.85	3.82	4.3	1.6	3.31		\N						f		f	f	f	f	burials 6 & 10 together, 6 over left shoulder & touching 10, both wrapped, ribbons, face bundles	d5bd2844-74c5-4797-97af-3b757591e18e	c2b50666-c4ef-4313-837d-ace89f124f9e	\N	1998-01-01	\N	\N	\N	\N	\N	1.8	6	\N	Undetermined		f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
784e00a9-8612-4208-92a1-d55d9c640de9		0.84	3.22	3.49	3.83	5.36		\N						f		f	f	f	f		bdc19de4-5af9-47f1-a6d8-161dba6d053e	19587421-8d38-4959-ad65-8a624bd3155c	\N	1998-01-01	\N	\N	\N	\N	\N	1.78	7	\N	Undetermined		f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
7ee5a626-2a76-4314-8ad0-32e57e7c5062		0.4	1.9	1.9	4.66	5.09		\N						f		f	f	f	f		1dd81403-0492-4870-932a-6d45d2c3eb41	9ec1a978-8cac-4129-873e-92205bb3f57c	\N	1998-01-01	\N	\N	\N	\N	\N	0.42	8	\N	Undetermined		f	\N	\N	\N						0	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
8bfaf7a8-ae3f-42ab-b7a8-333f27abed08		0.98	0.78	1.18	3.88	5.78		\N						f		f	f	f	f		0d05a0b6-3ee9-4586-8a73-970dc26007ae	37bb3cd1-3971-41bb-bd13-0b63480cd9f7	\N	1998-01-01	\N	\N	\N	\N	\N	1.82	9	9	Female		f	\N	\N	\N						848.3818	\N	\N		\N								\N	\N	\N	\N	\N	\N	\N	\N	\N
2950f00c-3799-4b7e-bbaa-ba26beff1778		0	0	0	0	0		\N						\N		\N	\N	\N	\N		23116e4d-2411-493a-83a7-a212743556ef	db506540-b776-45d4-bdc2-7303975a2248	\N	\N	\N	\N	\N	\N	\N	\N	44	\N			\N	f	f	f						\N	\N	f		f				1A.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
5003a397-a974-40e9-ad61-75989df603fb	West	0.97	1.03	0.85	2.84	4.48	U	\N						\N		\N	\N	\N	\N	Same cluster details as above\nRope around neck twice looped through itself and drawn length of body - so that four strands of rope are on the body\nreeds under body	64a5472b-7786-44a3-a567-e5e3e6b3c42a	8291255b-7a29-4eb1-8d7d-a0b6aacb4818	\N	2005-01-01	\N	\N	\N	2005	\N	1.72	12	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	f		f	2005	21		1C.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
c97b9ba4-b497-4893-8b9c-dad4d92509b8	West	0.34	0.08	0.65	0.32	0.3	6-7 yrs	\N				brown		\N		\N	\N	\N	\N	Can't find details on age, wrapping, or hair for this the burial in field book that are described in database (TW)\nOnly part of body - no legs\nCoarse linen\nSolid red ribbon\nWool bundle of cloth on face\nSome green design\nVery good tissue\n12 samples	96bec069-4196-4cfb-ae46-dd8f077feff9	657966cd-b969-4d73-918e-3833d2da7ffe	\N	1992-01-01	\N	\N	\N	\N	\N	0.6	50	\N	Undetermined		\N	f	f	t	bones and skull	B	C	S	C	\N	\N	t		f	1992A/1992C	127-132/73		1A.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
0dca0ead-7229-4237-937e-8bb5cbccf342	West	1.44	3.97	3.52	0.21	1.86	20-24 yrs	\N				dkbrwn		\N		\N	\N	\N	\N	Measurements in 1992E\nage, gender, and hair in 1992C\nRed/white ribbon on fine linen\n10 layers of coarse linen\nReeds on palm sticks under\nPurple design\nPhoto of purple stripe\nMore wrap details available on pg. 120\n7 samples	d255d3c0-d4c7-480c-b193-202421c49e81	242211e7-5da6-4f8d-8dcf-582e350e4e45	\N	1992-01-01	\N	\N	\N	\N	\N	1.61	41	\N	Female		\N	f	f	t	wrapped	W	A	P	A	\N	\N	t		f	1992A/1992C/1992E	120/67/57		1A.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
0d73fa50-7f5a-4eaa-8011-c0e65f294c9f		0	0	0	0	0		\N						\N		\N	\N	\N	\N	Disturbed #1	b33ebb03-29c1-44ff-82b6-8fade603b542	e0cf86af-fbde-43ea-8ec9-c07c49d77f96	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	f	f	f						\N	\N	f		f				1A.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
680979db-b147-45b0-9a02-bf9ed70da5fa		0	0	0	0	0		\N						\N		\N	\N	\N	\N		6e101f3e-6348-495d-a1e6-5c643eee64c5	6732e10f-3f99-4be7-8066-a0529537f5c7	\N	\N	\N	\N	\N	\N	\N	\N	2	\N			\N	f	f	f						\N	\N	f		f				1A.05	3			\N	\N	\N	\N	\N	\N	\N	\N	\N
be5ee5a8-ca80-425c-a4aa-624adb4fcd93		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	ecc8aab5-33e3-4cb8-ac35-6891ce13f1d1	\N	\N	\N	\N	\N	\N	\N	\N	1	\N			\N	f	f	f						\N	\N	f		f				1A.06	14			\N	\N	\N	\N	\N	\N	\N	\N	\N
fd72cd89-0c33-4f83-8ad1-0b9c030afe62		0	0	0	0	0		\N						\N		\N	\N	\N	\N		f42ec284-04b3-486e-9327-05f0235306d5	60d229b2-0701-4424-9e14-32de55beae12	\N	\N	\N	\N	\N	\N	t	\N	2	\N			\N	f	f	f						\N	\N	f		f				1A.07 AND 1B.03	1			\N	\N	\N	\N	\N	\N	\N	\N	\N
2561ac84-6949-4850-99bb-f928e176dac8	West	1.1	3	2.65	3.55	5.24	18 years	\N				br-red		\N		\N	\N	\N	\N	Large linen bundle on face\nSolid red ribbon ties\nWrapped in a purple cloth on waist\nBody has a purple and white fabic wrapped around the body - Tied with red/white ribbon\nPalm sticks under the wrap and along the arms to the feet\nLots of details about the wrapping available in 1992A page 61	2bd0b3d7-598b-4f45-8bf4-8301b41d1316	56e95b83-5103-44b9-8792-f5c7270d1cbb	\N	1992-01-01	\N	\N	\N	\N	\N	1.79	26	\N	Female		\N	f	f	t	wrapped	W	A	P	A	\N	\N	t		t	1992A/1992C	52,61/33		1A.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
70c28b28-4b41-47b3-9cf7-b7099f648135	West	1.2	4.2	3.88	0.72	2	14-15	\N				br-red		\N		\N	\N	\N	\N	age, gender, and hair found in 1992C\nLarge adult\nNo fabric on head\nLarge foot bundle, outer layer of fine linen\nLOTS of details on wrapping on pg. 118\n7 samples\n2 molars	db921eef-670d-43f3-8001-bc54dec4d958	cc8ed453-a24b-4aaa-b7d9-6d8f65885f06	\N	1992-01-01	\N	\N	\N	\N	\N	1.55	38	\N	Undetermined		\N	f	f	t	wrapped	W	C	P	C	\N	\N	t		f	1992A/1992C	108118/59		1A.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
ce9ed2ca-1fa5-4b6c-8436-9649dba22443		0	0	0	0	0		\N						\N		\N	\N	\N	\N		9ef9f1c5-d410-446e-8234-2372057803d3	102a2c63-cfc2-45da-bf73-3536722d0cbd	\N	\N	\N	\N	\N	2002	\N	\N	9	\N			\N	f	f	f						\N	\N	f		f				1A.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
cf72a138-d3cd-45d6-bf04-7d9bb572860a	East	1.84	2.95	3.15	2.68	1.78	9-10 yrs	\N				dkbrwn		\N		\N	\N	\N	\N	Measurements in 1992E\nage and hair in 1992C\nFragments of textiles only	99abb34f-f201-4805-9508-abd5dd57eb23	7670aaa6-079d-4005-ba18-c7ec3e7f813e	\N	1992-01-01	\N	\N	\N	\N	\N	0.9	48	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	C	\N	\N	t		f	1992B/1992C/1992E	5/91/70		1A.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
102231b8-7786-4fa3-b25c-4d662ff627ba	West	1.41	0.74	0.72	1.58	3.3	>30	\N						\N		\N	\N	\N	\N	Skeletalized\nSternum larger than expected - ribs seem too for seperated, hardly coming over top of body\nhands by sides of body	7cd5ad1a-f56f-456d-8081-6cf17d2c587a	ca3b8158-416e-405a-a272-43c8c0f35832	\N	2005-01-01	\N	\N	\N	2005	\N	1.75	20	\N	Male		\N	f	f	f		B	A	U	A	\N	\N	f		f	2005	29		1B.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
841a14dc-e98d-49ee-99ae-edb03b0730e0		1.58	2.06	0	1.91	0	U	\N						\N		\N	\N	\N	\N	#22,23,24,25 - Four skulls, associted textiles, and an assortment of bones	900da9aa-070e-4530-abbe-b19e98de7e5f	3c566530-b719-4cbc-a3ce-b776aaff94e1	\N	2005-01-01	\N	\N	\N	2005	\N	\N	22	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2005	31		1B.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
ddbf63cf-a91e-42c5-8be2-294334b49beb		1.9	3.65	3.45	-0.14	1.41	U	\N						\N		\N	\N	\N	\N	Skeletalized	4f740a25-34bc-435f-900a-41fad1a978a7	e5b84423-80bb-489b-9176-8108cbb00e38	\N	2005-01-01	\N	\N	\N	2005	\N	1.7	31	\N	Undetermined		\N	f	f	f		B	A	U	A	\N	\N	f		f	2005	37		1B.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
78c1d19c-8aa0-4b81-81bb-ca98e3b2b211	West	0.95	3.38	3.14	-0.35	3.6	U	\N				red		\N		\N	\N	\N	\N	Sub-adult\nHead and foot bundle\nlarge limestone block vertically placed south of head\nsmall cap near hips	9a678ecc-81c6-4279-b3b0-a64983cff3c2	76911b95-bdbe-4c71-8563-9bd305474da5	\N	2005-01-01	\N	\N	\N	2005	\N	1.01	5	\N	Undetermined		\N	f	f	f		H	A	U	C	\N	\N	f		t	2005	15		1B.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
11a8f18d-1432-4baf-812d-666b862a5f18		1.52	2.36	0	1.85	0	U	\N						\N		\N	\N	\N	\N	Same cluster details as above	aaaf7394-5cd9-4bb3-966b-d7b0fb2c8e5d	3f62f255-9b03-48ad-ae52-599ad1de8e9a	\N	2005-01-01	\N	\N	\N	2005	\N	\N	23	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2005	31		1B.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
bd709378-cc48-49ec-8f67-90b4d456f87f	West	0.73	3.09	2.94	1.08	2.1	U	\N						\N		\N	\N	\N	\N	On top of #9	ba8c4124-d287-47db-991a-ba569f44d71f	a2a115e3-50d4-486f-aa3d-210b8418cdff	\N	2005-01-01	\N	\N	\N	2005	\N	1.14	8	\N	Undetermined		\N	f	f	f			U	U	U	\N	\N	f		f	2005	17		1B.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
19557d4c-38f5-444d-9f2d-b7b06374d745		2.04	2.67	3.18	3.9	2.88	10-Aug	\N				brown		\N		\N	\N	\N	\N		cc8c517f-23b6-4908-9bc6-09ccef5e0a28	953ed118-1228-4f01-a579-e6d33b0b5c1c	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	Female		\N	f	f	t	bones and skull	B	C	S	C	\N	\N	t		f				1B.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
2c328172-ba49-41b8-8a25-83273767eb28	West	1.02	3.2	2.81	1.21	1.93	U	\N						\N		\N	\N	\N	\N	Well wrapped, with linen at feet	608b3cbe-72b3-4976-881e-77d980807fe2	12d082fa-ce9f-4c56-8352-b8fe4b660ed9	\N	2005-01-01	\N	\N	\N	2005	\N	1.01	9	\N	Undetermined		\N	f	f	f	well preserved	W	U	U	U	\N	\N	f		f	2005	17		1B.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
fc9a1128-aa74-47bd-a69e-6bdae1c84387	West	1.07	0.6	0.38	4.46	6.06	U	\N						\N		\N	\N	\N	\N	#50 is on top of #51	9d7f71f5-e06c-4ba8-8ec5-3fe29cd28eff	6a973722-51b4-4fed-882a-4abf26270f6d	\N	1998-01-01	\N	\N	\N	\N	\N	1.72	50	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	128		1B.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
230669b9-70ad-4055-ae3a-c52f03f23349		1.6	2.42	0	1.82	0	U	\N						\N		\N	\N	\N	\N	Same cluster details as above	fece8a25-628b-47a6-88e8-7986e0f0f2f3	e3cf7d05-14b9-4a48-a7a7-347a2fee34e5	\N	2005-01-01	\N	\N	\N	2005	\N	\N	24	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2005	31		1B.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
f08bedcf-3591-4f09-994c-b9430e85eff9		0	0	0	0	0		\N						\N		\N	\N	\N	\N	White thin (~2 mm) egg shells in skull - shells most likely located in skull sometime during storage.  Maximum diameter ~2 cm.	718acaab-979a-4168-9789-fcf1e374417f	d67668fc-8345-4826-b63e-c2e273150980	\N	\N	\N	\N	\N	\N	\N	\N	3	\N			\N	f	f	f						\N	\N	f		f				1B.12	4			\N	\N	\N	\N	\N	\N	\N	\N	\N
ba2f59e4-3a90-4dec-8ddb-c39221b7926b	West	1.42	2.8	2.69	3.66	5.42	15-17 years	\N				br-red		\N		\N	\N	\N	\N	age, gender, and hair found in 1992C\nLarge, well wrapped adult\nTied on head with ribbon - no colors\nBody tied with torn strips\nLots of more details on wrapping on pg. 98\nBody not well preserved\n4 samples	a6a54e36-b964-48c4-951e-5d953b05b946	1c7b81f6-c542-49f2-af80-760b84363183	\N	1992-01-01	\N	\N	\N	\N	\N	1.81	35	\N	Male		\N	f	f	t	well-wrapped	W	A	P	A	\N	\N	t		f	1992A/1992C	94,98/48		1C.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
077a471a-ae75-432e-896f-5153a8b41c69		0	0	0	0	0		\N						\N		\N	\N	\N	\N		095640f8-dc92-4103-b1fd-42c07b3641e9	93e0206e-63fa-49a7-8578-a26177b725aa	\N	\N	\N	\N	\N	2002	\N	\N	12	\N			\N	f	f	f						\N	\N	f		f				1C.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
2aa87b59-cc3d-4495-aab3-c60e63a9d7fe	West	1.9	4.25	4.3	2.65	3.3		\N						\N		\N	\N	\N	\N	Has red/white ribbon and linen	0cd95eae-617a-45ca-aa3a-f00aa9e3ffc9	4df4211e-d0c4-4c93-877c-3a050779399f	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	Undetermined		\N	f	f	t		W	C	U	A	\N	\N	t		f				1C.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
9711fb3f-2fad-48fa-84ce-12b7a8ec1541	West	1.22	2.62	2.59	3.73	5.2	U	\N						\N		\N	\N	\N	\N	Has 4 strand red ribbon over outer linen - diagonal pattern	6114fe95-0e4b-45d9-9e7b-99efaf4938b2	147702dc-38e8-4247-a9d6-ebdc524e827f	\N	2005-01-01	\N	\N	\N	2005	\N	1.45	21	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	f		f	2005	57		1C.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
c7686292-3ee0-4e03-a969-e3f81c8cc0d8		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	f4ec579c-8779-45e6-996e-114d7fff6ed4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	f	f	f						\N	\N	f		f				1C.05	1			\N	\N	\N	\N	\N	\N	\N	\N	\N
a7b796ea-c79c-48a7-a84d-b8786fcab831		0	0	0	0	0		\N						\N		\N	\N	\N	\N		e44f8b0f-30da-4607-83c0-744d0dd0be79	64554de9-f5a5-4a31-a716-4e7925a4b6e4	\N	\N	\N	\N	\N	\N	\N	\N	4	\N			\N	f	f	f						\N	\N	f		f				1C.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
d0a756d6-f2ca-4477-aa09-9ad87f42d8b2	West	1.1	4.75	5	2.15	3		\N						\N		\N	\N	\N	\N	Body is buried on North border but head is in the NW area	ff9097c1-378d-49af-b6b1-d9dca7d948a5	e1121a85-458c-461a-aa8d-78e38e5a92c6	\N	1994-01-01	\N	\N	\N	\N	\N	\N	22	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B	39,46		1C.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
14ff3d2c-23d5-4746-84b2-711fb6c1c172		0	0	0	0	0		\N						\N		\N	\N	\N	\N		4b10fe48-dcc2-40fa-bbbb-0842525b6084	4791e7cb-e540-4ac4-9c93-ee88da303b71	\N	\N	\N	\N	\N	2002	\N	\N	1	\N			\N	f	f	f						\N	\N	f		f				1C.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
180c3c09-ce88-4056-9831-1df38810d0be		0	0	0	0	0		\N						\N		\N	\N	\N	\N	ribbon with skull	c7dfb871-0b8c-42b9-96c9-79ddb7b3e75c	c66aac45-6bd4-4948-b093-c7c3404d728f	\N	\N	\N	\N	\N	2002	\N	\N	7	\N			\N	f	f	f						\N	\N	f		f				1C.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
6a1c984b-10e8-4c06-a032-a59a2e3aa08a		0	0	0	0	0		\N						\N		\N	\N	\N	\N		ec78b056-1627-4d86-af67-77f80ff2147c	28a3dc63-095b-45e8-b4f8-af4ad2e907dc	\N	\N	\N	\N	\N	\N	\N	\N	25	\N			\N	f	f	f						\N	\N	f		f				1D.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
6050e23e-2dae-43e8-9184-e65cd757c093	Undefined	1.4	3.1	0	2.2	0	40-50?	\N				U		\N		\N	\N	\N	\N	Skull and bones disarticulated lying on palm leaf basket\nNo other fiber materials\nNote that the rope used in the basket was made of twisted palm leaves\nCan't find measurements, or details on age, hair, or gender in field book that are described in database (TW)	d99d12ee-a55a-4baf-bd6a-729acb04e3e4	1e22fb17-aaab-4298-9a1b-196e23c77b87	\N	1987-01-01	\N	\N	\N	\N	\N	\N	26	\N	Male		\N	f	f	f	B	B	A	P	A	\N	\N	f	U	f	1987B	66		1D.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
92fbe8df-a729-4003-b096-684363ca6323	West	1.27	3.9	3.49	0.68	2.13	30-40	\N						\N		\N	\N	\N	\N	Can't find details on age, gender, or wrapping for this burial in field book that are described in database (TW)\nRed/white ribbon\nbasketcase	a794d8c9-0bff-48e2-b7ef-61a871aaa8ef	b5aa61a5-0791-45cd-beb0-3b9b10e1cbcd	\N	1992-01-01	\N	\N	\N	\N	\N	1.5	39	\N	Female		\N	f	f	t	scattered bones with skull	B	A	P	A	\N	\N	f		f	1992A	108,138		1D.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
99b28249-2645-4f36-a4b9-6d4ea10ac3f4		1.57	2.25	1.7	1.5	2.4	25-30	\N						\N		\N	\N	\N	\N		f254ea41-59e6-4fc1-9c29-c521658cc9c5	ea7794eb-b5c3-4d3b-8d65-e00ffdff3d34	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	Female		\N	f	f	t	bones and skull	B	A	P	A	\N	\N	f		f				1D.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
e3e68cf6-2cd1-4db2-985d-682d095d4b6e	West	0.42	2.66	2.64	2.62	4.24	U	\N						\N		\N	\N	\N	\N	Well-wrapped, but textiles deteriorating	3a71a288-d9e5-4c5f-a9cd-3dbabdaf02df	dd6c3cea-39d5-4a04-805a-a57b1158c957	\N	2005-01-01	\N	\N	\N	2005	\N	1.7	1	\N	Undetermined		\N	f	f	f	deteriorating	W	A	U	A	\N	\N	f		t	2005	43		1D.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
2bb2080c-deb3-4464-83d1-3d47859cc7eb	East	0	0	0	0	0		\N						\N		\N	\N	\N	\N		9decae12-7845-48ec-ab48-34bdc6e83860	ae5b0d68-1b42-423f-93d1-d45924ecf159	\N	\N	\N	\N	\N	\N	\N	\N	40	\N			\N	f	f	f						\N	\N	f		f				1D.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
6aa84a26-d59c-4215-9cf5-5d063e8c83d0	East	2.12	3.79	4.17	3.65	2.2	U	\N				brown		\N		\N	\N	\N	\N	Skeletalized\nwrapped with torn linen strips on diagonal around body\nLong brown curly hair	a5586358-1c2b-4187-85be-51d2d9d21537	84b79820-d4ec-4cca-87a0-ca169068a16e	\N	2005-01-01	\N	\N	\N	2005	\N	1.5	26	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2005	33		1D.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
cc762866-ff98-4a57-8175-749ab165ca18		0	0	0	0	0		\N						\N		\N	\N	\N	\N		39c82c19-690e-4f3d-93a4-f93a20e093d7	d8bdddab-a6f0-4c7d-9ac6-cd5e4b7ef48a	\N	\N	\N	\N	\N	\N	\N	\N	19	\N			\N	f	f	f						\N	\N	f		f				1D.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
59e44752-458c-40ea-89e1-071164e1e2cc		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	479ee4af-59ed-40b9-8733-2ea5417b05a1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	f	f	f						\N	\N	f		f				1D.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
3d10a0c2-72f9-4659-aea6-6c471eb1bb3b		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	970f1046-76fe-431c-aaad-81df24b1d778	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	f	f	f						\N	\N	f		f				1D.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
2fc95c4b-71e3-4a7a-adbf-018b6f9b0de7		0	0	0	0	0		\N						\N		\N	\N	\N	\N		37a16283-4068-42b9-a788-6387c84d4f53	c80bc41c-8c94-45a5-9f3e-55713c8e98f7	\N	\N	\N	\N	\N	2002	\N	\N	5	\N			\N	f	f	f						\N	\N	f		f				1D.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
5395b520-0632-4a5d-b9d7-dd982b16e3bb	West	1.38	1.84	0	3.75	0	45+	\N				rd-bln		\N		\N	\N	\N	\N	gender, age, and hair in 1992C\nBasket case\nPiece of face bundle\nCoarse linen tied with torn strips\nonly skull\nhad beard\n4 samples	b85c11de-da94-4daa-a9bd-582e6b227665	fd27c50a-b50b-447e-a7da-22d978491e99	\N	1992-01-01	\N	\N	\N	\N	\N	\N	24	\N	Male		\N	f	f	t	Skull only	B	A	S	A	\N	\N	t		t	1992B/1992C	19,22/109		1E.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
cfa32125-04f8-489b-97e0-3a27c0523995	Undefined	0.2	0.96	0.96	3.6	3.6		\N						\N		\N	\N	\N	\N	Skull	274bb71f-4a9b-442f-a6ab-1b4eb1d3ce1c	1c3e9d9c-e8ca-4dac-b931-327a1a8bc287	\N	1994-01-01	\N	\N	\N	\N	\N	\N	2	\N	Undetermined		\N	f	f	t		U	U	U	U	\N	\N	f		f	1994B	3		1E.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
7578ab13-767a-4570-b9ce-17859d769568	West	0.75	0.45	0.85	4.05	5.53	U	\N						\N		\N	\N	\N	\N	face bundle\nBuried with child directly on top (21) and smaller child (25)	805b43cd-678e-4577-84fe-4f7c0e7cfcbf	fde23658-0ce7-408b-b2d5-b61943f68390	\N	2009-01-01	\N	\N	\N	\N	\N	1.55	24	\N	Undetermined		\N	f	f	f		U	A	U	A	\N	\N	t		f	2009	47		1E.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
82b25bf4-8a5a-4d33-b51d-d6b8556b117d	Undefined	1.7	1.25	1	-0.2	1.68	I	\N				Brown		\N		\N	\N	\N	\N	Outside of body had 6 strands of ribbon across the shoulders and interlaced across the chest (61 strands of ribbon were laced across the hips)\nBody had a large face bundle, inside fabric completely decomposed\nBody wrapped with 4 layers of coarse cloth\nFound small piece of yellow ribbon\nSmall section of fringe or pattern on a finer quality fabric\nCan't find burial measurements, or details on hair, age, or gender in the field book that are noted in the database (TW)\nMore wrapping details on pg. 73-76	3c4f1317-d687-42af-ab47-444fc38e59e1	267450d9-f415-4fcf-b56c-fd04734c30c0	\N	1987-01-01	\N	\N	\N	\N	\N	\N	13	\N	Male		\N	f	f	t	W	W	A	P	U	\N	\N	t	U	t	1987B	37,73		1E.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
0099cddb-ced8-4042-b05a-33a161423ae9		1.2	1.67	1.65	3.19	4.95	30-40?	\N						\N		\N	\N	\N	\N		cf37267e-8a14-4130-8c7d-40352064d0b9	aa9b6456-6db6-4b52-a1a7-9781eb6cd8ec	\N	\N	\N	\N	\N	\N	\N	\N	19	\N	Male		\N	f	f	t	poorly preserved	B	A	P	A	\N	\N	f		f				1E.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
4c2848b2-3a58-4407-be2a-c4ec40ec8f2f	West	1.23	3.12	3.32	0.4	1.94	U	\N						\N		\N	\N	\N	\N	Is in a cluster burial with three children	77ca483c-dce6-4bc1-9913-a5ebca0951ad	d42918b5-152d-431b-997d-d4e5b228f4d2	\N	2009-01-01	\N	\N	\N	\N	\N	1.48	45	\N	Undetermined		\N	f	f	f		U	A	U	A	\N	\N	t		f	2009	65, 70		1E.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
22981d35-6537-4ec2-9856-f1698c95c043	West	1.18	1.77	1.59	2.4	4.13	V	\N				Brown		\N		\N	\N	\N	\N	Well-wrapped, tied with ribbons\nCan't find details on hair, gender, and age in the field book that are described in the database (TW)	b76a19a5-1509-4342-92c5-31d85f45ab13	b87ac007-37e5-49b7-b9c6-c525b14fd51e	\N	1987-01-01	\N	\N	\N	\N	\N	1.77	3	\N	Male		\N	f	f	t	well-wrapped	W	A	P	U	\N	\N	t		t	1987A	80		1E.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
04f535ab-5946-4e7d-942a-e2cff976554e		0	0	0	0	0		\N						\N		\N	\N	\N	\N		6d35f5db-6877-47ea-b531-a35abc48b8c9	a695e993-0746-4444-a5e7-b813145edee2	\N	\N	\N	\N	\N	\N	\N	\N	14	\N			\N	f	f	f						\N	\N	f		f				1E.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
a832ed19-3613-46a3-802e-e1d883eda958		0.97	3.26	3.17	4.95	3.41	40+	\N				BROWN		\N		\N	\N	\N	\N		4947bb9d-6ff4-4239-8f9c-0a561d5cec69	f803338a-3359-4d77-b1a1-3e54637ca207	\N	\N	\N	\N	\N	\N	\N	\N	24	\N	Male		\N	f	f	t	wrapped	W	A	P	A	\N	\N	t		f				1E.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
ab4bed37-f41a-4b73-8f9a-325b7f978dec		2.4	3.86	3.58	3.35	5.12	35+	\N				dkbrwn		\N		\N	\N	\N	\N		c959717a-e034-49e3-a1a9-83d1be39115b	ffcda9ad-66cd-4928-8c2c-96ab1a99080a	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	Male		\N	f	f	t	bones and skull	B	A	P	A	\N	\N	t		f				1E.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
9c268802-4bcd-4163-9668-61d848363019		0	0	0	0	0		\N						\N		\N	\N	\N	\N		99cc623f-13c2-4512-8cf2-201f595924f5	4540fe10-6d31-409f-a2f8-ae7381a398bd	\N	\N	\N	\N	\N	\N	\N	\N	1	\N			\N	f	f	f						\N	\N	f		f				1E.11	4	5		\N	\N	\N	\N	\N	\N	\N	\N	\N
710157a3-3481-4e41-8e06-f1a7ef02972b	West	0.68	2.22	1.92	1.89	3.55	U	\N						\N		\N	\N	\N	\N	brown and white ribbon\nface turned to south\ncloth folded and tied beneath feet	c1518415-e6db-4716-9177-2280b5ee61ba	efaf0235-ebc0-484b-98b3-fadda2e4e4a6	\N	1998-01-01	\N	\N	\N	\N	\N	1.7	6	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	89		1E.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
e26bee5d-37d1-4d68-a156-40bdaa6f58d1		0	0	0	0	0		\N						\N		\N	\N	\N	\N		0232ea9b-622b-4c05-9c26-2a87b2275cc6	0d0e2ad8-7cbf-439e-9d9e-7b83d9ad2460	\N	\N	\N	\N	\N	\N	\N	\N	38	\N			\N	f	f	f						\N	\N	f		f				2B.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
71b8cc94-b99f-4504-9eef-10886c467ed5	West	1.13	2.2	2.04	2.97	4.59	U	\N				very blonde		\N		\N	\N	\N	\N	Skeletelized with fragments of textiles at feet and shoulders\nJumble of fragments from burials in plundered area just to the west	91146903-d276-4938-b922-77944afff30b	6fd56ecb-ce4d-47ac-bec1-b05bd783d92e	\N	2005-01-01	\N	\N	\N	2005	\N	1.63	15	\N	Undetermined		\N	f	f	f		B	A	U	A	\N	\N	f		f	2005	25		2B.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
bebe5fca-81d5-42f4-aa1e-88a23ca95381		0	0	0	0	0		\N						\N		\N	\N	\N	\N		ab8e7dbe-5c39-4c52-85bc-00b598f43dd7	df664238-4f79-48fb-bffa-96896c3880cb	\N	\N	\N	\N	\N	\N	\N	\N	31	\N			\N	f	f	f						\N	\N	f		f				2B.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
4a16a904-95cc-4bd2-a8fb-6c0995d2cd91		0	0	0	0	0		\N						\N		\N	\N	\N	\N		f142b2e3-6ca8-45cb-ba6a-506a45f571d0	d57d5ae8-02dc-4911-b850-5e8137aaec8b	\N	\N	\N	\N	\N	\N	\N	\N	45	\N			\N	f	f	f						\N	\N	f		f				2B.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
cbaef130-8f60-48ec-a131-e15c443b73f8	West	0.83	0.28	0.25	2.9	4.54	U	\N						\N		\N	\N	\N	\N	Same cluster details as above	52e084ae-45c3-4c3c-a346-b9a63778669d	7ec3073c-3c7c-470a-9932-0cd2721fbf9e	\N	2005-01-01	\N	\N	\N	2005	\N	1.77	14	\N	Undetermined		\N	f	f	f		B	A	U	A	\N	\N	f		f	2005	21		2B.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
a06cb305-bb6d-423f-90a5-70dc750a7049	Undefined	0	2.29	2.29	3.93	3.93		\N						\N		\N	\N	\N	\N	Bundle removed 2 Feb 94\nWrapped in linen with red ribbons on feed\nExcellent teeth\nBuried right on top of #9\nTwo babies buried, one on each side of knees of #9	fa55ddd3-11ce-437f-8019-f2452fff7f86	dd970f99-126d-4ced-8dac-e585c3749252	\N	1994-01-01	\N	\N	\N	\N	\N	\N	7	\N	Undetermined		\N	f	f	t		B	A	U	A	\N	\N	t		t	1994A	19		2B.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
9eab1774-5581-4b69-bf95-5b08507174e2	Undefined	0	0	0	0	0	U	\N						\N		\N	\N	\N	\N	Can't find burial measurements in field book that are described in database (TW)\nBasket case\nFragments only of fine, coarse linen, and red/white ribbon	5f32af8f-1751-4a41-a1b8-b65fb64a31e3	524bd665-0ce1-4288-af36-e0cfea8bb5fd	\N	1992-01-01	\N	\N	\N	\N	\N	\N	4	\N	Undetermined		\N	f	f	t	U	U	U	U	U	\N	\N	f		f	1992A	130		2B.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
27830c15-3468-4497-87e2-9c15fed413e9		0	0	0	0	0		\N						\N		\N	\N	\N	\N		f3af2086-5244-4796-bd03-841598ca69b8	9f2a73b7-d1b4-4329-af5d-779db9b33652	\N	\N	\N	\N	\N	\N	\N	\N	3	\N			\N	f	f	f						\N	\N	f		f				2E.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
6268f8ef-e6c7-42b7-b028-1254ea50e05f	West	0.68	2.6	3.21	-0.67	0.96	U	\N						\N		\N	\N	\N	\N	Feet abotting the head of #8	6a73acc8-7cd4-4c40-8a3a-fa99a156ee6a	6698a460-76d3-48e0-974c-e47246ed23e3	\N	2005-01-01	\N	\N	\N	2005	\N	1.66	7	\N	Undetermined		\N	f	f	f			A	U	A	\N	\N	f		f	2005	17		2B.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
0f59c54c-d12c-4651-a777-20d9fc4ac096		0	0	0	0	0		\N						\N		\N	\N	\N	\N		3a6c63b5-4f5d-4ea5-8ef7-8dfe745acbb6	6b6c1cff-e91e-4bae-9acb-03486ba5dda7	\N	\N	\N	\N	\N	\N	\N	\N	2	\N			\N	f	f	f						\N	\N	f		f				2B.09	4			\N	\N	\N	\N	\N	\N	\N	\N	\N
0e341882-243b-49c5-b661-7b5d3464b9b1	Undefined	1.8	2.95	3.11	3.58	2.1		\N						\N		\N	\N	\N	\N		32f40493-a8c2-418a-8585-5778f19d7f13	243d5fab-a3f3-4d6f-936f-63698f6de923	\N	1994-01-01	\N	\N	\N	\N	\N	\N	19	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B	43		2B.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
7d6d851f-b320-4719-b715-542614bd97b6	Undefined	0.63	4.9	0	0	0	adult	\N				brown		\N		\N	\N	\N	\N	Skull that fell off the side of our dig\nProbably adult\nNo teeth or other bones\nCan't find burial measurements in field book that are described in database (TW)	f9667203-b56d-4409-b764-fc4cb2430aa1	ae4909e2-dfc9-456e-8920-1b0d554add54	\N	1992-01-01	\N	\N	\N	\N	\N	\N	11	\N	Undetermined		\N	f	f	t	Skull only	B	A	S	A	\N	\N	t		f	1992C	11		2B.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
a2b087d2-133d-47f4-9798-ffe5574b7ef4		0	0	0	0	0		\N						\N		\N	\N	\N	\N		115230a9-2806-40fd-83cb-594a93adf803	9bc423f3-8989-42a1-b644-c82e3fb6d755	\N	\N	\N	\N	\N	2002	\N	\N	20	\N			\N	f	f	f						\N	\N	f		f				2B.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
b3e2bda3-476f-4af6-bbe3-f2e90d126958	West	1.89	2.91	2.41	0.83	2.46	25-30 yrs	\N						\N		\N	\N	\N	\N	Measurements in 1992E	dd562f23-4483-4347-9671-3a1dfc683193	4e8fa5bc-913d-40ab-8386-6f9e48b4986f	\N	1992-01-01	\N	\N	\N	\N	\N	1.8	55	\N	Male		\N	f	f	t	poorly preserved	B	A	P	A	\N	\N	f		f	1992E	77		2C.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
22990cc0-1ba0-4c3d-8405-a7a16558c0ce	West	1.03	2.47	2.47	1.25	2.79	18-22 yrs	\N				dkbrwn		\N		\N	\N	\N	\N	Measurements in 1992E\nage, gender, and hair in 1992C\nRed/white ribbon\nPurple circle design on head\nStripe of purple on right side along body, left side decayed\n10 layers of coarse linen\nFinen linen next to body\n4 samples	fd6c0547-f573-427f-8013-33471d39937a	031a7ea9-71fc-4f14-a37d-8f3d139ea56c	\N	1992-01-01	\N	\N	\N	\N	\N	1.55	46	\N	Female		\N	f	f	t	wrapped	W	A	P	A	\N	\N	t		f	1992A/1992C/1992E	128/69/61		2C.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
a5f3d7d2-1a07-4663-96da-d1127bf9c78a		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	625700e0-7bd0-45af-b6ea-3a18f553be94	\N	\N	\N	\N	\N	\N	\N	\N	9	\N			\N	f	f	f						\N	\N	f		f				2C.03	11			\N	\N	\N	\N	\N	\N	\N	\N	\N
608b7610-08ee-48bf-a265-22b178b1c1c5	West	1.17	2.7	2.66	1.34	2.66	10-11 years	\N				Black		\N		\N	\N	\N	\N	age and hair details in 1992C\n#38 buried right on top of #39\nHead became detached from body\nSmall adult\nMany red/white on fine linen wrap\nBody wrapped with 6 layers of coarse linen, inner layer of fine linen\nCan't fine wrapping details	692c8b30-66cc-4f01-973a-ebfb6b5e57fa	2ea7af49-4866-4d78-ae43-22f7c109b86b	\N	1992-01-01	\N	\N	\N	\N	\N	1.35	38	\N	Undetermined		\N	f	f	t	wrapped	W	C	S	C	\N	\N	t		f	1992A/1992C	105-119/63		2C.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
7caaa2a3-91db-4057-aa5c-69cc9420bfa7		0	0	0	0	0		\N						\N		\N	\N	\N	\N	Last Square A87 found 88	\N	52c8ce3b-70b0-456e-ba09-191057e77c27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	f	f	f						\N	\N	f		f				2C.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
ca42b030-f1a1-4a16-9e8f-fbdb59d4fe42	West	1	0.9	0.81	3.78	5.43	30-35	\N						\N		\N	\N	\N	\N	age, gender, and hair found in 1992C\nRed/white ribbon, outer fabric of fine linen.\nInnter layers of coarse linen\nSome evidence of decayed fabric, like a knit on face.\nNot possible to save much\nSmall piece of green - possible linen\nbasket case\nMore wrapping details on pg. 113\n5 samples	d4f935c3-6f88-4254-83af-3a7eba056155	c990d228-d872-4b15-bebb-4d5fb86433b1	\N	1992-01-01	\N	\N	\N	\N	\N	1.73	34	\N	Female		\N	f	f	t	poorly preserved	B	A	P	A	\N	\N	f		f	1992A/1992C	94100113/48		2C.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
7b03b706-55b8-45f2-98d9-f9b46129c7ca		0	0	0	0	0		\N						\N		\N	\N	\N	\N		79b2c70d-d9c8-47fb-868d-32e252980718	d3ee594e-4286-4c56-8460-0bdbc2c266ce	\N	\N	\N	\N	\N	\N	\N	\N	3	\N			\N	f	f	f						\N	\N	f		f				2C.08	3			\N	\N	\N	\N	\N	\N	\N	\N	\N
6cebef7b-6523-48d5-89c7-cfd83ce086d0		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	aabd5030-689d-4052-b76a-87166f6b17c2	\N	\N	\N	\N	\N	\N	\N	\N	1	\N			\N	f	f	f						\N	\N	f		f				2C.09	18			\N	\N	\N	\N	\N	\N	\N	\N	\N
21077239-5cec-4b11-a2b1-814f2821342d	West	0.92	4.32	4.13	-0.48	0.35	U	\N						\N		\N	\N	\N	\N	Well wrapped - 4 strand red ribbon (diagonal wrap)	e1149249-257f-4ce8-b699-552c668e5c6e	aca6e9f4-007b-4af2-b4e3-d919cf3d5616	\N	2005-01-01	\N	\N	\N	2005	\N	1.11	32	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	f		t	2005	39		2C.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
726f45f5-6282-4ff2-b4d5-bcef90dd7f86	West	0.47	2.75	2.6	2.5	4.78	30-45 yrs	\N				dkbrwn		\N		\N	\N	\N	\N	Measurements in 1992E\nage, gender, and hair details in 1992C\nBadly decomposed linen, black\nLots of body fat\nOnly fragments saved\nWrap details on pg. 141 are pretty contradictory?...\nFew teeth missing\nBeard\n5 samples	c125a8a0-663b-4d43-a072-5f50b9dc344b	aed97577-d9a4-4431-94af-7706188d8896	\N	1992-01-01	\N	\N	\N	\N	\N	1.56	2	\N	Male		\N	f	f	t	poorly preserved	B	A	P	A	\N	\N	t		f	1992A/1992C/1992E	134-141/55/55		2C.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
94620349-2ff6-40db-b7a0-f2bbd4938b3e		0	0	0	0	0		\N						\N		\N	\N	\N	\N		49f3be07-1b3c-44ea-bd3c-537de9be82d6	a49ddcdf-d3c9-4057-a278-fd5da9e8eace	\N	\N	\N	\N	\N	\N	\N	\N	12	\N			\N	f	f	f						\N	\N	f		f				2C.12	18			\N	\N	\N	\N	\N	\N	\N	\N	\N
ea949b59-0e19-481d-8bc8-eb1e95d5da1c		0	0	0	0	0		\N						\N		\N	\N	\N	\N		4da771ad-5b8e-4a36-a733-c85bceb6c92d	b456511e-a470-4132-b7cb-8fdbdd2af543	\N	\N	\N	\N	\N	2002	\N	\N	14	\N			\N	f	f	f						\N	\N	f		f				2D.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
95931441-c7eb-4ac5-a5e6-57afdfa4788b	West	2.78	1.84	1.86	2.93	4.84	25-30 yrs	\N						\N		\N	\N	\N	\N	Measurements in 1992E\nage, and gender in 1992C\n5 samples	d6339652-5c51-4997-8872-cea64da02358	c012f6ea-12c6-4a50-9a33-3753c5bca1d1	\N	1992-01-01	\N	\N	\N	\N	\N	1.69	57	\N	Male		\N	f	f	t	poorly preserved	B	A	P	A	\N	\N	f		f	1992C/1992E	99/77		2D.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
8151ae76-da88-4c11-bbc4-4d5a45ea5c9c	West	0.9	4.45	4.5	1.82	3.52	U	\N				Blond		\N		\N	\N	\N	\N	Has a blond beard and a lot of curly blond hair\nIs skeletalized with a little coarse plain weave then another piece\nSome indication of a ribbon (now gone)	0b40f298-1a55-4a26-af60-b4beada7dc5f	61f404b2-c388-48bc-b526-699bfd0f7c25	\N	2009-01-01	\N	\N	\N	\N	\N	1.71	30	\N	Male		\N	f	f	f		H	A	U	A	\N	\N	t		f	2009	50		2D.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
42c6465c-dfd2-441f-88a5-8242a1decd4d	West	0.9	0.87	0.43	0.88	2.5	45+	\N				Blond		\N		\N	\N	\N	\N	age and hair details in 1992C\nCoarse linen inner wrap, finer outer wrap and different type of red/white ribbon\nAlso some undyed ribbon\nRed beard and mustache\n9 samples	996c3585-82e0-4f1d-bdf8-ad376c090f52	7e651849-cbb6-4c7d-9cbf-a6a8f3cbe36f	\N	1992-01-01	\N	\N	\N	\N	\N	1.73	28	\N	Male		\N	f	f	t	wrapped	W	A	P	A	\N	\N	t		f	1992A/1992C	76,81/37		2D.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
7a270137-bba5-4625-b00f-778e83459cfc	West	1.22	0.21	-0.26	4.15	-0.38	25-30	\N				black		\N		\N	\N	\N	\N	Measurements in 1992E\nage, gender, and hair details in 1992C\nBasket case\nOuter layer tied with red/white ribbon\nFine weave\nFringe\nInner layer of coarse linen, tied with torn strips\n7 samples	c12e2230-0845-449f-81c9-fb5c23443d84	cf00b40d-2097-42dc-b44b-62ef99735e8f	\N	1992-01-01	\N	\N	\N	\N	\N	1.59	14	\N	Female		\N	f	f	t	wrapped	W	A	P	A	\N	\N	t		f	1992A/1992C/1992E	150/83/67		2D.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
6860a197-1716-48ad-8549-f0372bc625a1		0	0	0	0	0		\N						\N		\N	\N	\N	\N		f166b30f-77c3-4ff8-9de1-368c6c16c81c	6fa9ed3c-fb61-487e-a24e-2fecba297de5	\N	\N	\N	\N	\N	\N	\N	\N	46	\N			\N	f	f	f						\N	\N	f		f				2D.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
d3048c20-32aa-49fb-80db-a73acd0932a3		0	0	0	0	0		\N						\N		\N	\N	\N	\N		86a8c724-db48-4684-87aa-21c70d01943a	628bba52-b875-42a5-bb5c-deba4305fcda	\N	\N	\N	\N	\N	\N	\N	\N	4	\N			\N	f	f	f						\N	\N	f		f				2D.07	3			\N	\N	\N	\N	\N	\N	\N	\N	\N
9c636011-3b74-4912-9f8c-df0b5fccb3ab	West	1	2.8	2.65	3.3	4.38	6 years	\N						\N		\N	\N	\N	\N	Some fabric showing on feet and head and a little on torso, appears to be a hurried burial\nSome red/white ribbon\nBuried face down just the head, body down\nCoarse linen tied with red/white ribbon\nFolded lower bundle on face	e3c4392c-7371-46dd-9182-6d23932128f5	9610eb57-6bbf-417e-946b-571ecc3c6de6	\N	1992-01-01	\N	\N	\N	\N	\N	1.12	15	\N	Undetermined		\N	f	f	t	wrapped - bones showing	H	C	S	C	\N	\N	f		t	1992A/1992C	54.63/31		2D.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
dea5525d-57c5-42ad-a851-88c19cb9f668	West	1.06	1.14	1.21	0.63	2.12	U	\N						\N		\N	\N	\N	\N	Wrapped with torn linen strips over outer med. coarse layer	cc7d4f9c-cfd9-46ee-93dd-af023ff92e3e	e568d75f-483b-41d4-8ba4-ab0b2a3ccbc5	\N	2005-01-01	\N	\N	\N	2005	\N	1.6	33	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	f		f	2005	75		2D.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
efaac7fd-1bba-4485-b0c2-1ffcd7be17d9	Undefined	0.78	1.14	0.7	1.42	3.05	35-40	\N				brown		\N		\N	\N	\N	\N	Large male adult\nWrapped in coarse linen wrap on body, nothing on head but decayed cloth\nWrapped with both red and undyed ribbon (photos)\nFound pubic hair, penis, fecal matter\nBody on palm sticks\nSeveral layer of coarse, medium, very coarse cloth\nBody was very black, probably body fat\nRed beard hair	0190120f-fca1-4951-b83f-741aeb345741	98b18403-1a48-4e3f-96de-1b8d654585ae	\N	1992-01-01	\N	\N	\N	\N	\N	1.75	24	\N	Male		\N	f	f	t	wrapped	W	A	P	A	\N	\N	t		f	1992A/1992E	42/21,23		2D.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
167bed49-9fbc-40d0-88b3-1c3f11f892f5		0	0	0	0	0		\N						\N		\N	\N	\N	\N		fd5bda5a-a50e-4b2c-bc59-1e5dccb094bc	8bcaa9a6-e69a-4367-b395-74d750729be3	\N	\N	\N	\N	\N	\N	\N	\N	33	\N			\N	f	f	f						\N	\N	f		f				2D.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
492f4da7-1d38-44ce-bf27-8a6ba4b0ca07	Undefined	1.2	5.2	4.95	-0.1	3.2	IV	\N				Brown		\N		\N	\N	\N	\N	Red/white ribbon, outer layer is fine cloth, next layer coarse fabric, wrapped with torn fabric, 7 layers of coarse fabric\nCan't find measurements, or details on age, or gender in field book that are described in database (TW)	9b620dd0-8fdf-4af0-b521-3ad5c1b47d99	4d8da4f7-484f-47ee-8511-a4314d4aa575	\N	1987-01-01	\N	\N	\N	\N	\N	\N	30	\N	Male		\N	f	f	f	W	W	A	P	U	\N	\N	t	U	f	1987B	86		2E.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
2cc97078-e10b-40ce-892d-72c235ece5c2	West	0.96	0.47	-0.06	4.44	-0.85	14-22 yrs	\N				dkbrwn		\N		\N	\N	\N	\N	Measurements in 1992E\nage, gender, and hair details in 1992C\nTied with red/white ribbon and also brown/white linen over medium weave - linen\n5 samples	ced08802-7d6e-4982-9359-b32192898e9f	fc3c6b85-f7c3-4afb-a96c-b93fc9b57476	\N	1992-01-01	\N	\N	\N	\N	\N	1.7	12	\N	Male		\N	f	f	t	poorly preserved	B	A	P	A	\N	\N	t		f	1992B/1992C/1992E	12/85/67		2E.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
6f12c218-7455-4fcb-814d-2f77b0126b9c	Undefined	1.2	3.4	3.15	3.28	5.09	IV	\N				Brown		\N		\N	\N	\N	\N	Body wrapped, outer layer medium weave, red/white ribbon\nNo definate arrangements to ribbon evident on chest but visible on legs\n5 layers of coarse fabric next to head all badly decomposed - no samples\nMore details on wrapping in 1987B field book\nCan't find details on age, gender, and hair in field book that are described in database (TW)\nCan't find measurements in the field book that are noted in the database (TW)	4df6e41a-b81d-4106-81d7-ab9860b65f81	03190ca1-c1c8-413e-8da2-782db8c9dee7	\N	1987-01-01	\N	\N	\N	\N	\N	\N	17	\N	Male		\N	f	f	t	W	W	A	P	U	\N	\N	t	U	f	1987B	49		2E.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
2a43a395-c2b3-4182-a5a2-5258e68dc49a	West	1.15	2.25	2.02	0.78	2.54	50	\N						\N		\N	\N	\N	\N	Can't find details on age, gender, or hair for this the burial in field book that are described in database (TW)\nBeads found on stomach of #35\nAlso green metal fragments and fiber found under chin\nLarge mumy\nOnly fabric on face and feet\nRed/white ribbon ties\nOuter wrap of medium weave linen\n6 layers of coarse linen next on head	287aeaa7-be9d-4d2c-964a-9d7741386264	6456842a-4e46-4026-9216-7c94c7b635df	\N	1992-01-01	\N	\N	\N	\N	\N	1.65	35	\N	Male		\N	f	f	f	poorly preserved	B	A	P	A	\N	\N	f	Y	f	1992A	92-101		2E.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
690553e1-5ac0-4bf5-837f-4a2369691fb8		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	39cf3212-0582-451f-ab0a-a7bb8182a88f	\N	\N	\N	\N	\N	\N	\N	\N	6	\N			\N	f	f	f						\N	\N	f		f				2E.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
0012ff16-4e81-4cef-b16b-7ef1816f1535	Undefined	0.1	4.75	4.75	1.65	1.65	11-12 yrs old	\N				dkbrwn		\N		\N	\N	\N	\N	Details about teeth available on page 12\nBody has been compressed with pelvis alongside vertebrae\nJust a skull and a few bones\nSome wrapping with black strips like\nYellow cloth - Appears to be a yellow robe - a square design or stripe	15f2c6ed-2b40-4596-8734-ed7424f94ddf	2dd25426-a489-4742-96d4-599f1e136aa3	\N	1992-01-01	\N	\N	\N	\N	\N	\N	8	\N	Male		\N	f	f	t	bones and skull	B	C	S	C	\N	\N	t		f	1992A/1992D	13/5		2E.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
e26c7be4-4e16-4d69-9f52-10f91c820200	West	1.1	2.62	2.42	2.87	4.48	U	\N						\N		\N	\N	\N	\N	1 adult and 3 children buried together (13,14,17 and 18)	a059f108-1f05-46b9-8851-0be37a6a7e91	ea6b81dd-c931-4ffc-8003-f7a512109d61	\N	1997-01-01	\N	\N	\N	\N	\N	1.75	14	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	t		f	1998	31		2E.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
2c942ebd-5e5e-4ba3-b76d-1567229f138c		0	0	0	0	0		\N						\N		\N	\N	\N	\N	Humerus only - no identification number	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	t	t	f						\N	\N	f		f				2E.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
6cdd43c8-123b-443a-9d43-a8485752a4c1	West	1.53	1.94	1.19	2.31	3.92	25-30	\N				dkbrwn		\N		\N	\N	\N	\N	gender, age, and hair in 1992C\nLong body - broken during removal\nPart of outer layers in fair condition\nRed/white ribbon, coarse linen 3 cord weave, repeated in next layer, 4 coarse linen, fringed blanket 102 cm wide\nPhoto of salt in cloth\n5 samples	8478a91b-8c39-4ec5-b143-2b52a5dbcca7	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.89	25	\N	Male		\N	t	t	t	wrapped	W	A	S	A	\N	\N	t		f	1992B/1992C	19,31/111		2E.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
6bf00338-5973-4ba3-82d2-066ad22ff882		0	0	0	0	0		\N						\N		\N	\N	\N	\N	2 bones	\N	9232695e-484b-48e3-8266-1ac98f5ad5e9	\N	\N	\N	\N	\N	\N	\N	\N	9	\N			\N	t	t	f						\N	\N	f		f				2E.10	11			\N	\N	\N	\N	\N	\N	\N	\N	\N
826615db-16ff-4381-8cf6-2445f722089f		0	0	0	0	0		\N						\N		\N	\N	\N	\N	Bag	\N	4238b846-458b-433d-84ce-8164a4f67ac8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	t	t	f						\N	\N	f		f				2E.11	9			\N	\N	\N	\N	\N	\N	\N	\N	\N
719ddf65-0a14-4e3f-906f-541c0c55daf4	West	0.75	0	0.19	0	1.1		\N						\N		\N	\N	\N	\N	Can't find gender, age, or hair details in field book that are described in database (TW)\nBasket case\nRed/white ribbon\nFine and coarse linen	60146830-372d-4243-a983-406b7db12b38	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	26	\N	Undetermined		\N	t	t	t	poorly preserved	B	A	U	U	\N	\N	f		f	1992B	20,28		2E.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
ac05f4ee-507a-4f5a-8b81-be5ef4de5319		0	0	0	0	0		\N						\N		\N	\N	\N	\N		4b8443cd-ae53-4b65-b43c-b785b0ebfa83	664a0598-d7ab-49c0-a14d-7421cdce1843	\N	\N	\N	\N	\N	\N	\N	\N	6	\N			\N	f	f	f						\N	\N	f		f				2F.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
df520312-c1c3-495a-aea2-a86e90ac48fb	West	0.84	3.22	3.49	3.83	5.36	U	\N						\N		\N	\N	\N	\N	partly in 30/40E	88113b59-595a-4696-b660-607058031e6f	291aacb0-7fcd-4ec3-8e06-052f4fa8bb06	\N	1997-01-01	\N	\N	\N	\N	\N	1.78	7	\N	Undetermined		\N	f	f	t		W	U	U	U	\N	\N	t		f	1998	20		2F.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
37f1863b-36a9-4e71-8655-f0c15876084b	West	1.85	1.13	0.7	2.15	3.6	U	\N						\N		\N	\N	\N	\N	Cluster burial with another child #50 and an adult buried beneath #52\nStar ribbon pattern on top of head\nColor wool- green purple red by head\ndiagonal ribbon pattern over body with horizontal over legs\nlimestone slabs vertically placed to the south of 50 and 51	2bd3c107-b1a7-4ba6-98d5-dcca64c1fcbc	f80402b4-91c3-4898-83af-0844ac1de126	\N	2009-01-01	\N	\N	\N	\N	\N	1.55	51	\N	Undetermined		\N	f	f	f	very good	W	C	U	C	\N	\N	t		t	2009	77		2F.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
2de0b196-b011-47c4-acaa-30d04baa4c79	West	0.6	0.7	0.9	4.45	5.22	U	\N						\N		\N	\N	\N	\N	A child buried directly on top of and adult (24)\nred, green wool strip visible at feet	4ae48abd-8f42-4012-8b0b-54d3f5a7503d	71ffa8e7-d8c9-4eed-a467-b8f5211ff56e	\N	2009-01-01	\N	\N	\N	\N	\N	0.87	21	\N	Undetermined		\N	f	f	f	badly preserved	U	C	U	C	\N	\N	t		f	2009	47		2F.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
179f5bae-8324-4f48-9c44-80053d22b305	West	2.45	3	2.87	3.84	5.52	U	\N						\N		\N	\N	\N	\N	Mostly skeletalized with some coarse textiles	c849629e-78f4-4076-8e9b-f39812264a95	57f701f3-9062-4e9e-a29a-843de96082d4	\N	2005-01-01	\N	\N	\N	2005	\N	1.76	27	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2005	65		2F.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
f78a062c-0c07-4892-9e56-4ce47c3ee58a	West	0.5	3.35	3.07	0.67	1.62	U	\N						\N		\N	\N	\N	\N	Small nearly intact (some of rim broken)	1626cb86-1a81-4025-82e3-d63d9b46356d	c4fcf7da-55df-4568-8554-d24e071bfccb	\N	1998-01-01	\N	\N	\N	\N	\N	1.07	7	\N	Undetermined		\N	f	f	t		W	U	U	U	\N	\N	t	Y	f	1998	97		2F.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
5a8f7ed4-4594-4dd4-a79c-c6d8889a1e6c	West	1.52	1.12	0.87	4.63	5.93	U	\N						\N		\N	\N	\N	\N	well wrapped with thin stone placed vertically near head of burials	c6141555-1f6c-416f-a951-faf9cfc4c47f	c67a3a29-d807-436a-a5d7-f6ace474981b	\N	1998-01-01	\N	\N	\N	\N	t	1.4	47	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	125		2F.09 and 2F.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
5943c7de-51ad-4ba6-b276-fb45cba4a3d5	East	2.31	4.33	3.7	1.74	0.12	U	\N						\N		\N	\N	\N	\N	head-east in a chamber off-set from the shaft with other burials in the shaft above	bf8f4214-5b1b-434f-adfe-ad804ea5324a	5d057c99-1247-425b-aa09-d3446a08aba9	\N	1998-01-01	\N	\N	\N	\N	t	1.63	33	\N	Undetermined		\N	f	f	t		B	A	U	A	\N	\N	t		f	1998	41		2F.11 and 2F.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
b1fd6cd9-b339-4f9f-aae6-b86b64e8ceed		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	9dbcdd7a-ccd2-4c38-8a02-24e20505cc35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	f	f	f						\N	\N	f		f				3B.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
dbbe718e-8e83-4fc3-85b0-0fb802fd07a6		1.06	2.86	2.75	3.37	4.47	5-Apr	\N				blond		\N		\N	\N	\N	\N		9bd9be7f-0540-449b-ad12-68edcf7f6410	f27fed9f-169c-4232-9be5-a89824d7630c	\N	\N	\N	\N	\N	\N	\N	\N	5	\N	Undetermined		\N	f	f	f	wrapped	W	C	S	C	\N	\N	t		f				3B.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
1b275c58-26d9-49f4-a6b0-0747db51efec		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	83914335-7c2a-4125-877b-6a5110e62718	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	f	f	f						\N	\N	f		f				3B.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
629f37cd-8b3d-481b-8854-18f7fe0cc4c6	Undefined	0.9	2.5	2.5	3.6	4.59	IV	\N				dkbrwn		\N		\N	\N	\N	\N	Only fabric left was on femur\nOuter cloth medium weave wrapped with red/white ribbon\nCan't find burial measurements, or details on hair, age, or gender in the field book that are noted in the database (TW)	92974ba8-e773-4821-8629-2b1034a3c940	64491481-f732-470e-b257-761b7cc86418	\N	1987-01-01	\N	\N	\N	\N	\N	\N	18	\N	Male		\N	f	f	t	S	B	A	P	U	\N	\N	t	U	f	1987B	77		3B.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
6df0c3dc-69a9-48b8-915f-c6124692fe0b	East	2.2	2	1.6	3.3	2.65	35+ years	\N				Brown		\N		\N	\N	\N	\N	Poorly preserved\nReversed burial\nCan't find details on hair, gender, or age in the field book that are described in the database (TW)	70ea0c9f-b0ff-4ce5-bf8f-f4fe7fc5cafc	4d4087d6-010a-47c5-b22e-b693fe94f9ab	\N	1987-01-01	\N	\N	\N	\N	\N	1.55	35	\N	Female		\N	f	f	f	poorly preserved	B	A	P	A	\N	\N	t		f	1987A	104		3B.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
8aa20af8-8abf-4862-87a9-2698cd5d1bcd	West	2.34	0.73	0.2	5.15	1.58	U	\N						\N		\N	\N	\N	\N	skeletalized remains deep in shaft	2e7fd023-81fa-4de4-a495-d5ec38f5f441	1680a6cd-2526-4fa3-9891-7c49606b8397	\N	1998-01-01	\N	\N	\N	\N	\N	1.68	39	\N	Undetermined		\N	f	f	t		B	A	U	A	\N	\N	t		f	1998	119		3D.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
34d8fff9-16a8-4d99-ad79-30a69017d87a	West	0.95	2.87	3.03	0.9	2.31	U	\N						\N		\N	\N	\N	\N	female ceramic figurine found with this burial\nwrapped with red ribbon\nlots of shards, late 2nd cent\nroman\nsmall face bundle\ncalled "youth" on page 132	8447b202-f5f1-46dc-9b2b-dffa98995e82	22c3c712-2daa-4da3-b9b7-aefc22e55732	\N	1997-01-01	\N	\N	\N	\N	\N	1.49	5	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t	Y	t	1998	21		3B.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
caea6b34-a885-46e9-a6a1-820e9164198c	West	2.6	3.4	3.3	2.7	4.3	U	\N						\N		\N	\N	\N	\N	Bottom of shaft\nGebel underneath\nTwo pieces of late 1st century early 2nd century pot found in shaft 250cm down\nskeletalized	cb0342e7-1729-445d-b39d-e353934aef6e	baff508c-3a48-4fdc-8de0-81e1d3a44818	\N	2009-01-01	\N	\N	\N	\N	\N	1.7	54	\N	Undetermined		\N	f	f	f		U	A	U	A	\N	\N	t		f	2009	81		3B.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
25540199-3153-4c00-9ead-7eecb8eef48d		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	38738ab8-2815-4913-b6c1-86696bb5c99f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	f	f	f						\N	\N	f		f				3B.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
f5014532-4334-403b-a818-06a4318defa9		0	0	0	0	0		\N						\N		\N	\N	\N	\N		f570425d-3bcd-4b48-8101-57e80cef5309	e3736d27-d3ae-4483-a487-cc58382d98e2	\N	\N	\N	\N	\N	\N	\N	\N	48	\N			\N	f	f	f						\N	\N	f		f				3B.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
11a4a7b1-8c4a-44cc-9159-c531b368c4f9		2.14	-0.1	0	2.17	0	U	\N				U		\N		\N	\N	\N	\N	Same cluster details as above	e6726357-a03f-440c-b2ba-575289efd1ad	6605b0a9-709e-4086-92c0-86f8631d5c5b	\N	2003-01-01	\N	\N	\N	\N	\N	\N	32	\N	Undetermined		\N	f	f	f		U	U	U	U	\N	\N	f		f	2003	35		3B.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
001c8dac-0f7e-4a7f-ac16-fdd47fca4262	West	0.2	3.7	4.09	0.2	1.9	22 years	\N				dkbrwn		\N		\N	\N	\N	\N	Measurements in 1992E\nage, gender, and hair details in 1992C\nWrapped in bamboo poles tied with coarse rope\nMultiple layers of coarse linen\nSome red wool - also yellow\n5 samples	48abe78d-f8fb-42f3-89b0-58742500f1b8	57505e6d-230e-4fb9-a6ac-13073bff1324	\N	1992-01-01	\N	\N	\N	\N	\N	1.65	15	\N	Male		\N	f	f	t	wrapped	W	A	P	A	\N	\N	t		f	1992B/1992C/1992E	7/87/66		3B.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
00064d4c-0adc-4e9c-b95f-d01345e5bd96		0	0	0	0	0		\N						\N		\N	\N	\N	\N	Odd Wormian bones	\N	a9168617-587a-46cb-afb3-587cc9208e00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	f	f	f						\N	\N	f		f				3C.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
e8c8e294-2380-437b-8e9d-05ffee98125e	West	1.2	3.19	3.3	3.65	4.5	U	\N						\N		\N	\N	\N	\N	adult beneath cluster burial of 5 children\ntop of a mid-late mud c-pot associated with this burial\nhead to lower abdomen uses torn linen strips\nknees down uses rope fiber\nlinen over foot wrapped over top\nfine plain weave piece placed over top, shroud around body is unbalanced basket weave\nThe limestone: Previously thought to be a "wall" protection for the multiple children bural NOW it appears to be a protection for another burial to the north of the cluster	dde4f069-9c3e-45da-a8a3-b3b51e4de81f	f80da71d-abff-4015-b16b-8544eff1fed0	\N	2009-01-01	\N	\N	\N	\N	\N	9.69	17	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	t		t	2009	37		3C.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
609b950b-baae-4331-b280-9c16573089fe	West	1.1	3.48	3.9	3.7	5.09	U	\N						\N		\N	\N	\N	\N	Buried with another adult(23) - both just north of #17\nBody is wrapped with ribbon over shroud with small face bundle\nleather thong 2cm wide and a twin strip through the bell hole, but the wider one goes through the loop of the bell.\nUnidentified substance inside bell\nbelow bell a toe of a sandal and other fragments to make a whole sandal	43c40196-6211-4121-9141-d82fa5713857	b85ea11b-030e-4ec5-bea0-a62adbd5cc10	\N	2009-01-01	\N	\N	\N	\N	\N	1.25	22	\N	Undetermined		\N	f	f	f		H	U	U	U	\N	\N	t		t	2009	45		3C.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
83c23b6c-17d9-465f-a589-1d2c8cd3593f	West	0.16	1.2	1.47	-0.2	1.26		\N						\N		\N	\N	\N	\N	Numerous limestone slabs covering burial which is close to surface\nOyster next to right side; some red spots (from iron deposits?)\nRibbons wrapped around in normal criss cross pattern\nLots of tooth attrition, bad overbite\nskull exposed	e6cfd54b-faa5-4e7b-b6fe-7a8415ae8650	659f8bdd-005b-46d3-8032-6b56d2878b9b	\N	2010-01-01	\N	\N	\N	\N	\N	1.58	21	\N	Undetermined		\N	f	f	f	Basket	B	A	U	A	\N	\N	t		f	2010	45		3C.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
489385bb-a43e-4878-b80f-f1188a80dd74	West	0.8	1.4	2.35	4.3	5.72	U	\N						\N		\N	\N	\N	\N	face bundle\nlower leg bones revealed\npurple/burgundy ribbon\non top of this burial there is a dark brown curly haired skull\ncloth over face bundle has 7cm open weft, unique!\ntwo twisted "breath of life" symbols\nBurgandy ribbon & indications of cloth - possibly decor within the linen theme - too deteriorated to know without further study of piece.	13bf89fc-79ae-4548-8210-a0d03bc69006	0373af60-ce66-4352-a330-d70c02317f55	\N	2009-01-01	\N	\N	\N	2018	\N	1.7	10	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	t		t	2009	25		3C.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
dae9ff02-dbb4-4608-9414-bf4039dda756	West	1.56	1.37	1.03	4.4	5.87	U	\N						\N		\N	\N	\N	\N	well wrapped with thin stone placed vertically near head of burials	bd8f6f06-2aa0-4188-8aa6-5fb39c6b90be	8ccb6dbf-b1ab-4bc6-b96a-1f912abbf3ee	\N	1998-01-01	\N	\N	\N	\N	\N	1.58	46	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	125		3C.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
926ddeac-99a6-4940-a6e5-79e2a03a100e	West	1.2	0.54	0.75	0.27	0.95	U	\N						\N		\N	\N	\N	\N	Brightly colored clum on burial	48b5c788-e273-4c09-b2c9-bc55e7284f3d	1f1f39e6-d6dc-4b35-b542-d64667871645	\N	1998-01-01	\N	\N	\N	\N	\N	0.75	49	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	51		3C.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
516b050a-d516-49f5-9b87-ee091138050a	West	0.95	0.81	0.42	2.74	3.47	U	\N						\N		\N	\N	\N	\N	Part of a cluster with 1 adult and 3 children	08a03d2f-6181-477e-b524-af2a5d7a0b43	e6221e4c-ada6-4756-8ef5-ed148c01a736	\N	1998-01-01	\N	\N	\N	\N	\N	0.89	17	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	105		3C.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
50e808b5-0f46-4453-892f-ae9af9dd578e	East	1.92	3.35	3.76	1.5	-0.07	U	\N						\N		\N	\N	\N	\N	adult reversal (head-east) in an offset chamber on the north side of the mud brick wall	b816871f-bc99-4fcc-8b66-a397f1dedf12	f3c3195c-8941-4441-9db5-4d8d79d4b0eb	\N	1998-01-01	\N	\N	\N	\N	\N	1.69	35	\N	Undetermined		\N	f	f	t		B	A	U	A	\N	\N	t		f	1998	115		3C.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
e020b1b9-7e95-498b-9605-38a849a3fd23	West	0.93	1.61	1.8	0.08	1.2	U	\N						\N		\N	\N	\N	\N	wrapped, with face bundle, but deteriorated	a18d0b02-aa46-4ea6-bf9a-4511444dd496	bae3170a-0f1b-44f3-98d0-1f0f44382791	\N	1998-01-01	\N	\N	\N	\N	\N	1.19	44	\N	Undetermined		\N	f	f	t	deteriorated	W	C	U	C	\N	\N	t		t	1998	49		3C.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
970ea77e-fd36-4c3a-ba4f-4944d1439934		0	0	0	0	0		\N						\N		\N	\N	\N	\N		7907b229-8c6f-40e5-b133-f85ebef209ae	f51d964b-66ed-4448-989c-61f05c3a6607	\N	\N	\N	\N	\N	\N	\N	\N	46	\N			\N	f	f	f						\N	\N	f		f				3C.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
5791255c-d5b5-441b-be81-497f73038f53		0	0	0	0	0		\N						\N		\N	\N	\N	\N		860763ac-15a8-4dee-9474-c6c24fe1553f	b22a80f7-3728-4e2a-b363-78202c8e7985	\N	\N	\N	\N	\N	\N	\N	\N	17	\N			\N	f	f	f						\N	\N	f		f				3D.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
58379bb4-ccba-4312-8ae2-b9e182fb74de		0	0	0	0	0		\N						\N		\N	\N	\N	\N		a9869eb5-cec5-43c8-8fbd-c46b26b2e461	fc6c860a-51b1-47ce-a620-a55e3e3fcc24	\N	\N	\N	\N	\N	\N	\N	\N	40	\N			\N	f	f	f						\N	\N	f		f				3D.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
6676571e-7ed4-40a3-bb3d-2c26dbd08c56	West	1.65	1.35	1.41	4.65	-1.3	U	\N						\N		\N	\N	\N	\N	Face bundle	ceebb896-c172-412a-9b7f-69433ccb50be	101d2aa3-ba26-485b-bff7-bc7eb4aec613	\N	2009-01-01	\N	\N	\N	\N	\N	1.72	66	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	t		t	2009	99		3D.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
b00127cb-71bc-4a67-b97f-84bddb16f6ed	West	2.02	1.05	0.74	4.9	6.53	U	\N						\N		\N	\N	\N	\N	burial #53 beneath #52	398a2df5-a002-4eb4-bd8e-797997a068a9	13b1eea5-6d9b-43a1-926b-bcd570a82cfe	\N	1998-01-01	\N	\N	\N	\N	\N	1.63	53	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	129		3D.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
bbf9875a-94e5-44cf-9f60-496f5260ab07	Undefined	0.94	2.38	2.33	4.61	5.3		\N						\N		\N	\N	\N	\N	Depth: 94 cm head, 95 cm feet\nNo head - small child\nnestled over right side of #10 and next to left side of #7	1d73ee07-05b9-4616-ac39-075322f6c5ff	8c90f56b-9ab6-4b91-9260-7b730270ac84	\N	1994-01-01	\N	\N	\N	\N	\N	0.72	11	\N	Undetermined		\N	f	f	t		B	C	U	C	\N	\N	t		f	1994A	21		3D.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
7b6c4246-40d7-4891-a348-cb6e3cb2d250	West	2.1	4.76	4.59	3.54	5	U	\N				black		\N		\N	\N	\N	\N	In a shaft divided by limestones placed vertically in the shaft\nOuter wrap has yellow, green, purple, red (much like "beauty" of many colors, but poorly preserved	18622b0e-c4fb-4af3-866f-4b86f58c6380	4fde4806-5b2d-4e1d-8b7b-7355070fb83a	\N	2003-01-01	\N	\N	\N	2002	\N	1.46	19	\N	Undetermined		\N	f	f	f	poorly preserved	W	U	U	U	\N	\N	f		f	2003	23		3D.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
27187a62-968d-49be-91a4-d9afd3389185	West	1.77	1.5	1.42	0.36	1.98	U	\N						\N		\N	\N	\N	\N	burial #52 is in a shaft slightly north and below #51	02ca3e5d-0077-443d-8587-2671c5af2165	7618b681-a571-43f9-bf68-95d080387e8e	\N	1998-01-01	\N	\N	\N	\N	\N	1.74	52	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	52		3D.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
d29b6f68-96ee-4a2e-96c0-67e412daf6f5	West	2.4	2	3.29	0.17	1.17	U	\N						\N		\N	\N	\N	\N	Not a reversal\nPrevious 2 reversals above this offset chamber\nbricks are blocking an offset chamber - salt crystals in chamber\nbaby underneath and behind the mud bricks\nbadly deteriorated - no textiles\nthis rotation does not corresopnd to SE 1-6. SE 1 could be above this burial, but it is not a reversal. 2-6 are not in this part of the area.	4345030b-ee74-494b-beb5-18c79b4f46f2	0ca0ac1a-a82a-4b72-841e-83275264df61	\N	2007-01-01	\N	\N	\N	2006	\N	1	7	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2007	38		3D.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
3f74c91c-4c12-443d-b5df-6522c32971d8	West	0.73	4.17	4.42	2.62	4.12		\N						\N		\N	\N	\N	\N	colorful red ribbon with usual criss cross pattern\nAlias "Bill"\nLimestone covering (dimensions described in field book)\nface bundle	e8b92cc4-8973-4d40-b644-a2b5560144c3	b728015d-621c-450b-989e-9a57d92533ce	\N	2010-01-01	\N	\N	\N	\N	\N	1.62	11	\N	Undetermined		\N	f	f	f		U	A	U	A	\N	\N	t		t	2010	25		3D.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
66d44bbe-4d6e-4011-a106-9619c8efdad7		1.5	1.72	2.2	1.44	2.82	40++	\N						\N		\N	\N	\N	\N	wrinkly head	d6b4d2e0-e031-42f8-8d00-6ef328353d0d	bb90dadc-9391-4ddb-8bda-277f9ef751f4	\N	\N	\N	\N	\N	\N	\N	\N	29	\N	Female		\N	f	f	f	SKELETON	B	A	P	A	\N	\N	f		f				3D.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
51f4e7ac-f451-48c3-9590-afedd001b967	East	0.81	0.95	1.01	3.04	4.5		\N						\N		\N	\N	\N	\N	Large amount of hair\nThere are pieces of textiles found\nThe limestone rocks on the south side seem to be protecting the heads and body	ada60582-dc91-4503-8b2f-eb84997041aa	a03f3022-a284-461b-b8e4-ad1e76241309	\N	2010-01-01	\N	\N	\N	\N	\N	1.65	19	\N	Undetermined		\N	f	f	f	fair	H	A	U	A	\N	\N	t		f	2010	41		3D.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
60f71172-15da-440b-9641-efdca1d47c6c	West	1.23	1.8	1.83	1.17	2.52	55+	\N				brown		\N		\N	\N	\N	\N	Measurements in 1992E\nage, gender, and hair in 1992C\nWell wrapped feet and heat\nUndyed ribbon\nOuter wrap of 3 cord weave\n3 fringed - 3 cord weave blanket - 3 unfringe\n5 samples	dbc7c86c-bc06-43de-bdaf-8237534e382f	786a60eb-c871-45fe-b31c-f6ef5b820c55	\N	1992-01-01	\N	\N	\N	\N	\N	1.44	48	\N	Female		\N	f	f	t	wrapped - bones showing	H	A	P	A	\N	\N	t		f	1992A/1992C/1992E	137/71/61		3E.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
d4b33fc3-a839-4095-b638-a99272fb5bed	West	1.7	3.73	3.49	2.48	3.16	U	\N						\N		\N	\N	\N	\N	Limestone blocks protecting body on south side	d451a891-35a2-4a53-acce-ad80eda8f787	0c7e17b6-54af-4912-b6a8-9ddf7f41a251	\N	2009-01-01	\N	\N	\N	\N	\N	0.78	42	\N	Undetermined		\N	f	f	f		U	C	U	C	\N	\N	t		f	2009	63		3E.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
12702700-beec-41e5-a271-7aa97bec4d4d	West	0.85	3.75	4.5	2.04	3.48	U	\N						\N		\N	\N	\N	\N	adult wrapped with loose face bundle linen strips in area of head\nrep cap\nbody caved in at abdomen\nsmaller skull emerging under the head and shoulders\n2 limestone blocks in site of 4 likely on south side	d36cc1cc-78fc-4ce3-b2f5-2f508644ff07	f62c3055-7c9e-404d-8cf6-3fd0b3782b5b	\N	2009-01-01	\N	\N	\N	\N	\N	1.67	7	\N	Undetermined		\N	f	f	f	Preservatino index = 4	W	A	U	A	\N	\N	t		t	2009	21		3E.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
085ff608-e560-49b9-b67d-ad1450daba19	West	0.8	0.1	0.1	-0.32	1.34	U	\N						\N		\N	\N	\N	\N	Cluster burial\nFine linen shroud\nOver the feet of woven veg. fiber shroud neck\ndeteriorated head. Indications of face bundle but most is missing\nred and white ribbon liberally woven in diagonal pattern	e15afc69-817b-426a-ac09-5deb3eda79ec	112fff18-942a-4c94-955a-f9aed4acfa1e	\N	2009-01-01	\N	\N	\N	\N	\N	1.7	60	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	t		f	2009	89		3E.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
568caa8d-50d4-41d8-8b9e-3dee1cae25b6	West	1.2	0.65	0.7	1.37	2.9	U	\N				U		\N		\N	\N	\N	\N	Burial with stones of uneven dimension on south side of the burial\nFeet with red ribbon and orange thread woven in coarse linen\nPalm found with sticks (3) visible along lenth of burial inside wrapping	796809ff-7c2b-4b1a-afd3-d4cdee89828d	4c1a7ff6-e3dd-4a2b-8e7b-ca3ddd6df805	\N	2003-01-01	\N	\N	\N	2002	\N	1.73	18	\N	Undetermined		\N	f	f	f		H	A	U	A	\N	\N	f		t	2003	23		3E.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
5d8c5d07-cc73-4840-80dc-88fcb17ba6f2	West	1.05	3.65	3.7	2.1	3.1	U	\N						\N		\N	\N	\N	\N	child burial-left hand over pelvis, right hand along side of body\nfine linen over coarse linen\nmuch skin on arms, legs, etc\nno burial goods	cebb2811-3a13-4883-a789-a8092a9c28af	5f897134-7be6-40d5-85bb-e2f420971bb0	\N	2009-01-01	\N	\N	\N	\N	\N	1.02	11	\N	Undetermined		\N	f	f	f		B	C	U	C	\N	\N	t		f	2009	27		3E.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
f9c5acfd-bea4-40bf-80fe-1d8b41f01378	West	1.14	1.04	0.99	-0.76	0.95	U	\N						\N		\N	\N	\N	\N		38157993-454f-4ca8-a2af-9e74ab313b4d	05bc223f-fed1-4f67-a67a-c53b3752bf7d	\N	1998-01-01	\N	\N	\N	\N	\N	1.8	48	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	50		3E.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
2ae694eb-d203-4c6a-99ac-377032b54c65		2.14	0	0	1.87	0	U	\N				U		\N		\N	\N	\N	\N	In offset chamber to south of shaft on south side of area there is a deep cluster of 4 burials. They cannot be taken out totally, since they extend under an unexcavated area which is unstable - we will measure and remove cranium - study what we can	caa51268-d2cd-4376-a693-53cf305d77c2	968edef7-1f05-4a9c-9704-0c097f04c371	\N	2003-01-01	\N	\N	\N	\N	\N	\N	30	\N	Undetermined		\N	f	f	f		U	U	U	U	\N	\N	f		f	2003	35		3E.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
3ac277b3-eb97-4897-a1b0-2c258403a1ee	West	1.47	1.79	1.69	1.61	3.02	U	\N				dark brown		\N		\N	\N	\N	\N	On the north side of the stones\nReed fabric at knees\nSmall cup found nearby	38b2ffd2-f2c6-4122-ac32-9630191e3b5e	439468d1-06ec-4144-8672-06191802fd0a	\N	2003-01-01	\N	\N	\N	2002	\N	1.55	25	\N	Undetermined		\N	f	f	f		H	U	U	U	\N	\N	f	Y	f	2003	27		3E.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
d8c5603a-b137-4110-bb86-9ca38edbd960		0	0	0	0	0		\N						\N		\N	\N	\N	\N		f6eaae6f-a83d-445d-997c-dd9147c9b26f	016091ca-a053-41fd-a3bb-1ba7df95c8cf	\N	\N	\N	\N	\N	\N	\N	\N	33	\N			\N	f	f	f						\N	\N	f		f				3E.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
56d73e38-23f2-47e9-b709-4d4706e49b30	West	0.3	1.6	1.9	0.7	2.1	U	\N				brown		\N		\N	\N	\N	\N	yellow and red cloth	c27614d6-21f4-4bce-b836-3ad1b2ca12c8	cfb00655-d225-4357-91d2-978001c0a968	\N	2003-01-01	\N	\N	\N	2002	\N	1.6	2	\N	Undetermined		\N	f	f	f		U	U	U	U	\N	\N	f		f	2003	7		3E.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
aa653b9f-731a-423f-8a4c-73a0e1b5a943	West	1.52	1.63	1.72	-0.86	8.6	U	\N				U		\N		\N	\N	\N	\N	Wrapped, but not much left - red ribbon, most cloth at feet	fe2807a7-485b-4de5-9fd1-a4e8623a10ca	c0c9f22f-b672-44de-be50-2867766b78cb	\N	2003-01-01	\N	\N	\N	\N	\N	1.63	28	\N	Undetermined		\N	f	f	f		W	U	U	U	\N	\N	f		t	2003	33		3E.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
81e7547e-805f-45cc-a696-1604905c044b		2.4	2.8	2.9	2.1	1	U	\N						\N		\N	\N	\N	\N	Head East	42044760-6060-4e17-9aac-d27f5347283c	cbfb5847-009c-4321-a4db-126505153d7e	\N	\N	\N	\N	\N	2006	\N	\N	26	\N	Undetermined		\N	f	f	f		W	C	U	A	\N	\N	t		f				3F.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
0e7db89f-99e6-4743-a723-d00535a5b052	West	1.46	2.57	2.54	2.75	1	U	\N						\N		\N	\N	\N	\N	Very deteriorated - missing left femur\ntorn ribbon wrap on lower legs and feet\ncriss cross pattern over linen shroud\nfringe over feet	e058d664-1eef-454a-89a3-0c32777c34a3	dee8ee1f-59ac-4bd1-b272-2fcd80d06451	\N	2007-01-01	\N	\N	\N	2006	t	1.75	6	\N	Undetermined		\N	f	f	f		H	U	U	U	\N	\N	f		f	2007	32		3F.02 and 3G.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
cef1f182-6408-4476-9166-25850e76863c		1.35	3.1	3.25	3.1	5	U	\N						\N		\N	\N	\N	\N	In a shaft on the east side of SE area	3a00da24-64bd-4579-b780-1c83c53bdf73	8d740b01-629c-4b58-8947-d327956c4af6	\N	\N	\N	\N	\N	2006	\N	\N	25	\N	Undetermined		\N	f	f	f	good	W	A	U	A	\N	\N	t		f				3F.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
721d1b83-cd8e-49bf-a3d3-35758cf52809		0.51	2.04	2.04	1.17	1.17	U	\N						\N		\N	\N	\N	\N	In the midst of plundered burials	d3e1f648-edd8-409d-986e-df7f47fb87b0	f418cf76-de5b-48c1-907e-5afcf97bb29d	\N	\N	\N	\N	\N	2006	\N	\N	19	\N	Undetermined		\N	f	f	f		B	A	U	A	\N	\N	t		f				3F.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
8db96b62-9912-42b4-b76b-14ee088fbb51		1.68	4.12	4.17	0.25	0.8	U	\N						\N		\N	\N	\N	\N		8ca62efb-14bc-4dfe-a337-bb6b8d146c27	ae01e055-a443-44cc-a973-986b980e268a	\N	\N	\N	\N	\N	2006	\N	\N	37	\N	Undetermined		\N	f	f	f		W	C	U	U	\N	\N	t		f				3F.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
e699dc46-23ac-4a61-ad72-6f251780bf5d		1.45	2.9	2.65	3.25	4.45	U	\N						\N		\N	\N	\N	\N		35a7c2f8-7a3d-4b21-be71-190a5a779e6d	8b1c5bd2-617f-4b1c-9be1-2896d9e30682	\N	\N	\N	\N	\N	2006	\N	\N	31	\N	Undetermined		\N	f	f	f		W	C	U	A	\N	\N	t		f				3F.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
49ea6362-8cd7-4b68-a331-4bc7e1da53b1		0.95	1.1	1.1	0.6	0.6	U	\N						\N		\N	\N	\N	\N	Good textiles and mud Bricks associated with burial	98aab187-8f52-4eba-bf64-bb18391ffa65	4eb429c3-9112-425b-b88a-df66946186d4	\N	\N	\N	\N	\N	2006	\N	\N	36	\N	Undetermined		\N	f	f	f	bad	B	C	U	A	\N	\N	t		f				3F.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
72f6e5d7-2d65-4b7a-9c2e-60eca2dd5101	West	0.95	2.36	2.37	-0.48	1.07	U	\N						\N		\N	\N	\N	\N	Linen wrap, torn and folded linen ribbon	c83a81e3-3501-4b21-afad-1b51045b856c	b41a1fa0-8ca6-4182-89d1-acfb3c471859	\N	2007-01-01	\N	\N	\N	2006	\N	1.53	2	\N	Undetermined		\N	f	f	f		W	U	U	U	\N	\N	f		f	2007	18		3F.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
6d66c5d1-fa3f-4532-af1b-7c0daa800563		1.35	4.7	4.7	0.2	1.8	U	\N						\N		\N	\N	\N	\N	Wrapped in linen with red/white ribbon over linen	751ff16c-edfe-40b5-8ee1-4dbf6dee6152	3d9501d1-0996-403f-a341-ec3785ddb750	\N	\N	\N	\N	\N	2006	\N	\N	33	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	t		f				3F.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
f5daebc3-1a7c-4a8c-9e5a-a67a05441bb1		0	0	0	0	0		\N						\N		\N	\N	\N	\N		9040a367-6bb5-4fb9-8f1b-bb95e3bd8a70	3eee8c71-3f9d-4c09-bdbe-c5eeb994770e	\N	\N	\N	\N	\N	2006	\N	\N	53	\N			\N	f	f	f						\N	\N	f		f				3F.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
84e66492-408d-4ce6-a3c9-0781666fcf2a		0	0	0	0	0		\N						\N		\N	\N	\N	\N		ba615d7c-bfb2-45d6-8910-09e2dd2002a4	61498ba5-6ba9-48cc-af22-92b8a07fb9bf	\N	\N	\N	\N	\N	2006	\N	\N	49	\N			\N	f	f	f						\N	\N	f		f				3F.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
f096d2c7-d3b1-4a0b-bbb8-56b4bd6323db		0	0	0	0	0		\N						\N		\N	\N	\N	\N		0dfcb645-3f90-463d-b87c-a4b807191853	368deb95-2a39-4a8d-adde-691f2989761b	\N	\N	\N	\N	\N	2006	\N	\N	51	\N			\N	f	f	f						\N	\N	f		f				3F.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
382f81bf-9957-4f64-9a01-7aa64889ac93		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	5c6f88dd-0952-4d9a-a25f-094877dbfc5d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	f	f	f						\N	\N	f		f				3G.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
8ab797c2-4091-40ec-9ec4-f3446a196f90		0	0	0	0	0		\N						\N		\N	\N	\N	\N		5e9ab88d-55d7-47f8-a988-7b6d581129c5	0c1af31b-b166-4942-99d7-0844c6b94313	\N	\N	\N	\N	\N	2006	\N	\N	52	\N			\N	f	f	f						\N	\N	f		f				3G.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
93c4865a-16d4-44cf-8d35-dce9d107049f		0	0	0	0	0		\N						\N		\N	\N	\N	\N		2f3885ee-4116-45eb-a1d4-c0ae49e3a264	06c69ff3-e1db-47b6-af4c-545a5896077c	\N	\N	\N	\N	\N	2006	\N	\N	50	\N			\N	f	f	f						\N	\N	f		f				3G.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
6ba8a199-9e87-4f88-bbf2-532f45518abd	Undefined	0.68	1.65	1.38	3.7	4.07	newborn	\N				red		\N		\N	\N	\N	\N	Wrapped in linen, tied with rope\nBadly rutted\nSaved only a small rope caught a few fragments of textiles\n"red hair" and "newborn" are designated in 1992C\nMeasurements in 1992E	0b8f9f67-e848-4a65-bde1-a006b5a020b4	e94187b0-122c-4b8c-a259-0d8ed1c57812	\N	1992-01-01	\N	\N	\N	\N	\N	0.4	6	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	N	\N	\N	t		f	1992A/1992C/1992E	45,25/17		3G.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
429c1387-2ba7-4a17-861a-0c4ecaf1f933	West	0.56	1.44	2.02	2.18	3.47	U	\N						\N		\N	\N	\N	\N	feet missing	3f9c6649-69b2-4c16-8142-d3f9d6f3ea65	d6455ef0-06c6-42a7-8a29-bbb63a38b082	\N	1997-01-01	\N	\N	\N	2005	\N	1.65	2	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	7		3G.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
2681ade5-003a-486f-8d88-acd14b609735	West	1.6	4.8	4.2	2.9	4.7	I	\N				Black		\N		\N	\N	\N	\N	Well wrapped and ribboned, but cloth deteriorated\nLots of rock placed vertically all about the body\nMale\nHands along the sides\nCan't find details age in the field book that are described in the database (TW)	d92e3a1a-2655-4c1c-b641-e30cbc930f93	c6a57e09-ba2f-440b-aa64-709aa567c146	\N	1987-01-01	\N	\N	\N	\N	\N	1.8	45	\N	Male		\N	f	f	f	well-wrapped	W	A	P	U	\N	\N	t		f	1987A	116		3G.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
6b111f1f-201f-447c-8c15-f28ae7c44789	West	0.57	0.66	0.81	1.36	2.6	U	\N						\N		\N	\N	\N	\N	palm fronds and sticks atop the body\nwrappings mostly missing\nburial much disturbed	8b32c8d6-920a-4cef-a9b1-338229124421	8171ab33-dee9-40db-aa1f-3720518185ec	\N	1998-01-01	\N	\N	\N	\N	\N	1.26	2	\N	Undetermined		\N	f	f	f	disturbed	W	A	U	A	\N	\N	t		f	1998	86		3G.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
1439d2ae-7593-4b77-b489-e4f3c042c914		0.91	3.77	3.7	1.72	2.81	50+	\N				blond		\N		\N	\N	\N	\N		d6c90565-74f8-4149-b401-da1c9b5e201c	b0cb3344-dff0-457e-b283-ad8d77d43e79	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	Female		\N	f	f	f	well-wrapped	W	A	P	A	\N	\N	t		f				3G.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
19a342f9-d4d4-4226-9422-a860d43eba02	West	0.9	1.8	1.9	-0.2	1.5	V	\N				dkbrwn		\N		\N	\N	\N	\N	Well preserved feet - adult burial just under and slightly south of burial #5\nWrapped with face bundle\nCan't find details on gender, age, or hair	1709307e-793e-4186-874f-d8551b7e9a1e	574e033a-4fd1-4bc0-a65c-d1d3acdd1ad1	\N	1987-01-01	\N	\N	\N	\N	\N	1.8	7	\N	Male		\N	f	f	t	poorly preserved	B	A	P	U	\N	\N	t		t	1987A	60		3G.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
1db17bde-6eff-436e-bf7f-7ee9cb93bbee		0.92	3.27	4.36	3.46	4.36	4-5 years	\N				blond		\N		\N	\N	\N	\N		5714cb8b-7b83-4fe4-ab11-497e0a449053	1f3e4392-8450-42f8-a201-9d97ffc0d9a4	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	P	C	\N	\N	t		f				3G.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
3e2a1332-e0b8-47b7-b024-c87f9ee02c82	West	1.65	3.15	3.5	2.85	4.45	IV	\N				Brown		\N		\N	\N	\N	\N	Teenager or so\nSome hair\nLittle textile\nCan't find details on hair, gender, or age in the field book that are described in the database (TW)	a5e18aa9-4579-45a6-b747-acde1eec60a3	d0a6b1b6-ca19-43ae-90c9-bf058e39be01	\N	1987-01-01	\N	\N	\N	\N	\N	1.6	36	\N	Male		\N	f	f	t	poorly preserved	B	A	P	U	\N	\N	t		f	1987A	104		3G.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
d26af406-3b50-4be4-9f89-e43db65754db	Undefined	0.9	0.75	0.55	3.24	4	5 years	\N						\N		\N	\N	\N	\N	Can't find details on age and gender for this the burial in field book that are described in database (TW)\nOnly a few decayed pieces of linen\nSome red/white ribbon\nOne piece of fairly good white cloth\nBasket case	fb952422-36bc-4da1-a207-f23697af3eff	874c3ff4-f2c1-496a-be92-0496ff72bdaa	\N	1992-01-01	\N	\N	\N	\N	\N	0.82	20	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	C	\N	\N	f		f	1992A	57,66	M1	5B.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
5d8657c8-e8bf-4a39-a570-489fcbf150cf	West	1.26	0.97	0.89	0.67	2.02	U	\N						\N		\N	\N	\N	\N	Wrapped with torn linen strips over coarse linen	76fb53dd-e93c-41d6-acfa-8c8bc2db6967	097729ec-97cb-4933-8b41-11ebec3d9181	\N	2005-01-01	\N	\N	\N	2005	\N	1.45	34	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	f		f	2005	75	M2	5B.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
198d21d4-c1f0-488e-af8d-025ee6dcd92c	East	1.91	0.74	0.84	3.9	2.48	U	\N						\N		\N	\N	\N	\N	covered with a layer of rocks	7e984c67-63f5-4269-96e8-cec1aa40e7fb	2eb2e5aa-1d74-4925-9ecd-f58b9463da8e	\N	1998-01-01	\N	\N	\N	\N	t	1.6	42	\N	Undetermined		\N	f	f	t		B	A	U	A	\N	\N	t		f	1998	121	M1	5B.03 and 3C.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
693b9153-deb7-4830-b747-c4a1b35d3d19	West	1.1	1.4	1.64	0.7	2.29	U	\N				brown		\N		\N	\N	\N	\N	Linen covering\nlinen wrapped at feet with fringe (5 cm, hanging down)	fab3dee0-eb7f-4563-85ba-50a11ecf8b3d	f304e5c2-7893-4f1c-a1eb-f642f61f4956	\N	2005-01-01	\N	\N	\N	2005	\N	1.69	28	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	f		f	2005	69		5B.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
6a685714-ec97-4f09-a6ef-f313508d8b1d	West	0.81	0.54	0.52	1.9	3.38	13 years	\N				ltbrwn		\N		\N	\N	\N	\N	Age and hair details in 1992C\nMeasurements in 1992E\nBody wrapped in 4 layers of coarse linen, outer wrap of fine linen, tied with red/white ribbon\nA piece of woven basket was with body\nPelvic bone not (?), but has two molars\n7 samples	26c168f5-680d-4363-b6b1-e53e82bd1fd9	ac89eb8c-e4e4-4ce9-9434-e7c154caddf8	\N	1992-01-01	\N	\N	\N	\N	\N	1.44	28	\N	Undetermined		\N	f	f	t	wrapped	W	C	P	C	\N	\N	t		f	1992A/1992C/1992E	87/41/39	M2	5B.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
ad3abe71-021e-4b08-9fe5-3216508d2a84	West	1.38	2.54	2.97	1.22	2.78	U	\N						\N		\N	\N	\N	\N	Some textiles, mostly at feet	92362d4b-ff4a-4340-8970-0367e86d1e45	73491716-74f9-4149-aacd-1d3f0a75f9dd	\N	2005-01-01	\N	\N	\N	2005	\N	1.79	31	\N	Male		\N	f	f	f	not well preserved	H	A	U	A	\N	\N	f		f	2005	73	M2	5B.06			Odd fusion of the mastoid and "Max por.".  Is this the skull with the fusion of the mandible and zygomatic bones on the right side?	\N	\N	\N	\N	\N	\N	\N	\N	\N
ad33fabc-d28e-4308-b244-bc63d39d3865	Undefined	2.29	0.5	0	3.49	-0.39		\N						\N		\N	\N	\N	\N	This is buried in same tomb as #16 side by side under shelf to north of #16	0180db73-8822-479b-b4b5-81596c6db0a4	c320e97a-45c6-49b8-bac7-322104e43df7	\N	1994-01-01	\N	\N	\N	\N	\N	\N	20	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B	43,51	M1	5B.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
555984bb-5632-4f67-93a2-b04782ea3b2c	West	2.4	0.98	0.77	4.01	5.74	U	\N						\N		\N	\N	\N	\N	Deep burial - beneath limestones placed on shelf in shaft\nTextiles on feet	deb254ba-3a5d-41c6-9fc2-52347a551571	d895bfcb-b1f5-44a2-813b-67ea509a6328	\N	2005-01-01	\N	\N	\N	2005	\N	1.89	30	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2005	73		5B.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
e46bba82-08a7-437d-b980-81fa8b8a5e60	East	1.4	1.46	1.64	0.94	0.55		\N						\N		\N	\N	\N	\N	Depth to head 140cm and depth to feet 103cm	15fbffb1-6cc6-4ea3-8e11-9512d81cf025	163e3be7-306e-471e-93b6-09c2def94e71	\N	1994-01-01	\N	\N	\N	\N	\N	\N	9	\N	Undetermined		\N	f	f	t		B	C	U	C	\N	\N	t		f	1994B	34		5B.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
45e682f5-9dba-4e0d-ba5e-68e078c3d20f	West	1.17	4.48	4.32	4.01	5.5	U	\N						\N		\N	\N	\N	\N	Mostly skeltalized with textiles at heat and feet	429d1ee4-33cf-4885-beff-0ed590499929	45461595-bb58-41ad-931a-92c071522a9b	\N	2005-01-01	\N	\N	\N	2005	\N	1.51	38	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2005	79		5B.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
7b225114-29ac-4170-8d2c-948fd0730e7f	West	0.8	4.51	4.82	0.94	1.98	U	\N						\N		\N	\N	\N	\N	close to surface with #44 having head near pelvis of #43	6fa1d378-ee11-427c-a0ef-b65b198c719c	c84e97a1-d928-4005-9b0d-4c88db304fa9	\N	1998-01-01	\N	\N	\N	\N	\N	1.17	44	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	123		5B.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
57636f06-1c14-4c8a-975f-a8f45760de12	West	0.7	0.42	0.15	2.95	4.08	U	\N						\N		\N	\N	\N	\N	Adult wrapped with two types of red ribbon	fcf629ef-5ed5-4191-bb5f-cf5cb1bf4217	e1ae9220-003d-4239-a1af-ab6d4886cece	\N	2005-01-01	\N	\N	\N	2005	t	1.7	24	\N	Undetermined		\N	f	f	f		U	A	U	C	\N	\N	f		f	2005	59		5B.12 and 2C.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
0cb79a88-8d40-4305-9682-22a7d0a98929	West	0.9	3.87	4	3.35	4.34	U	\N						\N		\N	\N	\N	\N	called "youth" on page 132	92f76c62-ba77-458b-9057-fa8bb6b4b77d	cd4b42aa-857b-4525-8dfc-5ea2eaf923da	\N	1997-01-01	\N	\N	\N	\N	\N	1.1	11	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	23		5C.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
d5a06082-d902-4bb9-9c40-41cc797135cc	West	1.5	0	0.05	2.25	3.6	U	\N						\N		\N	\N	\N	\N	Fine white linen shroud wrapped with ribbon in a combination of diagonal and longitudinal pattern\n4th century pottery shards found with burial	8db44009-1b6f-4d19-a5f7-fa12059879f2	155d5087-8149-46e5-a523-1dc3f4226a17	\N	2009-01-01	\N	\N	\N	\N	\N	1.62	49	\N	Undetermined		\N	f	f	f		W	U	U	U	\N	\N	t		t	2009	75		5C.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
e834248a-2acd-4c3e-b17f-15c285ea8f58	West	0.8	2.08	2.33	0.2	1.74	U	\N						\N		\N	\N	\N	\N	mostly skeletalized	c11f6044-e6e5-4cb9-9e28-2806b47ea3fd	a6d69f07-6e0e-4942-b56f-b23fe9234ecf	\N	1998-01-01	\N	\N	\N	\N	\N	1.73	8	\N	Undetermined		\N	f	f	t	badly decomposed	B	A	U	A	\N	\N	t		f	1998	95		5C.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
0b986d0b-700e-4aff-8d71-4d08e41a6f4a	West	0.93	2.6	2.64	0.4	1.86	U	\N						\N		\N	\N	\N	\N		0beddb04-3e28-411f-b734-0f6ca14a8c75	f20c3cc5-9de8-451d-9e75-8ffb7d692ddb	\N	1998-01-01	\N	\N	\N	\N	t	1.58	11	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	96		5C.04 and 2F.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
aab3f20b-d0e0-4ca2-b5bc-5dfa24fc434f	West	0.47	0.44	0.52	3.25	4.74	U	\N						\N		\N	\N	\N	\N	well wrapped burial with a large face bundle\npieces of glass-early 2nd century around burial area	d8402f11-6b3c-4cef-a7c6-fd22763165f7	271eb64a-a855-4652-8d0e-e16e9d632ad1	\N	1998-01-01	\N	\N	\N	\N	\N	1.56	1	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t	Y	t	1998	85		5C.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
9ec8c684-4c11-4d8f-87b7-bd41d5d13c3c	West	0.98	0.78	1.18	3.88	5.78	U	\N						\N		\N	\N	\N	\N		c35295c4-2536-4406-a1ce-98c05c754284	f3a4fe12-0563-4b41-a319-ff804431b905	\N	1997-01-01	\N	\N	\N	\N	\N	1.82	9	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		t	1998	35		5C.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
ad4e6130-0f68-4e1e-81aa-e18c172af798		1.04	0.53	0.07	2.89	4.45	35-40	\N				ltbrwn		\N		\N	\N	\N	\N		e101f92e-aa2f-4ba3-a23c-bc9371d50927	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	Male		\N	f	f	f	wrapped	W	A	P	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
f468f41d-5bf3-4f24-9092-9b18c24b42c4	East	2.02	3.58	3.29	2.08	0.46	U	\N						\N		\N	\N	\N	\N	head-east\ntitled a "reversal" on page 133	b68088b6-7e42-4bf4-b40d-dbc750a62c1c	ae9e6b74-2ba4-4327-9140-34815195ff2d	\N	1998-01-01	\N	\N	\N	\N	\N	1.6	28	\N	Undetermined		\N	f	f	f		B	A	U	A	\N	\N	t		f	1998	39		5C.07			Temporal Mandibular Joint (TMJ) Osteoarthritis (OA)	\N	\N	\N	\N	\N	\N	\N	\N	\N
6a1de0f6-83c6-492e-afed-c308df002cfa	West	0.5	4.69	5	0	1.26	U	\N						\N		\N	\N	\N	\N	Wrapped and overlaid with rope bindings	99924377-939a-4511-a97d-3086caef9189	cac125ad-afa9-42c0-95cc-14f6b760334b	\N	2005-01-01	\N	\N	\N	2005	\N	1.32	36	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	f		t	2005	41		5C.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
277a16e9-f74e-4a3f-a37f-05c61350c62b	West	1.63	0.35	0.2	1.98	3.56	U	\N						\N		\N	\N	\N	\N	a palm branch sticking up at feet	c798f026-6425-42ca-bd45-cdc8b950ee6d	7ff19bbc-ad11-4802-8909-3c896ce9e0a6	\N	1998-01-01	\N	\N	\N	\N	\N	1.65	30	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	109		5C.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
bb709365-3694-4e8c-a26e-6c54a7455ada	West	2.19	2.48	2.35	3.17	4.8	U	\N						\N		\N	\N	\N	\N	head west, beneath the stones covering the chamber in the shaft	e95ae935-87f1-4ee0-a2a2-40386ea1dbb0	e7635363-4fee-4cff-92f0-b2dc90d0c192	\N	1998-01-01	\N	\N	\N	\N	\N	1.67	32	\N	Undetermined		\N	f	f	t	poor	B	A	U	A	\N	\N	t		f	1998	41		5C.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
2acfd894-bd6d-4ca6-a0c0-79e074454ff1	West	0.79	3.08	3.08	0.32	0.32	U	\N						\N		\N	\N	\N	\N		006c5046-ad86-4431-8529-c4e7f02fb0a5	d5a0aa47-100d-43af-9f9c-4dc518551d1f	\N	1998-01-01	\N	\N	\N	\N	\N	\N	10	\N	Undetermined		\N	f	f	t		W	U	U	U	\N	\N	t		f	1998	97		5C.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
8aea66d5-1d89-4f27-b785-609ae626c181	West	0.75	2.34	2.54	3.64	4.67	U	\N						\N		\N	\N	\N	\N	well wrapped\nred stripes woven into cloth of face bundle\npalm sticks along body beneath wrap\ncloth folded and tied beneath feet\ncalled "adult" on page 134	c594db30-0928-470b-8782-e6dca9c64f7f	af5e9e90-14ae-453f-b3ac-5824fb959367	\N	1998-01-01	\N	\N	\N	\N	\N	1.2	5	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		t	1998	89		5C.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
9b6cda38-4ca0-42f4-bcb6-60892b433025	West	1.27	4.43	3.92	-0.06	1.29	U	\N						\N		\N	\N	\N	\N	Skeletalized adult	a14d8e6d-5677-45dc-9175-3befb5e3474c	579583bd-ef10-4414-ac86-8e508cfa465b	\N	2005-01-01	\N	\N	\N	2005	\N	1.52	37	\N	Undetermined		\N	f	f	f		B	A	U	A	\N	\N	f		f	2005	77		5D.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
0879b8fb-8791-402e-a7b8-20bfdb9f78d8	West	0.82	3.31	3.22	1.88	3.03	U	\N						\N		\N	\N	\N	\N	Limestone slabs covering south part of body	a7484f75-21e5-4e2b-a24c-59063010a410	de360eed-8883-429c-90e4-e7fb94df4d6d	\N	2005-01-01	\N	\N	\N	2005	\N	1.26	18	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	f		f	2005	53		5D.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
513bf955-425c-4a67-add7-e3d214b3bbc3		0	0	0	0	0		\N						\N		\N	\N	\N	\N		6db36e2f-6b1b-4d0e-a908-d7df27ac9b90	98885efd-34a1-4572-b274-1227f17c26cf	\N	\N	\N	\N	\N	2002	\N	\N	16	\N			\N	f	f	f						\N	\N	f		f				5D.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
f6e3935e-3c20-4d02-b262-a0ed865d0f67	West	0.8	3.85	3.9	1.97	3.68	U	\N						\N		\N	\N	\N	\N	Textiles deteriorated	09b60241-7dea-4505-a53d-5a773afb5831	e4fdf155-2e69-4e9f-83ea-299be857bb2d	\N	2005-01-01	\N	\N	\N	2005	\N	1.69	6	\N	Undetermined		\N	f	f	f		H	U	U	U	\N	\N	f		t	2005	47		5D.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
7cb4629e-b401-44b7-8150-b0a2462c4616		0	0	0	0	0		\N						\N		\N	\N	\N	\N		1ce40312-fb52-4caf-bfe6-ed17ba0dd2b4	d084ed96-0628-414e-afe3-68b86bf5086d	\N	\N	\N	\N	\N	2002	\N	\N	15	\N			\N	f	f	f						\N	\N	f		f				5D.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
b15ff05b-aa02-404a-a33f-482ef2fd9d36	West	1.28	2.9	2.79	4.16	5.78	U	\N						\N		\N	\N	\N	\N	Just below #29,30	0825cd33-1070-4dc6-b308-1f0eb7be7f04	98af9a22-65ec-4290-ae9f-d9d8e3b106fb	\N	2005-01-01	\N	\N	\N	2005	\N	1.72	33	\N	Undetermined		\N	f	f	f		U	A	U	A	\N	\N	f		f	2005	39		5D.06			Extensive and severe cribra orbitalis	\N	\N	\N	\N	\N	\N	\N	\N	\N
dd9988cc-6c18-49a2-ab5c-835c14074810	West	0.74	2.92	2.83	4.16	5.61	U	\N						\N		\N	\N	\N	\N	Same cluster details as above	f45813a4-b737-4ca7-9c87-d6b757112e4b	e739cdcf-115e-44a3-bb78-c08848bf2c1e	\N	2005-01-01	\N	\N	\N	2005	\N	1.68	30	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	f		t	2005	37		5D.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
79de6a51-f09f-42bc-a3f2-5104d51e99bd	West	0.56	4.5	4.4	0.14	1.61	U	\N				brown		\N		\N	\N	\N	\N	This burial is a jumple of bones (1 skull, 3 femurs)\ncoarse rope binding\n1 femur broken\nBrown curly hari\npelvic region badly crushed	149cc79b-6912-4a1e-9f2a-f6b4e2aec971	fb18b95b-cc73-4913-ba71-2a27df2a1624	\N	2005-01-01	\N	\N	\N	2005	\N	1.52	17	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2005	53		5D.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
b5df05be-4a54-4eea-983c-c9115a1538d0	West	0.76	3.35	2.95	4.19	5.63	U	\N						\N		\N	\N	\N	\N	#29,30 side by side,\nreed mat has large reed poles in each side, and 3 woven reed ropes holding it together (top, middle, bottom)\nLimestone blocks partially cover mat on north side	eea58fe7-cf72-4b9c-bedb-fa7fb12e0d2d	c1f6b0df-9e8c-45ca-8665-c471754344c8	\N	2005-01-01	\N	\N	\N	2005	\N	1.57	29	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	f		t	2005	37		5D.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
6c3f409b-922f-4206-b882-1bce1f6f144f	West	1.26	2.71	2.63	3.95	5.27	U	\N						\N		\N	\N	\N	\N	Sub-adult on top of adult (#21)\nTorn linen strips over coarse linen - diagonal	1b671bc5-17a5-4212-a0fc-a9807217b22a	6a753c3b-2058-4bb0-8e4b-526c31b8360b	\N	2005-01-01	\N	\N	\N	2005	\N	1.2	20	\N	Undetermined		\N	f	f	f		W	A	U	C	\N	\N	f		f	2005	57	M1	5D.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
9b9bda8d-2d38-4c0f-b259-d4b90aad09a3	West	1.11	2.22	2.21	2.25	3.78	U	\N						\N		\N	\N	\N	\N	is an adult or sub-adult\ncalled "adult" on page 134	1329a4b1-9e64-49b9-ae42-978daec54bc4	f99546d5-76ff-4ce7-8690-3e0ebef21731	\N	1998-01-01	\N	\N	\N	\N	\N	1.61	13	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	101		5D.11			Cribra orbitalis appears to be healed.	\N	\N	\N	\N	\N	\N	\N	\N	\N
3717108d-9e18-441b-87d0-07953393efd9		0	0	0	0	0		\N						\N		\N	\N	\N	\N		90f5fe58-7624-4813-aa19-552e3c0bfada	595b16f9-fceb-4096-8e17-d9ead3e9680a	\N	\N	\N	\N	\N	2002	\N	\N	22	\N			\N	f	f	f						\N	\N	f		f				5D.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
f54b8278-9cae-4df5-a791-6ee66b3d8568	West	0.75	3.8	4.05	3.2	4.2	U	\N						\N		\N	\N	\N	\N	sub-adult	828003b8-3989-4477-8297-3a8ae7a985fb	47844e88-72f2-421b-90fe-ea3b8bee293e	\N	2009-01-01	\N	\N	\N	\N	\N	1.07	6	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	t		t	2009	19		5E.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
7a53a59c-0358-4a63-9121-635a78cd15a5	East	1.5	1.48	1.66	5.78	4.43	U	\N						\N		\N	\N	\N	\N	Skeletalized	24422115-8cb9-45ae-80b5-32d507305353	4a80d0f5-a2c1-4b1a-9abd-be1e9f24970f	\N	2005-01-01	\N	\N	\N	2005	\N	1.57	29	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2005	69		5E.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
38a89982-f038-4ee2-a244-c1609706d6c1	West	0.75	4.75	4.95	0.02	1.75	U	\N						\N		\N	\N	\N	\N	burial #48 directly beneath burial #43	38f9cb08-d530-4323-83c4-fcb6f78bfb5a	1b1c53e8-6146-4b13-9ab8-dfafaf660419	\N	1998-01-01	\N	\N	\N	\N	\N	1.73	48	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	127		5E.03			Cribra orbitalis appears to be healed.	\N	\N	\N	\N	\N	\N	\N	\N	\N
e5315c7b-a6f7-47e8-9269-9af7b19b53fa	East	2.08	3.55	4	3.13	1.75		\N						\N		\N	\N	\N	\N	Reversal burial	41c88b60-f468-422e-92a9-10d39bd24817	aae34ea8-e89b-4a49-83b0-c3499c114769	\N	1994-01-01	\N	\N	\N	\N	\N	1.52	22	\N	Undetermined		\N	f	f	t		B	A	U	A	\N	\N	t		f	1994B	54		5E.04			Lopsided occipital condyles and foramen magnum	\N	\N	\N	\N	\N	\N	\N	\N	\N
b60567b0-c240-4f4d-b829-f964d8484871	West	0.7	2.47	2.7	4.15	5.96	25-35 yrs	\N				brown		\N		\N	\N	\N	\N	Stitched together over the head - med weave linen\nFolded coarse linen over face, solid red ribbon\nAlso some brown and white ribbon\nBeard	7543810e-f4a9-424c-84dc-0c8d638d5594	20e411b8-410f-4bb9-8af9-7c8b40b0a4f5	\N	1992-01-01	\N	\N	\N	\N	\N	\N	25	\N	Male		\N	f	f	t	wrapped	W	A	U	A	\N	\N	f		t	1992A/1992C	52,68/33		5E.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
b415bfc8-99d0-4c77-94d8-551964580c7d	West	0.55	1.4	1.8	2.25	3.34	U	\N						\N		\N	\N	\N	\N	braided hair;  sub-adult with bent legs\nThe body has been dessicated and therefore shrunk before wrapping and burial - the wrappings and ribbon ties are tighter on the shrunken body\nthere are reed sticks from neck to knee for support	2bf8fd14-de11-4432-9d67-f91053f45e39	6f4aec89-ba85-48d2-8c3b-282e4d9f511a	\N	2009-01-01	\N	\N	\N	\N	\N	1.17	4	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	t		f	2009	17		5E.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
ea3889f2-e938-45ae-ab6d-a2d84592da46	West	0.96	0.34	-0.15	2.66	3.7	4-5 years	\N				br-red		\N		\N	\N	\N	\N	Measurements in 1992E\nage and hair details in 1992C\nBasket case\nRed/white ribbon\nMedium weave linen\nCoarse linen underneath\nFoot bundle\n4 samples	549016f4-de1c-4ca6-b130-a5c3ab7575be	931cdf45-e8be-4358-bf8e-09c42a9bd50b	\N	1992-01-01	\N	\N	\N	\N	\N	1.17	19	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	C	\N	\N	t		f	1992B/1992C/1992E	30/105/83	M2	5E.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
8a6fbb46-dd60-42ad-9c8e-7bf006ecba27	West	1.4	1.92	0	3.4	0	30-40	\N						\N		\N	\N	\N	\N	gender and age in 1992C\nCan't find wrapping details\n2 samples	0639ae2d-3e34-419e-aecc-ab3ca6dbe378	6d4d9b45-1562-4bb5-9211-346ec7c22ac4	\N	1992-01-01	\N	\N	\N	\N	\N	\N	23	\N	Male		\N	f	f	t	Skull only	B	A	S	A	\N	\N	f		f	1992B/1992C	19/107		5E.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
1ffe12d6-13a6-429b-bb3d-909f8789813a		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	c271dd8b-7236-45fe-a2b9-92b4068d9f0b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	f	f	f						\N	\N	f		f				5E.09			Cribra orbitalis appears to be healed	\N	\N	\N	\N	\N	\N	\N	\N	\N
977d6d89-41a5-4830-a51e-de899e1bf0da	Undefined	0	0	0	0	0	about 60	\N						\N		\N	\N	\N	\N	female, about 60\nOuter wrap - fine linen; inner wrap-coarse	a06afd13-853c-4303-b2a0-cab395d4e3e4	a258e4a0-ad98-4036-8cc4-bbff7df0ce98	\N	1994-01-01	\N	\N	\N	\N	\N	\N	11	\N	Female		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994C	16		5E.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
83a35520-6089-4c75-9273-c0c41f9660c7	East	2.64	1.92	2.41	2.14	0.77	55+ yrs	\N						\N		\N	\N	\N	\N	Measurements in 1992E\nage, gender, and hair in 1992C\nbasket case\nno textiles\n5 samples	536cf573-0f5c-454d-a59d-4b849ed3f394	d8074d25-1570-443f-a045-ced5368643d4	\N	1992-01-01	\N	\N	\N	\N	\N	1.59	50	\N	Female		\N	f	f	t	SKELETON	B	A	P	A	\N	\N	f		f	1992B/1992C/1992E	10/97/79		5E.11			Thin bones	\N	\N	\N	\N	\N	\N	\N	\N	\N
99e73d14-87ab-4774-8723-8a23de10c5e8	West	0.76	2.02	1.91	3.34	3.94	5 years	\N				brown		\N		\N	\N	\N	\N	age and hair details in 1992C\nmeasurements in 1992E\nFine weave with purple design - on fragments next to hair\nAlso coarse woven linen outer fabric\nbasket case infant	2a7e43d7-aa8f-412c-99ab-f543394be7f5	1957832b-055c-4c1a-ad6e-e67d891ca533	\N	1992-01-01	\N	\N	\N	\N	\N	0.82	24	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	C	\N	\N	t		f	1992A/1992C/1992E	88/41/38		5E.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
8844537c-6fa0-46c3-9680-cc6fd0fe9539	East	1.88	2	1.81	2.52	1.48	U	\N						\N		\N	\N	\N	\N	skeletalized reversal (head-east)\ncalled "youth" on page 134	faf8a618-476f-49ae-a368-4336c9ff188a	9e7fef8e-33ef-4586-ae03-78522b423830	\N	1998-01-01	\N	\N	\N	\N	\N	1.12	41	\N	Undetermined		\N	f	f	t		B	C	U	C	\N	\N	t		f	1998	121		5F.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
555d2d94-6ca1-4658-ac79-8fa140d0cfb7	West	0.84	2.35	2.04	0.77	2.35	25-35	\N				dkbrwn		\N		\N	\N	\N	\N	Can't find details on gender for this the burial\nFabric badly deomposed\nEvidence of fine linen outer wrap and coarse linen underneath\nRed/white ribbon fragments\nSome purple on the linen samples\nAge and hair in 1992c	a3f53293-6272-4094-9823-7ef07d26c3c8	eb1f2940-24ed-467a-8f4f-3aac65eb1328	\N	1992-01-01	\N	\N	\N	\N	\N	1.6	19	\N	Female		\N	f	f	t	poorly preserved	B	A	P	A	\N	\N	t		f	1992A/1992C	57,72/29		5F.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
3c90ba40-bad9-42a0-a6e3-fde59368c192		0	0	0	0	0		\N						\N		\N	\N	\N	\N		b0c09f9c-adc4-4b96-80a3-14f641f3e1e1	d6f11cf0-28d9-4168-a90c-38ba57960c6e	\N	\N	\N	\N	\N	\N	\N	\N	27	\N			\N	f	f	f						\N	\N	f		f				5F.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
e8355825-5c14-4b0d-ba4e-1d148dea29e0		1.42	4.38	3.75	2.27	3.95		\N				Brown		\N		\N	\N	\N	\N	Hands along side	3604df88-cf55-410b-99c9-f10efcd1f71e	5e8f6cac-0e94-47c9-a913-1b1e617c7053	\N	\N	\N	\N	\N	\N	\N	\N	24	\N	Male		\N	f	f	t		H	A	U	A	\N	\N	t		f				5F.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
abf00f36-4ecd-425f-90b3-dbe629fc48a4	West	0.85	3.82	4.3	1.6	3.31	U	\N						\N		\N	\N	\N	\N	bodies 6 and 10 together, #6 over left shoulder and touching 10	bcc41edc-0de2-47ed-b9a9-60e7f5a7d32d	604b2389-2799-4008-81f5-f1a0a65efc34	\N	1997-01-01	\N	\N	\N	\N	\N	1.8	6	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		t	1998	21		5F.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
4160cc24-1409-4b59-ad10-5f7fc562dc81	West	1.2	0.43	0.42	-0.2	1	U	\N						\N		\N	\N	\N	\N	called "youth" on page 133	6affad60-1d64-43eb-ac23-78a701fa0f20	69c880ac-4ebc-4f37-9a53-9939a379bae7	\N	1998-01-01	\N	\N	\N	\N	\N	1.5	50	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	51		5F.06			Cribra orbitalis appears to be healed.	\N	\N	\N	\N	\N	\N	\N	\N	\N
e03a049f-90e2-4068-b1f6-8521b96be1e9		2.09	0.52	0.52	3.32	3.32	U	\N				brown		\N		\N	\N	\N	\N	Also various bones such as two humorous and bits	3112b3a2-2f09-45a3-a1ec-e4bad09ab154	2a785f2c-ac34-479a-b788-eabe92179997	\N	2009-01-01	\N	\N	\N	\N	\N	\N	62	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	t		f	2009	91		5F.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
a9189952-85ba-43e8-8696-e2bf7f29ad08	West	1.3	3.26	2.99	2.66	4.16	U	\N						\N		\N	\N	\N	\N	wrapped in coarse linens, bundle of palms running down sides of body	231dbf27-6cce-4d2b-a275-c20b0e031906	2b9d5f7f-82b2-4f78-8872-b9bfdc172931	\N	1998-01-01	\N	\N	\N	\N	\N	1.66	36	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	115		5F.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
9da423a0-70c2-4939-aa55-b03b3f4c5bb6	West	0.8	1.88	2.29	4.05	5.55	U	\N						\N		\N	\N	\N	\N	body beneath 8 and part of 10\nhead and face bundle wrapped with ribbon which appears to be plain red and green wool shots are visible - it looks to be pile weave\nthe shroud is medium, fine plain weave linen\nribbon on feet seems to be the "typical" red and white\nsupport reed/sticks full length of body	b2a21592-d668-4bbd-a7d5-e0ce7f4a2a4b	2ed3654e-d223-49a3-90d6-ab26cfbd9aa6	\N	2009-01-01	\N	\N	\N	\N	\N	1.6	9	\N	Undetermined		\N	f	f	f		H	A	U	A	\N	\N	t		t	2009	25		5F.09			Cribra orbitalis appears to have healed	\N	\N	\N	\N	\N	\N	\N	\N	\N
53590d35-d2ed-4f01-bf12-330cc6257395	West	0.8	4.75	4.75	2	2.75	U	\N						\N		\N	\N	\N	\N	child next to adult (30) and two babies (27&28)	f3b910e4-5820-4888-b95c-813756ed5858	06eb4a10-6236-4a66-9976-f517f9967fb1	\N	2009-01-01	\N	\N	\N	\N	\N	0.72	29	\N	Undetermined		\N	f	f	f		U	C	U	C	\N	\N	t		f	2009	50		5F.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
870efd5e-a937-499d-aa0a-088f3f3ce16d	West	2	2.92	2.63	3.65	5.3	30-35 yrs	\N				dkbrwn		\N		\N	\N	\N	\N	Measurements in 1992E\nage, gender, and hair in 1992C\nDecayed textiles\nEvidence of red purple\nSome coarse linen\nmandible and skull fracture - probably cause of death\n6 samples	1d175092-d487-4423-8c2e-4c29b842ce7b	4aa4198d-38ed-42ac-bd4c-13224e10c81f	\N	1992-01-01	\N	\N	\N	\N	\N	1.97	54	\N	Male		\N	f	f	t	poorly preserved	B	A	P	A	\N	\N	t		f	1992B/1992C/1992E	11/95/77		5F.11			Cribra orbitalis appears to be healed	\N	\N	\N	\N	\N	\N	\N	\N	\N
1190ec61-e986-44e1-b243-c4cb3576821d	West	0.9	2.8	2.73	-0.1	1.5		\N						\N		\N	\N	\N	\N	head of #13 covered with a flat stone,  body wrapped with sticks along body and under the cloth	a4b17aff-78ab-416f-924b-f314a2c947fe	815b0c92-1b24-471f-9c5c-338f39dc9d04	\N	1994-01-01	\N	\N	\N	\N	\N	\N	13	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B	B-8,9		5F.12			Minimal porotic hypertosis at basal and maxilla	\N	\N	\N	\N	\N	\N	\N	\N	\N
c9e1f22f-9b02-4284-8fa6-92ef3659e20d		0.7	4.13	0	2.14	0	35-45	\N						\N		\N	\N	\N	\N		f4c166ff-099c-4b1e-a0c0-3f0fb1f59cd0	c0837f51-d3b5-4564-a250-a8d6d073e5fe	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	Male		\N	f	f	f	wrapped - bones showing	H	A	P	A	\N	\N	f		f				6B.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
83fce251-4f6c-43c5-97aa-863753865a34		0	0	0	0	0		\N						\N		\N	\N	\N	\N		afa57b3a-113e-42a3-9514-a613bb6da4fa	57ed13b4-1805-4306-9c23-d9b976a0b73c	\N	\N	\N	\N	\N	\N	\N	\N	34	\N			\N	f	f	f						\N	\N	f		f				6B.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
5e753681-ac1a-406f-82e9-d64d849d4324		1.11	2.47	2.93	2.84	4.48	20-30	\N						\N		\N	\N	\N	\N		d7ddf966-b185-4640-8005-f906c1800198	52d19345-4d97-424c-bf5e-49be1a14d752	\N	\N	\N	\N	\N	\N	\N	\N	21	\N	Female		\N	f	f	t	poorly preserved	B	A	P	A	\N	\N	f		f				6B.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
f5d0dff6-2560-4463-a2d3-ccb0d7a48543		1.57	0.92	0.25	3.9	0.75	5 years	\N						\N		\N	\N	\N	\N		159ea2d0-3caf-4576-abab-d371f468f926	512a9f54-a398-440e-b44b-8921fadf1285	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	Undetermined		\N	f	f	t	wrapped - bones showing	H	C	S	C	\N	\N	f		f				6B.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
9baca943-60a4-48fc-a4f9-2bf9e295c8fa		0	0	0	0	0		\N						\N		\N	\N	\N	\N		3e015ec3-0c53-4530-b33f-641671d9c0eb	78c4d7ed-ea9e-4f38-944e-73c976a56375	\N	\N	\N	\N	\N	\N	\N	\N	26	\N			\N	f	f	f						\N	\N	f		f				6B.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
e08d750f-5dc9-4ce5-bca9-d842fd625b4a	West	1.72	1.1	1.1	3.9	3.9		\N						\N		\N	\N	\N	\N		204b1b33-88c6-4f6b-b21b-be976da57f14	044dab9d-10d4-4047-ac40-80fee4bb6d39	\N	1994-01-01	\N	\N	\N	\N	\N	\N	14	\N	Undetermined		\N	f	f	t		B	U	U	U	\N	\N	t		f	1994B	42		6B.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
2cf03596-59b5-41f6-aaef-38720155858a	West	1.43	2.17	2.25	2.79	4.36	U	\N						\N		\N	\N	\N	\N	was the fifth burial to come from a cluster in a shaft which likely contains more	5de92a02-45c4-4b2b-acd3-429c3fb7b147	a45233ee-4695-4e28-84a8-8d90488b10f2	\N	1997-01-01	\N	\N	\N	\N	\N	1.58	23	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	33		6B.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
68ad1178-4e84-4a6f-bab2-b81e95f742c7		1.25	4.7	4.8	0.3	1.8	U	\N						\N		\N	\N	\N	\N	Wrapped in linen with red/white ribbon over linen	e5a7180b-97ee-470b-8f4b-ebf6effaa53e	9163c9f3-e6b3-42e4-80b8-1a1b09a84c83	\N	\N	\N	\N	\N	2006	\N	\N	32	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	t		f				6B.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
dd961579-58a3-4a91-a852-b897bcbbb4cd	West	1.1	1.2	1.2	2.02	2.8	U	\N				dkbrwn		\N		\N	\N	\N	\N	Well wrapped - much ribbon\nKnotted over the chest\n6 wraps around the neck - 8 around the hips\nPottery shards seem to be placed along this body - and many others\nCan't find details on age, gender, and hair in field book that are described in database (TW)\nOutside of body has 6 strands of ribbon accross the shoulders and interlaced across the chest\nBody wrapped with 4 layers of coarse cloth\nSmall section of fringe	a1074bd4-4f43-4c7a-be2e-f5d75af4a057	675d1e62-07f7-424b-bd62-017630040a5f	\N	1987-01-01	\N	\N	\N	\N	\N	1.86	13	\N	Male		\N	f	f	t	W	W	A	P	U	\N	\N	t	U	t	1987A/1987B	29/37		6B.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
5e3af764-4877-4267-8f31-1b4df86175d9		2.17	1.52	1.13	1.38	2.47	12-Oct	\N						\N		\N	\N	\N	\N		56dbfefc-719b-47fc-b5b9-4e9bdf39adaf	251b792a-c971-4cda-8d31-ba383f827c9b	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	Undetermined		\N	f	f	f	SKELETON	B	C	P	C	\N	\N	f		f				6B.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
6baa1593-69b8-40a3-b22a-87e01ac4b15e		0	0	0	0	0		\N						\N		\N	\N	\N	\N		5acb0831-763d-4869-ad44-b9b025274778	83a5c336-7a62-4c9e-b353-53f270e18897	\N	\N	\N	\N	\N	\N	\N	\N	4	\N			\N	f	f	f						\N	\N	f		f				6C.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
76d9ac67-a02e-44db-b8d1-dc1bd70ab4c6	West	0.8	2.2	2.1	1.55	1.25		\N						\N		\N	\N	\N	\N	Child wrapped\nReeds buried with child, necklace with some beads\nHair present	31da6321-371b-43dc-a66e-0def6a3c9786	1d72dc5f-036a-46f9-af06-5f8f037f1322	\N	1987-01-01	\N	\N	\N	\N	\N	\N	2	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	f	Y	f	1987A	18		6C.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
3bbca8cc-3d30-4d8c-9b7f-fb802bfe5a00	Undefined	1	1.5	1.55	2.35	3.96		\N				Brown		\N		\N	\N	\N	\N	reeds, palm leafs\nskull, brown hair	fdc5b950-8ad5-4c24-9cb2-0470e28350e9	b877c997-18c3-46d3-873b-2da45f74d044	\N	1994-01-01	\N	\N	\N	\N	\N	\N	7	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B/1994C	1994B: 34,50 & 1994C 15		6C.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
8798296e-1322-483d-951b-ae1d306f2636		0.65	2.15	1.23	0.57	2	20-30?	\N				rd-bln		\N		\N	\N	\N	\N		41080bdb-0674-4ed7-9a79-eaad81bb91d9	9b058241-0989-40c0-bd20-d8a1bbe7fe4d	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	Male		\N	f	f	t	poorly preserved	B	A	P	A	\N	\N	t		f				6C.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
385c5352-dc15-4888-b3e8-fd6ba0991f82		0	0	0	0	0		\N						\N		\N	\N	\N	\N		0f91d5bc-193d-496c-9bea-934c2fe0a833	dc1671e7-b8ca-47f9-825e-c811ae67c3b1	\N	\N	\N	\N	\N	\N	\N	\N	10	\N			\N	f	f	f						\N	\N	f		f				6C.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
523e7141-55a6-4565-b097-0939345bf0fa		1.8	0.33	0.78	1.53	0.76	7-8 years	\N				brown		\N		\N	\N	\N	\N		885d927b-1086-4b42-9635-763f01e177e8	5d5f17ab-b9a1-432e-8546-4351f0227c4a	\N	\N	\N	\N	\N	\N	\N	\N	47	\N	Undetermined		\N	f	f	t	bones and skull	B	C	P	C	\N	\N	t		f				8F.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
9d1030e4-7b56-48de-9e36-cd4e85a0af94	West	2.29	2.34	2.25	1	2.43		\N						\N		\N	\N	\N	\N	Decomposed brown cloth outside\nSkull intact\nLarge pot is with burial\nContaining brown Aromatic solid chunks inside pot\nPhoto taken on Blue Roll #3 picture 34	87e8415a-1b4f-4950-b491-3151c77879e3	44a33c4b-fdeb-49f3-bf68-9f18a0aeba84	\N	1994-01-01	\N	\N	\N	\N	\N	\N	19	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B	30		6C.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
636c3c4c-9389-4f52-b3c7-211d49d717b8		1.34	0.36	1.22	1.62	0.42	20-30	\N				brown		\N		\N	\N	\N	\N		986b8b20-952d-44bf-8cc9-383861928143	556d2f67-f599-40a7-9e89-81f19bf45eb9	\N	\N	\N	\N	\N	\N	\N	\N	39	\N	Female		\N	f	f	f	bones and skull	B	A	P	A	\N	\N	t		f				6C.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
6c9f107f-179a-480e-b146-bee16d8f664b		0	0	0	0	0		\N						\N		\N	\N	\N	\N		06b22b88-c982-4360-b6f9-2b1196d795ce	0caea488-c02c-458d-b658-9299e52c02d7	\N	\N	\N	\N	\N	\N	\N	\N	18	\N			\N	f	f	f						\N	\N	f		f				6C.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
dd58a634-8c11-4110-a8bd-161b0ab1920f	West	2.27	2.18	1.88	2.15	3.67		\N						\N		\N	\N	\N	\N	On same level as the Reversal child	19f3773b-a454-49cb-ab57-47e04507c85d	2baac2be-15aa-442a-99c8-4574bf90c595	\N	1994-01-01	\N	\N	\N	\N	\N	\N	17	\N	Undetermined		\N	f	f	t		B	A	U	A	\N	\N	t		f	1994B	28		6C.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
f9a3f893-7a0e-4666-97e6-288144f179c3		0	0	0	0	0		\N						\N		\N	\N	\N	\N		ccebf392-bad5-433f-bd85-6ee642454bf1	fc8f2cfd-8c53-4d77-aa6d-7c58f8f814a9	\N	\N	\N	\N	\N	2006	\N	\N	3	\N			\N	f	f	f						\N	\N	f		f				6C.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
b0f035ef-8204-421e-b763-3201efd29f42	East	1.9	0.21	0.59	3.44	2.14	18-24	\N				brown		\N		\N	\N	\N	\N		1201e804-a865-48c5-8d6a-de1486c12bdb	21b304aa-1966-4c97-8b5d-ee89b5780bb3	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	Female		\N	f	f	t	bones and skull	B	A	P	A	\N	\N	t		f				6C.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
e9208c0a-24be-4465-ab8c-20f4f3917c5c		0	0	0	0	0		\N						\N		\N	\N	\N	\N		6bd5d939-b367-41a0-9991-bb23b7fff003	4cf53fe0-798a-4c67-b1e3-296c7faa90d1	\N	\N	\N	\N	\N	\N	\N	\N	24	\N			\N	f	f	f						\N	\N	f		f				6C.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
7c040076-3b1e-4b82-aec3-734b6fab94fb		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	dd9216f4-2be6-4796-8e51-077a09ab0f4e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	f	f	f						\N	\N	f		f				6D.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
7ee9fb1d-9478-4931-a014-a55c3d1b9b19		0	0	0	0	0		\N						\N		\N	\N	\N	\N		ccd063bb-fff8-4518-b41a-c48dfd3e5cba	68c7d8ee-86aa-4d48-b425-19e62ce24f85	\N	\N	\N	\N	\N	\N	\N	\N	28	\N			\N	f	f	f						\N	\N	f		f				6D.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
69070289-1145-49f3-b706-b2365984be2e		0.96	2.17	0	1.93	3.22	45+	\N						\N		\N	\N	\N	\N		7a57db15-b7d4-4743-a7a2-cd731318bc62	e8f958b9-d40f-4814-a219-de3e6f665f80	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	Male		\N	f	f	f	wrapped	W	A	P	A	\N	\N	f		f				6D.03			Cribra orbitalis appears to have healed; the skull notation indicated that the burial is 6/8.  Check Field Notes to clarify.  Was the same burial given two numbers and then combined?	\N	\N	\N	\N	\N	\N	\N	\N	\N
236803c0-f2c6-4c65-8b6f-c5556a1f4e50		0	0	0	0	0		\N						\N		\N	\N	\N	\N		e5f6aa92-14e8-47b9-be57-40219f311221	9ebec670-1cf7-4fcb-93f9-c6bf787738e5	\N	\N	\N	\N	\N	2002	\N	\N	21	\N			\N	f	f	f						\N	\N	f		f				6D.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
5dca7e18-3994-4f50-bd95-cda1e0db1cdf	West	1.4	4.9	4.4	4.07	2.6	16+	\N				Brown		\N		\N	\N	\N	\N	Wrapped - chest crushed\nCan't find details on hair and age in the field book that are described in the database (TW)\nBody was skeletialized\nHead disarticulated	7a0196ad-ab39-4ec1-9508-853889049053	ef2e7e07-6cb1-41fd-884b-92399e27526f	\N	1987-01-01	\N	\N	\N	\N	\N	1.5	8	\N	Male		\N	f	f	t	wrapped/skeletalized	B	A	P	A	\N	\N	t		f	1987A	92		6D.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
4bf59054-2542-4f6b-a570-e7371723e2b0	West	1	4.4	4.09	1.1	2.9	IV	\N				Brown		\N		\N	\N	\N	\N	Full skeleton\nBody for 10 may be beneath 9\nCan't find details on gender, age, or hair in field book that are described in database (TW)	4c2783be-5c3c-44a3-bf72-8a780c0a359f	618d1709-9c89-4120-98ea-17bd56b56e14	\N	1987-01-01	\N	\N	\N	\N	\N	1.8	9	\N	Male		\N	f	f	t	SKELETON	B	C	S	U	\N	\N	t		f	1987A	64		6D.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
f1b3187b-f3ce-4852-9c4d-f6b937a1209a		1.4	3.28	2.61	4.82	3.4	40+	\N				blond		\N		\N	\N	\N	\N		dc280868-ca78-428e-91bb-dc59b63c3146	afbafbe0-996f-4a73-8b97-862b94ed0156	\N	\N	\N	\N	\N	\N	\N	\N	31	\N	Male		\N	f	f	t	SKELETON	B	A	P	A	\N	\N	t		f				6D.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
b0cd0111-72bb-48e1-aa22-e69659ef7fee		2.42	1.51	1.94	4.96	3.6	50+	\N						\N		\N	\N	\N	\N		598dd312-a24d-40f6-93f6-225a349e7f28	3934a079-33a0-4454-8902-67900f9890b8	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	Female		\N	f	f	f	bones and skull	B	A	P	A	\N	\N	f		f				6D.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
808b4604-7f5d-41ff-ad7e-61c3a49af312	West	0.9	4.59	4.5	0.3	2.1	I	\N				br-red		\N		\N	\N	\N	\N	Wrapped and ribboned - with nails, tissue, etc\nPair of sandals tied around a leather pouch\nHands crossed across abdomen\nCan't find details on hair, gender, or age in the field book that are described in the database (TW)	af6b8abb-57e1-4674-8e40-47ea65219c1f	eb7806d3-86a4-418c-96b6-d1346c97550a	\N	1987-01-01	\N	\N	\N	\N	\N	1.82	26	\N	Male		\N	f	f	f	wrapped	W	A	P	U	\N	\N	t	Y	t	1987A	86		6D.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
df3a2d76-ae81-4c95-9191-03ad025cbaba	West	1.3	4.9	4.7	3	4.5	III-IV	\N				Black		\N		\N	\N	\N	\N	Adult - Wrapped and ribboned\nSome face bundle\nOver the area where a rather nice mud brick structure began to be evident (used as offset for burial of infant)\nCan't find details age, hair, or gender in the field book that are described in the database (TW)	330e3c97-2c6a-4ca8-9df6-34e4d3696a43	d0b4c7eb-afb2-4c42-8bd0-8f3c4efd97a3	\N	1987-01-01	\N	\N	\N	\N	\N	1.5	44	\N	Female		\N	f	f	t	wrapped	W	A	P	U	\N	\N	t		t	1987A	114		6D.11			Cribra orbitalis appears to have healed	\N	\N	\N	\N	\N	\N	\N	\N	\N
5f94ca26-0902-45ca-a992-974efecf1ff8	Undefined	0	0	0	0	0		\N						\N		\N	\N	\N	\N	femur 49.1 cm	3a96c37d-dc9c-4e79-bdc3-b208cde48d12	5e5a6dfd-707b-4c77-bc1b-818a7880bb74	\N	1994-01-01	\N	\N	\N	\N	\N	\N	12	\N	Undetermined		\N	f	f	t		U	A	U	A	\N	\N	f		f	1994C	4		6D.12			Cribra orbitalis appears to have healed	\N	\N	\N	\N	\N	\N	\N	\N	\N
fb4f2035-c42a-4d72-9db9-e06aa50689b6	West	1.35	1.2	0.4	2.6	3.85	23-35 yrs?	\N				dkbrwn		\N		\N	\N	\N	\N	Can't find details on gender, hair, or age in field book that are described in database (TW)	40429451-d01b-41db-aa15-c66292700d46	f1cb7703-82b2-4345-9516-dba5364500a3	\N	1987-01-01	\N	\N	\N	\N	\N	1.5	15	\N	Male		\N	f	f	t	poorly preserved	B	A	P	A	\N	\N	t		f	1987A	71		6E.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
7b35ab55-2a59-40ac-9b7e-fc809696fadf	West	2.2	4.2	3.8	4.59	6.2	II	\N				Brown		\N		\N	\N	\N	\N	Skeletized, poor preservation, hands at sides\nSome hair preserved\nAdult\nCan't find details on hair color, age in field book that are described in database (TW)	1e1215f4-e11d-4338-b97d-8bdc319bf98f	ded5453e-2540-4015-ba2f-18446b88582c	\N	1987-01-01	\N	\N	\N	\N	\N	1.75	36	\N	Female		\N	f	f	t	SKELETON	B	A	P	U	\N	\N	t		f	1987A	42		6E.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
313691f9-169e-4227-bd70-05ca1e16d0a7	West	1.7	4.59	4.3	0.9	2.5	I	\N				dkbrwn		\N		\N	\N	\N	\N	Wrapped and ribboned\nNot well preserved\nParallel to and between mud brick structures earlier described in area\nCan't find details on hair, gender, and age in the field book that are described in the database (TW)	11fe041e-ebd2-4895-a9b7-e0652bfbe46f	0b45731c-8dcf-4dad-84b5-616894c3dd76	\N	1987-01-01	\N	\N	\N	\N	\N	1.6	13	\N	Female		\N	f	f	t	poorly preserved	B	A	P	U	\N	\N	t		f	1987A	100		6E.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
565ac1c0-3331-4fa6-b086-bb120cdb4ad1	West	1.52	2	1.52	3.13	4.92	25-30 yrs	\N				brown		\N		\N	\N	\N	\N	Measurements in 1992E\nage, gender, and hair in 1992C\nBasket case\nRed/white ribbon\nouter layer is fine linen\nCoarse inner layer\nPiece of inner with 2 bands of purple\nBrown beard	0fa3a74c-8948-4483-af77-ab3ca3db1fce	be37e6ac-ef4c-456a-a056-ea83437a1bae	\N	1992-01-01	\N	\N	\N	\N	\N	1.83	44	\N	Male		\N	f	f	t	poorly preserved	B	A	P	A	\N	\N	t		f	1992A/1992C/1992E	122/65/57		6E.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
7009b337-0ae2-4c16-a2c6-edbdc9f36657	Undefined	2.11	3.93	4.09	1.5	1.78		\N						\N		\N	\N	\N	\N	Traces of burned material including a dozen different sizes of charcoal the size of a large marble\nDepth to head 211cm depth to feet 218cm	675b4d59-2380-4a4b-9249-7097d2999f50	f98d0860-3d0e-4bda-885d-b15de663dd91	\N	1994-01-01	\N	\N	\N	\N	\N	\N	21	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B	43,46		6E.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
b00822ce-5281-4cc6-b026-dcb50b3e8e7f	Undefined	1.8	3.45	3.87	1.21	3.12	IV	\N				Brown		\N		\N	\N	\N	\N	Cloth only as fragments\nCan't find burial measurements, or details on hair, age, or gender in the field book that are noted in the database (TW)	b9b721fe-072b-4ea7-b153-a2653421ce1f	a538e294-b608-47b4-881c-685f9ff7d92d	\N	1987-01-01	\N	\N	\N	\N	\N	\N	22	\N	Male		\N	f	f	f	S	B	A	P	U	\N	\N	t	U	f	1987B	52		6E.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
0d0dfe13-756e-4bc0-b68a-0329be2a1532		0.4	3.16	3.16	1.34	1.34		\N						\N		\N	\N	\N	\N	Skull only, Samples taken: Lower (8) and upper (3) teeth	529c0873-0847-4046-ad4d-01d25a5f2e54	9f5db156-e57a-4b28-a4c9-45767d5c5bf2	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	Undetermined		\N	f	f	t		B	U	U	A	\N	\N	t		f				6E.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
d2433071-531b-44dc-87cc-4740cebbb644		0	0	0	0	0		\N						\N		\N	\N	\N	\N		605dff1f-879d-401e-98da-2cf52cf4d56d	83cb0681-a7b7-4667-af38-0aa8bcec12a3	\N	\N	\N	\N	\N	\N	\N	\N	41	\N			\N	f	f	f						\N	\N	f		f				6E.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
5d28653c-5571-42cc-b05b-e24bf928bb28	Undefined	1	4.8	4.59	2.29	3.9	16-21	\N				brown		\N		\N	\N	\N	\N	Basket case - outer skull wrap - coarse yarn, open weave\nFabric next to hair is red with green, yellow pattern\nlots of more details on head bundle in the 1987B field book pg. 69\nCan't find measurements in the field book that are noted in the database (TW)	da39c595-3d2b-45ea-97ce-0971ff9c10da	d244cc53-69e8-4b60-84bc-a2d38f01f73c	\N	1987-01-01	\N	\N	\N	\N	\N	\N	6	\N	Undetermined		\N	f	f	t	S	B	C	P	A	\N	\N	t	U	t	1987B	69		6E.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
7b85b5f4-2399-4bba-a056-98f9a2639dbe	West	0.92	3.67	4.24	1.77	3.4	U	\N						\N		\N	\N	\N	\N	bodies 6 and 10 together, cover left shoulder and touching 10	1992dca7-33bc-494c-93ec-abf1cc57c50b	0fe1c6df-2a18-4d83-8562-6a9e255274dc	\N	1997-01-01	\N	\N	\N	\N	\N	1.74	10	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		t	1998	21		6E.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
05f58219-8acd-4f16-beae-f26bb4badff9		0	0	0	0	0		\N						\N		\N	\N	\N	\N		5fe1432d-e43a-4c52-9a55-ff6829d6b8eb	46521fd4-e189-4ed2-a6c2-6673e80ef724	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	f	f	f						\N	\N	f		f				6E.11			No square or burial number recorded.  Recheck on the shelf in 2019.	\N	\N	\N	\N	\N	\N	\N	\N	\N
2831ebbe-0c3e-4829-b7e7-0f84869f294a	West	1.58	4.34	3.79	2.18	0.45	U	\N						\N		\N	\N	\N	\N	head-west, near burials #16 and 22	f930ff01-6c49-4cf7-a9b1-3b0bdbc0f3c7	d20c4941-e9c9-4055-8f22-e7e9666d8bd7	\N	1998-01-01	\N	\N	\N	\N	\N	1.84	26	\N	Undetermined		\N	f	f	t		B	A	U	A	\N	\N	t		f	1998	35		6E.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
489e4813-8475-4ee9-9d69-740c16fd6e30	Undefined	1	1.37	1.47	2.1	3.96	25	\N				Black		\N		\N	\N	\N	\N	Large body, palm leaf woven pieces with body\nWrapped with ribbon across body and tied with strands running the length of the body\n7 layers of fabric visible\nFabric was decomposed and crumbled with moved\nPhotographed and sampled\nCan't find measurements in the field book that are noted in the database (TW)	89f50e58-cf33-4e71-a888-9ca50d1b9b9a	c82e0b15-9854-454b-96ba-374a8e238f2c	\N	1987-01-01	\N	\N	\N	\N	\N	\N	8	\N	Female		\N	f	f	t	B	B	A	P	A	\N	\N	t	U	f	1987B	31		6F.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
6855e7a9-7cac-44a2-8e86-7cbc4806ecb7		0	0	0	0	0		\N						\N		\N	\N	\N	\N		86551330-85a4-4b39-8ea0-f2a63c78d0bd	235fa68f-2f70-4784-9af4-f68fcd6ff09f	\N	\N	\N	\N	\N	\N	\N	\N	23	\N			\N	f	f	f						\N	\N	f		f				6F.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
ae1f4733-fd1d-4023-bec7-3e303b0c7471		0.92	3.56	3.39	3.04	4.01	5 1/2 yrs.	\N				brown		\N		\N	\N	\N	\N		a815dba9-cc17-486e-8c55-68a410e62606	8e0aa796-edea-41ae-8d05-800eb7069133	\N	\N	\N	\N	\N	\N	\N	\N	9	\N	Undetermined		\N	f	f	f	well-wrapped	W	C	S	C	\N	\N	t		f				6F.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
837dcf47-a1a0-4aa7-b77e-31b1ad82d5e7		0	0	0	0	0		\N						\N		\N	\N	\N	\N		ff51b82e-0d85-4255-839e-4f872d312898	cd359025-38ab-4836-93e6-aff3d72c28b7	\N	\N	\N	\N	\N	\N	\N	\N	4	\N			\N	f	f	f						\N	\N	f		f				6F.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
af989728-249b-4433-8012-b07a018a8d53	Undefined	0	0	0	0	0		\N				U		\N		\N	\N	\N	\N	Infant, wrapped in tightly woven fabric of coarse and fine yarns, tied with rope and with ribbon (decomposed)\nFeet fabric folded and body wrapped in fabric\nMore wrapping details in 1987B field book pg. 97	6a52fc54-d64a-4f6e-9f8f-98efa4302161	f7019f7a-7b07-476a-97c2-cb795b4f119e	\N	1987-01-01	\N	\N	\N	\N	\N	\N	1	\N	Undetermined		\N	f	f	t		W	C	U	I	\N	\N	f	U	t	1987B	97		6F.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
3dd4b2e8-99d8-42a1-81a4-b378b50c3e66		0	0	0	0	0		\N						\N		\N	\N	\N	\N		5c62c6d4-3849-43a4-9deb-ab3acbe2793f	084d04ae-a147-4759-a3e0-785e45b349af	\N	\N	\N	\N	\N	\N	\N	\N	29	\N			\N	f	f	f						\N	\N	f		f				6F.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
0628155d-e071-49f0-802b-690eafb70ce6		0	0	0	0	0		\N						\N		\N	\N	\N	\N		10aba1fe-142f-4d9b-b29b-8e867889609d	f4573462-0948-45cf-ab93-b38e1e928ffe	\N	\N	\N	\N	\N	\N	\N	\N	17	\N			\N	f	f	t						\N	\N	f		f				6F.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
2f5d28b3-b019-43c5-93ed-b55538823877		0	0	0	0	0		\N						\N		\N	\N	\N	\N		63aea414-dab2-4b0b-866f-88de9daaad56	dd8ce6f8-0cc9-407d-a5d0-fc8d8a48302b	\N	\N	\N	\N	\N	\N	\N	\N	6	\N			\N	f	f	f						\N	\N	f		f				6F.08	3			\N	\N	\N	\N	\N	\N	\N	\N	\N
3579e73d-25b2-45ca-9817-65c1fff8ee0e		0.93	3.23	2.72	3.14	4.93	30-40	\N						\N		\N	\N	\N	\N		73f69734-77ea-45c1-ab1b-8553c1be6ff9	6e318976-6bd6-431b-8974-212cc8a5a2c4	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	Male		\N	f	f	t	well-wrapped	W	A	P	A	\N	\N	f		f				6F.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
138b7716-b541-481e-a1d6-6ba33684632a	West	1.9	2.29	2.2	0.57	1.6	6 Years	\N				brown		\N		\N	\N	\N	\N	Rock placed at angle to protect head\nRock to north of head, while in #33 rock is to south\nCan't find details on hair color, age in field book that are described in database (TW)\nBasketcase, some fabric remains on head\nToo decomposed to save - some sign of red/white ribbon	cad241ee-c068-4bd8-874e-812a8f8fe1ac	e72be7dc-9de9-4abc-9471-63be0b22eb83	\N	1987-01-01	\N	\N	\N	\N	\N	1.1	35	\N	Undetermined		\N	f	f	f	S	B	C	S	C	\N	\N	t	U	f	1987A/1987B	42/96		6F.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
8a5a15dc-16c5-474f-a627-b5eb6e906105		1.56	0.48	0.5	3.26	4.22	4 years	\N				brown		\N		\N	\N	\N	\N		c5f20562-06a0-488c-a2d2-957afb4ca1c5	c8282500-efd7-4857-b78a-d7c04ad2b99e	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	Undetermined		\N	f	f	f	wrapped	W	C	S	C	\N	\N	t		f				6F.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
2bf81165-412e-4cce-9d9e-ee8582ebeae3		1.06	2.63	2.25	1.87	2.52	5 years	\N				dkbrwn		\N		\N	\N	\N	\N		08ed8c9d-1484-494d-8075-7604f7a81161	3eb60418-6ddd-462d-87d6-36e8cfa9fbc2	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	P	C	\N	\N	t		f				6F.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
6593785a-c8fd-40ca-9644-20dc2f8653c5		0.45	3.66	3.58	3.1	3.98	5 1/2 yrs.	\N				blond		\N		\N	\N	\N	\N		dfd50838-4ba9-43d8-bb42-fb29873a4e8c	58ae8642-493e-479c-8046-da918aef691d	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	Undetermined		\N	f	f	f	wrapped	W	C	S	C	\N	\N	t		f				6G.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
7edc6f64-6073-4723-acae-1410f39ef81e		2.6	1.45	1.85	5	3.5	IV	\N						\N		\N	\N	\N	\N		5e899a55-61d5-484c-916e-dc8a3dac0a06	3ed79cbe-fed8-42f3-b985-86169973d1bc	\N	\N	\N	\N	\N	\N	\N	\N	30	\N	Female		\N	f	f	t	SKELETON	B	A	P	U	\N	\N	t		f				6G.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
8812ca45-b053-469b-8016-33173e3231dc	East	2.25	1.9	2.12	4.82	3.26	IV	\N				Brown		\N		\N	\N	\N	\N	Prechristian burial head to east, facing west\nOnly found sternum with imprint of fabric - saved	9f46f0b0-9a03-4bda-b8e1-9f7a10af98d9	b346e14b-9061-4748-bd2c-e2c4aadef27f	\N	1987-01-01	\N	\N	\N	\N	\N	\N	29	\N	Female		\N	f	f	t	S	B	A	P	U	\N	\N	t	U	f	1987B	71		6G.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
2563cb01-59b0-4f48-999d-3251abf9fbed		2.57	2	1.9	1.1	-0.1	U	\N						\N		\N	\N	\N	\N	Head West\nbelow level of general buried levels\nShaft was 270cm below surface	1bd23d1e-5b35-4d6c-b181-7cf75196e6a3	70f8376b-4c17-4a31-b5bf-1bd5e126ecf6	\N	\N	\N	\N	\N	2006	\N	\N	40	\N	Undetermined		\N	f	f	f		B	A	U	A	\N	\N	t		f				6G.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
77913713-5875-4bc4-92c2-4b847a4d68e7	Undefined	0.66	0.7	0.64	1.68	2.38	2-3 yrs	\N						\N		\N	\N	\N	\N	Wrapped on coarse linen, tied with solid red ribbon\nSome braid design woven into cloth\nStitched portion on back\n3 Layers of linen (one of wool)\nEvidence of purple outside the wool\nBadly decayed textiles\nPhotos and samples taken\nCalled infant in 1992A, and 2-3 yrs in 1992C\nMeasurements in 1992E	3d98886e-e054-40d4-b480-42f7d09df6b9	aaa2eee1-4d0b-417a-97de-7e08d9c02f16	\N	1992-01-01	\N	\N	\N	\N	\N	84	11	\N	Undetermined		\N	f	f	t	wrapped	W	C	U	C	\N	\N	t		f	1992A/1992C/1992E	44/23/19		6G.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
ee600623-61da-4487-ad81-3765b1bd964f		1.01	4.54	4.21	3.17	4.11	5 years	\N				brown		\N		\N	\N	\N	\N		1600091f-6fb7-42a5-81ea-c0b057eedf32	8bd27188-1930-4209-b5cd-f1ca731902b4	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	Undetermined		\N	f	f	t	wrapped	W	C	P	C	\N	\N	t		f				6G.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
f86fa873-3c52-423d-b5b8-3c00cac3979e		1.1	1.17	0.8	3.05	4.67	20-30	\N				brown		\N		\N	\N	\N	\N		b81dfc3f-2509-4d62-a47d-893b34a37e46	62f329c4-c1a9-4a3b-ab20-3ced225434c7	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	Female		\N	f	f	t	well-wrapped	W	A	P	A	\N	\N	t		f				6G.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
6c9c0b1b-d740-4c1b-8ee4-9570c634f3f7	West	1.2	1.6	0	2.75	0	V-VI	\N				dkbrwn		\N		\N	\N	\N	\N	Woman adult (something? couldn't read) not measured because head was removed as part of #17\nTaking out burial #17 was a problem - #17 was an infant buried over an adult (probably mother) and the bones were not at first clearly demareated. The adult head was acutally atop the body of the infant, but the adult body was immediately seen below\nCan't find details on age or hair in field book that are described in database (TW)	1e032952-d577-41cb-beca-cf6de9f7b1c8	6128aaf7-d63c-4774-b22f-ff313ed2fd3f	\N	1987-01-01	\N	\N	\N	\N	\N	\N	20	\N	Female		\N	f	f	t	wrapped	W	A	P	A	\N	\N	t		f	1987A	74		6G.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
cee95185-7591-4c8b-94e3-65bdc1492f39		1.62	0.75	0.19	2.73	4.37	20-30	\N						\N		\N	\N	\N	\N		bfe64a11-fa3b-498b-82e0-eda649963a20	64d955c6-1544-4b75-b63f-e4d07af3b003	\N	\N	\N	\N	\N	\N	\N	\N	42	\N	Male		\N	f	f	t	wrapped	W	A	P	A	\N	\N	f		f				6G.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
96222eb2-e327-42d9-8a79-137c14719a04		1.26	1.84	1.25	-0.2	1.28	20-25	\N				brown		\N		\N	\N	\N	\N		655545c4-fcc0-473f-93b9-8864eb2f4ff3	986152c0-3902-4bcc-ab96-82000b3267b6	\N	\N	\N	\N	\N	\N	\N	\N	38	\N	Female		\N	f	f	t	SKELETON	B	A	P	A	\N	\N	t		f				6G.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
3e1c112c-d5c4-45ba-ac9d-2159104ec636		1.95	4.25	4.25	0.25	1.75	U	\N						\N		\N	\N	\N	\N		df1845aa-2c96-4b44-85fe-6bebb49eba09	91d42c96-8cf7-424f-87a3-89cacca82858	\N	\N	\N	\N	\N	2006	\N	\N	39	\N	Undetermined		\N	f	f	f		W	A	U	U	\N	\N	t		f				6G.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
975d5553-f9b6-4a24-a37a-2827b44503d8		0	0	0	0	0		\N						\N		\N	\N	\N	\N		7a378d77-a6cf-447b-9c19-26d06e84a411	f6d68f6c-aa0d-4f32-a362-3db8ee0a54ce	\N	\N	\N	\N	\N	\N	\N	\N	30	\N			\N	f	f	f						\N	\N	f		f				6G.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
4e7f3827-b4af-451e-ab47-34b72db1ef14	East	1.61	4.33	4.5	2.08	0.63		\N						\N		\N	\N	\N	\N		2eed76e1-5e25-4aa3-93e0-02ec2e27984b	8c2096b9-bf02-40a3-8e53-4fe3adcb599f	\N	1994-01-01	\N	\N	\N	\N	\N	\N	23	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B	43		7B.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
6c92c53f-c9bb-4c46-9ef9-aba16c48800d	Undefined	1.06	3.39	3.08	0.28	1.65		\N						\N		\N	\N	\N	\N	grain inside wraps around knee, evidence of shaft tomb dug to a depth of 130cm\nMandible separated but occudes well\nYarn spinning wheel, minor vertical stick by burial 13 NW\nSkull with old crack, mandible sep; but ocludes well.	52d719aa-2976-4f29-ac91-0d97b58b9846	e9c00f56-3778-4854-ae00-6fd27787d059	\N	1994-01-01	\N	\N	\N	\N	\N	\N	11	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B	13		7B.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
7f75abe5-1000-4a61-a65d-6d793d070ac1		1.06	1.45	0	3.17	4.94	18-25	\N				brown		\N		\N	\N	\N	\N		c936dca5-b1ea-4416-a506-3fd6f1aaccd1	f43a1090-80b4-43fb-8e0c-cd0d6a8da858	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	Male		\N	f	f	f	wrapped - bones showing	H	A	P	A	\N	\N	t		f				8F.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
436c2e7f-6047-4ce7-8c47-0693ebe0b7af	Undefined	0	0	0	0	0	U	\N				U		\N		\N	\N	\N	\N	Basket case\n4 layers of cloth, fragments and ribbon\nSmall piece of purple dyed cloth	52e82fc8-61dd-4218-8867-2546190bd48f	2cd098a5-84a4-4eae-b975-d246d152996f	\N	1987-01-01	\N	\N	\N	\N	\N	\N	15	\N	Undetermined		\N	f	f	t	S	B	U	U	U	\N	\N	f	U	f	1987B	40		7B.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
43f8641e-dea8-421f-975e-5c4627e0e84f		0.45	2.12	1.42	0.1	1.57	30+	\N				brown		\N		\N	\N	\N	\N		54792e0a-3fab-4536-8164-78aff8a1f5c4	5554852f-a113-42d1-86fd-373119ef60f2	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	Male		\N	f	f	t	bones and skull	B	A	P	A	\N	\N	t		f				7B.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
c56f8591-76f3-4eeb-9869-ce85bdf8f6b0		3.34	0.64	1.3	1.36	-0.77		\N						\N		\N	\N	\N	\N	Inside Mud Brick Structure	cf2ce4ee-f5f3-49a1-a345-d1b6642f5901	d8e5bfbd-6866-4dea-86af-a98d9c55a089	\N	\N	\N	\N	\N	\N	\N	\N	4	\N	Female		\N	f	f	t		B	A	U	U	\N	\N	t		f				7B.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
f17ac014-c39a-4d13-a0bd-12ef05e7b39b		0	0	0	0	0		\N						\N		\N	\N	\N	\N		58c9a07e-f707-4064-a866-388d492b75e2	c0b853ee-20be-46fc-9624-81fab0c2bb1a	\N	\N	\N	\N	\N	\N	\N	\N	21	\N			\N	f	f	f						\N	\N	f		f				7B.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
f7338570-d788-4205-80fe-1e2a175521a0	West	0	2.4	1.95	0.55	1.1		\N						\N		\N	\N	\N	\N	Infant wrapped\nHead west, but not quite true E - W\nHair present	f4b520d4-d29d-4c1d-b124-7aca6097945f	4cf53f32-8c26-4dd6-8aa8-cba4b289a50f	\N	1987-01-01	\N	\N	\N	\N	t	0.8	3	\N	Undetermined		\N	f	f	t		W	C	U	I	\N	\N	f		f	1987A	18		7B.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
77178016-5151-4cc1-8a5b-fbb7cf41d280		0.52	3.8	3.8	0.97	0.97		\N						\N		\N	\N	\N	\N	No teeth, Skull with mandible	4cae5ca8-bae2-40c6-aa23-15d3f613af42	06b50a9c-420d-44d4-8c07-6a628c597ed8	\N	\N	\N	\N	\N	\N	t	\N	3	\N	Undetermined		\N	f	f	t		B	A	U	A	\N	\N	t		f				7B.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
6178f56c-9489-484c-8e4a-b711602dbf03		0	0	0	0	0		\N						\N		\N	\N	\N	\N	This is skull 31A	c93afa20-a3e1-40da-af7f-e70746ed2b0c	9d7926f2-3fe5-4f67-bf6d-35fad5ee8cf8	\N	\N	\N	\N	\N	\N	\N	\N	31	\N			\N	f	f	f						\N	\N	f		f				7B.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
a38d927b-c168-41f7-93bd-615f95519254		0	0	0	0	0		\N						\N		\N	\N	\N	\N		0fbde7e4-feef-43fa-ac0f-aa6efcfdbf09	5e4c8515-d5f6-4f88-bf96-98a5ef1980d3	\N	\N	\N	\N	\N	\N	\N	\N	1	\N			\N	f	f	f						\N	\N	f		f				7B.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
086ab989-bfa2-40d5-a668-7e723d6654a8		0.85	2.99	3.08	4.38	3.77	7-8 years	\N				brown		\N		\N	\N	\N	\N		e9ede8be-73d2-41ca-97f7-43557c2d1cf5	4572d841-745f-46c0-a057-863eddf57208	\N	\N	\N	\N	\N	\N	\N	\N	33	\N	Female		\N	f	f	t	bones and skull	B	C	P	C	\N	\N	t		f				7B.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
a2a8d7d6-8dc6-4ff6-97f1-30dddc1fabbe		1.3	3.7	0	0.2	0	27 years	\N				ltbrwn		\N		\N	\N	\N	\N	Badly disturbed - many bones missing - no order to those remaining\n2 skulls (THIS IS SKULL 31B)  - no mandibles (?) - assorted bones - not many - maybe more of the burial below\nCan't find details on hair, gender, or age in the field book that are described in the database (TW)	15e767ad-205c-4820-9b7e-8a6ffa287487	363f3485-8631-4f0d-bf3e-7d4b68568c29	\N	1987-01-01	\N	\N	\N	\N	\N	\N	31	\N	Female		\N	f	f	t	scattered bones with skull	B	A	P	A	\N	\N	t		f	1987A	100		7B.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
e65c093f-9fe6-45f2-a4b0-62d30bd0cb36		1.31	1.6	2.02	1.12	1.88	9-Aug	\N						\N		\N	\N	\N	\N		31f8aafa-1c7e-45be-bace-888b13e2b4cf	189aa3ae-cd94-436a-800e-75ed93583a9e	\N	\N	\N	\N	\N	\N	\N	\N	28	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	P	C	\N	\N	f		f				7B.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
85c95a6c-00aa-4c2a-9cc3-08cf35c76669		0	0	0	0	0		\N						\N		\N	\N	\N	\N		dedcb11f-6ddb-463a-969b-7b9c1ef4e1d1	12ea0612-031b-41cd-9aaf-324e6425697e	\N	\N	\N	\N	\N	\N	\N	\N	15	\N			\N	f	f	f						\N	\N	f		f				7C.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
fbce5210-cb70-4aef-9056-84ebe268116e		0	0	0	0	0		\N						\N		\N	\N	\N	\N		25f796a4-0dae-4bcb-81e0-d1aaf96edec7	592fa5e2-1356-425e-9d82-5aa20cf544b6	\N	\N	\N	\N	\N	\N	\N	\N	22	\N			\N	f	f	f						\N	\N	f		f				7C.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
2a9e999b-3df0-4846-8620-8a55bffc05b2		0.4	0.9	0.9	2.8	2.8		\N						\N		\N	\N	\N	\N	Skull only, Samples taken: teeth (5)	3f3803cd-3bb1-42af-b29a-015be26ec70e	ed02df42-f5b0-4b30-a08c-ea5a8ca952a5	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	Undetermined		\N	f	f	f		B	U	U	A	\N	\N	t		f				7C.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
7a03e87b-7c32-424d-b095-f879096edbdd		2.06	0	0.66	4.5	3.1	30+	\N				dkbrwn		\N		\N	\N	\N	\N		cf348798-c49b-4dde-a22b-7ec39d1d195d	28ea7b57-64ba-4397-ab1d-1eaab5e91a59	\N	\N	\N	\N	\N	\N	\N	\N	46	\N	Female		\N	f	t	t	SKELETON	B	A	P	A	\N	\N	t		f				7C.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
703696ad-a091-4834-b268-751aef01a4a4		1.3	3.92	3.32	2.27	3.85	18	\N				dkbrwn		\N		\N	\N	\N	\N		3c47735b-3a4d-4a2a-af7b-5e43bef99571	b47136d5-d99f-487f-911a-11df501d1048	\N	\N	\N	\N	\N	\N	t	\N	26	\N	Female		\N	f	f	f	wrapped	W	A	P	A	\N	\N	t		f				7C.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
fc1817e3-309c-4fb2-8839-8858e7fdf9f2	Undefined	1.6	2.15	1.86	3.26	5	III	\N				Brown		\N		\N	\N	\N	\N	Body wrapped in coarse fabric and tied in cross patter with strips of torn cloth of similar coarse construction\n8 layers of coarse cloth on outside, inside layer of fine cloth\nCan't find details on age, gender, and hair in field book that are described in database (TW)\nCan't find measurements in the field book that are noted in the database (TW)	53049ce1-2577-46bc-ad5a-e215f0185ff9	8af0ebdd-2fe4-4d1c-b891-22b5f06c36eb	\N	1987-01-01	\N	\N	\N	\N	t	\N	20	\N	Male		\N	f	f	t	W	W	A	P	U	\N	\N	t	U	f	1987B	54		7C.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
675ea5f7-8d82-4b9a-a976-d87cc3adc67b		1.13	2.08	2.4	4.15	5.58		\N						\N		\N	\N	\N	\N		cdaa4d20-5ff9-4cd1-8f7f-17093fa45bf9	e3d78568-d0ba-4fdd-b368-45b444b12484	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	Undetermined		\N	f	f	t		W	A	U	U	\N	\N	t		f				7C.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
bfbd8eca-2b6b-4943-b58a-a15dc45fcafa	West	0.64	2.61	3.9	3.13	4.95	IV-V?	\N				brown		\N		\N	\N	\N	\N	Adult burial, covered with rock, directly south of burial #2 (also with rock protection)\nWell wrapped and ribboned\nDo we have family burial?\nHas a beard\nFeet in better condition than most\nCan't find age, gender, and hair details in field book that are described in database (TW)	9766b044-3271-49d3-8cd5-fe92809615b0	2816b7c5-fb31-439d-a61b-04f22177cb17	\N	1987-01-01	\N	\N	\N	\N	\N	1.73	3	\N	Male		\N	f	f	t	poorly preserved	B	A	P	U	\N	\N	t		f	1987A	49		7C.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
0eee2a68-5e4d-4bbd-b288-2080ff83afa5		0	0	0	0	0		\N						\N		\N	\N	\N	\N		22f0128d-d5b2-4a96-8e41-53f4ece5eec9	fb0799d4-6b0d-45ff-b34d-db7aeb819b94	\N	\N	\N	\N	\N	\N	\N	\N	35	\N			\N	f	f	f						\N	\N	f		f				7C.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
29155c8b-92e1-476b-9469-2a0b00fd730f		0	0	0	0	0		\N						\N		\N	\N	\N	\N		00932500-95ea-4251-8aa8-c8e8a45ac532	3cdf7d42-6f8c-42a9-a86e-265b466a3192	\N	\N	\N	\N	\N	\N	\N	\N	43	\N			\N	f	f	f						\N	\N	f		f				7C.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
de33a00e-1a84-4363-87fc-613a99dfaca0		0	0	0	0	0		\N						\N		\N	\N	\N	\N		be6ac9a5-8188-4f7f-be77-d88b7cac11c5	481aa626-09ad-4098-b7d6-9e8de3cb7c1d	\N	\N	\N	\N	\N	2002	\N	\N	28	\N			\N	f	f	f						\N	\N	f		f				7C.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
ddc1d2b5-3e2d-4359-a471-0d21ab1dc993		0	0	0	0	0		\N						\N		\N	\N	\N	\N		b535205c-56a1-48a3-ba7f-556f50498fee	0335b7c5-cae4-4910-8789-a9865a860171	\N	\N	\N	\N	\N	2002	\N	\N	22	\N			\N	f	f	f						\N	\N	f		f				7C.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
8fb1cd55-03d2-4bf1-96f7-ea0d14a8f026		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	813cd251-3624-44ec-baa4-15ad59c446b1	\N	\N	\N	\N	\N	\N	\N	\N	2	\N			\N	f	f	f						\N	\N	f		f				7D.01	14			\N	\N	\N	\N	\N	\N	\N	\N	\N
6ce9c973-c6d8-4c18-a505-9bd3a38523ad	Undefined	0.56	0.75	0.65	1.45	1.75	infant	\N				br-red		\N		\N	\N	\N	\N	Infant wrapped in a second blanket or roe\nSome green design\nTied with robe\nI don't know where it is it is said to have "red-brown" hair\nMeasurements in 1992E	1a3d1317-7da1-4133-8b0c-1c6a701d5672	b655272c-344a-4845-b1dd-993ec4613e2e	\N	1992-01-01	\N	\N	\N	\N	\N	0.4	10	\N	Undetermined		\N	f	f	t	wrapped	W	C	S	I	\N	\N	t		f	1992A/1992E	47/19-27		7D.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
1d26f55a-7942-43ce-952b-a5990561b807		0	0	0	0	0		\N						\N		\N	\N	\N	\N		264f13dc-b60d-40ca-bde9-bd75e2b1db94	f2fe6681-b79c-4039-9383-b1e5ebe600a6	\N	\N	\N	\N	\N	\N	\N	\N	47	\N			\N	f	f	f						\N	\N	f		f				7D.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
39681bc2-f253-45f4-8677-80f78d8ba20b		0	0	0	0	0		\N						\N		\N	\N	\N	\N		38a2a9b1-bb54-40bf-b811-02aecbab6606	302443fe-258d-4bf9-b7e0-292fe4cd1276	\N	\N	\N	\N	\N	\N	\N	\N	1	\N			\N	f	f	f						\N	\N	f		f				7D.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
94c56a26-ea10-40df-a6c9-1c47335b7b4d		0	0	0	0	0		\N						\N		\N	\N	\N	\N		061c00f8-76e0-4ba6-9ad6-f55a961de598	336c32cf-d250-4698-ba47-be61c0136df2	\N	\N	\N	\N	\N	\N	\N	\N	5	\N			\N	f	f	f						\N	\N	f		f				7D.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
f3afbe01-8185-4b87-988a-346b7ad23059		0	0	0	0	0		\N						\N		\N	\N	\N	\N		388557db-b56f-4611-b0a0-f5ec4e6959b9	e6153b1e-ee89-491c-b8de-7508bb2a772a	\N	\N	\N	\N	\N	\N	\N	\N	32	\N			\N	f	f	f						\N	\N	f		f				7D.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
8431e7ec-f080-42c5-96e2-79f1f704728b	East	1.9	2.44	2.36	3.8	2.8		\N						\N		\N	\N	\N	\N	Buried behind flint stone wall	db5c6a61-ffc2-4a7b-a2d9-fdc72f8daa2e	e37f7b32-8c7f-4d9e-8f64-cb01725f1065	\N	1994-01-01	\N	\N	\N	\N	\N	\N	22	\N	Undetermined		\N	f	f	t		B	C	U	C	\N	\N	t		f	1994B	B-12,16		7D.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
ed3ed119-9553-45ff-b83c-6eacfdaf088f	Undefined	2.02	3.84	3.56	2.2	0.7		\N						\N		\N	\N	\N	\N	Depth to head 203cm depth to feet 220cm	8e8145f5-4eca-4925-be5a-020352b13db8	a6472356-1cf2-4670-be0b-454d92ba7070	\N	1994-01-01	\N	\N	\N	\N	\N	\N	20	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B	43		7D.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
89292170-4352-4265-8ca0-51bb4f5ed92b		1.5	3.98	3.98	1.5	1.5		\N						\N		\N	\N	\N	\N	Sample taken 3rd molar	e1a9d268-8e1f-43ad-a8b8-b03fd61a82e7	41f662ef-25d1-4928-835d-bea07b528e7e	\N	\N	\N	\N	\N	\N	t	\N	4	\N	Female		\N	f	f	t		B	A	U	A	\N	\N	t		f				7D.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
43a85951-77a7-4195-90de-ed43b154133b		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	f4575b71-e1a8-4df9-9bdd-8f8edc724601	\N	\N	\N	\N	\N	\N	t	\N	\N	\N			\N	f	f	f						\N	\N	f		f				7D.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
222c3bfc-8d1c-4fa9-8079-1491249db78c		0	0	0	0	0		\N						\N		\N	\N	\N	\N		e5cb82b7-7632-45a4-a7a8-8eb042f45737	523ba597-ffd1-4a18-87f8-71c034400b60	\N	\N	\N	\N	\N	\N	\N	\N	42	\N			\N	f	f	f						\N	\N	f		f				7D.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
611ce3c7-9c16-4872-9e04-981619019dc9	West	2.31	2.24	2.1	2.81	3.77		\N						\N		\N	\N	\N	\N	Some pottery Broken	82c457c6-427e-4914-9147-c707aa67e402	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	23	\N	Undetermined		\N	f	f	t		B	C	U	C	\N	\N	t		f	1994B	B-12,16						\N	\N	\N	\N	\N	\N	\N	\N	\N
5de91827-251c-493c-9c95-b66680d62112	Undefined	2.88	4.11	2.94	2.94	4.21	24	\N				U		\N		\N	\N	\N	\N	Body had one skull but parts for 4 arms and 3 shoulders\nSmall fabric fragments - coarse undyed fabric, finer cloth with remts\nRows purple design, red/white - pattern ribbon\nA small quantity of white cystalline material, possible gypsum crystals was found inside the body crystals. This burial wrapped head to toe in reeds\nCan't find measurements, or details on age, or gender in field book that are described in database (TW)	03ff26b5-d526-4f25-86a4-8a983b2f683e	f1dae7ee-7aac-49ca-acea-a738d20c2164	\N	1987-01-01	\N	\N	\N	\N	\N	\N	21	\N	Male		\N	f	f	f	D	B	A	P	A	\N	\N	t	U	f	1987B	48		7D.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
1a4f08c6-95a9-407c-8f7a-37cc540a0d17	Undefined	1.2	0.7	0.6	3.9	2.4	15 years	\N				Brown		\N		\N	\N	\N	\N	Face bundle filled with reeds\nUndyed cloth tied with red ribbon\nHead is wrapped with an outer layer of undyed coarse fabric\nA 2 ply yellow cord is wrapped under chin, over the head, ? back from the crown and then goes down behind the head\nThe fabric in the back shows evidence of the yellow and green woven into the red. There is one bead under the outer layer of cloth but on top of the hood, perhaps what appears as a necklace, once was draped over the forehead. This head was woven into the head piece on a red and green thread.\nSaved beads and fabric samples\nCan't find burial measurements, or details on age, or gender in the field book that are noted in the database (TW)	42a98042-46eb-48b8-8246-b201dfdf2b32	a3afc678-42f7-46de-8438-547b261cdcc2	\N	1987-01-01	\N	\N	\N	\N	\N	\N	11	\N	Female		\N	f	f	t	B	B	C	P	A	\N	\N	t	Necklace	t	1987B	32		7E.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
4078b18a-07f3-4de5-96e8-e0be5127dd6b		2.29	2.1	1.87	2.29	1.12		\N						\N		\N	\N	\N	\N		64155888-ecb0-4718-b66b-e6a5d301f397	e16f70b1-356a-4970-b59e-774e7ffac7c3	\N	\N	\N	\N	\N	\N	\N	\N	29	\N	Undetermined		\N	f	f	f	SKELETON	B	A	U	U	\N	\N	t		f				7E.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
be092821-79e3-41b5-ad66-0b274d7ffc8f	West	1	4.3	4.3	0.35	2.04	III-IV?	\N				ltbrwn		\N		\N	\N	\N	\N	Adult, running parallel to mud brick stuctures on north side\nWrapped - not well preserved\nBasket case - coarse fabric tied with red/white ribbon\nSome finer woven fabric about 3rd layer\nCoarse fabric next to hair\nCan't find details on hair color, gender, or age in field book that are described in database (TW)	bd4c7f53-7d98-42e1-bdaa-82d27f70fa3b	cd93d7a3-9bb1-4c88-8f1e-b8cead56d418	\N	1987-01-01	\N	\N	\N	\N	\N	1.6	40	\N	Female		\N	f	f	f	S	B	A	P	U	\N	\N	t	U	f	1987A/1987B	53/103		7E.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
2bf69948-b0ca-44e8-b0cf-6cd1e2abca78		1.75	4.08	4.08	1.5	1.5		\N						\N		\N	\N	\N	\N	2 photos taken\nOutside mud brick structure	f1912d67-27c6-4d82-b63a-849f9876b84c	78fd084b-5059-4d61-b2c0-0ffd7790a426	\N	\N	\N	\N	\N	\N	\N	\N	5	\N	Male		\N	f	f	t	Basket	W	A	U	U	\N	\N	t		f				7E.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
14ff14d5-3c8d-4ca7-a74a-7564491863df		0.6	1.35	1.22	3.78	4.76	25-35	\N						\N		\N	\N	\N	\N		f4b73c07-6fe7-4f7c-826d-d7dc0b34f3f7	ce5c0aab-a3ff-49d8-8e58-dc64d829cc85	\N	\N	\N	\N	\N	\N	\N	\N	5	\N	Female		\N	f	f	f	wrapped	W	A	P	A	\N	\N	f		f				7E.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
c7104449-54c8-4006-8c3d-2c7b797d1a32		1.25	1.6	0	1.35	0	45+	\N						\N		\N	\N	\N	\N		72a6c8e1-ff23-447b-bbae-56b97af40042	3bc8a1a5-173d-4fef-afdf-09f4276d3143	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	Male		\N	f	f	t	Skull only	B	A	S	A	\N	\N	f		f				7E.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
c66c5404-5b60-413a-8317-47a8189d9318		0	0	0	0	0		\N						\N		\N	\N	\N	\N		ae241ccf-d641-4e3e-bea2-fe5897348516	6944da97-1238-4b05-b81e-88d644252f9b	\N	\N	\N	\N	\N	\N	\N	\N	1	\N			\N	f	f	t						\N	\N	f		f				7E.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
cbb3564c-ba34-437d-ac5b-683fcd6309fa	West	2	4.4	4.09	4.5	6.1	III?	\N						\N		\N	\N	\N	\N	Rock placed at an angle to protect the head\nRibbon remts, but poor state of preservation\nSmall child just south will be #34\nCan't find details on age and gender\nBasketcase - fabric very decomposed\nWrapped in red/white ribbon, some fringed fabric\nNote the body, particularly the spinal cord was full of brown bags	947293e1-ef3a-4a08-b3d5-f04da86adb0c	3f16c94e-a2de-4a95-a8f1-f22c2abc3b4f	\N	1987-01-01	\N	\N	\N	\N	t	1.7	33	\N	Female		\N	f	f	t	S	B	A	P	U	\N	\N	f	U	f	1987A/1987B	40/94		7E.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
7d7b1a55-493b-47f1-a9ff-d67c7ba45109	West	1.78	3.12	2.69	0.84	2.29	U	\N						\N		\N	\N	\N	\N	Unusual for a head west burial to be offset in a shaft, but this one is offset to the south	85fefcb5-3322-40bd-b3d3-6140ee209104	112bbde3-b27c-4c5e-b33b-31560e6c3314	\N	2005-01-01	\N	\N	\N	2005	\N	1.65	27	\N	Undetermined		\N	f	f	f		W	U	U	U	\N	\N	f		f	2005	33		7E.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
55c75c79-31ab-4439-9368-244d60a71446	East	2.19	3.95	4.55	2.5	0.72	35-45 yrs	\N				brown		\N		\N	\N	\N	\N	age, gender, and hair details in 1992C\n8 samples	ab5d10b2-6173-4e59-89c1-129bbbd3dce2	422c7f8f-c444-4661-9b8c-9353e9bfc1bf	\N	1992-01-01	\N	\N	\N	\N	\N	1.9	44	\N	Female		\N	f	f	t	SKELETON	B	A	P	A	\N	\N	t		f	1992A/1992C	127/73		7E.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
615b98cd-81b8-48c4-ba1e-f9116da50d13		1.01	2.58	1.78	1.94	2.85	6-May	\N				dkbrwn		\N		\N	\N	\N	\N		53a0bc75-09a1-4f0e-aaf5-e27ed99b07c1	a7b563a1-1aac-435f-b83a-688199a24179	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	Male		\N	f	f	f	wrapped, head showing	H	C	P	C	\N	\N	t		f				7E.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
e54e285e-58bc-4833-ba93-74eccd2d30d4	Undefined	1	1.11	0.76	4	5.6	IV	\N				brown		\N		\N	\N	\N	\N	Coarse yarn, tight weave\nWrapped with brown/white ribbon\nBody wrap decomposed\nLots of more wrapping details in 1987B field book pg. 84-85\nCan't find details on age and hair in field book that are described in database (TW)\nCan't find measurements in the field book that are noted in the database (TW)	eb961ce3-53b9-4631-a8c9-091712b5a93d	15565db0-1fd6-409d-9ca0-4a0c53981a76	\N	1987-01-01	\N	\N	\N	\N	\N	\N	10	\N	Male		\N	f	f	f	W	W	A	P	U	\N	\N	t	U	t	1987B	84		7E.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
171667c8-5100-4964-8e5d-7f9b2fa4ce9a		0	0	0	0	0		\N						\N		\N	\N	\N	\N		139cc71a-2f12-49e2-9b5d-fdf27e935e70	b595eb6d-24f5-4352-9dd2-91ca57409dfb	\N	\N	\N	\N	\N	\N	\N	\N	2	\N			\N	f	f	f						\N	\N	f		f				7F.01	3			\N	\N	\N	\N	\N	\N	\N	\N	\N
c6f7bbb4-2712-490d-bbb5-eee88e649048	Undefined	1	2.8	2.7	3.53	1.9	IV	\N				Brown		\N		\N	\N	\N	\N	Body outer wrap undyed\nFine warp yarns, coarse filling yarns\nBody wrapped with 2 types of ribbon\nFirst red, next to cloth, second brown and white pattern\nMore wrapping details continue on pg. 29 and 30	9f103cc4-c6f9-49cd-abec-4b9f7353d9a0	8615eb3d-4236-418a-9f33-16edca4f0e29	\N	1987-01-01	\N	\N	\N	\N	\N	\N	10	\N	Female		\N	f	f	t	W	W	A	P	U	\N	\N	t	U	f	1987B	29		7F.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
507a8513-0e25-47e2-8511-01c18ba2ac95	West	0.6	1.14	0.9	0.95	2.5	V-VI	\N				Brown		\N		\N	\N	\N	\N	No details in the 1987 field book about this burial\nCan't find details on hair and age in the field book that are described in the database (TW)	e05a27a2-9dd6-4e93-88f1-e26b357360d8	6ab5eb79-bd27-48cd-94a4-700bb591b4a0	\N	1987-01-01	\N	\N	\N	\N	\N	1.62	4	\N	Male		\N	f	f	t	poorly preserved	B	A	P	U	\N	\N	t		f	1987A	80		7F.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
6d4ad459-7f7d-4618-880f-e14f0d1c4162	East	2.29	2.4	2.65	1.95	0.4	V	\N				Brown		\N		\N	\N	\N	\N	Poorly preserved - adult\nCan't find details on age, gender, hair in field book that are described in database (TW)	eb8ba21c-7c36-4e3a-a04a-2b79fde6dbdc	402f6861-03bf-4814-8901-b7174c4f89ac	\N	1987-01-01	\N	\N	\N	\N	\N	1.63	37	\N	Female		\N	f	f	t	poorly preserved	B	A	P	U	\N	\N	t		f	1987A	44		7F.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
c7a15827-3fe6-4f75-a1d9-102e86325992		1.66	3.94	3.38	2.39	3.77	30-40	\N				blond		\N		\N	\N	\N	\N		e4ee45a0-d771-4611-a9b6-20e4d3a953b3	8a03c0c5-ea53-45fb-9591-64e8331c74a0	\N	\N	\N	\N	\N	\N	\N	\N	32	\N	Male		\N	f	f	t	bones and skull	B	A	P	A	\N	\N	t		f				7F.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
aac10b9a-5c1b-4044-840c-e231f4b9f022		0.88	2.7	0	3.4	0	5-Apr	\N				dkbrwn		\N		\N	\N	\N	\N		88fcf53d-2d24-451c-8895-497e71457331	074ab2e5-adb2-4c89-97bc-1137590ba8bf	\N	\N	\N	\N	\N	\N	\N	\N	4	\N	Undetermined		\N	f	f	f	Skull only	B	C	S	C	\N	\N	t		f				7F.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
d32285c6-3bd6-4f76-a3b6-e15be1b8d514		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	0c214597-a464-4c3c-8e4b-4029abeefc14	\N	\N	\N	\N	\N	\N	t	\N	3	\N			\N	f	f	f						\N	\N	f		f				7F.07	1			\N	\N	\N	\N	\N	\N	\N	\N	\N
a1be20dc-c3b7-4242-88e4-84ceb5d4a301		0	0	0	0	0		\N						\N		\N	\N	\N	\N		27d78c72-e219-4f3a-81b7-12e7d3b64ca8	1f819ae5-1099-421a-b543-1d1777b1a6ca	\N	\N	\N	\N	\N	\N	t	\N	\N	\N			\N	f	f	f						\N	\N	f		f				7F.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
c618a64f-0381-4129-a43b-1f75d1d7abbb		1.33	4.72	4.45	2.37	3.89	35+	\N				dkbrwn		\N		\N	\N	\N	\N		031b1c93-1e1f-451c-a3ba-13af4f9e99b6	1ee4f192-c715-4685-88a8-f748da3d4188	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	Female		\N	f	f	f	wrapped - bones showing	H	A	P	A	\N	\N	t		f				7F.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
73d5f838-8e34-4acc-aa08-6b8cb0e7c453	West	1.4	3.7	3.85	2.29	0.84		\N						\N		\N	\N	\N	\N	possible mother with pendant	3b0abcec-6ade-484d-a1d9-39a030060948	5ba5669c-fc2a-43e7-b817-c792cf144f5e	\N	1994-01-01	\N	\N	\N	\N	\N	\N	9	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t	Y	f	1994B	B-6		7F.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
226c2f3c-e936-4148-ad38-547059c48fa7	West	1.34	3.9	3.9	2.45	2.45		\N						\N		\N	\N	\N	\N	appears to be a baby(infant)	2a7acbf5-c0af-4716-be9c-01b58ee1b698	637ad47e-115a-4485-a11d-e329bcf4c550	\N	1994-01-01	\N	\N	\N	\N	\N	\N	8	\N	Undetermined		\N	f	f	t		W	C	U	I	\N	\N	t		f	1994B	B-6		7F.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
0e194738-3b72-49db-a3ae-bea167a6033e		1.25	1.88	0	1.35	0	25-30	\N				Brown		\N		\N	\N	\N	\N		5e012213-9900-4da4-a960-bf7579f4d94c	afcf2c9d-e68c-4531-a2e5-248a9198dfeb	\N	\N	\N	\N	\N	\N	\N	\N	9	\N	Female		\N	f	f	f	Skull only	B	A	S	A	\N	\N	t		f				7F.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
73e5b07a-a0b5-41ec-b9cd-975d39461b7e	East	2.1	2.65	2.7	2.31	3.05		\N						\N		\N	\N	\N	\N	Reversal burial?	4499f860-b3e4-47c1-b40f-2e949f8f1e56	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	24	\N	Undetermined		\N	f	f	t		B	A	U	A	\N	\N	t		f	1994B	B-12,16						\N	\N	\N	\N	\N	\N	\N	\N	\N
d9fac7e4-879a-4b14-b068-e016797e6742	West	1.6	4.37	3.5	3.3	5	30-40 yrs	\N				dkbrwn		\N		\N	\N	\N	\N	Measurements in 1992E\nCan't find details on age, gender, or hair for this the burial in field book that are described in database (TW)\nLarge mummy wrapped heat to foot\nRed/white ribbon on coarse linen\nFoot shows fine linen with woven in fringe. Body wrapped on 4 coarse blankets then a fine double fringe and 2 bands of color.\n6 heavy linen blankets	db55d671-a06e-4777-96af-78229d75d3db	dfea6ed3-9cea-40a8-93c4-efe59420513d	\N	1992-01-01	\N	\N	\N	\N	\N	1.75	45	\N	Male		\N	f	f	t	well-wrapped	W	A	P	A	\N	\N	t		f	1992B/1992E	Jan-69		8B.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
7353d908-19b6-4786-852f-d9287409b794		0	0	0	0	0		\N						\N		\N	\N	\N	\N		5566094e-300e-404e-9334-8395bbae71fa	d2a22049-e40d-4d6b-b3ad-11f5fb353265	\N	\N	\N	\N	\N	2002	\N	\N	13	\N			\N	f	f	f						\N	\N	f		f				8B.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
0973213f-6048-4663-8204-f90fc5e48231		0	0	0	0	0		\N						\N		\N	\N	\N	\N		c77ff207-2233-4beb-967a-9e41a1e16f11	65341120-83b8-4b9a-bf11-c6a9aba875ab	\N	\N	\N	\N	\N	\N	\N	\N	6	\N			\N	f	f	f						\N	\N	f		f				8B.03	11			\N	\N	\N	\N	\N	\N	\N	\N	\N
7c59aea6-e80b-4096-b380-14d2481d1109		1.41	1.62	1.55	0.6	1.48		\N						\N		\N	\N	\N	\N		1c5af772-61af-4478-8a51-bc776e75b493	f58b8cbb-d2ed-4856-9168-12c695abaced	\N	\N	\N	\N	\N	2002	\N	\N	9	\N	Undetermined		\N	f	f	f		U	A	U	U	\N	\N	t		f				8B.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
50ad0ab6-a657-4dcc-8ebb-d51e060f59ba		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	19023d27-61af-491e-ade8-84dace21f051	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	f	f	f						\N	\N	f		f				8B.05	11			\N	\N	\N	\N	\N	\N	\N	\N	\N
fd1b91c8-8874-4fe5-9b8d-bbd6149f12d4		0	0	0	0	0		\N						\N		\N	\N	\N	\N		6e312a4f-2063-44e5-af70-19e8ebd5c86a	18cdb782-ff52-4e2c-adc6-9e2a4d4ac576	\N	\N	\N	\N	\N	2002	\N	\N	19	\N			\N	f	f	f						\N	\N	f		f				8B.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
9ddbfc0f-831d-436b-877e-6a498a78b6a4	West	0.8	1.98	1.9	0.4	1.05	3-4 years	\N				brown		\N		\N	\N	\N	\N	Measurements in 1992E\nage, gender, and hair details in 1992C\n3 samples	588bcf50-a371-4651-ae4c-832b45b94fa2	48b4e778-9288-400a-8e4d-ea501d0d2133	\N	1992-01-01	\N	\N	\N	\N	\N	0.45	17	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	P	C	\N	\N	t		f	1992C/1992E	89/66		8B.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
44cf9aeb-4dab-4a00-a26b-c8fb8e011437	West	0.8	3.35	3.68	1.17	2.7	14-16 yrs	\N						\N		\N	\N	\N	\N	Measurements in 1992E\nage in 1992C\nBasketcase, black decomposed fabric\nFace bundle of coarse linen\nfound a bunch of white cyrstallers (?) material under 5 layers of linen\nThis was under a piece of 3 cord weave\n7 samples	7608545f-1bb1-4669-914d-ee454e58eb33	c5f032b9-20e1-496a-b56a-2809e673841a	\N	1992-01-01	\N	\N	\N	\N	\N	1.6	8	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	P	C	\N	\N	t		t	1992A/1992C/1992E	146/79/67		8B.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
8b09b01d-e37c-4013-bfb2-21550f998a2d	West	1.24	2.7	2.85	1.08	2.49	15-18	\N				dkbrwn		\N		\N	\N	\N	\N	Can't find details on age, wrapping, or hair for this the burial in field book that are described in database (TW)\nHead became detached from body\nFecal matter fell from behind body\nFabric was rotted\nBody tied with red/white ribbon on a terry cloth wrapping\nMany more details about wrapping on pg. 109\nApron of wool with red/green designs and ties at the waist\nFound sandle, papyrus under the cloth\nSome red/green material like a shawl\nlong hair\n9 samples	c3f3324e-4d55-4f0b-9ecd-19485a637dc3	d0d2f059-8b0a-4ba5-a249-5ea5c07fa3a3	\N	1992-01-01	\N	\N	\N	\N	\N	1.47	39	\N	Undetermined		\N	f	f	t	wrapped	W	C	S	A	\N	\N	t		f	1992A/1992C	105-109/61		8B.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
639b108f-441d-42da-b70c-8c8ad5c82b59	West	1.04	2.69	2.41	1.02	2.74	35+	\N				black		\N		\N	\N	\N	\N	Some details on hair and gender in 1992E\nLong black hair with red ribbon	b700e99b-b9ed-454d-8832-b2fb7708f25e	f28f88ec-c1f1-46bd-a201-4620fa16a3c6	\N	1992-01-01	\N	\N	\N	\N	\N	1.63	34	\N	Female		\N	f	f	t	wrapped	W	A	P	A	\N	\N	t		f	1992A/1992E	92/50		8B.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
daeab445-316a-4126-b293-90801b9c7095	West	1.53	3.96	3.4	1.13	2.49	45-60	\N				Blond		\N		\N	\N	\N	\N	Can't find details on age, gender, or hair for this the burial in field book that are described in database (TW)\nBasketcase\nRed/white ribbon ties - and undyed ribbon\nCoarse linen\nLinen on layer of fine linen\nBlanket 102 cm wide\n5 samples\nno teeth in mandible	e5efad80-7042-4ae2-be1d-b392f98d609e	52f701a0-a326-4453-862a-3a66ce26fccd	\N	1992-01-01	\N	\N	\N	\N	\N	1.46	40	\N	Female		\N	f	f	t	poorly preserved	B	A	P	A	\N	\N	t		f	1992A/1992C	107-116-139/57		8B.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
75468752-63ef-4168-851c-16d412e914f2	Undefined	0.98	3.5	3.47	2.66	3.1		\N						\N		\N	\N	\N	\N	7	54e336c2-3d54-4f20-9c47-36d9536754dc	56451ed7-6ead-4d78-88e5-901f2b5a7c3e	\N	1994-01-01	\N	\N	\N	\N	t	\N	5	\N	Undetermined		\N	f	f	f		B	U	U	I	\N	\N	t		f	1994B	7		8B.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
fc4fd552-a9b7-4f3b-9b79-9e2897c24f3c		0.85	1.76	0.99	-0.08	1.29	40+	\N				blond		\N		\N	\N	\N	\N		b02cbcd8-4520-4c74-aed3-bf6fa5ceb2b8	8ef03413-b218-460a-ac00-8cbd14913027	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	Male		\N	f	f	t	bones and skull	B	A	P	A	\N	\N	t		f				8C.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
4cfa09b5-9ef1-42e4-8547-323a3bcfbab0		0	0	0	0	0		\N						\N		\N	\N	\N	\N		4550bded-4691-4b3d-929d-b8794a338e51	4a7120ab-567d-4c48-8953-afdf05858058	\N	\N	\N	\N	\N	2006	\N	\N	54	\N			\N	f	f	f						\N	\N	f		f				8C.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
354862fb-59ff-4011-891d-f086f00f0dfc		2.2	4.2	4.09	2.45	1.65	U	\N						\N		\N	\N	\N	\N	Head East\nTextile as found before\nBlack/purple strip	5225cdbb-3a67-4cc8-b4af-52cfc7197281	f0f202ad-5f4b-4483-826d-051d3620cbd1	\N	\N	\N	\N	\N	2006	t	\N	44	\N	Undetermined		\N	f	f	f		B	C	U	C	\N	\N	t		f				8C.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
ecd9a0ad-2a4b-4c82-9b0d-47f7546789b1		2.1	2.7	2.8	3.4	4.8	U	\N						\N		\N	\N	\N	\N		cbebbcde-a93a-446d-af28-4e472773837e	c7c71daf-4704-4a1b-9964-649e4498bf17	\N	\N	\N	\N	\N	2006	\N	\N	42	\N	Undetermined		\N	f	f	f		B	A	U	U	\N	\N	t		f				8C.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
cc28e019-aacf-4c6e-a01f-ba8b133c0c13		1.75	4.2	4.2	0.9	1.65	U	\N						\N		\N	\N	\N	\N		0dd8a02d-d2f3-4218-ad64-72a8655c7087	bf3d3164-28f7-41ae-bef2-38010a82d595	\N	\N	\N	\N	\N	2006	\N	\N	38	\N	Undetermined		\N	f	f	f		W	C	U	U	\N	\N	t		f				8C.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
b2ee698e-9cf4-466a-b77a-dc1fc1248f09		2	4.2	4.3	3.25	5	U	\N						\N		\N	\N	\N	\N	Well wrapped in plain white linen	b61bc99c-b038-4c0c-871e-1e5e83111658	cf2a160b-8983-434f-928c-1a26f6d65fab	\N	\N	\N	\N	\N	2006	t	\N	46	\N	Undetermined		\N	f	f	f	basket	W	A	U	A	\N	\N	t		f				8C.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
6726f829-3a6b-468a-8598-d110db053581	Undefined	0.73	2.64	2.64	2.29	2.29		\N						\N		\N	\N	\N	\N	Is a small child to the north of burial #1; where is the data for #1?	d95dec44-f5ca-4cb7-81e8-ac68d9a1e00f	87c467f2-d310-45f4-9e29-95376bfce3ac	\N	1994-01-01	\N	\N	\N	\N	\N	\N	3	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1994A	19		8C.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
951600aa-de78-42c4-8ee6-f5de9769e7de		1.07	2.65	1.98	2.11	2.94	5 years	\N						\N		\N	\N	\N	\N		bb6eefd0-b6f0-41e2-93e0-c54613af6822	113b8800-6024-4e57-a4a4-03032cb05ed4	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	Male		\N	f	f	f	wrapped, head showing	H	C	P	C	\N	\N	f		f				8C.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
1497ac1f-2778-47d8-a85d-2f8d1d3d63cd	West	1.48	2.27	0	2.5	0	20-25	\N				br-red		\N		\N	\N	\N	\N	gender, age, and hair in 1992C\nRed/white ribbon on face bundle\nFine weave over coarse cloth\nCoarse cloth tied with torn strips\nFolded linen over nose\n5 samples	d79ac19a-401a-42df-9ab4-9b72ac8a89e7	68547eb9-6cf8-46e3-ad80-b0d8c222f0d4	\N	1992-01-01	\N	\N	\N	\N	\N	\N	22	\N	Male		\N	f	f	t	Skull only	B	A	S	A	\N	\N	t		t	1992B/1992C	19,22/109		8C.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
2324adbc-9849-45a5-9b3d-5f2434cc0a47	West	2.88	4.11	2.94	2.94	4.21	24	\N				brown		\N		\N	\N	\N	\N		ec5cfb03-dc9d-4290-b81a-7ab066e9ce47	7f941b08-4eb0-4092-bbe4-5c0441120767	\N	\N	\N	\N	\N	\N	\N	\N	21	\N	Male		\N	f	f	t	bones and skull	B	A	P	A	\N	\N	f		f				8C.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
8aecb88b-9f44-46de-9eb7-3e542fd8ad4a	Undefined	0.94	2.54	2.54	4.34	4.34	adult	\N						\N		\N	\N	\N	\N	Fabric linen blanket\nOuter wrap for cloth, fine weave\nInner cloth coarse weave\nRope ties\nFabric samples	af2d5cca-a4a0-4be1-b8e1-275aa7567bb6	1e67c112-b220-4423-b696-50d39c1c125d	\N	1992-01-01	\N	\N	\N	\N	t	\N	18	\N	Undetermined		\N	f	f	t	poorly preserved	B	A	U	A	\N	\N	f		f	1992A	25,30		8C.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
9aa96533-394a-4575-9b76-9b857e6c60dd	Undefined	1.3	5.23	4.4	2.76	4.24	V-VI?	\N				Brown		\N		\N	\N	\N	\N	Fringed, corded outer wrap tied with red/white ribbon\nHead wrapped (details of each layer in field book)\nHair has blond and brown color\nBody wrapped with 5-10 layers of cloth but it appears it was folded fabric with edge of fold under the chin\nmore wrapping details in 1987B field book\nCan't find measurements in the field book that are noted in the database (TW)	bd7ca380-2e29-424a-904f-1bce73b21e07	5ea6cb9a-736c-429c-87b1-5bcf000ec2cb	\N	1987-01-01	\N	\N	\N	\N	\N	\N	24	\N	Female		\N	f	f	f	W	W	A	P	U	\N	\N	t	U	t	1987B	82		8C.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
546e571d-6b58-4800-a70b-4c9dfad064e0		0	0	0	0	0		\N						\N		\N	\N	\N	\N		6c4555b4-6a98-46df-bc5e-112bab2cb010	064ef73f-3c98-45f7-b3cf-830b2e9ca695	\N	\N	\N	\N	\N	\N	\N	\N	24	\N			\N	f	f	f						\N	\N	f		f				8D.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
1f3fdda2-c8c8-4964-8091-a9b1530695b1		0	0	0	0	0		\N						\N		\N	\N	\N	\N		e5c6dabe-1a5f-47d3-9f1b-d9414276f933	93d59f34-0fda-4226-976a-19bd657a7de7	\N	\N	\N	\N	\N	\N	\N	\N	16	\N			\N	f	f	f						\N	\N	f		f				8D.02			Cribra orbitalis appears to have healed	\N	\N	\N	\N	\N	\N	\N	\N	\N
0f4930bb-746f-45ed-9e3e-e09cdd81aa7b	West	0.8	2.1	2.2	0.05	1.2	6-8 years	\N				dkbrwn		\N		\N	\N	\N	\N	Feet well preserved (these feet belong to burial just under #5), wrapped and with face bundle	8010a561-e7cf-400e-b4b2-278e41ad65ec	cc48e74f-0c9b-4b0e-bbb8-2f83e34d0075	\N	1987-01-01	\N	\N	\N	\N	\N	1.14	5	\N	Undetermined		\N	f	f	f	well-wrapped	W	C	P	C	\N	\N	t		t	1987A	58		8F.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
69095251-02e5-4706-9bec-52547e15023a		1.29	0.67	0.37	2.45	3	Newborn	\N						\N		\N	\N	\N	\N		ffbe000e-1173-46ad-8396-404b147cbef3	\N	\N	\N	\N	\N	\N	\N	\N	\N	36	\N	Undetermined		\N	f	f	f	wrapped	W	C	S	N	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
f8ef1a9d-736e-48fe-9dcf-5d60f487910d	West	1.4	4.66	4.7	4.72	6.48	IV	\N				br-red		\N		\N	\N	\N	\N	Can't find details on age, gender, or hair in field book that are described in database (TW)\nBody wrapped in red/white ribbon, badly encrusted in salt\nOuter layers finer fabric - fine yarns and tight weave, next layer - coarse yarn and tight weave, at least 3 more layers described in field book\nMore wrapping details available in 1987B field book on pg. 91-92	b435ffa3-d6f6-431d-8ae9-a9507985c8f1	0042c21a-67ae-4349-9e84-e53a418d16a7	\N	1987-01-01	\N	\N	\N	\N	\N	1.68	32	\N	Female		\N	f	f	t	W	W	A	P	U	\N	\N	t	U	f	1987A/1987B	34/91		8D.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
45e5c215-e0a2-45af-94d7-0531fbab7449		0	0	0	0	0		\N						\N		\N	\N	\N	\N		2e057c51-3e89-4446-9fd9-bf8e6121ddae	ee13eef3-7262-4e8c-b665-5efaedcbeba3	\N	\N	\N	\N	\N	\N	\N	\N	22	\N			\N	f	f	f						\N	\N	f		f				8D.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
d5bd381b-8fec-41a6-b91d-417797f4db97	Undefined	0.9	3.7	3.7	2.5	4.05	V	\N				U		\N		\N	\N	\N	\N	2 fabric samples - outer undyed coarse fabric, small fragment of brown ribbon, 3 layers 2nd piece is tan - yellow with a red trim, first impression is a twill weave\nsaved sample\nBrown ribbon is on outer 2 layers of the undyed outer, coarse cloth\nCan't find burial measurements, or details on age, or gender in the field book that are noted in the database (TW)	b6a6ce2c-2a96-4fed-946d-525d3ba6b43b	eb3ff24a-fcac-4fe2-8abe-6b224efcc394	\N	1987-01-01	\N	\N	\N	\N	\N	\N	9	\N	Female		\N	f	f	t	S	B	A	P	U	\N	\N	t	U	f	1987B	34		8D.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
aa88ffa0-3a5c-4370-a13a-9768b8960b41		0	0	0	0	0		\N						\N		\N	\N	\N	\N		b9eac67c-9f23-4f26-b5b2-b07b4291f000	b53e0418-84e7-47a5-b9ee-9fca75c31258	\N	\N	\N	\N	\N	\N	\N	\N	30	\N			\N	f	f	f						\N	\N	f		f				8D.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
67b4a930-47dd-4f98-a93e-0e6fb9e7a66f		0	0	0	0	0		\N						\N		\N	\N	\N	\N		73d2bf69-23c6-442b-bbac-f095050c9ab0	27a11c10-517d-4a9e-af3a-30b855758077	\N	\N	\N	\N	\N	\N	\N	\N	15	\N			\N	f	f	f						\N	\N	f		f				8D.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
8681169b-fee7-4fa2-89a9-2f60e1d193c2		0	0	0	0	0		\N						\N		\N	\N	\N	\N		ee97d8db-c408-4222-98ea-bb1bb470f703	186d4e82-0031-4a98-b99f-974a82937cff	\N	\N	\N	\N	\N	\N	\N	\N	3	\N			\N	f	f	f						\N	\N	f		f				8D.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
a856cbe6-2aae-4b51-bcf6-a87a04dab3a9	Undefined	0	0	0	0	0	III	\N				Brown		\N		\N	\N	\N	\N	No measurements with badly disturbed burials\nCan't find details on age, gender, hair in field book that are described in database (TW)\nBurials #38 and #39 were combined as they came out mixed together - bad basket case\nTextile samples (cloth and ribbon)	4a421efc-cd3a-4b91-b70e-7513574e2c10	dc839885-4e85-445d-a94a-f008550ea251	\N	1987-01-01	\N	\N	\N	\N	\N	\N	38	\N	Female		\N	f	f	t	S	B	A	P	U	\N	\N	t	U	f	1987A/1987B	53/102		8D.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
2238a605-8517-4640-acca-700891cfc402		0	0	0	0	0		\N						\N		\N	\N	\N	\N		f56827ab-57a4-4f8a-9c72-399b2825d6ef	9ae7cada-1be5-461b-9818-5658a615302e	\N	\N	\N	\N	\N	\N	\N	\N	9	\N			\N	f	f	f						\N	\N	f		f				8D.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
edde2450-5842-4d7a-a558-6848ee4e6b80	West	1	1	1	2.2	3.6	12	\N				brown		\N		\N	\N	\N	\N	Nearly on top of #13\nWrapped and ribbon\nFoot and head bare\nhair on back of head\nCan't find details on age and hair in field book that are described in database (TW)\nHead had no cloth\nSome fabric over torso wrapped was brown and white pattern ribbon\nEvidence of fine weave\nThe outer layer was wrapped with coarse yarn, tight weave and brown and white pattern ribbon	821aaff1-fcaf-4c9b-bda0-2e5ab417c778	054e951c-f4fc-4ea8-a699-b53308c711ac	\N	1987-01-01	\N	\N	\N	\N	\N	1.4	12	\N	Undetermined		\N	f	f	t	W	W	C	S	C	\N	\N	t	U	f	1987A/1987B	29/38		8D.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
189572a0-2938-4871-8ac9-b8b17b0a07d0	East	2	3.45	3.75	2.58	1.2	IV?	\N						\N		\N	\N	\N	\N	Badly preserved\nlower jaw missing\nBadly disturbed - disarticulated adult\nfeet missing\ntotal deterioration of body wrapping, tissue, ect\nCan't find gender or age details	5d3fae1b-8930-4ea4-a336-4dfed39560da	31861a2d-1f09-4695-b1d9-95735cb7c525	\N	1987-01-01	\N	\N	\N	\N	\N	1.45	34	\N	Male		\N	f	f	f	scattered bones with skull	B	A	P	U	\N	\N	t		f	1987A	39		8D.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
0a1d3dc7-d861-41fc-ac15-eb19ae9a1321		1.14	0.95	0.8	3.96	-0.1		\N						\N		\N	\N	\N	\N		7504d52d-2479-4d71-921f-45bf1d0a6821	127795b5-0c40-4f09-926e-d240701e1e1f	\N	\N	\N	\N	\N	2002	\N	\N	14	\N	Undetermined		\N	f	f	f		U	A	U	U	\N	\N	t		f				8E.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
9a17ea8a-fddf-4fc6-9d60-c4c1c271ec97		0	0	0	0	0		\N						\N		\N	\N	\N	\N		cf013ee5-0646-4449-a6c8-90c41d7d7431	b43897bb-0c52-4d77-9ac4-e318c95fb8bf	\N	\N	\N	\N	\N	2002	\N	\N	18	\N			\N	f	f	f						\N	\N	f		f				8E.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
fbd79a6d-fc5f-4ba6-ad94-de32e4e54f16	Undefined	1.3	2.7	2.5	0.5	2	21 years	\N				U		\N		\N	\N	\N	\N	Disarticulated, basketcase\nCoarse fabric, rope\nSaved samples\nCan't find details on age, gender, and hair in field book that are described in database (TW)\nCan't find measurements in the field book that are noted in the database (TW)	0746e887-1802-40ae-89a7-78c63aadbea6	674e8234-c13b-4f80-9ea4-3d3ce109dc39	\N	1987-01-01	\N	\N	\N	\N	\N	\N	22	\N	Male		\N	f	f	t	S	B	A	P	A	\N	\N	f	U	f	1987B	60		8E.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
ffdac061-0918-4822-ad28-51c51d07caba		2.02	3.96	3.16	2.04	3.43	25-35	\N						\N		\N	\N	\N	\N		6421fed7-1d80-44e9-b454-935116fd989c	0b7f07ce-b4db-4918-8221-9e183aa5abfe	\N	\N	\N	\N	\N	\N	\N	\N	28	\N	Male		\N	f	f	t	bones and skull	B	A	P	A	\N	\N	f		f				8E.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
64f29b22-5281-4d61-82f0-d7e0cb5c4021		0.61	1.32	0.96	3.86	3.03	5 years	\N				blond		\N		\N	\N	\N	\N		5cd47f0b-4eee-4769-8dc3-43d0252ab3c1	f9041a06-a62e-42c8-9bc4-59d82fd8e0be	\N	\N	\N	\N	\N	\N	\N	\N	11	\N	Female		\N	f	f	t	well-wrapped	W	C	P	C	\N	\N	t		f				8E.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
f89e0252-3df2-40d1-b9f9-b7ef40ab966d	West	1.35	4.5	4.25	2.34	3.8	30 years	\N				dkbrwn		\N		\N	\N	\N	\N	Wrapped and ribboned	aa8ecf77-5a3b-41b7-8f62-343e0d337004	a33420e7-0d3e-410a-bae7-92e550365e82	\N	1987-01-01	\N	\N	\N	\N	\N	1.53	10	\N	Female		\N	f	f	t	wrapped	W	A	P	A	\N	\N	t		t	1987A	96		8E.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
a78d29b5-cadf-464d-b99c-710c4602e63a	Undefined	0.47	0.63	0.1	1.3	2.8		\N						\N		\N	\N	\N	\N	Some fragments of linen, torn linen strips	f11faf37-ad7b-4ec7-b0a9-09b5cc93e774	9f7104c7-2487-46a4-9504-ad59bd9ba519	\N	1994-01-01	\N	\N	\N	\N	\N	\N	14	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B/1994C	1994B: B-9; 1994C: 23		8E.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
0b71dcca-b646-4f43-8279-8e14a04ede2a	East	2.87	0.44	1	1.37	2.76		\N						\N		\N	\N	\N	\N	Found a mandible at the top of the shaft on east end, Found a small red drinking cup with the skull\nSome burned material next to the head	3acab44f-15b8-4ac1-ad0b-74ff622cb4b1	8cb66f21-cd27-4871-9232-65c4815b4328	\N	1994-01-01	\N	\N	\N	\N	\N	\N	11	\N	Undetermined		\N	f	f	t		B	A	U	A	\N	\N	t		f	1994B	43		8E.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
63dde18a-b526-4653-82f1-37c4ee3c57f6	West	1.8	0.25	0.35	-0.25	1.02	U	\N						\N		\N	\N	\N	\N	Lots of limestone cover stones - 1-2 mud bricks\nadditional head on the chest, left on this body\nhead slightly out of area\nmany limestones over the head also	79bdc51e-5b67-4fbc-8769-c64ea0d2335d	b4cfeb97-31cb-446d-8036-604f40a8a39a	\N	2009-01-01	\N	\N	\N	\N	\N	1.35	67	\N	Undetermined		\N	f	f	f	fair	H	A	U	A	\N	\N	t		f	2009	101		8E.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
83b179a1-2de3-42ad-8ccc-8d48ae137751	Undefined	1.43	0.36	0.68	2.6	1.38		\N						\N		\N	\N	\N	\N	Near head of 16 was a fine pouring vessel\nTorn linen strips for the med wem linen wrap	80610f93-2062-4227-add2-ebc4a2bb5683	a55fce73-ad18-45fa-b727-251b76bd62f5	\N	1994-01-01	\N	\N	\N	\N	\N	\N	16	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t	Y	f	1994B/1994D	1994B: B-11; 1994C: 22		8E.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
f3350ebc-3158-4c8b-9d1d-945d927415d4		0	0	0	0	0		\N						\N		\N	\N	\N	\N		b1966cfb-31cf-4de5-9f02-84a6db0b8a1a	6c40a5ec-c7e2-45a9-94ab-06ea403a7da2	\N	\N	\N	\N	\N	\N	t	\N	11	\N			\N	f	f	f						\N	\N	f		f				8E.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
d8ffc5e4-84e7-4aca-b76e-c696a32fbcd6		1.68	0.45	0.38	3.54	4.32	4 years	\N				blond		\N		\N	\N	\N	\N		96f98031-4e74-4832-9b9e-210b33a7dd63	1d99b966-61f3-48b8-bb6c-0849a068fd9c	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	Undetermined		\N	f	f	t	well-wrapped	W	C	P	C	\N	\N	t		f				8E.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
e448b38b-31a8-4e62-bebc-503ce50053aa		0	0	0	0	0		\N						\N		\N	\N	\N	\N		99bb38c1-5248-4de2-9e48-73a34d39276f	b05381ba-54cc-4610-8716-76b45c6f9a26	\N	\N	\N	\N	\N	\N	\N	\N	18	\N			\N	f	f	f						\N	\N	f		f				8F.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
5ab7d487-adaf-4ce7-81bc-1bf0b31b26c3	West	1.4	4.59	4.2	3.3	4.2	3-4 years	\N				ltbrwn		\N		\N	\N	\N	\N	Infant burial wrapped placed on lower half of adult (#8)\nCan't find details on hair and age in the field book that are described in the database (TW)	fd1f4289-e900-49e4-934a-55745171790b	56dedc6d-c276-4d56-8ba0-3a9af9650a56	\N	1987-01-01	\N	\N	\N	\N	\N	0.75	9	\N	Undetermined		\N	f	f	f	wrapped	W	C	S	C	\N	\N	t		f	1987A	96		8F.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
cd6e5f95-1696-45c3-ad4f-466df26136cd		0	0	0	0	0		\N						\N		\N	\N	\N	\N		5e5ca45f-e0dc-4e70-a1b3-ddacb4214875	ee4c340c-577f-4e74-ad66-24d3a2f4e22d	\N	\N	\N	\N	\N	\N	\N	\N	7	\N			\N	f	f	f						\N	\N	f		f				8F.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
2a690117-df88-43eb-bdd1-5693dff2f192	West	0.85	0.1	-0.2	1	2.5	U	\N				Brown		\N		\N	\N	\N	\N	Beautiful yarn wrpping - red/yellow - cloth decomposed\nLots of yarn found earlier near the surface\nAppears to be copper binding around arm, perhaps wrist, but below elbow\nCan't find age, hair details in field book that are described in database (TW)\n2 more pages of wrapping details in the 1987B field book pg. 104	1c4f05ac-31c1-4cda-ac8c-3ceacc733c2a	0112cba9-59df-4cab-b4d2-41d43ab9c93e	\N	1987-01-01	\N	\N	\N	\N	\N	1.6	4	\N	Undetermined		\N	f	f	t	W	W	C	P	U	\N	\N	t	U	t	1987A/1987B	55/104		8F.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
c271f4b0-5fd1-4043-a3d5-2938d5e91d38		1.23	0.43	0	2.59	0	1-2 years	\N						\N		\N	\N	\N	\N		e6d49438-2044-4bbb-890e-ddd90a097f3d	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	\N	Undetermined		\N	f	f	f	Skull only	B	C	S	I	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
94eb8d9a-5b30-415e-90f2-4b497cab9a25	West	1.05	1.7	1	2.65	3.65	5-6 years	\N				Brown		\N		\N	\N	\N	\N	Can't find the details on hair and age in field book that are described in database (TW)	943d1cf7-2806-4621-9192-ccb7a1f5679f	06e8dcbb-4b51-4641-9f3d-ecd95b6747e6	\N	1987-01-01	\N	\N	\N	\N	\N	1.2	13	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	C	\N	\N	t		f	1987A	69		8F.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
96d9bb5f-9e05-4112-8c6d-1614e9d45be2	Undefined	0.9	2.6	2.54	3.55	5.4	V	\N				Black		\N		\N	\N	\N	\N	Basketcase - textiles badly decomposed\nRadius arm bone had a fine tightly woven fabric next to the body, covered with several layers of coarse fabric\nOne small piece of brown ribbon\nPhotos and samples taken\nCan't find burial measurements, or details on age, or gender in the field book that are noted in the database (TW)	4048e65f-5cb6-46a4-ae0b-f69184e65981	9182b317-9c05-4ed0-b531-6a917924a94e	\N	1987-01-01	\N	\N	\N	\N	\N	\N	8	\N	Female		\N	f	f	t	S	B	A	P	U	\N	\N	t	U	f	1987B	28		8F.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
cdfbee62-21d7-4495-bbfe-965610515392	West	0.6	3.5	0	4.8	0	20-25 years	\N						\N		\N	\N	\N	\N	Only head removed - body out of square\nBody out of square, but head fully exposed\nWrapped and ribboned\nHead removed - textile and cranial analysis\nCan't find details age or gender in the field book that are described in the database (TW)	41ddc607-b56f-4408-900a-bd70e6e6fa5c	d24b30e6-51c4-4da4-9c92-e51e574aa863	\N	1987-01-01	\N	\N	\N	\N	\N	\N	47	\N	Male		\N	f	f	f	poorly preserved	B	A	S	A	\N	\N	t		f	1987A	118		8F.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
5f4983b7-86a6-4a3d-878c-e99eb2e73fdc	East	2.2	0.9	1.2	3.25	2.45	VI	\N				brown		\N		\N	\N	\N	\N	Next to #35\nReversal\nCan't find details age or wrapping in the field book that are described in the database (TW)	abd828db-7455-4870-ba94-50693e42f7c4	6b310d4e-073d-4069-ad45-db9aa098fcc0	\N	1987-01-01	\N	\N	\N	\N	\N	1.7	34	\N	Female		\N	f	f	f	poorly preserved	B	A	P	U	\N	\N	t		f	1987A	106		8F.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
84ec6f73-50e4-4c53-a2cf-f7eeb3af43cf	West	1.2	4.09	4	3.8	5.2	I	\N				Black		\N		\N	\N	\N	\N	Well wrapped and ribboned\nBuried on a board\nGood teeth\nMale\nCan't find details on hair, and age in the field book that are described in the database (TW)	50146dae-0ddd-439f-a96d-62cf0d2a19a0	31092931-1d35-4e6c-8d92-cfd12a2973d9	\N	1987-01-01	\N	\N	\N	\N	\N	1.4	12	\N	Male		\N	f	f	t	poorly preserved	B	A	P	U	\N	\N	t		t	1987A	98		8F.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
1a248bef-b01b-470a-9ac9-75d2032a5174		0	0	0	0	0		\N						\N		\N	\N	\N	\N		e9943024-1c87-4386-b723-30014ecaf0d2	7fe8b3d0-54fc-42ef-9d76-c01b016004b7	\N	\N	\N	\N	\N	2002	\N	\N	19	\N			\N	f	f	f						\N	\N	f		f				8G.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
a841dbac-340b-45b8-a337-feaf82bc4e4a		1.33	2.84	2.25	2.33	3.74	40	\N				blond		\N		\N	\N	\N	\N		623eec51-56c4-4304-b9c3-cb03bbbd8bcb	1aa0c143-9b08-48ed-b570-427d2bbc613e	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	Male		\N	f	f	f	poorly preserved	B	A	P	A	\N	\N	t		f				8G.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
77c88ae7-5fb2-40c2-a14c-75e52df77870		0	0	0	0	0		\N						\N		\N	\N	\N	\N		afd8659d-3e97-48b5-91d1-8dec8eed38f4	d16993b5-9dad-496c-8247-c26163213164	\N	\N	\N	\N	\N	2002	\N	\N	26	\N			\N	f	f	f						\N	\N	f		f				8G.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
d5cba57d-d390-446f-8d5e-428dc755e0f8	West	1.17	0.24	-0.16	4.26	-0.6	40+	\N				dkbrwn		\N		\N	\N	\N	\N	Measurements in 1992E\nage, gender, and hair details in 1992C\nBasket case\n5 samples	fcd927d7-24ea-4755-a6d9-454ccceff501	bb3c998f-47ce-42af-9f47-fc23a3e7d929	\N	1992-01-01	\N	\N	\N	\N	\N	1.65	13	\N	Female		\N	f	f	t	poorly preserved	B	A	P	A	\N	\N	t		f	1992B/1992C/1992E	8/87/67		8G.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
33b0e82d-7378-4ac3-8f21-4c3ac05e3557	East	1.84	2.72	2.82	2.29	0.9	40+	\N						\N		\N	\N	\N	\N	Can't find details on age, gender, wrapping, or hair for this the burial in field book that are described in database (TW)\nSome fabric attached to bones and a piece separated saved	852e33cf-f1ed-4abf-bc8e-81a31c85abd8	161db91d-ddce-4976-82e3-f87e0b7974e0	\N	1992-01-01	\N	\N	\N	\N	\N	1.53	43	\N	Male		\N	f	f	f	poorly preserved	B	A	P	A	\N	\N	f		f	1992A	127-133		8G.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
bd7e54d6-dc93-4dfd-bbf5-fa2c03897af1	Undefined	1.9	2.45	2.35	1.74	3.54	IV	\N				U		\N		\N	\N	\N	\N	Badly decomposed fabric\nOuter layer of medium weave wrapped with red/white ribbon\nmore than seven layers of fabric\nCan't find measurements, or details on age, or gender in field book that are described in database (TW)	50e28fe1-b49f-4bad-804b-d0f082c2f26b	bef297b5-fdcf-40e5-997e-ad0d49183f41	\N	1987-01-01	\N	\N	\N	\N	\N	\N	28	\N	Male		\N	f	f	f	S	B	A	P	U	\N	\N	f	U	f	1987B	72		8G.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
47b47fc0-7e23-4e13-af80-dd4d869b07cc	Undefined	1	3.2	3.15	3.3	4.28	6 years	\N				brown		\N		\N	\N	\N	\N	Basket case\nOnly fragments of cloth - red ribbon wraps\n3 layers of coarse cloth\nFine cloth next to body\n7 layers visible, badly decomposed, crumbled when moved\nCan't find measurements or details on age, or hair that are in the field book that are noted in the database (TW)	13204bbd-246b-420d-b262-da0a23a8b5cf	88e742d9-3061-4ee9-8dec-2ad52ef59617	\N	1987-01-01	\N	\N	\N	\N	\N	\N	16	\N	Undetermined		\N	f	f	f	S	S	C	S	C	\N	\N	t	U	f	1987B	43		8G.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
f8ae9c87-8f94-48b2-91a0-1ded77135c2a		0.66	4.43	0	0.6	0	12-20 years	\N						\N		\N	\N	\N	\N		4bf36225-bb47-476c-aee2-350c3c97698a	7f7a8966-5224-4df5-80dc-c8188d27e8e6	\N	\N	\N	\N	\N	\N	\N	\N	9	\N	Undetermined		\N	f	f	t	Skull only	B	C	S	A	\N	\N	f		f				8G.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
ceff6d7b-df35-47d1-81ce-1805dc3896f5	Undefined	0	0	0	0	0		\N				red		\N		\N	\N	\N	\N	photo:green#11\ntibia-64\n2cm\nhumerus-52\n3cm\nhair color-red\nblue wool wrap\nred and green stripes\nburied with another infant (#9) and adult (#7)	d3c83868-39a6-4a36-a6ea-bc28e3ad3047	1962ecfc-3245-40c5-998c-3884121c05e4	\N	1994-01-01	\N	\N	\N	\N	t	\N	8	\N	Undetermined		\N	f	f	t		B	C	U	I	\N	\N	t		f	1994C	2,6		8G.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
b3dd7341-3f08-4b70-b7c1-6f88386b618c	West	1.26	4.38	4.38	2.71	3.43		\N						\N		\N	\N	\N	\N		1b86eec9-4a27-4e4d-9155-80ed4bb00dea	90141d58-1d06-4232-bec8-9ebcb7fcf42a	\N	1994-01-01	\N	\N	\N	\N	t	\N	8	\N	Undetermined		\N	f	f	t		W	C	U	A	\N	\N	t		f	1994B	11		8G.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
c5f3aed2-9391-4ae4-b2ca-e2cf0957f6e9	Undefined	1.4	1.8	0	2.2	0	6 months	\N				Red		\N		\N	\N	\N	\N	Infant - white bundle on face\nBody wrapped in red and green\nSkull was crushed\nOuter wrap - undyed, 3 layers tied with ribbon, 1 layer tied with rope, then red/green layer, next 3 layers of white with middle layer of white design\nSome more details on wrapping in 1987B field book\nCan't find measurements in the field book that are noted in the database (TW)\nCan't find details on age, gender, and hair in field book that are described in database (TW)	74c931ca-8bcb-43b9-b014-6ac214e6b0d2	a4585128-7723-4706-9c76-7dc94552aee5	\N	1987-01-01	\N	\N	\N	\N	\N	\N	25	\N	Undetermined		\N	f	f	f	W	W	C	P	N	\N	\N	t	U	t	1987B	80		8G.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
3e1bf414-67f3-4e83-bd6f-803dff798ecb	West	1.6	3	2	1.75	3	VI	\N				dkbrwn		\N		\N	\N	\N	\N	Wrapped, but cloth very fragile\nLoose weave that is like fringe over much of the surface	3c4fcad5-f94e-4782-80be-eab4029e9b51	7b7d39da-fc2b-4696-968f-2a44038d7c27	\N	1987-01-01	\N	\N	\N	\N	\N	1.6	30	\N	Female		\N	f	f	t	wrapped	W	A	P	U	\N	\N	t		f	1987A	94		8G.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
1d3e8790-3942-4082-b0c9-3992c5e06684		1.68	2.1	2.1	1.22	1.22		\N						\N		\N	\N	\N	\N	Outside mud brick structure, Red and green cloth on head some string over face\nBody on reed mat tied together with rope\nEvidence of broken ribs	e5863031-baf1-432e-be72-0a4c8dbecdc5	29400b54-9af7-43ba-a029-18fa2d5ff0a2	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	Undetermined		\N	f	f	t		H	A	U	A	\N	\N	t		f				8G.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
f9382f1d-4d98-4b09-93f4-5e514a556122	West	1	3.2	2.85	2.87	4.55	30-35 yrs	\N				dkbrwn		\N		\N	\N	\N	\N	#14 buried on the feet\nLong dark brown wavy hair on the head and long dark red facial hair\nRight hand is clenched\nFine linen on outside, coarse on inside\nRed/white ribbon ties\nMush of this is badly decomposed	be9a40c3-4f7a-46e4-86f9-093f745726a6	2b2a7949-a5c8-4b54-b981-dd2319ff3402	\N	1992-01-01	\N	\N	\N	\N	\N	1.76	16	\N	Male		\N	f	f	t	wrapped - bones showing	H	A	S	A	\N	\N	t		f	1992A	54,70		9F.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
f6cf58d2-268d-4d06-9dc9-b3bbc7f60613	East	1.49	3.78	4.15	5	3.55	U	\N						\N		\N	\N	\N	\N	reversal, so head-east\nsterile soil beneath\n2 photographs-first showed #20 by mistake-changed to #30\ntitled a "reversal" on page 133	0d333ce3-6452-4a91-9010-4f8ceb7a8b6f	7ab86f0c-9645-40ed-b811-4d859ce895c0	\N	1998-01-01	\N	\N	\N	\N	\N	1.6	30	\N	Undetermined		\N	f	f	f		B	A	U	A	\N	\N	t		f	1998	37		9F.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
326692b0-50e3-4e96-9728-466361dcbe39	Undefined	1.33	0.9	0.4	1.55	3	4	\N				Brown		\N		\N	\N	\N	\N	Only fabric of any consequence was on the feet\nCoarse yarns, wrapped with red and white pattern ribbon (saved samples of ribbon and fabric)\n2nd layer is very open weave, coarse yarns\nOuter fabric has corded weave infilling direction in 2 places - 18 cm apart\nCan't find burial measurements, or details on hair, age, or gender in the field book that are noted in the database (TW)	3593c381-602d-4e18-ae9d-c6a3eda3852d	e320113a-04c7-4d70-ace8-6370de05c64b	\N	1987-01-01	\N	\N	\N	\N	\N	\N	16	\N	Female		\N	f	f	t	W	W	A	P	U	\N	\N	t	U	f	1987B	39		9F.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
8204704f-4df6-42b8-9bab-e74e0829796c	Undefined	1.2	1.1	1.1	1.45	1.45		\N						\N		\N	\N	\N	\N	Under Burial a disturbed burial,  We found a set of disturbed bones, then on reeds another intact body, but did not count as a burial	d36c0e86-4419-4466-81ce-78bfe26b322d	02d48a5c-ad73-409c-82ab-1eb3fbfa24da	\N	1994-01-01	\N	\N	\N	\N	\N	\N	6	\N	Undetermined		\N	f	f	t		B	A	U	A	\N	\N	t		f	1994B	34		9F.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
3ea3f8bd-8f6a-4ab4-9e46-be00f34fbefe	Undefined	1.7	1.35	1.2	1.5	2.29	Infant	\N				U		\N		\N	\N	\N	\N	Fragment that remained was a piece off the feet\nWrapped in rope, fringed cloth\n2 pieces of cloth - both in good condition, inner one had red design woven\nCan't find burial measurements, or details age in the field book that are noted in the database (TW)	101c75e0-e859-45c4-9351-3d1b81030221	02d7e498-0ae8-4152-a13b-59146d1519e7	\N	1987-01-01	\N	\N	\N	\N	\N	\N	17	\N	Undetermined		\N	f	f	t	W	W	C	P	I	\N	\N	t	U	f	1987B	42		9F.05				\N	\N	\N	\N	\N	\N	\N	\N	\N
3353bf5e-cc5f-4e5d-9366-175e539e7ddc		1.1	2.5	2.52	4.12	5.39		\N						\N		\N	\N	\N	\N	Neck is bent	5d8af044-4589-464c-a8de-c8f5005a0e23	a3f8d2f2-c5ae-4fe1-9857-ecd581b832c8	\N	\N	\N	\N	\N	\N	\N	\N	11	\N	Undetermined		\N	f	f	t		W	A	U	U	\N	\N	t		f				9F.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
b9fae272-6705-4326-9766-6d1680575ffa		0.15	3.17	0	1.53	0	Child	\N						\N		\N	\N	\N	\N		15cb34ff-60c9-417f-b382-d424a386eea2	69360b3e-73d7-4941-9aa2-2e982c916026	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	Undetermined		\N	f	f	t	Skull only	B	C	S	C	\N	\N	f		f				9F.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
38b1a8aa-5072-43bf-95c9-ed60dc4acd22	East	2.1	2.61	3	2.11	1.22		\N						\N		\N	\N	\N	\N	Buried in same tomb as #20 buried side by side\nshaft tomb, offset to north\nBurial 21 north of 16	5243795b-9674-4ed6-ae1f-fa6be953af3b	61321324-00bf-4ec0-8076-f5d6d254eefc	\N	1994-01-01	\N	\N	\N	\N	\N	\N	16	\N	Undetermined		\N	f	f	t		B	U	U	A	\N	\N	t		f	1994B	51,54		9F.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
d71145d5-d3f1-486e-ace3-4b6f0fb808b4		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	5de45755-de6a-4411-af9b-4e2afb972e04	\N	\N	\N	\N	\N	\N	\N	\N	3	\N			\N	f	f	f						\N	\N	f		f				9F.09	14			\N	\N	\N	\N	\N	\N	\N	\N	\N
38aaa6a0-74ed-4f80-9dcc-e29f325dfc48		1.03	1.99	2.18	4.03	5.51		\N						\N		\N	\N	\N	\N		697786c0-a552-4f82-aef2-f24d33252e8e	40c4705e-a88b-45ca-bfe7-dc49eb399a6e	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	Undetermined		\N	f	f	t		W	A	U	U	\N	\N	t		f				9F.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
d13cbf29-3dee-4c44-b338-2addff93f12d	Undefined	1.62	1.7	0.85	1.9	2.9		\N						\N		\N	\N	\N	\N		9b2071b0-4268-40c3-906c-7c4ad2d8f25c	2725cf3b-96d0-425f-8ede-45dcc8ef70fe	\N	1994-01-01	\N	\N	\N	\N	\N	\N	15	\N	Undetermined		\N	f	f	t		W	U	U	U	\N	\N	t		f	1994B	B-9		9F.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
33416e53-122b-46ec-86b5-301a2766fe85		0	0	0	0	0		\N						\N		\N	\N	\N	\N		d09ac3a0-478e-4d77-9ea6-802ea3e5453d	42ebf5f2-982e-4aa8-8199-c7b166dce9f9	\N	\N	\N	\N	\N	\N	t	\N	13	\N			\N	f	f	f						\N	\N	f		f				9F.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
32482789-c995-4258-97be-f288b85ddbe7	West	1.1	1.55	0.7	2.54	3.5	6 years	\N						\N		\N	\N	\N	\N	Can't find the details on age in field book that are described in database (TW)	2393fb87-86a3-4611-b70e-9f5ec18b21d8	9a627c0e-a386-45e5-b5c1-eca20f900bc2	\N	1987-01-01	\N	\N	\N	\N	\N	1.05	14	\N	Undetermined		\N	f	f	f	bones and skull	B	C	S	C	\N	\N	t		f	1987A	69		9G.01				\N	\N	\N	\N	\N	\N	\N	\N	\N
95d8cf2c-b4ce-4f45-b49f-928abc0eb7c9	West	0.95	1.6	1.7	-0.15	0.9	6-7 years	\N						\N		\N	\N	\N	\N	Adjacent to #7 in same area - slightly to the south of 7\nChild\nCan't find details on gender, age, or hair in field book that are described in database (TW)	e7c410b1-1f3c-4223-94d5-5d3b94443bb7	c23a60f6-1485-49f1-aa53-ede348b7440f	\N	1987-01-01	\N	\N	\N	\N	\N	1.05	10	\N	Undetermined		\N	f	f	t	bones and skull	B	C	S	C	\N	\N	t		f	1987A	66		9G.02				\N	\N	\N	\N	\N	\N	\N	\N	\N
1f675148-0d25-4070-bbb8-667607637846		0	0	0	0	0		\N						\N		\N	\N	\N	\N		e4c9ea87-d4f3-4822-9c97-6e8f0db65a42	c7dc0e43-406f-4070-8f77-dd141f5eb342	\N	\N	\N	\N	\N	\N	\N	\N	26	\N			\N	f	f	f						\N	\N	f		f				9G.03				\N	\N	\N	\N	\N	\N	\N	\N	\N
078c6900-fb51-4b40-857a-8a49ded50147		1.38	2.06	1.42	0	1.53	18-20	\N				black		\N		\N	\N	\N	\N		ce257897-a992-46d1-9f6c-6584fff65c58	66606c6b-3d6c-4aef-9d7a-823f62eec064	\N	\N	\N	\N	\N	\N	\N	\N	41	\N	Female		\N	f	f	f	well-wrapped	W	A	P	A	\N	\N	t		f				9G.04				\N	\N	\N	\N	\N	\N	\N	\N	\N
7333a417-e9a1-4f60-b0d6-d8f622340673	West	1.7	3.1	2.7	0.75	2.45	I	\N				Brown		\N		\N	\N	\N	\N	Inside mud brick structure of (described on pg. 90)\nWell-wrapped - extremely so\nCan't find details on hair and age in the field book that are described in the database (TW)	273cd6af-7de0-4868-bbb5-56ff893f9987	cf40f147-551b-4cf2-94ef-8cd0d56b6bb5	\N	1987-01-01	\N	\N	\N	\N	t	1.75	7	\N	Female		\N	f	f	t	well-wrapped	W	A	P	U	\N	\N	t		f	1987A	92		9G.05 and 6D.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
4c16172b-6af6-4d78-bb91-17f13a54cb57	West	1.3	2.15	1.7	0.2	1.7	VI	\N						\N		\N	\N	\N	\N	Mostly not well preserved, though the feet were still wrapped and ribboned.\nJust north and partially west of the mud brick structure for burial #6 in this area\nCan't find details on hair, gender, or age in the field book that are described in the database (TW)	a78e5345-5bec-4b64-89f7-5f1a9bbe630d	84057dc1-991e-4204-ba66-5c8a794e0afe	\N	1987-01-01	\N	\N	\N	\N	\N	1.65	28	\N	Female		\N	f	f	t	poorly preserved	B	A	P	U	\N	\N	f		f	1987A	88		9G.06				\N	\N	\N	\N	\N	\N	\N	\N	\N
ff8a1373-35fc-45c9-ab17-e72fc221a0a1		2.45	3.1	1.5	1.4	1.6	U	\N						\N		\N	\N	\N	\N		cf1a12ea-b233-4337-b281-6ea81e12b35b	e08f8ef8-f775-44e7-8ae4-ed4c75381aa9	\N	\N	\N	\N	\N	2006	\N	\N	45	\N	Undetermined		\N	f	f	f		B	A	U	U	\N	\N	t		f				9G.07				\N	\N	\N	\N	\N	\N	\N	\N	\N
b00b07ec-acde-40d0-9cad-d0447dd0d417		0	0	0	0	0		\N						\N		\N	\N	\N	\N	OUT OF AREA 1	\N	5d39d1fd-aa1c-410c-8594-6ba8f2a7fd00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	f	f	f						\N	\N	f		f				9G.09				\N	\N	\N	\N	\N	\N	\N	\N	\N
e682568b-efb2-4805-a674-bcc71a2cdf8c		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	f	f	f						\N	\N	f		f				9G.10				\N	\N	\N	\N	\N	\N	\N	\N	\N
e03cdfb2-ce80-4457-9bd3-91259354c60b		0	0	0	0	0		\N						\N		\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	f	f	f						\N	\N	f		f				9G.11				\N	\N	\N	\N	\N	\N	\N	\N	\N
48dc7d5a-3ea8-4ba7-8c41-f1006eef9d76		0	0	0	0	0		\N						\N		\N	\N	\N	\N	FANCY HAIR NET	\N	b858e9a9-b483-4d6c-aae8-48138d1c3deb	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N			\N	f	f	f						\N	\N	f		f				9G.12				\N	\N	\N	\N	\N	\N	\N	\N	\N
2cb9759a-118c-4f5e-83e2-91feee759087		1.55	4.22	3.58	0.24	0.24	I	\N				Black		\N		\N	\N	\N	\N		bc59a954-6ca1-4be6-a41e-1242410db030	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	\N	Undetermined		\N	f	f	t	wrapped	W	A	P	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
8f9e9a6f-6c69-46cf-adb1-50fe9f59934b	West	0.13	3.16	3.88	1.03	2.52		\N						\N		\N	\N	\N	\N	Limestone slab at the feet may or may not be associated with burial	73b0fd45-00d3-428c-a499-79471881eb89	\N	\N	2010-01-01	\N	\N	\N	\N	\N	1.65	2	\N	Undetermined		\N	f	f	f		B	A	U	A	\N	\N	t		f	2010	9						\N	\N	\N	\N	\N	\N	\N	\N	\N
35141e76-831b-4f9e-b7f7-622b3fd666d7	West	0.17	0.24	0.35	0.77	2.12		\N						\N		\N	\N	\N	\N	No head present\nBaby (#4) was laid over feet of the adult\n4th century pottery with limestone slabs beside (to the north)\nBoth 3&4 are baskets\nMostly skeletized	e0a4abd9-15b9-4a8a-9e55-55dc7cad33c6	\N	\N	2010-01-01	\N	\N	\N	\N	\N	1.41	3	\N	Undetermined		\N	f	f	f	basket	B	A	U	A	\N	\N	t		f	2010	13						\N	\N	\N	\N	\N	\N	\N	\N	\N
46f0f679-df8b-4f81-9694-3ca933573f85		0.13	0.48	0.38	1.76	2.33		\N						\N		\N	\N	\N	\N	Baby laid over feet of adult (#3)\nBoth 3&4 are baskets	e7a4e894-7189-4af9-9c16-072ae768d912	\N	\N	2010-01-01	\N	\N	\N	\N	\N	0.57	4	\N	Undetermined		\N	f	f	f	basket	B	C	U	I	\N	\N	t		f	2010	13						\N	\N	\N	\N	\N	\N	\N	\N	\N
0d70bb3a-2e36-426c-91ff-ef7d4258b4d2	West	0.13	2.02	2.23	0.16	0.72		\N						\N		\N	\N	\N	\N	Badly deteriorated baby on top of adult	9506966f-585d-4685-afb0-05c4f2e05fa5	\N	\N	2010-01-01	\N	\N	\N	\N	\N	0.65	5	\N	Undetermined		\N	f	f	f	basket	B	C	U	I	\N	\N	t		f	2010	15						\N	\N	\N	\N	\N	\N	\N	\N	\N
116f9918-ee1c-4502-99e9-bdfab22ef3f8	West	0.5	4.65	4.92	0.42	1.85		\N						\N		\N	\N	\N	\N	No Feet Available\nUnderneath coarse basket weave in layers (Probably a face bundle)\nOnly bones of legs present	46c8f274-5c4e-4e2f-a868-9c16a1a4b5eb	\N	\N	2010-01-01	\N	\N	\N	\N	\N	1.41	7	\N	Undetermined		\N	f	f	f	basket	B	A	U	A	\N	\N	t		t	2010	17						\N	\N	\N	\N	\N	\N	\N	\N	\N
5ea26f52-3e45-4eaf-ae03-ca602eddb781		0.37	4.19	4.19	1.99	1.99		\N						\N		\N	\N	\N	\N	Distances are to the bundle/central\nBuried along the side of burials 1&2 in this area	47a3eaac-5d46-4ded-878e-ebfb8ec51611	\N	\N	2010-01-01	\N	\N	\N	\N	\N	0.41	8	\N	Undetermined		\N	f	f	f	good	W	C	U	N	\N	\N	t		f	2010	19						\N	\N	\N	\N	\N	\N	\N	\N	\N
50fa644c-e40d-4f44-bea6-221d287a5aa8	West	0.45	2.31	2.52	2.27	2.98	6-7 years	\N				light brown		\N		\N	\N	\N	\N	copper earring\nBasket weave coarse weave shroud piece left on legs\nRed brick at the feet\nSkeltalized - badly deteriorated\nextra set of femnus that are 15 cm longer than the bones associated with the rest of the body	b3ee1c51-4f4f-4572-be84-110347d54ad5	\N	\N	2010-01-01	\N	\N	\N	\N	\N	0.84	9	\N	Undetermined		\N	f	f	f	basket	B	C	U	C	\N	\N	t	Y	f	2010	19						\N	\N	\N	\N	\N	\N	\N	\N	\N
6b399141-e41a-44a0-bb8b-d8bde8f71a4f	West	0.64	1.24	1.52	1.91	2.64	1-1.5	\N						\N		\N	\N	\N	\N	Body without head, but copper earrings with oyster\nremains of dark brown linen by feet\nbasket weave\nBadly deteriorated and dry textiles	d06e9238-e7a5-4d16-84e8-d893821af802	\N	\N	2010-01-01	\N	\N	\N	\N	\N	0.69	10	\N	Undetermined		\N	f	f	f	basket	B	C	U	N	\N	\N	t	Y	f	2010	23						\N	\N	\N	\N	\N	\N	\N	\N	\N
08da016b-9107-4147-a4b8-f68dd33b15b9	West	0.6	1.15	1.17	1.32	1.86		\N						\N		\N	\N	\N	\N	Skulls pretty well crushed	995d91b4-c885-439e-a96b-5a673c51f452	\N	\N	2010-01-01	\N	\N	\N	\N	\N	0.56	13	\N	Undetermined		\N	f	f	f	basket	W	C	U	I	\N	\N	t		f	2010	29						\N	\N	\N	\N	\N	\N	\N	\N	\N
4377179a-3907-4a31-b442-b4de4f804307	West	0.72	3.11	3.16	3.35	3.92		\N						\N		\N	\N	\N	\N	Wrapping in tact\nSub adult\nIndication of foot and face bundles\nPlain weave shroad of fine weave\nRope (sisel) ribbon wrapping in a diagonal pattern\nBasket	3587ee22-c990-4fbe-a626-9b96051a9815	\N	\N	2010-01-01	\N	\N	\N	\N	\N	0.65	14	\N	Undetermined		\N	f	f	f	basket	W	A	U	C	\N	\N	t		t	2010	31						\N	\N	\N	\N	\N	\N	\N	\N	\N
0cc9e42a-4786-4ddf-872c-bde0fb1f92fe	West	0.63	1.26	1.28	1.27	1.69		\N						\N		\N	\N	\N	\N	small deteriorated baby	9c7403ac-9972-4ed9-a989-439879f7f693	\N	\N	2010-01-01	\N	\N	\N	\N	\N	0.46	15	\N	Undetermined		\N	f	f	f	basket	B	C	U	I	\N	\N	t	Y	f	2010	33						\N	\N	\N	\N	\N	\N	\N	\N	\N
580daedc-60c9-47f2-8ea1-eb6e1f2a7943	West	0.63	1.89	1.67	1.69	1.85		\N						\N		\N	\N	\N	\N	infant in small shaft, no other burials associated with the infant\nsmall piece of very poorly made late period pottery\nribbon tied in a knot at feet\nno apparent grave goods	e93e4334-af93-4347-aa5c-37a44d6ca712	\N	\N	2010-01-01	\N	\N	\N	\N	\N	0.43	16	\N	Undetermined		\N	f	f	f	basket	U	C	U	U	\N	\N	t		f	2010	35						\N	\N	\N	\N	\N	\N	\N	\N	\N
c8b5cbff-dc03-46df-afc4-c47dca59a4f6		0.18	1.47	2.27	-0.05	0.88		\N						\N		\N	\N	\N	\N	No head or feet (possibly already in place when new shaft was being dug) Wood found at left and right sides of the body and a piece near the feet\nAeolian sand goes right down to the body - very close to surface\npiece of limestone removed from SE side of body, unclear whether or not intentional\nanother piece of limestone over head\nAlso found at feet - palm rib\nwood running along both sides of body\ntooth found near hands	e56b953b-9e79-41ec-83e3-35de0dcd3bb9	\N	\N	2010-01-01	\N	\N	\N	\N	\N	1.29	17	\N	Undetermined		\N	f	f	f	very poor - basket	B	A	U	U	\N	\N	t		f	2010	37						\N	\N	\N	\N	\N	\N	\N	\N	\N
e5a1604f-77a2-4bfb-a27f-f28c65f97df6	East	0.68	0.84	1.01	3.09	4.5		\N						\N		\N	\N	\N	\N	Is an adult buried on top of another adult (#19)\nAnother baby placed at feet\nHas hair on the back of cranium\nLimestone sheets above body and to the south of body	af02ecae-e1da-42e7-b26f-f95a229a6ca9	\N	\N	2010-01-01	\N	\N	\N	\N	\N	1.58	18	\N	Female		\N	f	f	f	fair	H	A	U	A	\N	\N	t		f	2010	39						\N	\N	\N	\N	\N	\N	\N	\N	\N
53f5eee6-6e45-43b9-a39d-caa8f816872f		0.91	0.96	0.96	3.48	3.48		\N						\N		\N	\N	\N	\N	Baby buried in between two adults (18 and 19) along with another baby at the feet (22)	8ee3459a-1575-4ebf-a94a-11b268511177	\N	\N	2010-01-01	\N	\N	\N	\N	\N	\N	20	\N	Subadult		\N	f	f	f		U	U	U	N	\N	\N	t		f	2010	43						\N	\N	\N	\N	\N	\N	\N	\N	\N
24527cc4-ba79-4d43-9e30-0a1ecb20b531		0.9	1.07	1.07	3.98	3.98		\N						\N		\N	\N	\N	\N	Baby - pile of bones with some textiles	27c295e2-2681-40e1-9df9-c8f10e78fcc2	\N	\N	2010-01-01	\N	\N	\N	\N	\N	\N	22	\N	Undetermined		\N	f	f	f		B	C	U	N	\N	\N	t		f	2010	47						\N	\N	\N	\N	\N	\N	\N	\N	\N
48d60c50-5f26-440a-80f3-725a840b1039	West	0.95	3.9	4.25	2.29	4.05		\N				dark brown		\N		\N	\N	\N	\N	5 mud bricks from shoulder to feet on right side\nwhite plain linen weave shroud\nnice teeth-bit of malocclusion\nCurly hair\npieces of palm sticks wrapped in cloth closest to the body	af311ec8-eb2b-473d-9dc1-3ece1b49590e	\N	\N	2010-01-01	\N	\N	\N	\N	\N	1.9	23	\N	Undetermined		\N	f	f	f		H	A	U	A	\N	\N	t		f	2010	49						\N	\N	\N	\N	\N	\N	\N	\N	\N
84a35742-e014-438c-b291-09c7ced8359e		2.25	0.48	0.87	3.11	2.59	40+	\N						\N		\N	\N	\N	\N		b99549f9-1339-4248-a9af-2962857ac143	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	Male		\N	f	f	f	Skull only	B	A	S	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
0cfba448-3a39-4b05-92b0-12b50a522664		0.5	3.5	4	2.35	1.14	30	\N						\N		\N	\N	\N	\N		a8a3fae5-4b2e-48e5-9bf2-50c1264eab34	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	Female		\N	f	f	f	wrapped - bones showing	H	A	S	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
bb6815a7-1589-48dc-9e59-e68194c2932c		0.5	3.74	3.74	3.48	2.9	6 mos -1 yr	\N				RED		\N		\N	\N	\N	\N		e2026d6f-e91a-439f-ab7d-6b2d876aa6c6	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	P	N	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
b4d7e576-7070-4015-9731-2e65b799c874		0.5	3.88	3.9	3.9	3.35	6 months	\N						\N		\N	\N	\N	\N		8a5795c2-18dc-42c9-ad1b-fea22b8ad70f	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	S	N	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
20e56359-a901-43e7-b695-84472d5389ac		0.66	4.25	4.09	4.9	3.44	26-33	\N				Black		\N		\N	\N	\N	\N		7ee8077d-9458-4e03-9af8-223e27c08949	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	\N	Male		\N	f	f	f	wrapped	W	A	P	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
64cd23f5-5c89-443d-9022-4285cd956b68		0.66	2.54	3.04	3.66	1.79	40+	\N						\N		\N	\N	\N	\N		296ca745-5e6d-4518-88e0-4f53316d92ec	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	\N	Male		\N	f	f	f	wrapped	W	A	P	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
b54e6621-c21d-4782-bd8a-d5f00dba8dc9		0.5	2.44	2.04	1.47	3.17	20-40	\N						\N		\N	\N	\N	\N		6b9c976c-1816-4b6c-b9fe-200257f5c629	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	Male		\N	f	f	f	wrapped	W	A	P	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
def353d8-1fa7-4d4c-955a-e8a5303d3de7		0.66	3.83	0	0.87	0	20+	\N						\N		\N	\N	\N	\N		e8eae724-4bfb-4f22-8627-d15e17a18a79	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	Female		\N	f	f	f	Skull only	B	A	S	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
c12182cf-8981-426d-abba-91f5578fa5dd		0.66	4.28	0	0.75	0	3-6 years	\N						\N		\N	\N	\N	\N		cab3f5b0-9fc5-4ccc-8253-75f6390652b6	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	Undetermined		\N	f	f	f	Skull only	B	C	S	C	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
9df8e36c-ddca-46d4-b9b9-c69c44a0a164		0.66	4.43	0	0.2	0	12-20 years	\N						\N		\N	\N	\N	\N		7dd248d8-a388-4659-bd71-13730e2ff8be	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	Undetermined		\N	f	f	f	Skull only	B	C	S	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
51951ba9-60f0-470f-9ec3-62d81441cac9		0.66	4.15	0	0.6	0	Infant	\N						\N		\N	\N	\N	\N		a9feb374-2b5f-479a-a054-896df31f2815	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	\N	Undetermined		\N	f	f	f	Skull only	B	C	S	I	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
ca8e62d9-e172-43f3-a374-4860ed1f3ab9		0.66	2.93	2.83	2.48	4.23	25-35	\N						\N		\N	\N	\N	\N		2e61b5fd-ad19-4089-b690-d447694dc868	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	Male		\N	f	f	f	well-wrapped	W	A	P	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
06c1b19c-f610-4b39-8afe-ffb993741564		0.5	3.27	3.27	1.12	2.78	20-40	\N						\N		\N	\N	\N	\N		b4bc2504-fce5-45e9-9e4a-73f89d940edf	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	Female		\N	f	f	f	wrapped	W	A	P	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
2ae1084a-7481-4dc7-b5f0-6b6676135542		0.5	3.63	3.66	2.64	4.12	40+	\N						\N		\N	\N	\N	\N		d7070aca-bb62-40bd-8b2f-c763785024a4	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	Female		\N	f	f	f	wrapped	W	A	P	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
40511715-48d3-48a2-b323-7149784af40e		0.8	2.24	1.85	0.25	1.52	25-30	\N						\N		\N	\N	\N	\N		7b1129a7-69a0-4d2a-beb3-b87d87edad40	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	Male		\N	f	f	f	wrapped	W	A	P	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
5cc15972-7f2a-4af7-b0e9-5414dbec0ea4		1.5	4.51	4.07	2.94	4.4	40+	\N						\N		\N	\N	\N	\N		55b80517-20d1-4ce4-a158-5b7d7c56dbca	\N	\N	\N	\N	\N	\N	\N	\N	\N	16	\N	Female		\N	f	f	f	wrapped - bones showing	H	A	P	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
8f60f5a3-02a2-4548-a330-ed512837f398		1.45	4.63	4.08	2.66	4.26	40+	\N						\N		\N	\N	\N	\N		412d2047-2c67-43be-a87b-26acef46ad81	\N	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	Female		\N	f	f	f	poorly preserved	B	A	P	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
fd0df308-3bb4-4b07-a0b4-6a8ddf4e682e		0	0	0	0	0		\N						\N		\N	\N	\N	\N		a576312e-afb9-4a7b-8aa2-3790ba74c113	\N	\N	\N	\N	\N	\N	\N	\N	\N	18	\N			\N	f	f	t						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
92c61c4a-1d5f-4532-b376-6b2fb54885ba		1	4.11	4.07	1.38	2.1	18 months	\N						\N		\N	\N	\N	\N		eacab596-4c28-4ec7-814d-37ab55deed21	\N	\N	\N	\N	\N	\N	\N	\N	\N	19	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	P	I	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
4737d586-c6c6-4e7d-b19e-46462c67e985		1.86	3.05	2.72	1.49	3.04	40+	\N						\N		\N	\N	\N	\N		73e705ca-2583-403e-bf31-158968e432ac	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	Male		\N	f	f	f	SKELETON	B	A	P	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
3603807e-946d-4f1f-9f0e-61daa50717a0		1.75	3.25	0	3.04	0	6-18 months	\N						\N		\N	\N	\N	\N		e294a34d-7a56-435e-a795-c88ed124131d	\N	\N	\N	\N	\N	\N	\N	\N	\N	21	\N	Undetermined		\N	f	f	f	bones	B	C	P	N	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
b3988bf9-b914-4899-98eb-e11edae5209e		1.9	1.4	0	2.14	1.4	22	\N						\N		\N	\N	\N	\N		d20364da-3715-41a0-9f1e-bfee2b032463	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	Female		\N	f	f	f	poorly preserved	B	A	P	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
02e3ea86-f327-4350-ab9c-1969c06d4dd5		2.54	3.81	3.53	2.24	3.91	40+	\N				Black		\N		\N	\N	\N	\N		bd6286e9-78a5-4a61-99ff-6b96c7007753	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	Male		\N	f	f	f	SKELETON	B	A	P	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
84aa5dbf-ad4e-430a-8e92-111776f458be		1.32	2.98	2.92	2.88	3.69		\N				reddish brown		\N		\N	\N	\N	\N		e0202253-3962-4027-a768-608e9e63012d	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	\N	Female		\N	f	f	f	well wrapped	W	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
d0b9e6d7-eb57-420f-b4d8-c354b0e36ac7		1.32	2.98	2.92	2.88	3.69		\N				reddish brown		\N		\N	\N	\N	\N		fdcad88f-e646-4ff0-9841-e38d97595705	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	\N	Female		\N	f	f	f	well wrapped	W	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
eceae76e-a434-4d1f-bde2-45dd85f03dd2	Undefined	0.3	0.53	0.53	2.72	2.72		\N						\N		\N	\N	\N	\N	yellow, red, and purple cloth fragments	7377f3a8-4a17-4fca-aec5-b397997260e5	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	4	\N	Undetermined		\N	f	f	t		U	U	U	U	\N	\N	f		f	1994B	3						\N	\N	\N	\N	\N	\N	\N	\N	\N
13a398c6-8a9b-49ce-b7e9-ba51d36a589d	Undefined	0	0	0	0	0		\N						\N		\N	\N	\N	\N	blue burial\nfloral designs in linen, second layer is rope tied\nfloral at knees, not on hips or shoulders\ninner layer rope tied\nwool\nyellow\nbadly decomposed\nwool-saved sample, photo #21\ninner most wrap is coarse linen, hemmed with rope like finish\nsciatic notch-wide\npubic angle-medium\ntorso, skull, and feet missing\nFemur - 48cm\nsamples:internal tissue-for Heckman ankle skin	a33a58d4-f6b4-4409-bf1c-b43282a86caa	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	7	\N	Undetermined		\N	f	f	t		B	A	U	A	\N	\N	t		f	1994C	7						\N	\N	\N	\N	\N	\N	\N	\N	\N
cf2f829f-1c9e-4789-acea-ee02fe08ed6f	West	1.24	4.09	4.13	2.06	3.61		\N						\N		\N	\N	\N	\N	no skull	3fc11704-8865-4c89-bc7a-44b74ee6d247	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	7	\N	Undetermined		\N	f	f	t	disturbed	B	A	U	A	\N	\N	t		f	1994B	11						\N	\N	\N	\N	\N	\N	\N	\N	\N
e3df4c56-4386-4588-ac61-17ef6fd64a2c	Undefined	1.3	4	4	2.85	3.2		\N						\N		\N	\N	\N	\N		603d14c4-ea08-423e-af7c-170583cbc44d	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	9	\N	Undetermined		\N	f	f	t		U	U	U	U	\N	\N	f		f	1994B	11						\N	\N	\N	\N	\N	\N	\N	\N	\N
bbd11d07-3709-4399-bdb6-de5b9ca68cee	Undefined	0.8	1.66	1.42	5.09	6.26		\N						\N		\N	\N	\N	\N	Burial#13 is laying on top of body	9f9cbeab-5b8f-4522-80ce-37386e25894f	\N	\N	1994-01-01	\N	\N	\N	\N	\N	1.2	14	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994A	21						\N	\N	\N	\N	\N	\N	\N	\N	\N
0bedc75c-384e-4f8f-9511-04698bbb396e	Undefined	0	0	0	0	0		\N				brown		\N		\N	\N	\N	\N	Skull disarticulated\nFibula 63.6 cm\nSamples of skin and ribs\nThis is one of two infants (#7,9) buried with adult (#8)	66bfdb8a-63ec-4567-91e6-17cd8cca619d	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	9	\N	Undetermined		\N	f	f	t		B	C	U	I	\N	\N	f		f	1994C	1						\N	\N	\N	\N	\N	\N	\N	\N	\N
f51b194f-f58b-4406-ae2c-2fe6b9683801	Undefined	1.31	4.5	2.68	2.4	1.7		\N						\N		\N	\N	\N	\N	No Feet , No head\nFemur in tact\nSamples: skin from rib area and ribs	d3a37bf8-7a25-4d60-ae09-b988569b9143	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	10	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1994B	11						\N	\N	\N	\N	\N	\N	\N	\N	\N
3da34b80-9152-4cd2-983c-135ca364ca39	Undefined	1.1	2.6	2.4	2.48	4.33		\N				Brown		\N		\N	\N	\N	\N		20696eea-fb2a-4401-a29b-6b89d64e6bfd	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	12	\N	Undetermined		\N	f	f	t		W	A	U	U	\N	\N	t		f	1994B	13						\N	\N	\N	\N	\N	\N	\N	\N	\N
ecdb27e2-47f1-4558-b723-d2788301855a	Undefined	1.38	1.7	1.9	2.1	3.81		\N						\N		\N	\N	\N	\N	no skull, right pelvic bone, femur, right ulna, part of right radius, humerus, scapula, and clavical	8fd1b238-f7c7-4106-af6d-b0a25e0ae22c	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	13	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B	13						\N	\N	\N	\N	\N	\N	\N	\N	\N
2bb91c5e-c8b4-4d3a-8b8f-508d4d394adb		1.21	2.94	2.94	3.82	5.57		\N				Brown		\N		\N	\N	\N	\N	Some Woven mat under head	1d5c9d57-0d59-41d2-af44-a94833546cba	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
c0da8759-d50c-458f-839d-9bb55180703b		1.5	0.83	0.77	2.06	2.75	4-5 yr.	\N						\N		\N	\N	\N	\N	Disarticulated cloth torn, Associated with burial is a reed basket at foot of mummy, a pot south of the skull	38bd50b2-f299-4c6e-a483-c8d5e64eeb2a	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	Undetermined		\N	f	f	t		H	C	U	C	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
52a079b3-bdeb-4849-93b5-2b068e7aca26	East	0	0	0	0	0	5-6 yr.	\N				Brown		\N		\N	\N	\N	\N	Wrapped with fabric under and around the body\nBurial was a Reversal with head to the East	5d710c0e-73cb-489a-9333-8ce602df1601	\N	\N	\N	\N	\N	\N	\N	\N	\N	16	\N	Undetermined		\N	f	f	t		W	C	U	A	\N	\N	t		f	1994B	18/27						\N	\N	\N	\N	\N	\N	\N	\N	\N
30287cf6-f78e-44fe-a599-8a939ad094df	East	1.9	1.98	1.82	2.17	1.58		\N						\N		\N	\N	\N	\N	Depth to head 190cm depth to feet 200cm	0fcf348b-befd-48e9-852e-a92cb76f3d3f	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	16	\N	Undetermined		\N	f	f	t		W	A	A	A	\N	\N	t		f	1994B	43						\N	\N	\N	\N	\N	\N	\N	\N	\N
c63e1be9-5cde-4c7c-901f-1c77c3fab4cd	Undefined	0	0	0	0	0		\N						\N		\N	\N	\N	\N	Some textiles on head\n3rd molar top or bottom has not erupted\nno markings or color on textile\nlinen tied strips of cloth\ntook two samples	7b987864-b712-406a-8558-4bdf1df328c7	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	18	\N	Undetermined		\N	f	f	t	disarticulated	H	C	U	C	\N	\N	t		f	1994C	14						\N	\N	\N	\N	\N	\N	\N	\N	\N
dc904bcf-962f-46a2-af3b-bf74d612e6bd	West	2.1	2	1.95	1.8	2.29		\N						\N		\N	\N	\N	\N	Some fabric and some hair on skull	b20e19ff-a9cf-4437-8012-842f1bf6acf3	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	18	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1994B	30						\N	\N	\N	\N	\N	\N	\N	\N	\N
51b36f43-ead9-4d1c-bbf3-9dc087b02661	East	2.29	3.85	4.57	3.73	2.24		\N						\N		\N	\N	\N	\N	Depth to head 230cm depth to feet 250cm	51cfcb80-3e35-47ae-957d-40a380df5857	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	24	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B	43						\N	\N	\N	\N	\N	\N	\N	\N	\N
4516b9ea-0b19-4d1d-8991-3bd726e66cc3	Undefined	2.18	3.38	3.38	0.2	0.2		\N						\N		\N	\N	\N	\N	Some very small pieces of turquoise found next to head (roman pottery)	fbcdd5ef-ad3f-4a8c-b6a0-6ce7992d1732	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	25	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B	43,46						\N	\N	\N	\N	\N	\N	\N	\N	\N
e03f3cc1-65f2-4071-861f-ca57b8ad127c	Undefined	2.35	3.8	3.75	0.1	1.8		\N						\N		\N	\N	\N	\N	In shaft with basket	95fe9a37-eef9-4342-9fd3-f6c252404f66	\N	\N	1994-01-01	\N	\N	\N	\N	\N	1.7	26	\N	Male		\N	f	f	t		H	A	U	A	\N	\N	t		f	1994B	48						\N	\N	\N	\N	\N	\N	\N	\N	\N
a2fa175e-1c8d-4def-8353-8ab73549136d	Undefined	1.1	0	0	-0.2	0.9		\N						\N		\N	\N	\N	\N	"This burial may have another number but I haven't been able to locate it"	05c322b7-edea-43d0-b82c-bcff9e2d0f72	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	27	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1994B	48						\N	\N	\N	\N	\N	\N	\N	\N	\N
e8a1cf48-6726-48f4-a9b9-dbb4be2af3f7	East	0.74	0.15	0	1.7	0.8		\N						\N		\N	\N	\N	\N	Total depth >235cm\nCollected teeth\nDepth to head from top edge of shaft 74cm depth to feet from top edge of shaft 88cm	d421284e-2ee4-4828-970a-70a5786b286a	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	28	\N	Undetermined		\N	f	f	t		B	C	U	C	\N	\N	t		f	1994B	50						\N	\N	\N	\N	\N	\N	\N	\N	\N
677d384e-763f-4424-939c-c64fbe29844f	Undefined	0.8	2.2	2.1	1.55	1.25	U	\N				br-red		\N		\N	\N	\N	\N	No ribbon or rope on outer wrap, fabric coarse weave doubled yarn, in a single layer of wrap (sample taken)\nNext layer wrapped with red/white ribbon\nCloth is same type as outer wraps (saved small fragment as cloth is decomposed)	efc2526c-b5d2-4ef3-bd48-d1e44c4099af	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	2	\N	Undetermined		\N	f	f	t	W	H	C	P	C	\N	\N	t	U	f	1987B	98						\N	\N	\N	\N	\N	\N	\N	\N	\N
a893c87f-7b70-45fc-bd41-f5fcde7890d7	Undefined	0	2.4	1.95	0	1.1	U	\N				br-red		\N		\N	\N	\N	\N	Basket case on a board, evidence of fringed fabric, red/white ribbon, coarse outer fabric\nToo decomposed to determine layers etc\nFabric badly deomposed, evidence of red/white ribbon\nOuter layer of coarse fabric, finer fabric next to body (sample taken)\nCan't find burial measurements, or details on hair in the field book that are noted in the database (TW)	f823c8a4-8fd1-4273-8c9c-e2f20a7d7e58	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	3	\N	Undetermined		\N	f	f	t	S	W	C	P	U	\N	\N	t	U	f	1987B	99,101						\N	\N	\N	\N	\N	\N	\N	\N	\N
3be6ad0e-f0a8-436a-b0a6-d59c74132311	Undefined	0	0	0	0	2	I	\N				black		\N		\N	\N	\N	\N	There was a trace of red and green with bundles, mostly yellow fabric but it was so badly carbionized it simply disintegrated when I attempted to separate the layers\nCan't find burial measurements, or details on age, hair, or gender in the field book that are noted in the database	71fb017b-7d2f-4a53-9930-8882f76d086a	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	5	\N	Male		\N	f	f	t	W	W	A	P	U	\N	\N	t	U	t	1987B	93						\N	\N	\N	\N	\N	\N	\N	\N	\N
ca53d3ea-11cd-4505-9acc-f06a64f4ab4a	Undefined	0	2.6	2.5	2.8	2.8		\N				br-red		\N		\N	\N	\N	\N	Only a small fragment of cloth but it does show a fringe\nCan't find burial measurements, or details on age, or gender in the field book that are noted in the database	b1134719-c99b-414f-b300-14eec046fb29	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	6	\N	Undetermined		\N	f	f	t	B	B	C	P	U	\N	\N	t	U	f	1987B	27						\N	\N	\N	\N	\N	\N	\N	\N	\N
0569bbcc-b275-4dad-a85a-eba4b3ed49ac	Undefined	0	1.2	0.7	2.5	4.2	U	\N				Black		\N		\N	\N	\N	\N	Badly decomposed coarse fabric\nOuter layer white, 2nd layer red, there is a red design on the edge of a white fabric sample\nthe outer robe is brown and very coarse, the inner robe is white with red and green trim has a section between ? and ankles of skipped filling like a build in fringe\nThe head wrap had a red circular design in a white fabric plus a section of built in fringe like that above\nA white cross is on the red circular design\nCan't find burial measurements, or details on age, or gender in the field book that are noted in the database (TW)	600806fa-2b26-4288-94cb-abf2ddbadb4b	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	7	\N	Male		\N	f	f	t	B	B	A	P	U	\N	\N	t	U	f	1987B	26						\N	\N	\N	\N	\N	\N	\N	\N	\N
26bb2d0e-8cb3-4cfc-9fc1-80073d02099a	Undefined	1.2	0.8	0.52	1.6	2.4	18 months	\N				red		\N		\N	\N	\N	\N	The 1987B field book says 4 yrs old, but the database has 18 mo\nVery badly decomposed\nCoarse fabric - red and white ribbon\nOne small train of red and green\nSaved samples\n2 reeds with body\nCan't find burial measurements, or details on age, or gender in the field book that are noted in the database (TW)	54b37770-f48c-4824-a4a9-b79bceb2e110	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	12	\N	Undetermined		\N	f	f	t	B	B	C	P	I	\N	\N	t	U	f	1987B	35						\N	\N	\N	\N	\N	\N	\N	\N	\N
5a7e63cd-1ff0-46fd-bf89-a5a08a2f517e	Undefined	0.9	0.3	0	0.5	1.4	2-4 years	\N				br-red		\N		\N	\N	\N	\N	Body wrapped with coarse cloth, 6 layers, tied with red/white pattern ribbons\nLong fringe found with body\nCan't find burial measurements, or details on hair, age, or gender in the field book that are noted in the database (TW)	cd8c7c8b-a4d0-4cca-b2a1-0fd4a1058019	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	14	\N	Undetermined		\N	f	f	t	W	W	C	P	I	\N	\N	t	U	f	1987B	41						\N	\N	\N	\N	\N	\N	\N	\N	\N
9ad6b25c-122c-4e79-9705-636d99e82f28	Undefined	1	0.4	0	0.5	0	2-3 years	\N				br-red		\N		\N	\N	\N	\N	Basket case, decomposed fabric, some fragments of undyed cloth, coarse weave, red & white ribbon\nPiece of cloth with fringe\nFabric next to body was very fine weave, yarns visible aas dark decayed redidue\nUnable to preserve samples\nBody was fully blue bugs\nCan't find burial measurements, or details on age, or gender in the field book that are noted in the database (TW)	78e3cb7d-5a3b-47a7-88a7-e790da63d0b3	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	15	\N	Undetermined		\N	f	f	t	S	B	C	P	I	\N	\N	t	U	f	1987B	36						\N	\N	\N	\N	\N	\N	\N	\N	\N
8fe892c8-da6e-4ffa-8f84-68bd2291dc88	West	1.96	4.09	3.6	2.9	1.47		\N				Brown		\N		\N	\N	\N	\N	Tied sticks,  Small piece of linen	4cadd9e0-2ca2-46c6-b1fa-7b353168035b	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	20	\N	Male		\N	f	f	t		H	A	U	A	\N	\N	t		f	1994B	B-12,14						\N	\N	\N	\N	\N	\N	\N	\N	\N
dab75f5e-cfec-42cf-a63a-09d7cb2d1927	Undefined	1	4.84	4.75	3.75	4.26	12-18 mos.	\N				Brown		\N		\N	\N	\N	\N	6 small fragments of cloth one contained a piece of jewelry, another oxidized green remains. Perhaps large earrings\nCan't find burial measurements, or details on hair, age, or gender in the field book that are noted in the database (TW)	8deec43b-4cc8-4193-a294-893b0b5d002a	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	19	\N	Undetermined		\N	f	f	f	S	B	C	P	I	\N	\N	t	piece of jewelry	f	1987B	56						\N	\N	\N	\N	\N	\N	\N	\N	\N
6911d788-0af9-4f21-8338-4000c239cc25		1.1	3.2	3.17	2.62	3.35	12-18 mos.	\N						\N		\N	\N	\N	\N		5dd99dbf-8653-4898-9d7d-f01a45a462f1	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	Undetermined		\N	f	f	f	SKELETON	B	C	P	I	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
4de63d41-44b9-4468-83e2-fe62322b3c43	Undefined	1.1	2.82	2.7	0.25	1.35	6 months	\N				U		\N		\N	\N	\N	\N	Only some fabric from the waist to feet of an infant\nCoarse tight weave, tied with rope - 7 layers of cloth\n4th layer from outside had long fringe\nCan't find measurements, or details on age in field book that are described in database (TW)	a8ee6148-d17d-42bc-a07c-f8eb097779bf	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	23	\N	Undetermined		\N	f	f	f	W	W	C	P	N	\N	\N	f	U	f	1987B	65						\N	\N	\N	\N	\N	\N	\N	\N	\N
bfe902e0-c082-42ee-8752-d82b5607f521	Undefined	1.2	2.7	2.4	0.08	1.14	3.5 years	\N				Brown		\N		\N	\N	\N	\N	Coarse fabric tied with rope\nPiece of cloth over the feed had 2 differenct types of fringe, however this may also be 2 different layers of fabric; each of different types\n3 cord affect found in one layer\n5 layers of fabric on chest\nCan't find measurements, or details on age, or hair in field book that are described in database (TW)	aba43b6d-2584-48a2-b63c-08e638f6197e	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	24	\N	Undetermined		\N	f	f	f	B	B	C	P	C	\N	\N	t	U	f	1987B	61						\N	\N	\N	\N	\N	\N	\N	\N	\N
b57f734e-74ae-4693-a373-ddeed7b4c9ff	Undefined	1.3	2.5	2.4	0.25	1.12	1 year	\N				br-red		\N		\N	\N	\N	\N	Crushed skull, fabric badly decomposed\nSamples of red, yellow, green and light green yarn. Same pattern in purple - saved samples\nCloth has several old yarns woven in almost as a tie string - saved samples\nCan't find measurements, or details on age and hair in field book that are described in database (TW)	31d8cf99-4201-4328-acb2-3bac1a6cb9ec	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	25	\N	Undetermined		\N	f	f	f	B	B	C	P	I	\N	\N	t	U	f	1987B	63						\N	\N	\N	\N	\N	\N	\N	\N	\N
2b6832d3-6bfa-474f-83a2-fbf06d284d5c	Undefined	1.6	3.5	2.85	1.05	2.6	V	\N				Brown		\N		\N	\N	\N	\N	Young child, head wrap gone, body wrap in fair shape\nCan't find burial measurements or details on age or hair in field book that are described in database (TW)\nNo cloth wrapping, tied with rope, tied with a square knot\nsaved rope sample	5f519ad6-deac-499b-af30-46e102248050	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	27	\N	Male		\N	f	f	f	S	B	C	P	U	\N	\N	t	U	f	1987B	64,67						\N	\N	\N	\N	\N	\N	\N	\N	\N
32a81761-08c7-40e9-bf50-04ef769444a4	Undefined	1	3.83	0	2.63	0	18 months	\N				br-red		\N		\N	\N	\N	\N	Wrapped in red/white ribbon, coarse yarn (tight weave), rope, repeat in fabric, 5 layers\nBasketcase - fragments of red/white ribbon\nsome fragments of out fabric - samples\nCan't find measurements, or details on age, or hair in field book that are described in database (TW)	542be089-396a-4b8c-8feb-aec62efa732e	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	31	\N	Undetermined		\N	f	f	f	S	B	C	S	I	\N	\N	t	U	f	1987B	88,90						\N	\N	\N	\N	\N	\N	\N	\N	\N
1090f759-1774-447c-b800-da454dd2fc2e	West	1.45	4.51	4.23	2.29	1.56	4 years	\N				br-red		\N		\N	\N	\N	\N	Outer layer of fine fabric wrapped with rope and red/white ribbon\nNext layer coarse, next has some red thread (some fringe at feet) - sample taken\nCan't find details on age or hair	e917fa3e-7e2c-4f8f-af88-9b1d81438cbe	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.83	32	\N	Undetermined		\N	f	f	f	W	W	C	P	C	\N	\N	t	U	f	1987A/1987B	37/89						\N	\N	\N	\N	\N	\N	\N	\N	\N
4bd3237a-a839-4f20-b483-7939794584aa	West	1.5	4.57	4.41	1.35	2.14	4 years	\N				br-red		\N		\N	\N	\N	\N	Basket case - body wrapped in coarse fabric next to body - 5 layers - sample taken\nReed/palm tree fibers on head\nCan't find details on age or hair in field book that are described in database (TW)	d5512c3e-e393-4c33-be25-d51ce3f777a1	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.82	33	\N	Undetermined		\N	f	f	f	S	B	C	P	C	\N	\N	t	U	f	1987A/1987B	37/87						\N	\N	\N	\N	\N	\N	\N	\N	\N
0ee4c09a-f6ef-4fc7-9324-77182774e3cb	Undefined	0.52	2.4	1.86	1.43	3.18		\N						\N		\N	\N	\N	\N	Depth is 52cm for Head and 72cm for feet, Cloth bundle under feet\n#6 child is laying next to body as well\n#3 child is to the north of this adult as well\nSurroundings of this burial suggests that the body is hollow\nLate 3rd century pottery with red cloth found with body	d4c83c83-5db2-4f9e-af22-d4ea7993582d	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	1	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994A	19						\N	\N	\N	\N	\N	\N	\N	\N	\N
cd409f79-70b4-4f44-8bc5-af7c1f4e2497	Undefined	0.63	1.98	1.97	1.83	2.27		\N						\N		\N	\N	\N	\N	In a cluster burial with adult #1 and with two other children #4 and #6	29332610-aada-4e20-acf2-3e9f081c1210	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	2	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	t		f	1994A	19						\N	\N	\N	\N	\N	\N	\N	\N	\N
4d7b3d52-7612-4983-bf80-96b321b46a04	Undefined	0	0	0	0	0		\N						\N		\N	\N	\N	\N	Infant tied with rope with two yellow wool blankets with red across top fringe	ca56f046-dcc1-42d6-a74e-33f57cd2d8cb	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	2	\N	Undetermined		\N	f	f	f		W	C	U	I	\N	\N	t		f	1994D	25						\N	\N	\N	\N	\N	\N	\N	\N	\N
7a3914f9-a7c0-4dbf-8236-03adbfc9425c	Undefined	0.88	1.79	1.83	2.14	2.7		\N						\N		\N	\N	\N	\N	Is a child buried next to burial#1	af7ce3db-46d2-4780-97d2-eb42a9ba56d9	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	4	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1994A	19						\N	\N	\N	\N	\N	\N	\N	\N	\N
99a8a2fd-a1ee-4697-a955-8c5eb955ac53	Undefined	0	0	0	0	0		\N						\N		\N	\N	\N	\N	tied with rope\nHeavy wool blanket\nred head cap	3bfc498b-c5d6-4021-be34-8647453cdf24	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	4	\N	Undetermined		\N	f	f	t		W	C	U	I	\N	\N	f		f	1994D	24						\N	\N	\N	\N	\N	\N	\N	\N	\N
c137c78c-6b74-41d4-9b96-3d69adb04d5d	Undefined	0.78	1.41	1.26	3.13	3.82		\N						\N		\N	\N	\N	\N	Depth is 78cm to head and 80cm to feet	44e7bffc-77c6-4b76-bc59-257edb18295e	3d9a6694-0722-4229-8757-dfc753500788	\N	1994-01-01	\N	\N	\N	\N	\N	\N	5	\N	Undetermined		\N	f	f	t		W	C	U	U	\N	\N	t		f	1994A	19						\N	\N	\N	\N	\N	\N	\N	\N	\N
0b88847b-c1d5-46ac-9442-b70553c82cad	Undefined	0.89	1.98	1.66	2.27	3.19		\N				light brown		\N		\N	\N	\N	\N	Length is about 98cm\nUnder #1 and #4\nHead is tilted to the north - jaw is closed\nReeds under cloth\nSome teeth missing\nBrown ribbon to tie together small face bundle-partially decomposed\nClavicle on right is badly dislocated	0094284f-6eb0-4e97-8b36-0cc0cbba8020	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	6	\N	Undetermined		\N	f	f	t		H	C	U	A	\N	\N	t		f	1994A	19						\N	\N	\N	\N	\N	\N	\N	\N	\N
15d58809-8ea9-4e8b-b647-d4c100676083		0	0	0	0	0		\N						\N		\N	\N	\N	\N	Infant tied with rope	42d3900f-35ee-4e72-8757-dd3194a06aa5	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	Undetermined		\N	f	f	t		W	C	U	I	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
bf2d238a-a1fe-444d-9d86-64251c0503cf	Undefined	1.2	2.12	2	3	3.42		\N						\N		\N	\N	\N	\N		68f5bff0-f80f-47ff-b349-3b502e4ddbf9	\N	\N	1994-01-01	\N	\N	\N	\N	\N	0.51	8	\N	Undetermined		\N	f	f	t	Good	W	C	U	A	\N	\N	t		f	1994A	21						\N	\N	\N	\N	\N	\N	\N	\N	\N
122c4ed8-43ce-4304-bc41-fbcd4aa28fc4	Undefined	0	0	0	0	0		\N						\N		\N	\N	\N	\N	Newborn wrapped in wool blanket tied with rope\nmore wrapping details described	0af13112-2879-43ce-a1e3-07d011c4f05e	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	8	\N	Undetermined		\N	f	f	t		W	C	U	N	\N	\N	t		f	1994D	23						\N	\N	\N	\N	\N	\N	\N	\N	\N
08066b58-ffc6-48d8-b270-7164586cc871	Undefined	0.92	2.17	2.17	3.72	3.72		\N						\N		\N	\N	\N	\N	Buried directly below Burial#7A and two babies are buried on either side of this body's knees	9999e9ed-7eed-4eb2-ad29-1a549d90083a	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	9	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994A	21						\N	\N	\N	\N	\N	\N	\N	\N	\N
81b687cd-bf07-4aa3-be9f-1d971eeb7283	Undefined	0.92	2.49	2.39	4.47	5.33		\N						\N		\N	\N	\N	\N		ef939cd4-3269-48b4-8ae9-86ad138b01fb	\N	\N	1994-01-01	\N	\N	\N	\N	\N	1.02	10	\N	Undetermined		\N	f	f	t		W	A	U	U	\N	\N	t		f	1994A	21						\N	\N	\N	\N	\N	\N	\N	\N	\N
13378b2f-b224-4a26-b265-69cb1dd6f054	Undefined	1.22	1.7	1.5	4.78	5.12		\N						\N		\N	\N	\N	\N	Depth to Head is 122cm and to the feet is 99cm\nFound a head upside down on right side of body It looks like it is the detached head of Burial#11 it is about 5cm below burial#11	a318e993-a4a6-4504-8486-fc678e5e107b	\N	\N	1994-01-01	\N	\N	\N	\N	\N	0.53	12	\N	Undetermined		\N	f	f	t		W	C	U	A	\N	\N	t		f	1994A/1987B	21						\N	\N	\N	\N	\N	\N	\N	\N	\N
6217eff0-c4bd-4796-b5b5-c3ebadc0b8b2	Undefined	0.94	1.62	1.46	5.39	6.07		\N						\N		\N	\N	\N	\N	Is a baby buried on top of Burial#14	a1d1d73a-1de3-47f8-811a-a0cb49a211ac	\N	\N	1994-01-01	\N	\N	\N	\N	\N	0.69	13	\N	Undetermined		\N	f	f	t		W	C	U	N	\N	\N	t		f	1994A	21						\N	\N	\N	\N	\N	\N	\N	\N	\N
b0e28a56-1e07-41bf-8a64-bcc4f0a0db65	Undefined	0	0	0	0	0		\N				Brown		\N		\N	\N	\N	\N	No head\nSticks under linen wrap\nSome red/blue cloth	97922056-7761-495a-98ba-eeed8afc4f5b	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	13	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1994D	24						\N	\N	\N	\N	\N	\N	\N	\N	\N
af352143-58f6-48a1-b8f0-50999c09d1f1	Undefined	0	0	0	0	0		\N						\N		\N	\N	\N	\N	Head crushed, and not by us\nMany layers of covering\n2 layers of red/white ribbon on outer wraps of medium weave\nFace bundle of folded coarse linen	a9f70b04-efcd-41c9-9c85-9de36cd637f7	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	14	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		t	1994C	22						\N	\N	\N	\N	\N	\N	\N	\N	\N
54ed979f-eaf2-4aeb-bbfc-229025a206e4	Undefined	1.07	1.37	1.25	3.2	4.87		\N						\N		\N	\N	\N	\N	Head West\nNumerous ribbon around body\nSkull broken but not by us\nSticks along the body and in the wraps came out in baskets\nThis mummy was 10 cm under the north edge of the large stone	ebfc6c21-3778-418c-be78-46da33c155f8	\N	\N	1994-01-01	\N	\N	\N	\N	\N	1.68	15	\N	Undetermined		\N	f	f	f	S	W	A	U	A	\N	\N	t		t	1994A	26						\N	\N	\N	\N	\N	\N	\N	\N	\N
e44e00d4-e81b-4d56-8b40-c513142e5dd6	Undefined	1.07	2.13	1.83	2.48	3.41		\N						\N		\N	\N	\N	\N		c97dc22e-0b20-4a08-aebd-4c12919dd227	\N	\N	1994-01-01	\N	\N	\N	\N	\N	0.99	6	\N	Undetermined		\N	f	f	f	Basket Case	W	A	U	A	\N	\N	t		f	1994A	21						\N	\N	\N	\N	\N	\N	\N	\N	\N
7e344338-7052-4112-814d-7eabe2e6a63d	Undefined	0.93	2.44	1.86	4.03	5.77		\N						\N		\N	\N	\N	\N	Depth to head is 93cm and 83cm to feet\nBurial#11 is to the side of body\nRemoved face bundlefirst\nWrapped in linen with red ribbons on feet\nHead has mouth open with excellent teeth\nHead had to be removed\nFeet still well preserved\nBuried right on top of #9	f062adf1-ab17-4f6c-8540-e62208951c8c	\N	\N	1994-01-01	\N	\N	\N	\N	\N	1.82	7	\N	Undetermined		\N	f	f	f	Good	W	A	U	A	\N	\N	t		f	1994A	21						\N	\N	\N	\N	\N	\N	\N	\N	\N
b326982b-0c08-4aa9-b6d2-3e72772c14b4	West	0.54	0	4.8	0.22	0		\N				U		\N		\N	\N	\N	\N	Skeleton - little cloth and not much else\nA reed alongside it\nHair present\nChild wrapped in solid red ribbon over rope over a fabric of very coarse yarn woven (plain weave) with fine yarns\nThe fabric was folded up over the head and up over the feet - several layers of same type of cloth as outer fabric\nNext layer yellow, green design on left breast\nSmall face bundle, yellow, red trim on one edge\nFabric badly decayed	cd55ad51-d6ce-454b-ae73-cddaf6a2570b	\N	\N	1987-01-01	\N	\N	\N	\N	\N	1.56	1	\N	Undetermined		\N	f	f	f	W	B	U	U	U	\N	\N	f	U	t	1987A/1987B	18/100						\N	\N	\N	\N	\N	\N	\N	\N	\N
c19335df-bfff-483d-b339-4e52a2cacd78		0.5	2.36	2.36	0.44	0.44		\N						\N		\N	\N	\N	\N	Simply a fragmented skull with a mandible, Has skin with beard	430ff75c-b727-487e-b23c-c5ee85457ef3	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	Undetermined		\N	f	f	t		B	A	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
be63cc14-a647-438a-815f-711e917a6789	West	1.55	0	0	0	0		\N						\N		\N	\N	\N	\N	Buried in a shaft - lots of details about shaft in field book\nMajor figure	810789ef-1679-42d8-bc19-c2463c5b3b62	\N	\N	1987-01-01	\N	\N	\N	\N	\N	1.74	4	\N	Undetermined		\N	f	f	f		U	U	U	U	\N	\N	f		t	1987A	24						\N	\N	\N	\N	\N	\N	\N	\N	\N
0226870d-33c3-42dc-8d80-99a96550fac8		0.87	4.37	4.25	3.26	3.68		\N						\N		\N	\N	\N	\N	3rd 4th century pottery found at the base of the reeds	3ec9199b-d25d-4dfc-9d94-42403b008570	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	\N	Undetermined		\N	f	f	f		H	C	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
069db478-cd12-4204-8ebe-972a7edc649f	Undefined	0	0	0	0	0		\N				Brown		\N		\N	\N	\N	\N	Crippled tibia\nSmall wool face bundle\nCoarse linen outer wrap\nFace bundle wool tunic, hemmed at neck\nmore wrapping details described	a5d73138-9cbe-4b5e-8474-be54c8f261f7	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	5	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	f		t	1994D	21						\N	\N	\N	\N	\N	\N	\N	\N	\N
c5b00ac9-9a42-48c8-a34e-7f034e0426f2		1.07	0.95	0.6	2.35	3.97		\N						\N		\N	\N	\N	\N	Database originally claimed to be wholly wrapped	61be8de3-d78e-46a2-a5d0-5053c39be4cd	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	\N	Undetermined		\N	f	f	f		B	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
57376274-503c-4047-b2c1-f7124447ed51	West	1.51	3.84	3.6	2.35	2.8		\N						\N		\N	\N	\N	\N	Larger burial to the north only has the knees remaining with a loose mandible where the head should have been	238129d6-3d01-4c9f-b153-a6454bb64c24	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	Undetermined		\N	f	f	f		W	C	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
901634ec-cb5b-4196-8214-2dbf33a95212	Undefined	0	0	0	0	0		\N						\N		\N	\N	\N	\N	lots of details about the wrapping on page 24	5978c38f-2422-44b2-8d4a-466302a9e311	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	7	\N	Undetermined		\N	f	f	t		W	U	U	U	\N	\N	t		t	1994C	24						\N	\N	\N	\N	\N	\N	\N	\N	\N
e6f3f5db-718c-48cb-9af1-d934919d2831	Undefined	1	2.7	2.5	0.38	2.1	V	\N				Brown		\N		\N	\N	\N	\N	Small fragments of fabric - 2 layers\nCan't find measurements in the field book that are noted in the database (TW)	638c47bd-cd28-4bb7-9ff3-5c08eb1cabf1	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	2	\N	Female		\N	f	f	f	poorly preserved	B	A	P	U	\N	\N	t		f	1987B	27						\N	\N	\N	\N	\N	\N	\N	\N	\N
0afe9e32-9ade-4b38-8b1c-10412e286e57	Undefined	1	2.25	2.15	0.8	2	6-7 years	\N				brown		\N		\N	\N	\N	\N	Coarse fabric next to head - covered with very fine woven fabric\nCan't find measurements in the field book that are noted in the database (TW)	9b02c5e1-d051-4f71-8633-d69831e8ae5c	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	3	\N	Undetermined		\N	f	f	f	bones and skull	B	C	S	C	\N	\N	t		f	1987B	27						\N	\N	\N	\N	\N	\N	\N	\N	\N
bc91ca91-20d2-4a13-9963-00a1d287b1e3	Undefined	0	0	0	0	0	U	\N				U		\N		\N	\N	\N	\N	Basket case\nOnly small fragments of cloth\nFine weave next to body - 2 layer coarse weave on outside\nCan't find measurements in the field book that are noted in the database (TW)	4524be54-e602-44e7-a790-7b09b217e5e3	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	3	\N	Undetermined		\N	f	f	f	S	B	U	U	U	\N	\N	f	U	f	1987B	33						\N	\N	\N	\N	\N	\N	\N	\N	\N
ca2de442-7bbf-4eb9-a8b3-c5871984c43a	Undefined	0	0	0	0	0	Newborn	\N				U		\N		\N	\N	\N	\N	Dark red brown fabric\nInfant burial\nNo skull, only a few bones but much fabric\nHeavy canvas type - coarse yarns, tight plain weave, brown and white stripes in filling on weft direction\nFragments of hair attached to cloth\nUnusual design on one edge in purple	8b08f7e6-485e-49b2-9f69-8ae8a13e4cb5	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	4	\N	Undetermined		\N	f	f	f	B	B	C	P	N	\N	\N	f	U	f	1987B	6,12						\N	\N	\N	\N	\N	\N	\N	\N	\N
e4e41d9e-24a6-4222-b096-f9c568c65990	Undefined	0.9	1.7	0	3.4	0	Infant	\N				br-red		\N		\N	\N	\N	\N	Infant wrapped in very coarse fabric tied with rope\nThe inside fabric is yellow of medium weave, some holes not caused by decay, a green design woven into one section\nSaved design, rope and inner cloth samples\nCan't find details on hair in field book that are described in database (TW)	1542f579-6a78-41ba-809d-33c74f74eec3	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	5	\N	Undetermined		\N	f	f	f	W	W	C	P	I	\N	\N	t	U	f	1987B	58						\N	\N	\N	\N	\N	\N	\N	\N	\N
939e2411-13b8-40f6-8bfb-148de10b6874	Undefined	0.9	1	0.92	2.13	2.8	6 months	\N				rd-bln		\N		\N	\N	\N	\N	Infant skull broken body\nWrapped on coarse cloth tied with rope\nSome design on fabric under chin (perhaps the collar)\nCan't find details on age and hair in field book that are described in database (TW)\nCan't find measurements in the field book that are noted in the database (TW)	ed4f640e-05b3-4be0-a5e1-8c9bc1d2e027	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	7	\N	Undetermined		\N	f	f	f	B	B	C	P	N	\N	\N	t	U	f	1987B	79						\N	\N	\N	\N	\N	\N	\N	\N	\N
ea42805f-e9c6-4df6-b158-d2c05213271f	Undefined	1	1.11	0.85	3.52	4.12	6-12 months	\N				red		\N		\N	\N	\N	\N	Small piece of fabric like a black outlined cross with red, green design inside\nBody wrapped on medium weave fabric tied with rope\nAt least 2 layers of cloth and rope - some red and yellow stripes\nHead wrap shows some design (red/yellow/green stripes)\nCan't find details on age and hair in field book that are described in database (TW)\nCan't find measurements in the field book that are noted in the database (TW)	fceeb5b3-6cb2-406d-9bf9-be7df0114939	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	9	\N	Undetermined		\N	f	f	f	W	W	C	P	N	\N	\N	t	U	f	1987B	78						\N	\N	\N	\N	\N	\N	\N	\N	\N
e7c55809-fe9d-4335-aba1-91b53ee435e7	Undefined	0.7	2.8	2.9	3.5	4.98	V-VI	\N				rd-bln		\N		\N	\N	\N	\N	Fairly intact, body wrapped with red ribbon and rope,\nYellow/blue cloth, woven not sewn together - red/brown ribbon on head bundle\nMore wrapping details avaialbe in 1987B field book\nCan't find details on age in field book that are described in database (TW)\nCan't find measurements in the field book that are noted in the database (TW)	cadd747e-9034-4f60-bf72-57e94ed3a35f	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	11	\N	Female		\N	f	f	f	W	W	A	P	U	\N	\N	t	U	t	1987B	45						\N	\N	\N	\N	\N	\N	\N	\N	\N
43a3c376-df60-4c51-9022-9e2b0bfb3e07	Undefined	1	2.63	2.6	2.42	4.33	3-5 years	\N				brown		\N		\N	\N	\N	\N	Basket case\nFeet wrap is intact - wrapped with red/white ribbon\nSmall fragments of fringed cloth found with body\nSome solid red ribbon saved also - 7 to 8 layers of coarse cloth\nThe fringe is at the bottom of the fabric\nCan't find measurements or details on hair or age in the field book that are noted in the database (TW)	8b91ad20-5c7e-4bdc-97c8-8e948d61a0f3	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	14	\N	Undetermined		\N	f	f	f	S	S	C	S	C	\N	\N	t	U	f	1987B	44						\N	\N	\N	\N	\N	\N	\N	\N	\N
fcb6ecf1-bc0f-4440-b2d4-7a18d8158225	East	1.03	4.15	4.26	0.63	0.03		\N						\N		\N	\N	\N	\N	Reversal	85852613-3601-4958-bad6-21d35b2a6fb0	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	21	\N	Undetermined		\N	f	f	t		B	A	U	A	\N	\N	t		f	1994B	B-12						\N	\N	\N	\N	\N	\N	\N	\N	\N
d5fea2e5-14a0-42de-8a95-30cc0bdedbc9	Undefined	1.1	2.68	2.73	2.4	3.07	2.5 - 4 yrs	\N				brown		\N		\N	\N	\N	\N	Basket case - disarticulated\nSeveral small fabric samples, some red/white ribbon\nCan't find details on age, gender, and hair in field book that are described in database (TW)	a6c7c3c1-6ae5-4fc3-ab82-365b9bdf5a65	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	18	\N	Undetermined		\N	f	f	f	S	B	C	S	C	\N	\N	t	U	f	1987B	59						\N	\N	\N	\N	\N	\N	\N	\N	\N
83c00aea-f65d-4a3a-9ce5-a449c6d660b7	Undefined	1.4	0	2.57	2.57	0	9 months	\N				brown		\N		\N	\N	\N	\N	Infant - only fragments remain\nCan't find measurements in the field book that are noted in the database (TW)\nCan't find details on age, gender, and hair in field book that are described in database (TW)	0c1d4015-cfd2-431b-9894-518df9063c69	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	19	\N	Undetermined		\N	f	f	f	B	B	C	S	N	\N	\N	t	U	f	1987B	51						\N	\N	\N	\N	\N	\N	\N	\N	\N
d300b2d1-b5c0-4eb2-a90f-4476917ce5f9	Undefined	1.1	2.4	2.29	0.25	0.9	infant	\N				U		\N		\N	\N	\N	\N	Infant - too decomposted to deal with bones\nSmall fabric fragments collected\nCan't find measurements in the field book that are noted in the database (TW)	fbd09aed-3a98-427f-b2b2-a402b6456e57	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	21	\N	Undetermined		\N	f	f	f	B	B	C	P	I	\N	\N	f	U	f	1987B	53						\N	\N	\N	\N	\N	\N	\N	\N	\N
a93502e8-6358-42d2-9a31-a36dd5ef95e6	Undefined	1.3	5.4	4.5	3.1	4.4	III	\N				Brown		\N		\N	\N	\N	\N	Mostly a basket case\nSome wrapping and ribbon (red and white) at feet - outer layer has red stripes rounding lengthwise\nMore wrapping details about layers in the 1987B field book on pg. 55\nCan't find details on age, gender, and hair in field book that are described in database (TW)\nCan't find measurements in the field book that are noted in the database (TW)	feeccebf-58a4-4eba-b65f-c7ebf78fefe8	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	23	\N	Female		\N	f	f	t	S	H	A	P	U	\N	\N	t	U	f	1987B	55						\N	\N	\N	\N	\N	\N	\N	\N	\N
1ffc706c-cae8-4014-b898-ccc0252a601e	Undefined	1.1	3	0	0.9	0	IV	\N				Brown		\N		\N	\N	\N	\N	Green fabric, yellow thread on front, collar from robe of plundered tomb of mud bricks. Collar was sewn to yellow fabric\nFine weave fabric next to body was light and dark green thread, red, yellow and oragne thread\nSamples saved\nCan't find details on age, gender, and hair in field book that are described in database (TW)\nCan't find measurements in the field book that are noted in the database (TW)	c9788449-eaf6-4a14-b18d-8d2372f46fdb	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	26	\N	Female		\N	f	f	t	S	B	A	P	U	\N	\N	t	U	f	1987B	57						\N	\N	\N	\N	\N	\N	\N	\N	\N
57a23a73-fe11-4271-b0ad-8f34be0dbc27	Undefined	1.5	1.66	1.3	2.95	3.7	20 months	\N				brown		\N		\N	\N	\N	\N	Child, outer layer of medium weave fabric, tied with torn strips of cloth\n5 layers of fabric over head, one piece of fine fabric near face has cord construction - saved\nFringed fabric had been placed over feet - saved\nCan't find details on age, and hair in field book that are described in database (TW)\nCan't find measurements in the field book that are noted in the database (TW)	977fd585-5f19-4433-9fce-d3622a62a276	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	27	\N	Undetermined		\N	f	f	f	W	W	C	S	I	\N	\N	t	U	f	1987B	62						\N	\N	\N	\N	\N	\N	\N	\N	\N
2cc3eb63-3eee-41bc-a00d-d533a30e7740	East	2.2	2.5	2.7	4.54	3.4	6 years	\N						\N		\N	\N	\N	\N	Prechristian burial head to east, facing west\nObtained fragments of cloth from chest arm and neck - saved	ce5a402b-8542-4111-bf96-529d3979c6e1	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	28	\N	Undetermined		\N	f	f	f	S	B	C	P	C	\N	\N	f	U	f	1987B	70						\N	\N	\N	\N	\N	\N	\N	\N	\N
3e5e2386-549d-4dee-8647-cf5c8e7b2def	Undefined	1.7	2.27	2.31	1	1.66	6 months	\N				Brown		\N		\N	\N	\N	\N	Infant - outer wrap fine cloth tied under chin\nNext layer coarse yarn, tight weave tied with torn fabric\nSample\nCan't find details on age, gender, and hair in field book that are described in database (TW)\nCan't find measurements in the field book that are noted in the database (TW)	c28bb0f2-d7c1-4ce5-95d1-40145e73e2dd	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	31	\N	Undetermined		\N	f	f	f	B	B	C	S	N	\N	\N	t	U	f	1987B	83						\N	\N	\N	\N	\N	\N	\N	\N	\N
55c2325c-21b2-4d66-aa20-518d0e64c65d	West	2	3.7	3.5	4.9	5.7	3 years	\N				brown		\N		\N	\N	\N	\N	Same condition as #33\nCan't find details on age, hair in field book that are described in database (TW)\nSmall child south of burial #33 - nearly parallel to it\nHead west - preservation poor\nOnly a trace of textiles\nBasketcase	afb34c4f-4cef-49d8-9229-95b78bd283eb	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.85	34	\N	Undetermined		\N	f	f	f	S	B	C	S	C	\N	\N	t	U	f	1987A/1987B	40/95						\N	\N	\N	\N	\N	\N	\N	\N	\N
1c30a6c0-6866-4e2c-a5f0-916f11834e91	Undefined	0	0	0	0	0	20 years	\N				U		\N		\N	\N	\N	\N	No measurements with badly disturbed burials\nCan't find details on age, gender, hair in field book that are described in database (TW)\nBurials #38 and #39 were combined as they came out mixed together - bad basket case\nTextile samples (cloth and ribbon)	363c82c1-ce73-4ffb-a2c9-959e63050cb4	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	39	\N	Female		\N	f	f	t	S	B	A	P	A	\N	\N	f	U	f	1987A/1987B	53/102						\N	\N	\N	\N	\N	\N	\N	\N	\N
cb180629-e9a9-4169-8209-ad9b4754cfb6	West	0.9	5	5	1.6	2.25	18 months	\N				br-red		\N		\N	\N	\N	\N	Child burial right along north line of area.\nWrapped, but outer wrapping of rope, not ribbon\nFeet missing - bones only to ankles\nBurial basically disintegrated upon removal\nCan't find details on hair color, age in field book that are described in database (TW)	b9c846d1-739f-4695-b236-48e1aad6ac5e	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.7	41	\N	Undetermined		\N	f	f	f	bones and skull	B	C	S	I	\N	\N	t		f	1987A	57						\N	\N	\N	\N	\N	\N	\N	\N	\N
8f7db4eb-12db-42e2-9853-ffbc4cc79746	Undefined	0	3.3	3.3	1.7	0.9		\N						\N		\N	\N	\N	\N	disarticulated adult,  interesting textiles-woven mat	a1926fce-e3a0-40ba-a523-ae04a81862b5	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	2	\N	Undetermined		\N	f	f	f	disarticulated	H	A	U	A	\N	\N	t		f	1994B	B-3						\N	\N	\N	\N	\N	\N	\N	\N	\N
c1d6f5c8-0d58-4146-94bf-ebfbde8a575d	Undefined	0	4.68	4.68	1.3	1.3		\N						\N		\N	\N	\N	\N	disarticulated bone	f962ad58-32da-4a36-bc20-22e71ff7d36f	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	3	\N	Undetermined		\N	f	f	f	disarticulated	H	U	U	U	\N	\N	t		f	1994B	B-4						\N	\N	\N	\N	\N	\N	\N	\N	\N
342d799a-4222-4073-b417-a6ed62ad9c7b	Undefined	1.1	0.75	0.6	3.3	4.09		\N						\N		\N	\N	\N	\N	In shaft 3	8b3c090e-baba-492c-8058-46edbbe4c797	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	4	\N	Undetermined		\N	f	f	f		W	U	U	U	\N	\N	t		f	1994B	B-4						\N	\N	\N	\N	\N	\N	\N	\N	\N
f3bd39ab-5c9e-4ba0-a694-54d417dbcadc	Undefined	1.24	0.3	0.2	2.1	2.7		\N						\N		\N	\N	\N	\N		87f947f9-40d1-4517-9857-c5f934418b03	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	5	\N	Undetermined		\N	f	f	f		W	U	U	U	\N	\N	t		f	1994B	B-4						\N	\N	\N	\N	\N	\N	\N	\N	\N
00be67e2-64d4-4fa1-8e68-fbdef6af90c5	Undefined	0.57	0.8	0.8	4.2	4.2		\N						\N		\N	\N	\N	\N	disarticulated body	caac4e87-eb70-4a6c-8f71-f3c50b73e8fc	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	6	\N	Undetermined		\N	f	f	t	disarticulated	H	A	U	A	\N	\N	t		f	1994B	B-4						\N	\N	\N	\N	\N	\N	\N	\N	\N
bc2fbc1a-bc55-438c-a630-ba07896b2454	Undefined	1.3	3.06	3.2	0.41	1.6		\N						\N		\N	\N	\N	\N	no head,  disturbed	390e7ede-1cf2-48c3-9068-0b6306a13db2	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	7	\N	Undetermined		\N	f	f	t	disturbed	H	A	U	A	\N	\N	t		f	1994B	B-6						\N	\N	\N	\N	\N	\N	\N	\N	\N
37112b7c-48c5-4235-bee5-544e9f810690	Undefined	0.53	4.3	4.3	0.85	0.85		\N						\N		\N	\N	\N	\N	disarticulated	c7aad251-0dfd-4d10-acda-ac0e1435317e	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	10	\N	Undetermined		\N	f	f	t	disarticulated	H	A	U	A	\N	\N	t		f	1994B	B-6						\N	\N	\N	\N	\N	\N	\N	\N	\N
001e2a25-99ea-4810-ad1d-942896c65d11	Undefined	0.72	4.83	4.83	0.98	0.98		\N						\N		\N	\N	\N	\N	disarticulated bundle	32242fab-9c64-4762-ad22-e35026c61530	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	11	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B	B-6						\N	\N	\N	\N	\N	\N	\N	\N	\N
92248460-e7bf-48aa-a002-093ed2fb3e20	West	1.28	1.8	1.8	1.3	1.3		\N						\N		\N	\N	\N	\N	all broken up	115f5d41-162f-4c22-a927-8b1b0466bb4b	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	12	\N	Undetermined		\N	f	f	t		W	U	U	U	\N	\N	t		f	1994B	B-11						\N	\N	\N	\N	\N	\N	\N	\N	\N
8a031203-72b5-4123-86b4-051181b62b6a	Undefined	1.43	0.72	0.92	2.4	1.81		\N						\N		\N	\N	\N	\N		84614c4d-25e7-4762-a1f3-de934466d95b	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	17	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1994B	B-11						\N	\N	\N	\N	\N	\N	\N	\N	\N
2d6055be-b2fd-4d48-ae83-695c82f347ad	Undefined	0	0	0	0	0		\N						\N		\N	\N	\N	\N	Wrapped with brown wribbon\nOuter wrap of coarse linen\nBody wrapped with small tunic badly damaged\n2 pieces of purple wool and yellow to create a design and green stripns on one edge	34d90c96-0a40-4eb8-924c-80659662b7a7	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	17	\N	Undetermined		\N	f	f	t		W	C	U	I	\N	\N	f		t	1994D	26						\N	\N	\N	\N	\N	\N	\N	\N	\N
3a04b16b-50b5-48ff-be8a-1be3c0d51522	West	1.1	2.98	3.24	2.7	4.28		\N						\N		\N	\N	\N	\N	No skull, Head to West,  Linen on body with reeds under body\nBlack material in bones\nCoarse linen and linen ribbon	95222400-a389-4062-9aa5-e25b1eea7b1d	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	18	\N	Undetermined		\N	f	f	t		H	A	U	A	\N	\N	t		f	1994B/1994D	1994B: B-12; 1994C: 22						\N	\N	\N	\N	\N	\N	\N	\N	\N
24837d58-fb8b-4732-87f3-550bd4364d6b	East	1.92	0.72	0.16	2.91	1.92		\N				Brown		\N		\N	\N	\N	\N	Face is crushed at nose	25888fad-44a4-47c5-9987-06987c569cfb	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	19	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B	B-12,14						\N	\N	\N	\N	\N	\N	\N	\N	\N
dcd09a01-4b5d-4695-ba4e-2f174b6b6500	West	2.09	1.44	1.44	0.77	0.77		\N						\N		\N	\N	\N	\N	Shaft tomb, Two arm bundled together\nSkull top down	19f5b1cb-cd89-4df0-9aaa-bbdab82cc7c7	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	25	\N	Undetermined		\N	f	f	t		B	A	U	A	\N	\N	t		f	1994B	B-15						\N	\N	\N	\N	\N	\N	\N	\N	\N
247c4890-5182-4028-9ff9-92a0e261208a	Undefined	0.16	3.88	3.8	0.59	1.02		\N						\N		\N	\N	\N	\N	infant, encircled by brick	fb3f1f4f-87a7-4c88-a264-79ddcc745dfd	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	1	\N	Undetermined		\N	f	f	t	undisturbed	W	C	U	I	\N	\N	t		f	1994B	B-2						\N	\N	\N	\N	\N	\N	\N	\N	\N
68a46994-274e-4154-8d12-8614573969d9	East	0	0	0	0	0		\N				Brown		\N		\N	\N	\N	\N	No textiles, disarticulated\nCrushed skull\nFrom rock covered tomb\nHair samples	a629f59a-7078-4c29-a217-413adee0d906	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	28	\N	Undetermined		\N	f	f	t	disarticulated	B	C	U	I	\N	\N	t		f	1994C	20						\N	\N	\N	\N	\N	\N	\N	\N	\N
f974224d-5454-4181-b182-8a4e78682102		0.4	3.76	3.76	0.4	0.4		\N						\N		\N	\N	\N	\N	Skull only, Samples taken: Upper left Molars (3) Lower left Molar (1)	58ae6bd7-451d-45e0-8535-e5c817972049	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	Undetermined		\N	f	f	t		B	U	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
0d042cc9-58c3-4629-a853-fd445d242707		0.95	3.01	3.27	3.51	2.02		\N						\N		\N	\N	\N	\N	Looks like a fairly recent burial	054a736a-faea-4651-940f-4cab1490749c	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	\N	Undetermined		\N	f	f	t	fair	H	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
34f10857-00a2-4f2e-a560-6e6b1439716f	East	0	0	0	0	0		\N						\N		\N	\N	\N	\N	Entire body encased in solid sand encarement, probably solidified by nature salt and gypsum? from the sand\nFabric samples taken\nMore description of the wrapping in field book	fa09edab-3916-43aa-a9d0-781a3d1f04c6	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	5	\N	Undetermined		\N	f	f	t		H	A	U	A	\N	\N	t		f	1994C	13						\N	\N	\N	\N	\N	\N	\N	\N	\N
ef336535-f973-475e-990b-fbbaa40eb468	Undefined	1.3	1.52	2.04	1	0.52		\N						\N		\N	\N	\N	\N	Buried in a shallow shaft tomb	7aeef63b-4747-4530-99d8-07e109c0124a	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	8	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	f		f	1994B	43,50						\N	\N	\N	\N	\N	\N	\N	\N	\N
3bebb616-01be-4d25-b3fb-162b1aec6be8	Undefined	1.4	1.6	1.85	1.13	0.65		\N				Brown		\N		\N	\N	\N	\N		60334a36-47ff-4417-a18e-682c238a45b0	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	8	\N	Undetermined		\N	f	f	t		U	U	U	U	\N	\N	t		f	1994B	34						\N	\N	\N	\N	\N	\N	\N	\N	\N
a01a34c1-be75-497b-83fe-4acb5e63a657	Undefined	0	0	0	0	0		\N						\N		\N	\N	\N	\N	Only a food bundle\ncoarse linen wraps twisted together under the foot\ncoarse linen strips on body	e3f4553e-4a6c-49f1-b7b2-31ffd49b0500	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	8	\N	Undetermined		\N	f	f	t	basket case	H	U	U	U	\N	\N	f		f	1994C	18						\N	\N	\N	\N	\N	\N	\N	\N	\N
c9251f55-3b0a-45cd-b337-fd0ae901ad07	Undefined	1.23	1.4	1.87	1.21	0.43		\N				Brown		\N		\N	\N	\N	\N	Linen red/white ribbon over the head	221e9a09-0edf-45e6-945d-0cbf4ad07255	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	9	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B	43,50						\N	\N	\N	\N	\N	\N	\N	\N	\N
06d5d746-fb1a-487f-b486-450c284d77f0	West	1.12	3.77	3.58	3.14	4.57		\N						\N		\N	\N	\N	\N	Floral material bound together found near burial, Foot bundle had intact fabric	e2023b30-9456-44d2-8df1-033532ce8449	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	10	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B	38						\N	\N	\N	\N	\N	\N	\N	\N	\N
a90a7e78-c1cf-4971-a286-ff1aadae545d	West	1.1	3.5	3.5	4.05	4.05		\N						\N		\N	\N	\N	\N	Head of 12 on Knees of burial#10	a44874aa-4eaf-49da-8f16-8e010315ca94	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	12	\N	Undetermined		\N	f	f	f		B	U	U	A	\N	\N	t		f	1994B	38						\N	\N	\N	\N	\N	\N	\N	\N	\N
e3911ff9-304c-4483-8bc9-b857ac02e8c3	West	1.88	1.14	1.14	1.31	1.31		\N						\N		\N	\N	\N	\N	Buried directly above burial#11 but is not a reversal burial like Burial#11	46cb32fd-0998-4270-aaf0-e8914ee13f4c	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	13	\N	Undetermined		\N	f	f	t		B	A	U	A	\N	\N	t		f	1994B	43						\N	\N	\N	\N	\N	\N	\N	\N	\N
c074e858-802b-47f5-8e1b-690b888cfc2a	West	2.06	1.44	1.37	1.6	2.75		\N						\N		\N	\N	\N	\N	Head West	22d2bb77-06af-4639-a2ca-e7ef25415b7c	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	Undetermined		\N	f	f	t	Extremely well	W	C	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
c2f54861-1465-475a-ab5f-ca964d317e30	Undefined	1.45	3.23	2.95	0.68	1.67		\N						\N		\N	\N	\N	\N	With large flat stone on left side	e7948daf-4a33-47bc-ae83-4d58e9a9b522	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	17	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B	43,51						\N	\N	\N	\N	\N	\N	\N	\N	\N
d20e9adb-2e05-4172-85dc-a11aacd0a402	Undefined	0	0	0	0	0		\N						\N		\N	\N	\N	\N	basket case\nsmall piece of green wool\nsample-linen, wool, rope\nno skull	c6a8f85b-224d-4a13-9380-9bf05c5034d9	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	17	\N	Undetermined		\N	f	f	t	basket case	W	A	U	A	\N	\N	t		f	1994C	17						\N	\N	\N	\N	\N	\N	\N	\N	\N
ce50e312-b8e2-4685-b5a0-d834211536d4	Undefined	1.45	4.01	3.59	2.48	4.09		\N						\N		\N	\N	\N	\N	Depth to head 145cm depth to feet 160cm	2adf6db6-568e-49cf-9730-856766447c80	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	18	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1994B	43						\N	\N	\N	\N	\N	\N	\N	\N	\N
683a8896-f96d-4d50-85a4-cc653c6e1baf	East	2.12	2.88	3.17	2.31	1.29		\N						\N		\N	\N	\N	\N	First numbered as #20 and changed to #21	cb9b17c9-70f3-4793-9307-461ffc730f86	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	21	\N	Undetermined		\N	f	f	f	basket	W	A	U	A	\N	\N	t		f	1994B	54						\N	\N	\N	\N	\N	\N	\N	\N	\N
134701be-dbcb-4536-a745-7bfa4980e073	West	0.81	4.8	4.82	2.4	3.46		\N						\N		\N	\N	\N	\N	No head but buried with head to West	35ab233d-9e1a-44c9-96b2-bb7109708be7	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	23	\N	Undetermined		\N	f	f	f		B	C	U	C	\N	\N	t		f	1994B	57						\N	\N	\N	\N	\N	\N	\N	\N	\N
c0879461-9e46-40f0-b0df-928c9e6da121	West	1.93	4.59	4.65	1.65	2.2		\N						\N		\N	\N	\N	\N	Buried together with #26 Head is to west Yellow and blue linen	f3acba34-a977-4981-9f1e-dc4f377764e5	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	Undetermined		\N	f	f	t		W	C	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
687a6d7f-a68f-44b3-8861-7ccc428fd0a8	West	0.5	2.9	2.85	2.6	3.1	6 months	\N						\N		\N	\N	\N	\N	Wrapped child\nNormal ribbon and burlap exterior wrap\nFeet adjacent (north side) to skull of burial #2\nCan't find age, gender, hair details\nMore details on wrapping in 1987 B field book	5c839e01-a8ca-4564-a738-a7be083a7237	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.65	1	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	S	N	\N	\N	f		f	1987A/1987B	47/10						\N	\N	\N	\N	\N	\N	\N	\N	\N
785bc0ae-1213-4d0a-af46-0e0b66736f8b	West	0.5	2.8	2.65	3.1	3.8	2 years	\N						\N		\N	\N	\N	\N	Wrapped - not well preserved\ncovered by rocks\nSkull uncovered (ie skull wrapping mosly gone)\nUnder skull there are wrappings\nBoth burials #1,2 combined materials associated with both burials\nCan't find age, and hair details in field book that are described in database (TW)	ee7a84f8-fdc9-423c-a42f-3007bb8f7e20	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.78	2	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	P	In	\N	\N	t		f	1987A	47						\N	\N	\N	\N	\N	\N	\N	\N	\N
5606dee1-2b45-40d0-af1f-6724f55beba2	West	1.3	0.8	0.5	1	2.7		\N						\N		\N	\N	\N	\N	Brightly wrapped - inside mud brick structure overlaid with palm logs\nMud brick structure surrounding burial	762320b8-0f85-40f0-be13-86aa43847b94	\N	\N	1987-01-01	\N	\N	\N	\N	\N	1.7	6	\N	Undetermined		\N	f	f	t	wrapped	W	C	P	U	\N	\N	f		f	1987A	58						\N	\N	\N	\N	\N	\N	\N	\N	\N
f6584c20-2f82-4633-9469-89c38310f94c	West	0.8	4.34	4.09	2	2.8	6 months	\N				brown		\N		\N	\N	\N	\N	Infant or small child, head disintegrated - jaw bone present and some hair - wrapped\nHead to west as usual\nAnother burial evident beneath - at least a pelvic bone is showing\nCan't find details on age, and hair in field book that are described in database (TW)	c9d77b7d-ddf4-4f8c-bb53-e808f5f6e133	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.85	8	\N	Undetermined		\N	f	f	f	wrapped	W	C	P	N	\N	\N	t		f	1987A	62						\N	\N	\N	\N	\N	\N	\N	\N	\N
6445ab89-dc1b-42f5-85c3-ab80c545381b	West	1.1	0.3	0.2	1.1	1.7	3 years	\N				Brown		\N		\N	\N	\N	\N	Upper torso, partially curshed skull\nAlongside south wall of much brick structure of burial	50b8838d-1ac6-4db9-a93e-61900ff17166	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.6	11	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	S	C	\N	\N	t		f	1987A	64						\N	\N	\N	\N	\N	\N	\N	\N	\N
d9e91d85-af29-49e9-bc9c-d23ecfacc3d4	West	1	1.5	1.1	2.9	3.6	4 years	\N				Brown		\N		\N	\N	\N	\N	All 4 burials buried together - all appear to be children - wrapped and ribboned\nCan't find details on age and hair in field book that are described in database (TW)	97233dc6-5c6f-4f64-b920-149ef61154ab	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.85	12	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	S	C	\N	\N	t		f	1987A	66						\N	\N	\N	\N	\N	\N	\N	\N	\N
0723d550-e001-488f-b5ca-3712edd36b1a	West	1	3.9	3.7	1.8	2.35	infant	\N						\N		\N	\N	\N	\N	Badly deteriorated - skull crushed, most material decomposed\nMany bones broken\nCan't find details on age in field book that are described in database (TW)	ec2566e5-3bcf-4afe-9ad5-2eed14bfe1fb	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.55	16	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	P	I	\N	\N	f		f	1987A	71						\N	\N	\N	\N	\N	\N	\N	\N	\N
76c5e3ad-f17b-4d89-a2f0-5f3085fcaa81	West	1.2	1.6	1	2.75	3.45	Infant	\N						\N		\N	\N	\N	\N	Child under #12 and adjacent to #15\nAll these burials have a slight SE orientation and are tightly clustered together\nWrapped and ribboned\nThere is another child burial at the feet of #17, with the head of the new one even up under the feet of #17	acb24f5c-3019-4d68-bdf8-de2d31d0a7d4	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.95	17	\N	Undetermined		\N	f	f	f	headless skeleton	B	C	P	I	\N	\N	f		f	1987A	72						\N	\N	\N	\N	\N	\N	\N	\N	\N
65cf6f3a-69ac-4cd0-b4d7-f2180a3ca5ea	West	1.2	1	0.45	3.3	3.9	2 years	\N				br-red		\N		\N	\N	\N	\N	Child buried at the feet of #17 (head under feet of 17)\nWrapped and ribboned\nCan't find details on age or hair in field book that are described in database (TW)	f027a57d-9dd0-464c-89da-cf74dfef682f	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.8	18	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	S	I	\N	\N	t		f	1987A	72						\N	\N	\N	\N	\N	\N	\N	\N	\N
2359454d-bb1c-4839-bcdd-794ae6b2e092	West	1.3	0.5	0.2	3.1	3.7		\N						\N		\N	\N	\N	\N	Buried adjacent to and slightly upon the right side of #15, placed from the waist down along the right leg\nWrapped and ribboned	885ee7b3-d607-4edb-ab17-d0cb4399dc1b	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.8	19	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	f		f	1987A	74						\N	\N	\N	\N	\N	\N	\N	\N	\N
90cc30d0-5f14-4a2c-82c4-2997f09d7690	West	1.26	1.59	1.58	3.1	3.91	18 months	\N				Brown		\N		\N	\N	\N	\N	Wrapped well, but fairly hallow i.e. bones disinigrated\ntaken out whole\nCan't find details on age or hair in field book that are described in database (TW)\nBurials 21,22,23 parallell, touching by side (21 lies on top of 22 and 23 at shoulder, sides, feet)	f81fa4c6-3cb6-49b1-9d4a-523094df6b30	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.75	21	\N	Undetermined		\N	f	f	f	poorly preserved	W	C	S	I	\N	\N	t		f	1987A	76						\N	\N	\N	\N	\N	\N	\N	\N	\N
2d2f5faf-c498-41a3-9f37-b09a30d070e7	West	1.28	1.73	1.64	3.13	4.01	3-4 years	\N						\N		\N	\N	\N	\N	Body wrapped well, but face uncovered\nBoth #21&22 were wrapped and then tied with torn strips of fabric (not ribbon)	3c477fbc-19d7-4e16-8b72-c13887b08dc1	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.77	22	\N	Undetermined		\N	f	f	f	poorly preserved	W	C	S	C	\N	\N	t		f	1987A	76						\N	\N	\N	\N	\N	\N	\N	\N	\N
1b64191a-30d6-413c-9179-2db285e5dd86	West	1.28	1.45	1.47	3.13	4.05	3 years	\N				ltbrwn		\N		\N	\N	\N	\N	Feet under the feet and legs of #21\nSkull was caved in\nWrapped and then tied with torn fabric strips (not ribbon) - similar to #21&22\nBasket case	70b7cc87-03c9-486f-b824-f9f0fe7068e4	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.86	23	\N	Undetermined		\N	f	f	f	basketcase	W	C	S	C	\N	\N	t		f	1987A	78						\N	\N	\N	\N	\N	\N	\N	\N	\N
2189b619-8fc5-4e18-9e9f-23d9b03d0861	West	1.3	3.96	3.83	1.96	2.72	18 months	\N				br-red		\N		\N	\N	\N	\N	Single burial\nWrapped - looks very decayed\nYoung child\nChest area badly decomposed\nLeg bundle intact\nCan't find details on hair and age in the field book that are described in the database (TW)	899ce2c7-b566-41aa-9a9a-bbccffd7ce7a	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.76	24	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	S	I	\N	\N	t		f	1987A	78						\N	\N	\N	\N	\N	\N	\N	\N	\N
10c04fd1-c991-4c13-a3df-1ba78fba48a8	West	1.4	2.9	2.8	2.9	4.55		\N						\N		\N	\N	\N	\N	Well-wrapped adult\nHands folded across lower abdomen	b85fea1c-9c6d-4089-bfc2-f70d0ce3f1ed	\N	\N	1987-01-01	\N	\N	\N	\N	\N	1.65	25	\N	Undetermined		\N	f	f	f	well-wrapped	W	A	U	U	\N	\N	f		t	1987A	84						\N	\N	\N	\N	\N	\N	\N	\N	\N
a4105f2c-c300-419c-8f13-6b255baff966	West	0.9	4.3	4.3	0.4	1.1	18 months	\N				Red		\N		\N	\N	\N	\N	Wrapped and ribboned\nCan't find details on hair, or age in the field book that are described in the database (TW)	4b227189-308d-4624-9154-be99313ee575	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.7	27	\N	Undetermined		\N	f	f	f	wrapped	W	C	S	I	\N	\N	t		f	1987A	86						\N	\N	\N	\N	\N	\N	\N	\N	\N
97ffd178-1a5c-49e2-9b14-1e05dfd19fa2	West	0.7	5.09	4.8	1.7	2.35	8-16 months	\N				ltbrwn		\N		\N	\N	\N	\N	Small child, buried and wrapped with sandals and socks\nRope or wrapping and foot wear attached to the body wrappings\nCan't find details on hair, gender, or age in the field book that are described in the database (TW)	13abc08f-85d5-4cd8-8449-9a55c01175b6	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.7	29	\N	Female		\N	f	f	f	well-wrapped	W	C	P	N	\N	\N	t	Y	f	1987A	88						\N	\N	\N	\N	\N	\N	\N	\N	\N
a394797b-e6a5-4a33-b4d5-d70f48ada23d	West	1.5	2.5	2.4	0.8	1.4	U	\N						\N		\N	\N	\N	\N	Small child, not at all well preserved	0e4d7291-4fba-4409-9112-b6d473414366	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.6	32	\N	Undetermined		\N	f	f	f	badly preserved	U	C	U	C	\N	\N	f		f	1987A	102						\N	\N	\N	\N	\N	\N	\N	\N	\N
3a4a0f8e-0e66-4339-a425-3bec2f5c7061	West	1.75	0.1	0.1	2.7	4.09	V-VI	\N				Blond		\N		\N	\N	\N	\N	Teen or small adult - not well preserved\nNo showing textiles\nSome hair\nHands crossed over lower abdomen but right arm over hip - left arm under hip\nLegs crossed, right leg over top of left leg	17e67d6d-336b-48ce-b725-6966133cb00e	\N	\N	1987-01-01	\N	\N	\N	\N	\N	1.65	33	\N	Male		\N	f	f	t	poorly preserved	B	A	P	U	\N	\N	t		f	1987A	102						\N	\N	\N	\N	\N	\N	\N	\N	\N
fc8378a6-b0a4-4c86-b43b-929dda9f3037	West	1.55	3.2	3.5	3.45	4.55	6-7 years	\N				Brown		\N		\N	\N	\N	\N	Badly crooked skull, some textile fragments\nChild\nCan't find details age in the field book that are described in the database (TW)	aee7d568-f6af-4dd8-b368-e9607f611e4c	\N	\N	1987-01-01	\N	\N	\N	\N	\N	1.1	37	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	P	C	\N	\N	t		f	1987A	106						\N	\N	\N	\N	\N	\N	\N	\N	\N
c00688a7-cf32-4610-a7f6-8f98b4d81eb1	West	1	3	0	2	4.9	5 years	\N						\N		\N	\N	\N	\N	Could not photograph or measure - because they both fell in a cave - in east swall of area, over burial #37\nPhoto taken - skull disarticulated - not numbered in photograph\nCan't find the measurements in the field book that are described in the database (TW)\nChild - disarticulated - fell in rubble over #37	2214f515-ab23-4e5f-bfc7-bd6a99e3d557	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	38	\N	Undetermined		\N	f	f	f	bones and skull	B	C	S	C	\N	\N	f		f	1987A	108						\N	\N	\N	\N	\N	\N	\N	\N	\N
efc4c073-264a-4ebf-a1c0-7f3013e55015	West	1	3	0	2	4.9	5 years	\N						\N		\N	\N	\N	\N	Could not photograph or measure - because they both fell in a cave - in east swall of area, over burial #37\nPhoto taken - skull disarticulated - not numbered in photograph\nCan't find the measurements in the field book that are described in the database (TW)\nChild - disarticulated - fell in rubble over #37	9b987749-b795-4af5-9546-a1c7a1e482da	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	39	\N	Undetermined		\N	f	f	f	bones and skull	B	C	S	C	\N	\N	f		f	1987A	108						\N	\N	\N	\N	\N	\N	\N	\N	\N
14814c72-8fb3-4c91-8d7d-6b148e8393d1	Undefined	1.7	1	0	2.4	0	5 years	\N				Brown		\N		\N	\N	\N	\N	Skull only - child - no body\nCan't find details on hair, gender, or age in the field book that are described in the database (TW)	ab89f9db-d269-48fd-ac72-00e59bbe8144	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	40	\N	Undetermined		\N	f	f	f	Skull only	B	C	S	C	\N	\N	t		f	1987A	110						\N	\N	\N	\N	\N	\N	\N	\N	\N
09b4333d-9572-4be1-a067-3a36cf6017ba	West	0.65	4.9	4.84	3.15	3.6	0-6 months	\N				ltbrwn		\N		\N	\N	\N	\N	Child - falling from northern edge of area\nDisarticulated fabric\nSkull in poor shape	6abfa5a3-d318-4f48-9af0-f0ac912785cc	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.6	41	\N	Undetermined		\N	f	f	f	bones and skull	B	C	S	N	\N	\N	t		f	1987A	112						\N	\N	\N	\N	\N	\N	\N	\N	\N
4cb194ea-7007-43b2-89e5-fb7a1fd0671d	East	2	2.5	3	3.6	3	Newborn	\N				Brown		\N		\N	\N	\N	\N	Child - not well preserved	ff643847-0c43-400d-bbb7-8b343de584e5	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.6	42	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	S	N	\N	\N	t		f	1987A	112						\N	\N	\N	\N	\N	\N	\N	\N	\N
bfb2f23f-f8bb-4421-aaa6-740e56ec4145	West	1.7	3	3	0.8	2.4		\N						\N		\N	\N	\N	\N	Adult skeleton - skull missing\nVery poorly preserved\nCan't find details age and gender in the field book that are described in the database (TW)	49db3854-8dfe-433a-b280-e5d3bf288b5e	\N	\N	1987-01-01	\N	\N	\N	\N	\N	1.6	43	\N	Male		\N	f	f	f	headless skeleton	B	A	P	U	\N	\N	f		f	1987A	114						\N	\N	\N	\N	\N	\N	\N	\N	\N
99009151-02d3-4f23-9681-09bd01ed0eb0	West	1.75	3.7	3.4	4.05	4.9	18 months	\N				ltbrwn		\N		\N	\N	\N	\N	Child - covered by mud bricks as shown on pg. 115 (field book 1987A)\nCan't find details on hair, gender, and age in the field book that are described in the database (TW)	0811f503-761f-44f1-8003-8befff321457	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.85	46	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	S	I	\N	\N	t		f	1987A	116						\N	\N	\N	\N	\N	\N	\N	\N	\N
6d3dab37-893c-40f2-a151-dc5cedb2ecf1	West	0.9	2.8	2.8	3.2	3.8	Infant	\N						\N		\N	\N	\N	\N	Infant well wrapped and also covered with a red yarn	ea18310a-4000-4d8e-85aa-a7007f040741	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.6	1	\N	Undetermined		\N	f	f	f	well-wrapped	W	C	P	IN	\N	\N	f		f	1987A	50						\N	\N	\N	\N	\N	\N	\N	\N	\N
095a5d6e-f964-4d44-8c32-b02b83c447dc	West	1	1.9	1.9	2.8	3.5		\N						\N		\N	\N	\N	\N	Child poorly preserved\nWrapping and ribbon - body disarticulated\nHead missing - only legs and feet in place\nIn fact, it now appears this may be an adult form the kneed downa dn the rest removed in perhaps a later but deeper burial slightly to the west\nNo indication at present what happened to the rest of the body	023cb85d-7d5a-4f5c-925b-20f6d6792d14	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.7	2	\N	Undetermined		\N	f	f	f	bones	B	A		U	\N	\N	f		f	1987A	50						\N	\N	\N	\N	\N	\N	\N	\N	\N
5afacd6c-c213-4969-ac1f-90ecb1447bf4	West	1	4.09	4.4	0	1.7	IV-V	\N				dkbrwn		\N		\N	\N	\N	\N	Well-wrapped - both rope and ribbon\nLonger than we first thought\nCan't find details on hair and age in the field book that are described in the database (TW)	29cd3e8d-03c7-4f75-89e7-a40f973ff048	\N	\N	1987-01-01	\N	\N	\N	\N	\N	1.7	5	\N	Female		\N	f	f	t	well-wrapped	W	A	P	U	\N	\N	t		t	1987A	84						\N	\N	\N	\N	\N	\N	\N	\N	\N
8be01a44-f386-47bf-969b-2ad68bf9389d	West	0	3.3	0	1.14	0		\N						\N		\N	\N	\N	\N	Disturbed burial - only the head was placed\nSkull and a few indiscriminate and disarticulated bones	480d1119-e4ed-488e-8a3d-801e686253e6	\N	\N	1987-01-01	\N	\N	\N	\N	\N	\N	6	\N	Undetermined		\N	f	f	f	disturbed	B	A	U	U	\N	\N	f		f	1987A	91						\N	\N	\N	\N	\N	\N	\N	\N	\N
9f4b8e0d-f7ca-453f-af42-73a1a7c7b0b8	West	1.5	4.9	4.4	2.5	3.86	I-II	\N				Black		\N		\N	\N	\N	\N	Young adult, perhaps\nWrapped and ribboned, but not well preserved\nCan't find details on hair, gender, and age in the field book that are described in the database (TW)	1711fbf8-d88e-46cb-b445-902403163e8f	\N	\N	1987-01-01	\N	\N	\N	\N	\N	1.5	11	\N	Female		\N	f	f	t	poorly preserved	W	A	P	U	\N	\N	t		f	1987A	98						\N	\N	\N	\N	\N	\N	\N	\N	\N
046e9ac1-1e1d-4296-bb4b-d2ec31245b2a	West	1.9	3.8	3.05	0.2	0.3	3 years	\N						\N		\N	\N	\N	\N	Small child - very poorly preserved\nCan't find details on age for this burial in field book that are described in database (TW)	6de12612-285e-46c8-b4fd-a85acd120b71	\N	\N	1987-01-01	\N	\N	\N	\N	\N	0.75	14	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	P	C	\N	\N	f		f	1987A	110						\N	\N	\N	\N	\N	\N	\N	\N	\N
3a9cb261-0842-4a88-9fa2-3a26c42ce953	West	0.44	2.72	2.73	3.41	4.09	3-4 years	\N				ltbrwn		\N		\N	\N	\N	\N	Measurements in 1992E\nAge and hair details in 1992C\nBasket case\nCourse linen with fringe\nBlue material\nRed ribbon\n8 samples	40c866ab-c8d2-4956-8206-5004ac75cced	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.2	1	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	P	C	\N	\N	t		f	1992A/1992C/1992E	112/55/53						\N	\N	\N	\N	\N	\N	\N	\N	\N
2bf48097-a932-447f-b0f2-08353a36238b	West	0.32	3.17	3.31	1.38	1.78	Newborn	\N						\N		\N	\N	\N	\N	Measurements in 1992E\nage in 1992C\nBasket case\nStripes down each side, could have been blue or purple, but now look mostly green\nMost of cloth is fine weave\nBundle has narrow strips\n5 samples	dee63c0e-d5b7-4967-80d5-c86cf923cd4c	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.43	3	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	N	\N	\N	f		f	1992A/1992C/1992E	136/59/55						\N	\N	\N	\N	\N	\N	\N	\N	\N
ae745719-e26a-4c6f-afae-873053dcf7e6	Undefined	0.6	1	0.65	1.5	2.94	15-20	\N						\N		\N	\N	\N	\N	Can't find burial measurements in field book that are described in database (TW)\nCan't find details on age for this burial in field book that are described in database (TW)\nCircular design on outer layer\nRed, green, and purple, possibly orange\nRed/white ribbon\nDesingn on cloth goes over left sholder\nRibbon tied on feet\nShoes on feet	5fc4abb2-3781-4cf8-b275-1f42ce933778	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	5	\N	Undetermined		\N	f	f	t	headless skeleton	B	C	P	A	\N	\N	f		f	1992A	129						\N	\N	\N	\N	\N	\N	\N	\N	\N
8dcef9c0-a3f3-4a71-ab43-8dc05a671b4d	West	0.3	3.46	3.7	2.36	3.1	18 months	\N				br-red		\N		\N	\N	\N	\N	Measurements in 1992E\nAge and hair details in 1992C\nCoarse linen outer wrap\nFine linen next to body\nEvidence of red in some cloth\nSmall wool robe with red design on sleeves and down front\n5 samples	35303b0c-7a0e-41c3-b2b1-07bd003f78b1	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.88	6	\N	Undetermined		\N	f	f	t	wrapped, head showing	H	C	S	I	\N	\N	t		f	1992A/1992C/1992E	143/77/67						\N	\N	\N	\N	\N	\N	\N	\N	\N
0f210b25-e1e2-4acc-b9f3-b9c22acae0f2	West	0.3	3.98	4	3.2	4.51	9 years	\N				red		\N		\N	\N	\N	\N	Measurements in 1992E\nAge and hair details in 1992C\nLarge body wrapped in coarse linen with brown ribbon\nRed and green design - another green design\nGreen stripe (3) down right side - red design under feet\nFace bundle folded piece of linen over nose tied with ribbon\nFabric on skull rotted\n9 samples	731da559-381f-4b24-b7b1-dde386ac5942	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.36	7	\N	Undetermined		\N	f	f	t	well-wrapped	W	C	P	C	\N	\N	t		t	1992A/1992C/1992E	142/75/67						\N	\N	\N	\N	\N	\N	\N	\N	\N
85dc214a-b0aa-407a-8834-f5cbfa897be6	West	0.96	0.92	0.88	2.95	3.3	newborn	\N						\N		\N	\N	\N	\N	Measurements in 1992E\nage in 1992C\nTiny infant wrapped in coarse linen\nTied with torn strips\nno skull\n2 samples	8a072246-d358-4e48-bec9-ef5aa27cb5a2	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.78	9	\N	Undetermined		\N	f	f	t	wrapped	W	C	P	N	\N	\N	f		f	1992A/1992C/1992E	144/77/67						\N	\N	\N	\N	\N	\N	\N	\N	\N
a97f015b-7a7d-4c40-9e81-bc6179b0541a	West	0.96	1.18	0.98	2.75	3.5	4-5 years	\N				ltbrwn		\N		\N	\N	\N	\N	Measurements in 1992E\nAge and hair details in 1992C\nBasketcase - infant\nFine to medium linen tied with coarse linen strips and rope\n3 samples	2a092ad0-fc6f-4ca5-9207-8a44fc84c60a	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.95	10	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	C	\N	\N	t		f	1992A/1992C/1992E	145/75/67						\N	\N	\N	\N	\N	\N	\N	\N	\N
7b66924a-6996-4bdd-9f57-d64b2adc8cce	West	1	0.15	0.18	4.8	-0.62	3-4 yrs	\N				red		\N		\N	\N	\N	\N	Measurements in 1992E\nRed/white ribbon\nTorn linen ties\nOuter layer of fringe fabric\nA piece of coarse linen with 7 red bands\nSmaller piece with a wove fabric with green design sewn to it\nBasketcase\nhair and age in 1992C\n3 samples	92d609bd-458b-415b-8732-6c1a36a49673	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.82	11	\N	Undetermined		\N	f	f	t	U	U	C	U	C	\N	\N	f		f	1992A/1992C/1992E	147/81/67						\N	\N	\N	\N	\N	\N	\N	\N	\N
94df0c7f-1327-4156-b4a9-428685cefc48	West	0.3	2.45	2.4	0.54	1.38	5-6 years	\N				ltbrwn		\N		\N	\N	\N	\N	Measurements in 1992E\nAge and hair details in 1992C\nFeet and legs wrapped and intact\nHead wrapped\nCoarse linen tied with rope - feet wrapped in 4 blankets of coarse linen tied with rope\n*We did not excavate this area to sterile soil - ran out of time	2308d5d7-ba95-412c-b53f-e76734a4ccc9	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.85	16	\N	Undetermined		\N	f	f	t	wrapped	W	C	S	C	\N	\N	t		f	1992A/1992C/1992E	148/81/66						\N	\N	\N	\N	\N	\N	\N	\N	\N
daaa4edc-f05e-42f8-8405-2386010d654f	West	0.9	0.25	0	2.81	3.61	9 months	\N						\N		\N	\N	\N	\N	Measurements in 1992E\nage in 1992C\nFood bundle\nSmall piece of red/white ribbon - also torn strips of linen\nOuter layer of medium weave\nFringed fabric\n3 cord weave fabric\ncoarse weave fabric\n1 found 4 glass beads (green and white), size of peas\n3 samples	66e49452-c35c-46c2-803d-4a450f06dc0f	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.89	18	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	N	\N	\N	f	Y	f	1992B/1992C/1992E	29/103/83						\N	\N	\N	\N	\N	\N	\N	\N	\N
f5b9d253-56f0-4cf2-965a-47d7db98ba68	Undefined	1	0.8	0.8	1.14	1.14		\N						\N		\N	\N	\N	\N	Multiple body parts\nDisarticulated\nParts of at least 2 individuals	a58604ee-ba1e-436a-b58e-6105f5d397c6	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	20	\N	Undetermined		\N	f	f	f	scattered bones	B		U	U	\N	\N	f		f	1992B	17						\N	\N	\N	\N	\N	\N	\N	\N	\N
15f52f43-f673-43a9-80e9-b4dd76a080ef	West	1.02	1.01	0.88	2.85	3.54	14 months	\N				red		\N		\N	\N	\N	\N	Leg bones showing out of east were disarticulated, one backwards\nage and hair details in 1992C\nSmall child (14 months old) wrapped in medium weave linen\nTied with torn strips of linen - also a rope plus a fringed/worn ribbon with 2 black stripes of design\n3 layers of fine linen\n5 samples	1f93b599-96bd-4f56-9b89-01fdb613458f	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.78	21	\N	Undetermined		\N	f	f	t	wrapped	W	C	S	I	\N	\N	t		f	1992B/1992C	18,21/107						\N	\N	\N	\N	\N	\N	\N	\N	\N
2fe16802-4be5-40a6-bb9f-edd3d6bf1996		0	0	0	0	0		\N						\N		\N	\N	\N	\N	Four bones	43599d2b-1c1c-4bb4-926f-3288689236ba	\N	\N	\N	\N	\N	\N	\N	\N	\N	50	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
7d87817a-878b-4fb6-80ee-a4e102ce8f9a	Undefined	0	0	0	0	0		\N				dkbrwn		\N		\N	\N	\N	\N	Infant well wrapped in coarse linen - tied with rope\nBody on palm poles\nSeeds on the eyes and under the wraps\nA small piece of red yarn woven into the cloth\nSmall braid design on yellow wool, woven\nTook photo, but too fragile for a sample\nHair details in 1992C	f50ba218-3b06-4ef7-92fa-42de88e6161c	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	1	\N	Undetermined		\N	f	f	t	well-wrapped	W	C	U	I	\N	\N	f		f	1992A/1992C	29/17						\N	\N	\N	\N	\N	\N	\N	\N	\N
aa25e4fd-c41c-4f74-963b-f077a104bad8	Undefined	0.75	2.44	2.45	0.56	1.35	18 mos	\N				red		\N		\N	\N	\N	\N	Hair and age details in 1992C\nCan't find burial measurements\n4 samples taken	626f46c3-55c1-4b26-ac19-e2e858b1f6e0	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	2	\N	Undetermined		\N	f	f	t	bones and skull	B	C	S	I	\N	\N	t		f	1992C	17						\N	\N	\N	\N	\N	\N	\N	\N	\N
407c1800-89cf-470d-af38-3309f82dbc71	West	0.8	4.41	4.3	0.89	1.3		\N						\N		\N	\N	\N	\N	Skull cut\nPossibly murdered\nWrapped with coarse linen - crosswise with red/white ribbon\nSmall bundle of linen wrapped over nose\nLinen is too badly decomposed to give good samples	31e62980-3ddd-4cfc-a85a-6f7eb58854c7	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	3	\N	Undetermined		\N	f	f	t	wrapped - bones showing	H	A	P	A	\N	\N	f		f	1992A	37,38						\N	\N	\N	\N	\N	\N	\N	\N	\N
6a450667-c50c-41a5-88d1-5a2444b9c71d	Undefined	0.88	4.3	4	0.71	2.06	infant	\N						\N		\N	\N	\N	\N	Buried face down on adult\nWool wrapped tied with rope\nHem on fabric, stitiched cloth\nSaved sample\nOuter wrap of very coarse linen, second layer of medium linen was small wool robe\nMore details about wrapping available in field book pg. 39	ee7998bc-9879-4d7d-adda-a637e7ade9a4	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	4	\N	Undetermined		\N	f	f	t	wrapped	W	C	S	I	\N	\N	f		f	1992A	37,39						\N	\N	\N	\N	\N	\N	\N	\N	\N
51b9113c-d568-4ed6-9f35-ae66a3f9ae89	Undefined	0.66	3	2.95	4.25	4.63	infant	\N				ltbrwn		\N		\N	\N	\N	\N	Very small infant\nWrapped in fabric, tied with rope\nEvidence of solid line woven design left to right - appears to be a blanket and not a robe	b102ea09-cead-4c32-89cd-6e31c23f9c30	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	5	\N	Undetermined		\N	f	f	t	wrapped	W	C	S	I	\N	\N	t		f	1992A/1992E	40,46/25						\N	\N	\N	\N	\N	\N	\N	\N	\N
805779a5-547d-47b7-9870-43f28ac49dfc	Undefined	0.68	1.75	1.53	3.83	4.41	6 months	\N				br-red		\N		\N	\N	\N	\N	Infant wrapped in linen, tied with rope on palm sticks\nBadly decayed cloth\nsamples of rope and cloth\nNo design evidence\nHair and age designated in 1992C\n3 samples taken\nMeasurements in 1992E	b12a1f5b-a739-4977-9f38-62b7b73cee8a	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.6	7	\N	Undetermined		\N	f	f	t	wrapped - bones showing	H	C	S	N	\N	\N	t		f	1992A/1992C/1992E	49/25/17						\N	\N	\N	\N	\N	\N	\N	\N	\N
1d0a28fc-42b9-4572-904c-920e001cfc10	Undefined	0.61	1.67	1.37	3.39	4.08	3 years	\N						\N		\N	\N	\N	\N	titled an "infant" on pg. 50 of 1992A, but "3 years old" in 1992C\nFound a pearl earring or part of a necklace when I lifted the body from the sand\nWrapped in coarse linen with stripes of linen\nNo color, no design\nMeasurements in 1992E	647dc2b5-c7ec-4ef6-83e3-faefb13f86d9	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	8	\N	Undetermined		\N	f	f	t	wrapped	W	C	S	C	\N	\N	f	Y	f	1992A/1992C/1992E	50/23/17						\N	\N	\N	\N	\N	\N	\N	\N	\N
66d70415-e9eb-4783-a1c3-e4659ff52bd8	Undefined	0.63	1.06	0	3.31	0	youth	\N						\N		\N	\N	\N	\N	Measurements in 1992E\nCan't find other burial details in field book in field book that are described in database (TW)	119ceb3e-a45a-4b75-8ae4-be00c7a29a7d	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	9	\N	Undetermined		\N	f	f	t	Skull only	B	C	S	C	\N	\N	f		f	1992E	17,29						\N	\N	\N	\N	\N	\N	\N	\N	\N
8e66dde4-bb2d-48c1-9af4-715cd9ddc960	West	0.95	1.75	1.55	2.25	3	3-4 years	\N						\N		\N	\N	\N	\N	Well wrapped body\nCoarse linen on outside tied with red/white ribbon\n3 cord woven design along length of cloth\nEvidence of 3 blankets about 38 cm wide\nbasket case\n3 samples	61678a04-5f3f-40b4-9031-957e905ba834	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.85	12	\N	Undetermined		\N	f	f	t	well-wrapped	W	C	S	C	\N	\N	t		f	1992A/1992C	53,71/35						\N	\N	\N	\N	\N	\N	\N	\N	\N
04cf0d10-862a-4f77-9ef7-9cb35bbdf1e2	West	1.05	1.65	1.55	2.1	3.08	6 years	\N						\N		\N	\N	\N	\N	Coarse linen wrap and tied with strips of linen, tightly wrapped around feet\nFine woven cloth small yarns\nOuter 2 layers, one coarse weve with fringe\n2 earrings with pearl or glass\nGender and age in 1992C	97261eb7-c4be-4f3f-980b-dad13c402fdd	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.1	13	\N	Female		\N	f	f	t	wrapped	W	C	P	C	\N	\N	f		f	1992A/1994C	53,60/31						\N	\N	\N	\N	\N	\N	\N	\N	\N
a81be35e-2042-4340-a1b5-b56e40e630bf	West	1.05	2.9	2.95	4.05	4.4	Newborn	\N				brown		\N		\N	\N	\N	\N	One layer of coarse linen tied with rope, appears to be a quick burial.\nBuried at the feet of #16\nAge and hair in 1992C	aa5cb452-f5a9-4c43-bfc3-87c66f2cf9db	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.4	14	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	N	\N	\N	t		f	1992A/1992C	54,67/27						\N	\N	\N	\N	\N	\N	\N	\N	\N
5b14bf08-c716-452f-b497-6ed887f13e1b	West	0.94	1.47	1.4	3.25	3.6	Infant	\N				dkbrwn		\N		\N	\N	\N	\N	Tiny infant wrapped in wool with some dye area, then in what appears to be five straw, possibly linen, then the outer wrap of wool	6f6dd568-0484-436f-8179-5f21a3365652	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.38	17	\N	Undetermined		\N	f	f	t	wrapped	W	C	S	I	\N	\N	t		f	1992A	56,69						\N	\N	\N	\N	\N	\N	\N	\N	\N
a2111a73-8148-4044-a194-9eb8d41722a1	West	1	3.25	3.11	1.6	2.25	18 months	\N				red		\N		\N	\N	\N	\N	Five beads from necklace\nhair and age in 1992c\nVery coarse linen, some red/white ribbon\nAlso some solid red ribbon\nSome yellow wool fabric\nBasketcase\n4 samples	bed1a8af-0e82-45c5-9a8a-534ae8a1c86e	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.68	18	\N	Undetermined		\N	f	f	t	wrapped - bones showing	H	C	S	I	\N	\N	t	Y	f	1992A/1992C	56,65/29						\N	\N	\N	\N	\N	\N	\N	\N	\N
adbc638a-9792-4282-81b2-14df1d9867f2	Undefined	0.95	0.95	0.7	3.35	4	6 months	\N						\N		\N	\N	\N	\N	Can't find details on age and gender for this the burial in field book that are described in database (TW)\nCoarse linen, no rope on ribbon\nSaved 2 small samples of cloth\nMost was decomposed\nBasket case	7b39f429-d8dd-4d98-a4cd-cd3afd14fe63	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.74	21	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	N	\N	\N	f		f	1992A	57,64						\N	\N	\N	\N	\N	\N	\N	\N	\N
9fa3f644-bb19-4306-9639-f71523a7e01a	West	0.74	2.29	2.06	3.02	4.44	50+	\N				br-red		\N		\N	\N	\N	\N	Measurements in 1992E\nCan't find details on age and gender for this the burial in field book that are described in database (TW)\nFace bundle has coarse linen outer wrap tied with solid red ribbon\nInside face bundle, yellow wove with purple design and signs that the fabric was patched\nFound rope at feet, some green color on rope	fe46277b-80ed-46ce-b7a3-4eabe5f8948b	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.66	22	\N	Female		\N	f	f	t	wrapped - bones showing	B	A	P	A	\N	\N	t		t	1992A/1992E	84/38/45						\N	\N	\N	\N	\N	\N	\N	\N	\N
63804861-bf53-4a15-aad6-24a4e5693d81	West	0.76	2.09	2.04	3.06	3.17	Infant	\N				brown		\N		\N	\N	\N	\N	Measurements in 1992E\nWrapped in blanket\nNo evidence of any type of robe\nRibbon on ties	ef761ada-794c-43ed-b362-3c8760716d2b	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.39	23	\N	Undetermined		\N	f	f	f	wrapped	W	C	S	I	\N	\N	t		f	1992A/1992E	79/38						\N	\N	\N	\N	\N	\N	\N	\N	\N
db005f2d-d39d-4f4e-b9e6-3d952730ff11	East	1.12	3.78	3.8	0.82	-0.8	45+	\N						\N		\N	\N	\N	\N	Fine linen outer wrap\nRed/white ribbon\nFringe on cloth\nEvidence of purple - sample\nScott says male age 45+\nPartly basket case\nFeet disarticulated	d7292af9-4e34-4821-9b1e-1a51c08e83c8	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.7	25	\N	Male		\N	f	f	t	wrapped	W	A	P	A	\N	\N	f		f	1992A/1992E	74,75,90/45						\N	\N	\N	\N	\N	\N	\N	\N	\N
f1c0d7b9-708b-484f-ae76-73b4197a694d	West	0.85	0.5	0.3	3.1	3.85	5-6 years	\N						\N		\N	\N	\N	\N	Can't find details on age for this the burial in field book that are described in database (TW)\nWrapped in coarse linen, tied with red/white ribbon	c4530ffe-b40e-4c7f-b565-a5dddf793a3c	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.78	26	\N	Undetermined		\N	f	f	t	wrapped	W	C	S	C	\N	\N	f		f	1992A	76,89						\N	\N	\N	\N	\N	\N	\N	\N	\N
b309a563-a635-4301-94cc-faba9f06685f	Undefined	0.9	1.28	1.06	1.9	2.68		\N						\N		\N	\N	\N	\N	Just legs\nFound part of body from feet to pelvis, but no pelvic bone\nSaved one piece of fabric	3bab77a7-536a-4d12-b718-9bddc1415aec	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.81	27	\N	Undetermined		\N	f	f	t	scattered bones	B	C	U	U	\N	\N	f		f	1992A/1992C	76,83/35						\N	\N	\N	\N	\N	\N	\N	\N	\N
3da8b8f3-e50c-47a7-85cf-1e33a081374d	West	1.1	1.02	0.62	1.86	3.12	15 years	\N				brown		\N		\N	\N	\N	\N	Can't find details on age for this the burial in field book that are described in database (TW)\nChild or young adult\nWrapped in coarse linen and tied with brown/white ribbon\nFace bundle has yellow wove fabric\nNo design or other color on wool face bundle\nMore details available about wrapping on pg. 78	468deccc-4758-425d-91cd-ed30d8a5e020	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.26	29	\N	Undetermined		\N	f	f	t	wrapped	W	C	P	C	\N	\N	t		t	1992A	76,78						\N	\N	\N	\N	\N	\N	\N	\N	\N
a5797565-b719-47f2-9f2e-f430af02e263	West	0.83	0.92	0.67	0	0.93	4-5 years	\N				ltbrwn		\N		\N	\N	\N	\N	age and hair details in 1992C\nSmall child well wrapped\nCoarse linen tied with torn linen strips\nHead wrapped with layers of torn strips - then 6 layers of fabric\nBody wrapped in very heavy new linen blankets\nMore details available about wrapping on pg. 82\n8 samples	66b89e13-1690-4582-b28e-5e021ad01b8b	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.99	30	\N	Undetermined		\N	f	f	t	wrapped	W	C	P	C	\N	\N	t		f	1992A/1992C	76,82/43						\N	\N	\N	\N	\N	\N	\N	\N	\N
651a0614-27f9-4454-ba5f-1c79a895fabc	West	1.12	3.28	3.1	3.32	4.05	18 months	\N				brown		\N		\N	\N	\N	\N	age and hair details in 1992C\nBaby wrapped in unspun fiber, possibly linen\nFlake then in a firm cloth with fringe and 3 cord weave\nRed thread used to stitch a small piece\nFemur has been broken	502ace88-9726-4d00-aeb5-a25d5cda4f11	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.84	31	\N	Undetermined		\N	f	f	t	wrapped	W	C	P	I	\N	\N	t		f	1992A/1992C	77,80/35						\N	\N	\N	\N	\N	\N	\N	\N	\N
cda5baa9-e271-4c3c-84c2-8064c129afbd	West	0.76	4.78	4.65	1.88	2.57	2 years	\N				ltbrwn		\N		\N	\N	\N	\N	age and hair details in 1992C\n6 samples	baa8e1c2-998a-45cc-8907-00614307e52d	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.78	32	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	I	\N	\N	t		f	1992A/1992C	91/47						\N	\N	\N	\N	\N	\N	\N	\N	\N
69b645c6-3923-482b-9cdd-82f0a371a96b	West	1.02	4.19	4.11	2.14	2.96	15-18?	\N				Red		\N		\N	\N	\N	\N	Some details on hair and gender in 1992E\nDisturbed burial measure to pelvis\nAdult, body somewhat torn apart\nWool rope, under a coarse linen blanket\nRed and green design woven in as coarse thread, also fine woven red, green design\nsampled\nLong red braided hair	870b0ea1-bbf6-4d38-9b82-446fef7b826a	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.04	33	\N	Female		\N	f	f	t	wrapped	W	A	P	A	\N	\N	t		f	1992A/199E	91,96/49						\N	\N	\N	\N	\N	\N	\N	\N	\N
785cd5cc-6ccf-4805-85cc-f7e6f09c2f52	Undefined	0	0	0	0	0	4-5 years	\N				ltbrwn		\N		\N	\N	\N	\N	age and hair details in 1992C\nCoarse linen tied with torn strips\nbasketcase\nCan't find burial measurements for this burial in field book that are described in database (TW)\n5 samples	96f27130-31fd-4b70-9770-531ec8455871	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	36	\N	Undetermined		\N	f	f	t	wrapped	W	C	S	C	\N	\N	t		f	1992A/1992C	110/47						\N	\N	\N	\N	\N	\N	\N	\N	\N
549fdf53-8807-4ed5-8019-955ed01c8823	West	1.28	4.03	3.71	0.76	2.44	45-65 yrs	\N				Blond		\N		\N	\N	\N	\N	age, gender, and hair details in 1992C\nLarge mummy\nLinen wrap, undyed ribbon\nFace damaged\nRed/white ribbon\nHead not connected\nOuter wrap of fine linen - 6 layers of coarse linen - 3 layers of fine linen\nCoarse linen 3 cord weave\nred beard\n5 samples	8b97f837-69b2-4ca1-a5e6-16d9cdd4edb8	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.68	37	\N	Male		\N	f	f	t	wrapped	W	A	P	A	\N	\N	t		f	1992A/1992C	104-126/53						\N	\N	\N	\N	\N	\N	\N	\N	\N
d0730ae9-188d-4f93-b182-83556e89fcb1	West	1.65	4.34	3.61	0.98	2.57	35 yrs	\N				dkbrwn		\N		\N	\N	\N	\N	age, gender, and hair details in 1992C\nBadly decomposed fabric\nOuter layer - fine linen, torn strips\nMany layers of coarse linen\n16 layers of coarse linen 3 of fine linen\n6 samples\nBroken skull	ee439cf3-2638-4c31-be73-6776cc561d61	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.75	41	\N	Male		\N	f	f	t	poorly preserved	B	A	P	A	\N	\N	t		t	1992A/1992C	107-117/57						\N	\N	\N	\N	\N	\N	\N	\N	\N
b2126e35-0136-471f-8943-04db3ffcd0f5	West	1.6	2.38	2.41	2.1	2.72	6 months	\N						\N		\N	\N	\N	\N	age in 1992C\nBasketcase - child\nMedium linen - no ties\n3 samples	e7e51ddb-90ef-4e92-8fe0-7a23086117bc	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.63	42	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	N	\N	\N	f		f	1992A/1992C	107-111/53						\N	\N	\N	\N	\N	\N	\N	\N	\N
c2211a2d-1e81-4699-80e0-ecb84c2d8908	West	1.7	4.2	3.5	3.35	5	30-35 years	\N						\N		\N	\N	\N	\N	Measurements in 1992E\nCan't find details on age, gender, wrapping, or hair for this the burial in field book that are described in database (TW)\nWell wrapped with red/white ribbon\nLOTS of more wrapping details on pg. 3	292c60b4-1323-4811-8135-6119df951985	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.69	46	\N	Male		\N	f	f	t	well-wrapped	W	A	P	A	\N	\N	f		t	1992B/1992E	Mar-69						\N	\N	\N	\N	\N	\N	\N	\N	\N
8dbdedcf-8b90-46dd-bef7-d540bd0deac0	West	1.7	3.95	3.8	4.57	5.03	4-5 yrs	\N				br-red		\N		\N	\N	\N	\N	Measurements in 1992E\nage and hair in 1992C\nInfant - basket case\n4 samples	3e55dd85-9fce-45d6-9958-84f2045c2713	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.45	47	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	C	\N	\N	t		f	1992A/1992C/1992E	149/79/69						\N	\N	\N	\N	\N	\N	\N	\N	\N
aadeb217-eaae-4d3b-868a-5fbbec25e091	East	2	4.5	4.05	0.9	2.25	30-35 years	\N						\N		\N	\N	\N	\N	Measurements in 1992E	e5a88eb5-ae12-4fa8-85a3-802b98393302	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.5	49	\N	Female		\N	f	f	t	poorly preserved	B	A	P	A	\N	\N	f		f	1992E	70						\N	\N	\N	\N	\N	\N	\N	\N	\N
0554b649-322b-4841-8709-ca74b886be2a	West	2.63	2.31	2.67	2.82	4.3	55+ yrs	\N						\N		\N	\N	\N	\N	Measurements in 1992E\nage and gender in 1992C\n5 samples	c6ac143f-52f1-4a6f-a9d4-984da865cf90	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.58	51	\N	Male		\N	f	f	f	U	U	A	U	A	\N	\N	f		f	1992C/1992E	95/79						\N	\N	\N	\N	\N	\N	\N	\N	\N
2d765fea-7137-44c0-8185-8a38029f06d1	West	1.8	4.8	4.2	3.7	5.3	30+ yrs	\N				dkbrwn		\N		\N	\N	\N	\N	Measurements in 1992E\nCan't find details on age, gender, or hair for this the burial in field book that are described in database (TW)\nWell wrapped mummy\nhead detached\nLOTS of burial details on pg. 12	dbe0f18d-9081-4ba2-a844-6c36927c410e	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.5	52	\N	Male		\N	f	f	t	well-wrapped	W	A	P	A	\N	\N	t		f	1992B/1992E	Dec-79						\N	\N	\N	\N	\N	\N	\N	\N	\N
8283b0b2-1c77-4408-95c6-14361a4ed399	East	1.95	4.28	4.07	3.54	5.37	55+ yrs	\N						\N		\N	\N	\N	\N	Can't find measurements for this burial in field book that are described in database (TW)\nage and gender in 1992C\n5 samples	c6f4947e-7835-4697-9586-a28e3ecd7985	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.45	53	\N	Male		\N	f	f	t	SKELETON	B	A	P	A	\N	\N	f		f	1992C/1992E	101/79						\N	\N	\N	\N	\N	\N	\N	\N	\N
f72b05ee-855d-4625-83b2-fea7d26382d1	Undefined	0.08	1.25	1.25	1.83	1.83	Infant	\N						\N		\N	\N	\N	\N	Part of infant skull; some cloth and hair\nDecayed stone under 1-2 cm of sand\ndisarticulated bones\nBroken pottery, some reeds and cloth were on top of the stone and have been disturebed	b39a59b3-3f28-4921-9f81-a677a6dd5f80	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	1	\N	Undetermined		\N	f	f	f	bones	B	C	S	I	\N	\N	f		f	1992A	4						\N	\N	\N	\N	\N	\N	\N	\N	\N
71970b9c-67dc-4f5f-9271-934f07304a4f	Undefined	0.08	1.85	1.72	1.19	0.35	9-10 years	\N						\N		\N	\N	\N	\N	Can't find measurements for this burial in field book that are described in database (TW)\nCan't find details on age, gender, or hair for this the burial in field book that are described in database (TW)\nBody is wrapped and placed on palm sticks\nThe head was diconnected from the body\nThe body is wrapped in a robe with a beautiful woven (?) of blue and green wrap on coarse linen, decomposed.\nThere is a large blue woven design which was near the head with a white pattern woven in stripes\nLegs were wrapped with wool and covered	5bfa3fe2-92ba-4403-a267-37f5af17f853	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	2	\N	Undetermined		\N	f	f	t	wrapped	W	C	P	C	\N	\N	f		f	1992C	7						\N	\N	\N	\N	\N	\N	\N	\N	\N
14f2b971-1d8d-4f9c-8ae7-a1a4f10eb607	Undefined	0.08	1.89	1.72	1.23	0.35		\N						\N		\N	\N	\N	\N	The skull of #2 (labeled differently originally) appears to belong to the body of #3	21362ad2-9fd0-43d6-a8f3-2678d6753f60	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	3	\N	Undetermined		\N	f	f	f	headless skeleton	B	U	U	U	\N	\N	f		f	1992A	5						\N	\N	\N	\N	\N	\N	\N	\N	\N
a8b2934b-cb48-4090-a299-af413bb83cc6	Undefined	0.08	2.13	2.13	0.62	0.62	Under 6 yrs	\N						\N		\N	\N	\N	\N	There is a blue design on the fine weave cloth next to the skin\nSkull, just fragments and two types of cloth	428d9178-028d-494d-8217-a752605b2d63	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	4	\N	Undetermined		\N	f	f	t	Skull only	B	C	S	C	\N	\N	f		f	1992A/1992D	6-May						\N	\N	\N	\N	\N	\N	\N	\N	\N
5749dfe3-6e24-4769-9eed-7a33263dbb9f	Undefined	0.15	3.7	3.7	4.3	4.3	8-10 yrs old	\N				brown		\N		\N	\N	\N	\N	Teeth in excellent condition	50ec6cd2-253c-4cac-9ac6-27494aa53898	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	5	\N	Undetermined		\N	f	f	t	Skull only	B	C	S	C	\N	\N	t		f	1992A	7						\N	\N	\N	\N	\N	\N	\N	\N	\N
3d903167-9325-4338-87e5-194e99138695	Undefined	0.25	3.9	3.9	4.09	4.09	30+	\N				br-red		\N		\N	\N	\N	\N	lots of details about the teeth\nBoth eyes and facial tissue present	87ddba9a-1d11-46ba-9cf5-afeec462b557	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	6	\N	Female		\N	f	f	t	Skull only	B	A	S	A	\N	\N	t		f	1992A	7						\N	\N	\N	\N	\N	\N	\N	\N	\N
5f0edd04-9bde-4962-aedb-ddd1c2e14992	Undefined	0.35	3.2	3.2	1.5	1.5	20's	\N				dkbrwn		\N		\N	\N	\N	\N	Details about teeth available on page 15\nSkull ONLY, disarticulated	d4825cd4-9e9e-4cd0-a03f-db741a0f43e4	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	9	\N	Female		\N	f	f	t	Skull only	B	A	S	A	\N	\N	t		f	1992A	15						\N	\N	\N	\N	\N	\N	\N	\N	\N
cde8f926-4aef-4e69-838b-ae9c26274243	Undefined	0.28	2.89	0	2.2	0	4 years	\N				dkbrwn		\N		\N	\N	\N	\N	Body wrapped in coarse linen tied with ribbon\nSome red ribbon sowing on head\nPart of face bundle showing\nOuter layer linen - next appears to be a yellow wool fabric\nNo design showing\nSamples of linen, wool, red ribbon, and hair\n3 samples collected\nCan't find hair details	3ee3216a-04e6-48fd-b144-b6030fd65cf9	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	10	\N	Female		\N	f	f	t	wrapped	W	C	P	C	\N	\N	t		t	1992A/1992C	24,13						\N	\N	\N	\N	\N	\N	\N	\N	\N
35990757-9cbd-4d46-bea2-609791ba0260	Undefined	0.75	4	4.2	4.9	4.2	4 years	\N				brown		\N		\N	\N	\N	\N	One copper ring\nRed and green fabric on head\nHair braided\nLinen wrap/ribbon ties - no color\nPalm poles under body\nBody fabric badly decomposed\n3 strand necklace\nTissue on head including ears - well preserved\nage described in 1992C	866225d1-7b8d-4cd7-905c-2d255435586d	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	12	\N	Female		\N	f	f	f	well-wrapped	W	C	P	C	\N	\N	t	Y	f	1992A/1992C	19,20/10						\N	\N	\N	\N	\N	\N	\N	\N	\N
e8596c68-ce26-4f42-b4a9-d77a78e0ddd8	Undefined	0.75	3.8	0	4.8	0	20-25 yrs	\N				brown		\N		\N	\N	\N	\N	Extensive wrap - rope and twine\nWrapped with coarse linen - tied with ribbon (some red ribbon)\nBeautiful curly borwn hair\nLinen is badly decomposed\nyoung woman\n1st and 2nd molars erupted - teeth in excellent condition\nAbout 20 yrs old\nPossibly mother of #12 and #14\ncollected 4 samples	7e0994eb-d00f-4ebe-9130-3d5fd52cbf9e	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	13	\N	Female		\N	f	f	t	wrapped	W	A	P	A	\N	\N	t		f	1992A	19,21						\N	\N	\N	\N	\N	\N	\N	\N	\N
d41fdbe5-798e-4d73-b084-942c30540f0e	Undefined	0.8	3.6	0	4.8	0	1-3 yrs	\N				dkbrwn		\N		\N	\N	\N	\N	Infant wrapped in cloth with strip of linen tied with rope.\nBounded with stone on South\n#12,13,14 are above burial #15\nPurple band along the length of the wrap\nSome purple design on fabric of feet\nProbably child of #13\nCan't find hair details	8a8219b9-260e-43d1-93d3-932e0667a801	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	14	\N	Undetermined		\N	f	f	t	wrapped	W	C	S	I	\N	\N	t		f	1992A/1992C	19,23/11						\N	\N	\N	\N	\N	\N	\N	\N	\N
512a2a61-24dc-425f-8fab-e4508ec10804	Undefined	0.84	3.82	3.5	4.13	4.32	young	\N				dkbrwn		\N		\N	\N	\N	\N	Skull crushed\nCoarse linen wrap, tied with solid red ribbon\n5 Samples taken	873cf5cb-ee1d-40ee-bd34-b0a06a446d32	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	15	\N	Female		\N	f	f	t	wrapped	W	A	P	A	\N	\N	t		t	1992A/1992C	19,25,32/19						\N	\N	\N	\N	\N	\N	\N	\N	\N
6992e341-a6d7-4265-b79b-c11af4513a52	Undefined	0.99	3.61	3.41	4.44	5	10 months	\N						\N		\N	\N	\N	\N	Badly decomposed cloth\nBaket case - No hair, skull broken\nSome blue, green, probably wool\nBlue cloth purple stripes, red thread to hem the sleeves\nAge details described in 1992C	0384d7e8-2060-4d05-930e-ca635a728251	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	16	\N	Undetermined		\N	f	f	t	bones and skull	B	C	S	N	\N	\N	f		f	1992A/1992C	25,31/19						\N	\N	\N	\N	\N	\N	\N	\N	\N
2c47f270-5a47-4387-ab88-bea6993d7b66	Undefined	2.8	2.8	2.8	3.89	3.89	50+	\N				dkbrwn		\N		\N	\N	\N	\N	Old female\nNo teeth on lower mandible\nwool, yellow face bundle - purple design badly decomposed\nBody robe is dark red and black design\nRed-green medallion\nBody was placed on palm poles\nHair and age details in 1992C\nCollected samples from feet ribs and skull	20d100c3-3e97-4263-876f-61bac77b1feb	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	17	\N	Female		\N	f	f	t	wrapped	W	A	P	A	\N	\N	t		t	1992A/1992C	25/15						\N	\N	\N	\N	\N	\N	\N	\N	\N
d92e42a7-a870-4d37-9fda-0cb5498644ae		0.81	2.2	0	4.2	0		\N						\N		\N	\N	\N	\N		aa89940f-61d7-4c60-91b8-8aaeee0f1037	\N	\N	\N	\N	\N	\N	\N	\N	\N	19	\N	Undetermined		\N	f	f	f	wrapped	W	A	U	U	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
0e809fd1-c6d0-4693-ad45-1d5abee60b96	Undefined	0.77	1.6	1.77	2.7	3.43	5-6 yrs	\N				ltbrwn		\N		\N	\N	\N	\N		1edbe8d7-3932-447a-a778-c87f819e9319	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	20	\N	Undetermined		\N	f	f	t	wrapped	W	C	S	C	\N	\N	t		f	1992A	35						\N	\N	\N	\N	\N	\N	\N	\N	\N
09b46f05-f179-4ab3-aede-f49fc05332cf	Undefined	1	3.65	3.62	4.21	4.74	7 months	\N						\N		\N	\N	\N	\N	Wrapped with linen and tied with rope, basket case\nSome evidence of purple design woven into linen\nMed weave\n12 Samples\nAge described in 1992C	0af4cee2-cd86-4833-8aac-4b2286acfcb9	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	21	\N	Undetermined		\N	f	f	t	wrapped	W	C	S	N	\N	\N	f		f	1992A/1992C	41,48/21						\N	\N	\N	\N	\N	\N	\N	\N	\N
e4939faf-68a4-43e3-be82-bda1464b65fd	Undefined	0.96	3.55	3.44	4.05	4.61	7 months	\N						\N		\N	\N	\N	\N	Wrapped in coarse linen, tied with rope and the outer wrap was a fine weave\nSome cloth of linen with dyed wool yarns worming\nBasket case\nAge described in 1992C	1feab241-a274-43eb-8ad1-ba463ef2d8f6	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	22	\N	Undetermined		\N	f	f	t	wrapped	W	C	S	N	\N	\N	f		f	1992A/1992C	41,43/21						\N	\N	\N	\N	\N	\N	\N	\N	\N
e1c86860-5451-4e88-81cd-612a95d7cf52	Undefined	1.1	3.71	3.71	4.13	4.13		\N						\N		\N	\N	\N	\N		9c8e9edd-cac1-4b29-9716-ed11563d4223	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	23	\N	Undetermined		\N	f	f	f	wrapped	W	A	U	U	\N	\N	f		f	1992A	41						\N	\N	\N	\N	\N	\N	\N	\N	\N
22b620d8-5da5-45ea-8187-a17639a2ce8b	West	0.42	4.95	4.8	1.05	1.65	18 months	\N						\N		\N	\N	\N	\N	Can't find the details on wrapping associated with this burial in field book that are described in database (TW)\nUnder a flat rock\nRope\nStrips of torn linen - coarse linen wrap\nSmall samples\nbasket case\nage in 1992C	9aeb04f5-5444-4075-a2a8-766fae8e76d9	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.65	27	\N	Undetermined		\N	f	f	t	wrapped - bones showing	H	C	S	I	\N	\N	f		f	1992A/1992C	58,73/27						\N	\N	\N	\N	\N	\N	\N	\N	\N
afe2d3bf-50af-447a-9e90-11d92c59be69	West	1.04	3.73	3.68	4.16	5	3-4 years	\N				brown		\N		\N	\N	\N	\N	Age and hair details in 1992C\nInfant wrapped in medium weave\nLinen tied with torn strips of cloth\n3 samples	ce61a25d-9bf1-4d80-ab4e-cd78d68b5a31	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.86	29	\N	Undetermined		\N	f	f	t	wrapped	W	C	P	C	\N	\N	t		f	1992A/1992C	75,85/39						\N	\N	\N	\N	\N	\N	\N	\N	\N
a21471a2-37df-4e15-ac7c-c27d2df804ef	West	0.94	4.09	4.04	4.3	4.99		\N						\N		\N	\N	\N	\N	Measurements in 1992E	2fc0210f-e159-4cb5-ae5d-06a76c71e99c	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.72	30	\N	Undetermined		\N	f	f	f	well-wrapped	W	C	P	U	\N	\N	f		f	1992E	39						\N	\N	\N	\N	\N	\N	\N	\N	\N
32cfb71d-2dd5-4a66-b0bc-4341a2464ce5	Undefined	0.6	5	5	2.5	2.5		\N						\N		\N	\N	\N	\N	Can't find the burial measurements associated with this burial in field book that are described in database (TW)\nCan't find the details on age associated with this burial in field book that are described in database (TW)\nSkull fell from north wall 60 cm deep\nPiece of  red cloth, finished edges, fringe, sewn to another cloth\nMain head wrap is a mix of woven dark cloth, woven (?) a very coarse weave of heavvy yarn\nIt could be a major patch job on a piece of cloth	96dff2ba-b6db-4853-82e4-a478914612c0	\N	\N	1992-01-01	\N	\N	\N	\N	\N	\N	31	\N	Undetermined		\N	f	f	f	Skull only	B	A	U	A	\N	\N	f		f	1992A	86						\N	\N	\N	\N	\N	\N	\N	\N	\N
ff8b66a0-560a-41f2-bae4-6e15d140057a	West	1.03	1.43	1.2	4.36	6.02	40-50 yrs	\N				brown		\N		\N	\N	\N	\N	age, gender, and hair found in 1992C\nA layer of coarse linen tied on 3 layer with ribbon, all decayed\nOuter layers tied with red ribbon and also brown/white ribbon\nOne red woolen yarn woven into the outer inner fabric, over the face\n7 samples\nBaby was put on his pelvic	a8452f62-5e46-4e6e-8b83-0502d8f9a0f9	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.67	32	\N	Male		\N	f	f	t	wrapped	W	A	P	A	\N	\N	t		f	1992A/1992C	93,97/43						\N	\N	\N	\N	\N	\N	\N	\N	\N
bbd3b4a2-69aa-4bd9-baf0-e86086fc90cb	West	1.05	1.39	1.39	5.24	5.24	newborn	\N						\N		\N	\N	\N	\N	Measured to the bundle which lies on the stomach of #32\nFragment of dyed wool with woven design\nTook photos and samples\nTwo samples	94d56578-f7f3-472d-ad14-976bbb42d162	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.3	33	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	N	\N	\N	f		f	1992A/1992C	93,99/45						\N	\N	\N	\N	\N	\N	\N	\N	\N
8ebde29d-c51c-4a02-ae30-7a5413c09ba5	Undefined	0.96	3.98	3.95	2.96	3.22	newborn	\N				brown		\N		\N	\N	\N	\N	age and hair found in 1992C\nWrapped in linen with purple strips down right side\nFeet damaged\nInfant - purple stripe on fine linen fabric	da6da749-fab5-470e-8d15-e645712fdef9	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.26	36	\N	Undetermined		\N	f	f	t	wrapped	W	C	S	N	\N	\N	t		f	1992A/1992C	103135/51						\N	\N	\N	\N	\N	\N	\N	\N	\N
58c5a654-1a27-457d-ad63-758bff527b3a	West	0.85	3.16	3.06	0.3	1.55	20	\N				br-red		\N		\N	\N	\N	\N	age, gender, and hair found in 1992C\nBuried without a head\n9 samples	41b96c61-9cbb-4e33-9650-63916ef23515	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.03	37	\N	Male		\N	f	f	t	headless skeleton	B	A	P	A	\N	\N	t		f	1992A/1992C	106/51						\N	\N	\N	\N	\N	\N	\N	\N	\N
9eca8797-53bb-462a-8b1d-d29d10a74371	West	1.6	1.06	1.02	1.55	2.31	2-3 yrs	\N						\N		\N	\N	\N	\N	age in 1992C\n4 samples\nCan't find wrapping details in field book that are described in database (TW)	acc8d691-18c5-455d-ab68-0c7bd45722fa	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.82	40	\N	Undetermined		\N	f	f	t	bones and skull	B	C	S	I	\N	\N	f		f	1992A/1992C	108/61						\N	\N	\N	\N	\N	\N	\N	\N	\N
1cbe9a04-6c84-4d6e-b901-0b6966002525	West	1.4	1.88	1.52	4.09	4.92	4-5 yrs	\N						\N		\N	\N	\N	\N	Measurements in 1992E\nhair in 1992C\nBasket case\nInfant\nOuter layer of fine cloth\nInner piece of (?), 3 stripes\nBuried with #43\n2 samples	34252b0f-3d6e-44e7-a3c9-584234b54aa0	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.94	42	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	P	C	\N	\N	f		f	1992A/1992C/1992E	123/65/57						\N	\N	\N	\N	\N	\N	\N	\N	\N
1710d5e0-2592-49cb-8c24-4aac8c2eb866	West	1.4	2.1	1.9	3.33	4.13	3-5 yrs	\N				brown		\N		\N	\N	\N	\N	Measurements in 1992E\nage and hair in 1992C\nBasket case - infant\nFragment of decayed linen\n3 layers of coarse linen\nInner layer of fine linen\nNo ties	87612196-eb3d-4b32-a103-1365c0e73c84	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.94	43	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	P	C	\N	\N	t		f	1992A/1992C/1992E	124/63/57						\N	\N	\N	\N	\N	\N	\N	\N	\N
7cd3bfe8-e893-44db-9799-e5a2d54e0a05	West	0.78	0.47	0.7	4.4	6	Adult	\N						\N		\N	\N	\N	\N	Measurements in 1992E\nage in 1992C\nNo head\nUndyed ribbon ties\nBody is black, decomposed\nScraps of outer layer and fringe	6f1983a0-041c-455f-9878-a466ede67bdd	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.55	45	\N	Undetermined		\N	f	f	t	Body only	B	A	U	A	\N	\N	f		f	1992A/1992C/1992E	121/67/57						\N	\N	\N	\N	\N	\N	\N	\N	\N
5aab2211-b5e0-4557-acf4-138c87a7c64d	West	1.1	1.98	2.06	1.15	1.87	18 mos	\N						\N		\N	\N	\N	\N	Measurements in 1992E\nage in 1992C\nInfant - basket case\nHeavily encrusted with salt and sand\nFoot wrap in pretty good shape\nTied with rope on coarse linen\n4 samples	652597ca-702c-4709-84ed-3a29257ae378	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.81	47	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	I	\N	\N	f		f	1992A/1992C/1992E	125/69/61						\N	\N	\N	\N	\N	\N	\N	\N	\N
0c100b8a-73a2-4e62-9fa3-09772a07ab25	West	1.75	2.83	2.72	2.78	5.2		\N						\N		\N	\N	\N	\N	Can't find details on age, wrapping for this the burial in field book that are described in database (TW)\nEvidence of a purple robe on the body\nNot much evidence of white	73f29553-1d95-471f-8685-0d0fb69946be	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.6	49	\N	Undetermined		\N	f	f	f	SKELETON	B	C	S	U	\N	\N	f		f	1992A	127,131						\N	\N	\N	\N	\N	\N	\N	\N	\N
fdd70cd7-f865-409f-8d87-c105a1a95ca1		0	0	0	0	0		\N						\N		\N	\N	\N	\N	No Head Coarse linen with ribbon that was made of linen as well	ad4bc86a-ad26-4b57-9c46-a4a8c5346b45	\N	\N	\N	\N	\N	\N	\N	\N	\N	18	\N	Undetermined		\N	f	f	f		B	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
aad3dcb2-2175-4e19-a812-3aaf550b0532	West	2.7	3.24	4.08	3.1	1.8	55-65 yrs	\N				dkbrwn		\N		\N	\N	\N	\N	Measurements in 1992E\nage, gender, and hair in 1992C\n6 samples	3707e87c-d0b1-4d16-82d7-2ba554a317f3	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.63	51	\N	Female		\N	f	f	t	SKELETON	B	A	P	A	\N	\N	t		f	1992C/1992E	83/71						\N	\N	\N	\N	\N	\N	\N	\N	\N
ac4edf78-a0a1-43bd-ad73-9e7eebb4ca94	West	0.6	1.85	1.4	-0.7	0.84	55+ yrs	\N				ltbrwn		\N		\N	\N	\N	\N	Measurements in 1992E\nage, gender, and hair in 1992C\nBasket case\n2 layers of coarse linen\nred/white ribbon\nRobe under head\nPurple circular design on wool\n15 samples	9b54e160-dfa9-4845-9500-fe1923bf74a8	3a0c233b-c4b3-4809-b9c3-a85c980d56bf	\N	1992-01-01	\N	\N	\N	\N	\N	1.65	52	\N	Female		\N	f	f	t	poorly preserved	B	A	P	A	\N	\N	t		f	1992B/1992C/1992E	6/91/75		9G.08				\N	\N	\N	\N	\N	\N	\N	\N	\N
703b8842-6466-4b14-9bf4-f0574e0b0c17	East	2.1	2.1	1.7	0.7	0	3-4 years	\N						\N		\N	\N	\N	\N	Measurements in 1992E\nage in 1992C\nno textiles\n4 samples	407a999a-08ab-4293-b9c8-3531becf9072	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.75	53	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	C	\N	\N	f		f	1992C/1992E	89/75						\N	\N	\N	\N	\N	\N	\N	\N	\N
607af69c-1c2f-42bd-a316-fc85c3e69f78	West	2.04	3.86	3.8	3.8	4.46	4-5 years	\N						\N		\N	\N	\N	\N	Measurements in 1992E\nage, and gender in 1992C\n4 samples	5fc8669f-728f-4722-82c7-34012f89291f	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.73	56	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	C	\N	\N	f		f	1992C/1992E	97/77						\N	\N	\N	\N	\N	\N	\N	\N	\N
9be660c0-f07c-41cf-8ab9-cbc8d9cf8eca	East	2	2.57	2.82	2.67	2.04	6 months	\N						\N		\N	\N	\N	\N	Measurements in 1992E\nage, and gender in 1992C\n5 samples	4ccdb3c9-dc63-4971-b285-15fc3bc5176f	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.3	58	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	N	\N	\N	f		f	1992C/1992E	99/77						\N	\N	\N	\N	\N	\N	\N	\N	\N
ad57cc36-a1e9-47b2-b7fc-48271481c85c	East	2.33	2.87	3.12	5.24	3.77	55+ yrs	\N						\N		\N	\N	\N	\N	Measurements in 1992E\nage, and gender in 1992C\n5 samples	0f4e30dc-d878-4800-9fdb-fd151101091b	\N	\N	1992-01-01	\N	\N	\N	\N	\N	1.48	59	\N	Male		\N	f	f	t	poorly preserved	B	A	P	A	\N	\N	f		f	1992C/1992E	101/77						\N	\N	\N	\N	\N	\N	\N	\N	\N
9f15aa46-2737-4e5c-97e7-4e9440c8315d	West	1.64	4.26	4.61	1.72	1.08	5 years	\N						\N		\N	\N	\N	\N	Measurements in 1992E\nage, and gender in 1992C\n4 samples	90338a68-27b7-4600-8f30-42a06385ead1	\N	\N	1992-01-01	\N	\N	\N	\N	\N	0.72	60	\N	Undetermined		\N	f	f	t	poorly preserved	B	C	S	C	\N	\N	f		f	1992C/1992E	103/77						\N	\N	\N	\N	\N	\N	\N	\N	\N
8790f8ce-f5e5-4766-905c-504044843838		1.69	1.8	1.5	3.2	3.2		\N						\N		\N	\N	\N	\N	Bottom of west wall outside	395d6924-ab50-4152-a019-9078ce2c8548	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	Undetermined		\N	f	f	t		B	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
71a7eb7d-6808-440d-9ce0-cf72b49a9843	Undefined	0	0	0	0	0		\N						\N		\N	\N	\N	\N	gonion-flat\nno hyperosteosis\nsciatic notch-narrow\npubic angle-small\nfemur-49\n1cm\nsamples:teeth, membrane from interior of skull, skin from foot\ntibia-41\n5cm\nhumerus-35\n3cm\nface bundle wool torn into 3 pieces\nbody wrap brown and white ribbon\nvery coarse linen, 2 layer	b0905756-7c71-4efd-a252-985d9d04f95c	\N	\N	1994-01-01	\N	\N	\N	\N	\N	\N	3	\N	Male		\N	f	f	t		B	A	U	A	\N	\N	t		t	1994C	8,11						\N	\N	\N	\N	\N	\N	\N	\N	\N
8f4a7a62-3cb4-4520-bbe0-58f017ee9dda		0.6	4.2	4.2	3.9	3.9		\N						\N		\N	\N	\N	\N	1-17-97	e42c36c7-23ed-43e6-a3cd-6ad34ec55d89	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	Undetermined		\N	f	f	t		B	U	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
86fe1ad7-2de2-4a4c-bd8c-4bea602c2d2d		3.29	-0.2	-0.48	1.94	2.64		\N						\N		\N	\N	\N	\N	Inside mud brick structure	0547aa4d-57fb-434e-95d7-e126cd92cb8d	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	Undetermined		\N	f	f	t		B	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
65a40ed6-1330-499f-afa6-37971168d464		2.91	0.88	1.34	2.23	2.54		\N						\N		\N	\N	\N	\N	Inside mud brick structure	880f24f0-0dfe-4d83-8d14-27ab9c16e58a	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	\N	Male		\N	f	f	t		H	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
19936c1e-f4b7-4c37-9247-ab15e4e3ecaa		2.84	1.82	2.31	0.63	2.27		\N						\N		\N	\N	\N	\N	Inside mud brick structure	a10e929a-9767-43c8-bb10-7bce15f8f258	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	Undetermined		\N	f	f	f		W	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
38e2e457-f3cc-42a5-a0d9-a4a9d2caa624		2.61	2.06	2.31	-0.34	0.39		\N						\N		\N	\N	\N	\N	Inside mud brick structure	37cb5379-48c1-4f51-8a88-761e89dec9a5	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	Undetermined		\N	f	f	f		B	C	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
9f86380c-2def-4c24-bd9f-d5c68ec8b79e		3.93	0.97	0.97	0	0		\N						\N		\N	\N	\N	\N	Inside mud brick structure	6dbd5db3-5e8b-4b7e-80c1-6fa830136136	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	Undetermined		\N	f	f	f		W	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
bf619cd1-72d9-4541-8f2f-1ed6bf6145df		0.72	1.9	1.82	3.67	3.88		\N						\N		\N	\N	\N	\N		a35e929b-925e-470a-bedd-e4243e8706c9	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	\N	Undetermined		\N	f	f	t		H	C	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
02c1bae1-3c78-435e-b093-7f4bb66434c4		0.98	1.95	1.95	4.15	4.15		\N						\N		\N	\N	\N	\N	Simply a skull	ad0766c9-8b4d-4fbc-98d7-512c7babfceb	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	Undetermined		\N	f	f	t		B	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
569d4a8e-b4f0-4dac-b5a6-c3f3d8c5cb55		1.17	2.18	2.1	2.02	3.93		\N						\N		\N	\N	\N	\N		de9bb57e-792e-4bc0-945f-045b951773a6	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	Undetermined		\N	f	f	t		W	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
6b04eb9b-fafc-4e7b-8896-65f119d844aa		1.36	2.12	2.18	1.64	0.9		\N						\N		\N	\N	\N	\N		6b1554e8-b5ff-44db-9972-c9fda9b1c0db	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	Undetermined		\N	f	f	t		W	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
f4e8db61-1f1d-4918-b9e2-b0436286cf4a		1	1.66	2.02	4.01	5.6		\N						\N		\N	\N	\N	\N		9cbf394c-0139-4afd-adcc-8c3b473d3c0a	\N	\N	\N	\N	\N	\N	\N	\N	\N	16	\N	Undetermined		\N	f	f	t		W	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
0ed624af-870d-4c31-850b-1b97541fa363		1.04	1.83	2.2	4.62	4.62		\N						\N		\N	\N	\N	\N	Body without Head	e957fa46-b3c6-4590-8bc0-4ad2764c8a28	\N	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	Undetermined		\N	f	f	t		W	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
77bad6f7-83e9-4cc6-bb6c-9b132ff056ef		0.5	4.3	0	4.05	0	30+	\N						\N		\N	\N	\N	\N		0268006c-a22e-469b-ac56-3de96bb1d74f	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	Undetermined		\N	f	f	f	bones and skull	B	A	U	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
9b7e5059-3d2c-4852-a5b5-cac31f00286c		0.3	4.5	4.3	2.15	2.54	0-6 month	\N						\N		\N	\N	\N	\N		8fa1fa50-647a-4366-a9b1-ff1460bb7e1e	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	\N	Undetermined		\N	f	f	f	well-wrapped	W	C	S	N	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
c371f31a-dce0-448e-93be-d3b910a66e04		1.4	0.68	0.64	3.48	4.28	4 years	\N				dkbrwn		\N		\N	\N	\N	\N		5e9c9687-e010-4c57-8cbd-87fbe1dda566	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	\N	Undetermined		\N	f	f	f	wrapped	W	C	S	C	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
f7c87022-9283-4e50-a9e2-69b5baf2e2fc		0.9	3.75	3.5	4.76	1.29	25-30	\N						\N		\N	\N	\N	\N		eb3c2d7a-3081-4002-8c93-f282530bc4df	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	\N	Female		\N	f	f	f	well-wrapped	W	A	P	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
6fc6f0e9-86f5-442a-86e6-b8eed0c04414		0.96	3.98	3.72	0.55	1.29	adult	\N						\N		\N	\N	\N	\N		aeb397bf-8bb4-49bb-9414-5d97221d9793	\N	\N	\N	\N	\N	\N	\N	\N	\N	16	\N	Female		\N	f	f	f	bones	B	A	P	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
f4caee4a-56d0-488c-8ee0-8529e47c47ea		1.34	4.05	3.87	3.67	4.36	3 years	\N				brown		\N		\N	\N	\N	\N		f0e62467-902d-4faf-a2a6-8b50e091a513	\N	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	Undetermined		\N	f	f	f	well-wrapped	W	C	S	I	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
9a06a7fe-c541-474f-a61b-c8fb407fbe74		1.39	3.47	3.36	3.74	4.29	9 months	\N						\N		\N	\N	\N	\N		6bfbf798-c94c-46b1-95af-923412b1cca7	\N	\N	\N	\N	\N	\N	\N	\N	\N	18	\N	Undetermined		\N	f	f	f	well-wrapped	W	C	S	N	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
d79adfe0-6285-4a67-afd0-2cc84aef91c3		1.45	3.54	3.31	3.46	4.45	5 years	\N						\N		\N	\N	\N	\N		503781a3-13ff-4c39-9038-cbdf7a42b138	\N	\N	\N	\N	\N	\N	\N	\N	\N	19	\N	Undetermined		\N	f	f	f	well-wrapped	W	C	S	C	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
a6fabf92-c521-4878-99ef-2a0b60c7e4c0		1.77	2.6	2	1.85	3	25-30	\N						\N		\N	\N	\N	\N		aa3637c3-5b49-4970-aceb-648d70def360	\N	\N	\N	\N	\N	\N	\N	\N	\N	21	\N	Female		\N	f	f	f	headless skeleton	B	A	P	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
7dacf040-866b-4e2c-a3d9-31c396126a15		0.71	4.82	4.8	1.87	3.35	30+	\N				dkbrwn		\N		\N	\N	\N	\N		192afbe5-32d2-4257-b0b1-38fab0346ba4	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	Female		\N	f	f	f	wrapped - bones showing	H	A	P	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
29225d55-8598-4b78-b64d-db088fb44eee		1.32	4.5	4.37	3.14	3.51	0-6 months	\N						\N		\N	\N	\N	\N		a35e1df8-7510-4f6c-ba3a-35e1631d93af	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	Undetermined		\N	f	f	f	wrapped - bones showing	H	C	S	N	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
617513eb-1e5b-4a62-b598-0863517c6375		0.66	4.65	4.58	2.46	3.16	9-10 months	\N						\N		\N	\N	\N	\N		a8b52b6c-c39d-418c-a844-bac82f48fc78	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	\N	Undetermined		\N	f	f	f	wrapped - bones showing	H	C	S	N	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
19070647-6e60-4f72-bf7b-28d040a0fe32		2.54	0.89	4.38	2.82	4.08	15-17	\N						\N		\N	\N	\N	\N		e217b83b-1695-4636-922f-7f15baa0398a	\N	\N	\N	\N	\N	\N	\N	\N	\N	29	\N	Female		\N	f	f	f	bones and skull	B	A	P	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
5f4a2b87-a466-4837-8674-bddd03d5073c		0	0	0	0	0		\N						\N		\N	\N	\N	\N	Some Fragments of linen	c5d46c0c-1967-400a-b734-f6daa552f6e5	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	Undetermined		\N	f	f	f		H	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
acb6b86d-6c3d-4df7-b3e7-4026593a7784		0	0	0	0	0		\N						\N		\N	\N	\N	\N	Torn Linen stips for ties	96d174fc-1bf2-41a3-9c10-dcde353cd235	\N	\N	\N	\N	\N	\N	\N	\N	\N	16	\N	Undetermined		\N	f	f	f		B	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
8205774a-f363-40b2-b479-10e01915e178		0	0	0	0	0		\N						\N		\N	\N	\N	\N	Infant with a face bundle\nBody wrapped with small tunic badly damaged\nThere are 2 pieces of purple wool worn into the yellow to create a desifn possibly to sifnify royalty in the next life	f124ea94-6165-4835-a1c5-9aea75f45641	\N	\N	\N	\N	\N	\N	\N	\N	\N	17	\N	Undetermined		\N	f	f	f		W	C	U	I	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
2256d9b8-0d25-46cb-9657-4ca2af1a7172	West	0.9	2.25	2.5	2.9	4.57		\N						\N		\N	\N	\N	\N	Well-wrapped, with lots of reeds with leaves about the head and tied to long reed sticks running the length of the body (beneath it).\nMultiple ribbon wraps running both around and along the body.\nPoorly preserved body, even though wrappings not badly preserved.\nFeet more naturally wrapped with less indication of chemical substance leeching? through foot wrappings\nthe head is slightly more elevated than the feet - about 10 cm	6772833b-f88c-47a6-ba53-92ad8362d5a7	\N	\N	2002-01-01	\N	\N	\N	2002	\N	\N	1	\N	Undetermined		\N	f	f	f	Fair	W	A	U	U	\N	\N	t		f	2002	18						\N	\N	\N	\N	\N	\N	\N	\N	\N
aa0e1141-72b9-41b3-97f7-79938fdd56f5	West	0.76	4.08	4.08	0.12	1.12		\N						\N		\N	\N	\N	\N	Partially disturbed, legs below knees are missing - but reed sticks beneath body continue on where legs were (4 in number)\nCoarse outer layer of textile - ribbons once around body, but only marks remain\nFace bundle - poorly preserved, viscera gone, so chest and abdomen sunken\nNo mandible, but upper teeth all intact - the missing legs ere part of what we observed as plundered burials just above. Why was this part of the cemetary so much more plundered than other areas we have excavated?	2b3f765a-d168-4d29-87ca-bad309dca0f0	\N	\N	2002-01-01	\N	\N	\N	2002	\N	\N	2	\N	Undetermined		\N	f	f	f	Disturbed below knees (?)	W	A	U	U	\N	\N	t		t	2002	20						\N	\N	\N	\N	\N	\N	\N	\N	\N
f8cd32c9-4ddb-45f5-9385-725c0ff9df45	West	1.25	2.98	2.98	3.01	3.83		\N				dark brown		\N		\N	\N	\N	\N	Wrapped with 4 red-stripe ribbons - some hair and skin intact\nDark brown hair - teeth in good condition, child directly on top of #4\nTeeth perfectly white - even more opalescent? than other good samples.\nProtected by stones along the north side - probably for all 4 burials on top of each other	687d4652-4256-426d-816b-7d5174beb7bf	\N	\N	2002-01-01	\N	\N	\N	2002	\N	\N	3	\N	Undetermined		\N	f	f	f		W	C	U	U	\N	\N	t		f	2002	28						\N	\N	\N	\N	\N	\N	\N	\N	\N
c56433ae-cf05-4d8d-bef6-ac2cf163f82d	West	1.32	2.98	2.92	2.88	3.79		\N				Red		\N		\N	\N	\N	\N	Well-wrapped with coarse rough weave linen, but no evidence yet of ribbons,\nstrips of torn linen used as ties - in criss/cross pattern (diamond) - some strips vertical over the face\ndark reddish curly hair\ngirl	aed1875e-cfec-425c-9f99-a3a520c25003	\N	\N	2002-01-01	\N	\N	\N	2002	\N	\N	4	\N	Undetermined		\N	f	f	f		W	C	U	U	\N	\N	f		f	2002	28						\N	\N	\N	\N	\N	\N	\N	\N	\N
d86f44b7-53a1-49fb-bebd-7b45f3dffe29	West	1.37	2.9	2.85	2.29	3.73	18-20 yrs	\N						\N		\N	\N	\N	\N	Just beneath 3 & 4 - head west, but head in distrubed area of disturbed #12\nWell-wrapped with 4 red strand ribbon - some diamond pattern, some simply around, well-preserved from pelvis to feet - poorly preserved above pelvis\nNot a child, symphesis barely joined - pelvic determination of gender	22d3f3f1-397c-4b30-b287-d6ff694983e2	\N	\N	2002-01-01	\N	\N	\N	2002	\N	\N	5	\N	Undetermined		\N	f	f	f		W	A	U	U	\N	\N	t		f	2002	28						\N	\N	\N	\N	\N	\N	\N	\N	\N
8678c99b-81f2-45a8-b8f6-842b7aee9fb7		1.32	2.71	2.73	1.32	1.92		\N						\N		\N	\N	\N	\N		18f2bc11-43d1-40e3-b449-b8febf4b1f94	\N	\N	\N	\N	\N	\N	2002	\N	\N	6	\N	Undetermined		\N	f	f	f		U	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
dd1b2ec4-d2e4-4319-8782-a119f6ace340		1.43	2.9	2.9	2.7	3.85		\N						\N		\N	\N	\N	\N		dbf722ec-0fc9-4dfd-bf83-4be0513ee865	\N	\N	\N	\N	\N	\N	2002	\N	\N	7	\N	Male		\N	f	f	f		U	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
ea8e88ae-79b8-450a-9cae-ce4d1fe98d10		1.2	3.8	3.8	1.5	1.9		\N						\N		\N	\N	\N	\N		c9d25473-f6d0-47a8-9b55-2a096e4e374b	\N	\N	\N	\N	\N	\N	2002	\N	\N	8	\N	Male		\N	f	f	f		U	C	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
ea5cc164-db50-4b08-b00f-8b72d2c82005		1.55	1.76	1.75	3.06	3.46		\N						\N		\N	\N	\N	\N		ec04e986-a1fa-4f98-ba01-0bd4ef8847be	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	Undetermined		\N	f	f	f	CAT!	W	C	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
49a54a9b-20b4-4cc1-a245-fcde9722ebaf		2.02	3.42	3.43	1.53	3.27		\N						\N		\N	\N	\N	\N		8817965f-351d-46b8-97b9-0214602aec23	\N	\N	\N	\N	\N	\N	2002	\N	\N	11	\N	Undetermined		\N	f	f	f		U	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
9f4d8b86-9872-4d2f-b798-1d52cf0282d3		2.29	2.45	2.25	2.85	1.3		\N						\N		\N	\N	\N	\N		94ff7288-c0bd-4a74-a494-f1dfcc77ffaa	\N	\N	\N	\N	\N	\N	2002	\N	\N	12	\N	Male		\N	f	f	f		U	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
f4e1eba2-0549-4743-a627-6cab506aa3e6		0.23	-0.2	0.1	4.57	4.01		\N						\N		\N	\N	\N	\N		f7f79e67-515f-44de-b7cf-aac2cc23eecb	\N	\N	\N	\N	\N	\N	2002	\N	\N	13	\N	Undetermined		\N	f	f	f		U	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
f57688ef-a893-4991-93a9-8bcabf1af6fe		0	0	0	0	0		\N						\N		\N	\N	\N	\N		52db0c4a-cf85-4444-af45-400dbdc646e6	\N	\N	\N	\N	\N	\N	2002	\N	\N	17	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
c6522100-cd59-4361-8bf7-70f22dc88a6e		0	0	0	0	0		\N						\N		\N	\N	\N	\N		fdbd8365-48db-44b6-b63a-5275fab11499	\N	\N	\N	\N	\N	\N	2002	\N	\N	23	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
ba14ff69-f8c6-4ebb-88f7-2d90df4ccb45		0	0	0	0	0		\N						\N		\N	\N	\N	\N		265fa61e-b5ad-4e30-8cd3-c2a0118fee28	\N	\N	\N	\N	\N	\N	2002	\N	\N	24	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
62de807b-3300-4851-ac28-ffeea700a7f0		0	0	0	0	0		\N						\N		\N	\N	\N	\N		7feb2d48-b668-47fe-85e0-005a9bd97ab9	\N	\N	\N	\N	\N	\N	2002	\N	\N	25	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
29db82d5-c32b-451b-b32d-08d20bf3ace8		0	0	0	0	0		\N						\N		\N	\N	\N	\N		08b05b53-9106-49ba-b527-3ea72cb42b69	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
31719ef9-2283-4ded-90a2-86695aae0a51		0	0	0	0	0		\N						\N		\N	\N	\N	\N		36cfcece-abda-493b-b17d-ccfeebcf705d	\N	\N	\N	\N	\N	\N	2002	\N	\N	2	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
208b82f2-344a-45c1-acfb-a72e98a700cc		0	0	0	0	0		\N						\N		\N	\N	\N	\N		add5d58d-f621-43fe-a485-a902534f6d19	\N	\N	\N	\N	\N	\N	2002	\N	\N	3	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
db09d065-be12-4a72-adf8-63ae7b9f1be9		0	0	0	0	0		\N						\N		\N	\N	\N	\N		6221c9fa-f708-4bca-a17c-768c4cc87f1c	\N	\N	\N	\N	\N	\N	2002	\N	\N	4	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
8138639a-8624-4cd2-9c68-88e81e05b1ab		0	0	0	0	0		\N						\N		\N	\N	\N	\N		b439a38f-30e1-4f80-ac40-93513152091e	\N	\N	\N	\N	\N	\N	2002	\N	\N	6	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
f8bcadb7-212e-4c62-a08f-f3619b931d4b		0	0	0	0	0		\N						\N		\N	\N	\N	\N		3692e7a4-495e-4802-9802-70cb7ac63642	\N	\N	\N	\N	\N	\N	2002	\N	\N	8	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
632b8133-96e2-416f-a26e-794bf78d5a08		0	0	0	0	0		\N						\N		\N	\N	\N	\N		35d20e56-97e1-4653-a73f-f5d9321f83d8	\N	\N	\N	\N	\N	\N	2002	\N	\N	10	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
ec4b2d3e-fbec-4029-a058-c0de0aecaabb		0	0	0	0	0		\N						\N		\N	\N	\N	\N		806326b1-2ede-4609-bc8f-5e45120605e9	\N	\N	\N	\N	\N	\N	2002	\N	\N	11	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
2cd6142c-f7cc-4cfb-b045-c565134ed288		0	0	0	0	0		\N						\N		\N	\N	\N	\N		0cf81e48-e6a2-452b-91dc-422899efae75	\N	\N	\N	\N	\N	\N	2002	\N	\N	15	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
8619a17c-d990-4dbf-83ac-391e62892452		0	0	0	0	0		\N						\N		\N	\N	\N	\N		83a04704-f7bb-4928-a07a-71a9d2facde3	\N	\N	\N	\N	\N	\N	2002	\N	\N	16	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
0bddcc4d-1b1b-4533-8378-2013665cd303		0	0	0	0	0		\N						\N		\N	\N	\N	\N		01f4731a-8871-4098-bfe6-7383935c5436	\N	\N	\N	\N	\N	\N	2002	\N	\N	17	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
d9327f6f-acdc-4785-b889-4a34e0a66f27		0	0	0	0	0		\N						\N		\N	\N	\N	\N		a7d5722e-3bf6-47c9-b4f0-74f61f4f99f3	\N	\N	\N	\N	\N	\N	2002	\N	\N	18	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
130b8ceb-43ce-49b8-9976-12dbe505a0a7		0	0	0	0	0		\N						\N		\N	\N	\N	\N		bb23732a-f502-4d1f-8b31-06abb9e2770b	\N	\N	\N	\N	\N	\N	2002	\N	\N	20	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
c10a351f-440c-444f-8730-ea9eba4479e9		0	0	0	0	0		\N						\N		\N	\N	\N	\N		9bf1d249-f01f-4033-81e0-c81e4ddebf7e	\N	\N	\N	\N	\N	\N	2002	\N	\N	21	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
adff9b22-dbd6-43c0-8806-75b4c00d12e5	West	0.1	1.13	1.15	1.6	2.25	6 yrs	\N				U		\N		\N	\N	\N	\N	Large limestone block on south side of burial (large shard protecting south side of head)\nRight foot crossed over left; fingers clenched\nSmall spade-shaped amulet, with stringing extension\n1 earring from right ear	0052173f-a4d1-4766-88e3-433c0a002800	\N	\N	2003-01-01	\N	\N	\N	2002	\N	0.69	1	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	f	Y	f	2003	3						\N	\N	\N	\N	\N	\N	\N	\N	\N
c3fd74ab-069a-4265-8b00-df5412f90aa6		0	0	0	1.7	0		\N						\N		\N	\N	\N	\N	Cloth	45770631-4e09-4494-a7af-cd0082ef2e69	\N	\N	2003-01-01	\N	\N	\N	2002	\N	\N	3	\N			\N	f	f	f						\N	\N	f		f	2003	7						\N	\N	\N	\N	\N	\N	\N	\N	\N
6c63ac92-a28d-427c-89e3-f25d24fc237f	Undefined	0.45	1.75	1.57	3.4	4.95	U	\N				Red/brown		\N		\N	\N	\N	\N	Large burial\nSunken torso/abdomen	fbbfffb5-3c26-49db-a40b-b3378d524a9e	\N	\N	2003-01-01	\N	\N	\N	2002	\N	1.61	4	\N	Undetermined		\N	f	f	f		W	A	U	U	\N	\N	f		f	2003	9						\N	\N	\N	\N	\N	\N	\N	\N	\N
a6931267-c333-4aac-a7a6-9426e9dd9192	West	0.32	2.9	3.37	2.18	3.63	U	\N				U		\N		\N	\N	\N	\N	Rocks to the west of head and south of burial	66069ce9-3f64-4055-af11-3203e7231727	\N	\N	2003-01-01	\N	\N	\N	2002	\N	1.59	5	\N	Undetermined		\N	f	f	f		U	U	U	U	\N	\N	f		f	2003	9						\N	\N	\N	\N	\N	\N	\N	\N	\N
1891a045-f053-4f60-94ea-27238829dcdd	West	0.31	4.16	4.55	1.24	2.54	U	\N				U		\N		\N	\N	\N	\N		6bb847c3-4d1c-40fd-bad4-3d3f02b8aff3	\N	\N	2003-01-01	\N	\N	\N	2002	\N	1.49	6	\N	Undetermined		\N	f	f	f		U	U	U	U	\N	\N	f		f	2003	11						\N	\N	\N	\N	\N	\N	\N	\N	\N
0226e856-58cc-4c54-9a77-6a50266cca13		0.37	3.84	0	1.6	0	U	\N				U		\N		\N	\N	\N	\N		43958405-b5ed-47dd-9a62-7794b6386a2b	\N	\N	2003-01-01	\N	\N	\N	2002	\N	\N	7	\N	Undetermined		\N	f	f	f		U	U	U	U	\N	\N	f		f	2003	11						\N	\N	\N	\N	\N	\N	\N	\N	\N
efb5730b-8756-41f7-89c0-9d580276ccaf	West	0.21	2.27	2.15	1.47	2.6	U	\N				U		\N		\N	\N	\N	\N	Feet missing (measurement taken from ankle)\nBone and bronze hair pins on north\non south side was broken ivory hair pin	77bdfe77-7978-4cdf-815a-58e8be0dc6f5	\N	\N	2003-01-01	\N	\N	\N	2002	\N	1.25	8	\N	Undetermined		\N	f	f	f		H	U	U	U	\N	\N	f	Y	t	2003	11						\N	\N	\N	\N	\N	\N	\N	\N	\N
ca06a4a8-4a35-40df-afd9-f45793cf6dd5	West	0.7	3.1	3.6	-0.3	4	U	\N				U		\N		\N	\N	\N	\N	Only a skeleton and no head (measurements taken from shoulder)\nhands by sides	6e245486-fc26-42bf-aae7-e21d3a82fbe4	\N	\N	2003-01-01	\N	\N	\N	2002	\N	1.55	9	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2003	15						\N	\N	\N	\N	\N	\N	\N	\N	\N
d1652792-0cef-4fc3-b58c-21bb44d01360	West	0.8	3.5	3.5	3.5	5	U	\N				U		\N		\N	\N	\N	\N	Skeleton\nhands by sides	37f9f974-d16d-4ffb-89d0-5d41f17bb92e	\N	\N	2003-01-01	\N	\N	\N	\N	\N	1.5	10	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f	Y	f	2003	15						\N	\N	\N	\N	\N	\N	\N	\N	\N
37c7cb18-234f-4ec8-902a-174f9eb464d3	West	0.9	1	1	2.95	3.7	U	\N				U		\N		\N	\N	\N	\N	Mostly skeleton - coarse textiles at the feet	35169898-ce5f-4faf-b02c-82fd6d36a4fa	\N	\N	2003-01-01	\N	\N	\N	2002	\N	0.85	11	\N	Undetermined		\N	f	f	f		B	C	U	C	\N	\N	f	Y	f	2003	17						\N	\N	\N	\N	\N	\N	\N	\N	\N
86f98998-4fc6-4e75-a6b1-e7d58883351f	West	0.75	4.15	4.7	1.35	2.8	U	\N				U		\N		\N	\N	\N	\N	In disturbed sand\nDressed limestone block with decoration for corners\nLimestone blocks placed vertically with some rope and pottery interspersed	86d5e73e-423b-4e99-9be5-02febe0a11a7	\N	\N	2003-01-01	\N	\N	\N	2002	\N	1.5	12	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2003	17						\N	\N	\N	\N	\N	\N	\N	\N	\N
6a74666b-a7b8-48a3-ae1d-b56ae28a1780	West	0.6	4	4.65	4.8	6	U	\N				U		\N		\N	\N	\N	\N	Red linen cloth with green and yellow design on head protruding into area as shown\nIvory hair pin on the south side of the bead\nThere is a red rib/sash\nInfant out of area removed for access to #13	fb97319a-6f58-4bff-b234-d4b861f40bd0	\N	\N	2003-01-01	\N	\N	\N	2002	\N	1.62	13	\N	Undetermined		\N	f	f	f		H	U	U	U	\N	\N	f	Y	f	2003	19						\N	\N	\N	\N	\N	\N	\N	\N	\N
b628e03a-9c32-4ee2-9078-44571a077790	West	1.2	4.22	3.84	2.42	3.06	U	\N				U		\N		\N	\N	\N	\N	Four child/infant burials  uncovered. Clustered under rocks	dc860300-5582-4e8e-8c22-e042d434fb84	\N	\N	2003-01-01	\N	\N	\N	2002	\N	0.78	14	\N	Undetermined		\N	f	f	f		U	C	U	C	\N	\N	f		f	2003	21						\N	\N	\N	\N	\N	\N	\N	\N	\N
0cc5aaf8-d5e5-4df1-bbd1-d8b093c1811b	West	1.17	4.25	4.25	1.4	2.21	U	\N				U		\N		\N	\N	\N	\N	Same cluster details as above	3920a8fc-e177-478d-8597-b00f2dbf782c	\N	\N	2003-01-01	\N	\N	\N	2002	\N	0.92	15	\N	Undetermined		\N	f	f	f		U	C	U	C	\N	\N	f		f	2003	21						\N	\N	\N	\N	\N	\N	\N	\N	\N
724ddc7a-36d1-4e5a-a581-4bcb1bbfe352	West	1.22	4.26	0.81	1.28	2.78	U	\N				U		\N		\N	\N	\N	\N	Same cluster details as above	d6968327-a785-4958-8d04-0d63d96b69b5	\N	\N	2003-01-01	\N	\N	\N	2002	\N	1.52	16	\N	Undetermined		\N	f	f	f		U	C	U	C	\N	\N	f		f	2003	21						\N	\N	\N	\N	\N	\N	\N	\N	\N
a11a41ec-d1f0-45d9-a427-11ae3b00cffc	West	1.19	4.12	3.84	1.32	2.66	U	\N				U		\N		\N	\N	\N	\N	Same cluster details as above	42517177-2bcb-422b-b279-0982f0594465	\N	\N	2003-01-01	\N	\N	\N	2002	\N	1.54	17	\N	Undetermined		\N	f	f	f		U	C	U	C	\N	\N	f		f	2003	21						\N	\N	\N	\N	\N	\N	\N	\N	\N
6aa8d256-7ae3-466a-aede-216fec33716b	Undefined	1.25	1.68	1.34	1.48	3.04	U	\N				U		\N		\N	\N	\N	\N	Burial to north of row of vertically placed limestones	b6e97417-f584-4b99-9992-21d9031be4b9	\N	\N	2003-01-01	\N	\N	\N	2002	\N	1.68	20	\N	Undetermined		\N	f	f	f		U	U	U	U	\N	\N	f		f	2003	25						\N	\N	\N	\N	\N	\N	\N	\N	\N
596564a6-fc9b-4b82-9820-c34702805857	West	1.37	1.49	1.34	2.34	3.04	U	\N				U		\N		\N	\N	\N	\N	Disturbed burial, disarticulated between two rows of vertically placed limestones	f6e6a0db-0b81-4ddc-9c32-9d722bf30389	\N	\N	2003-01-01	\N	\N	\N	2002	\N	0.81	21	\N	Undetermined		\N	f	f	f	disturbed	B	U	U	U	\N	\N	f		f	2003	25						\N	\N	\N	\N	\N	\N	\N	\N	\N
c12dc8f3-bf2a-4c8f-b23d-6dba3d6b5cff	Undefined	1.6	1.9	0	2.29	0	U	\N				U		\N		\N	\N	\N	\N	Two craniam and assorted humerus and femur with no context	9a1f67d5-97a4-4309-8c41-b21ff660dff0	\N	\N	2003-01-01	\N	\N	\N	2002	\N	\N	22	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2003	27						\N	\N	\N	\N	\N	\N	\N	\N	\N
ced7a3cd-6464-4925-96fe-c66e755a3b07	West	2.5	1.3	1.29	3.96	4.41	U	\N				U		\N		\N	\N	\N	\N	Just below and to the south of shaft in which was burial #19\nBurian in offset chamber\nSkeleton ONLY with no cloth\nNo cranium or feet\nChamber deeper at bottom compared to top	3e07bf32-0dcd-478f-9fea-561734141d03	\N	\N	2003-01-01	\N	\N	\N	2002	\N	0.6	23	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2003	25						\N	\N	\N	\N	\N	\N	\N	\N	\N
d0ccf84a-913d-4944-abbf-ec10734ba5d4	West	1.52	2.44	2.41	3.24	1.83	U	\N				dark brown		\N		\N	\N	\N	\N	Foot bundle well preserved in this burial	8231d1aa-77cb-4c6c-a6e4-65d3a5fc2f14	\N	\N	2003-01-01	\N	\N	\N	2002	\N	1.6	24	\N	Undetermined		\N	f	f	f	well preserved	H	U	U	U	\N	\N	f		f	2003	27						\N	\N	\N	\N	\N	\N	\N	\N	\N
01184f99-afe7-423e-bd01-f0fca0d6b0ec	West	1.72	4.37	4.12	1.4	3.1	U	\N				U		\N		\N	\N	\N	\N	Skeletalized, not much in textiles	4c0ef13b-64d8-4b0b-8fc8-99ba28116bda	\N	\N	2003-01-01	\N	\N	\N	2002	\N	1.75	26	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2003	31						\N	\N	\N	\N	\N	\N	\N	\N	\N
0131b3d3-17e3-4c69-bf76-4e0a0318e44b	West	2	2.94	2.97	2.38	3.9	U	\N				brown-red		\N		\N	\N	\N	\N	Mostly skeletalized	3e69a4ec-b900-4d63-8867-6f151f0c2670	\N	\N	2003-01-01	\N	\N	\N	\N	\N	1.6	27	\N	Undetermined		\N	f	f	f	mostly deteriorated	B	U	U	U	\N	\N	f		f	2003	31						\N	\N	\N	\N	\N	\N	\N	\N	\N
e7db509f-0e03-4e90-b194-81110de2801d	West	2.09	3.74	2.79	1.48	2.78	U	\N				U		\N		\N	\N	\N	\N	Mostly skeletalized	59b3eddd-d0c9-4de3-9056-afde96767771	\N	\N	2003-01-01	\N	\N	\N	\N	\N	1.73	29	\N	Undetermined		\N	f	f	f		B	A	U	A	\N	\N	f		f	2003	35						\N	\N	\N	\N	\N	\N	\N	\N	\N
5d12b04d-96a8-41b5-8afa-2ec243c11268		2.14	-0.2	0	2	0	U	\N				U		\N		\N	\N	\N	\N	Same cluster details as above	0c1d7fed-a6cf-4d3b-9a44-a8ab99553417	\N	\N	2003-01-01	\N	\N	\N	\N	\N	\N	31	\N	Undetermined		\N	f	f	f		U	U	U	U	\N	\N	f		f	2003	35						\N	\N	\N	\N	\N	\N	\N	\N	\N
899b649f-3d7f-48a1-8799-e5b5c663d261		2.14	-0.15	0	2.73	0	U	\N				U		\N		\N	\N	\N	\N	Same cluster details as above	766a035d-df09-461d-b80f-8de8ea100c35	\N	\N	2003-01-01	\N	\N	\N	\N	\N	\N	33	\N	Undetermined		\N	f	f	f		U	U	U	U	\N	\N	f		f	2003	35						\N	\N	\N	\N	\N	\N	\N	\N	\N
a52c566e-5715-4cc0-a91c-b430a17386b2		0	0	0	0	0		\N						\N		\N	\N	\N	\N		6920111a-34d8-452f-bbb1-80d94d8070dd	\N	\N	2010-02-13	\N	\N	\N	2018	\N	\N	7	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
96f9ae68-e5da-4fb2-b542-1715237bfe47		0	0	0	0	0		\N						\N		\N	\N	\N	\N		9e651c3f-550d-4279-bcb4-4258144bb4e8	\N	\N	2013-03-13	\N	\N	\N	2018	\N	\N	51	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
f681f45d-6a43-4c1b-989c-1d7e26e6def8		0	0	0	0	0		\N						\N		\N	\N	\N	\N		6d0c0eff-a973-4590-8bf4-4669b1abf89d	\N	\N	2013-04-13	\N	\N	\N	2018	\N	\N	55	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
68598cbb-d846-488a-9219-cade5ace1b6e		0	0	0	0	0		\N						\N		\N	\N	\N	\N		408a8f79-c90c-42cf-ab77-e730032fe597	\N	\N	2013-05-14	\N	\N	\N	2018	\N	\N	56	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
c915e9da-c5b4-4702-b499-8c4793a21fd8		0	0	0	0	0		\N						\N		\N	\N	\N	\N		0336226a-c06f-4ad3-b0f8-1ac20ef21bcc	\N	\N	2013-06-14	\N	\N	\N	2018	\N	\N	63	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
9ce024e4-b9b3-4cae-8b6a-b97b2e60c032		0	0	0	0	0		\N						\N		\N	\N	\N	\N		dd78dd57-b1a1-4fcd-9441-9b0513695e94	\N	\N	2013-07-14	\N	\N	\N	2018	\N	\N	64	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
30d225c5-77d0-4b55-aa07-aea725ed745b		0	0	0	0	0		\N						\N		\N	\N	\N	\N		4c257b1c-8926-46ef-9720-da0db4d31f3f	\N	\N	2013-08-16	\N	\N	\N	2018	\N	\N	65	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
7abc36ae-0c50-49d5-8fe1-d4ef0cadf643		0	0	0	0	0		\N						\N		\N	\N	\N	\N		e2d71035-0563-48ff-92e8-14749a9b32bd	\N	\N	2013-09-16	\N	\N	\N	2018	\N	\N	66	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
4d7f10ad-ddce-4bc8-9389-8e0720039507		0	0	0	0	0		\N						\N		\N	\N	\N	\N		315651f2-6a8c-4bc2-ad1e-71179ecee239	\N	\N	2013-10-18	\N	\N	\N	2018	\N	\N	73	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
d81f026c-fcbc-44ca-9b31-9d4da6d7f6ac		0	0	0	0	0		\N						\N		\N	\N	\N	\N		4468239b-8ca5-4834-ad5d-286c8e1d43fc	\N	\N	2013-11-20	\N	\N	\N	2018	\N	\N	79	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
2d7adebd-bdd4-47f3-9931-cbc4b81259bb		0.91	2.86	2.69	3.57	4.26	6 years	\N						\N		\N	\N	\N	\N		667e5ccc-cbd0-45c4-b305-4b3451699d09	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	P	C	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
a0086f89-210f-46bc-9038-7fe454a4c653		0.48	0.87	0.94	4.36	3.26	7-10 yrs.	\N				br-red		\N		\N	\N	\N	\N		0def363b-02b7-4bd6-98cf-a2ac5d1c0183	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	Female		\N	f	f	f	well-wrapped	W	C	P	C	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
b6d562aa-0fba-4e9a-9bab-80f88e1d0de4		1	2.91	2.57	2.17	2.88	1 year	\N				blond		\N		\N	\N	\N	\N		49350b44-a9e6-4bf1-bff9-960a3f58fd18	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	Undetermined		\N	f	f	f	wrapped	W	C	P	I	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
9a998a67-8aa7-4120-b5a9-be108eb5642e		1.09	1.59	1.38	1.77	3.38	30+	\N						\N		\N	\N	\N	\N		2c654d45-50f2-41e8-bc0f-b70f4d4c4a8b	\N	\N	\N	\N	\N	\N	\N	\N	\N	16	\N	Female		\N	f	f	f	wrapped	W	A	P	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
d88822bd-946b-465b-b00d-8bf48154a0a2		0.72	4	4.05	0.9	3.35	Infant	\N				brown		\N		\N	\N	\N	\N		712f878b-a0fd-41a4-998b-fc8a8a88a310	\N	\N	\N	\N	\N	\N	\N	\N	\N	18	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	P	I	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
482fe9a2-68dd-40c2-9234-a7afbfb93a99		0.75	2.86	0	0.49	0	Newborn	\N						\N		\N	\N	\N	\N		cf65580e-668e-4a34-9a57-5f834491f1c5	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	Undetermined		\N	f	f	f	poorly preserved	B	C	S	N	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
d0b60847-7527-4f5b-90d3-f1badff9d0d9		0.9	0.61	0.16	3.26	4.55	20 years?	\N						\N		\N	\N	\N	\N		13f26764-0c82-429c-8022-577f869dc131	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	Female		\N	f	f	f	Body only	B	A	P	A	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
b70ecdf8-d4fb-4c4e-953e-d9690fbdb84c		1.26	1.84	1.67	0.37	0.92	0-6 months	\N						\N		\N	\N	\N	\N		28f17316-9a76-4087-a832-a01b4748ec2e	\N	\N	\N	\N	\N	\N	\N	\N	\N	40	\N	Undetermined		\N	f	f	f	wrapped - bones showing	H	C	P	N	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
474242c0-1aa2-4abf-a5cf-e10c903443be		1.3	1.75	1.48	4.93	4.38	0-6 months	\N						\N		\N	\N	\N	\N		d0935828-dbaa-4f11-b17b-6b5371397c17	\N	\N	\N	\N	\N	\N	\N	\N	\N	43	\N	Undetermined		\N	f	f	f	wrapped	W	C	P	N	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
a523f804-9c43-4c3d-b370-0e59e53221d2		2.15	2.08	1.81	1.27	1.94	7 years	\N				ltbrwn		\N		\N	\N	\N	\N		97982707-bf5a-4fe1-970d-82134150e8d8	\N	\N	\N	\N	\N	\N	\N	\N	\N	44	\N	Undetermined		\N	f	f	f	bones and skull	B	C	P	C	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
a8083231-dcab-497e-a58d-87c9c8801862		1.97	3.6	3.61	1.91	1.35	6 years	\N				blond		\N		\N	\N	\N	\N		6125b84c-64e2-40fb-b947-263caf66199b	\N	\N	\N	\N	\N	\N	\N	\N	\N	45	\N	Female		\N	f	f	f	SKELETON	B	C	P	C	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
56ea77c8-7fd1-4a34-89b5-1d910789fddb		1.5	1.5	0	1.44	0	Newborn	\N						\N		\N	\N	\N	\N		256cd0a5-ff9d-40d4-a7c9-5489ae53ff41	\N	\N	\N	\N	\N	\N	\N	\N	\N	48	\N	Undetermined		\N	f	f	f	bones and skull	B	C	S	N	\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
c635aa9c-83db-47f2-afc3-b5465421f34c	West	0.4	2.29	2.7	2.35	2.95	U	\N				brown		\N		\N	\N	\N	\N	curly brown hair	f0749848-6fa8-48e8-a4d2-5c53b55d08f4	\N	\N	2009-01-01	\N	\N	\N	2018	\N	0.8	1	\N	Undetermined		\N	f	f	f	poor	B	C	U	C	\N	\N	t		t	2009	9						\N	\N	\N	\N	\N	\N	\N	\N	\N
25cce8a1-78a2-48d2-be1f-0a09234c4c45	West	0.6	2.29	3.1	2.6	4.09	U	\N				blonde		\N		\N	\N	\N	\N	big adult\nthick blonde beard and blonde curly hair\n5 reed sticks placed below and along the body for support, reed sticks about 150 cm long\n2 layers of textiles	a93127a0-d9e3-401d-8aef-57060cfa572d	\N	\N	2009-01-01	\N	\N	\N	\N	\N	1.75	2	\N	Undetermined		\N	f	f	f	poor	H	A	U	A	\N	\N	t		f	2009	13						\N	\N	\N	\N	\N	\N	\N	\N	\N
679b4c81-66ed-4d90-afb9-39ee53748cb6	West	0.55	1.9	2.2	2.31	2.76	U	\N						\N		\N	\N	\N	\N	burial of a baby-small child\ncoarse linen wrap - only small remains of beg fiber\nrobe ties	46a28a82-70ee-4420-af04-05a9c1363eaf	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.56	3	\N	Undetermined		\N	f	f	f	basket-case	B	C	U	I	\N	\N	t		f	2009	15						\N	\N	\N	\N	\N	\N	\N	\N	\N
e8123f56-3492-4486-af73-9438e4f3643f	West	0.7	1.45	1.6	2.2	3.05	U	\N						\N		\N	\N	\N	\N	small drinking cup placed to south of head, also limestone block at south of reed	9f9c5e42-2ef0-4432-bebb-c47fa78ee058	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.9	5	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	t		f	2009	19						\N	\N	\N	\N	\N	\N	\N	\N	\N
d0e16842-f60e-40a9-83a1-b776b176bbe1	West	0.75	1.95	2.7	4.45	5.75	U	\N						\N		\N	\N	\N	\N	cluster burial with 9 and 10\nface bundle with ribbons over fine white linen\nskeletalized legs showing through shroud\nfeet bones appear to be bent upward so legs come to a point	644aab3a-5d70-425d-8f0b-c1a37c592f68	\N	\N	2009-01-01	\N	\N	\N	\N	\N	1.6	8	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	t		t	2009	23						\N	\N	\N	\N	\N	\N	\N	\N	\N
7d1cf597-62cc-4331-805f-9bde43bc6237	West	1.02	2.7	2.65	3.6	4.32	U	\N				blonde		\N		\N	\N	\N	\N	child burial, skull crushed by workers before it was exposed\nBlonde hair showing on skull\nTypical child burial, but the head of #13 was at the ankles on the north side of #12	3512f2ab-989e-4cc3-a8ea-8fe30be9c979	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.8	12	\N	Undetermined		\N	f	f	f		U	C	U	C	\N	\N	t		f	2009	29						\N	\N	\N	\N	\N	\N	\N	\N	\N
def83317-5905-4f47-a253-90670a593805	West	1.05	3.17	3.12	4	4.88	U	\N						\N		\N	\N	\N	\N	cluster is directly north of #9 which is a part of a cluster of 4 adult burials	fd19779b-3b3e-478c-b30f-5be618250664	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.96	13	\N	Undetermined		\N	f	f	f		U	C	U	U	\N	\N	t		f	2009	31						\N	\N	\N	\N	\N	\N	\N	\N	\N
d549acc3-aad2-4661-9a35-a2fe01d623e7		0.95	2.97	2.97	4.7	4.7	U	\N						\N		\N	\N	\N	\N	appears to be skull only placed on the body of #15	ca6d513a-4481-4758-b40a-842fe33b769e	\N	\N	2009-01-01	\N	\N	\N	\N	\N	\N	14	\N	Undetermined		\N	f	f	f		U	C	U	U	\N	\N	t		f	2009	33						\N	\N	\N	\N	\N	\N	\N	\N	\N
6ee8ce85-3bef-4ba2-856b-c685b78a1287	West	1.05	2.97	2.93	4.3	4.9	U	\N						\N		\N	\N	\N	\N	coarse wrapping tied with torn strips as ribbon	48de830f-1f85-46b4-8697-96a61d7079b9	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.75	15	\N	Undetermined		\N	f	f	f		H	C	U	C	\N	\N	t		f	2009	35						\N	\N	\N	\N	\N	\N	\N	\N	\N
1e1d6648-8c80-42bb-a1ee-9b51155eb4b9	West	1.14	3.3	3.6	4.34	5.35	U	\N				brown		\N		\N	\N	\N	\N	7 limestone flat rocks bordering the group burial\nwhite linen shroud wrapped with torn linen strips used as "ribbon"	7b272807-1b65-4eb8-b569-cc1a171a1915	\N	\N	2009-01-01	\N	\N	\N	\N	\N	1	16	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	t		t	2009	35						\N	\N	\N	\N	\N	\N	\N	\N	\N
630e5326-fac6-42fd-be87-a111ccfbb577	West	0.4	0.1	0.2	2.9	3.45	U	\N				light brown		\N		\N	\N	\N	\N	found half of a faiena bead and wooden peg\nsome skin on skull and feet\nblonde-light brown hair\nskeletized child burial	82b7f175-3934-4ba2-9f50-401536ff7418	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.65	18	\N	Undetermined		\N	f	f	f		B	C	U	U	\N	\N	t		f	2009	39						\N	\N	\N	\N	\N	\N	\N	\N	\N
85af239f-9617-4413-82d0-950ac08871fc	West	1.1	2.45	2.45	1.35	1.85	U	\N						\N		\N	\N	\N	\N	infant burial - no details\nno structural integrity\ntwo front teeth barely erupting\nother baby teeth in mandible	e12831ed-e090-46d9-b104-6a1751acebb0	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.55	19	\N	Undetermined		\N	f	f	f		H	C	U	I	\N	\N	t		f	2009	41						\N	\N	\N	\N	\N	\N	\N	\N	\N
16e16781-eaca-4543-a305-6acb70b75b24	West	1.1	2.25	2.29	2.54	3.3	U	\N				brown		\N		\N	\N	\N	\N	red ribbon nicely wrapped and only visible on feeT and leg area\nshroud=white weft faced linen	2470597a-c77b-4346-ab1a-c300b09ea17f	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.75	20	\N	Undetermined		\N	f	f	f		W	U	U	U	\N	\N	t		f	2009	41						\N	\N	\N	\N	\N	\N	\N	\N	\N
7a6c538e-7be0-46f0-93cf-63fb94cfd6b2	West	1.18	3.38	3.75	3.45	5.29	U	\N						\N		\N	\N	\N	\N	Between the legs is a baby with a full rib cage, spinal chord, and pelvis but no head\nWrapped with ribbon over ribbon	74ff196a-6da4-4459-a4b1-673dddbcfab1	\N	\N	2009-01-01	\N	\N	\N	\N	\N	1.72	23	\N	Undetermined		\N	f	f	f		W	U	U	U	\N	\N	t		t	2009	45						\N	\N	\N	\N	\N	\N	\N	\N	\N
8202e0e3-a97b-4acb-8d04-8001f94e7253	West	0.8	0.35	0.55	4.17	4.82	U	\N						\N		\N	\N	\N	\N	Buried with an adult(24) Head is at the shoulder of #24, also buried with a child(21)	acf4d03c-a101-4c2b-8396-f4e9431e9820	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.67	25	\N	Undetermined		\N	f	f	f	badly preserved	U	C	U	C	\N	\N	t		f	2009	47						\N	\N	\N	\N	\N	\N	\N	\N	\N
4a8af4d1-bdee-44df-8eeb-8f5713e01218	West	0.45	0.25	0.4	2.65	3.6	U	\N						\N		\N	\N	\N	\N	Picture	e4485f5b-a530-4287-b78d-a8ed55a3c8d5	\N	\N	2009-01-01	\N	\N	\N	\N	\N	1.07	26	\N	Undetermined		\N	f	f	f		U	A	U	A	\N	\N	t		f	2009	49						\N	\N	\N	\N	\N	\N	\N	\N	\N
211df498-0add-48c0-b36b-5d8e38f72296	West	0.85	4.9	4.8	2.65	3.45	U	\N						\N		\N	\N	\N	\N	Potsherds to side and below burials are mid 4th century	4416c0a3-ad65-4d01-a1c8-6de4abbc5454	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.83	27	\N	Undetermined		\N	f	f	f		U	C	U	I	\N	\N	t		f	2009	50						\N	\N	\N	\N	\N	\N	\N	\N	\N
110eec39-5c91-4eb3-bf62-cfbac9f6a3a5	West	0.95	4.75	4.82	2.7	3.4	U	\N						\N		\N	\N	\N	\N	Baby buried on top of (28,29,30)	a4b4ec36-7352-4028-bc75-9feaea7186bd	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.7	28	\N	Undetermined		\N	f	f	f		U	C	U	I	\N	\N	t		f	2009	50						\N	\N	\N	\N	\N	\N	\N	\N	\N
a4fe79cf-a6ce-4a92-ad07-042c20c9255a		1.35	2.2	2.2	0.4	0.4	U	\N						\N		\N	\N	\N	\N	Headless baby buried on top of #23	84a7b1ef-7ec4-4064-a7f6-144a842ec720	\N	\N	\N	\N	\N	\N	\N	\N	\N	31	\N	Undetermined		\N	f	f	f		B	C	U	N	\N	\N	t		f	2009	45						\N	\N	\N	\N	\N	\N	\N	\N	\N
d79feccc-7b9a-4c5b-b2a5-54eb5903dc2b	West	1.1	3.24	3.3	0.52	1.22	U	\N						\N		\N	\N	\N	\N	Skeletalized Baby	c0774887-82e3-480c-8e16-9976dbc85284	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.78	32	\N	Undetermined		\N	f	f	f		U	C	U	I	\N	\N	t		f	2009	55						\N	\N	\N	\N	\N	\N	\N	\N	\N
9b3331dc-96a4-4e24-84d8-2d582d57a4d8	West	0.9	1.95	1.95	2.35	3.7	U	\N						\N		\N	\N	\N	\N	Is a sub adult\nAlso has a bundle of hair and 2 partial faience beads	5c502399-b717-4a0a-a790-3fe5c1e95672	\N	\N	2009-01-01	\N	\N	\N	\N	\N	1.5	34	\N	Undetermined		\N	f	f	f		H	A	U	A	\N	\N	t		f	2009	57						\N	\N	\N	\N	\N	\N	\N	\N	\N
cac5214d-3f55-4cb9-b221-7eb0d9b1b109	West	1.22	1.6	1.45	2.75	3.5	U	\N				brown		\N		\N	\N	\N	\N	Is a child atop of an adult (#36)\nNo r-w at head	9d8d4ed4-feeb-4f4e-8e9f-90f84179ed00	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.76	35	\N	Undetermined		\N	f	f	f	fair	H	C	U	C	\N	\N	t		t	2009	59						\N	\N	\N	\N	\N	\N	\N	\N	\N
9b458e51-e115-4b81-b496-80c0da444490	West	1.14	1.62	1.75	2.35	3.83	U	\N						\N		\N	\N	\N	\N	An adult with #35 atop it at chest\nwell-wrapped - ribbon over in square design\nface bundle\nLying on top of #39	b5055830-cd97-4973-b30e-b290f0efa599	\N	\N	2009-01-01	\N	\N	\N	\N	\N	1.55	36	\N	Undetermined		\N	f	f	f	fair	W	A	U	A	\N	\N	t		t	2009	59						\N	\N	\N	\N	\N	\N	\N	\N	\N
249cf9aa-898b-4f8d-9ae1-2c61ac2f1440	West	1.25	1.63	1.8	3.15	3.8	U	\N						\N		\N	\N	\N	\N	A baby (infant) wrapped and covered with torn linen strips	05e2639e-f5ab-41ef-98a7-14a2a82058e6	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.75	37	\N	Undetermined		\N	f	f	f		H	C	U	I	\N	\N	t		f	2009	59						\N	\N	\N	\N	\N	\N	\N	\N	\N
62d92ab0-7e0b-45cd-a5b2-e3093cafaf21	West	1.45	2.25	2.25	2.6	3.3	U	\N						\N		\N	\N	\N	\N	Very nice purple patch placed on right eye	c6a12db1-644c-4258-86ef-24381a94edee	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.82	38	\N	Undetermined		\N	f	f	f		H	C	U	C	\N	\N	t		f	2009	59						\N	\N	\N	\N	\N	\N	\N	\N	\N
541a5fbd-c591-4d99-932f-3fc0a879e18b	West	1.45	1.6	1.71	2.2	3.8	U	\N						\N		\N	\N	\N	\N	Face bundle\n"Typical" ribbon cross crossing the body over a coarse white shroad	94c92a14-5f50-4545-9943-ed5310058e1e	\N	\N	2009-01-01	\N	\N	\N	\N	\N	1.7	39	\N	Undetermined		\N	f	f	f		W	U	U	U	\N	\N	t		t	2009	59						\N	\N	\N	\N	\N	\N	\N	\N	\N
f26a2acb-d534-4f21-b9c5-f0cf2622b0d5	West	1.24	4.47	4.45	2.7	3.38	U	\N						\N		\N	\N	\N	\N	No head\nNo immediate explanation for missing head (extra skull on 14-15 cluster too face removed to make much sense.\nbelow #28	2ac619ac-f651-4761-bcfc-18cea7c1fb60	\N	\N	2009-01-01	\N	\N	\N	\N	\N	1.24	40	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	t		f	2009	57?						\N	\N	\N	\N	\N	\N	\N	\N	\N
f44d9fd6-ed42-4e4c-8188-85b9ec560da5	West	1.13	4.75	4.74	2.52	3.4	U	\N				Brown		\N		\N	\N	\N	\N	Deteriorated\nSome rope over head\nSkull exposed\nPalm fiber rope over 2nd layer of shroud - palm sticks for support of body	dd44df8a-a852-4f31-8a64-5073b4560a1b	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.85	41	\N	Undetermined		\N	f	f	f		B	C	U	C	\N	\N	t		f	2009	61						\N	\N	\N	\N	\N	\N	\N	\N	\N
e56d806f-0d4e-4d9b-aac3-328a625e6646	West	1.75	3.5	3.33	2.31	3.1	U	\N						\N		\N	\N	\N	\N	Directly to the south of #42\nSmall wooden sticks with burial	c26bef4f-a9a7-4f94-9e46-624179e4b5c1	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.8	43	\N	Undetermined		\N	f	f	f		H	C	U	C	\N	\N	t		f	2009	63						\N	\N	\N	\N	\N	\N	\N	\N	\N
a64779f9-b256-4024-9216-6bb0e5a8cb52	West	1.45	3.1	3	0.9	1.4	U	\N						\N		\N	\N	\N	\N	Cluster burial with another child #48 laying beside an adult #45\nWith yellow and orange thread in material	612f4d11-e7ed-43c3-999a-8725fe958465	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.5	44	\N	Undetermined		\N	f	f	f		W	C	U	I	\N	\N	t		f	2009	65						\N	\N	\N	\N	\N	\N	\N	\N	\N
32335e23-b1bb-4c1c-a683-c2443674eef0	East	1.5	2.95	2.95	4.05	3.55	<1	\N						\N		\N	\N	\N	\N	Infant burial\nIN ITS OWN SMALL SHAFT\nfine basket weave\nYellow green wool found next to the right side\nIs in the bottom of the shaft\nreached gebble\nblack and carbon on upper side of shaft, now found to be limestone racks covered in mud	6fcc1dfb-16fb-42aa-b43c-594ebb5888f6	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.51	46	\N	Undetermined		\N	f	f	f	Badly Deteriorated	B	C	U	I	\N	\N	t		f	2009	69						\N	\N	\N	\N	\N	\N	\N	\N	\N
6177b098-4903-4958-8b0d-5e9d69adb51f	West	1.21	3.16	3.22	0.67	0.8	U	\N						\N		\N	\N	\N	\N	Tiny baby in a cluster burial (one adult (#45) and two other children (#44&48))	cddc4d4c-1623-438b-a2f8-31b7dc4bdaf4	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.23	47	\N	Undetermined		\N	f	f	f		W	C	U	N	\N	\N	t		f	2009	71						\N	\N	\N	\N	\N	\N	\N	\N	\N
1c6ad080-3836-4603-8941-b1e4e9cdaab9	West	1.13	2.97	2.99	0.25	0.75	U	\N						\N		\N	\N	\N	\N	Cluster burial	1a515fb4-52d7-4d02-8060-bc0399a7a27b	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.52	48	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	t		f	2009	71						\N	\N	\N	\N	\N	\N	\N	\N	\N
cb8da6ff-ea8b-4eb6-aa13-ec210895056f	West	1.7	1	0.9	2.2	2.9	U	\N						\N		\N	\N	\N	\N	Cluster burial with another child and adult #51 and #52 respectively	0dc96874-9e30-41d1-b80a-6b39d019a67b	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.75	50	\N	Undetermined		\N	f	f	f		U	U	U	U	\N	\N	t		f	2009	77						\N	\N	\N	\N	\N	\N	\N	\N	\N
be70a276-b236-4fbb-8800-bbc3e22d64bb	West	2.5	2.1	2	2.25	3.3	U	\N				Brown		\N		\N	\N	\N	\N	Cluster burial with two children #50 and #51\nA layer of limestone slabs were put on a shell in the shaft	fe6e3834-1c7c-40f8-a9ae-5830c0d72a82	\N	\N	2009-01-01	\N	\N	\N	\N	\N	1	52	\N	Undetermined		\N	f	f	f	poor	B	A	U	A	\N	\N	t		f	2009	79						\N	\N	\N	\N	\N	\N	\N	\N	\N
19231034-a24e-4eaa-9799-7dee942700cc	West	1.2	2.67	2.82	0.24	0.85	U	\N						\N		\N	\N	\N	\N	Purple wool	d1b60c03-5f25-4c73-b926-33d91df56daf	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.68	53	\N	Undetermined		\N	f	f	f	poor	B	C	U	C	\N	\N	t		f	2009	79						\N	\N	\N	\N	\N	\N	\N	\N	\N
8faba50f-f94f-4816-9ad9-962e283ef4cc	West	1.8	2.35	2.45	1.1	1.8	U	\N						\N		\N	\N	\N	\N	Once wrapped but badly deteriorated	4727200b-0626-4668-8323-fd4c7175040c	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.8	55	\N	Undetermined		\N	f	f	f	poor	B	C	U	C	\N	\N	t		f	2009	83						\N	\N	\N	\N	\N	\N	\N	\N	\N
7955dc3f-6c50-4a41-9d7c-7cf8793730fe	West	0.7	0.2	0.45	0.4	1.14	U	\N						\N		\N	\N	\N	\N	headless - measured from shoulders to feet\nfound with #'s 57,60 58, and 59\nVeg fiber rope around body in mostly horizontal pattern\ntaken out on a board	d3d6a829-d90d-4d3e-a70b-78b23898f232	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.8	56	\N	Undetermined		\N	f	f	f	fair	H	A	U	A	\N	\N	t		f	2009	85						\N	\N	\N	\N	\N	\N	\N	\N	\N
8dc235ad-ccb0-44c4-bbf7-e79cbe84a014	West	0.7	0.28	0.5	0.26	1.4	U	\N						\N		\N	\N	\N	\N	Cluster burial with #'s 56,60,58,59\nSub adult\nwith yellowish shroud and ? ribbion ties	bb36f3b7-f3d2-47bf-b323-ab08398d96c4	\N	\N	2009-01-01	\N	\N	\N	\N	\N	1.12	57	\N	Undetermined		\N	f	f	f		U	A	U	C	\N	\N	t		f	2009	87						\N	\N	\N	\N	\N	\N	\N	\N	\N
dfdf58db-d992-4b17-a4f3-5a1246497d96	West	0.9	-0.15	-0.16	0.54	1.17	U	\N						\N		\N	\N	\N	\N	Cluster burial with #'s 56,57,59,60\nDirectly over #59\nout of area to south\ntaken out in a basket	728c859b-02ff-47b0-ab12-abe4c2118961	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.61	58	\N	Undetermined		\N	f	f	f		W	C	U	I	\N	\N	t		f	2009	87						\N	\N	\N	\N	\N	\N	\N	\N	\N
f3f1e748-e4ad-4a53-b553-baa3ec8a840a	West	1.12	-0.22	-0.26	0.46	1.03	U	\N						\N		\N	\N	\N	\N	Cluster burial\nTaken out on a board\nVegetable fiber ties, but outer layer is basket weave linen\nTies are in a diagonal pattern\nOut of area to south	a4e4253e-cf28-42e8-b872-2ee26391e67a	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.55	59	\N	Undetermined		\N	f	f	f		W	C	U	I	\N	\N	t		f	2009	89						\N	\N	\N	\N	\N	\N	\N	\N	\N
3c27307c-83f8-4b64-9da8-377646dc003c	East	2.04	1.05	1.1	2	1	U	\N						\N		\N	\N	\N	\N	Top half entirely missing, only feet and pelvis	a534e686-a6cb-4152-be0a-ab7e49ee8b85	\N	\N	2009-01-01	\N	\N	\N	\N	\N	2.04	61	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	t		f	2009	91						\N	\N	\N	\N	\N	\N	\N	\N	\N
cd76878f-3bb5-412f-a936-cf3bce5554b3	East	2.35	0.8	0.8	3.4	2.5	U	\N						\N		\N	\N	\N	\N	REVERSAL skeletalized\nno feet	11d15671-25ed-484b-860c-6c8c3d0ed4a9	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.95	63	\N	Undetermined		\N	f	f	f		B	C	U	A	\N	\N	t		f	2009	93						\N	\N	\N	\N	\N	\N	\N	\N	\N
029b3482-b75c-4abf-9f2e-4a17dffb4e1e	East	1.95	3.9	3.93	2.25	1.8	U	\N						\N		\N	\N	\N	\N	Infant Head East\nReversal	ae02bccf-b643-4dc3-81ce-91bb2d21d75e	\N	\N	2009-01-01	\N	\N	\N	\N	\N	0.5	64	\N	Undetermined		\N	f	f	f		B	C	U	I	\N	\N	t		f	2009	95						\N	\N	\N	\N	\N	\N	\N	\N	\N
a620ef83-395e-401f-8e06-9078bb563338	East	2.06	1.45	1.5	1.6	0.6	U	\N						\N		\N	\N	\N	\N	Reversal	1be469c6-3acd-4e38-989f-6ea5029258f1	\N	\N	2009-01-01	\N	\N	\N	\N	\N	1.05	65	\N	Undetermined		\N	f	f	f		B	C	U	A	\N	\N	t		f	2009	97						\N	\N	\N	\N	\N	\N	\N	\N	\N
96bd7bd2-81f2-4096-8b30-e53272a679b9	West	1.02	1.34	0.98	0.13	1.35	U	\N						\N		\N	\N	\N	\N	Head missing\nSome hair\nWrapped in course linen	ae4aa29c-6788-4925-b6d8-78546cb503d7	\N	\N	2007-01-01	\N	\N	\N	2007	\N	1.3	1	\N	Undetermined		\N	f	f	f		W	U	U	U	\N	\N	f		f	2007	16						\N	\N	\N	\N	\N	\N	\N	\N	\N
c069106b-b57e-49b2-95cc-592ee0784fa9	West	1.05	2.04	1.93	-0.33	1.02	U	\N						\N		\N	\N	\N	\N	Outer linen wrap, w/ coarse weave w/ strips torn and folded in diagonal pattern (crisscross)	8eae459a-f5cf-44b2-b8b6-8ffa7c7d3bb1	\N	\N	2007-01-01	\N	\N	\N	2007	\N	1.62	3	\N	Undetermined		\N	f	f	f		W	U	U	U	\N	\N	f		f	2007	18						\N	\N	\N	\N	\N	\N	\N	\N	\N
2bfa0f81-469b-438f-97db-d3ed41d18fdc	West	1.05	2.46	2.41	-0.45	1.14	U	\N						\N		\N	\N	\N	\N	Directly under burial #2 with red ribbon and face bundle	0e47ad3e-3d1e-44af-974e-d4aa87a608e1	\N	\N	2007-01-01	\N	\N	\N	2006	\N	1.68	4	\N	Undetermined		\N	f	f	f		U	U	U	U	\N	\N	f		f	2007	18						\N	\N	\N	\N	\N	\N	\N	\N	\N
1c7493eb-04f5-4e1b-876b-1c7ee3abf20d	East	1.46	1.83	2.21	-1.08	0.3	U	\N				Blonde		\N		\N	\N	\N	\N	Reversed burial	5a521821-bc0a-406f-811c-a9dd64406dd7	\N	\N	2007-01-01	\N	\N	\N	2006	\N	1.5	5	\N	Undetermined		\N	f	f	f		H	U	U	U	\N	\N	f		f	2007	24						\N	\N	\N	\N	\N	\N	\N	\N	\N
d708a984-0808-4d6c-adfb-2977c8da2a30	Undefined	1.7	2.16	2.18	4.74	4.7	U	\N						\N		\N	\N	\N	\N	Deterioated fabric fragments	a3004077-b3f6-480c-8a42-e9f9842e6381	\N	\N	2007-01-01	\N	\N	\N	2006	\N	0.65	6	\N	Undetermined		\N	f	f	f		H	U	U	U	\N	\N	f		f	2007	34						\N	\N	\N	\N	\N	\N	\N	\N	\N
39b81aff-5175-4929-a135-e96e21ece447	East	1.7	3	3.1	3.2	0.95	U	\N						\N		\N	\N	\N	\N	Sub adult	5375548a-f052-42e1-8ae0-0b3e228a2a1f	\N	\N	2007-01-01	\N	\N	\N	2006	\N	0.9	8	\N	Undetermined		\N	f	f	f		B	A	U	A	\N	\N	f		f	2007	40						\N	\N	\N	\N	\N	\N	\N	\N	\N
a2906a78-f47f-409c-9fb1-e2032b389645	East	2.29	3.25	3.1	2.47	0.37	U	\N						\N		\N	\N	\N	\N	Reversal - Skeletal\nIs on a direct west/east line with feet directly under the center stake	65089786-47f0-44ec-b62e-f3faa96d67e2	\N	\N	2007-01-01	\N	\N	\N	2006	\N	1.61	9	\N	Undetermined		\N	f	f	f		U	U	U	U	\N	\N	f		f	2007	58						\N	\N	\N	\N	\N	\N	\N	\N	\N
1614decb-4531-493d-a4db-303378f74fba		0.45	4.29	5	3.5	5	U	\N						\N		\N	\N	\N	\N	Cluster burial with burials# 9 and 13\nBysantine mid 4th century\nPottery shard under right\nFace Bundle\nExcess red ribbon on feet\nSticks under burial	f181b9e8-4578-447f-b121-cb440a7c2c60	\N	\N	\N	\N	\N	\N	2006	\N	\N	10	\N	Undetermined		\N	f	f	f	good	W	A	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
28508447-4e08-4ca7-85a7-a6e12387057d		2.25	1.91	1.83	2.39	4	U	\N						\N		\N	\N	\N	\N	Came from a double chamber burial on the north side\nLaying next to burial #12 on the north\nThere is a reed matting on the chamber\nfine strips of palm matting 2-4mm wide woven\nBody is wrapped with fine linen outer shroud overwrapped with red/white ribbon\nsmall reeds held together by fiber rope lying alongside edge of burial\nHead wrapping is unstructured perhaps due to lack of head- like a wad of cloth\nbrown red thread giving stiching in some edges and mayber for decoration\nRed border with design	18deba23-60d4-44a4-9d44-eb7345c2b340	\N	\N	\N	\N	\N	\N	2006	\N	\N	11	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
2fc201c6-fade-4be3-84c9-815f71cbf663	West	0.86	3.09	3.03	2	2.57	U	\N						\N		\N	\N	\N	\N	same details as above	fdb00ce3-70b5-4c56-afc5-f8649340da25	\N	\N	2005-01-01	\N	\N	\N	2005	\N	0.7	12	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	f		f	2005	51						\N	\N	\N	\N	\N	\N	\N	\N	\N
b5ecfe80-378f-4e53-9ad7-742ce8e121e6		1.73	1.07	1.12	2.09	3.65	U	\N						\N		\N	\N	\N	\N	Length is from feet to shoulders\nA very fine linen with 3cm design in linen on south side\n2 layers of coarse and fine hemmed together on one edge perhaps as a face covering	d0ad4a18-ad32-4954-9b85-19d1380a4787	\N	\N	\N	\N	\N	\N	2006	\N	\N	12	\N	Undetermined		\N	f	f	f	fair	H	A	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
447d2d5a-6e71-4ec1-a23d-bc2a775c3735		0.55	4.47	5.3	4.4	5.95	U	\N						\N		\N	\N	\N	\N	Cluster burial with burials# 9 and 10	8d25cdfc-4fd7-4e2d-9a32-a384cac40ed8	\N	\N	\N	\N	\N	\N	2006	\N	\N	13	\N	Undetermined		\N	f	f	f	fair	H	A	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
f9f1adad-fb30-4f46-a9b3-1ef623aae1ed		1.6	1	1.1	2.1	3.6	U	\N						\N		\N	\N	\N	\N	Buried beneath burial#12 in south side of double chamber	0b310e29-5788-4595-bc90-4f33f5ca7e63	\N	\N	\N	\N	\N	\N	2006	\N	\N	14	\N	Undetermined		\N	f	f	f		B	A	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
1ca98e06-1782-4b18-b9f7-c474028cc988		1.6	0.75	0.96	2.15	3.75	U	\N						\N		\N	\N	\N	\N	Buried beneath burial #12 and buried next to burial#14 on the south side	16626615-6872-4f57-9fd5-310bcdae2f3d	\N	\N	\N	\N	\N	\N	2006	\N	\N	15	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
cf663035-a8a4-4776-a8b1-c56b224ebcf7		0.75	5	4.84	3.5	5.09	U	\N						\N		\N	\N	\N	\N	Cluster burial with another adult (burial#18) and also a child (burial#17)	0c49b137-7284-481a-b2e1-a0b265fa3d92	\N	\N	\N	\N	\N	\N	2006	\N	\N	16	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
c26d21b9-f22b-4876-b7c4-6b8d0235765f		0.83	4.8	4.75	3.55	4.2	U	\N						\N		\N	\N	\N	\N	Child buried with two adults (burials# 16& 17), Child is laying upon both adults	7726abee-b1a3-43ea-8cf9-13090e4a58dc	\N	\N	\N	\N	\N	\N	2006	\N	\N	17	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
3b349c82-7391-43fd-85a1-e0c7961feaad		0.9	4.75	4.7	3.4	5	U	\N						\N		\N	\N	\N	\N	An adult laying next burial#16 with child (burial#17)laying on top of body\nFace bundle	4753dec1-34b3-40cf-973f-b1bbd6f21d9e	\N	\N	\N	\N	\N	\N	2006	\N	\N	18	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
900a5473-a364-4e6d-b96a-e92a9e2678ba		0.7	2.15	2.4	-0.7	1.3	U	\N						\N		\N	\N	\N	\N	In west part of SE area	21ca972b-94db-4ecc-9cb5-ad01f6eb85d9	\N	\N	\N	\N	\N	\N	2006	\N	\N	20	\N	Undetermined		\N	f	f	f	bad	B	A	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
c29b66c6-23a2-4913-84ea-d27e8c1cc71a		2.29	1.3	0.4	4	4.11	U	\N						\N		\N	\N	\N	\N	completely skeletalized\nFinally hit sterile soil in the shaft at 2\n6m deep\nNo reversal burials in this part of SE area	6b737525-a48c-4f87-a40e-4dc4c358cb79	\N	\N	\N	\N	\N	\N	2006	\N	\N	21	\N	Undetermined		\N	f	f	f	poor	B	A	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
f2cef455-d390-4c90-8435-0141cf0cf70a		1.75	3.05	2.8	0.8	2.5	U	\N						\N		\N	\N	\N	\N	Head west	2f8f8c23-7225-4a8c-94d0-1a8fffdff3d5	\N	\N	\N	\N	\N	\N	2006	\N	\N	22	\N	Undetermined		\N	f	f	f	fair	H	A	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
25e27dff-3651-41fa-a7bd-db39df966533	East	1.95	3.35	3.35	1.5	0.85	U	\N						\N		\N	\N	\N	\N	Head East	9883fea6-274d-4ffa-adcf-4aaaa9a784a5	\N	\N	\N	\N	\N	\N	2006	\N	\N	23	\N	Male		\N	f	f	f		W	C	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
e4946e53-8bc2-44c8-bb4e-ed1399088c8d		1.25	4.2	4.25	0.9	1.5	U	\N						\N		\N	\N	\N	\N	Wrapped but not well preserved	38b0b4c4-b5d3-4d81-b947-66c17df26664	\N	\N	\N	\N	\N	\N	2006	\N	\N	27	\N	Undetermined		\N	f	f	f	poor	B	C	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
b698cd2e-a055-4cbc-a392-d633c55563be		1.3	2.4	2.45	0.4	1.05	U	\N						\N		\N	\N	\N	\N	Overlapping burial#29	8509d7f8-3629-4476-9a73-855ad32e2e83	\N	\N	\N	\N	\N	\N	2006	\N	\N	28	\N	Undetermined		\N	f	f	f	poor	B	C	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
c150e3e1-53ad-4e4c-88d4-ed8c01ed25dd		1.35	2.29	2.35	-0.35	0.45	U	\N						\N		\N	\N	\N	\N	Buried underneath burial#28	58f4e084-0882-4279-a4f6-72df40228000	\N	\N	\N	\N	\N	\N	2006	\N	\N	29	\N	Undetermined		\N	f	f	f	poor	B	C	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
382c761c-d9ef-468a-a533-a59c252b2ccf		1.3	3.45	3.25	3.15	4.8	U	\N						\N		\N	\N	\N	\N	Head West	baa2bec7-003e-4a23-845b-4b7b4f301e79	\N	\N	\N	\N	\N	\N	2006	\N	\N	30	\N	Undetermined		\N	f	f	f	fair	H	A	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
7b49d325-8f9a-44fa-b071-9e67bd28eaa8		0.75	0.4	0.5	1.25	1.95	U	\N						\N		\N	\N	\N	\N	Buried with wine cups in close proximity (early Byzantine 300AD)	112958c5-0eed-41ef-a463-85acb153b015	\N	\N	\N	\N	\N	\N	2006	\N	\N	34	\N	Undetermined		\N	f	f	f		W	C	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
9bd69b86-cbd1-49a1-b356-0518e47a63fa		1.45	3.35	3.3	3.2	5	U	\N						\N		\N	\N	\N	\N	A piece of wood was placed on left on the abdomen of the burial	5a8b33b8-0e94-4a25-9dd5-9eb11fff4b8e	\N	\N	\N	\N	\N	\N	2006	\N	\N	35	\N	Undetermined		\N	f	f	f	poor	B	A	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
e2195245-b723-429e-a463-9a7d765dcdc7		2.6	2.2	2.1	1.07	-0.15	U	\N						\N		\N	\N	\N	\N	Buried next to burial#40	0a91f73b-ee70-48e3-b691-3269153eb48b	\N	\N	\N	\N	\N	\N	2006	\N	\N	41	\N	Undetermined		\N	f	f	f		B	A	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
7cd0cf29-fb69-4788-b3ce-5f9e0ad76b7f		2.2	4.4	4.5	-0.1	1.65	U	\N						\N		\N	\N	\N	\N	Head West	ab725d24-e684-4835-ba21-20763adaa1e6	\N	\N	\N	\N	\N	\N	2006	\N	\N	43	\N	Undetermined		\N	f	f	f		B	A	U	A	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
b594c853-34cd-4819-a0cc-2e6d4e12f631	East	2.54	2.1	0.5	1.05	0.9	U	\N						\N		\N	\N	\N	\N	Head East	cd7e5021-03f7-40ea-971f-6e06673fa4b9	\N	\N	\N	\N	\N	\N	2006	\N	\N	47	\N	Undetermined		\N	f	f	f		B	A	U	U	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
4ff773a4-a987-45e4-aa23-fae2052a3057	West	0.3	1.97	2.12	-1	-0.15	U	\N				Lt. Brown		\N		\N	\N	\N	\N	Child-infant\nred-orange ribbon with 3 black warfs\nfeet crossed	da60b722-088a-4bda-a3bd-ea02e1ff8fdc	\N	\N	2007-01-01	\N	\N	\N	2006	\N	\N	1	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	f		f	2007	22						\N	\N	\N	\N	\N	\N	\N	\N	\N
90b8c85c-0cfd-4518-9a49-74dbff87d2ab		0	0	0	0	0		\N						\N		\N	\N	\N	\N		b7b37d70-991e-4d25-a2cf-e40a9938f243	\N	\N	\N	\N	\N	\N	2006	\N	\N	2	\N			\N	f	f	f						\N	\N	f		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
24b1630e-3fec-4dbf-9de5-92f5dc45cd41	West	0.38	1.05	1.06	-0.14	0.32	5	\N						\N		\N	\N	\N	\N	About 5 year old child\nno fabric on skull - skull broken\nfound underneath adult #3	70cf3980-b8ef-4b1b-bd6b-89d4aa9cf48e	\N	\N	2007-01-01	\N	\N	\N	2006	\N	0.92	4	\N	Undetermined		\N	f	f	f		H	C	U	C	\N	\N	f		f	2007	30						\N	\N	\N	\N	\N	\N	\N	\N	\N
45660758-f361-4286-bb97-e83e5fc37de7	East	1.85	2.95	2.74	3.97	2.5	U	\N						\N		\N	\N	\N	\N	Reversed burial\nburial #7 beginning to emerge into view\nshelf where burial with statuette was located	14af5392-e0b2-4284-8e72-fb84f22a8a8d	\N	\N	2007-01-01	\N	\N	\N	2006	\N	1.57	5	\N	Undetermined		\N	f	f	f		H	U	U	U	\N	\N	f		f	2007	36						\N	\N	\N	\N	\N	\N	\N	\N	\N
dd86cafd-981a-4160-9726-0de78d6eecc3	West	1.49	3.3	3.11	2.13	3.75	U	\N						\N		\N	\N	\N	\N	Large burial beneath limestone blocks with feet extending east and under reed basket	29163697-3686-4805-a658-e2793bb4352f	\N	\N	2007-01-01	\N	\N	\N	\N	\N	1.75	7	\N	Undetermined		\N	f	f	f			U	U	U	\N	\N	f		t	2007	36						\N	\N	\N	\N	\N	\N	\N	\N	\N
8668698b-2efc-4012-948e-a526d846a432	West	1.9	3.9	3.7	3.2	4.09	U	\N						\N		\N	\N	\N	\N	Sub-adult	a473bf45-94a9-43af-822e-d250aa853893	\N	\N	2007-01-01	\N	\N	\N	\N	\N	0.8	8	\N	Undetermined		\N	f	f	f		B	A	U	A	\N	\N	f		f	2007	50						\N	\N	\N	\N	\N	\N	\N	\N	\N
55b08ae5-d8a1-4034-8cc7-fc2b3e509565	West	2.16	3.44	3.28	4.5	5.46	U	\N						\N		\N	\N	\N	\N	Skeletal - deteriorated	b4a9107d-b647-497f-88c2-ee7af8f6a94e	\N	\N	2007-01-01	\N	\N	\N	\N	\N	0.94	9	\N	Undetermined		\N	f	f	f		B	C	U	C	\N	\N	f		f	2007	50						\N	\N	\N	\N	\N	\N	\N	\N	\N
9387eacf-b097-422d-a4cc-687631189e17	East	2.02	4.37	4.41	2.45	0.98	U	\N						\N		\N	\N	\N	\N	Reversal	0c912ed2-c649-4d59-b8d2-72070c534dfa	\N	\N	2007-01-01	\N	\N	\N	\N	\N	1.65	10	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2007	52						\N	\N	\N	\N	\N	\N	\N	\N	\N
af61a268-7e41-4b71-a147-44e8227e05de	West	1.14	1.09	1.17	-0.5	0.2	U	\N						\N		\N	\N	\N	\N	Baby placed up by head of burial #12	66ad4bf7-d129-4040-a78a-6327e4c21c05	\N	\N	2007-01-01	\N	\N	\N	\N	\N	0.77	11	\N	Undetermined		\N	f	f	f		H	C	U	I	\N	\N	f		f	2007	54						\N	\N	\N	\N	\N	\N	\N	\N	\N
498bc78a-5127-4b84-8c05-5b7a9cfe1de4	West	1.2	1.03	1.3	-0.48	1.2	U	\N						\N		\N	\N	\N	\N	White coarse linen shroud with ribbon	4c56c695-c407-4437-94f6-79820a087318	\N	\N	2007-01-01	\N	\N	\N	\N	\N	1.77	12	\N	Undetermined		\N	f	f	f		H	A	U	A	\N	\N	f		f	2007	54						\N	\N	\N	\N	\N	\N	\N	\N	\N
89b05f3f-e185-45e4-b96a-a554f7f519de	West	2.25	2.54	2.27	2.08	3.71	U	\N						\N		\N	\N	\N	\N	Skeletialized burial in south upper chamber\nchamber cut under shafts - extending west up shafts\nshelf - on north side of shelf\nabout the same depth as mud-brick enclosure on the south\nin shaft where figurine and SW #5 were found	d4e4796c-7ed5-45d5-a731-e5cd89c247b2	\N	\N	2007-01-01	\N	\N	\N	\N	\N	1.76	13	\N	Undetermined		\N	f	f	f			U	U	U	\N	\N	f		f	2007	56						\N	\N	\N	\N	\N	\N	\N	\N	\N
278e7a81-a5b0-4543-be8c-13b777d91c31	West	0.78	0.8	0.75	2.2	2.9	U	\N						\N		\N	\N	\N	\N	double burial - child and adult #15 (adult is north of child)\nearings on child	aa303456-a724-4702-8c98-3d579a3845c4	\N	\N	2007-01-01	\N	\N	\N	\N	\N	0.85	14	\N	Undetermined		\N	f	f	f			C	U	C	\N	\N	f		f	2007	60						\N	\N	\N	\N	\N	\N	\N	\N	\N
14e57af0-1cb9-43b0-aed8-e7b2b108d701	West	0.69	1.14	1.12	1.8	3.45	U	\N						\N		\N	\N	\N	\N	double burial - child #14 and adult (adult is north of child)\nneck area really filled in with cloth	ef7c20ca-e82b-4553-b709-33fa39a7c209	\N	\N	2007-01-01	\N	\N	\N	\N	\N	1.75	15	\N	Undetermined		\N	f	f	f			A	U	A	\N	\N	f		f	2007	60						\N	\N	\N	\N	\N	\N	\N	\N	\N
96fb2570-f2e0-405d-8808-1ad50b276f09	West	1.1	1.51	1.46	1.62	3.1	U	\N						\N		\N	\N	\N	\N	found just north of #14, 15 - the third in the grouping\nfeet deteriorated	024f8860-6f2f-4ed5-9077-f8f3ad0e2078	\N	\N	2007-01-01	\N	\N	\N	\N	\N	1.65	16	\N	Undetermined		\N	f	f	f		H	A	U	A	\N	\N	f		f	2007	62						\N	\N	\N	\N	\N	\N	\N	\N	\N
7298df74-c4df-48ae-9beb-a75d4b2601e1	West	0.87	4.4	4.15	4.63	6.04	U	\N						\N		\N	\N	\N	\N	criss-cross ribbon, red - full length of body\n3rd layer badly deteriorated\nface bundle	48525f0b-da0d-40be-8bef-2cbc63ef2402	\N	\N	2007-01-01	\N	\N	\N	\N	\N	1.44	17	\N	Undetermined		\N	f	f	f		H	U	U	U	\N	\N	f		t	2007	64						\N	\N	\N	\N	\N	\N	\N	\N	\N
0b287f67-1d0e-4710-98f4-857f019b172a	West	1.41	2.56	2.52	-0.4	1	U	\N						\N		\N	\N	\N	\N	coarse white linen shroud\nface bundle - several folded strips	b0588f84-8b2c-4654-bc2e-636679a3bbf5	\N	\N	2007-01-01	\N	\N	\N	\N	\N	1.55	18	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		t	2007	66						\N	\N	\N	\N	\N	\N	\N	\N	\N
c3359ed7-eb77-4740-9e34-a7b0219fbee6	East	1.75	2.49	2.25	0.76	-0.43	U	\N				dark brown		\N		\N	\N	\N	\N	Offset chamber next to #18 to the south\nlots of curly dark brown hair\ntextiles - very deteriorated fragments	5eab0cff-aad8-4f0f-9a8f-3ad82edf97a2	\N	\N	2007-01-01	\N	\N	\N	\N	\N	1.41	19	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2007	68						\N	\N	\N	\N	\N	\N	\N	\N	\N
79a01ffc-29c7-4bf8-8050-7e8a8db50c92	West	1.46	1.69	1.8	1.76	3.43	U	\N						\N		\N	\N	\N	\N	Minimal textile fragments	2e414c24-34d0-49f0-b346-21bbecb54316	\N	\N	2007-01-01	\N	\N	\N	\N	\N	1.62	20	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2007	70						\N	\N	\N	\N	\N	\N	\N	\N	\N
33ee0f0c-6ec8-4e73-aa78-a2e80122bdbe	East	0.74	3.78	3.74	1.75	1.14	U	\N						\N		\N	\N	\N	\N	Child with multiple linen layers	94170335-c495-4ba7-8cad-1c1501c53971	\N	\N	2005-01-01	\N	\N	\N	\N	\N	0.63	1	\N	Undetermined		\N	f	f	f			C	U	C	\N	\N	f		f	2005	11						\N	\N	\N	\N	\N	\N	\N	\N	\N
c4dcc49f-68f2-443d-8b6c-e448761c96e8	West	0.48	1.72	2.04	-0.62	0.36	U	\N						\N		\N	\N	\N	\N	Sub-adult	5e367314-6959-46fa-b98e-f3e018fe49bd	\N	\N	2005-01-01	\N	\N	\N	2005	\N	1.03	2	\N	Undetermined		\N	f	f	f		W	A	U	C	\N	\N	f		t	2005	13						\N	\N	\N	\N	\N	\N	\N	\N	\N
8d19d257-ceb2-4f39-81cb-567e9d54657d	West	0.79	0.65	0.76	2.15	4.21	U	\N						\N		\N	\N	\N	\N	Well wrapped\nReeds along botton of body\n1 green bead with burial\nred ribbon - diagonal wrap	a374d71c-0c2d-46c8-97df-a8f8e7dc7337	\N	\N	2005-01-01	\N	\N	\N	2005	\N	1.82	3	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	f		f	2005	13						\N	\N	\N	\N	\N	\N	\N	\N	\N
8cfb1a34-be74-4707-8d7f-5585d38e37f6	West	0.85	2.63	2.77	2.02	4.15	U	\N						\N		\N	\N	\N	\N	Small child in very poor condition\nwrapped, but not much in wrappings	42602652-8116-495e-b78b-af50137ab3a0	\N	\N	2005-01-01	\N	\N	\N	2005	\N	0.55	4	\N	Undetermined		\N	f	f	f		B	C	U	C	\N	\N	f		f	2005	15						\N	\N	\N	\N	\N	\N	\N	\N	\N
30918e0a-0436-49ba-8afc-ba94c3426027	West	0.6	3.74	3.84	3.63	5.2	U	\N						\N		\N	\N	\N	\N	Large adult\nribs broken, etc.	a9d3678b-d2fb-47d8-a954-531612ad66d8	\N	\N	2005-01-01	\N	\N	\N	2005	\N	1.6	6	\N	Undetermined		\N	f	f	f		H	A	U	A	\N	\N	f		f	2005	17						\N	\N	\N	\N	\N	\N	\N	\N	\N
49dc4e40-4ee0-44c3-9264-a0baf720d50f	West	0.8	3.92	4.66	2.7	4	U	\N						\N		\N	\N	\N	\N	Skeletelized\nhands by sides\ntextile fragments at feet\nangled to NE	1abdbf87-4e36-4061-8d44-ee9e6e0251af	\N	\N	2005-01-01	\N	\N	\N	2005	\N	1.52	10	\N	Undetermined		\N	f	f	f	poorly preserved	H	U	U	U	\N	\N	f		f	2005	21						\N	\N	\N	\N	\N	\N	\N	\N	\N
08907607-5d92-4caf-8d9f-b73e0f3e4b92	West	0.98	0.96	0.85	3.58	4.47	U	\N						\N		\N	\N	\N	\N	Found in a shaft with 4 other burials (details in field book pg. 18)\neach adult has a child placed on top, but the children are placed at the pelvis and extend only slightly beyond the feet of the adults\nChildren wrapped in plain linen with coarse plain linen strips wrapped diagonally over shrouds	5f35d2ef-b0d1-4d39-8aac-0e5816336bab	\N	\N	2005-01-01	\N	\N	\N	2005	\N	0.9	11	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	f		f	2005	21						\N	\N	\N	\N	\N	\N	\N	\N	\N
6559bd7f-4594-4e9a-b739-00845789b525	West	0.69	0.39	0.25	3.91	4.46	U	\N						\N		\N	\N	\N	\N	Same cluster details as above	4cf7de07-6d06-4951-81d4-2b4b47d7f6a5	\N	\N	2005-01-01	\N	\N	\N	2005	\N	0.99	13	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	f		f	2005	21						\N	\N	\N	\N	\N	\N	\N	\N	\N
6c93558e-10d3-4d23-a856-bd12873b9f28	West	1.12	3.86	3.96	2.98	3.79	U	\N						\N		\N	\N	\N	\N	Mostly skeletelized	41acbe93-5500-427f-9a3a-0b7928ecd039	\N	\N	2005-01-01	\N	\N	\N	2005	\N	0.92	16	\N	Undetermined		\N	f	f	f		B	C	U	C	\N	\N	f		f	2005	25						\N	\N	\N	\N	\N	\N	\N	\N	\N
0ebbfca7-c90f-4208-90cc-91c08964142c	West	1.23	4.22	4.48	1.76	3.29	U	\N						\N		\N	\N	\N	\N	Reed necklace outstide wrap\n2 reed necklaces\nhands over pelvis	4824150d-c27f-4240-9f1d-b3ed71151042	\N	\N	2005-01-01	\N	\N	\N	2005	\N	1.68	17	\N	Undetermined		\N	f	f	f	well-wrapped	W	A	U	A	\N	\N	f	Y	f	2005	27						\N	\N	\N	\N	\N	\N	\N	\N	\N
a67e0255-9b44-4908-a0f7-d832360f3252	West	1.5	3.01	3.1	3.02	3.54	U	\N						\N		\N	\N	\N	\N	Buried in an ovoid shaft not much larger than will accommodate them - were they (18,19) twins?\ncoarse outer wrap and fine linen wrap	71276a2b-5474-4e80-b045-e2b8819f8d0b	\N	\N	2005-01-01	\N	\N	\N	2005	\N	0.65	18	\N	Undetermined		\N	f	f	f		H	C	U	C	\N	\N	f		f	2005	29						\N	\N	\N	\N	\N	\N	\N	\N	\N
b6ee8a4a-49af-49dc-ab87-22a85fb39d85	West	0.64	3.26	2.88	3.02	3.54	U	\N						\N		\N	\N	\N	\N	Same cluster details as above	43ea626e-464d-4c54-b54c-6f56b5bffa44	\N	\N	2005-01-01	\N	\N	\N	2005	\N	1.56	19	\N	Undetermined		\N	f	f	f		H	C	U	C	\N	\N	f		f	2005	29						\N	\N	\N	\N	\N	\N	\N	\N	\N
9ea8af69-846e-4ccf-8b9e-5bf6f17dd438	East	1.46	0.94	0.94	2.75	2.27	U	\N						\N		\N	\N	\N	\N	Adjacent to adult (#20)	1519146d-31e6-4c03-aabe-e043d979270a	\N	\N	2005-01-01	\N	\N	\N	2005	\N	0.64	21	\N	Undetermined		\N	f	f	f		U	C	U	I	\N	\N	f		f	2005	29						\N	\N	\N	\N	\N	\N	\N	\N	\N
09ebb76f-6d29-4bb0-8184-aabe646c1133		1.74	2.25	0	1.98	0	U	\N						\N		\N	\N	\N	\N	Same cluster details as above	c2da7197-7dea-4618-b0a8-2daf833d61d4	\N	\N	2005-01-01	\N	\N	\N	2005	\N	\N	25	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2005	31						\N	\N	\N	\N	\N	\N	\N	\N	\N
b673885b-843c-4c2d-8f9e-fc7c89a189dc	West	0.2	2.34	2.19	1.58	2.99	U	\N						\N		\N	\N	\N	\N	Mostly skeletalized with a few textile fragments around the chest\nThere were 4 skulls above the expected area for #28, so it may have been on of them\nhands down along sides	e17305f0-d11c-4633-9397-b31df093ef25	\N	\N	2005-01-01	\N	\N	\N	2005	\N	1.41	28	\N	Undetermined		\N	f	f	f		B	U	U	U	\N	\N	f		f	2005	35						\N	\N	\N	\N	\N	\N	\N	\N	\N
d8e5fa16-a2b0-48ef-be51-f532da40571a	West	1.3	3.02	2.93	5	5.5	U	\N						\N		\N	\N	\N	\N	This is a baby burial placed to the north of #33 (from the pelvis to feet)	91a12190-dc33-44ba-8c50-c20aad5445f3	\N	\N	2005-01-01	\N	\N	\N	2005	\N	0.5	34	\N	Undetermined		\N	f	f	f		U	C	U	I	\N	\N	f		f	2005	39						\N	\N	\N	\N	\N	\N	\N	\N	\N
66d5d5cf-aa55-4248-aafc-33c4a9151066	West	0.74	1.7	1.81	0.16	0.81	U	\N						\N		\N	\N	\N	\N	Wrapped in med weave linen	48a8d562-3dc6-4144-9292-0047f3130d91	\N	\N	2005-01-01	\N	\N	\N	2005	\N	0.56	35	\N	Undetermined		\N	f	f	f	Poor preservation	H	C	U	C	\N	\N	f		f	2005	41						\N	\N	\N	\N	\N	\N	\N	\N	\N
73a87e40-5b3c-4cb3-a129-af59def0ed6b	West	0.59	5.01	5.03	-0.03	1.55	U	\N						\N		\N	\N	\N	\N	Next to #36\ndisrupted pelvis - messy mid section	5151c7f2-dc09-4d63-92fe-c2bffc997013	\N	\N	2005-01-01	\N	\N	\N	2005	\N	1.62	37	\N	Undetermined		\N	f	f	f		H	A	U	A	\N	\N	f		t	2005	41						\N	\N	\N	\N	\N	\N	\N	\N	\N
6725ab96-fc1c-4e60-9210-8ef8d08a7dff	West	0.32	4.53	4.43	2.12	3.7	U	\N				brown		\N		\N	\N	\N	\N	Red ribbon, diagonal wrap	bc2c2400-45f1-41bd-b06a-18e87b722ac8	\N	\N	2005-01-01	\N	\N	\N	\N	\N	1.7	2	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	f		f	2005	43						\N	\N	\N	\N	\N	\N	\N	\N	\N
6338a7ff-d58b-403e-9610-80753d3c6ef1	West	0.38	3.03	3.1	1.1	2.35	U	\N						\N		\N	\N	\N	\N	Rope wrap run linen\ncoarse, then fine wraps going inside\nhands at sides	e47372e6-e1b0-4e9b-a513-d0699aeef421	\N	\N	2005-01-01	\N	\N	\N	2005	\N	1.25	3	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	f		t	2005	45						\N	\N	\N	\N	\N	\N	\N	\N	\N
b959b8c1-1484-411c-bd6d-38484ba36103	West	0.65	1.12	1.33	4.5	5.13	U	\N						\N		\N	\N	\N	\N	Wrapped with twisted 2 strand rope over linen	b3aa3fc0-7abc-4206-8fb5-9f7923768521	\N	\N	2005-01-01	\N	\N	\N	2005	\N	0.82	4	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	f		f	2005	45						\N	\N	\N	\N	\N	\N	\N	\N	\N
076e5c82-00f1-429a-b109-13dd53e7ddfd	West	0.65	1.02	0.9	4.75	5.58	U	\N						\N		\N	\N	\N	\N	Wrapped with linen strips diagonal wrap over coarse linen	cb75b6cd-87e2-4fc9-9588-3e5fe56105ee	\N	\N	2005-01-01	\N	\N	\N	2005	\N	0.9	5	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	f	Y	f	2005	45						\N	\N	\N	\N	\N	\N	\N	\N	\N
881a877b-b30c-4fcc-b85b-8b93e63038cc	West	0.8	4.04	4.09	2.8	3.7	U	\N						\N		\N	\N	\N	\N	4 strand red ribbon diagonal wrap - many times over the head	59e1c10b-7ee3-4337-85f5-ee54d9100415	\N	\N	2005-01-01	\N	\N	\N	2005	\N	0.9	7	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	f		t	2005	47						\N	\N	\N	\N	\N	\N	\N	\N	\N
a72fff08-8e52-4a0b-b0a0-913145fae8f2	West	0.35	1.12	1.24	0.7	2.54	U	\N						\N		\N	\N	\N	\N	Wrapped with extensive rope wrappings all over outer wraps of linen	15db7414-2f85-47e1-b481-cf9d6427665c	\N	\N	2005-01-01	\N	\N	\N	2005	\N	1.33	8	\N	Undetermined		\N	f	f	f		W	U	U	U	\N	\N	f	Y	f	2005	47						\N	\N	\N	\N	\N	\N	\N	\N	\N
71639d69-ad20-4902-a709-c6d1f5051fc5	Undefined	0.55	1.87	1.87	0.77	1.15	U	\N						\N		\N	\N	\N	\N	Hardly a burial - mostly cloth	b66becca-826c-459e-bafb-3fcfc0ad13ae	\N	\N	2005-01-01	\N	\N	\N	2005	\N	0.4	9	\N	Undetermined		\N	f	f	f		H	C	U	I	\N	\N	f		f	2005	49						\N	\N	\N	\N	\N	\N	\N	\N	\N
3ae17160-3bdc-4171-b4ee-ec16c2cadb7a	West	0.56	1.75	1.73	1.15	2.5	U	\N				brown		\N		\N	\N	\N	\N	Mostly covered by limestone blocks\nFace bundle mostly gone	4b063d01-d90d-4e5e-a3b2-eaae44fb9501	\N	\N	2005-01-01	\N	\N	\N	\N	\N	1.47	10	\N	Undetermined		\N	f	f	f	poor condition	W	U	U	U	\N	\N	f		t	2005	49						\N	\N	\N	\N	\N	\N	\N	\N	\N
a5ad0aea-d4f5-408d-8b1c-213fc69478f1	West	0.73	2.83	2.78	2.17	2.65	U	\N						\N		\N	\N	\N	\N	2 children rested between limestones\nBoth wrapped with linen strip over coarse linen	4236746a-87f1-47ff-b9c3-ed7a95f05f81	\N	\N	2005-01-01	\N	\N	\N	2005	\N	0.68	11	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	f		f	2005	51						\N	\N	\N	\N	\N	\N	\N	\N	\N
9d859cac-a8f2-4ce5-9645-691dbd12e70f	West	0.88	2.85	2.84	-0.66	0.34	U	\N						\N		\N	\N	\N	\N	Has some reed matting	c637726c-7283-4fd5-b774-f179c0dd9434	\N	\N	2005-01-01	\N	\N	\N	\N	\N	1.41	13	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	f		f	2005	51						\N	\N	\N	\N	\N	\N	\N	\N	\N
08099eb5-bbb3-4f09-b13d-84632c326602	West	1.03	2.43	2.5	-0.56	0.7	U	\N						\N		\N	\N	\N	\N	Skull missing (measurements taken from shoulder)\nhands by sides	45f25170-28a0-44cd-bf03-444c207a3fb5	\N	\N	2005-01-01	\N	\N	\N	2005	\N	1.63	14	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	f		f	2005	51						\N	\N	\N	\N	\N	\N	\N	\N	\N
cfb2f6b1-4d33-495f-b4f0-4f5ca1a2b6e8	West	0.97	2.12	2.37	-0.47	0.67	U	\N						\N		\N	\N	\N	\N	Skull missing (measurements taken from shoulder)\nfourth burial to the north	4a0883cd-a910-4a76-875d-b610d076a695	\N	\N	2005-01-01	\N	\N	\N	2005	\N	1.46	15	\N	Undetermined		\N	f	f	f		U	A	U	A	\N	\N	f		f	2005	51						\N	\N	\N	\N	\N	\N	\N	\N	\N
052c7be4-fbb1-41af-b9d6-4a960a106a49	West	0.52	0.5	0.4	4.73	5.4	U	\N						\N		\N	\N	\N	\N	Removed subterranean grave marker	d4f40309-9095-4957-80d4-c237026ec5aa	\N	\N	2005-01-01	\N	\N	\N	2005	\N	0.69	16	\N	Undetermined		\N	f	f	f	extremely poor condition	H	C	U	C	\N	\N	f		f	2005	53						\N	\N	\N	\N	\N	\N	\N	\N	\N
b8721b9e-6759-4fe7-b161-b4a52e7bf6eb	West	0.71	0.52	0.2	4.54	5.57	U	\N						\N		\N	\N	\N	\N	Sub-adult\nFringe on linen folded over feet	c282052b-8b41-40ba-ba7e-d2debdfe31f3	\N	\N	2005-01-01	\N	\N	\N	2005	\N	1.12	19	\N	Undetermined		\N	f	f	f		W	A	U	C	\N	\N	f		t	2005	53						\N	\N	\N	\N	\N	\N	\N	\N	\N
1de72bb3-ce61-49e1-98ad-ca11eb39b609	West	0.8	0.96	1.1	0.87	1.8	U	\N						\N		\N	\N	\N	\N	Decorated outer layer (was ribbon all dyed? - poor condition)\nKnot tying ribbons (mid-thigh to patella)\nFabric laid out, body place on it, then material folded over\nHems on chest suggest something like that	95323445-4a3d-45b5-a219-e9db140a8ce1	\N	\N	2005-01-01	\N	\N	\N	\N	\N	0.99	22	\N	Undetermined		\N	f	f	f	poor condition	W	C	U	C	\N	\N	f		t	2005	59						\N	\N	\N	\N	\N	\N	\N	\N	\N
76b9f2ee-93d0-4270-8124-c261b70f44bc	West	0.77	3.21	3.26	-0.83	0.36	U	\N						\N		\N	\N	\N	\N	Red ribbon - 4 strand - coarse outer layer - good ribbon	e46dcece-e4f4-4fbb-9a77-fe02558c4cf4	\N	\N	2005-01-01	\N	\N	\N	2005	\N	1.21	23	\N	Undetermined		\N	f	f	f	poorly preserved	W	U	U	U	\N	\N	f		f	2005	59						\N	\N	\N	\N	\N	\N	\N	\N	\N
4664d6ef-03f1-45b0-a78b-3e1fd6ee8c2d	West	0.75	1.48	1.83	0.62	2.29	U	\N						\N		\N	\N	\N	\N	Perhaps the most interesting burial of the season!	053d7e70-2dc2-47d9-83ab-920c557bc2a7	\N	\N	2005-01-01	\N	\N	\N	2018	\N	1.59	25	\N	Undetermined		\N	f	f	f		U	U	U	U	\N	\N	f	Y	f	2005	63						\N	\N	\N	\N	\N	\N	\N	\N	\N
e2c42ab9-57c3-436d-bee8-ee2b8af98f27	West	0.81	1	0.53	0.48	2.06	U	\N						\N		\N	\N	\N	\N	Tufted outer wrap overland with 4 strand red ribbon wrapped diagonally	517e88e2-4a60-4192-b275-8feb35427232	\N	\N	2005-01-01	\N	\N	\N	2005	\N	1.64	26	\N	Undetermined		\N	f	f	f		W	A	U	U	\N	\N	f		t	2005	65						\N	\N	\N	\N	\N	\N	\N	\N	\N
502bfbf3-1323-42f1-bd98-e0eeda84084a	West	1.11	1.59	1.5	0.56	2.25	U	\N						\N		\N	\N	\N	\N	Red 4 strand ribbon diagonal wrap	20223dc0-43dc-4eff-a3e6-7bd3a0f18f03	\N	\N	2005-01-01	\N	\N	\N	2005	\N	1.71	32	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	f		t	2005	75						\N	\N	\N	\N	\N	\N	\N	\N	\N
de684592-38bc-4ce8-ae13-ee51162fcd1d	West	2.27	1.46	1.36	1.37	3.1	U	\N						\N		\N	\N	\N	\N	In offset chamber, behind mud brick	3300bfb2-1f7a-4d04-985f-7a86ca45fb29	\N	\N	2005-01-01	\N	\N	\N	2005	\N	1.78	36	\N	Undetermined		\N	f	f	f		U	A	U	A	\N	\N	f		f	2005	79						\N	\N	\N	\N	\N	\N	\N	\N	\N
30151b6b-4b6a-4440-95a5-830356a1c262	West	0	0	0	0	0	U	\N						\N		\N	\N	\N	\N	Baby located from knees to feet on the adult\nbasket weave shroud - very coarse\nAeolian sand (wind blown) on right side	eb26f82e-ad8c-4d74-9d2b-54e8f2f3e5b2	\N	\N	2007-01-01	\N	\N	\N	2006	\N	\N	2	\N	Undetermined		\N	f	f	f			C	U	I	\N	\N	f		f	2007	26						\N	\N	\N	\N	\N	\N	\N	\N	\N
eb38e3ec-c5f0-47fa-97e4-089afe5d6d27	West	0.18	0.95	1.25	5.8	4.74	U	\N						\N		\N	\N	\N	\N	An adult that had a baby located from knees to feet\narms folded at pelvis\nright side of the head and body protected by limestone rocks. Left side had 3 mud bricks around the head	1ce5442e-669f-4cdb-a6ef-5a992176cdcd	\N	\N	2007-01-01	\N	\N	\N	2006	\N	1.7	3	\N	Undetermined		\N	f	f	f			A	U	A	\N	\N	f		f	2007	26						\N	\N	\N	\N	\N	\N	\N	\N	\N
2b6ebff2-2f57-4062-b0b8-b1b46d30c66d	West	0.55	1.67	1.79	3.27	3.9	U	\N						\N		\N	\N	\N	\N		2ee03f04-c82b-45b2-888d-a74981f58c4f	\N	\N	1997-01-01	\N	\N	\N	\N	\N	0.77	1	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	7						\N	\N	\N	\N	\N	\N	\N	\N	\N
bd0fa971-455b-4bea-941c-4238f299e5fb	West	0.72	1.34	1.24	1.17	1.85	U	\N				light brown		\N		\N	\N	\N	\N	was an infant\nnice fair hair (blonde/light brown) some sticks over the body but none beneath\nfeet slightly to the SE\nSome sticks over the body, but some beneath	c1396166-3606-4994-9f74-33cb45c48c0f	\N	\N	1997-01-01	\N	\N	\N	\N	\N	0.17	3	\N	Male		\N	f	f	f		H	C	U	I	\N	\N	t		f	1998	7						\N	\N	\N	\N	\N	\N	\N	\N	\N
2f472303-323e-4867-8ecc-546714d62b37	West	0.6	0.84	1.02	2.13	2.72	U	\N						\N		\N	\N	\N	\N	from neck to ankles	16258bf8-f6ea-408f-8261-626a59e36b11	\N	\N	1997-01-01	\N	\N	\N	\N	\N	0.61	4	\N	Undetermined		\N	f	f	f	poor	B	U	U	U	\N	\N	t		f	1998	13						\N	\N	\N	\N	\N	\N	\N	\N	\N
6e25e35e-a934-4322-81a3-ecf081a1825a	Undefined	0.4	1.9	1.9	4.66	5.09	U	\N						\N		\N	\N	\N	\N	very disturbed\nabove, pieces of skull and misc bones found\nnot enough pieces to constitute a whole body\nbody covered with stones-early roman pottery\n2nd century jar-associated with burial	7c003b60-225b-4687-975b-5fa90cacbb4b	\N	\N	1997-01-01	\N	\N	\N	\N	\N	0.42	8	\N	Undetermined		\N	f	f	f	very disturbed	B	U	U	U	\N	\N	t	Y	f	1998	23						\N	\N	\N	\N	\N	\N	\N	\N	\N
a46ffc88-a218-40c9-8ede-b529cb9cf5e5	West	1.1	2.73	2.59	3.17	3.95	U	\N						\N		\N	\N	\N	\N	1 adult and 3 children buried together (13,14,17 and 18)	9aecc418-18d5-43f9-94db-0b58c751089c	\N	\N	1997-01-01	\N	\N	\N	\N	\N	0.83	13	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	31						\N	\N	\N	\N	\N	\N	\N	\N	\N
2bc30bac-00b5-4a86-87b4-030085f94359	West	1.58	3.78	3.68	0.49	1.97	U	\N						\N		\N	\N	\N	\N	hands placed on hips-above pelvis	55a6e5ac-0e96-4422-8a77-36ea82172f5b	\N	\N	1997-01-01	\N	\N	\N	\N	\N	1.66	15	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	29						\N	\N	\N	\N	\N	\N	\N	\N	\N
3e590287-3a77-44bf-b039-9b1e9435e184	East	1.6	3.08	3.14	2.16	0.66	U	\N						\N		\N	\N	\N	\N	head east, lying almost directly over burial 22, which is head west\nhands on hips-above pelvis	8233aaeb-f89e-4989-a154-b0337b82ec21	\N	\N	1997-01-01	\N	\N	\N	\N	\N	1.64	16	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	29						\N	\N	\N	\N	\N	\N	\N	\N	\N
92da0535-f5a8-4818-8466-b58c5540a6a5	West	1.25	2.44	2.31	3.62	4.48	U	\N						\N		\N	\N	\N	\N	1 adult and 3 children buried together (13,14,17 and 18)	1046af4c-9357-4684-824f-3f185ebcda85	\N	\N	1997-01-01	\N	\N	\N	\N	\N	0.94	17	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	31						\N	\N	\N	\N	\N	\N	\N	\N	\N
8ca291d7-1322-46bd-b1e6-d1d4e7315fd2	West	1.22	2.59	2.52	3.98	4.67	U	\N						\N		\N	\N	\N	\N	1 adult and 3 children buried together (13,14,17 and 18)\nperhaps the grave was left open for a time	423113c8-965d-49ca-8b20-31d8789e5006	\N	\N	1997-01-01	\N	\N	\N	\N	\N	0.73	18	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	31						\N	\N	\N	\N	\N	\N	\N	\N	\N
4d634845-2295-4b6d-8ae7-9c2eff6749a2	West	1.56	0.56	0.94	1.79	3.33	U	\N						\N		\N	\N	\N	\N		ebaa65f0-3b14-4e5d-9ede-df25ab1aca03	\N	\N	1997-01-01	\N	\N	\N	\N	\N	1.61	19	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	29						\N	\N	\N	\N	\N	\N	\N	\N	\N
09dba05d-a5ff-4d59-a44e-7c265f572f31	Undefined	1.39	0.48	0.65	2.02	2.52	U	\N						\N		\N	\N	\N	\N	small child wrapped in blue and red wool	f03e39e8-069e-4694-9a74-08a3d535464b	\N	\N	1997-01-01	\N	\N	\N	\N	\N	0.56	20	\N	Undetermined		\N	f	f	t		W	C	U	I	\N	\N	t		f	1998	29						\N	\N	\N	\N	\N	\N	\N	\N	\N
7f5a2e6a-74e5-4809-812c-389c6ffcf460	West	1.62	1.24	1.26	2.09	3.56	U	\N						\N		\N	\N	\N	\N	called "youth" on page 132	e542e5a1-c33b-4819-a460-e8a5b7e6b341	\N	\N	1997-01-01	\N	\N	\N	\N	\N	1.53	21	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	29						\N	\N	\N	\N	\N	\N	\N	\N	\N
052a86d0-ae57-4d24-89ae-c15660f45e02	West	1.86	2.96	2.97	0.69	2.24	U	\N						\N		\N	\N	\N	\N	head west burial just beneath 16 (which was head east)\nMostly skeletalized	5b094486-61d1-4bf6-b753-d92c32470167	\N	\N	1997-01-01	\N	\N	\N	\N	\N	1.66	22	\N	Undetermined		\N	f	f	t	badly deteriorated	W	A	U	A	\N	\N	t		f	1998	33						\N	\N	\N	\N	\N	\N	\N	\N	\N
a6e68b22-9d1e-4834-bada-68e2c1c9476a	West	1.9	1.65	1.18	0.95	2.54	U	\N						\N		\N	\N	\N	\N	wrapped, but deteriorated\nthere was another burial (head-west) beneath #25 slightly to the south and the west of #25\nbecause of collapsing of the south wall-burying #25 twice before we could get it out-we left the unnumbered burial below 25 in situ	9ebb974f-85be-4dc9-9654-cd395cff6c2c	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.7	25	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	43						\N	\N	\N	\N	\N	\N	\N	\N	\N
0ca37573-5186-4cb1-aa8a-bee24be3b099	West	1.55	3.84	3.86	1.07	0.68	U	\N						\N		\N	\N	\N	\N	child, without head\nnot titled as a "reversal" on page 133	715b6d1c-c591-4333-8384-2bc86815dd93	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.43	27	\N	Undetermined		\N	f	f	f	badly preserved	H	C	U	C	\N	\N	t		f	1998	35						\N	\N	\N	\N	\N	\N	\N	\N	\N
d21adc61-0442-4af1-af72-eabec59d4636	East	0.93	0.27	0.27	1.55	3.07	U	\N						\N		\N	\N	\N	\N	Is in south wall of area, but some of the wall collapsed after the rain of 10 February\nwrapped but decomposed\n2 photographs\ntitled a "reversal" on page 133	53fea189-a63c-4af4-99dd-6d1ba8f234c0	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.68	29	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	37						\N	\N	\N	\N	\N	\N	\N	\N	\N
33e6afb7-bda5-4409-ad73-c981162057be	East	1.8	4.17	4.15	3.53	2.7	U	\N						\N		\N	\N	\N	\N	head-east burial	d6e19928-4200-4e3b-8ed7-13db0472889b	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.96	31	\N	Undetermined		\N	f	f	t		B	C	U	C	\N	\N	t		f	1998	39						\N	\N	\N	\N	\N	\N	\N	\N	\N
556f5497-c434-4e4c-8539-7fb92ce9bfbc	East	1.6	3.51	3.56	3.4	2.6	U	\N						\N		\N	\N	\N	\N	child, reversal, so head-east\ntitled a "reversal" on page 133	39fc2fa0-7061-49be-b0b4-c0e86b4f8973	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.88	34	\N	Undetermined		\N	f	f	t	skeletalized	B	C	U	C	\N	\N	t		f	1998	43						\N	\N	\N	\N	\N	\N	\N	\N	\N
a4387af4-914c-42c3-be2e-14b85f96c5eb	West	1.3	1.17	1.1	4.84	4.33	U	\N						\N		\N	\N	\N	\N	infant-badly disturbed\ncalled "child" on page 133\nnot titled a "reversal" on page 133	e2845a86-22d4-4fd1-a2c0-62c850e4f888	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.59	35	\N	Undetermined		\N	f	f	f	badly disturbed	B	C	U	C	\N	\N	t		f	1998	45						\N	\N	\N	\N	\N	\N	\N	\N	\N
8f839e60-1b01-4458-a415-3bbad015c79c	West	0.95	0.52	0.4	4.69	5.52	U	\N						\N		\N	\N	\N	\N	cluster of burials-mostly children-all together (#36,37,38,39,40 and 41)	d79dce76-4871-4ca5-93a7-ccddf8f4d64e	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.91	36	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	45						\N	\N	\N	\N	\N	\N	\N	\N	\N
bea749f3-3695-4b57-befa-ba5a9e37dae7	West	1.01	0.72	0	4.61	6.4	U	\N						\N		\N	\N	\N	\N	cluster of burials-mostly children-all together (#36,37,38,39,40 and 41)	2dd12712-6cfb-4fe0-8943-5520435462fb	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.75	37	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	45						\N	\N	\N	\N	\N	\N	\N	\N	\N
4fade3c5-fda6-451c-bc19-f1d9dba06812	West	1.02	0.83	0.7	4.84	5.47	U	\N						\N		\N	\N	\N	\N	cluster of burials-mostly children-all together (#36,37,38,39,40 and 41)	f4d8cf74-ff3f-4a9a-a797-810f3123f589	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.67	38	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	44						\N	\N	\N	\N	\N	\N	\N	\N	\N
868f6259-1b85-4bc9-ab9f-26b38c481603	East	1.1	0.82	0.67	4.41	3.75	U	\N						\N		\N	\N	\N	\N	cluster of burials-mostly children-all together (#36,37,38,39,40 and 41)	a17d16b5-aee2-4cf2-8893-5a6b0f3f722b	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.77	39	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	44						\N	\N	\N	\N	\N	\N	\N	\N	\N
a35d6894-4a27-4726-9e48-172a1eb1a91b		1.12	0.57	0.4	4.55	5.12	U	\N						\N		\N	\N	\N	\N	cluster of burials-mostly children-all together (#36,37,38,39,40 and 41)	640a8288-1495-4757-b0d8-4c400bc985b1	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.62	40	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	44						\N	\N	\N	\N	\N	\N	\N	\N	\N
27c2bb52-cd3c-472a-ac9e-369733649568		1.27	0.37	0.2	4.59	5.2	U	\N						\N		\N	\N	\N	\N	cluster of burials-mostly children-all together (#36,37,38,39,40 and 41)	09b152ba-62db-4c5f-8eef-bcd027312e06	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.65	41	\N	Undetermined		\N	f	f	t		W	U	U	U	\N	\N	t		f	1998	44						\N	\N	\N	\N	\N	\N	\N	\N	\N
903ce7ec-90f6-4157-856d-c282bca0291b	West	0.72	4.65	4.34	0.68	0.35	U	\N						\N		\N	\N	\N	\N	in north wall with rocks lying alongside body	2030b3ca-4962-42fa-b0d9-d8b088cee663	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.65	42	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	47						\N	\N	\N	\N	\N	\N	\N	\N	\N
d463bc9f-1d51-4514-8da7-2f53ce82c3d6	West	1.17	0	0.06	1.27	2.97	U	\N						\N		\N	\N	\N	\N	much ribbon-blue, yellow, red	3e0befa6-af82-4de6-80b6-237c7f2e88b7	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.77	43	\N	Undetermined		\N	f	f	f	deteriorated	W	A	U	A	\N	\N	t		f	1998	47						\N	\N	\N	\N	\N	\N	\N	\N	\N
4c9f8601-eaea-4ed6-8fae-f1b849b92177	West	1.2	1.26	1.17	0.15	0.72	U	\N						\N		\N	\N	\N	\N	infant, buried along side of another infant	6ab7609b-a9b8-42b1-b69a-d8123386ea4d	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.6	45	\N	Undetermined		\N	f	f	t	deteriorated	W	C	U	I	\N	\N	t		f	1998	49						\N	\N	\N	\N	\N	\N	\N	\N	\N
5374d7ab-3b0f-4879-b966-25e2c5e39552	West	1.3	1.45	1.28	0.15	0.61	U	\N						\N		\N	\N	\N	\N	infant, buried along side of another infant	e2f58f63-06e7-40df-aec4-a6827ad7d677	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.52	46	\N	Undetermined		\N	f	f	t	deteriorated	W	C	U	I	\N	\N	t		f	1998	49						\N	\N	\N	\N	\N	\N	\N	\N	\N
b0f933ec-f162-4a0b-b287-b111e2ad8d84		1.1	2.04	1.9	0.07	0.38	U	\N						\N		\N	\N	\N	\N	child, burial only part of body	2334b373-1f7f-4c04-b782-1a98f77f2ee9	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.43	47	\N	Undetermined		\N	f	f	f		W	C	U	I	\N	\N	t		f	1998	50						\N	\N	\N	\N	\N	\N	\N	\N	\N
a96d3513-4723-4e2e-9915-4dbe187447b2	East	1.45	0.63	0.57	0.8	-0.18	U	\N						\N		\N	\N	\N	\N	reversal, so head-east	6efca72e-88ff-4bd2-b2a9-2dd3d098efca	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.2	51	\N	Undetermined		\N	f	f	f		W	C	U	C	\N	\N	t		f	1998	51						\N	\N	\N	\N	\N	\N	\N	\N	\N
9fbceb3f-75f1-4127-aaaf-95dd945e281d	West	0.56	3.3	2.87	0.37	1.95	U	\N						\N		\N	\N	\N	\N	Beneath 7	139a0ea1-1494-421e-88c6-a9bfe8eae54b	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.77	3	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	97						\N	\N	\N	\N	\N	\N	\N	\N	\N
c60fd91d-344d-4156-98f5-cb872b3bccfc	West	0.54	3.89	3.76	1.88	2.57	U	\N						\N		\N	\N	\N	\N	associated pottery	a8d1c85e-dbfe-4d0f-b496-9942df794732	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.91	4	\N	Undetermined		\N	f	f	t		W	U	U	U	\N	\N	t	Y	f	1998	87						\N	\N	\N	\N	\N	\N	\N	\N	\N
586f5138-37fb-4e65-b914-6be3a5c9c1fd	West	0.26	4.03	3.76	2.63	3.38	U	\N						\N		\N	\N	\N	\N	burial has associated isolated skull of child-damaged	df64f05d-dad7-404c-914a-9c5a3e475479	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.89	9	\N	Undetermined		\N	f	f	t		W	C	U	I	\N	\N	t		f	1998	95						\N	\N	\N	\N	\N	\N	\N	\N	\N
aa3556da-9f2c-42bf-87b2-1b0f83ee1e27	West	0.9	2.46	2.44	1.14	2.02	U	\N						\N		\N	\N	\N	\N	called "youth" on page 134	3ba6e8b5-799f-4b6c-b1af-839542983e1c	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.95	12	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	96						\N	\N	\N	\N	\N	\N	\N	\N	\N
25bc9d43-2a60-469b-8ab8-55974e3f856b		0.85	2.31	2.31	2.2	2.2	U	\N						\N		\N	\N	\N	\N		7b9280e9-a94b-44c4-a4ed-330feefc2afe	\N	\N	1998-01-01	\N	\N	\N	\N	\N	\N	13	\N	Undetermined		\N	f	f	t		W	U	U	U	\N	\N	t		f	1998	96						\N	\N	\N	\N	\N	\N	\N	\N	\N
6961f003-0388-4007-89aa-3a6a012a370d	West	1.1	2.49	2.46	1.07	1.31	U	\N						\N		\N	\N	\N	\N	infant lying adjacent to burial #11	1e737293-aa78-4b5a-8b4c-6f3663b293f6	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.44	14	\N	Undetermined		\N	f	f	t		W	C	U	I	\N	\N	t		f	1998	99						\N	\N	\N	\N	\N	\N	\N	\N	\N
7d2a5c1f-a717-4b07-bb3f-a4ebf6997607	West	0.83	2.02	2.42	3.32	4.87	U	\N						\N		\N	\N	\N	\N	hair has some sort of resinous material on it, perhaps body fat	101a9182-fd8f-415e-a946-01d5decd66f3	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.63	15	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	99						\N	\N	\N	\N	\N	\N	\N	\N	\N
98502b4c-d6d1-4e1d-a247-0806047fb937	West	0.67	1.52	1.52	3.26	3.26	U	\N						\N		\N	\N	\N	\N	Newborn\ncalled "newborn" on page 134	16a11217-1b49-49e0-9652-5e8af3fd0a5c	\N	\N	1998-01-01	\N	\N	\N	\N	\N	\N	16	\N	Undetermined		\N	f	f	t		W	C	U	N	\N	\N	t	Y	f	1998	99						\N	\N	\N	\N	\N	\N	\N	\N	\N
5bfb2eb7-f024-4658-a5b4-5e77b33aeedf	West	1	0.82	0.59	2.13	2.7	U	\N						\N		\N	\N	\N	\N	Part of a cluster with 1 adult and 3 children	e194eb7d-72f7-4018-a4ca-889ba66b7a40	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.71	18	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	105						\N	\N	\N	\N	\N	\N	\N	\N	\N
0b3418dc-2ec2-4076-b32b-8828ab14d51a	Undefined	1.11	2.04	2.04	2.29	2.29	U	\N						\N		\N	\N	\N	\N	bundle of yellow wool tied and patched\nage left blank on page 134	0da9d012-ae1d-4ad9-a745-ab9ae954e1e3	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.11	19	\N	Undetermined		\N	f	f	t		W	U	U	U	\N	\N	t		f	1998	101						\N	\N	\N	\N	\N	\N	\N	\N	\N
31d0cd86-c208-4625-83e0-7ff34346fb8c	West	0.75	3.8	3.84	2.74	3.47	U	\N						\N		\N	\N	\N	\N	wrapped but ribs are showing\n#20 and 26 are part of a cluster of child burials, 3 or more of which are directly north of #20 and 26\nburial #26, and newborn, was found lying immediately on top of #20\ncalled "youth" on page 134	4afe4d59-2181-415d-a51c-f792ad248e17	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.74	20	\N	Undetermined		\N	f	f	t		H	C	U	C	\N	\N	t		f	1998	103						\N	\N	\N	\N	\N	\N	\N	\N	\N
2e93124e-02e5-4845-9648-fcaf6eaf4904	West	1.09	2.14	2.2	2.52	3.2	U	\N						\N		\N	\N	\N	\N	has torn linen strips for ties over fine linen shrouds	ee042074-a8e9-47c5-95e6-3a3037b84611	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.7	21	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	101						\N	\N	\N	\N	\N	\N	\N	\N	\N
593c101b-c549-42fc-a6ce-b42b176c581b	West	1.15	2.04	2.06	2.59	3.34	U	\N						\N		\N	\N	\N	\N	has torn linen strips for ties over fine linen shrouds	df485cce-d268-4681-bb7c-8aca79046f47	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.81	22	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	101						\N	\N	\N	\N	\N	\N	\N	\N	\N
063b5f2a-2698-44de-85a4-a0873f43a39b	West	0.99	0.59	0.35	2.78	3.49	U	\N						\N		\N	\N	\N	\N	Part of a cluster with 1 adult and 3 children	51b96a7d-ed6b-4913-b445-1e21c9f8f7c5	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.8	23	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	105						\N	\N	\N	\N	\N	\N	\N	\N	\N
c468120a-a00b-417a-a017-f1843d8777a3	West	1.02	0.43	0.03	1.82	3.45	U	\N						\N		\N	\N	\N	\N	Part of a cluster with 1 adult and 3 children\namphora base was adjacent to the head of #24\na large stone is over the lower parts of all burials\nburials #17,23, and 24 have feet beneath the stone\nwhite-slipped pot south and above feet of #24\nfine-blackened pot beneath the white-slipped pot	4164fb0a-9b1a-4d39-91f1-31426bf93118	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.77	24	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t	Y	f	1998	105						\N	\N	\N	\N	\N	\N	\N	\N	\N
eed1e3bd-b921-42e9-9ec2-b6de8c366981	West	0.7	4.26	3.96	0.44	1.19	U	\N						\N		\N	\N	\N	\N	burial is placed on the edge/lip of a shaft which continues to a greater depth	2e886d04-17fd-400d-a63f-1578461d0afe	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.82	25	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	103						\N	\N	\N	\N	\N	\N	\N	\N	\N
1de3db72-1d1c-4506-bed1-4624cd1b6bd0		0.75	3.82	3.82	3	3	U	\N						\N		\N	\N	\N	\N	no skull	dfe8bf44-7e84-49f3-9913-15bba77f279b	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	Undetermined		\N	f	f	t		W	C	U	N	\N	\N	t		f								\N	\N	\N	\N	\N	\N	\N	\N	\N
fbcb5ddb-94c8-460a-9e95-bddf0170f067	West	1.02	0.41	0.17	1.92	3.37	U	\N						\N		\N	\N	\N	\N	wrapped, but badly decomposed	b5960c52-04e9-44c3-a8ee-1065544dfe0b	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.64	27	\N	Undetermined		\N	f	f	t	badly decomposed	H	A	U	A	\N	\N	t		t	1998	107						\N	\N	\N	\N	\N	\N	\N	\N	\N
a77ecfc2-4b64-4a56-86a9-cf19b098e3a5	West	0.94	3.48	3.02	2.87	4.22	U	\N						\N		\N	\N	\N	\N	infested with bugs	1f92da42-5626-4ebf-8cdd-592483d75808	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.46	31	\N	Undetermined		\N	f	f	t	infested with bugs	W	A	U	A	\N	\N	t		f	1998	109						\N	\N	\N	\N	\N	\N	\N	\N	\N
58f9ff36-6fe9-45c5-bd27-28ca99bd76b3	East	1.34	1.63	1.63	0.79	5.85	U	\N						\N		\N	\N	\N	\N	reversal (head-east) with feet extending into SE area	31131174-99ee-40a1-955d-a67c4ac63546	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.67	32	\N	Undetermined		\N	f	f	f		W	A	U	A	\N	\N	t		f	1998	111						\N	\N	\N	\N	\N	\N	\N	\N	\N
19fefc99-785e-4acb-9e3b-2d68de201e08	East	1.3	3.37	3.4	2.15	1.63	U	\N						\N		\N	\N	\N	\N	child reversal (head-east)\nsitting on top of sterile soil	eddd87e1-10e1-4d3a-8521-42327f773074	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.65	33	\N	Undetermined		\N	f	f	f		B	C	U	C	\N	\N	t		f	1998	111						\N	\N	\N	\N	\N	\N	\N	\N	\N
e06835ac-0624-41c1-b1a6-83b8e69483fd	East	1.73	3.42	3.55	0.9	0.17	U	\N						\N		\N	\N	\N	\N	small reversal (head-east)\nno textiles, no tissue\nbeneath the child in an offset chamber (to the north) was an adult reversal (head-east)	7f899144-0803-4c79-bbba-d0eb0869b399	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.73	34	\N	Undetermined		\N	f	f	f		B	C	U	C	\N	\N	t		f	1998	113						\N	\N	\N	\N	\N	\N	\N	\N	\N
639181b2-8f70-4e15-9348-24219a84484a	East	1.4	2.1	2.22	0.82	0.3	U	\N						\N		\N	\N	\N	\N	child reversal (head-east)	ee526c03-4538-4772-8503-c12a09d96a70	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.63	37	\N	Undetermined		\N	f	f	t		B	C	U	C	\N	\N	t		f	1998	117						\N	\N	\N	\N	\N	\N	\N	\N	\N
f0bbacc2-05a0-4751-a5c5-18699f6d7dfb	West	2	1.95	1.78	3.12	4.76	U	\N						\N		\N	\N	\N	\N	totally skeletalized	6a4601de-f06a-43fa-acac-38ace46fe766	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.73	38	\N	Undetermined		\N	f	f	t		B	A	U	A	\N	\N	t		f	1998	117						\N	\N	\N	\N	\N	\N	\N	\N	\N
d574e404-629a-4fc2-bf2f-4f7113908f54	East	1.52	2.31	2.8	2.23	1.45	U	\N						\N		\N	\N	\N	\N	child reversal (head-east)	e719e349-4235-44db-90b7-79cb42f16905	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.83	40	\N	Undetermined		\N	f	f	t	deteriorated	W	C	U	C	\N	\N	t		f	1998	119						\N	\N	\N	\N	\N	\N	\N	\N	\N
f6686cd7-58dd-4aa5-8043-2c7814b9634b	West	0.65	4.59	5.05	0.17	1.95	U	\N						\N		\N	\N	\N	\N	close to surface with #44 having head near pelvis of #43	9bf78e18-45f6-42fc-bd3c-6666ebe6f30d	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.85	43	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	123						\N	\N	\N	\N	\N	\N	\N	\N	\N
41a1ec7a-d916-4aa5-9c3c-fe9fc2fc3d1a	East	1.91	0.6	0.84	3.88	2.46	U	\N						\N		\N	\N	\N	\N	skeletalized reversal (head-east) in a shaft	f907d871-ae6e-459b-899a-6134a58984b3	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.63	45	\N	Undetermined		\N	f	f	f		B	A	U	A	\N	\N	t		f	1998	123						\N	\N	\N	\N	\N	\N	\N	\N	\N
13f36acf-cca6-4bce-9930-2351c8fe8751	West	0.97	0.56	0.23	4.62	5.99	U	\N						\N		\N	\N	\N	\N	burial #49 is on top of #50	8f31fd48-1364-4fb4-b4f4-53f3da84faf0	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.48	49	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	128						\N	\N	\N	\N	\N	\N	\N	\N	\N
f95679cb-05c4-42fa-abf3-44cddecf8e21	West	1.37	0.85	0.74	4.59	5.96	U	\N						\N		\N	\N	\N	\N	#50 is on top of #51	31a2e8e6-741e-436d-b8fe-13e6e702168c	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.5	51	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	128						\N	\N	\N	\N	\N	\N	\N	\N	\N
070432da-1605-4375-9b44-68f3ab8111d0	West	1.45	0.88	0.54	4.2	5.76	U	\N						\N		\N	\N	\N	\N	burial #52 beneath #51	25445539-f919-4bea-b68b-1fbcbf309488	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.6	52	\N	Undetermined		\N	f	f	t		W	A	U	A	\N	\N	t		f	1998	129						\N	\N	\N	\N	\N	\N	\N	\N	\N
67ee82e5-b804-4abd-99f6-80019f9cea9e	East	1.25	4.55	4.61	2.45	1.51	U	\N						\N		\N	\N	\N	\N	child reversal (head-east)	7bedd6c7-957e-4c3a-8aab-16c688424d5d	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.9	54	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	130						\N	\N	\N	\N	\N	\N	\N	\N	\N
423838e0-6cbe-427a-815f-1587cba6d9f0	West	0.4	4.34	4.11	2.69	3.35	U	\N						\N		\N	\N	\N	\N	there may be 2 bodies mixed in 55 rubble	e7bf2f39-e568-4fd9-885f-4e95a101cfae	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.63	55	\N	Undetermined		\N	f	f	t	disturbed	B	C	U	U	\N	\N	t		f	1998	130						\N	\N	\N	\N	\N	\N	\N	\N	\N
edb53edb-4fb1-4908-8335-2748f7fb580d	East	1.48	4.95	4.68	2.98	1.6	U	\N						\N		\N	\N	\N	\N	reversal (head-east)	369202a4-226d-4861-b125-6a00ab5a5417	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.76	56	\N	Undetermined		\N	f	f	t		W	C	U	C	\N	\N	t		f	1998	130						\N	\N	\N	\N	\N	\N	\N	\N	\N
b9a2e9b1-ba5a-43fd-b62f-c1e3d14f52e1	West	1.54	3.63	3.52	3.32	4.4	U	\N						\N		\N	\N	\N	\N	called "youth" on page 134	6e7801cd-9a14-461d-bb94-5effd335a92c	\N	\N	1998-01-01	\N	\N	\N	\N	\N	1.09	57	\N	Undetermined		\N	f	f	t		B	C	U	U	\N	\N	t		f	1998	131						\N	\N	\N	\N	\N	\N	\N	\N	\N
2bd1360c-2386-4c58-8281-65bd614462b7	West	0.87	4.3	4.37	2.82	3.35	U	\N						\N		\N	\N	\N	\N		c54162b9-74eb-4dad-bacc-45fd3eaf7443	\N	\N	1998-01-01	\N	\N	\N	\N	\N	0.53	58	\N	Undetermined		\N	f	f	t		W	C	U	U	\N	\N	t		f	1998	131						\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: carbon_dating_analysis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carbon_dating_analysis (carbon14_id, sample_id, rack_num, tube_num, sample_description, size, foci, location_description, question, age_bp, c14_calendar_date, calibrated_95_calendar_date_max, calibrated_95_calendar_date_min, calibrated_95_calendar_date_span, calibrated_95_date_avg, notes, area, category) FROM stdin;
56914094-9d98-448f-a86d-e5c4be2574d9	\N	5	\N	TOMB 5 TEETH (5)	15	5	Hill B excavation; east side of Hill B; possibly from tomb 5	Hill B burials are likely Ptolomeic contrasted with the open burials which date to Roman. Are Hill B burials Ptolomeic?	\N	-157	-360	-167	193	264 BC	Arizona Lab	4	Hill B
47b93670-1c8b-4a5b-9e36-327a7fee6802	\N	31	\N	Muscle tissue from face, maybe burial 2?	15	5	Hill B excavation; west side of Hill B; possibly from tomb 1	Hill B burials are likely Ptolomeic contrasted with the open burials which date to Roman. Are Hill B burials Ptolomeic?	\N		Ca			321 BC	UCI Lab - dating discrepancy	1	Hill B
0482cf68-4d09-4128-ab58-9986b4de54a6	\N	31	\N	Muscle tissue from face, maybe burial 2?	15	5	Hill B excavation; west side of Hill B; possibly from tomb 1	Hill B burials are likely Ptolomeic contrasted with the open burials which date to Roman. Are Hill B burials Ptolomeic?	\N	-817	-1050	-922	128	986 BC	Arizona Lab - dating discrepancy	1	Hill B
6cdad646-30ea-46bb-9e26-b22bfc5a1006	3913dbf9-4405-41ae-8dfe-13e602414704	13	\N	Teeth 4	15	4	Deepest Head East at 2.3m; Adult	What is the age of the deepest Head East burials? Is there a relationship between depth of burial and chronological date?	\N		-206	-55	151	131 BC	Arizona Lab	\N	Deepest East
8bf18a37-6026-4589-bf8d-268cccd102b8	a68de78e-c5ab-415a-84f9-98509eb1d706	8	\N	Rib fragments 4	15	4	Deepest Head East at 2.3m; Adult	What is the age of the deepest Head East burials? Is there a relationship between depth of burial and chronological date?	\N	96	25	130	105	78	Arizona Lab	\N	Deepest East
a3baba7b-df21-4284-86c2-a66b215a2452	8ff4a6b0-a779-444b-a1ed-78be5d077a9a	31	\N	Teeth 2	15	1	Deepest Head East at 1.92m; Adult	What is the age of the deepest Head East burials?	\N	-215	-324	-205	119	265 BC	Arizona Lab	\N	Deepest East
dbbf0317-3b7f-4183-a042-c24f088fc471	eb5189b3-827b-4cea-9940-589111177a26	3	\N	TEETH (4)	15	2	Deepest Head East at 2.3m; Adult	What is the age of the deepest Head East burials? Is there a relationship between depth of burial and chronological date?	\N	47	-39	76	115	19	Arizona Lab	\N	Deepest East
7a521162-cb37-4234-805c-b08f9298e6a1	44c43806-d235-418e-b2a7-bc0b43831909	15	4	Teeth 5	15	3	Deepest Head East at 2.64m; Adult	What is the age of the deepest Head East burials? Is there a relationship between depth of burial and chronological date?	\N	-116	-210	-87	123	149 BC	Arizona Lab	\N	Deepest East
0ea95f50-c9ad-43ec-bede-492fab9959b1	\N	\N	\N		\N	\N		Deepest head east burial	\N					155	BETA Analytics	\N	Deepest East
699be31f-eb9b-43dd-afe6-0f45f66e337b	297469c6-0ebd-4ebf-b1cf-2312177d7c0e	15	\N	Teeth 3	15	4	Deepest Head West at 2.87m; adult	What is the age of the deepest Head West burials? Is there a relationship between depth of burial and chronological date?	\N	97	5	135	130	70	Arizona Lab	\N	Deepest WEST
d46962d4-785d-421f-9243-bb30592c45a1	\N	14	1	Teeth 5	15	1	Deepest Head West at 2.34m; Adult	What is the age of the deepest Head West burials?	\N	173	86	239	153	163	Arizona Lab	\N	Deepest WEST
391cd075-05b0-4e81-b1cc-a6f8cb93583f	\N	3	\N	TEETH (9)	15	2	Deepest Head West at 2.2 m; Adult	What is the age of the deepest Head West burials? Is there a relationship between depth of burial and chronological date?	\N	120	52	175	123	114	Arizona Lab	\N	Deepest WEST
0fe906c2-f809-46db-b178-9d0044bedf91	5db352c5-b678-432e-8c98-4645754865ec	10	\N	Teeth 3	15	3	Deepest Head West at 1.95m; adult	What is the age of the deepest Head West burials? Is there a relationship between depth of burial and chronological date?	\N	63	35	121	86	78	Arizona Lab	\N	Deepest WEST
6be9f471-3dbc-41d1-9213-49957624ae55	\N	\N	\N		\N	\N		Deepest head west burial	\N					195	BETA Analytics	\N	Deepest WEST
716f31f8-a044-4ba5-bc0b-c61714e2bb5c	2bf1dbf0-004f-401d-ba68-49eece7786f6	30	\N	Teeth 2, skin, bone fragments	50	1	Meter depth (1.0); Head West; adult	Are burials at 1 meter in depth the same age across the cemetery?	\N	310	315	397	82	356	Arizona Lab	\N	One Meter Deep
0c601154-7ae7-47c6-aa57-7dbcaa2fbd9d	7297e500-4388-4ef0-b588-00589b7b8144	31	\N	Teeth 3, rib fragments	15	1	Meter depth (1.25); Head East; adult	Are burials at 1 meter in depth the same age across the cemetery?	\N	193	126	252	126	189	Head East	\N	One Meter Deep
5600379d-4d1b-4b05-b932-6d83ec8209ac	618d8141-eb83-4b93-a826-d2d8ee8d9861	3	\N	TEETH (10) THREE HAVE JAW BONE FRAGMENT ATTACHED	15	2	Meter depth (1.0); Head West; adult	Are burials at 1 meter in depth the same age across the cemetery?	\N	381	337	474	137	406	Arizona Lab	\N	One Meter Deep
0c251529-7b33-415f-be56-8d20edd8cd80	b34aa467-079c-4afe-b48c-d134b41be5f3	10	\N	Teeth 4 caries	15	3	Meter depth (1.0); Head West; adult	Are burials at 1 meter in depth the same age across the cemetery?	\N	387	343	475	132	409	Arizona Lab	\N	One Meter Deep
b3e2ed31-0673-4826-bf92-ba0c4a6200f6	41c25290-cf85-4deb-a4c4-bd7a869e9430	4	\N	TEETH (3) JAW BONE FRAGMENT	15	4	Meter depth (1.23); Head East; adult	Are burials at 1 meter in depth the same age across the cemetery?	\N	201	129	252	123	191	Head East	\N	One Meter Deep
d13a8935-fc8a-447d-aeda-25acd983aef1	64a33c82-fad6-402d-9fad-486f877ed5c6	4	\N	TEETH (6)	15	4	Meter depth (1.0); Head West; adult	Are burials at 1 meter in depth the same age across the cemetery?	\N	429	409	540	131	475	Arizona Lab	\N	One Meter Deep
fe5b5f69-329d-4f82-8780-0a487f144993	9be6efd1-402c-4b5d-abed-843308e248b4	7	5	REED	15	3	Plant vs. Human Remains; shallowest burial (0.08)	Is there a difference between the chronological dates of remains and burial artifacts? What is the date of the shallowest burials?	\N	512	474	611	137	543		\N	
5f91e121-a3d2-4374-b765-0b5b7fb36eb6	9be6efd1-402c-4b5d-abed-843308e248b4	15	1	Teeth 3	15	3	Plant vs. Human Remains; shallowest burial (0.08)	Is there a difference between the chronological dates of remains and burial artifacts? What is the date of the shallowest burials?	\N	456	423	553	130	488		\N	
7e4e2a57-e617-4913-8e3a-0c3f7eb05bef	8f66e4f6-044a-4ef7-a08a-bee2560b173f	\N	\N		\N	\N		Earliest Christian symbol	\N					595	BETA	\N	
094bd2c1-0726-402d-b433-8f048333f95b	ec0fab46-6f4e-491a-a503-e2cc3e012a93	\N	\N		\N	\N		In the same shaft, when did burial reversal occur?	\N					380	BETA	\N	
b0bed4e9-ca73-400e-8898-07cc8f5a4dc3	031a735c-43e6-4998-b92f-b248b2f0e90c	\N	\N		\N	\N		In the same shaft, when did burial reversal occur?	\N					275, 370	BETA	\N	
\.


--
-- Data for Name: femur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.femur (femur_id, femur_head, epiphyseal_union, femur_length, burial_id) FROM stdin;
470c635a-a44b-4ae1-b6ed-870dd837c77f	39.4		42	b9343cb8-c0fc-441d-b674-d7efd3ced858
f7413bbf-9291-4d11-a7ef-36163bbd74ab	47.5		49	48600b03-0235-4eb5-b6bf-ad5799e411f7
97e4b43d-6a68-4bfe-a998-21661ea20e7c	46.5		46	4949287e-e88c-494b-b9f3-db36e663b0b1
ca2c6c2a-5ef0-43a1-bee1-63601b407ebd	47.9		47	c00a4576-383a-4f92-bb12-15a29c49f507
1a66150b-b69c-4d58-aa9f-aa707eafa56e	44.2		\N	e7fcac0e-9b76-4259-ad25-a1ca80a693bc
b581d926-8acb-4605-b44b-1137c4530f13	48	Yes	\N	1a7e4796-9b8a-4635-9b09-8e555cd4cfb9
2ff58043-a072-47f6-b7ed-792cf576a110	48.5		\N	518fea4c-0d82-47f4-9e78-1a087fb8acc7
01f2decb-87c4-4f48-b9b8-ec1aeea21de1	45.3		45	21f4d50f-62e9-4390-84d9-da42b0b08980
274bf38a-ce3b-4be7-a035-7e5df642557d	46		\N	e5275e46-467a-4425-b3a2-bd74f4258653
77a5163e-f9b7-45b2-a9cd-c071893714c5	46.5		44.5	771934d1-6ee3-4bbf-b75a-c96528810f6d
0793295d-47b5-4c0e-94fb-38bcaab0e8ef	49		\N	e3f5d2c2-a405-4660-8309-eb4e47e599b0
8fca0172-3883-491a-b526-6c5e108db33f	44.2		41.5	cfa91b40-5db4-42a1-bed5-094a4818592d
c77f8e62-517d-4b74-beac-25f54a313218	46.5		\N	06ee70b2-7f2c-4dab-ba73-a8a9bc1f6eeb
5350041d-9430-4e15-9061-ca037f4a7aa3	48.5		\N	b5f788b4-fc87-410e-a69d-2b13240a9597
d246ed23-0bd0-46af-b4e0-411e2e48caa4	52		\N	aae56282-8f9a-460a-b3e0-98d366d84105
7a15b79e-4613-4410-ab15-79e31836ee1a	49.5		\N	1b4be0aa-4d04-48f3-8b9f-96c31f3468d2
4b82f5fc-1966-450e-af5f-17ec56631469	47.1		\N	a78d99a5-2f11-49ff-a3a6-b2a29618c809
eb8a1ea5-0395-4177-a1c0-2f6a5b39d87c	16.6		16	1128459f-8fbe-44c6-bc13-e53e83d2db99
40cb287c-9e4c-4b02-acff-d0176279e07f	40		\N	9af52b1d-b882-4bad-aa24-4ea26c33dae2
c6209499-ec50-4546-94aa-118f9c02e6a7	49.6	Yes	\N	26ab3ac0-9e01-4b56-b5b9-ee565955f3c9
7e57b81b-1ad6-4210-9516-9fa4354e0802	54		\N	711cc456-b320-418a-8b3b-456ed27995a9
9d76b97b-c3bd-4f61-8baf-61651e9bddbb	48.4		\N	5a2d4f6a-0afa-46f0-9589-6f0766ed89d2
334379c5-537c-4686-9127-b1c6cff3cea4	46.5		\N	21c3b37c-4718-4292-b715-3568da2c9cf0
17297c67-1f7c-440b-8bc1-9f937c667d18	41		\N	9aaafd10-2994-4d23-9d15-8090aa48b2a8
1506d056-4494-476c-a448-4448e4628728	47		46	496df30f-fe73-4a01-bde7-13a197ed3746
52ed5c2b-9acf-4605-b0f2-3c2ffd4e4403	40.1		39	44f9d4a8-bca2-4ebd-8fb1-31326d62d6e9
5bef8569-1fbf-40bd-800e-eb7a47308471	42.5		44	9f3da3bd-228a-4252-acff-da4d5bc28a20
1dd9b76e-36c6-45fe-acae-8b68e97788dd	\N		8.2	8da14029-2900-4e56-9cb1-9f55015aa8a9
f9324a2a-ee68-477a-b3dd-a7c822272c05	40		40	0a048a5d-151a-48ab-a027-ebf29d671ead
fd979420-802c-4cd9-8f57-eeaa8ec8ed58	\N	No	20.5	ac9da490-145b-4d1a-831a-08aad63ce0b8
8b48f80f-54e7-418d-a576-4632c8e7e886	48		45.7	792b5cb5-4e4d-4db7-a3d4-ff83e80b9422
750ad69c-e739-4b18-8c09-08f7b472d0f1	49.3		46.5	785306e6-f2a9-4609-bf05-62f75a56a8ff
758f5db5-3c1e-4f4a-add2-5642f2803f53	45.1		41.5	3d41fc98-eb65-4a74-9ef0-82f6356be219
e6e7c7b4-ba69-4a42-b2ee-2b6c42ad11a0	40.7	Not complete	41.9	fc6667dd-e81c-4c87-9b85-62204347d3d3
ee63666c-27cf-4278-aa93-234b57ca6b1f	50		49	02219761-b1a0-4dc2-a50d-738fd566da31
3a2583c0-04df-4ace-acf2-cddf346f162b	\N		17	f1289f19-7763-4b66-a677-621cf1c20a92
7082e661-469e-4579-84b3-454183db3251	\N	Not complete	42.9	9e865cb9-6f11-4b96-8577-3415f167b569
67a0e397-da4c-4eb8-96c8-1e498d2b8956	46.2		41.2	5943a683-e1e0-424e-aa1c-a1c67202a29b
fc5497ed-a817-4b03-86fa-4ad857d06d50	44		41.4	492e0ac1-3a64-41b4-9a32-821b796bdb49
e473bc6c-474c-46ec-bc7f-4dc6360765d0	38.2		42.9	a3d45155-a4f3-4eee-b97a-99ec22ba78ca
10bfee7b-8896-466c-9063-a2f89fefe7cb	46.1		45	7d26f8e9-35e5-4223-89ef-31a566af274d
5bcb6e4c-63e4-44dc-b1f0-6014a43a449c	41.5		44.4	7aa84adf-7c0f-448a-9dfd-73758e91420c
dba873bc-38d3-424e-937e-6f68f356af22	40.7		41.9	f088d641-4f69-481f-a10b-f4dae92c858f
020c87e0-ec79-44c8-acd5-20e0752098a7	45.9		44.4	f1fe3d52-bb24-4ec4-a5ff-ed3e09e80ca1
bd0ead83-eb42-4892-bd5c-4385ef1ea729	\N	Incomplete	42	a2d54847-3ffb-403c-9e7e-2e7efa1ae913
8f736462-17b3-4565-8ad4-7ddc108dc31f	42.4	Yes	44.2	f5aeb75a-1c2a-433d-8909-e3af4e383fec
309f6821-3bd6-4c66-8cb7-5e290be80d08	45.1		43.9	e826dc44-3a37-42e9-aea2-09c7569e7a25
e6e36b23-c21f-4db1-a7e7-cfef999fc272	\N	No	17.8	fe754099-e639-4119-94ac-c527b952fa37
bdb8aac9-f742-4cb0-a100-a8d29a24e6da	40.8		41.9	5cca7466-adf0-4c01-8954-41fefe88c7c8
158f07f3-7b56-4cf2-b996-3e0a05e9c360	40.6		42.1	cc8b2221-3a54-42c9-a18f-489c8b88d81a
9b253020-d990-485a-82f6-b9166ba24158	49.2		50.9	90086175-e13c-4921-a0cc-4e126df936a0
882d914b-aaea-4995-8bc3-692bfbf048f3	40.29		42.2	0f6f386d-71e7-4ef7-b8a8-a375809ddee5
1080a55a-82aa-479e-9a85-6d75ee412172	\N		41.2	a0d91e8b-0e9d-4a02-9d7c-0e0e76fe41fc
a3428721-ba7c-4300-bb29-4b7c1d17ad6d	48.5		48.5	cf5561d2-5b07-45fc-a1d7-a8674bbc3322
0763f2fc-a862-4c20-99e0-4fe7aa2886b6	46.8		45	83c920b5-2a0a-49e8-96a7-4f755eb840b8
b154a0af-5eab-4bdd-86b6-7db6044cf3fa	39.4		43	2b909c93-f11a-4811-ba46-7c0db49fee9a
a5a03b01-0a1e-4fcd-b6ab-73e4fad6ddc0	37.5		41.1	b62aae86-84a3-4a51-b1cc-c05a81a14baf
1555ddfe-bfac-48fe-a752-ce3f045c9c2d	\N	No	33.7	faf47ea5-a8d4-44d4-b2f0-994a7728d4ad
31d105d7-eafd-4ce0-90eb-44e90a30db58	\N	No	33.2	76e8762b-66fd-4315-841d-37407999f182
84b9c3b0-e458-441f-a14f-2a43c17847df	46.4		44.2	bf9658ad-5d41-4329-9cbf-54526e623b99
f3a23ed8-ec9f-48fc-9066-d9d364fa9a23	40.6		37.9	c92d8414-931f-4d7b-8cdc-95c70ea14d96
6efd5366-597e-4bfd-afc8-6f4c54884da2	48.8		46	e666fe14-1d29-44d1-a1d8-4b2ad323b0d5
8417c608-1e60-4a2d-bae1-376b497a3422	\N		45	93669230-11ff-47be-9aa7-a41072ee8572
34f1ee4f-f115-44d2-9597-2b002211e4f1	47.1		43.7	38cb1ef4-7f1a-4f6c-a0bc-5f20573d0b25
b422b9e9-a5b5-4998-87ac-b1ee90c3ff9b	46.8		46.7	77aac0c8-b43c-469d-b6a3-3856ef509b37
189c5e9c-5ca3-4afa-b9a7-79bed97259f1	39.8		40.6	1f48a247-1575-43e0-a4fe-c9ada6e59cb9
f345f87d-4c92-41a7-a64b-fa0d62e7fca2	47.8		45.8	55054886-0b9d-41e6-84bd-8ee676747715
932afdce-884d-4ad6-bade-94e911c8b52f	38.4		44	5e57cbaa-38a3-49b5-bddc-f3f16402dfe7
c2befbe0-b177-4cec-9213-152b538bb0bd	43		39.6	5a8cd9ea-75e2-41c3-bace-2964bfb7a90e
81d1f024-290a-4e49-8f4b-f4368cbf5b18	39.8		42	8c3d255c-baa6-4405-a31d-fc6246b55ece
9a8e633b-7ccc-45c3-954f-ac258922f819	43.9		46.5	4dd58f49-eaaf-4c92-baff-03d320cdc452
36be0d93-750c-4813-a8ef-e78d0ceb3e56	48.1		47.1	66c9a3bc-8184-4fd9-ba37-d03b966a583c
f21e8778-c061-4b1a-9a9f-dd6c6fc784cf	42.9		42.6	8c70b37d-297e-4fe8-b2d5-73adefb9facb
b6f30ba2-eb4e-4be5-b05e-5cfc664b8ad4	38.3		40.9	28d3331f-5a1d-4274-9c0f-35507a45125e
63517509-ef24-49a0-924a-ad5588520cf6	40.1		43.2	429bf8cc-8686-4a6a-bcfa-1792d6885a49
4baae076-18fb-4cdb-a910-69b03ff32582	47.3	Yes	45.2	662e9451-ea7c-4601-add5-7fe9b083f150
c8605463-af73-4da0-bdcc-d1a631cad044	27.6	No	30	62636b54-3de3-4491-8e36-0dc3e2547211
08032832-f0c1-4661-9154-8b5d3da99d72	47.9		43.7	52374906-4df0-40ac-99f6-533f5f6143cc
e0ddcd85-0bcc-4050-9ffb-572556d8bf5a	55.4		49.4	fe72cbdd-f428-458f-bf43-3e291f5dc774
c0abe396-3e2f-49c1-90af-87701d1085cc	44.2		43.2	3ae88bd5-64cf-4e94-a6bd-55ac758c5c48
d088e90c-8724-4009-affe-4ee8cc67b67a	42.2		44.5	0766d877-a633-47c5-9c0c-c72bc8a57f0e
09488e72-5034-4803-8cf5-a035f7ede725	46.7		42.1	c5e8d6e4-ce35-483f-9fe7-8c2824eee368
b016012a-44f0-4685-be31-4a2dd834b236	46.5		43.5	2c672331-9224-4863-970e-a4e874062706
3ae42523-ea42-4b1f-8b4c-fb7118e9f980	40.4		39	f1974c33-fe69-48aa-9a94-4982bbdb047d
4779a470-8a0b-4a7b-b926-9277e36e1386	47.9		46.2	f99998c0-d980-42e7-af36-2b9006330ffd
daf04cf9-645b-4800-b84e-9d4d5c52452f	47.8		46.7	8e295c36-94a9-4356-839d-1c07366a65f8
370852e9-6f67-4bb7-8a12-80f69f63e9be	46.3		44.1	2bac0a43-0d42-4698-be9b-325f0a6ef3ef
51d4f64c-8835-476e-9def-3e37381273f3	43.4		41.8	17e7d441-e2d6-49dc-a16d-8fe7f702c381
0c97c6ac-5c34-40f3-834a-7ebd316823d7	44.5		42.7	27a0890e-3302-4ccf-9e92-f150229008e7
76d84eb9-b93d-4059-aa36-e86431952205	46.1		42	fd99bc08-9e0e-4d4d-bd96-4e4fc5f7c40e
08818a08-4c9c-46fa-a9b5-0eae44a97d28	40.9		41.2	0846c7fe-64bb-49d1-8afb-a9f0c7769435
\.


--
-- Data for Name: humerus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.humerus (humerus_id, humerus_head, epiphyseal_union, humerus_length, burial_id) FROM stdin;
a7d2f229-0beb-45a5-a331-eda839a2262e	38		28.5	b9343cb8-c0fc-441d-b674-d7efd3ced858
9b2b96e2-c2e2-410c-a1ad-0a878c9758fd	44		33.3	4949287e-e88c-494b-b9f3-db36e663b0b1
b977bd65-f6e4-429d-b65f-752c5e76225a	45		34.2	c00a4576-383a-4f92-bb12-15a29c49f507
ce0bf4c8-5330-4cd1-85b0-70f65694b663	43.5		\N	e7fcac0e-9b76-4259-ad25-a1ca80a693bc
f72d7ebe-ac79-48dd-a2ed-ff38dab49d93	50	Yes	\N	1a7e4796-9b8a-4635-9b09-8e555cd4cfb9
3fb69d89-da13-43e0-9d60-d0f148762a2f	55		\N	518fea4c-0d82-47f4-9e78-1a087fb8acc7
ae8d261d-a7c7-4e8e-a321-b82ee7d84734	50		\N	f7d0ec48-1804-4000-bfa4-cdb8f760fa37
df01886c-7b1d-4995-a1f1-bc545f914faa	35.7		29	21f4d50f-62e9-4390-84d9-da42b0b08980
c11a2be2-c124-4697-b173-2db8e552747d	44		\N	e5275e46-467a-4425-b3a2-bd74f4258653
b44be30f-5248-4419-bd7a-6eefb9196d4d	42		32.6	771934d1-6ee3-4bbf-b75a-c96528810f6d
fc3742b6-781b-4d8f-a33b-167582b74a6f	50		\N	e3f5d2c2-a405-4660-8309-eb4e47e599b0
fb35665d-7647-4720-ac27-37df82e8c8bb	39.9		29.3	cfa91b40-5db4-42a1-bed5-094a4818592d
655fa739-341a-418e-a581-bfd74c8e178c	48		\N	06ee70b2-7f2c-4dab-ba73-a8a9bc1f6eeb
a501014d-08b7-4d77-aba0-90de52ac2aea	42.4		\N	b5f788b4-fc87-410e-a69d-2b13240a9597
657321a1-987b-4f3f-8c07-bb6ea6b993ff	46.5		\N	aae56282-8f9a-460a-b3e0-98d366d84105
8bf61fec-314c-4563-a38c-cfd44e59649b	43.6		\N	1b4be0aa-4d04-48f3-8b9f-96c31f3468d2
52850cf6-509c-4335-a97d-ece60c24ee1b	42.1		\N	a78d99a5-2f11-49ff-a3a6-b2a29618c809
46bad1c0-af98-4c12-b0d2-dad5e0f707cb	38.3		\N	9af52b1d-b882-4bad-aa24-4ea26c33dae2
ec4b7c0b-7821-4417-af9b-e734d83437a9	43.6	Yes	\N	26ab3ac0-9e01-4b56-b5b9-ee565955f3c9
60940369-7629-45fe-b738-e2edc53c8dc4	49.2		\N	711cc456-b320-418a-8b3b-456ed27995a9
a2cc4f46-1b6b-4058-9dd9-6fa01ae5c09a	43		\N	5a2d4f6a-0afa-46f0-9589-6f0766ed89d2
9b8bd632-05c5-432d-b1e2-2705144f5d85	43.6		\N	21c3b37c-4718-4292-b715-3568da2c9cf0
0e219021-a3a1-40f8-bd00-444e2452bbff	35.7		\N	9aaafd10-2994-4d23-9d15-8090aa48b2a8
9a480324-82b2-4615-82be-433b37fc2a7d	45.4		33	496df30f-fe73-4a01-bde7-13a197ed3746
836ce9ec-3df8-4725-b3f3-f42807796985	30.92		28	44f9d4a8-bca2-4ebd-8fb1-31326d62d6e9
680dc237-15d5-4a6a-a157-f8af6cd9bd8f	37.7		\N	0a048a5d-151a-48ab-a027-ebf29d671ead
d34cc6f3-9d64-4fa3-b936-f276e13463ac	\N	No	17.1	ac9da490-145b-4d1a-831a-08aad63ce0b8
d806283e-6096-4119-88c3-fc1fa618e62a	43.7		31.5	792b5cb5-4e4d-4db7-a3d4-ff83e80b9422
5abe5208-2bc1-41b1-8755-2c564e58db5a	46.1		32.2	785306e6-f2a9-4609-bf05-62f75a56a8ff
9a8e3b20-fa8d-472c-bb15-98370afc9703	40.7		30.8	3d41fc98-eb65-4a74-9ef0-82f6356be219
c018223d-3546-4269-95cc-c7d3b68349bd	\N	Not complete	29.7	fc6667dd-e81c-4c87-9b85-62204347d3d3
fe330599-e45f-4d3f-ba48-c00dce64e49f	44.7		33.7	02219761-b1a0-4dc2-a50d-738fd566da31
b07c0b3a-478f-4b3a-8164-4adf82358136	\N		12.8	f1289f19-7763-4b66-a677-621cf1c20a92
08ff9297-8d4e-4f9c-aad6-19192f24135f	\N	Not complete	29.5	9e865cb9-6f11-4b96-8577-3415f167b569
5fbe7df3-b12a-44d6-bf51-79695f70d333	47.2		30.2	5943a683-e1e0-424e-aa1c-a1c67202a29b
df67a2ea-b850-4f4b-88e0-65350ed95205	40		30.1	492e0ac1-3a64-41b4-9a32-821b796bdb49
21487760-c9c1-4963-a4cc-235e89156962	38.1		29.3	a3d45155-a4f3-4eee-b97a-99ec22ba78ca
48eb4458-1850-4b7a-b922-9bdb26b682d6	41.5		31.7	7d26f8e9-35e5-4223-89ef-31a566af274d
e7e67ccb-ff5b-4a16-a524-7ebc2855d410	38.7		31.2	7aa84adf-7c0f-448a-9dfd-73758e91420c
c4a0e345-0591-46b6-b0a8-0f8b7e6d3115	37.4		29.2	f088d641-4f69-481f-a10b-f4dae92c858f
97dbfc55-66f4-41b9-87e9-6f7dfb569039	43.5		31.6	f1fe3d52-bb24-4ec4-a5ff-ed3e09e80ca1
79f79240-e7ba-42b8-a5ac-76d5f0985c95	\N	Incomplete	29.3	a2d54847-3ffb-403c-9e7e-2e7efa1ae913
70efafe0-b613-40bd-af27-fa3b49f17829	39.1	Yes	30.4	f5aeb75a-1c2a-433d-8909-e3af4e383fec
bf91ee5b-303b-4365-a40f-2a1c840e984d	41.8		30.5	e826dc44-3a37-42e9-aea2-09c7569e7a25
7a6b55ad-d84e-4fd3-ab4f-3dd5c1c9813d	\N	No	13.7	fe754099-e639-4119-94ac-c527b952fa37
a755e5e4-1b5c-457f-af5e-64bf83654a8c	38		30.2	5cca7466-adf0-4c01-8954-41fefe88c7c8
462ffeaa-0ec0-4b72-b9ef-bd37dc96d86a	38.3		29.4	cc8b2221-3a54-42c9-a18f-489c8b88d81a
ce4e1aa3-4f83-4d4c-ad17-9234161c86cd	44.6		34.3	90086175-e13c-4921-a0cc-4e126df936a0
0e6fd817-9c5b-4618-a98c-d5bad43f943a	41.8		31	0f6f386d-71e7-4ef7-b8a8-a375809ddee5
4a851e30-6e7e-4080-9b7b-99259d8c0cb3	\N		28.7	a0d91e8b-0e9d-4a02-9d7c-0e0e76fe41fc
2c79f401-2028-447a-bfd9-5c72f5bd378d	45.8		34.6	cf5561d2-5b07-45fc-a1d7-a8674bbc3322
45e59741-fd9a-4702-a4f3-d7df949d826e	34.8		29.3	298d56cc-136c-465a-9ace-d3db901c326e
a96f062b-17be-4a8c-9f2d-388e37eb072d	40.8		30.5	8183570a-49d1-4360-8bea-3c0308be056d
81f22f0f-a4c0-419c-99e8-38235ff0c65f	38.7		27.9	2b909c93-f11a-4811-ba46-7c0db49fee9a
e8682242-0f34-4172-898d-0ec050a3337b	37.1		29	b62aae86-84a3-4a51-b1cc-c05a81a14baf
6cb4382a-6e67-43d9-9ca3-18a0b46a6b52	\N	No	24.1	faf47ea5-a8d4-44d4-b2f0-994a7728d4ad
350af0a4-2e4a-449b-838c-8072f7ca16ed	\N	No	22.2	76e8762b-66fd-4315-841d-37407999f182
92f55f1d-fc0c-4b6f-9abe-ecc6c1497a76	42		30.6	bf9658ad-5d41-4329-9cbf-54526e623b99
91f60fed-4ae1-46cd-92bf-7ef616518738	43.2		31.6	e666fe14-1d29-44d1-a1d8-4b2ad323b0d5
4ca125f3-0c35-4a3b-a2ef-0c0abe206ac3	\N		30.8	93669230-11ff-47be-9aa7-a41072ee8572
269e02b7-bea9-4b1c-8ef5-6638c1dea316	43.2		35	38cb1ef4-7f1a-4f6c-a0bc-5f20573d0b25
cda018f1-44dd-4d79-ba65-4cc354e21d20	40.3		\N	77aac0c8-b43c-469d-b6a3-3856ef509b37
9cd8de9f-cf76-4712-86d3-e0fe31a0fa23	36.1		28.9	1f48a247-1575-43e0-a4fe-c9ada6e59cb9
868cb273-9b84-436e-9f2b-32f46e401e68	44		32.9	55054886-0b9d-41e6-84bd-8ee676747715
dd4658a4-e8e8-422d-9007-c1c788d55830	36.3		29.3	5e57cbaa-38a3-49b5-bddc-f3f16402dfe7
be94c03c-ec64-4017-9084-b497dc5ef025	40		33.2	4dd58f49-eaaf-4c92-baff-03d320cdc452
e128f6dd-ae11-4d18-a66e-2199adf22d1c	41.1		32.1	66c9a3bc-8184-4fd9-ba37-d03b966a583c
0e852679-6ab2-471c-8ac3-540662dd2825	36.3		28.9	28d3331f-5a1d-4274-9c0f-35507a45125e
b3f65777-84a7-4e41-918f-e0638ed1a728	45.5	Yes	33.1	662e9451-ea7c-4601-add5-7fe9b083f150
adba6381-8e03-4227-8caa-fab56f77d542	44.4		31.3	52374906-4df0-40ac-99f6-533f5f6143cc
292a6e9f-495a-46fc-b546-2b63bdb4bb7e	45.1		32.1	3ae88bd5-64cf-4e94-a6bd-55ac758c5c48
bedc353e-13dc-4ea2-b972-224daae4b56b	43.2		31.9	23895fa3-0ce9-46e9-aae8-6001d702c954
5cb256cd-f06e-41ec-ba33-d4e2407e25c6	40.2		31.4	0766d877-a633-47c5-9c0c-c72bc8a57f0e
8f3dcefc-399a-47f1-b46b-b1994dc90700	40.5		30.1	c5e8d6e4-ce35-483f-9fe7-8c2824eee368
8aff935a-47f0-404e-9a9e-30484352f684	42.1		32.4	2c672331-9224-4863-970e-a4e874062706
7aa245ec-d518-41e6-8414-277dc1de5e0e	36.1		27.1	f1974c33-fe69-48aa-9a94-4982bbdb047d
18326910-78cf-40da-bd4a-2156fb6fc987	43.2		32.9	f99998c0-d980-42e7-af36-2b9006330ffd
eca452c9-387e-4e07-87dc-42c49bb29989	44.5		34	8e295c36-94a9-4356-839d-1c07366a65f8
ff7534cb-9793-41e7-8e83-dce2aa6205bb	43.1		32.1	2bac0a43-0d42-4698-be9b-325f0a6ef3ef
1b6daea5-9adc-4240-9f02-fcf29404e9bf	39.2		30	17e7d441-e2d6-49dc-a16d-8fe7f702c381
051ce160-e214-49cd-b160-6f98387bd307	41.8		32.3	27a0890e-3302-4ccf-9e92-f150229008e7
577663ae-5073-4b35-abf9-23ac16357acc	42.5		30.6	fd99bc08-9e0e-4d4d-bd96-4e4fc5f7c40e
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location (location_id, "location_NS", "location_EW", "low_pair_NS", "high_pair_NS", "low_pair_EW", "high_pair_EW", burial_subplot) FROM stdin;
6ae73f8b-faf7-4f0e-99e4-9e160734f5cb	N	E	140	150	0	10	SE
b4f4ae59-1a57-43c4-9cb4-0fbc5273c57c	N	E	150	160	0	10	NW
4db68e1e-0c36-4cb7-a51e-4263c411b421	N	W	150	160	0	10	SE
6bb15e96-a557-4696-b8ba-07aa4650f4b0	N	E	170	180	20	30	SE
354d9720-888d-4692-b8c8-25dff3910636	N	E	170	180	20	30	SE
ac929b36-338d-4ce9-a01c-8b49c46ff0c5	N	E	170	180	20	30	SE
ae0c85e6-8d44-448b-bc1c-155c74991654	N	E	170	180	20	30	SE
35cdae3c-1c8e-4fdc-97f2-508e869d7795	N	E	170	180	20	30	SE
b5b2126b-9455-4fe3-8b2c-071dda21f825	N	E	170	180	20	30	SE
16f1e3f2-b57b-41f0-9746-97e2a5843850	N	E	170	180	20	30	SE
6f4c401a-d141-415a-a306-3703cd29beab	N	E	170	180	20	30	SE
c10a217c-6082-4a05-9ef0-04250112b241	N	E	170	180	20	30	SE
a84e8593-853b-4cf8-9c5b-85336461a2e0	N	E	170	180	20	30	SE
29862e91-f97c-4ee6-84e6-6f06897b6666	N	E	170	180	20	30	SE
4daaba8d-15b6-48d8-a758-9fb65bf83409	N	E	170	180	20	30	SE
76cb538f-74ce-4111-b2ea-faee8b031652	N	E	170	180	20	30	SE
d31ea56e-bfc6-457a-a044-66eb924998a4	N	E	170	180	20	30	SE
017a001e-ae78-4d5d-87ac-b472e03c1caf	N	E	170	180	20	30	SE
98aaa2d7-05ea-41a3-a94e-4a85e09c6c07	N	E	170	180	20	30	SE
862a0002-6f16-4982-b8e8-d32c4ed520b1	N	E	170	180	20	30	SE
ecd4e12d-0569-4edd-b893-a10b9099858e	N	E	170	180	20	30	SE
72ef9909-930b-44ad-ac64-2fc9582fa3da	N	E	170	180	20	30	SE
447b8825-50e6-4b83-8353-13be861be223	N	E	170	180	20	30	SE
d3181ace-ef57-4ad4-8f60-25fe5bd4c48d	N	E	170	180	20	30	SE
302c250b-f8e2-4326-ab14-90f2f3270316	N	E	170	180	20	30	SE
cf9baa25-a721-436c-a59c-7e14bfc2ee82	N	E	170	180	20	30	SE
d89b8813-e22b-47f4-9483-06cd379aac91	N	E	170	180	20	30	SE
7e375f51-b5d1-471f-944d-601ff8ab1613	N	E	170	180	20	30	SE
9ecf49d3-040b-405f-981a-7456575be39f	N	E	170	180	20	30	SE
482e512d-abb7-4bd4-83e4-da8ae1dadd8d	N	E	170	180	20	30	SE
7800a002-4d7d-41d7-8837-8c6273c333c4	N	E	170	180	20	30	SE
226ab9da-d02f-4159-bdc4-57a88778a514	N	E	170	180	20	30	SE
5e246299-b1db-43a8-bb51-6066ad297744	N	E	170	180	20	30	SE
8aba9ecc-20b0-4d89-b820-55d4a2f229a9	N	E	170	180	20	30	SE
095058b7-9976-4b32-be4f-057abd729471	N	E	170	180	20	30	SE
0abbb673-f970-43fc-b70e-de7f3ff91b02	N	E	170	180	20	30	SE
fa3f8a3f-a58b-423b-804d-43fcc3690336	N	E	170	180	20	30	SE
6c02a2a7-2668-4a1f-9518-49591192c211	N	E	170	180	20	30	SE
132b340f-92e4-44e3-80f2-40a61c68849d	N	E	170	180	20	30	SE
2f41882d-3c19-4172-b39a-4c01892717ea	N	E	170	180	20	30	SE
9a5d1442-f6b2-4ac4-a882-f55247d4e87b	N	E	170	180	20	30	SE
bdfc11bc-d2f1-45c6-a382-13f901d4a017	N	E	170	180	20	30	SE
5c0c1333-78ab-4bd6-86d2-bc31c2188c36	N	E	170	180	20	30	SE
98fefafe-3220-4d66-8e9c-7939c2d1bbe8	N	E	170	180	20	30	SE
335a59d5-56ba-4d49-9f84-5416272617a5	N	E	170	180	20	30	SE
540d0d76-c9e3-45bf-a1d7-534e9d44bbc3	N	E	170	180	20	30	SE
0c9c44a0-2de5-428d-8985-7686637fe20f	N	E	170	180	20	30	SE
3b8767d4-88ac-4943-8ca6-259b6d97acaf	N	E	170	180	20	30	SE
f839f131-398e-4823-a43a-cbbc1314766f	N	E	170	180	20	30	SE
57782348-f7f3-4b3b-bb84-cf8271183ac0	N	E	170	180	20	30	SE
6e6df8a9-d96b-4d49-9ac6-35b65fff6dcd	N	E	180	190	40	50	NW
3f8191e8-186e-4db0-a931-5cc42fb6dbfa	N	E	180	190	40	50	NW
611b7649-8eb2-4689-8946-9511426e7079	N	E	180	190	40	50	NW
a78619f6-95c3-4f02-a856-cff66e3b1f3b	N	E	180	190	40	50	NW
872c36d9-53dc-4b90-a0d7-9535cff43cf1	N	E	180	190	40	50	NW
8367e6a4-643b-43b8-9218-a680ee370611	N	E	180	190	40	50	NW
5ea8fd5c-efb1-49cc-85c6-1043a61810d0	N	E	180	190	40	50	NW
ead5649f-23d8-45dd-9925-ad9698488fb9	N	E	180	190	40	50	NW
76e1cab8-39e0-453c-a626-c01c57674f55	N	E	180	190	40	50	NW
7dc1faf1-213b-429b-9439-e79982677839	N	E	180	190	40	50	NW
73794510-c63f-43ef-b4d2-dfbf9c3d7993	N	E	180	190	40	50	NW
3e94da93-7bb4-4f33-a4e9-f809c1c75169	N	E	180	190	40	50	NW
32fcd020-4d67-4e80-95a2-8be426f60b66	N	E	180	190	40	50	NW
2c062a2f-6444-44d2-8aae-02c23991d011	N	E	180	190	40	50	NW
9f92f36a-70b2-4483-aabd-a5af2dbdde6e	N	E	180	190	40	50	NW
9d5dc364-1756-428e-a405-f57760004fbb	N	E	180	190	40	50	NW
26d12484-e6f6-48f9-ae7a-2845b9625ed5	N	E	180	190	40	50	NW
288c280f-e024-4cbd-92e3-79b34bfe2327	N	E	180	190	40	50	NW
06f38ecb-d1d8-4a25-9367-dc9f9009c9c3	N	E	180	190	40	50	NW
ca230ace-8f41-4ad8-a136-9aa25cd6c024	N	E	180	190	40	50	NW
a98d6f65-1ddb-4b91-af75-30dd6ed6462e	N	E	180	190	40	50	NW
643d0d59-81b1-4528-bb1e-534406a72442	N	E	180	190	40	50	NW
7a68d181-85bc-40d6-843f-1b407b3ff76a	N	E	180	190	40	50	SW
0fa12746-d934-4ae0-aa4c-3a3f3181c811	N	E	180	190	40	50	SW
2a778220-2d5b-499b-95c7-5d92f0063aef	N	E	180	190	40	50	SW
088839bd-b037-4a6c-b7c3-78b37a6746b9	N	E	180	190	40	50	SW
34b57151-e52f-4a64-b455-a645d6a2530a	N	E	180	190	40	50	SW
6b2c3d0e-2e9d-4ce6-aec7-9f89aa237721	N	E	180	190	40	50	SW
d641c84f-51cd-465b-8dad-c575a8e4a707	N	E	180	190	40	50	SW
2bfcb9cd-ba2a-43c3-9bd9-88af7e1168ca	N	E	180	190	40	50	SW
37b42088-2efd-4e11-974d-63015afffde0	N	E	180	190	40	50	SW
1db5197f-b345-4dc2-8947-6bc9860cc1f9	N	E	180	190	40	50	SW
0ad94651-f91e-48b5-abbd-cc54340c7b43	N	E	180	190	40	50	SW
8718f78a-65d4-4969-9ea4-28a91fc251e7	N	E	180	190	40	50	SW
fc9f432b-7c8d-4536-927f-aa590e9ee679	N	E	180	190	40	50	SW
058d3e9c-d7e2-468f-9cae-d6ae67e80ec0	N	E	180	190	40	50	SW
54202752-d3ba-4c94-b464-b6e7f66bd2e4	N	E	180	190	40	50	SW
c1cf13de-2abb-4e87-9d60-0b9d03c3b8ba	N	E	180	190	40	50	SW
307fb4eb-a122-4b07-8719-66178c4bb9c7	N	E	180	190	40	50	SW
b53cd1db-930c-456c-907e-eab4f7bef155	N	E	180	190	40	50	SW
fe9bb52f-b8e4-4827-8080-40c922fee6b3	N	E	180	190	40	50	SW
af046555-055b-413a-bce9-02da0c06d1e2	N	E	180	190	40	50	SW
bfba23c3-a8f5-479e-b945-2412172ca727	N	E	180	190	40	50	SW
f696b452-8730-4e49-ab56-255625d1b4b7	N	E	180	190	40	50	SW
19839cd0-d721-477d-84ca-4f06e2b19988	N	E	180	190	40	50	SW
8f7d69db-fe83-4524-83f9-032ab2daf20e	N	E	180	190	40	50	SW
9f07ff0b-9cfe-44f1-ae86-706e78d1cd57	N	E	180	190	40	50	SW
aa66170f-ceac-4f2a-9775-6cd864eb4ebe	N	E	180	190	40	50	SW
ddb7589a-a131-4e32-9f7d-2351e88ce623	N	E	180	190	40	50	SW
dcd0e23e-789c-44d7-8d5c-ff2d3dffc088	N	E	180	190	40	50	SW
6cf00c15-f9a0-4ad3-a51a-fdc4e12095a4	N	E	180	190	40	50	SW
d9f9ac16-cc15-4c58-b53d-5abda36d553b	N	E	180	190	40	50	SW
19778ea4-120c-4bcb-a83f-ec933aff6a8e	N	E	180	190	40	50	SW
8c0350f0-d39a-4740-984c-4fbd5ad882d7	N	E	180	190	40	50	SW
faa44a77-e2e5-457a-8573-5cd0bacece67	N	E	180	190	40	50	SW
29371350-4303-4ef1-8958-56d8a786e778	N	E	180	190	40	50	SW
66dd8177-7175-4021-ac1a-f3170a12c805	N	E	180	190	40	50	SW
a0619b63-6485-43dd-9e46-c38680ac3cb9	N	E	190	200	40	50	SE
d1137399-5d5b-4e31-8682-085ba1fbf826	N	E	190	200	40	50	SE
a1c8f6ed-7787-4f86-8e2e-dc99143c6234	N	E	190	200	40	50	SE
f20a2fe6-82bd-4603-ae2d-58be00812119	N	E	190	200	40	50	SE
7ab4830c-a36a-4a3c-a81e-fa0abebf8ea3	N	E	190	200	40	50	SE
ceb7e060-71c6-4da7-8a19-8cd4ec283247	N	E	190	200	40	50	SE
d694cabc-75c1-4767-8487-38d43f1309e3	N	E	190	200	40	50	SE
b8be779f-0114-46af-b696-dccea7183b76	N	E	190	200	40	50	SE
ea5b1a87-c707-4f8b-be21-28fb2f184b3b	N	E	190	200	40	50	SE
6af149cc-a528-4c18-8410-28420bf5d893	N	E	190	200	40	50	SE
937267dd-87c7-48fc-ad5c-6eff36461f34	N	E	190	200	40	50	SE
3fa462f3-b60d-466f-aad8-9189a0afcab9	N	E	190	200	40	50	SE
cae0d540-0f9d-41cb-a51d-eb24d28fe87d	N	E	190	200	40	50	SE
30d36660-3eaa-4011-9563-e67758385ec3	N	E	190	200	40	50	SE
87b4aad7-7e38-4538-9e11-2114313580f9	N	E	190	200	40	50	SE
29f9cffe-e5d0-48cd-9b19-4e14fc860f21	N	E	190	200	40	50	SE
f832b180-0f8c-44ca-b1b1-67d45eba1343	N	E	190	200	40	50	SE
bf693922-713a-4cc9-a0f5-228a66557f2b	N	E	190	200	40	50	SE
be28fb0d-66c4-41ba-ae2c-6884dd3d32a0	N	E	190	200	40	50	SE
51e339dc-84af-40f0-a867-8b8c190c3351	N	E	190	200	40	50	SE
cd879eeb-c09b-4308-a89a-08e837bbdb73	N	E	190	200	40	50	SE
d216b656-5cdb-4456-9bf5-b51858fdff6a	N	E	190	200	40	50	SE
33115e24-63fe-4d1a-ac29-55f74a203539	N	E	190	200	40	50	SE
0096c38f-0435-4a14-88de-8e6154d7a0ce	N	E	190	200	40	50	SE
040d21db-1cfc-49a8-b5e3-2aa317447fc3	N	E	190	200	40	50	SE
6557aac2-9a56-49e4-8f78-546d0fcdf60b	N	E	190	200	40	50	SE
db826330-5838-453b-ba2c-66cc0200a347	N	E	190	200	40	50	SE
52b34b8c-7b34-40ff-8506-328c36a3f5a9	N	E	190	200	40	50	SE
46e58295-9135-43a5-94ff-f8d89ab7d668	N	E	190	200	40	50	SE
f9a76657-1a61-46c8-946c-db1fb9977687	N	E	190	200	40	50	SE
9fdf9847-b3bf-4e14-8fbb-a2954e8ac92c	N	E	190	200	40	50	SE
bd032b4d-a982-43c5-a4c6-7db7e21c6436	N	E	190	200	40	50	SE
a4976fef-4930-40e5-9754-f398d86a043b	N	E	190	200	40	50	SE
2b720f0f-8187-408a-827d-f62db906002c	N	E	190	200	40	50	SE
c13e4a6f-5d81-4e9a-883e-4dd1d0c3001e	N	E	190	200	40	50	SE
57726f3b-8b22-4c1a-a85b-e401b7abe7ae	N	E	190	200	40	50	SE
1fab793f-ad85-43b6-9d82-af3f94a965b5	N	E	190	200	40	50	SE
cc629d70-8948-47af-b31c-f87452848609	N	E	190	200	40	50	SW
b7724015-3799-4506-8f22-9edeb983bc2a	N	E	190	200	40	50	SW
b8e689ea-1e33-46fc-af94-7eb5baab73ca	N	E	190	200	40	50	SW
6ee8cdf1-2994-432e-aa4f-1e11414e062b	N	E	190	200	40	50	SW
5fd31098-daaa-4e7c-96c6-bf74fc76331c	N	E	190	200	40	50	SW
1607ba07-b1c6-4942-9fc9-78828093b565	N	E	190	200	40	50	SW
104143bf-21af-4bc9-9db9-2ef594e8bef7	N	E	190	200	40	50	SW
d15fa54a-bf63-4b37-9a54-07d5aee93e62	N	E	190	200	40	50	SW
8f3655ee-02de-4ad9-8994-f1154d1dd1e6	N	E	190	200	40	50	SW
554d4d5b-7237-47bf-8bad-2b91b4eae150	N	E	190	200	40	50	SW
b440dfa6-d561-4e83-ae44-403ff6e85582	N	E	190	200	40	50	SW
c8f08bcf-8da7-44ea-ab25-a01039010843	N	E	190	200	40	50	SW
b4fb7476-7fdc-47ed-956e-7db16ac887e1	N	E	190	200	40	50	SW
6b147386-4a6a-4200-ba9d-44f0dc0c28d7	N	E	190	200	40	50	SW
362a8e8b-926a-45e6-b851-3d8b8ba7b8d3	N	E	190	200	40	50	SW
fa8e7789-cafc-4b60-bd1a-0f82cad2417f	N	E	190	200	40	50	SW
fc59364b-7a39-4aaf-a1ef-fe13e8f16499	N	E	190	200	40	50	SW
fbdf124e-6fe4-4f7d-97df-ffd97d3a45a0	N	E	190	200	40	50	SW
0cb09b06-8b4b-46c1-bff0-c9b6684a0968	N	E	190	200	40	50	SW
80ee2e0d-41f2-4ad9-accf-052161a16bea	N	E	190	200	40	50	SW
0f1cba9a-5436-4591-8ae7-35c1bc98e12f	N	E	190	200	40	50	SW
a9e3e8a4-1748-44f1-a7d2-54570dc318f3	N	E	190	200	40	50	SW
df89d114-e4ff-4f6c-a485-36b585dd29c5	N	E	190	200	40	50	SW
fa28461a-6194-414d-940a-052c1a9b3eff	N	E	190	200	40	50	SW
f765e30d-b103-43c3-9d52-a74180ab7ae3	N	E	190	200	40	50	SW
8b9fc3bc-0b3f-401a-bfd3-241c0b088331	N	E	190	200	40	50	SW
67f4fe06-2ce0-424a-a5e4-f82fce359774	N	E	190	200	40	50	SW
b6dd0e01-22a8-4652-a4cd-6f36724d4ecb	N	E	190	200	40	50	SW
de112695-d8ae-4b95-a52e-70d0a2b8e8a2	N	E	190	200	40	50	SW
0021e110-4998-495e-a248-92b285bc9793	N	E	190	200	40	50	SW
4a6c11fa-d698-4ae9-ba80-29250febbf1b	N	E	190	200	40	50	SW
9815d66c-f944-4847-9ec6-9fa7dc1f976c	N	E	190	200	40	50	SW
ca0899d8-9002-46ff-941a-998f1f9c776d	N	E	200	210	20	30	SE
36b531fe-dd08-480b-af0a-1a8e965327ef	N	E	200	210	20	30	SE
beaaa7ba-03c9-4f4f-ba07-f1fa0ded292d	N	E	200	210	20	30	SE
39efdd2b-a2af-4e48-ac7c-1d262de88723	N	E	200	210	20	30	SE
29b75ad9-370e-4733-a5db-9e2df8f7629d	N	E	200	210	20	30	SE
a2024b62-d21b-469f-8401-9d092ccd6942	N	E	200	210	20	30	SE
d86f79fc-c1ce-43b6-a71b-ff28b48e40ae	N	E	200	210	20	30	SE
d5bd2844-74c5-4797-97af-3b757591e18e	N	E	200	210	20	30	SE
bdc19de4-5af9-47f1-a6d8-161dba6d053e	N	E	200	210	20	30	SE
1dd81403-0492-4870-932a-6d45d2c3eb41	N	E	200	210	20	30	SE
0d05a0b6-3ee9-4586-8a73-970dc26007ae	N	E	200	210	20	30	SE
23116e4d-2411-493a-83a7-a212743556ef	\N	\N	\N	\N	\N	\N	NE
96bec069-4196-4cfb-ae46-dd8f077feff9	N	E	160	170	10	20	SW
d255d3c0-d4c7-480c-b193-202421c49e81	N	E	160	170	10	20	SW
b33ebb03-29c1-44ff-82b6-8fade603b542	\N	\N	\N	\N	\N	\N	NW
6e101f3e-6348-495d-a1e6-5c643eee64c5	N	E	30	40	70	80	
f42ec284-04b3-486e-9327-05f0235306d5	N	E	30	40	50	60	
2bd0b3d7-598b-4f45-8bf4-8301b41d1316	N	E	160	170	10	20	SW
db921eef-670d-43f3-8001-bc54dec4d958	N	E	160	170	10	20	SW
9ef9f1c5-d410-446e-8234-2372057803d3	N	E	180	190	40	50	NW
99abb34f-f201-4805-9508-abd5dd57eb23	N	E	160	170	10	20	SE
7cd5ad1a-f56f-456d-8081-6cf17d2c587a	N	E	190	200	40	50	SE
900da9aa-070e-4530-abbe-b19e98de7e5f	N	E	190	200	40	50	SE
4f740a25-34bc-435f-900a-41fad1a978a7	N	E	190	200	40	50	SE
9a678ecc-81c6-4279-b3b0-a64983cff3c2	N	E	190	200	40	50	SE
aaaf7394-5cd9-4bb3-966b-d7b0fb2c8e5d	N	E	190	200	40	50	SE
ba8c4124-d287-47db-991a-ba569f44d71f	N	E	190	200	40	50	SE
cc8c517f-23b6-4908-9bc6-09ccef5e0a28	N	E	190	200	20	30	SE
608b3cbe-72b3-4976-881e-77d980807fe2	N	E	190	200	40	50	SE
9d7f71f5-e06c-4ba8-8ec5-3fe29cd28eff	N	E	200	210	30	40	SW
fece8a25-628b-47a6-88e8-7986e0f0f2f3	N	E	190	200	40	50	SE
718acaab-979a-4168-9789-fcf1e374417f	N	E	40	50	70	80	
a6a54e36-b964-48c4-951e-5d953b05b946	N	E	160	170	10	20	SW
095640f8-dc92-4103-b1fd-42c07b3641e9	N	E	180	190	40	50	NW
0cd95eae-617a-45ca-aa3a-f00aa9e3ffc9	N	E	150	160	50	60	SW
6114fe95-0e4b-45d9-9e7b-99efaf4938b2	N	E	190	200	40	50	SW
e44f8b0f-30da-4607-83c0-744d0dd0be79	N	\N	140	150	50	60	NNW
ff9097c1-378d-49af-b6b1-d9dca7d948a5	N	E	140	150	50	60	NW
4b10fe48-dcc2-40fa-bbbb-0842525b6084	N	E	180	190	40	50	NW
c7dfb871-0b8c-42b9-96c9-79ddb7b3e75c	N	E	180	190	40	50	NW
3781b4d1-c174-4091-8ae3-1981cd935deb	N	E	200	210	50	60	SW
5ea8977c-f8b6-4f95-a6a6-d4b504b3286c	N	E	190	200	30	40	SE
64a5472b-7786-44a3-a567-e5e3e6b3c42a	N	E	190	200	40	50	SE
1f6b9954-b84c-4ec7-8dc0-4f5bdc062c42	N	E	180	190	40	50	NW
ec78b056-1627-4d86-af67-77f80ff2147c	\N	\N	\N	\N	\N	\N	SE
d99d12ee-a55a-4baf-bd6a-729acb04e3e4	N	E	150	160	0	10	NW
a794d8c9-0bff-48e2-b7ef-61a871aaa8ef	N	E	160	170	10	20	SW
f254ea41-59e6-4fc1-9c29-c521658cc9c5	N	E	160	170	30	40	SW
3a71a288-d9e5-4c5f-a9cd-3dbabdaf02df	N	E	190	200	40	50	SW
9decae12-7845-48ec-ab48-34bdc6e83860	N	E	180	190	40	50	NW
a5586358-1c2b-4187-85be-51d2d9d21537	N	E	190	200	40	50	SE
39c82c19-690e-4f3d-93a4-f93a20e093d7	N	E	140	150	0	10	SE
37a16283-4068-42b9-a788-6387c84d4f53	N	E	180	190	40	50	NW
b85c11de-da94-4daa-a9bd-582e6b227665	N	E	160	170	10	20	NW
274bb71f-4a9b-442f-a6ab-1b4eb1d3ce1c	N	E	140	150	50	60	NW
805b43cd-678e-4577-84fe-4f7c0e7cfcbf	N	E	190	200	30	40	NE
3c4f1317-d687-42af-ab47-444fc38e59e1	N	E	150	160	0	10	NW
cf37267e-8a14-4130-8c7d-40352064d0b9	N	E	190	200	20	30	SE
77ca483c-dce6-4bc1-9913-a5ebca0951ad	N	E	190	200	30	40	NE
b76a19a5-1509-4342-92c5-31d85f45ab13	N	W	160	170	0	10	SW
6d35f5db-6877-47ea-b531-a35abc48b8c9	\N	\N	\N	\N	\N	\N	SE
4947bb9d-6ff4-4239-8f9c-0a561d5cec69	N	E	190	200	20	30	SE
c959717a-e034-49e3-a1a9-83d1be39115b	N	E	160	170	30	40	SW
99cc623f-13c2-4512-8cf2-201f595924f5	N	E	40	50	70	80	
c1518415-e6db-4716-9177-2280b5ee61ba	N	E	200	210	30	40	SW
0232ea9b-622b-4c05-9c26-2a87b2275cc6	\N	\N	\N	\N	\N	\N	SE
91146903-d276-4938-b922-77944afff30b	N	E	190	200	40	50	SE
ab8e7dbe-5c39-4c52-85bc-00b598f43dd7	\N	\N	\N	\N	\N	\N	SE
f142b2e3-6ca8-45cb-ba6a-506a45f571d0	\N	\N	\N	\N	\N	\N	SE
52e084ae-45c3-4c3c-a346-b9a63778669d	N	E	190	200	40	50	SE
fa55ddd3-11ce-437f-8019-f2452fff7f86	N	E	150	160	0	10	SE
5f32af8f-1751-4a41-a1b8-b65fb64a31e3	N	E	160	170	10	20	NW
6a73acc8-7cd4-4c40-8a3a-fa99a156ee6a	N	E	190	200	40	50	SE
3a6c63b5-4f5d-4ea5-8ef7-8dfe745acbb6	N	E	40	50	70	80	
32f40493-a8c2-418a-8585-5778f19d7f13	N	E	150	160	50	60	SW
f9667203-b56d-4409-b764-fc4cb2430aa1	N	E	160	170	10	20	SW
115230a9-2806-40fd-83cb-594a93adf803	N	E	180	190	40	50	NE
dd562f23-4483-4347-9671-3a1dfc683193	N	E	160	170	10	20	SW
fd6c0547-f573-427f-8013-33471d39937a	N	E	160	170	10	20	SW
692c8b30-66cc-4f01-973a-ebfb6b5e57fa	N	E	160	170	10	20	SE
d4f935c3-6f88-4254-83af-3a7eba056155	N	E	160	170	10	20	SW
79b2c70d-d9c8-47fb-868d-32e252980718	N	E	30	40	70	80	
e1149249-257f-4ce8-b699-552c668e5c6e	N	E	190	200	40	50	SE
c125a8a0-663b-4d43-a072-5f50b9dc344b	N	E	160	170	10	20	NW
49f3be07-1b3c-44ea-bd3c-537de9be82d6	N	E	50	60	50	60	
4da771ad-5b8e-4a36-a733-c85bceb6c92d	N	E	180	190	40	50	NW
d6339652-5c51-4997-8872-cea64da02358	N	E	160	170	10	20	SW
0b40f298-1a55-4a26-af60-b4beada7dc5f	N	E	190	200	30	40	NE
996c3585-82e0-4f1d-bdf8-ad376c090f52	N	E	160	170	10	20	SE
c12e2230-0845-449f-81c9-fb5c23443d84	N	E	160	170	10	20	NW
f166b30f-77c3-4ff8-9de1-368c6c16c81c	\N	\N	\N	\N	\N	\N	SE
86a8c724-db48-4684-87aa-21c70d01943a	N	E	30	40	70	80	
e3c4392c-7371-46dd-9182-6d23932128f5	N	E	160	170	10	20	SE
cc7d4f9c-cfd9-46ee-93dd-af023ff92e3e	N	E	190	200	40	50	SW
0190120f-fca1-4951-b83f-741aeb345741	N	E	160	170	10	20	SW
fd5bda5a-a50e-4b2c-bc59-1e5dccb094bc	\N	\N	\N	\N	\N	\N	SE
f3af2086-5244-4796-bd03-841598ca69b8	N	E	160	170	0	10	SE
9b620dd0-8fdf-4af0-b521-3ad5c1b47d99	N	E	150	160	0	10	NW
ced08802-7d6e-4982-9359-b32192898e9f	N	E	160	170	10	20	NW
4df6e41a-b81d-4106-81d7-ab9860b65f81	N	W	150	160	0	10	NE
287aeaa7-be9d-4d2c-964a-9d7741386264	N	E	160	170	10	20	SE
15f2c6ed-2b40-4596-8734-ed7424f94ddf	N	E	160	170	10	20	SW
a059f108-1f05-46b9-8851-0be37a6a7e91	N	E	200	210	20	30	SE
8478a91b-8c39-4ec5-b143-2b52a5dbcca7	N	E	160	170	10	20	NW
60146830-372d-4243-a983-406b7db12b38	N	E	160	170	10	20	NW
4b8443cd-ae53-4b65-b43c-b785b0ebfa83	\N	\N	\N	\N	\N	\N	SW
88113b59-595a-4696-b660-607058031e6f	N	E	200	210	20	30	SE
2bd3c107-b1a7-4ba6-98d5-dcca64c1fcbc	N	E	190	200	30	40	NE
4ae48abd-8f42-4012-8b0b-54d3f5a7503d	N	E	190	200	30	40	NE
c849629e-78f4-4076-8e9b-f39812264a95	N	E	190	200	40	50	SW
1626cb86-1a81-4025-82e3-d63d9b46356d	N	E	200	210	30	40	SW
c6141555-1f6c-416f-a951-faf9cfc4c47f	N	E	200	210	30	40	SW
bf8f4214-5b1b-434f-adfe-ad804ea5324a	N	E	200	210	20	30	SE
9bd9be7f-0540-449b-ad12-68edcf7f6410	N	E	190	200	20	30	SE
92974ba8-e773-4821-8629-2b1034a3c940	N	E	150	160	0	10	NW
70ea0c9f-b0ff-4ce5-bf8f-f4fe7fc5cafc	N	W	160	170	0	10	NW
8447b202-f5f1-46dc-9b2b-dffa98995e82	N	E	200	210	20	30	SE
cb0342e7-1729-445d-b39d-e353934aef6e	N	E	190	200	30	40	NE
f570425d-3bcd-4b48-8101-57e80cef5309	N	E	190	200	30	40	SE
e6726357-a03f-440c-b2ba-575289efd1ad	N	E	180	190	40	50	SW
48abe78d-f8fb-42f3-89b0-58742500f1b8	N	E	160	170	10	20	NW
dde4f069-9c3e-45da-a8a3-b3b51e4de81f	N	E	190	200	30	40	NE
43c40196-6211-4121-9141-d82fa5713857	N	E	190	200	30	40	NE
e6cfd54b-faa5-4e7b-b6fe-7a8415ae8650	N	W	130	140	20	30	NW
13bf89fc-79ae-4548-8210-a0d03bc69006	N	E	190	200	30	40	NE
bd8f6f06-2aa0-4188-8aa6-5fb39c6b90be	N	E	200	210	30	40	SW
48b5c788-e273-4c09-b2c9-bc55e7284f3d	N	E	200	210	20	30	SE
08a03d2f-6181-477e-b524-af2a5d7a0b43	N	E	200	210	30	40	SW
b816871f-bc99-4fcc-8b66-a397f1dedf12	N	E	200	210	30	40	SW
a18d0b02-aa46-4ea6-bf9a-4511444dd496	N	E	200	210	20	30	SE
7907b229-8c6f-40e5-b133-f85ebef209ae	N	E	180	190	40	50	NW
860763ac-15a8-4dee-9474-c6c24fe1553f	N	E	180	190	40	50	
a9869eb5-cec5-43c8-8fbd-c46b26b2e461	\N	\N	\N	\N	\N	\N	SE
ceebb896-c172-412a-9b7f-69433ccb50be	N	E	190	200	30	40	NE
398a2df5-a002-4eb4-bd8e-797997a068a9	N	E	200	210	30	40	SW
1d73ee07-05b9-4616-ac39-075322f6c5ff	N	E	150	160	0	10	SE
18622b0e-c4fb-4af3-866f-4b86f58c6380	N	E	180	190	40	50	SW
02ca3e5d-0077-443d-8587-2671c5af2165	N	E	200	210	20	30	SE
4345030b-ee74-494b-beb5-18c79b4f46f2	N	E	190	200	30	40	SE
2e7fd023-81fa-4de4-a495-d5ec38f5f441	N	E	200	210	30	40	SW
e8b92cc4-8973-4d40-b644-a2b5560144c3	N	W	130	140	20	30	NW
d6b4d2e0-e031-42f8-8d00-6ef328353d0d	N	E	190	200	20	30	SE
ada60582-dc91-4503-8b2f-eb84997041aa	N	W	130	140	20	30	NW
dbc7c86c-bc06-43de-bdaf-8237534e382f	N	E	160	170	10	20	SW
d451a891-35a2-4a53-acce-ad80eda8f787	N	E	190	200	30	40	NE
d36cc1cc-78fc-4ce3-b2f5-2f508644ff07	N	E	190	200	30	40	NE
e15afc69-817b-426a-ac09-5deb3eda79ec	N	E	190	200	30	40	NE
796809ff-7c2b-4b1a-afd3-d4cdee89828d	N	E	180	190	40	50	SW
cebb2811-3a13-4883-a789-a8092a9c28af	N	E	190	200	30	40	NE
38157993-454f-4ca8-a2af-9e74ab313b4d	N	E	200	210	20	30	SE
caa51268-d2cd-4376-a693-53cf305d77c2	N	E	180	190	40	50	SW
38b2ffd2-f2c6-4122-ac32-9630191e3b5e	N	E	180	190	40	50	SW
f6eaae6f-a83d-445d-997c-dd9147c9b26f	N	E	180	190	40	50	NW
c27614d6-21f4-4bce-b836-3ad1b2ca12c8	N	E	180	190	40	50	SW
fe2807a7-485b-4de5-9fd1-a4e8623a10ca	N	E	180	190	40	50	SW
42044760-6060-4e17-9aac-d27f5347283c	N	E	190	200	30	40	SE
e058d664-1eef-454a-89a3-0c32777c34a3	N	E	190	200	30	40	SW
3a00da24-64bd-4579-b780-1c83c53bdf73	N	E	190	200	30	40	SE
d3e1f648-edd8-409d-986e-df7f47fb87b0	N	E	190	200	30	40	SE
8ca62efb-14bc-4dfe-a337-bb6b8d146c27	N	E	190	200	30	40	SE
35a7c2f8-7a3d-4b21-be71-190a5a779e6d	N	E	190	200	30	40	SE
98aab187-8f52-4eba-bf64-bb18391ffa65	N	E	190	200	30	40	SE
c83a81e3-3501-4b21-afad-1b51045b856c	N	E	190	200	30	40	SE
751ff16c-edfe-40b5-8ee1-4dbf6dee6152	N	E	190	200	30	40	SE
9040a367-6bb5-4fb9-8f1b-bb95e3bd8a70	N	E	190	200	30	40	SE
ba615d7c-bfb2-45d6-8910-09e2dd2002a4	N	E	190	200	30	40	SE
0dfcb645-3f90-463d-b87c-a4b807191853	N	E	190	200	30	40	SE
5e9ab88d-55d7-47f8-a988-7b6d581129c5	N	E	190	200	30	40	SE
2f3885ee-4116-45eb-a1d4-c0ae49e3a264	N	E	190	200	30	40	SE
0b8f9f67-e848-4a65-bde1-a006b5a020b4	N	E	160	170	10	20	SE
3f9c6649-69b2-4c16-8142-d3f9d6f3ea65	N	E	200	210	20	30	SE
d92e3a1a-2655-4c1c-b641-e30cbc930f93	N	W	160	170	0	10	NW
8b32c8d6-920a-4cef-a9b1-338229124421	N	E	200	210	30	40	SW
d6c90565-74f8-4149-b401-da1c9b5e201c	N	E	190	200	20	30	SE
1709307e-793e-4186-874f-d8551b7e9a1e	N	W	160	170	0	10	NW
5714cb8b-7b83-4fe4-ab11-497e0a449053	N	E	190	200	20	30	SE
a5e18aa9-4579-45a6-b747-acde1eec60a3	N	W	160	170	0	10	NW
fb952422-36bc-4da1-a207-f23697af3eff	N	E	160	170	10	20	SE
76fb53dd-e93c-41d6-acfa-8c8bc2db6967	N	E	190	200	40	50	SW
7e984c67-63f5-4269-96e8-cec1aa40e7fb	N	E	200	210	30	40	SW
fab3dee0-eb7f-4563-85ba-50a11ecf8b3d	N	E	190	200	40	50	SW
26c168f5-680d-4363-b6b1-e53e82bd1fd9	N	E	160	170	10	20	SW
92362d4b-ff4a-4340-8970-0367e86d1e45	N	E	190	200	40	50	SW
0180db73-8822-479b-b4b5-81596c6db0a4	N	E	150	160	50	60	SW
deb254ba-3a5d-41c6-9fc2-52347a551571	N	E	190	200	40	50	SW
15fbffb1-6cc6-4ea3-8e11-9512d81cf025	N	E	150	160	50	60	SW
429d1ee4-33cf-4885-beff-0ed590499929	N	E	190	200	40	50	SW
6fa1d378-ee11-427c-a0ef-b65b198c719c	N	E	200	210	30	40	SW
fcf629ef-5ed5-4191-bb5f-cf5cb1bf4217	N	E	190	200	40	50	SW
92f76c62-ba77-458b-9057-fa8bb6b4b77d	N	E	200	210	20	30	SE
8db44009-1b6f-4d19-a5f7-fa12059879f2	N	E	190	200	30	40	NE
c11f6044-e6e5-4cb9-9e28-2806b47ea3fd	N	E	200	210	30	40	SW
0beddb04-3e28-411f-b734-0f6ca14a8c75	N	E	200	210	30	40	SW
d8402f11-6b3c-4cef-a7c6-fd22763165f7	N	E	200	210	30	40	SW
c35295c4-2536-4406-a1ce-98c05c754284	N	E	200	210	20	30	SE
b68088b6-7e42-4bf4-b40d-dbc750a62c1c	N	E	200	210	20	30	SE
99924377-939a-4511-a97d-3086caef9189	N	E	190	200	40	50	SE
c798f026-6425-42ca-bd45-cdc8b950ee6d	N	E	200	210	30	40	SW
e95ae935-87f1-4ee0-a2a2-40386ea1dbb0	N	E	200	210	20	30	SE
006c5046-ad86-4431-8529-c4e7f02fb0a5	N	E	200	210	30	40	SW
c594db30-0928-470b-8782-e6dca9c64f7f	N	E	200	210	30	40	SW
a14d8e6d-5677-45dc-9175-3befb5e3474c	N	E	190	200	40	50	SW
a7484f75-21e5-4e2b-a24c-59063010a410	N	E	190	200	40	50	SW
6db36e2f-6b1b-4d0e-a908-d7df27ac9b90	N	E	180	190	40	50	NE
09b60241-7dea-4505-a53d-5a773afb5831	N	E	190	200	40	50	SW
1ce40312-fb52-4caf-bfe6-ed17ba0dd2b4	N	E	180	190	40	50	NE
0825cd33-1070-4dc6-b308-1f0eb7be7f04	N	E	190	200	40	50	SE
f45813a4-b737-4ca7-9c87-d6b757112e4b	N	E	190	200	40	50	SE
149cc79b-6912-4a1e-9f2a-f6b4e2aec971	N	E	190	200	40	50	SW
eea58fe7-cf72-4b9c-bedb-fa7fb12e0d2d	N	E	190	200	40	50	SE
1b671bc5-17a5-4212-a0fc-a9807217b22a	N	E	190	200	40	50	SW
1329a4b1-9e64-49b9-ae42-978daec54bc4	N	E	200	210	30	40	SW
90f5fe58-7624-4813-aa19-552e3c0bfada	N	E	180	190	40	50	NW
828003b8-3989-4477-8297-3a8ae7a985fb	N	E	190	200	30	40	NE
24422115-8cb9-45ae-80b5-32d507305353	N	E	190	200	40	50	SW
38f9cb08-d530-4323-83c4-fcb6f78bfb5a	N	E	200	210	30	40	SW
41c88b60-f468-422e-92a9-10d39bd24817	N	E	150	160	50	60	SW
7543810e-f4a9-424c-84dc-0c8d638d5594	N	E	160	170	10	20	SW
2bf8fd14-de11-4432-9d67-f91053f45e39	N	E	190	200	30	40	NE
549016f4-de1c-4ca6-b130-a5c3ab7575be	N	E	160	170	10	20	NW
0639ae2d-3e34-419e-aecc-ab3ca6dbe378	N	E	160	170	10	20	NW
a06afd13-853c-4303-b2a0-cab395d4e3e4	N	E	150	160	50	60	SW
536cf573-0f5c-454d-a59d-4b849ed3f394	N	E	160	170	10	20	SE
2a7e43d7-aa8f-412c-99ab-f543394be7f5	N	E	160	170	10	20	SE
faf8a618-476f-49ae-a368-4336c9ff188a	N	E	200	210	30	40	SW
a3f53293-6272-4094-9823-7ef07d26c3c8	N	E	160	170	10	20	SE
b0c09f9c-adc4-4b96-80a3-14f641f3e1e1	N	E	150	160	50	60	SW
3604df88-cf55-410b-99c9-f10efcd1f71e	N	E	150	160	50	60	SW
bcc41edc-0de2-47ed-b9a9-60e7f5a7d32d	N	E	200	210	20	30	SE
6affad60-1d64-43eb-ac23-78a701fa0f20	N	E	200	210	20	30	SE
3112b3a2-2f09-45a3-a1ec-e4bad09ab154	N	E	190	200	30	40	NE
231dbf27-6cce-4d2b-a275-c20b0e031906	N	E	200	210	30	40	SW
b2a21592-d668-4bbd-a7d5-e0ce7f4a2a4b	N	E	190	200	30	40	NE
f3b910e4-5820-4888-b95c-813756ed5858	N	E	190	200	30	40	NE
1d175092-d487-4423-8c2e-4c29b842ce7b	N	E	160	170	10	20	SW
a4b17aff-78ab-416f-924b-f314a2c947fe	N	E	150	160	50	60	NNW
f4c166ff-099c-4b1e-a0c0-3f0fb1f59cd0	N	E	160	170	30	40	SW
afa57b3a-113e-42a3-9514-a613bb6da4fa	N	E	190	200	30	40	NW
d7ddf966-b185-4640-8005-f906c1800198	N	E	190	200	20	30	SE
159ea2d0-3caf-4576-abab-d371f468f926	N	E	160	170	30	40	SW
3e015ec3-0c53-4530-b33f-641671d9c0eb	N	E	150	160	50	60	NW
204b1b33-88c6-4f6b-b21b-be976da57f14	N	E	150	160	50	60	SW
5de92a02-45c4-4b2b-acd3-429c3fb7b147	N	E	200	210	20	30	SE
e5a7180b-97ee-470b-8f4b-ebf6effaa53e	N	E	190	200	30	40	SE
a1074bd4-4f43-4c7a-be2e-f5d75af4a057	N	W	150	160	0	10	NE
56dbfefc-719b-47fc-b5b9-4e9bdf39adaf	N	E	160	170	30	40	SW
5acb0831-763d-4869-ad44-b9b025274778	N	E	150	160	50	60	
31da6321-371b-43dc-a66e-0def6a3c9786	N	E	150	160	0	10	SW
fdc5b950-8ad5-4c24-9cb2-0470e28350e9	N	E	150	160	50	60	SW
41080bdb-0674-4ed7-9a79-eaad81bb91d9	N	E	190	200	20	30	SE
0f91d5bc-193d-496c-9bea-934c2fe0a833	N	E	150	160	50	60	
87e8415a-1b4f-4950-b491-3151c77879e3	N	E	140	150	50	60	NW
986b8b20-952d-44bf-8cc9-383861928143	N	E	190	200	20	30	SE
06b22b88-c982-4360-b6f9-2b1196d795ce	N	E	140	150	0	10	SE
19f3773b-a454-49cb-ab57-47e04507c85d	N	E	140	150	50	60	NW
ccebf392-bad5-433f-bd85-6ee642454bf1	N	E	190	200	30	40	SW
1201e804-a865-48c5-8d6a-de1486c12bdb	N	E	140	150	0	10	SE
6bd5d939-b367-41a0-9991-bb23b7fff003	N	E	150	160	0	10	SW
ccd063bb-fff8-4518-b41a-c48dfd3e5cba	N	E	200	210	30	40	SW
7a57db15-b7d4-4743-a7a2-cd731318bc62	N	E	160	170	30	40	SW
e5f6aa92-14e8-47b9-be57-40219f311221	N	E	180	190	40	50	NE
7a0196ad-ab39-4ec1-9508-853889049053	N	W	160	170	0	10	SW
4c2783be-5c3c-44a3-bf72-8a780c0a359f	N	W	160	170	0	10	NW
dc280868-ca78-428e-91bb-dc59b63c3146	N	E	190	200	20	30	SE
598dd312-a24d-40f6-93f6-225a349e7f28	N	E	160	170	30	40	SW
af6b8abb-57e1-4674-8e40-47ea65219c1f	N	W	160	170	0	10	NW
330e3c97-2c6a-4ca8-9df6-34e4d3696a43	N	W	160	170	0	10	NW
3a96c37d-dc9c-4e79-bdc3-b208cde48d12	N	E	140	150	50	60	NW
40429451-d01b-41db-aa15-c66292700d46	N	W	160	170	0	10	NW
1e1215f4-e11d-4338-b97d-8bdc319bf98f	N	W	150	160	0	10	NE
11fe041e-ebd2-4895-a9b7-e0652bfbe46f	N	W	160	170	0	10	SW
0fa3a74c-8948-4483-af77-ab3ca3db1fce	N	E	160	170	10	20	SW
675b4d59-2380-4a4b-9249-7097d2999f50	N	E	140	150	50	60	NW
b9b721fe-072b-4ea7-b153-a2653421ce1f	N	E	150	160	0	10	NW
529c0873-0847-4046-ad4d-01d25a5f2e54	N	E	150	160	50	60	SW
605dff1f-879d-401e-98da-2cf52cf4d56d	\N	\N	\N	\N	\N	\N	SE
da39c595-3d2b-45ea-97ce-0971ff9c10da	N	W	150	160	0	10	NE
1992dca7-33bc-494c-93ec-abf1cc57c50b	N	E	200	210	20	30	SE
5fe1432d-e43a-4c52-9a55-ff6829d6b8eb	N	E	160	170	30	40	
f930ff01-6c49-4cf7-a9b1-3b0bdbc0f3c7	N	E	200	210	20	30	SE
89f50e58-cf33-4e71-a888-9ca50d1b9b9a	N	W	150	160	0	10	NE
86551330-85a4-4b39-8ea0-f2a63c78d0bd	N	E	140	150	0	10	SE
a815dba9-cc17-486e-8c55-68a410e62606	N	E	190	200	20	30	SE
ff51b82e-0d85-4255-839e-4f872d312898	N	E	150	160	50	60	NW
6a52fc54-d64a-4f6e-9f8f-98efa4302161	N	E	150	160	0	10	NW
5c62c6d4-3849-43a4-9deb-ab3acbe2793f	N	E	160	170	50	60	SW
10aba1fe-142f-4d9b-b29b-8e867889609d	N	E	140	150	0	10	SE
63aea414-dab2-4b0b-866f-88de9daaad56	N	E	30	40	70	80	
73f69734-77ea-45c1-ab1b-8553c1be6ff9	N	E	190	200	20	30	SE
cad241ee-c068-4bd8-874e-812a8f8fe1ac	N	W	150	160	0	10	NE
c5f20562-06a0-488c-a2d2-957afb4ca1c5	N	E	160	170	30	40	SW
08ed8c9d-1484-494d-8075-7604f7a81161	N	E	190	200	20	30	SE
dfd50838-4ba9-43d8-bb42-fb29873a4e8c	N	E	190	200	20	30	SE
5e899a55-61d5-484c-916e-dc8a3dac0a06	N	W	150	160	0	10	NE
9f46f0b0-9a03-4bda-b8e1-9f7a10af98d9	N	W	150	160	0	10	NE
1bd23d1e-5b35-4d6c-b181-7cf75196e6a3	N	E	190	200	30	40	SE
3d98886e-e054-40d4-b480-42f7d09df6b9	N	E	160	170	10	20	SE
1600091f-6fb7-42a5-81ea-c0b057eedf32	N	E	190	200	20	30	SE
b81dfc3f-2509-4d62-a47d-893b34a37e46	N	E	190	200	20	30	SE
1e032952-d577-41cb-beca-cf6de9f7b1c8	N	W	160	170	0	10	NW
bfe64a11-fa3b-498b-82e0-eda649963a20	N	E	190	200	20	30	SE
655545c4-fcc0-473f-93b9-8864eb2f4ff3	N	E	190	200	20	30	SE
df1845aa-2c96-4b44-85fe-6bebb49eba09	N	E	190	200	30	40	SE
7a378d77-a6cf-447b-9c19-26d06e84a411	N	E	140	150	20	30	SW
2eed76e1-5e25-4aa3-93e0-02ec2e27984b	N	E	140	150	50	60	NW
52d719aa-2976-4f29-ac91-0d97b58b9846	N	E	140	150	50	60	NW
52e82fc8-61dd-4218-8867-2546190bd48f	N	W	150	160	0	10	NE
54792e0a-3fab-4536-8164-78aff8a1f5c4	N	E	190	200	20	30	SE
cf2ce4ee-f5f3-49a1-a345-d1b6642f5901	N	E	160	170	20	30	SW
58c9a07e-f707-4064-a866-388d492b75e2	\N	\N	\N	\N	\N	\N	SE
f4b520d4-d29d-4c1d-b124-7aca6097945f	N	E	150	160	0	10	SW
4cae5ca8-bae2-40c6-aa23-15d3f613af42	N	E	150	160	0	10	SW
c93afa20-a3e1-40da-af7f-e70746ed2b0c	N	W	160	170	0	10	NW
0fbde7e4-feef-43fa-ac0f-aa6efcfdbf09	N	W	130	140	20	30	NW
e9ede8be-73d2-41ca-97f7-43557c2d1cf5	N	E	190	200	20	30	SE
15e767ad-205c-4820-9b7e-8a6ffa287487	N	W	160	170	0	10	NW
31f8aafa-1c7e-45be-bace-888b13e2b4cf	N	E	190	200	20	30	SE
dedcb11f-6ddb-463a-969b-7b9c1ef4e1d1	\N	\N	\N	\N	\N	\N	SW
25f796a4-0dae-4bcb-81e0-d1aaf96edec7	\N	\N	\N	\N	\N	\N	SW
3f3803cd-3bb1-42af-b29a-015be26ec70e	N	E	150	160	50	60	SW
cf348798-c49b-4dde-a22b-7ec39d1d195d	N	E	190	200	20	30	SE
3c47735b-3a4d-4a2a-af7b-5e43bef99571	N	E	190	200	20	30	SE
53049ce1-2577-46bc-ad5a-e215f0185ff9	N	W	150	160	0	10	NE
cdaa4d20-5ff9-4cd1-8f7f-17093fa45bf9	N	E	160	170	20	30	SW
9766b044-3271-49d3-8cd5-fe92809615b0	N	W	160	170	0	10	NW
22f0128d-d5b2-4a96-8e41-53f4ece5eec9	\N	\N	\N	\N	\N	\N	SE
00932500-95ea-4251-8aa8-c8e8a45ac532	\N	\N	\N	\N	\N	\N	SE
be6ac9a5-8188-4f7f-be77-d88b7cac11c5	N	E	180	190	40	50	NE
b535205c-56a1-48a3-ba7f-556f50498fee	N	E	180	190	40	50	NE
1a3d1317-7da1-4133-8b0c-1c6a701d5672	N	E	160	170	10	20	SE
264f13dc-b60d-40ca-bde9-bd75e2b1db94	\N	\N	\N	\N	\N	\N	SE
38a2a9b1-bb54-40bf-b811-02aecbab6606	N	E	140	150	50	60	NW
061c00f8-76e0-4ba6-9ad6-f55a961de598	\N	\N	\N	\N	\N	\N	SW
388557db-b56f-4611-b0a0-f5ec4e6959b9	\N	\N	\N	\N	\N	\N	SE
db5c6a61-ffc2-4a7b-a2d9-fdc72f8daa2e	N	E	150	160	50	60	NNW
8e8145f5-4eca-4925-be5a-020352b13db8	N	E	140	150	50	60	NW
e1a9d268-8e1f-43ad-a8b8-b03fd61a82e7	N	E	160	170	20	30	SW
e5cb82b7-7632-45a4-a7a8-8eb042f45737	\N	\N	\N	\N	\N	\N	SE
03ff26b5-d526-4f25-86a4-8a983b2f683e	N	E	150	160	0	10	NW
42a98042-46eb-48b8-8246-b201dfdf2b32	N	E	150	160	0	10	NW
64155888-ecb0-4718-b66b-e6a5d301f397	N	E	150	160	0	10	NW
bd4c7f53-7d98-42e1-bdaa-82d27f70fa3b	N	W	150	160	0	10	NE
f1912d67-27c6-4d82-b63a-849f9876b84c	N	E	160	170	20	30	SW
f4b73c07-6fe7-4f7c-826d-d7dc0b34f3f7	N	E	160	170	30	40	SW
72a6c8e1-ff23-447b-bbae-56b97af40042	N	E	160	170	30	40	SW
ae241ccf-d641-4e3e-bea2-fe5897348516	N	E	140	150	0	10	SE
947293e1-ef3a-4a08-b3d5-f04da86adb0c	N	W	150	160	0	10	NE
85fefcb5-3322-40bd-b3d3-6140ee209104	N	E	190	200	40	50	SE
ab5d10b2-6173-4e59-89c1-129bbbd3dce2	N	E	160	170	10	20	SE
53a0bc75-09a1-4f0e-aaf5-e27ed99b07c1	N	E	190	200	20	30	SE
eb961ce3-53b9-4631-a8c9-091712b5a93d	N	W	150	160	0	10	NE
139cc71a-2f12-49e2-9b5d-fdf27e935e70	N	E	30	40	70	80	
9f103cc4-c6f9-49cd-abec-4b9f7353d9a0	N	E	150	160	0	10	NW
e05a27a2-9dd6-4e93-88f1-e26b357360d8	N	W	160	170	0	10	SW
eb8ba21c-7c36-4e3a-a04a-2b79fde6dbdc	N	W	150	160	0	10	NE
e4ee45a0-d771-4611-a9b6-20e4d3a953b3	N	E	190	200	20	30	SE
88fcf53d-2d24-451c-8895-497e71457331	N	E	190	200	20	30	SE
27d78c72-e219-4f3a-81b7-12e7d3b64ca8	N	E	160	170	10	20	SW
031b1c93-1e1f-451c-a3ba-13af4f9e99b6	N	E	160	170	30	40	SW
3b0abcec-6ade-484d-a1d9-39a030060948	N	E	150	160	50	60	NNW
2a7acbf5-c0af-4716-be9c-01b58ee1b698	N	E	150	160	50	60	NNW
5e012213-9900-4da4-a960-bf7579f4d94c	N	E	160	170	30	40	SW
db55d671-a06e-4777-96af-78229d75d3db	N	E	160	170	10	20	SE
5566094e-300e-404e-9334-8395bbae71fa	N	E	180	190	40	50	NW
c77ff207-2233-4beb-967a-9e41a1e16f11	N	E	70	80	60	70	
1c5af772-61af-4478-8a51-bc776e75b493	N	E	180	190	40	50	NE
6e312a4f-2063-44e5-af70-19e8ebd5c86a	N	E	180	190	40	50	NW
588bcf50-a371-4651-ae4c-832b45b94fa2	N	E	160	170	10	20	NW
7608545f-1bb1-4669-914d-ee454e58eb33	N	E	160	170	10	20	NW
c3f3324e-4d55-4f0b-9ecd-19485a637dc3	N	E	160	170	10	20	SE
b700e99b-b9ed-454d-8832-b2fb7708f25e	N	E	160	170	10	20	SE
e5efad80-7042-4ae2-be1d-b392f98d609e	N	E	160	170	10	20	SE
54e336c2-3d54-4f20-9c47-36d9536754dc	N	E	140	150	50	60	NW
b02cbcd8-4520-4c74-aed3-bf6fa5ceb2b8	N	E	190	200	20	30	SE
4550bded-4691-4b3d-929d-b8794a338e51	N	E	190	200	30	40	SE
5225cdbb-3a67-4cc8-b4af-52cfc7197281	N	E	190	200	30	40	SE
cbebbcde-a93a-446d-af28-4e472773837e	N	E	190	200	30	40	SE
0dd8a02d-d2f3-4218-ad64-72a8655c7087	N	E	190	200	30	40	SE
b61bc99c-b038-4c0c-871e-1e5e83111658	N	E	190	200	30	40	SE
d95dec44-f5ca-4cb7-81e8-ac68d9a1e00f	N	E	150	160	0	10	SE
bb6eefd0-b6f0-41e2-93e0-c54613af6822	N	E	190	200	20	30	SE
d79ac19a-401a-42df-9ab4-9b72ac8a89e7	N	E	160	170	10	20	NW
ec5cfb03-dc9d-4290-b81a-7ab066e9ce47	N	E	140	150	0	10	SE
af2d5cca-a4a0-4be1-b8e1-275aa7567bb6	N	E	160	170	10	20	SW
bd7ca380-2e29-424a-904f-1bce73b21e07	N	W	150	160	0	10	NE
6c4555b4-6a98-46df-bc5e-112bab2cb010	\N	\N	\N	\N	\N	\N	SE
e5c6dabe-1a5f-47d3-9f1b-d9414276f933	\N	\N	\N	\N	\N	\N	SE
b435ffa3-d6f6-431d-8ae9-a9507985c8f1	N	W	150	160	0	10	NE
2e057c51-3e89-4446-9fd9-bf8e6121ddae	\N	\N	\N	\N	\N	\N	SE
b6a6ce2c-2a96-4fed-946d-525d3ba6b43b	N	E	150	160	0	10	NW
b9eac67c-9f23-4f26-b5b2-b07b4291f000	\N	\N	\N	\N	\N	\N	SE
73d2bf69-23c6-442b-bbac-f095050c9ab0	\N	\N	\N	\N	\N	\N	SE
ee97d8db-c408-4222-98ea-bb1bb470f703	\N	\N	\N	\N	\N	\N	SE
4a421efc-cd3a-4b91-b70e-7513574e2c10	N	W	150	160	0	10	NE
f56827ab-57a4-4f8a-9c72-399b2825d6ef	\N	\N	\N	\N	\N	\N	SE
821aaff1-fcaf-4c9b-bda0-2e5ab417c778	N	W	150	160	0	10	NE
5d3fae1b-8930-4ea4-a336-4dfed39560da	N	E	150	160	0	10	NW
7504d52d-2479-4d71-921f-45bf1d0a6821	N	E	180	190	40	50	NE
cf013ee5-0646-4449-a6c8-90c41d7d7431	N	E	180	190	40	50	NE
0746e887-1802-40ae-89a7-78c63aadbea6	N	W	150	160	0	10	NE
6421fed7-1d80-44e9-b454-935116fd989c	N	E	160	170	30	40	SW
5cd47f0b-4eee-4769-8dc3-43d0252ab3c1	N	E	190	200	20	30	SE
aa8ecf77-5a3b-41b7-8f62-343e0d337004	N	W	160	170	0	10	SW
f11faf37-ad7b-4ec7-b0a9-09b5cc93e774	N	E	150	160	50	60	NNW
3acab44f-15b8-4ac1-ad0b-74ff622cb4b1	N	E	150	160	50	60	SW
79bdc51e-5b67-4fbc-8769-c64ea0d2335d	N	E	190	200	30	40	NE
80610f93-2062-4227-add2-ebc4a2bb5683	N	E	150	160	50	60	NNW
b1966cfb-31cf-4de5-9f02-84a6db0b8a1a	N	E	140	150	0	10	NE
96f98031-4e74-4832-9b9e-210b33a7dd63	N	E	160	170	30	40	SW
99bb38c1-5248-4de2-9e48-73a34d39276f	\N	\N	\N	\N	\N	\N	SE
fd1f4289-e900-49e4-934a-55745171790b	N	W	160	170	0	10	SW
5e5ca45f-e0dc-4e70-a1b3-ddacb4214875	\N	\N	\N	\N	\N	\N	SE
1c4f05ac-31c1-4cda-ac8c-3ceacc733c2a	N	W	160	170	0	10	NW
885d927b-1086-4b42-9635-763f01e177e8	N	E	190	200	20	30	SE
c936dca5-b1ea-4416-a506-3fd6f1aaccd1	N	E	160	170	30	40	SW
8010a561-e7cf-400e-b4b2-278e41ad65ec	N	W	160	170	0	10	NW
943d1cf7-2806-4621-9192-ccb7a1f5679f	N	W	160	170	0	10	NW
4048e65f-5cb6-46a4-ae0b-f69184e65981	N	E	150	160	0	10	NW
41ddc607-b56f-4408-900a-bd70e6e6fa5c	N	W	160	170	0	10	NW
abd828db-7455-4870-ba94-50693e42f7c4	N	W	160	170	0	10	NW
50146dae-0ddd-439f-a96d-62cf0d2a19a0	N	W	160	170	0	10	SW
e9943024-1c87-4386-b723-30014ecaf0d2	N	E	180	190	40	50	NE
623eec51-56c4-4304-b9c3-cb03bbbd8bcb	N	E	190	200	20	30	SE
afd8659d-3e97-48b5-91d1-8dec8eed38f4	N	E	180	190	40	50	NE
fcd927d7-24ea-4755-a6d9-454ccceff501	N	E	160	170	10	20	NW
852e33cf-f1ed-4abf-bc8e-81a31c85abd8	N	E	160	170	10	20	SE
50e28fe1-b49f-4bad-804b-d0f082c2f26b	N	E	150	160	0	10	NW
13204bbd-246b-420d-b262-da0a23a8b5cf	N	W	150	160	0	10	NE
4bf36225-bb47-476c-aee2-350c3c97698a	N	E	140	150	0	10	SW
d3c83868-39a6-4a36-a6ea-bc28e3ad3047	N	E	140	150	50	60	NW
1b86eec9-4a27-4e4d-9155-80ed4bb00dea	N	E	140	150	50	60	NW
74c931ca-8bcb-43b9-b014-6ac214e6b0d2	N	W	150	160	0	10	NE
3c4fcad5-f94e-4782-80be-eab4029e9b51	N	W	160	170	0	10	NW
e5863031-baf1-432e-be72-0a4c8dbecdc5	N	E	160	170	20	30	SW
be9a40c3-4f7a-46e4-86f9-093f745726a6	N	E	160	170	10	20	SE
0d333ce3-6452-4a91-9010-4f8ceb7a8b6f	N	E	200	210	20	30	SE
3593c381-602d-4e18-ae9d-c6a3eda3852d	N	E	150	160	0	10	NW
d36c0e86-4419-4466-81ce-78bfe26b322d	N	E	150	160	50	60	SW
101c75e0-e859-45c4-9351-3d1b81030221	N	E	150	160	0	10	NW
5d8af044-4589-464c-a8de-c8f5005a0e23	N	E	160	170	20	30	SW
15cb34ff-60c9-417f-b382-d424a386eea2	N	E	160	170	10	20	SW
5243795b-9674-4ed6-ae1f-fa6be953af3b	N	E	150	160	50	60	SW
697786c0-a552-4f82-aef2-f24d33252e8e	N	E	160	170	20	30	SW
9b2071b0-4268-40c3-906c-7c4ad2d8f25c	N	E	150	160	50	60	NNW
d09ac3a0-478e-4d77-9ea6-802ea3e5453d	N	E	160	170	10	20	
2393fb87-86a3-4611-b70e-9f5ec18b21d8	N	W	160	170	0	10	NW
e7c410b1-1f3c-4223-94d5-5d3b94443bb7	N	W	160	170	0	10	NW
e4c9ea87-d4f3-4822-9c97-6e8f0db65a42	\N	\N	\N	\N	\N	\N	SE
ce257897-a992-46d1-9f6c-6584fff65c58	N	E	190	200	20	30	SE
273cd6af-7de0-4868-bbb5-56ff893f9987	N	W	160	170	0	10	SW
a78e5345-5bec-4b64-89f7-5f1a9bbe630d	N	W	160	170	0	10	NW
cf1a12ea-b233-4337-b281-6ea81e12b35b	N	E	190	200	30	40	SE
bc59a954-6ca1-4be6-a41e-1242410db030	N	E	150	160	0	10	NW
73b0fd45-00d3-428c-a499-79471881eb89	N	W	130	140	20	30	NW
e0a4abd9-15b9-4a8a-9e55-55dc7cad33c6	N	W	130	140	20	30	NW
e7a4e894-7189-4af9-9c16-072ae768d912	N	W	130	140	20	30	NW
9506966f-585d-4685-afb0-05c4f2e05fa5	N	W	130	140	20	30	NW
46c8f274-5c4e-4e2f-a868-9c16a1a4b5eb	N	W	130	140	20	30	NW
47a3eaac-5d46-4ded-878e-ebfb8ec51611	N	W	130	140	20	30	NW
b3ee1c51-4f4f-4572-be84-110347d54ad5	N	W	130	140	20	30	NW
d06e9238-e7a5-4d16-84e8-d893821af802	N	W	130	140	20	30	NW
995d91b4-c885-439e-a96b-5a673c51f452	N	W	130	140	20	30	NW
3587ee22-c990-4fbe-a626-9b96051a9815	N	W	130	140	20	30	NW
9c7403ac-9972-4ed9-a989-439879f7f693	N	W	130	140	20	30	NW
e93e4334-af93-4347-aa5c-37a44d6ca712	N	W	130	140	20	30	NW
e56b953b-9e79-41ec-83e3-35de0dcd3bb9	N	W	130	140	20	30	NW
af02ecae-e1da-42e7-b26f-f95a229a6ca9	N	W	130	140	20	30	NW
8ee3459a-1575-4ebf-a94a-11b268511177	N	W	130	140	20	30	NW
27c295e2-2681-40e1-9df9-c8f10e78fcc2	N	W	130	140	20	30	NW
af311ec8-eb2b-473d-9dc1-3ece1b49590e	N	W	130	140	20	30	NW
b99549f9-1339-4248-a9af-2962857ac143	N	E	140	150	0	10	SE
a8a3fae5-4b2e-48e5-9bf2-50c1264eab34	N	E	140	150	0	10	SW
e2026d6f-e91a-439f-ab7d-6b2d876aa6c6	N	E	140	150	0	10	SW
8a5795c2-18dc-42c9-ad1b-fea22b8ad70f	N	E	140	150	0	10	SW
7ee8077d-9458-4e03-9af8-223e27c08949	N	E	140	150	0	10	SW
296ca745-5e6d-4518-88e0-4f53316d92ec	N	E	140	150	0	10	SW
6b9c976c-1816-4b6c-b9fe-200257f5c629	N	E	140	150	0	10	SW
e8eae724-4bfb-4f22-8627-d15e17a18a79	N	E	140	150	0	10	SW
cab3f5b0-9fc5-4ccc-8253-75f6390652b6	N	E	140	150	0	10	SW
7dd248d8-a388-4659-bd71-13730e2ff8be	N	E	140	150	0	10	SW
a9feb374-2b5f-479a-a054-896df31f2815	N	E	140	150	0	10	SW
2e61b5fd-ad19-4089-b690-d447694dc868	N	E	140	150	0	10	SW
b4bc2504-fce5-45e9-9e4a-73f89d940edf	N	E	140	150	0	10	SW
d7070aca-bb62-40bd-8b2f-c763785024a4	N	E	140	150	0	10	SW
7b1129a7-69a0-4d2a-beb3-b87d87edad40	N	E	140	150	0	10	SW
55b80517-20d1-4ce4-a158-5b7d7c56dbca	N	E	140	150	0	10	SW
412d2047-2c67-43be-a87b-26acef46ad81	N	E	140	150	0	10	SW
a576312e-afb9-4a7b-8aa2-3790ba74c113	N	E	140	150	0	10	SW
eacab596-4c28-4ec7-814d-37ab55deed21	N	E	140	150	0	10	SW
73e705ca-2583-403e-bf31-158968e432ac	N	E	140	150	0	10	SW
e294a34d-7a56-435e-a795-c88ed124131d	N	E	140	150	0	10	SW
d20364da-3715-41a0-9f1e-bfee2b032463	N	E	140	150	0	10	SW
bd6286e9-78a5-4a61-99ff-6b96c7007753	N	E	140	150	0	10	SW
e0202253-3962-4027-a768-608e9e63012d	N	E	140	150	40	50	NE
fdcad88f-e646-4ff0-9841-e38d97595705	N	E	140	150	40	50	NE
7377f3a8-4a17-4fca-aec5-b397997260e5	N	E	140	150	50	60	NW
a33a58d4-f6b4-4409-bf1c-b43282a86caa	N	E	140	150	50	60	NW
3fc11704-8865-4c89-bc7a-44b74ee6d247	N	E	140	150	50	60	NW
603d14c4-ea08-423e-af7c-170583cbc44d	N	E	140	150	50	60	NW
66bfdb8a-63ec-4567-91e6-17cd8cca619d	N	E	140	150	50	60	NW
d3a37bf8-7a25-4d60-ae09-b988569b9143	N	E	140	150	50	60	NW
20696eea-fb2a-4401-a29b-6b89d64e6bfd	N	E	140	150	50	60	NW
8fd1b238-f7c7-4106-af6d-b0a25e0ae22c	N	E	140	150	50	60	NW
1d5c9d57-0d59-41d2-af44-a94833546cba	N	E	140	150	50	60	NW
38bd50b2-f299-4c6e-a483-c8d5e64eeb2a	N	E	140	150	50	60	NW
5d710c0e-73cb-489a-9333-8ce602df1601	N	E	140	150	50	60	NW
0fcf348b-befd-48e9-852e-a92cb76f3d3f	N	E	140	150	50	60	NW
7b987864-b712-406a-8558-4bdf1df328c7	N	E	140	150	50	60	NW
b20e19ff-a9cf-4437-8012-842f1bf6acf3	N	E	140	150	50	60	NW
51cfcb80-3e35-47ae-957d-40a380df5857	N	E	140	150	50	60	NW
fbcdd5ef-ad3f-4a8c-b6a0-6ce7992d1732	N	E	140	150	50	60	NW
95fe9a37-eef9-4342-9fd3-f6c252404f66	N	E	140	150	50	60	NW
05c322b7-edea-43d0-b82c-bcff9e2d0f72	N	E	140	150	50	60	NW
d421284e-2ee4-4828-970a-70a5786b286a	N	E	140	150	50	60	NW
efc2526c-b5d2-4ef3-bd48-d1e44c4099af	N	E	150	160	0	10	NW
f823c8a4-8fd1-4273-8c9c-e2f20a7d7e58	N	E	150	160	0	10	NW
71fb017b-7d2f-4a53-9930-8882f76d086a	N	E	150	160	0	10	NW
b1134719-c99b-414f-b300-14eec046fb29	N	E	150	160	0	10	NW
600806fa-2b26-4288-94cb-abf2ddbadb4b	N	E	150	160	0	10	NW
54b37770-f48c-4824-a4a9-b79bceb2e110	N	E	150	160	0	10	NW
cd8c7c8b-a4d0-4cca-b2a1-0fd4a1058019	N	E	150	160	0	10	NW
78e3cb7d-5a3b-47a7-88a7-e790da63d0b3	N	E	150	160	0	10	NW
8deec43b-4cc8-4193-a294-893b0b5d002a	N	E	150	160	0	10	NW
5dd99dbf-8653-4898-9d7d-f01a45a462f1	N	E	150	160	0	10	NW
a8ee6148-d17d-42bc-a07c-f8eb097779bf	N	E	150	160	0	10	NW
aba43b6d-2584-48a2-b63c-08e638f6197e	N	E	150	160	0	10	NW
31d8cf99-4201-4328-acb2-3bac1a6cb9ec	N	E	150	160	0	10	NW
5f519ad6-deac-499b-af30-46e102248050	N	E	150	160	0	10	NW
542be089-396a-4b8c-8feb-aec62efa732e	N	E	150	160	0	10	NW
e917fa3e-7e2c-4f8f-af88-9b1d81438cbe	N	E	150	160	0	10	NW
d5512c3e-e393-4c33-be25-d51ce3f777a1	N	E	150	160	0	10	NW
d4c83c83-5db2-4f9e-af22-d4ea7993582d	N	E	150	160	0	10	SE
29332610-aada-4e20-acf2-3e9f081c1210	N	E	150	160	0	10	SE
ca56f046-dcc1-42d6-a74e-33f57cd2d8cb	N	E	150	160	0	10	SE
af7ce3db-46d2-4780-97d2-eb42a9ba56d9	N	E	150	160	0	10	SE
3bfc498b-c5d6-4021-be34-8647453cdf24	N	E	150	160	0	10	SE
44e7bffc-77c6-4b76-bc59-257edb18295e	N	E	150	160	0	10	SE
0094284f-6eb0-4e97-8b36-0cc0cbba8020	N	E	150	160	0	10	SE
42d3900f-35ee-4e72-8757-dd3194a06aa5	N	E	150	160	0	10	SE
68f5bff0-f80f-47ff-b349-3b502e4ddbf9	N	E	150	160	0	10	SE
0af13112-2879-43ce-a1e3-07d011c4f05e	N	E	150	160	0	10	SE
9999e9ed-7eed-4eb2-ad29-1a549d90083a	N	E	150	160	0	10	SE
ef939cd4-3269-48b4-8ae9-86ad138b01fb	N	E	150	160	0	10	SE
a318e993-a4a6-4504-8486-fc678e5e107b	N	E	150	160	0	10	SE
a1d1d73a-1de3-47f8-811a-a0cb49a211ac	N	E	150	160	0	10	SE
97922056-7761-495a-98ba-eeed8afc4f5b	N	E	150	160	0	10	SE
9f9cbeab-5b8f-4522-80ce-37386e25894f	N	E	150	160	0	10	SE
a9f70b04-efcd-41c9-9c85-9de36cd637f7	N	E	150	160	0	10	SE
ebfc6c21-3778-418c-be78-46da33c155f8	N	E	150	160	0	10	SE
c97dc22e-0b20-4a08-aebd-4c12919dd227	N	E	150	160	0	10	SE
f062adf1-ab17-4f6c-8540-e62208951c8c	N	E	150	160	0	10	SE
cd55ad51-d6ce-454b-ae73-cddaf6a2570b	N	E	150	160	0	10	SW
430ff75c-b727-487e-b23c-c5ee85457ef3	N	E	150	160	0	10	SW
810789ef-1679-42d8-bc19-c2463c5b3b62	N	E	150	160	0	10	SW
3ec9199b-d25d-4dfc-9d94-42403b008570	N	E	150	160	0	10	SW
a5d73138-9cbe-4b5e-8474-be54c8f261f7	N	E	150	160	0	10	SW
61be8de3-d78e-46a2-a5d0-5053c39be4cd	N	E	150	160	0	10	SW
238129d6-3d01-4c9f-b153-a6454bb64c24	N	E	150	160	0	10	SW
5978c38f-2422-44b2-8d4a-466302a9e311	N	E	150	160	0	10	SW
638c47bd-cd28-4bb7-9ff3-5c08eb1cabf1	N	W	150	160	0	10	NE
9b02c5e1-d051-4f71-8633-d69831e8ae5c	N	W	150	160	0	10	NE
4524be54-e602-44e7-a790-7b09b217e5e3	N	W	150	160	0	10	NE
8b08f7e6-485e-49b2-9f69-8ae8a13e4cb5	N	W	150	160	0	10	NE
1542f579-6a78-41ba-809d-33c74f74eec3	N	W	150	160	0	10	NE
ed4f640e-05b3-4be0-a5e1-8c9bc1d2e027	N	W	150	160	0	10	NE
fceeb5b3-6cb2-406d-9bf9-be7df0114939	N	W	150	160	0	10	NE
cadd747e-9034-4f60-bf72-57e94ed3a35f	N	W	150	160	0	10	NE
8b91ad20-5c7e-4bdc-97c8-8e948d61a0f3	N	W	150	160	0	10	NE
a6c7c3c1-6ae5-4fc3-ab82-365b9bdf5a65	N	W	150	160	0	10	NE
0c1d4015-cfd2-431b-9894-518df9063c69	N	W	150	160	0	10	NE
fbd09aed-3a98-427f-b2b2-a402b6456e57	N	W	150	160	0	10	NE
feeccebf-58a4-4eba-b65f-c7ebf78fefe8	N	W	150	160	0	10	NE
c9788449-eaf6-4a14-b18d-8d2372f46fdb	N	W	150	160	0	10	NE
977fd585-5f19-4433-9fce-d3622a62a276	N	W	150	160	0	10	NE
ce5a402b-8542-4111-bf96-529d3979c6e1	N	W	150	160	0	10	NE
c28bb0f2-d7c1-4ce5-95d1-40145e73e2dd	N	W	150	160	0	10	NE
afb34c4f-4cef-49d8-9229-95b78bd283eb	N	W	150	160	0	10	NE
363c82c1-ce73-4ffb-a2c9-959e63050cb4	N	W	150	160	0	10	NE
b9c846d1-739f-4695-b236-48e1aad6ac5e	N	W	150	160	0	10	NE
a1926fce-e3a0-40ba-a523-ae04a81862b5	N	E	150	160	50	60	NNW
f962ad58-32da-4a36-bc20-22e71ff7d36f	N	E	150	160	50	60	NNW
8b3c090e-baba-492c-8058-46edbbe4c797	N	E	150	160	50	60	NNW
87f947f9-40d1-4517-9857-c5f934418b03	N	E	150	160	50	60	NNW
caac4e87-eb70-4a6c-8f71-f3c50b73e8fc	N	E	150	160	50	60	NNW
390e7ede-1cf2-48c3-9068-0b6306a13db2	N	E	150	160	50	60	NNW
c7aad251-0dfd-4d10-acda-ac0e1435317e	N	E	150	160	50	60	NNW
32242fab-9c64-4762-ad22-e35026c61530	N	E	150	160	50	60	NNW
115f5d41-162f-4c22-a927-8b1b0466bb4b	N	E	150	160	50	60	NNW
84614c4d-25e7-4762-a1f3-de934466d95b	N	E	150	160	50	60	NNW
34d90c96-0a40-4eb8-924c-80659662b7a7	N	E	150	160	50	60	NNW
95222400-a389-4062-9aa5-e25b1eea7b1d	N	E	150	160	50	60	NNW
25888fad-44a4-47c5-9987-06987c569cfb	N	E	150	160	50	60	NNW
4cadd9e0-2ca2-46c6-b1fa-7b353168035b	N	E	150	160	50	60	NNW
85852613-3601-4958-bad6-21d35b2a6fb0	N	E	150	160	50	60	NNW
82c457c6-427e-4914-9147-c707aa67e402	N	E	150	160	50	60	NNW
4499f860-b3e4-47c1-b40f-2e949f8f1e56	N	E	150	160	50	60	NNW
19f5b1cb-cd89-4df0-9aaa-bbdab82cc7c7	N	E	150	160	50	60	NNW
fb3f1f4f-87a7-4c88-a264-79ddcc745dfd	N	E	150	160	50	60	NW
a629f59a-7078-4c29-a217-413adee0d906	N	E	150	160	50	60	NW
58ae6bd7-451d-45e0-8535-e5c817972049	N	E	150	160	50	60	SW
054a736a-faea-4651-940f-4cab1490749c	N	E	150	160	50	60	SW
fa09edab-3916-43aa-a9d0-781a3d1f04c6	N	E	150	160	50	60	SW
7aeef63b-4747-4530-99d8-07e109c0124a	N	E	150	160	50	60	SW
60334a36-47ff-4417-a18e-682c238a45b0	N	E	150	160	50	60	SW
e3f4553e-4a6c-49f1-b7b2-31ffd49b0500	N	E	150	160	50	60	SW
221e9a09-0edf-45e6-945d-0cbf4ad07255	N	E	150	160	50	60	SW
e2023b30-9456-44d2-8df1-033532ce8449	N	E	150	160	50	60	SW
a44874aa-4eaf-49da-8f16-8e010315ca94	N	E	150	160	50	60	SW
46cb32fd-0998-4270-aaf0-e8914ee13f4c	N	E	150	160	50	60	SW
22d2bb77-06af-4639-a2ca-e7ef25415b7c	N	E	150	160	50	60	SW
e7948daf-4a33-47bc-ae83-4d58e9a9b522	N	E	150	160	50	60	SW
c6a8f85b-224d-4a13-9380-9bf05c5034d9	N	E	150	160	50	60	SW
2adf6db6-568e-49cf-9730-856766447c80	N	E	150	160	50	60	SW
cb9b17c9-70f3-4793-9307-461ffc730f86	N	E	150	160	50	60	SW
35ab233d-9e1a-44c9-96b2-bb7109708be7	N	E	150	160	50	60	SW
f3acba34-a977-4981-9f1e-dc4f377764e5	N	E	150	160	50	60	SW
5c839e01-a8ca-4564-a738-a7be083a7237	N	W	160	170	0	10	NW
ee7a84f8-fdc9-423c-a42f-3007bb8f7e20	N	W	160	170	0	10	NW
762320b8-0f85-40f0-be13-86aa43847b94	N	W	160	170	0	10	NW
c9d77b7d-ddf4-4f8c-bb53-e808f5f6e133	N	W	160	170	0	10	NW
50b8838d-1ac6-4db9-a93e-61900ff17166	N	W	160	170	0	10	NW
97233dc6-5c6f-4f64-b920-149ef61154ab	N	W	160	170	0	10	NW
ec2566e5-3bcf-4afe-9ad5-2eed14bfe1fb	N	W	160	170	0	10	NW
acb24f5c-3019-4d68-bdf8-de2d31d0a7d4	N	W	160	170	0	10	NW
f027a57d-9dd0-464c-89da-cf74dfef682f	N	W	160	170	0	10	NW
885ee7b3-d607-4edb-ab17-d0cb4399dc1b	N	W	160	170	0	10	NW
f81fa4c6-3cb6-49b1-9d4a-523094df6b30	N	W	160	170	0	10	NW
3c477fbc-19d7-4e16-8b72-c13887b08dc1	N	W	160	170	0	10	NW
70b7cc87-03c9-486f-b824-f9f0fe7068e4	N	W	160	170	0	10	NW
899ce2c7-b566-41aa-9a9a-bbccffd7ce7a	N	W	160	170	0	10	NW
b85fea1c-9c6d-4089-bfc2-f70d0ce3f1ed	N	W	160	170	0	10	NW
4b227189-308d-4624-9154-be99313ee575	N	W	160	170	0	10	NW
13abc08f-85d5-4cd8-8449-9a55c01175b6	N	W	160	170	0	10	NW
0e4d7291-4fba-4409-9112-b6d473414366	N	W	160	170	0	10	NW
17e67d6d-336b-48ce-b725-6966133cb00e	N	W	160	170	0	10	NW
aee7d568-f6af-4dd8-b368-e9607f611e4c	N	W	160	170	0	10	NW
2214f515-ab23-4e5f-bfc7-bd6a99e3d557	N	W	160	170	0	10	NW
9b987749-b795-4af5-9546-a1c7a1e482da	N	W	160	170	0	10	NW
ab89f9db-d269-48fd-ac72-00e59bbe8144	N	W	160	170	0	10	NW
6abfa5a3-d318-4f48-9af0-f0ac912785cc	N	W	160	170	0	10	NW
ff643847-0c43-400d-bbb7-8b343de584e5	N	W	160	170	0	10	NW
49db3854-8dfe-433a-b280-e5d3bf288b5e	N	W	160	170	0	10	NW
0811f503-761f-44f1-8003-8befff321457	N	W	160	170	0	10	NW
ea18310a-4000-4d8e-85aa-a7007f040741	N	W	160	170	0	10	SW
023cb85d-7d5a-4f5c-925b-20f6d6792d14	N	W	160	170	0	10	SW
29cd3e8d-03c7-4f75-89e7-a40f973ff048	N	W	160	170	0	10	SW
480d1119-e4ed-488e-8a3d-801e686253e6	N	W	160	170	0	10	SW
1711fbf8-d88e-46cb-b445-902403163e8f	N	W	160	170	0	10	SW
6de12612-285e-46c8-b4fd-a85acd120b71	N	W	160	170	0	10	SW
40c866ab-c8d2-4956-8206-5004ac75cced	N	E	160	170	10	20	NW
dee63c0e-d5b7-4967-80d5-c86cf923cd4c	N	E	160	170	10	20	NW
5fc4abb2-3781-4cf8-b275-1f42ce933778	N	E	160	170	10	20	NW
35303b0c-7a0e-41c3-b2b1-07bd003f78b1	N	E	160	170	10	20	NW
731da559-381f-4b24-b7b1-dde386ac5942	N	E	160	170	10	20	NW
8a072246-d358-4e48-bec9-ef5aa27cb5a2	N	E	160	170	10	20	NW
2a092ad0-fc6f-4ca5-9207-8a44fc84c60a	N	E	160	170	10	20	NW
92d609bd-458b-415b-8732-6c1a36a49673	N	E	160	170	10	20	NW
2308d5d7-ba95-412c-b53f-e76734a4ccc9	N	E	160	170	10	20	NW
66e49452-c35c-46c2-803d-4a450f06dc0f	N	E	160	170	10	20	NW
a58604ee-ba1e-436a-b58e-6105f5d397c6	N	E	160	170	10	20	NW
1f93b599-96bd-4f56-9b89-01fdb613458f	N	E	160	170	10	20	NW
43599d2b-1c1c-4bb4-926f-3288689236ba	N	E	160	170	10	20	NW
f50ba218-3b06-4ef7-92fa-42de88e6161c	N	E	160	170	10	20	SE
626f46c3-55c1-4b26-ac19-e2e858b1f6e0	N	E	160	170	10	20	SE
31e62980-3ddd-4cfc-a85a-6f7eb58854c7	N	E	160	170	10	20	SE
ee7998bc-9879-4d7d-adda-a637e7ade9a4	N	E	160	170	10	20	SE
b102ea09-cead-4c32-89cd-6e31c23f9c30	N	E	160	170	10	20	SE
b12a1f5b-a739-4977-9f38-62b7b73cee8a	N	E	160	170	10	20	SE
647dc2b5-c7ec-4ef6-83e3-faefb13f86d9	N	E	160	170	10	20	SE
119ceb3e-a45a-4b75-8ae4-be00c7a29a7d	N	E	160	170	10	20	SE
61678a04-5f3f-40b4-9031-957e905ba834	N	E	160	170	10	20	SE
97261eb7-c4be-4f3f-980b-dad13c402fdd	N	E	160	170	10	20	SE
aa5cb452-f5a9-4c43-bfc3-87c66f2cf9db	N	E	160	170	10	20	SE
6f6dd568-0484-436f-8179-5f21a3365652	N	E	160	170	10	20	SE
bed1a8af-0e82-45c5-9a8a-534ae8a1c86e	N	E	160	170	10	20	SE
7b39f429-d8dd-4d98-a4cd-cd3afd14fe63	N	E	160	170	10	20	SE
fe46277b-80ed-46ce-b7a3-4eabe5f8948b	N	E	160	170	10	20	SE
ef761ada-794c-43ed-b362-3c8760716d2b	N	E	160	170	10	20	SE
d7292af9-4e34-4821-9b1e-1a51c08e83c8	N	E	160	170	10	20	SE
c4530ffe-b40e-4c7f-b565-a5dddf793a3c	N	E	160	170	10	20	SE
3bab77a7-536a-4d12-b718-9bddc1415aec	N	E	160	170	10	20	SE
468deccc-4758-425d-91cd-ed30d8a5e020	N	E	160	170	10	20	SE
66b89e13-1690-4582-b28e-5e021ad01b8b	N	E	160	170	10	20	SE
502ace88-9726-4d00-aeb5-a25d5cda4f11	N	E	160	170	10	20	SE
baa8e1c2-998a-45cc-8907-00614307e52d	N	E	160	170	10	20	SE
870b0ea1-bbf6-4d38-9b82-446fef7b826a	N	E	160	170	10	20	SE
96f27130-31fd-4b70-9770-531ec8455871	N	E	160	170	10	20	SE
8b97f837-69b2-4ca1-a5e6-16d9cdd4edb8	N	E	160	170	10	20	SE
ee439cf3-2638-4c31-be73-6776cc561d61	N	E	160	170	10	20	SE
e7e51ddb-90ef-4e92-8fe0-7a23086117bc	N	E	160	170	10	20	SE
292c60b4-1323-4811-8135-6119df951985	N	E	160	170	10	20	SE
3e55dd85-9fce-45d6-9958-84f2045c2713	N	E	160	170	10	20	SE
e5a88eb5-ae12-4fa8-85a3-802b98393302	N	E	160	170	10	20	SE
c6ac143f-52f1-4a6f-a9d4-984da865cf90	N	E	160	170	10	20	SE
dbe0f18d-9081-4ba2-a844-6c36927c410e	N	E	160	170	10	20	SE
c6f4947e-7835-4697-9586-a28e3ecd7985	N	E	160	170	10	20	SE
b39a59b3-3f28-4921-9f81-a677a6dd5f80	N	E	160	170	10	20	SW
5bfa3fe2-92ba-4403-a267-37f5af17f853	N	E	160	170	10	20	SW
21362ad2-9fd0-43d6-a8f3-2678d6753f60	N	E	160	170	10	20	SW
428d9178-028d-494d-8217-a752605b2d63	N	E	160	170	10	20	SW
50ec6cd2-253c-4cac-9ac6-27494aa53898	N	E	160	170	10	20	SW
87ddba9a-1d11-46ba-9cf5-afeec462b557	N	E	160	170	10	20	SW
d4825cd4-9e9e-4cd0-a03f-db741a0f43e4	N	E	160	170	10	20	SW
3ee3216a-04e6-48fd-b144-b6030fd65cf9	N	E	160	170	10	20	SW
866225d1-7b8d-4cd7-905c-2d255435586d	N	E	160	170	10	20	SW
7e0994eb-d00f-4ebe-9130-3d5fd52cbf9e	N	E	160	170	10	20	SW
8a8219b9-260e-43d1-93d3-932e0667a801	N	E	160	170	10	20	SW
873cf5cb-ee1d-40ee-bd34-b0a06a446d32	N	E	160	170	10	20	SW
0384d7e8-2060-4d05-930e-ca635a728251	N	E	160	170	10	20	SW
20d100c3-3e97-4263-876f-61bac77b1feb	N	E	160	170	10	20	SW
aa89940f-61d7-4c60-91b8-8aaeee0f1037	N	E	160	170	10	20	SW
1edbe8d7-3932-447a-a778-c87f819e9319	N	E	160	170	10	20	SW
0af4cee2-cd86-4833-8aac-4b2286acfcb9	N	E	160	170	10	20	SW
1feab241-a274-43eb-8ad1-ba463ef2d8f6	N	E	160	170	10	20	SW
9c8e9edd-cac1-4b29-9716-ed11563d4223	N	E	160	170	10	20	SW
9aeb04f5-5444-4075-a2a8-766fae8e76d9	N	E	160	170	10	20	SW
ce61a25d-9bf1-4d80-ab4e-cd78d68b5a31	N	E	160	170	10	20	SW
2fc0210f-e159-4cb5-ae5d-06a76c71e99c	N	E	160	170	10	20	SW
96dff2ba-b6db-4853-82e4-a478914612c0	N	E	160	170	10	20	SW
a8452f62-5e46-4e6e-8b83-0502d8f9a0f9	N	E	160	170	10	20	SW
94d56578-f7f3-472d-ad14-976bbb42d162	N	E	160	170	10	20	SW
da6da749-fab5-470e-8d15-e645712fdef9	N	E	160	170	10	20	SW
41b96c61-9cbb-4e33-9650-63916ef23515	N	E	160	170	10	20	SW
acc8d691-18c5-455d-ab68-0c7bd45722fa	N	E	160	170	10	20	SW
34252b0f-3d6e-44e7-a3c9-584234b54aa0	N	E	160	170	10	20	SW
87612196-eb3d-4b32-a103-1365c0e73c84	N	E	160	170	10	20	SW
6f1983a0-041c-455f-9878-a466ede67bdd	N	E	160	170	10	20	SW
652597ca-702c-4709-84ed-3a29257ae378	N	E	160	170	10	20	SW
73f29553-1d95-471f-8685-0d0fb69946be	N	E	160	170	10	20	SW
3707e87c-d0b1-4d16-82d7-2ba554a317f3	N	E	160	170	10	20	SW
9b54e160-dfa9-4845-9500-fe1923bf74a8	N	E	160	170	10	20	SW
407a999a-08ab-4293-b9c8-3531becf9072	N	E	160	170	10	20	SW
5fc8669f-728f-4722-82c7-34012f89291f	N	E	160	170	10	20	SW
4ccdb3c9-dc63-4971-b285-15fc3bc5176f	N	E	160	170	10	20	SW
0f4e30dc-d878-4800-9fdb-fd151101091b	N	E	160	170	10	20	SW
90338a68-27b7-4600-8f30-42a06385ead1	N	E	160	170	10	20	SW
395d6924-ab50-4152-a019-9078ce2c8548	N	E	160	170	20	30	SW
b0905756-7c71-4efd-a252-985d9d04f95c	N	E	160	170	20	30	SW
e42c36c7-23ed-43e6-a3cd-6ad34ec55d89	N	E	160	170	20	30	SW
0547aa4d-57fb-434e-95d7-e126cd92cb8d	N	E	160	170	20	30	SW
880f24f0-0dfe-4d83-8d14-27ab9c16e58a	N	E	160	170	20	30	SW
a10e929a-9767-43c8-bb10-7bce15f8f258	N	E	160	170	20	30	SW
37cb5379-48c1-4f51-8a88-761e89dec9a5	N	E	160	170	20	30	SW
6dbd5db3-5e8b-4b7e-80c1-6fa830136136	N	E	160	170	20	30	SW
a35e929b-925e-470a-bedd-e4243e8706c9	N	E	160	170	20	30	SW
ad0766c9-8b4d-4fbc-98d7-512c7babfceb	N	E	160	170	20	30	SW
de9bb57e-792e-4bc0-945f-045b951773a6	N	E	160	170	20	30	SW
6b1554e8-b5ff-44db-9972-c9fda9b1c0db	N	E	160	170	20	30	SW
9cbf394c-0139-4afd-adcc-8c3b473d3c0a	N	E	160	170	20	30	SW
e957fa46-b3c6-4590-8bc0-4ad2764c8a28	N	E	160	170	20	30	SW
0268006c-a22e-469b-ac56-3de96bb1d74f	N	E	160	170	30	40	SW
8fa1fa50-647a-4366-a9b1-ff1460bb7e1e	N	E	160	170	30	40	SW
5e9c9687-e010-4c57-8cbd-87fbe1dda566	N	E	160	170	30	40	SW
eb3c2d7a-3081-4002-8c93-f282530bc4df	N	E	160	170	30	40	SW
aeb397bf-8bb4-49bb-9414-5d97221d9793	N	E	160	170	30	40	SW
f0e62467-902d-4faf-a2a6-8b50e091a513	N	E	160	170	30	40	SW
6bfbf798-c94c-46b1-95af-923412b1cca7	N	E	160	170	30	40	SW
503781a3-13ff-4c39-9038-cbdf7a42b138	N	E	160	170	30	40	SW
aa3637c3-5b49-4970-aceb-648d70def360	N	E	160	170	30	40	SW
192afbe5-32d2-4257-b0b1-38fab0346ba4	N	E	160	170	30	40	SW
a35e1df8-7510-4f6c-ba3a-35e1631d93af	N	E	160	170	30	40	SW
a8b52b6c-c39d-418c-a844-bac82f48fc78	N	E	160	170	30	40	SW
e217b83b-1695-4636-922f-7f15baa0398a	N	E	160	170	30	40	SW
c5d46c0c-1967-400a-b734-f6daa552f6e5	N	E	160	170	50	60	SW
96d174fc-1bf2-41a3-9c10-dcde353cd235	N	E	160	170	50	60	SW
f124ea94-6165-4835-a1c5-9aea75f45641	N	E	160	170	50	60	SW
ad4bc86a-ad26-4b57-9c46-a4a8c5346b45	N	E	160	170	50	60	SW
6772833b-f88c-47a6-ba53-92ad8362d5a7	N	E	180	190	40	50	NE
2b3f765a-d168-4d29-87ca-bad309dca0f0	N	E	180	190	40	50	NE
687d4652-4256-426d-816b-7d5174beb7bf	N	E	180	190	40	50	NE
aed1875e-cfec-425c-9f99-a3a520c25003	N	E	180	190	40	50	NE
22d3f3f1-397c-4b30-b287-d6ff694983e2	N	E	180	190	40	50	NE
18f2bc11-43d1-40e3-b449-b8febf4b1f94	N	E	180	190	40	50	NE
dbf722ec-0fc9-4dfd-bf83-4be0513ee865	N	E	180	190	40	50	NE
c9d25473-f6d0-47a8-9b55-2a096e4e374b	N	E	180	190	40	50	NE
ec04e986-a1fa-4f98-ba01-0bd4ef8847be	N	E	180	190	40	50	NE
8817965f-351d-46b8-97b9-0214602aec23	N	E	180	190	40	50	NE
94ff7288-c0bd-4a74-a494-f1dfcc77ffaa	N	E	180	190	40	50	NE
f7f79e67-515f-44de-b7cf-aac2cc23eecb	N	E	180	190	40	50	NE
52db0c4a-cf85-4444-af45-400dbdc646e6	N	E	180	190	40	50	NE
fdbd8365-48db-44b6-b63a-5275fab11499	N	E	180	190	40	50	NE
265fa61e-b5ad-4e30-8cd3-c2a0118fee28	N	E	180	190	40	50	NE
7feb2d48-b668-47fe-85e0-005a9bd97ab9	N	E	180	190	40	50	NE
08b05b53-9106-49ba-b527-3ea72cb42b69	N	E	180	190	40	50	NE
36cfcece-abda-493b-b17d-ccfeebcf705d	N	E	180	190	40	50	NW
add5d58d-f621-43fe-a485-a902534f6d19	N	E	180	190	40	50	NW
6221c9fa-f708-4bca-a17c-768c4cc87f1c	N	E	180	190	40	50	NW
b439a38f-30e1-4f80-ac40-93513152091e	N	E	180	190	40	50	NW
3692e7a4-495e-4802-9802-70cb7ac63642	N	E	180	190	40	50	NW
35d20e56-97e1-4653-a73f-f5d9321f83d8	N	E	180	190	40	50	NW
806326b1-2ede-4609-bc8f-5e45120605e9	N	E	180	190	40	50	NW
0cf81e48-e6a2-452b-91dc-422899efae75	N	E	180	190	40	50	NW
83a04704-f7bb-4928-a07a-71a9d2facde3	N	E	180	190	40	50	NW
01f4731a-8871-4098-bfe6-7383935c5436	N	E	180	190	40	50	NW
a7d5722e-3bf6-47c9-b4f0-74f61f4f99f3	N	E	180	190	40	50	NW
bb23732a-f502-4d1f-8b31-06abb9e2770b	N	E	180	190	40	50	NW
9bf1d249-f01f-4033-81e0-c81e4ddebf7e	N	E	180	190	40	50	NW
0052173f-a4d1-4766-88e3-433c0a002800	N	E	180	190	40	50	SW
45770631-4e09-4494-a7af-cd0082ef2e69	N	E	180	190	40	50	SW
fbbfffb5-3c26-49db-a40b-b3378d524a9e	N	E	180	190	40	50	SW
66069ce9-3f64-4055-af11-3203e7231727	N	E	180	190	40	50	SW
6bb847c3-4d1c-40fd-bad4-3d3f02b8aff3	N	E	180	190	40	50	SW
43958405-b5ed-47dd-9a62-7794b6386a2b	N	E	180	190	40	50	SW
77bdfe77-7978-4cdf-815a-58e8be0dc6f5	N	E	180	190	40	50	SW
6e245486-fc26-42bf-aae7-e21d3a82fbe4	N	E	180	190	40	50	SW
37f9f974-d16d-4ffb-89d0-5d41f17bb92e	N	E	180	190	40	50	SW
35169898-ce5f-4faf-b02c-82fd6d36a4fa	N	E	180	190	40	50	SW
86d5e73e-423b-4e99-9be5-02febe0a11a7	N	E	180	190	40	50	SW
fb97319a-6f58-4bff-b234-d4b861f40bd0	N	E	180	190	40	50	SW
dc860300-5582-4e8e-8c22-e042d434fb84	N	E	180	190	40	50	SW
3920a8fc-e177-478d-8597-b00f2dbf782c	N	E	180	190	40	50	SW
d6968327-a785-4958-8d04-0d63d96b69b5	N	E	180	190	40	50	SW
42517177-2bcb-422b-b279-0982f0594465	N	E	180	190	40	50	SW
b6e97417-f584-4b99-9992-21d9031be4b9	N	E	180	190	40	50	SW
f6e6a0db-0b81-4ddc-9c32-9d722bf30389	N	E	180	190	40	50	SW
9a1f67d5-97a4-4309-8c41-b21ff660dff0	N	E	180	190	40	50	SW
3e07bf32-0dcd-478f-9fea-561734141d03	N	E	180	190	40	50	SW
8231d1aa-77cb-4c6c-a6e4-65d3a5fc2f14	N	E	180	190	40	50	SW
4c0ef13b-64d8-4b0b-8fc8-99ba28116bda	N	E	180	190	40	50	SW
3e69a4ec-b900-4d63-8867-6f151f0c2670	N	E	180	190	40	50	SW
59b3eddd-d0c9-4de3-9056-afde96767771	N	E	180	190	40	50	SW
0c1d7fed-a6cf-4d3b-9a44-a8ab99553417	N	E	180	190	40	50	SW
766a035d-df09-461d-b80f-8de8ea100c35	N	E	180	190	40	50	SW
6920111a-34d8-452f-bbb1-80d94d8070dd	N	W	190	200	20	30	NW
9e651c3f-550d-4279-bcb4-4258144bb4e8	N	W	190	200	20	30	NW
6d0c0eff-a973-4590-8bf4-4669b1abf89d	N	W	190	200	20	30	NW
408a8f79-c90c-42cf-ab77-e730032fe597	N	W	190	200	20	30	NW
0336226a-c06f-4ad3-b0f8-1ac20ef21bcc	N	W	190	200	20	30	NW
dd78dd57-b1a1-4fcd-9441-9b0513695e94	N	W	190	200	20	30	NW
4c257b1c-8926-46ef-9720-da0db4d31f3f	N	W	190	200	20	30	NW
e2d71035-0563-48ff-92e8-14749a9b32bd	N	W	190	200	20	30	NW
315651f2-6a8c-4bc2-ad1e-71179ecee239	N	W	190	200	20	30	NW
4468239b-8ca5-4834-ad5d-286c8e1d43fc	N	W	190	200	20	30	NW
667e5ccc-cbd0-45c4-b305-4b3451699d09	N	E	190	200	20	30	SE
0def363b-02b7-4bd6-98cf-a2ac5d1c0183	N	E	190	200	20	30	SE
49350b44-a9e6-4bf1-bff9-960a3f58fd18	N	E	190	200	20	30	SE
2c654d45-50f2-41e8-bc0f-b70f4d4c4a8b	N	E	190	200	20	30	SE
712f878b-a0fd-41a4-998b-fc8a8a88a310	N	E	190	200	20	30	SE
cf65580e-668e-4a34-9a57-5f834491f1c5	N	E	190	200	20	30	SE
13f26764-0c82-429c-8022-577f869dc131	N	E	190	200	20	30	SE
e101f92e-aa2f-4ba3-a23c-bc9371d50927	N	E	190	200	20	30	SE
ffbe000e-1173-46ad-8396-404b147cbef3	N	E	190	200	20	30	SE
e6d49438-2044-4bbb-890e-ddd90a097f3d	N	E	190	200	20	30	SE
28f17316-9a76-4087-a832-a01b4748ec2e	N	E	190	200	20	30	SE
d0935828-dbaa-4f11-b17b-6b5371397c17	N	E	190	200	20	30	SE
97982707-bf5a-4fe1-970d-82134150e8d8	N	E	190	200	20	30	SE
6125b84c-64e2-40fb-b947-263caf66199b	N	E	190	200	20	30	SE
256cd0a5-ff9d-40d4-a7c9-5489ae53ff41	N	E	190	200	20	30	SE
f0749848-6fa8-48e8-a4d2-5c53b55d08f4	N	E	190	200	30	40	NE
a93127a0-d9e3-401d-8aef-57060cfa572d	N	E	190	200	30	40	NE
46a28a82-70ee-4420-af04-05a9c1363eaf	N	E	190	200	30	40	NE
9f9c5e42-2ef0-4432-bebb-c47fa78ee058	N	E	190	200	30	40	NE
644aab3a-5d70-425d-8f0b-c1a37c592f68	N	E	190	200	30	40	NE
3512f2ab-989e-4cc3-a8ea-8fe30be9c979	N	E	190	200	30	40	NE
fd19779b-3b3e-478c-b30f-5be618250664	N	E	190	200	30	40	NE
ca6d513a-4481-4758-b40a-842fe33b769e	N	E	190	200	30	40	NE
48de830f-1f85-46b4-8697-96a61d7079b9	N	E	190	200	30	40	NE
7b272807-1b65-4eb8-b569-cc1a171a1915	N	E	190	200	30	40	NE
82b7f175-3934-4ba2-9f50-401536ff7418	N	E	190	200	30	40	NE
e12831ed-e090-46d9-b104-6a1751acebb0	N	E	190	200	30	40	NE
2470597a-c77b-4346-ab1a-c300b09ea17f	N	E	190	200	30	40	NE
74ff196a-6da4-4459-a4b1-673dddbcfab1	N	E	190	200	30	40	NE
acf4d03c-a101-4c2b-8396-f4e9431e9820	N	E	190	200	30	40	NE
e4485f5b-a530-4287-b78d-a8ed55a3c8d5	N	E	190	200	30	40	NE
4416c0a3-ad65-4d01-a1c8-6de4abbc5454	N	E	190	200	30	40	NE
a4b4ec36-7352-4028-bc75-9feaea7186bd	N	E	190	200	30	40	NE
84a7b1ef-7ec4-4064-a7f6-144a842ec720	N	E	190	200	30	40	NE
c0774887-82e3-480c-8e16-9976dbc85284	N	E	190	200	30	40	NE
5c502399-b717-4a0a-a790-3fe5c1e95672	N	E	190	200	30	40	NE
9d8d4ed4-feeb-4f4e-8e9f-90f84179ed00	N	E	190	200	30	40	NE
b5055830-cd97-4973-b30e-b290f0efa599	N	E	190	200	30	40	NE
05e2639e-f5ab-41ef-98a7-14a2a82058e6	N	E	190	200	30	40	NE
c6a12db1-644c-4258-86ef-24381a94edee	N	E	190	200	30	40	NE
94c92a14-5f50-4545-9943-ed5310058e1e	N	E	190	200	30	40	NE
2ac619ac-f651-4761-bcfc-18cea7c1fb60	N	E	190	200	30	40	NE
dd44df8a-a852-4f31-8a64-5073b4560a1b	N	E	190	200	30	40	NE
c26bef4f-a9a7-4f94-9e46-624179e4b5c1	N	E	190	200	30	40	NE
612f4d11-e7ed-43c3-999a-8725fe958465	N	E	190	200	30	40	NE
6fcc1dfb-16fb-42aa-b43c-594ebb5888f6	N	E	190	200	30	40	NE
cddc4d4c-1623-438b-a2f8-31b7dc4bdaf4	N	E	190	200	30	40	NE
1a515fb4-52d7-4d02-8060-bc0399a7a27b	N	E	190	200	30	40	NE
0dc96874-9e30-41d1-b80a-6b39d019a67b	N	E	190	200	30	40	NE
fe6e3834-1c7c-40f8-a9ae-5830c0d72a82	N	E	190	200	30	40	NE
d1b60c03-5f25-4c73-b926-33d91df56daf	N	E	190	200	30	40	NE
4727200b-0626-4668-8323-fd4c7175040c	N	E	190	200	30	40	NE
d3d6a829-d90d-4d3e-a70b-78b23898f232	N	E	190	200	30	40	NE
bb36f3b7-f3d2-47bf-b323-ab08398d96c4	N	E	190	200	30	40	NE
728c859b-02ff-47b0-ab12-abe4c2118961	N	E	190	200	30	40	NE
a4e4253e-cf28-42e8-b872-2ee26391e67a	N	E	190	200	30	40	NE
a534e686-a6cb-4152-be0a-ab7e49ee8b85	N	E	190	200	30	40	NE
11d15671-25ed-484b-860c-6c8c3d0ed4a9	N	E	190	200	30	40	NE
ae02bccf-b643-4dc3-81ce-91bb2d21d75e	N	E	190	200	30	40	NE
1be469c6-3acd-4e38-989f-6ea5029258f1	N	E	190	200	30	40	NE
ae4aa29c-6788-4925-b6d8-78546cb503d7	N	E	190	200	30	40	SE
8eae459a-f5cf-44b2-b8b6-8ffa7c7d3bb1	N	E	190	200	30	40	SE
0e47ad3e-3d1e-44af-974e-d4aa87a608e1	N	E	190	200	30	40	SE
5a521821-bc0a-406f-811c-a9dd64406dd7	N	E	190	200	30	40	SE
a3004077-b3f6-480c-8a42-e9f9842e6381	N	E	190	200	30	40	SE
5375548a-f052-42e1-8ae0-0b3e228a2a1f	N	E	190	200	30	40	SE
65089786-47f0-44ec-b62e-f3faa96d67e2	N	E	190	200	30	40	SE
f181b9e8-4578-447f-b121-cb440a7c2c60	N	E	190	200	30	40	SE
18deba23-60d4-44a4-9d44-eb7345c2b340	N	E	190	200	30	40	SE
d0ad4a18-ad32-4954-9b85-19d1380a4787	N	E	190	200	30	40	SE
8d25cdfc-4fd7-4e2d-9a32-a384cac40ed8	N	E	190	200	30	40	SE
0b310e29-5788-4595-bc90-4f33f5ca7e63	N	E	190	200	30	40	SE
16626615-6872-4f57-9fd5-310bcdae2f3d	N	E	190	200	30	40	SE
0c49b137-7284-481a-b2e1-a0b265fa3d92	N	E	190	200	30	40	SE
7726abee-b1a3-43ea-8cf9-13090e4a58dc	N	E	190	200	30	40	SE
4753dec1-34b3-40cf-973f-b1bbd6f21d9e	N	E	190	200	30	40	SE
21ca972b-94db-4ecc-9cb5-ad01f6eb85d9	N	E	190	200	30	40	SE
6b737525-a48c-4f87-a40e-4dc4c358cb79	N	E	190	200	30	40	SE
2f8f8c23-7225-4a8c-94d0-1a8fffdff3d5	N	E	190	200	30	40	SE
9883fea6-274d-4ffa-adcf-4aaaa9a784a5	N	E	190	200	30	40	SE
38b0b4c4-b5d3-4d81-b947-66c17df26664	N	E	190	200	30	40	SE
8509d7f8-3629-4476-9a73-855ad32e2e83	N	E	190	200	30	40	SE
58f4e084-0882-4279-a4f6-72df40228000	N	E	190	200	30	40	SE
baa2bec7-003e-4a23-845b-4b7b4f301e79	N	E	190	200	30	40	SE
112958c5-0eed-41ef-a463-85acb153b015	N	E	190	200	30	40	SE
5a8b33b8-0e94-4a25-9dd5-9eb11fff4b8e	N	E	190	200	30	40	SE
0a91f73b-ee70-48e3-b691-3269153eb48b	N	E	190	200	30	40	SE
ab725d24-e684-4835-ba21-20763adaa1e6	N	E	190	200	30	40	SE
cd7e5021-03f7-40ea-971f-6e06673fa4b9	N	E	190	200	30	40	SE
da60b722-088a-4bda-a3bd-ea02e1ff8fdc	N	E	190	200	30	40	SW
b7b37d70-991e-4d25-a2cf-e40a9938f243	N	E	190	200	30	40	SW
70cf3980-b8ef-4b1b-bd6b-89d4aa9cf48e	N	E	190	200	30	40	SW
14af5392-e0b2-4284-8e72-fb84f22a8a8d	N	E	190	200	30	40	SW
29163697-3686-4805-a658-e2793bb4352f	N	E	190	200	30	40	SW
a473bf45-94a9-43af-822e-d250aa853893	N	E	190	200	30	40	SW
b4a9107d-b647-497f-88c2-ee7af8f6a94e	N	E	190	200	30	40	SW
0c912ed2-c649-4d59-b8d2-72070c534dfa	N	E	190	200	30	40	SW
66ad4bf7-d129-4040-a78a-6327e4c21c05	N	E	190	200	30	40	SW
4c56c695-c407-4437-94f6-79820a087318	N	E	190	200	30	40	SW
d4e4796c-7ed5-45d5-a731-e5cd89c247b2	N	E	190	200	30	40	SW
aa303456-a724-4702-8c98-3d579a3845c4	N	E	190	200	30	40	SW
ef7c20ca-e82b-4553-b709-33fa39a7c209	N	E	190	200	30	40	SW
024f8860-6f2f-4ed5-9077-f8f3ad0e2078	N	E	190	200	30	40	SW
48525f0b-da0d-40be-8bef-2cbc63ef2402	N	E	190	200	30	40	SW
b0588f84-8b2c-4654-bc2e-636679a3bbf5	N	E	190	200	30	40	SW
5eab0cff-aad8-4f0f-9a8f-3ad82edf97a2	N	E	190	200	30	40	SW
2e414c24-34d0-49f0-b346-21bbecb54316	N	E	190	200	30	40	SW
94170335-c495-4ba7-8cad-1c1501c53971	N	E	190	200	40	50	SE
5e367314-6959-46fa-b98e-f3e018fe49bd	N	E	190	200	40	50	SE
a374d71c-0c2d-46c8-97df-a8f8e7dc7337	N	E	190	200	40	50	SE
42602652-8116-495e-b78b-af50137ab3a0	N	E	190	200	40	50	SE
a9d3678b-d2fb-47d8-a954-531612ad66d8	N	E	190	200	40	50	SE
1abdbf87-4e36-4061-8d44-ee9e6e0251af	N	E	190	200	40	50	SE
5f35d2ef-b0d1-4d39-8aac-0e5816336bab	N	E	190	200	40	50	SE
4cf7de07-6d06-4951-81d4-2b4b47d7f6a5	N	E	190	200	40	50	SE
41acbe93-5500-427f-9a3a-0b7928ecd039	N	E	190	200	40	50	SE
4824150d-c27f-4240-9f1d-b3ed71151042	N	E	190	200	40	50	SE
71276a2b-5474-4e80-b045-e2b8819f8d0b	N	E	190	200	40	50	SE
43ea626e-464d-4c54-b54c-6f56b5bffa44	N	E	190	200	40	50	SE
1519146d-31e6-4c03-aabe-e043d979270a	N	E	190	200	40	50	SE
c2da7197-7dea-4618-b0a8-2daf833d61d4	N	E	190	200	40	50	SE
e17305f0-d11c-4633-9397-b31df093ef25	N	E	190	200	40	50	SE
91a12190-dc33-44ba-8c50-c20aad5445f3	N	E	190	200	40	50	SE
48a8d562-3dc6-4144-9292-0047f3130d91	N	E	190	200	40	50	SE
5151c7f2-dc09-4d63-92fe-c2bffc997013	N	E	190	200	40	50	SE
bc2c2400-45f1-41bd-b06a-18e87b722ac8	N	E	190	200	40	50	SW
e47372e6-e1b0-4e9b-a513-d0699aeef421	N	E	190	200	40	50	SW
b3aa3fc0-7abc-4206-8fb5-9f7923768521	N	E	190	200	40	50	SW
cb75b6cd-87e2-4fc9-9588-3e5fe56105ee	N	E	190	200	40	50	SW
59e1c10b-7ee3-4337-85f5-ee54d9100415	N	E	190	200	40	50	SW
15db7414-2f85-47e1-b481-cf9d6427665c	N	E	190	200	40	50	SW
b66becca-826c-459e-bafb-3fcfc0ad13ae	N	E	190	200	40	50	SW
4b063d01-d90d-4e5e-a3b2-eaae44fb9501	N	E	190	200	40	50	SW
4236746a-87f1-47ff-b9c3-ed7a95f05f81	N	E	190	200	40	50	SW
fdb00ce3-70b5-4c56-afc5-f8649340da25	N	E	190	200	40	50	SW
c637726c-7283-4fd5-b774-f179c0dd9434	N	E	190	200	40	50	SW
45f25170-28a0-44cd-bf03-444c207a3fb5	N	E	190	200	40	50	SW
4a0883cd-a910-4a76-875d-b610d076a695	N	E	190	200	40	50	SW
d4f40309-9095-4957-80d4-c237026ec5aa	N	E	190	200	40	50	SW
c282052b-8b41-40ba-ba7e-d2debdfe31f3	N	E	190	200	40	50	SW
95323445-4a3d-45b5-a219-e9db140a8ce1	N	E	190	200	40	50	SW
e46dcece-e4f4-4fbb-9a77-fe02558c4cf4	N	E	190	200	40	50	SW
053d7e70-2dc2-47d9-83ab-920c557bc2a7	N	E	190	200	40	50	SW
517e88e2-4a60-4192-b275-8feb35427232	N	E	190	200	40	50	SW
20223dc0-43dc-4eff-a3e6-7bd3a0f18f03	N	E	190	200	40	50	SW
3300bfb2-1f7a-4d04-985f-7a86ca45fb29	N	E	190	200	40	50	SW
eb26f82e-ad8c-4d74-9d2b-54e8f2f3e5b2	N	E	190	200	30	40	SW
1ce5442e-669f-4cdb-a6ef-5a992176cdcd	N	E	190	200	30	40	SW
2ee03f04-c82b-45b2-888d-a74981f58c4f	N	E	200	210	20	30	SE
c1396166-3606-4994-9f74-33cb45c48c0f	N	E	200	210	20	30	SE
16258bf8-f6ea-408f-8261-626a59e36b11	N	E	200	210	20	30	SE
7c003b60-225b-4687-975b-5fa90cacbb4b	N	E	200	210	20	30	SE
9aecc418-18d5-43f9-94db-0b58c751089c	N	E	200	210	20	30	SE
55a6e5ac-0e96-4422-8a77-36ea82172f5b	N	E	200	210	20	30	SE
8233aaeb-f89e-4989-a154-b0337b82ec21	N	E	200	210	20	30	SE
1046af4c-9357-4684-824f-3f185ebcda85	N	E	200	210	20	30	SE
423113c8-965d-49ca-8b20-31d8789e5006	N	E	200	210	20	30	SE
ebaa65f0-3b14-4e5d-9ede-df25ab1aca03	N	E	200	210	20	30	SE
f03e39e8-069e-4694-9a74-08a3d535464b	N	E	200	210	20	30	SE
e542e5a1-c33b-4819-a460-e8a5b7e6b341	N	E	200	210	20	30	SE
5b094486-61d1-4bf6-b753-d92c32470167	N	E	200	210	20	30	SE
9ebb974f-85be-4dc9-9654-cd395cff6c2c	N	E	200	210	20	30	SE
715b6d1c-c591-4333-8384-2bc86815dd93	N	E	200	210	20	30	SE
53fea189-a63c-4af4-99dd-6d1ba8f234c0	N	E	200	210	20	30	SE
d6e19928-4200-4e3b-8ed7-13db0472889b	N	E	200	210	20	30	SE
39fc2fa0-7061-49be-b0b4-c0e86b4f8973	N	E	200	210	20	30	SE
e2845a86-22d4-4fd1-a2c0-62c850e4f888	N	E	200	210	20	30	SE
d79dce76-4871-4ca5-93a7-ccddf8f4d64e	N	E	200	210	20	30	SE
2dd12712-6cfb-4fe0-8943-5520435462fb	N	E	200	210	20	30	SE
f4d8cf74-ff3f-4a9a-a797-810f3123f589	N	E	200	210	20	30	SE
a17d16b5-aee2-4cf2-8893-5a6b0f3f722b	N	E	200	210	20	30	SE
640a8288-1495-4757-b0d8-4c400bc985b1	N	E	200	210	20	30	SE
09b152ba-62db-4c5f-8eef-bcd027312e06	N	E	200	210	20	30	SE
2030b3ca-4962-42fa-b0d9-d8b088cee663	N	E	200	210	20	30	SE
3e0befa6-af82-4de6-80b6-237c7f2e88b7	N	E	200	210	20	30	SE
6ab7609b-a9b8-42b1-b69a-d8123386ea4d	N	E	200	210	20	30	SE
e2f58f63-06e7-40df-aec4-a6827ad7d677	N	E	200	210	20	30	SE
2334b373-1f7f-4c04-b782-1a98f77f2ee9	N	E	200	210	20	30	SE
6efca72e-88ff-4bd2-b2a9-2dd3d098efca	N	E	200	210	20	30	SE
139a0ea1-1494-421e-88c6-a9bfe8eae54b	N	E	200	210	30	40	SW
a8d1c85e-dbfe-4d0f-b496-9942df794732	N	E	200	210	30	40	SW
df64f05d-dad7-404c-914a-9c5a3e475479	N	E	200	210	30	40	SW
3ba6e8b5-799f-4b6c-b1af-839542983e1c	N	E	200	210	30	40	SW
7b9280e9-a94b-44c4-a4ed-330feefc2afe	N	E	200	210	30	40	SW
1e737293-aa78-4b5a-8b4c-6f3663b293f6	N	E	200	210	30	40	SW
101a9182-fd8f-415e-a946-01d5decd66f3	N	E	200	210	30	40	SW
16a11217-1b49-49e0-9652-5e8af3fd0a5c	N	E	200	210	30	40	SW
e194eb7d-72f7-4018-a4ca-889ba66b7a40	N	E	200	210	30	40	SW
0da9d012-ae1d-4ad9-a745-ab9ae954e1e3	N	E	200	210	30	40	SW
4afe4d59-2181-415d-a51c-f792ad248e17	N	E	200	210	30	40	SW
ee042074-a8e9-47c5-95e6-3a3037b84611	N	E	200	210	30	40	SW
df485cce-d268-4681-bb7c-8aca79046f47	N	E	200	210	30	40	SW
51b96a7d-ed6b-4913-b445-1e21c9f8f7c5	N	E	200	210	30	40	SW
4164fb0a-9b1a-4d39-91f1-31426bf93118	N	E	200	210	30	40	SW
2e886d04-17fd-400d-a63f-1578461d0afe	N	E	200	210	30	40	SW
dfe8bf44-7e84-49f3-9913-15bba77f279b	N	E	200	210	30	40	SW
b5960c52-04e9-44c3-a8ee-1065544dfe0b	N	E	200	210	30	40	SW
1f92da42-5626-4ebf-8cdd-592483d75808	N	E	200	210	30	40	SW
31131174-99ee-40a1-955d-a67c4ac63546	N	E	200	210	30	40	SW
eddd87e1-10e1-4d3a-8521-42327f773074	N	E	200	210	30	40	SW
7f899144-0803-4c79-bbba-d0eb0869b399	N	E	200	210	30	40	SW
ee526c03-4538-4772-8503-c12a09d96a70	N	E	200	210	30	40	SW
6a4601de-f06a-43fa-acac-38ace46fe766	N	E	200	210	30	40	SW
e719e349-4235-44db-90b7-79cb42f16905	N	E	200	210	30	40	SW
9bf78e18-45f6-42fc-bd3c-6666ebe6f30d	N	E	200	210	30	40	SW
f907d871-ae6e-459b-899a-6134a58984b3	N	E	200	210	30	40	SW
8f31fd48-1364-4fb4-b4f4-53f3da84faf0	N	E	200	210	30	40	SW
31a2e8e6-741e-436d-b8fe-13e6e702168c	N	E	200	210	30	40	SW
25445539-f919-4bea-b68b-1fbcbf309488	N	E	200	210	30	40	SW
7bedd6c7-957e-4c3a-8aab-16c688424d5d	N	E	200	210	30	40	SW
e7bf2f39-e568-4fd9-885f-4e95a101cfae	N	E	200	210	30	40	SW
369202a4-226d-4861-b125-6a00ab5a5417	N	E	200	210	30	40	SW
6e7801cd-9a14-461d-bb94-5effd335a92c	N	E	200	210	30	40	SW
c54162b9-74eb-4dad-bacc-45fd3eaf7443	N	E	200	210	30	40	SW
\.


--
-- Data for Name: pelvis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pelvis (pelvis_id, ventral_arc, subpubic_angle, sciatic_notch, "medial_IP_ramus", pubic_symphisis, pubic_bone, preaur_sulcus, dorsal_pitting, burial_id) FROM stdin;
f01cf259-18d6-46b0-8854-83c383c49ae2	1	1	1	1	NULL	1	1	0	12ed6677-6e69-43f6-ad82-f27cb745d7b1
9d744b27-88d4-4cf0-919c-8860b97d19b4	3	3	3	3	NULL	3	3	0	b9343cb8-c0fc-441d-b674-d7efd3ced858
c417607e-ca4f-4d5d-858a-15e98191e256	1	1	1	1	NULL	1	1	0	48600b03-0235-4eb5-b6bf-ad5799e411f7
6f8cf2cb-10a9-44e5-b2b5-23da08d72385	1	1	1	1	NULL	1	1	0	4949287e-e88c-494b-b9f3-db36e663b0b1
1cedc949-e22b-47c8-be4f-0f802d3aaa79	0	1	1	1	NULL	1	1	0	c00a4576-383a-4f92-bb12-15a29c49f507
46ebfe0b-e22e-4aba-9c24-e7264e4c4118	1	1	1	1	NULL	1	0	0	e7fcac0e-9b76-4259-ad25-a1ca80a693bc
710657e4-4975-4411-9879-4d22438c2db6	1	1	1	1	NULL	1	0	1	1a7e4796-9b8a-4635-9b09-8e555cd4cfb9
ef830645-bec3-41ee-9700-22a96f33cf5a	0	3	3	0	NULL	3	0	3	aa763876-68b0-4033-8202-f056a3049e51
597ac647-0776-423c-ae52-782b75d7a330	0	3	3	0	NULL	3	0	0	e5275e46-467a-4425-b3a2-bd74f4258653
61232c64-b649-4041-bc30-bbbe11c366c9	0	1	1	0	NULL	1	0	0	771934d1-6ee3-4bbf-b75a-c96528810f6d
d944ce35-1941-425f-91d9-94324681e23e	0	0	1	0	NULL	1	0	1	e3f5d2c2-a405-4660-8309-eb4e47e599b0
b90f0562-f8a8-422b-9a00-a827a2b38351	0	0	3	0	NULL	0	0	0	7f7f9902-4f17-475a-bbec-5c8aca782e3d
d3c887cd-1e44-4402-9266-5a2cfe8d9857	0	0	3	0	NULL	0	0	0	cfa91b40-5db4-42a1-bed5-094a4818592d
2cc6ca21-57d7-40b0-bf49-c01efa8e6767	0	3	3	0	NULL	3	0	0	06ee70b2-7f2c-4dab-ba73-a8a9bc1f6eeb
3b92b654-cde4-4015-8be7-18182ef041bb	1	1	1	0	NULL	1	0	0	b5f788b4-fc87-410e-a69d-2b13240a9597
1b9269b1-7e61-4ef5-982c-8becc4808187	1	1	1	0	NULL	1	0	1	aae56282-8f9a-460a-b3e0-98d366d84105
907a5eb2-84d5-4924-8604-ef4e98788306	0	1	1	0	NULL	0	0	3	1b4be0aa-4d04-48f3-8b9f-96c31f3468d2
18f45b65-73be-4036-8d01-44cc612ec0c0	0	0	1	0	NULL	1	0	3	a78d99a5-2f11-49ff-a3a6-b2a29618c809
e82d5217-fb28-42cf-a6ca-2a544a45fb80	3	3	3	0	NULL	3	0	3	9af52b1d-b882-4bad-aa24-4ea26c33dae2
0594d451-5a79-42bf-b2fa-5379c02e84f4	0	1	1	0	NULL	1	0	0	26ab3ac0-9e01-4b56-b5b9-ee565955f3c9
14372018-676b-4241-bef6-723ad4e2d865	1	1	1	0	NULL	1	0	1	711cc456-b320-418a-8b3b-456ed27995a9
d63a57c6-0388-4fdd-bc89-e0a10a1a6197	0	0	3	0	NULL	0	0	1	5a2d4f6a-0afa-46f0-9589-6f0766ed89d2
14caddb9-8eec-45c9-9c43-de2d4b40249d	0	3	1	0	NULL	1	0	1	21c3b37c-4718-4292-b715-3568da2c9cf0
ca3d6630-734d-4f95-84b1-c3a304f8b437	3	3	3	0	NULL	3	0	0	9aaafd10-2994-4d23-9d15-8090aa48b2a8
aef5af9b-d683-4dcd-9bb3-4bb01eececb2	0	1	1	1	NULL	0	1	0	496df30f-fe73-4a01-bde7-13a197ed3746
176ad77d-fe23-4864-94d6-575292e0b2e9	0	3	3	0	NULL	3	3	0	44f9d4a8-bca2-4ebd-8fb1-31326d62d6e9
10bd85a6-4de2-4e36-b7d9-a09df0340bfb	1	1	1	1	NULL	1	1	0	9f3da3bd-228a-4252-acff-da4d5bc28a20
82573bad-6bfe-4db3-9243-6e7c269998b5	1	1	1	1	NULL	0	1	0	0a048a5d-151a-48ab-a027-ebf29d671ead
432f3a0f-1753-4352-8b80-6fe3020e1b4f	0	0	3	0	NULL	0	0	0	ac9da490-145b-4d1a-831a-08aad63ce0b8
1cbf4330-7293-4062-8060-c182e7acd87e	0	0	1	1	NULL	0	0	0	792b5cb5-4e4d-4db7-a3d4-ff83e80b9422
eb86b087-2353-4c3a-a1cc-150f12b846fc	0	3	3	0	NULL	0	0	0	785306e6-f2a9-4609-bf05-62f75a56a8ff
43b7d548-61bc-44fe-b299-2f17bd44f697	0	0	1	0	NULL	0	0	0	3d41fc98-eb65-4a74-9ef0-82f6356be219
71806c1f-0711-43d8-b269-2d01ce1b8f66	0	0	1	0	NULL	0	0	0	fc6667dd-e81c-4c87-9b85-62204347d3d3
236d7ca5-c07e-433c-aa9f-7d5ca8f5015c	0	1	1	1	NULL	0	0	0	02219761-b1a0-4dc2-a50d-738fd566da31
50a9a1fb-6eaa-4221-8c8a-02583746d617	0	0	1	0	NULL	0	0	0	9e865cb9-6f11-4b96-8577-3415f167b569
d4931160-5828-4e0b-be63-8c4ae473f1a3	0	0	1	1	NULL	0	0	0	5943a683-e1e0-424e-aa1c-a1c67202a29b
476c55e5-be38-4d14-a6b8-995960ef8dd5	0	0	1	1	NULL	0	0	0	492e0ac1-3a64-41b4-9a32-821b796bdb49
55033f16-1625-4814-9e19-6165a2e39578	0	0	3	3	NULL	0	0	0	a3d45155-a4f3-4eee-b97a-99ec22ba78ca
f2b8736e-a56f-488e-b7a0-db09b3901d96	0	0	3	3	NULL	0	0	0	7aa84adf-7c0f-448a-9dfd-73758e91420c
575e3353-4248-4a4f-9e1e-e1623c217e2e	0	0	3	3	NULL	0	0	0	f088d641-4f69-481f-a10b-f4dae92c858f
976a30d7-80a2-42a5-8e88-07b13e038f56	0	0	1	1	NULL	0	0	0	f1fe3d52-bb24-4ec4-a5ff-ed3e09e80ca1
20bef935-3e72-4296-bca0-22c302d94b91	0	0	3	0	NULL	0	0	3	a2d54847-3ffb-403c-9e7e-2e7efa1ae913
cfc588ee-407b-409e-ba49-b8fb8f3b23b1	0	0	3	0	NULL	0	0	0	f5aeb75a-1c2a-433d-8909-e3af4e383fec
2290b1be-8720-4481-a79b-cb3ee8ae6b60	0	0	3	3	NULL	0	0	0	e826dc44-3a37-42e9-aea2-09c7569e7a25
46bf85fd-02dd-4c11-b796-700b80aa1597	0	0	3	3	NULL	0	0	0	5cca7466-adf0-4c01-8954-41fefe88c7c8
af026a38-b04c-405d-bb5e-a4e2d90c7512	0	0	3	3	NULL	0	0	0	cc8b2221-3a54-42c9-a18f-489c8b88d81a
78230f76-0329-4573-99e1-8440d8c3ec9a	0	0	1	0	NULL	0	0	0	90086175-e13c-4921-a0cc-4e126df936a0
82a3ac92-7e35-4b09-a742-cea5c775d1cb	0	0	1	1	NULL	0	0	0	0f6f386d-71e7-4ef7-b8a8-a375809ddee5
fd039661-36f6-4eed-a273-d99a5a1a6b12	0	0	1	0	NULL	0	0	0	a0d91e8b-0e9d-4a02-9d7c-0e0e76fe41fc
72f07107-1436-4c97-a267-1451c03744fc	0	0	1	1	NULL	0	0	0	cf5561d2-5b07-45fc-a1d7-a8674bbc3322
df90b510-cff2-4f71-b950-7446fa3469e6	0	0	1	1	NULL	0	0	0	83c920b5-2a0a-49e8-96a7-4f755eb840b8
ccb8eee4-bbfb-46be-af85-659916ceaa58	0	0	3	0	NULL	0	0	0	b62aae86-84a3-4a51-b1cc-c05a81a14baf
c1f14abc-785d-4ef5-b5d5-884e7d3937c6	0	0	1	0	NULL	0	0	0	faf47ea5-a8d4-44d4-b2f0-994a7728d4ad
04fb6893-f64c-4361-bd6b-4d47715c2292	0	0	3	0	NULL	0	0	0	76e8762b-66fd-4315-841d-37407999f182
2553b412-3e21-438a-b1f9-d3279eced0ef	0	1	1	1	NULL	0	0	0	bf9658ad-5d41-4329-9cbf-54526e623b99
3db60a01-6482-4843-b6ed-26e289ae22a9	1	1	1	0	NULL	1	0	0	c92d8414-931f-4d7b-8cdc-95c70ea14d96
edd2edd5-9a51-4b35-a3b7-7536402ca3a2	1	0	1	1	NULL	0	1	0	e666fe14-1d29-44d1-a1d8-4b2ad323b0d5
39746d5e-e1cc-4dc0-8756-ac6b370cb24f	0	1	1	0	NULL	0	0	0	93669230-11ff-47be-9aa7-a41072ee8572
0740a09c-f79a-42cf-ae4c-0d527e57058c	0	1	1	1	NULL	1	0	0	38cb1ef4-7f1a-4f6c-a0bc-5f20573d0b25
2abf2ef7-dfa2-45b3-942f-b2241dbe876d	1	0	1	1	NULL	1	0	0	77aac0c8-b43c-469d-b6a3-3856ef509b37
320dc3ce-5cd3-446a-bed6-fcc1ee3de260	0	3	3	0	NULL	0	0	0	1f48a247-1575-43e0-a4fe-c9ada6e59cb9
3eb4f044-c89b-4df0-962b-7de79c9b2148	0	0	1	1	NULL	1	0	0	55054886-0b9d-41e6-84bd-8ee676747715
56031b76-4e0c-49d1-bb3c-b3c7a3bc447c	0	3	3	3	NULL	0	0	3	5e57cbaa-38a3-49b5-bddc-f3f16402dfe7
93ea69bb-6ca2-4925-b6e8-0ed20905be54	0	3	3	0	NULL	0	0	0	5a8cd9ea-75e2-41c3-bace-2964bfb7a90e
230905e3-8f6e-4157-a4ee-8b630a88596b	0	3	3	3	NULL	3	0	0	8c3d255c-baa6-4405-a31d-fc6246b55ece
602178f2-b49c-4d5c-95c0-30a0c045a8ab	0	0	3	3	NULL	0	0	0	4dd58f49-eaaf-4c92-baff-03d320cdc452
5d60d028-0af3-4b26-a410-1baf61a17c14	0	0	1	0	NULL	0	0	0	66c9a3bc-8184-4fd9-ba37-d03b966a583c
9acbfc4d-d9b6-4e68-9e13-6bf4ee573ed5	0	0	3	0	NULL	0	0	0	8c70b37d-297e-4fe8-b2d5-73adefb9facb
510f5f3a-134d-453f-a9be-0d8117a03ca0	0	0	3	0	NULL	0	0	0	28d3331f-5a1d-4274-9c0f-35507a45125e
8db293aa-6e0a-42f1-aaea-08109c3a7584	1	1	1	0	NULL	1	0	0	429bf8cc-8686-4a6a-bcfa-1792d6885a49
daf6bd41-40c3-43dc-8900-df6a58c04184	0	0	1	0	NULL	0	0	0	662e9451-ea7c-4601-add5-7fe9b083f150
dca8c1ef-d9c2-46ec-95e7-afc13becc385	0	0	1	0	NULL	0	0	0	52374906-4df0-40ac-99f6-533f5f6143cc
a4e6d1f6-8d79-4472-bcf5-e1a276257438	0	1	1	0	NULL	0	0	0	fe72cbdd-f428-458f-bf43-3e291f5dc774
4829543d-98a5-465d-9ba6-14bd0841115a	0	1	1	0	NULL	0	0	0	3ae88bd5-64cf-4e94-a6bd-55ac758c5c48
7491eaa1-51eb-4db8-9016-bf59fc99a3e0	0	1	1	0	NULL	0	0	0	23895fa3-0ce9-46e9-aae8-6001d702c954
070b9c0e-e9f7-4087-a2b1-1b3b5873f21c	0	0	3	0	NULL	0	0	0	9d4ba1ee-1191-48e3-8dc2-7d4080850e43
62387b68-864e-496c-a413-26c2eaf0902b	0	0	3	0	NULL	0	0	0	617f1756-9b5e-4040-9b6a-2cca39512961
99f775b3-3a44-4144-88f0-e68d725dfc14	0	0	3	0	NULL	0	0	0	0766d877-a633-47c5-9c0c-c72bc8a57f0e
cf1bf078-7896-4188-8774-da6c0e277305	0	0	1	0	NULL	0	0	0	c5e8d6e4-ce35-483f-9fe7-8c2824eee368
92c52bc9-1379-442b-bd8b-0c6a4f8e8eb5	0	1	1	0	NULL	0	0	0	2c672331-9224-4863-970e-a4e874062706
12beead8-3497-4052-bff8-b431a332935d	0	3	3	0	NULL	0	0	0	f1974c33-fe69-48aa-9a94-4982bbdb047d
b1e2560c-9a13-4e85-9a04-e41b83e8fb25	0	3	3	0	NULL	0	0	0	8e295c36-94a9-4356-839d-1c07366a65f8
06f0a086-9116-4276-8454-6836104f3870	0	1	1	0	NULL	0	0	0	2bac0a43-0d42-4698-be9b-325f0a6ef3ef
2bcd9520-cb2c-48de-845d-4694e997edad	0	0	3	0	NULL	0	0	0	17e7d441-e2d6-49dc-a16d-8fe7f702c381
2114cecd-4850-4461-bad9-6a95f2b41963	0	0	0	0	NULL	3	0	0	fcf4942e-109e-4c28-9c8b-e2e7bc812bb3
9c7dc8fc-6d24-41f2-bbab-b41efb0433a2	0	1	1	0	NULL	0	0	0	27a0890e-3302-4ccf-9e92-f150229008e7
85c5ef23-fbd9-452e-9488-5b6f4415c049	0	1	1	0	NULL	0	0	0	fd99bc08-9e0e-4d4d-bd96-4e4fc5f7c40e
44ccb2f3-097a-4ec8-9780-0dec0f416508	0	3	3	0	NULL	0	0	0	0846c7fe-64bb-49d1-8afb-a9f0c7769435
c8606dda-0060-4e9b-87b8-45cd1d8546a6	0	0	1	0	NULL	0	0	0	afce8964-29ae-468a-9868-eb82aa43222c
\.


--
-- Data for Name: skull; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skull (skull_id, basilar_suture, robust, supraorbital_ridges, orbital_edge, parietal_bossing, gonion, zygomatic_crest, nuchal_crest, cranial_suture, maximum_cranial_length, maximum_cranial_breadth, basion_bregma_height, bizygomatic_diameter, nasion_prosthion, maximum_nasal_breadth, interorbital_breadth, tooth_attrition, tooth_eruption, burial_id, skull_sex, skull_age, basion_nasion, basion_prosthion_length, skull_year, skull_month, skull_date, skull_trauma, skull_at_magazine, cribra_orbitala, porotic_hyperostosis, button_osteoma, has_tmj, linear_hypoplasia_enamel, metopic_suture, porotic_hyperostosis_locations) FROM stdin;
d3dba6f1-1e62-40b8-88c7-22da544dea44		0	0	0	0	0	0	0		176.15	140.44	139.29	125.15	77.05	26.95	25.2			ea6f87d2-f393-462e-9181-418a6babc45c			100.24	96.56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
bc3489c1-2885-456f-bdb4-fd68fdcee6b9		0	0	0	0	0	0	0		169.86	134.61	121.82	119.1	64.33	23.51	23.77			c1b91203-02b5-485a-8318-babc12f74fa4			99.4	94.15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
20f669e1-b21e-4b5a-b069-bfd5b5dea4d0		0	0	0	0	0	0	0		170.9	131.34	120.4	118.33	63.43	23.55	21.93			b965244f-4252-4434-a4cb-5033f39439af			93.66	85.86	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
786ab9e0-7d14-42e7-895a-c5ea9f947f88		0	0	0	0	0	0	0		0	0	0	0	0	0	0	V		b9343cb8-c0fc-441d-b674-d7efd3ced858			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
1d4f7faa-295d-4aab-a3db-a4b689bbffac		0	0	0	0	0	0	0	Closed	0	0	0	0	0	0	0			4949287e-e88c-494b-b9f3-db36e663b0b1			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
5403f555-9dee-4ed3-aa90-72666729e19a	Closed	1	0	1	0	1	0	1		179.6	139.9	123.85	127.32	66.16	24.1	23.98	III		c00a4576-383a-4f92-bb12-15a29c49f507			96.84	94.71	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
3971759c-f8d1-4a73-8f3d-f81c6b7f7811	Closed	1	1	0	0	1	0	1		0	0	0	0	0	0	0			e7fcac0e-9b76-4259-ad25-a1ca80a693bc			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
ac061b7a-3139-478f-98d0-94ccf3611079	Closed	1	1	1	1	1	1	1	Closed	0	0	0	0	0	0	0	II	3rd molar	1a7e4796-9b8a-4635-9b09-8e555cd4cfb9			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
2b9734b5-803a-4e0e-96c7-9522b53b0830	Closed	3	0	1	0	1	3	1	Closed	0	0	0	0	0	0	0			518fea4c-0d82-47f4-9e78-1a087fb8acc7			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
37cc8bc8-0f12-453e-ae30-d6d55e5e6e96		0	0	0	0	0	0	0		0	0	0	0	0	0	0		1st molar	120051ee-559d-4a27-a85c-5373aa4b6a67			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
abd1a9f2-88a0-4749-82d9-ca99df7a884e	Closed	3	1	1	1	1	1	1		0	0	0	0	0	0	0			f7d0ec48-1804-4000-bfa4-cdb8f760fa37			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
4c37122f-0dc7-4d55-a72c-aabee2b27c44		3	3	3	3	3	3	3		180.43	143.75	135.15	127.17	66.92	24.3	24.41			e5275e46-467a-4425-b3a2-bd74f4258653			97.6	91.43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
9b6595be-d28c-4abe-8764-4c1a9d2bf347	Closed	1	1	1	1	1	1	1	Closed	188.57	138.21	134.35	124.86	75.1	24.37	26.01		3rd molar	771934d1-6ee3-4bbf-b75a-c96528810f6d			109.49	95.42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
55c81b11-8344-4ee9-91b9-3ba0a5c2423d		0	0	0	0	0	0	0		0	0	0	0	0	0	0		2 lower front	84dc1579-2d7d-423a-85eb-37dafd5ba15f			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
4eac084a-3b04-4718-aa3d-fed5c208a815	Closed	0	1	0	1	1	1	1		189.03	135.47	136.16	133.22	69.11	23.18	26.21		All molars	e3f5d2c2-a405-4660-8309-eb4e47e599b0			104.23	94.07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
f05d0cb8-6b3f-45b2-89d1-8bce348a7410		3	3	3	3	3	3	0		0	0	0	0	0	0	0			7f7f9902-4f17-475a-bbec-5c8aca782e3d			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
9dc86d1b-b006-4fac-aa60-dde4612d3a06		0	0	0	0	0	0	0		0	0	0	0	0	0	0		1st molar	0278667f-d8c7-4b22-abe4-befdc77c9899			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
b60f5baa-6799-4683-9d7b-c13260dc3956	Open	0	0	0	0	0	0	0		0	0	0	0	0	0	0		None	eaa3d69f-2e27-4d73-bead-4e1f5cac5477			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
e7deddad-5be1-4d3e-a394-9cd93fe32603	Open	0	0	0	0	0	0	0		0	0	0	0	0	0	0		2nd molar	5c20f505-6de5-40a2-b662-80bf7eaa6cc0			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
d7f0b6ed-a1fe-4670-a75d-4da01769f942		3	1	3	0	3	0	1	Closed	0	0	0	0	0	0	0	V		cfa91b40-5db4-42a1-bed5-094a4818592d			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
383774b8-3c1a-42f5-b897-531e117eb08f	Closed	3	3	3	3	3	3	3		174.92	136.82	127.43	121.52	73.03	26.18	22.52		2nd molar	06ee70b2-7f2c-4dab-ba73-a8a9bc1f6eeb			92.41	88.61	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
f013500f-dd17-4570-ba2b-c0ec9bee06ce		3	3	3	3	3	3	3		0	0	0	0	0	0	0		2nd molar	9570ce39-eed0-4095-bc1d-a4100323fef4			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
5d153846-458a-4022-8870-3ed2b03886f6	Closed	3	1	1	1	1	1	1		174.77	137.25	135.95	127.66	70.32	23.23	20.14	IV	3rd molar	b5f788b4-fc87-410e-a69d-2b13240a9597			100.66	90.06	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
d6ad4263-37c4-4bd3-a69d-8a585465a871	Closed	3	1	1	1	3	3	3		188.68	145.5	137.52	128.97	72.98	22.02	24.2	III	3rd molar	aae56282-8f9a-460a-b3e0-98d366d84105			112.38	98.16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
963e0499-ea17-4799-95d3-42fd709e66c0		0	0	0	0	0	0	0	Open	0	0	0	0	0	0	0		1st molar	8ee3a369-08c4-46f6-8698-1017dc642ce7			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
84035a23-d849-4e56-bd11-428a5098f51b		0	0	1	0	1	0	0		186.98	137.89	131.82	127.82	93.97	23.13	21.36	II	3rd molar	1b4be0aa-4d04-48f3-8b9f-96c31f3468d2			99.46	94.16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
f1b7f6e7-8527-4ecc-a2a7-cd146827324e	Open	0	0	0	0	0	0	0		0	0	0	0	0	0	0			8d08c438-e5a5-437b-b4bf-4764b931bcdc			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
28782f7f-e2e9-4f7c-b59b-52b7fc327620		0	0	0	0	0	0	0		0	0	0	0	0	0	0		2nd molars	3cef85b1-c9da-42c4-b58d-89ac5ee4a42a			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
76e8002a-e3cb-4823-8871-c2461801aff2		0	0	0	0	0	0	0		0	0	0	0	0	0	0	II	3rd molar	a78d99a5-2f11-49ff-a3a6-b2a29618c809			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
4f35f422-7f69-48e6-ba44-b012a3f83ee9		3	3	3	3	3	3	3		0	0	0	0	0	0	0	II	2nd molar	76218ec7-5a48-4ec0-b07e-7a6c44063b54			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
f62158da-8bb8-418e-911a-68295fe50674		3	3	3	3	0	3	3		165.23	142.44	121.77	119.74	73.55	23.39	20.85		3rd molar	9af52b1d-b882-4bad-aa24-4ea26c33dae2			92.51	92.27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
2576776e-e56a-4823-94bb-52907dbdf5ea	Closed	3	1	1	1	1	1	1		0	0	0	0	0	0	0	III	3rd molar	26ab3ac0-9e01-4b56-b5b9-ee565955f3c9			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
2d56dc33-c2b4-470b-ae59-760b4ff888e9	Closed	1	1	1	0	1	1	1		186.52	146.8	133.94	131.73	65.1	27.7	22.13	V		711cc456-b320-418a-8b3b-456ed27995a9			109.15	96.41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
7eda748d-3d83-43b6-bda2-45a446c899ef		0	0	0	0	0	0	0		0	0	0	0	0	0	0		2nd molar	2e9c1f20-15b1-4449-a09a-9e391a2477ce			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
784b8714-d4b9-49e4-87bf-2d05fbcf9a9e	Closed	3	1	1	1	1	1	1		0	0	0	0	0	0	0	II	3rd molar	5a2d4f6a-0afa-46f0-9589-6f0766ed89d2			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
551238a8-6cc3-402d-b2ac-5631dd292581	Closed	1	1	0	1	1	3	1		177.88	145.38	136.95	128.9	68.63	23.74	22.19		3rd molar	21c3b37c-4718-4292-b715-3568da2c9cf0			102.01	98.4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
7cd9fe70-52e2-431a-ad7f-86791d4e1dd4	Closed	3	0	1	1	1	1	3		0	0	0	0	0	0	0	II	3rd molar	9aaafd10-2994-4d23-9d15-8090aa48b2a8			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
1b47695d-693f-4160-ae6c-6ce94bd9b930		3	3	3	0	3	3	0		0	0	0	0	0	0	0	III		44f9d4a8-bca2-4ebd-8fb1-31326d62d6e9			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
59e33c19-4a04-4eb4-9eb5-a3d01ee4ef17	Open	0	0	0	0	0	0	0		0	0	0	0	0	0	0		None	8da14029-2900-4e56-9cb1-9f55015aa8a9			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
4ddac89c-fe4a-4b87-b0b7-e851da8e7f14		1	1	1	1	1	0	1		170.96	133.35	130.51	125.65	64.54	24.15	25.92			0a048a5d-151a-48ab-a027-ebf29d671ead			88.9	86.2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
52d1b8f9-4566-42b1-b21c-edef8541bb2f		0	0	0	0	0	0	0		0	0	0	0	0	0	0		2 front teeth	67edf67b-d127-4d0c-92c8-a7fc72e8296b			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
7784d1eb-fd27-45e1-9936-bb75ee55a3e4		3	3	0	0	3	0	0	Open	0	0	0	0	0	0	0		2nd molar	ac9da490-145b-4d1a-831a-08aad63ce0b8			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
b6cd5025-7e83-43bd-b135-3aa0093a6ddb		0	1	1	1	1	1	1		0	0	0	0	0	0	0	III	3rd molar	792b5cb5-4e4d-4db7-a3d4-ff83e80b9422			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
9a84f37a-db88-4a9f-a0be-ec316a109cca		0	1	1	1	0	0	0		0	0	0	0	0	0	0	IV	3rd molar	785306e6-f2a9-4609-bf05-62f75a56a8ff			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
805b1a6a-358d-43ee-a596-f8b8c3f1e9c0		1	1	1	1	1	1	0		0	0	0	0	0	0	0	II	3rd molar	3d41fc98-eb65-4a74-9ef0-82f6356be219			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
de86552c-f385-4c5e-94ee-ad04ee55f5de		0	0	0	0	0	0	0	Open	0	0	0	0	0	0	0			fb90d696-9be2-4d19-aaf0-3fdaf02dcc6f			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
3973ed52-830f-4f93-8a78-a5e619c22dff		0	3	3	3	0	3	0		0	0	0	0	0	0	0		2nd molars	586707ed-54ae-4534-9fd9-88b9a8402e7d			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
9168a1d0-689c-48c1-93ad-0d63265d77a7		1	0	1	1	1	1	0		0	0	0	0	0	0	0	II	2nd molars	fc6667dd-e81c-4c87-9b85-62204347d3d3			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
f57570ae-41fa-4e23-bb81-1f3b5e3f4f5b		0	0	0	0	0	0	0		0	0	0	0	0	0	0	III	3rd molar	02219761-b1a0-4dc2-a50d-738fd566da31			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
8f62979e-ba14-4385-a564-871935a4091a		0	0	0	0	0	0	0		0	0	0	0	0	0	0	I	2nd molar	f1289f19-7763-4b66-a677-621cf1c20a92			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
47c03b11-6122-4b4d-b327-2422cf815a8b		0	0	1	3	0	0	0	Closed	0	0	0	0	0	0	0	I	2nd molar	9e865cb9-6f11-4b96-8577-3415f167b569			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
2981ac6e-b457-4910-8a1d-5c19ed71628b		1	1	1	1	1	1	0		0	0	0	0	0	0	0	III	3rd molar	5943a683-e1e0-424e-aa1c-a1c67202a29b			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
a1427ba4-204b-4180-81fb-65059eea467d		0	1	1	1	0	1	0		0	0	0	0	0	0	0	III	3rd molar	492e0ac1-3a64-41b4-9a32-821b796bdb49			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
064b46c7-e909-400c-9891-9330bf9309db		0	0	0	0	0	0	0		0	0	0	0	0	0	0		2nd molar	12aabc52-93f3-4c26-8e01-341ed668a574			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
e3969266-1521-4182-94bc-fe1ef9087002		0	0	0	0	0	0	0		0	0	0	0	0	0	0		1st molar	6a30493d-d535-4345-a135-83dab7205fb6			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
8bf705c9-2439-42b6-a072-067ff4afa082		0	0	0	0	0	0	0		0	0	0	0	0	0	0		none	a3d9f1cc-6c9d-44b0-966d-e4d99a264c92			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
098eecd9-cc3f-46c7-a5be-5cf334663be6		0	3	3	3	3	0	0		0	0	0	0	0	0	0	II	3rd molar	a3d45155-a4f3-4eee-b97a-99ec22ba78ca			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
2b715a38-5229-46f0-ad47-29bbce63c6c4		0	3	3	3	0	3	0		0	0	0	0	0	0	0	I	2nd molar	2e34a6d5-0b54-4839-b4fc-56cb28381e64			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
d70e1b3a-fc7f-4e22-a496-d4da278a2758		0	0	0	0	0	0	0		0	0	0	0	0	0	0	II	3rd molar	7d26f8e9-35e5-4223-89ef-31a566af274d			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
3e43ff7d-c55e-4667-9b12-39c98d0f2507		0	0	0	0	0	0	0		0	0	0	0	0	0	0	I	12.5	a173ba46-b109-406e-82c9-7bcb689913fa			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
a26fe257-0e13-4aea-b348-26ea1716685e	Open	0	0	0	0	0	0	0		0	0	0	0	0	0	0	I	2nd molar	f900a32f-a044-43a1-ac74-b903915a1740			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
62df3b10-c3d6-4ff9-86ac-6e0c7d1c623d		0	3	3	3	0	0	0		0	0	0	0	0	0	0	IV		7aa84adf-7c0f-448a-9dfd-73758e91420c			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
5c42a890-2f11-4342-b047-426cdb7946fc		0	0	0	0	0	3	0		0	0	0	0	0	0	0	III	3rd molar	f088d641-4f69-481f-a10b-f4dae92c858f			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
6742d021-17cb-4370-b4e0-97f4e2a9fea6		0	0	1	1	1	3	0		0	0	0	0	0	0	0	III	3rd molar	f1fe3d52-bb24-4ec4-a5ff-ed3e09e80ca1			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
be5ebe90-7d1b-4a11-92c0-1b1a7224bc5a		0	3	3	3	3	3	0		0	0	0	0	0	0	0	II	3rd molar	a2d54847-3ffb-403c-9e7e-2e7efa1ae913			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
1a02267d-cc3f-49b8-92a7-213579c31284		3	3	3	3	0	3	3	Closed	0	0	0	0	0	0	0	II	3rd molar	f5aeb75a-1c2a-433d-8909-e3af4e383fec			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
4ab06945-5a11-46ab-b09a-b239b056770d		0	3	0	3	3	0	3		0	0	0	0	0	0	0	III	3rd molar	e826dc44-3a37-42e9-aea2-09c7569e7a25			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
20db8eb3-8fd3-43c0-b93f-58e8afe8e6c6	Open	0	0	0	0	0	0	0		0	0	0	0	0	0	0		1st molar	e521e95f-8e8e-463b-b78e-637f845dff70			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
3d88809a-9de8-47bf-9fcb-dd6e4665da52	Closed	0	3	0	3	0	3	0	Mostly Closed	0	0	0	0	0	0	0	I	2nd molars	fe54dcda-eea9-416b-9628-2a6de3c1ad02			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
e9233d5f-4dd2-4796-bec5-4183786ed26a		0	3	3	3	3	3	3		0	0	0	0	0	0	0	II	3rd molar	5cca7466-adf0-4c01-8954-41fefe88c7c8			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
1c301601-f75a-450d-9a5f-0d39bf9d6f42		0	1	1	0	3	0	3		0	0	0	0	0	0	0	III	3rd molar	cc8b2221-3a54-42c9-a18f-489c8b88d81a			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
486e9d84-8620-4f78-ab19-0437431af062		0	1	1	0	1	1	1		0	0	0	0	0	0	0	III	3rd molar	90086175-e13c-4921-a0cc-4e126df936a0			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
6b87cbe7-d816-47e4-9d42-a6019dddfff5		0	1	1	0	1	1	1		0	0	0	0	0	0	0	II	3rd molar	0f6f386d-71e7-4ef7-b8a8-a375809ddee5			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
395d9c45-a617-41c4-9990-08fdc28bb174		0	1	1	1	0	1	0		0	0	0	0	0	0	0	I	3rd molar	a0d91e8b-0e9d-4a02-9d7c-0e0e76fe41fc			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
cce0d746-1980-409c-b0e1-6a76ea8d82fa		0	1	1	1	0	1	1		0	0	0	0	0	0	0	III	3rd molar	cf5561d2-5b07-45fc-a1d7-a8674bbc3322			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
af77c305-68b0-42ac-8cd6-179b80fa641c		0	3	3	3	3	3	0		0	0	0	0	0	0	0		2nd molar	298d56cc-136c-465a-9ace-d3db901c326e			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
87088867-47de-45bd-ad21-7f5c714ae57d		0	3	3	3	0	3	0		0	0	0	0	0	0	0		1st molar	bbaf9b16-b2fa-4cff-a791-73ae2d45974c			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
0ade5c6b-8ce4-49ea-a48c-ae4c220dc137		0	0	0	0	0	0	0		0	0	0	0	0	0	0	III	2nd molar	8183570a-49d1-4360-8bea-3c0308be056d			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
da34df80-71e3-451e-9034-1f73fdfab45a		0	0	3	1	0	0	0		0	0	0	0	0	0	0	I	2nd molar	82c9fdc0-5d5a-4732-a227-8f8810c3bf20			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
8d65fad6-0f5a-4b7b-9d4d-f6aa5d5bb96e		0	0	0	0	3	0	0		0	0	0	0	0	0	0	II	3rd molar	2b909c93-f11a-4811-ba46-7c0db49fee9a			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
8d5c95ea-00a7-4e3e-a59c-cc8891f02d9a		0	3	3	3	3	3	0		0	0	0	0	0	0	0	III	3rd molar	b62aae86-84a3-4a51-b1cc-c05a81a14baf			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
0e9db0de-4070-434f-9625-7f9d9e901312		0	0	0	0	1	1	0		0	0	0	0	0	0	0	I	3rd molar	faf47ea5-a8d4-44d4-b2f0-994a7728d4ad			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
f81760f4-77a3-4694-bcea-bc391e2cac82		0	3	3	3	0	0	0		0	0	0	0	0	0	0	II	3rd molar	76e8762b-66fd-4315-841d-37407999f182			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
8ee6de19-692a-4cd6-b89b-07e39c068072		0	0	0	0	0	0	0	Open	0	0	0	0	0	0	0		first molar	4717458d-e2c0-4360-9b19-91eb45eaa087			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
56b387ca-0223-4614-925b-121376e0a1cc		0	1	1	0	1	0	1		0	0	0	0	0	0	0	V		c92d8414-931f-4d7b-8cdc-95c70ea14d96			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
f0cc5d9e-1bdd-4e28-8283-8e7a11f275e8		0	3	3	3	0	3	0		0	0	0	0	0	0	0	I	1st,2nd molar	67bfc73f-695b-4666-85ba-bca693d1126d			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
e78cd338-4896-415b-855c-a0bc3722f834		0	1	1	1	1	0	0		0	0	0	0	0	0	0	II	3rd molar	e666fe14-1d29-44d1-a1d8-4b2ad323b0d5			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
73fbb3a7-231b-488c-b113-8dd387de3f82		0	0	0	0	0	0	0		0	0	0	0	0	0	0		front incisors	3c80d9f8-5cfd-48f2-9487-0bc00e4f8ce4			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
de70361a-036e-4393-b5b1-2722239d3f01		0	0	0	0	0	0	0		0	0	0	0	0	0	0	II	3rd molar	93669230-11ff-47be-9aa7-a41072ee8572			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
3b27e924-e2ae-4376-a849-83811a95b423		0	0	0	0	0	0	0		0	0	0	0	0	0	0	V		38cb1ef4-7f1a-4f6c-a0bc-5f20573d0b25			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
28e23b60-1968-4362-8bea-8672913d956f		0	0	0	0	0	0	0		0	0	0	0	0	0	0	III	3rd molar	9ba5c903-d171-4477-aa44-872043d3d285			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
a7d06f6a-1eff-4d5e-8102-9df46912b3eb		0	0	0	0	0	0	0		0	0	0	0	0	0	0		1st molar, canines, incisors in mandiblula	b8163bea-8bb0-437d-95fe-7dd1492cf927			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
389c00c8-d20e-41ba-8f38-6d446d50d39e		0	0	0	0	0	0	0		0	0	0	0	0	0	0		Mandible incisors	c721c0d6-17ea-42c7-bd12-f5c2a1480a67			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
22ac4d6f-9927-4491-95fb-e7c7d7e628ef		0	0	0	0	0	0	0		0	0	0	0	0	0	0	II	1st,2nd molar	df373b56-3703-40f6-9248-e86988d985bb			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
c1c27452-9bdc-4ad6-b1db-603c11413723	Closed	0	0	1	1	1	1	0		0	0	0	0	0	0	0	III		77aac0c8-b43c-469d-b6a3-3856ef509b37			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
df1af629-dfc0-48f9-b32f-d5a9519f0e5a		0	0	0	0	0	0	0		0	0	0	0	0	0	0		mandibular incisors	5fb5042d-eaad-4b27-bf64-f9540e8c36c6			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
ba49263f-d65d-46ed-84ae-c2840f44b4d9	Closed	1	1	1	1	0	1	1		0	0	0	0	0	0	0			1fd6813e-c5ab-4b5b-b307-20611692820e			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
f8b1f595-904a-4370-951c-06e0248fbb0b	Open	0	0	0	3	3	3	0		0	0	0	0	0	0	0		1st,2nd molar	c8e824d0-59ed-4bc0-957f-138308011fad			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
4a268f8f-3e89-4476-a541-ca00a171d391		1	1	1	1	1	0	0		0	0	0	0	0	0	0	III	3rd molar	9b8e7164-5193-4914-9de9-21cdc436a712			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
097a9848-c11b-4b4d-ae20-655d1132c8dd		3	3	3	3	0	0	0		0	0	0	0	0	0	0	IV	2nd moral	1f48a247-1575-43e0-a4fe-c9ada6e59cb9			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
c0854fc8-01aa-46a0-8c71-35009c71ef0d		1	1	1	0	1	0	0		0	0	0	0	0	0	0	IV	3rd molar	55054886-0b9d-41e6-84bd-8ee676747715			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
1af26b61-9804-4f60-92b7-24d95c05b008		0	3	0	0	3	3	0		0	0	0	0	0	0	0	III	2nd molar	5a8cd9ea-75e2-41c3-bace-2964bfb7a90e			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
291db70d-5007-4676-8c64-a48fdbdaf7db		0	0	3	0	1	3	3		0	0	0	0	0	0	0		3rd molars	4dd58f49-eaaf-4c92-baff-03d320cdc452			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
54413f7c-e51b-490b-b20e-56d5f2c30c06		1	0	1	1	0	3	0		0	0	0	0	0	0	0			66c9a3bc-8184-4fd9-ba37-d03b966a583c			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
3f304e90-09ee-470d-aee5-0a49cb330b2c		0	0	0	0	0	0	0		0	0	0	0	0	0	0	I	2nd molar	2834d56c-2d0c-4f3a-b061-38cbd957ef08			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
e6da1f34-29aa-40bf-a9d4-7f9737068ab9		3	3	3	3	3	0	0		0	0	0	0	0	0	0		3rd molar	8c70b37d-297e-4fe8-b2d5-73adefb9facb			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
b00e3bb0-6254-40b3-b7c5-7330b8e7847c		0	0	0	0	0	0	0		0	0	0	0	0	0	0		Pre-molars	cb80973d-3674-4ad2-bd58-149731b24b7f			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
1833ac62-23ff-478a-9d1c-046234f0ec39		0	0	0	0	0	0	0		0	0	0	0	0	0	0	II	2nd molars	1b2a0ae6-e8b1-4799-8e1f-9602c9475e62			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
77406f36-b3b9-41e9-9fc6-c5e74d060401		3	3	3	3	0	3	0		0	0	0	0	0	0	0	II	2nd molar	28d3331f-5a1d-4274-9c0f-35507a45125e			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
f729ff39-b9f7-43b4-a4f3-604c7fe213da		0	3	3	3	3	3	0		0	0	0	0	0	0	0	I		0e852390-379e-4215-b5ef-72db722970f0			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
9d00b3b4-24c0-4d83-9275-c9f09a48f202		0	0	0	0	0	0	0		0	0	0	0	0	0	0	IV		429bf8cc-8686-4a6a-bcfa-1792d6885a49			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
3ab4416f-e511-4409-87e6-8039fee941f9		0	0	0	0	0	0	0		0	0	0	0	0	0	0	III	3rd molar	662e9451-ea7c-4601-add5-7fe9b083f150			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
e6f1fa43-f72f-41c5-b40c-315c06e731e7		0	3	3	3	3	0	0		0	0	0	0	0	0	0	I	1st,2nd Molar	62636b54-3de3-4491-8e36-0dc3e2547211			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
ed5f3541-75e2-488a-8d77-683600389cfd		0	3	3	3	3	0	0		0	0	0	0	0	0	0	I	1st,2nd molar	3de01baa-3a81-47e8-ac8b-7510ffbab574			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
9fd9948a-5fea-4937-a634-da9b11293bb4		1	1	1	1	1	1	0		0	0	0	0	0	0	0	II	3rd molar	52374906-4df0-40ac-99f6-533f5f6143cc			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
8482956b-78d0-46b4-a1a2-5e94852d3e26		0	0	0	0	0	0	0		0	0	0	0	0	0	0		1st molar (maxilla & mandible)	c5d4202a-d6eb-4d26-a640-7039eac5bb17			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
43330083-c56a-448b-8552-be183fff03e2		0	0	0	0	0	0	0		0	0	0	0	0	0	0		incisors	b723e0ca-bcad-4db4-b269-5640efca22da			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
a534fe6c-19d1-4aa7-9f17-697f1374e42b		1	1	1	0	1	1	0		0	0	0	0	0	0	0		3rd molar	23895fa3-0ce9-46e9-aae8-6001d702c954			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
3552d383-00c6-44e1-8a67-1b719a6e1b02		3	0	3	3	0	3	3		0	0	0	0	0	0	0	II	2nd molar	9d4ba1ee-1191-48e3-8dc2-7d4080850e43			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
bb03ebd3-990c-406c-9272-7d3bf03656a6		0	0	0	0	0	0	0		0	0	0	0	0	0	0		1st,2nd molar	bf35a421-38b2-4822-86c9-207fc8d0ab00			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
775f8f37-aac7-424d-a993-6d9b42dbdcc2		3	3	3	3	3	3	3		0	0	0	0	0	0	0		1st,2nd molars	d82e5d5e-68b1-4083-9126-9470128d28a6			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
004b59ee-3a91-4cec-acdc-7f7053b36ed1		3	3	3	3	0	3	0		0	0	0	0	0	0	0	II	2nd molars	617f1756-9b5e-4040-9b6a-2cca39512961			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
92589f36-9250-460e-a8fd-131cdde661c4		0	0	3	0	0	0	0		0	0	0	0	0	0	0	II	2nd molars	486f9a33-7bd7-4047-be16-5faba244a06d			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
64b71295-23c9-4c7a-b8dd-471775419b86		0	3	3	3	3	3	3		0	0	0	0	0	0	0		2nd molars	0766d877-a633-47c5-9c0c-c72bc8a57f0e			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
50a992fc-c517-4a82-8cd4-80a5834aea95		0	0	0	0	0	0	0		0	0	0	0	0	0	0		3rd molar	f36e661d-427e-46b8-91c0-c51656f30ce7			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
e13e5539-167c-4c34-8887-a4058fc6a629		1	1	1	0	0	1	1		0	0	0	0	0	0	0	V	3rd molar	c5e8d6e4-ce35-483f-9fe7-8c2824eee368			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
7a2da8b2-4f7f-464b-bd72-2addc35b937b		1	1	1	0	1	1	1		0	0	0	0	0	0	0	III	3rd molars	2c672331-9224-4863-970e-a4e874062706			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
ccbbe5f8-762e-43a1-8fef-e64fc6d58de9		0	1	1	0	0	3	1		0	0	0	0	0	0	0	IV		f1974c33-fe69-48aa-9a94-4982bbdb047d			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
d03153a8-7b6e-4df2-9c76-1334a469211a		0	0	0	0	0	0	0		0	0	0	0	0	0	0	II	2nd molar	176c0e9b-e648-4621-a066-af764e2b9bbd			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
7ec3073c-3c7c-470a-9932-0cd2721fbf9e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			cbaef130-8f60-48ec-a131-e15c443b73f8			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
8d86e8d7-fe24-45d5-b911-c5e8ef9368a0		0	0	1	1	1	1	1		0	0	0	0	0	0	0	IV	3rd molars	f99998c0-d980-42e7-af36-2b9006330ffd			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
c771661d-5def-4c78-ae0b-4e7e5bf75e03		1	1	1	1	1	1	1		0	0	0	0	0	0	0	IV	3rd molar	8e295c36-94a9-4356-839d-1c07366a65f8			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
01b8df28-635c-421a-b235-aaf40f61d517		1	1	3	1	1	3	1		0	0	0	0	0	0	0	III	3rd molar	2bac0a43-0d42-4698-be9b-325f0a6ef3ef			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
ccdce897-6fbf-4ce7-9dd8-53591affbc43		3	3	3	3	3	3	3		0	0	0	0	0	0	0		2nd molar	17e7d441-e2d6-49dc-a16d-8fe7f702c381			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
6ccedd0a-2a00-4795-8d8f-7338e11fce47		3	3	3	0	3	3	3		0	0	0	0	0	0	0	II	2nd molar	fcf4942e-109e-4c28-9c8b-e2e7bc812bb3			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
576aa561-88f4-44fe-ad3d-98bdc8d5bec1		1	1	1	1	1	1	0		0	0	0	0	0	0	0	III		27a0890e-3302-4ccf-9e92-f150229008e7			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
3f361239-cbed-4313-958a-e2570267647b		0	1	1	1	1	1	1		0	0	0	0	0	0	0	V	3rd molars	fd99bc08-9e0e-4d4d-bd96-4e4fc5f7c40e			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
17031d89-3def-4350-a8a8-9b5b4fb02315		3	3	3	0	0	1	0		0	0	0	0	0	0	0	IV	2nd molar	0846c7fe-64bb-49d1-8afb-a9f0c7769435			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
048bd401-aaef-4bb0-827e-6ec78a7a03ef		0	0	0	0	0	0	0		0	0	0	0	0	0	0		all pre-molars	879b6442-12e8-48b4-84be-4d03d6242be7			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
cb10c987-97b5-40bf-9fc9-e6ef4ad8283e		0	0	0	0	0	0	0		0	0	0	0	0	0	0	I	1st molars	b57156c1-3720-4285-80b5-9688fe589711			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
61d2dde5-e7e0-4f10-a072-8d1ecf4401b7		1	0	1	0	1	1	0		0	0	0	0	0	0	0	II	2nd molars	afce8964-29ae-468a-9868-eb82aa43222c			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
518edd4c-a504-4864-b1f2-d984210afaeb		3	3	3	3	3	0	0		0	0	0	0	0	0	0		2nd molar	90f0c92c-1684-4785-99ab-77c9f5ca6ab4			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
3b45905a-c6f6-4659-94c9-4b77e4fe423a		0	0	0	0	0	0	0		0	0	0	0	0	0	0		None	5833b00b-0fb2-4566-8305-0636681c65aa			0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
37bb3cd1-3971-41bb-bd13-0b63480cd9f7		0	0	0	0	0	0	0		179.06	134.64	129.37	118.11	66.36	23.84	22.51			8bfaf7a8-ae3f-42ab-b7a8-333f27abed08			95	89.3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		
db506540-b776-45d4-bdc2-7303975a2248		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2950f00c-3799-4b7e-bbaa-ba26beff1778			\N	\N	2002	\N	\N	f	t	f	f	f	f	f		
657966cd-b969-4d73-918e-3833d2da7ffe		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			c97b9ba4-b497-4893-8b9c-dad4d92509b8			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
242211e7-5da6-4f8d-8dcf-582e350e4e45		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			0dca0ead-7229-4237-937e-8bb5cbccf342			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
e0cf86af-fbde-43ea-8ec9-c07c49d77f96		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			0d73fa50-7f5a-4eaa-8011-c0e65f294c9f			\N	\N	2002	\N	\N	f	t	f	f	f	f	f		
6732e10f-3f99-4be7-8066-a0529537f5c7		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			680979db-b147-45b0-9a02-bf9ed70da5fa			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
ecc8aab5-33e3-4cb8-ac35-6891ce13f1d1		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			be5ee5a8-ca80-425c-a4aa-624adb4fcd93			\N	\N	1989	\N	\N	f	t	f	f	f	f	f		
60d229b2-0701-4424-9e14-32de55beae12		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			fd72cd89-0c33-4f83-8ad1-0b9c030afe62			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
56e95b83-5103-44b9-8792-f5c7270d1cbb		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2561ac84-6949-4850-99bb-f928e176dac8			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
cc8ed453-a24b-4aaa-b7d9-6d8f65885f06		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			70c28b28-4b41-47b3-9cf7-b7099f648135			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
102a2c63-cfc2-45da-bf73-3536722d0cbd		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ce9ed2ca-1fa5-4b6c-8436-9649dba22443			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
7670aaa6-079d-4005-ba18-c7ec3e7f813e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			cf72a138-d3cd-45d6-bf04-7d9bb572860a			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
ca3b8158-416e-405a-a272-43c8c0f35832		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			102231b8-7786-4fa3-b25c-4d662ff627ba			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
3c566530-b719-4cbc-a3ce-b776aaff94e1		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			841a14dc-e98d-49ee-99ae-edb03b0730e0			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
e5b84423-80bb-489b-9176-8108cbb00e38		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ddbf63cf-a91e-42c5-8be2-294334b49beb			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
76911b95-bdbe-4c71-8563-9bd305474da5		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			78c1d19c-8aa0-4b81-81bb-ca98e3b2b211			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
3f62f255-9b03-48ad-ae52-599ad1de8e9a		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			11a8f18d-1432-4baf-812d-666b862a5f18			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
a2a115e3-50d4-486f-aa3d-210b8418cdff		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			bd709378-cc48-49ec-8f67-90b4d456f87f			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
953ed118-1228-4f01-a579-e6d33b0b5c1c		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			19557d4c-38f5-444d-9f2d-b7b06374d745			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
12d082fa-ce9f-4c56-8352-b8fe4b660ed9		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2c328172-ba49-41b8-8a25-83273767eb28			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
6a973722-51b4-4fed-882a-4abf26270f6d		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			fc9a1128-aa74-47bd-a69e-6bdae1c84387			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
e3cf7d05-14b9-4a48-a7a7-347a2fee34e5		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			230669b9-70ad-4055-ae3a-c52f03f23349			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
d67668fc-8345-4826-b63e-c2e273150980		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f08bedcf-3591-4f09-994c-b9430e85eff9			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
1c7b81f6-c542-49f2-af80-760b84363183		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ba2f59e4-3a90-4dec-8ddb-c39221b7926b			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
93e0206e-63fa-49a7-8578-a26177b725aa		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			077a471a-ae75-432e-896f-5153a8b41c69			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
4df4211e-d0c4-4c93-877c-3a050779399f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2aa87b59-cc3d-4495-aab3-c60e63a9d7fe		subadult	\N	\N	\N	\N	\N	f	t	t	f	f	f	f		
147702dc-38e8-4247-a9d6-ebdc524e827f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			9711fb3f-2fad-48fa-84ce-12b7a8ec1541			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
f4ec579c-8779-45e6-996e-114d7fff6ed4		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			c7686292-3ee0-4e03-a969-e3f81c8cc0d8			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
64554de9-f5a5-4a31-a716-4e7925a4b6e4		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			a7b796ea-c79c-48a7-a84d-b8786fcab831			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
e1121a85-458c-461a-aa8d-78e38e5a92c6		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			d0a756d6-f2ca-4477-aa09-9ad87f42d8b2			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
4791e7cb-e540-4ac4-9c93-ee88da303b71		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			14ff3d2c-23d5-4746-84b2-711fb6c1c172			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
c66aac45-6bd4-4948-b093-c7c3404d728f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			180c3c09-ce88-4056-9831-1df38810d0be			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
70375083-3ad4-4afb-afea-d66025accb4a		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			fe3b5fe3-a7b0-4f27-b0a8-3546feae13db			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
f6d821c6-9154-4a87-9abb-6904bb84fc32		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			5608535b-051e-4fe3-ab84-f80e18f6b54c			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
8291255b-7a29-4eb1-8d7d-a0b6aacb4818		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			5003a397-a974-40e9-ad61-75989df603fb			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
6761e5ea-0af4-4dfa-bab8-2c65a01890b9		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			8f81e4d4-617e-4430-a245-c77626f66554			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
28a3dc63-095b-45e8-b4f8-af4ad2e907dc		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6a1c984b-10e8-4c06-a032-a59a2e3aa08a			\N	\N	2000	\N	\N	f	t	f	f	f	f	f		
1e22fb17-aaab-4298-9a1b-196e23c77b87		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6050e23e-2dae-43e8-9184-e65cd757c093			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
b5aa61a5-0791-45cd-beb0-3b9b10e1cbcd		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			92fbe8df-a729-4003-b096-684363ca6323			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
ea7794eb-b5c3-4d3b-8d65-e00ffdff3d34		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			99b28249-2645-4f36-a4b9-6d4ea10ac3f4			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
dd6c3cea-39d5-4a04-805a-a57b1158c957		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			e3e68cf6-2cd1-4db2-985d-682d095d4b6e			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
ae5b0d68-1b42-423f-93d1-d45924ecf159		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2bb2080c-deb3-4464-83d1-3d47859cc7eb			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
84b79820-d4ec-4cca-87a0-ca169068a16e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6aa84a26-d59c-4215-9cf5-5d063e8c83d0			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
d8bdddab-a6f0-4c7d-9ac6-cd5e4b7ef48a		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			cc762866-ff98-4a57-8175-749ab165ca18			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
479ee4af-59ed-40b9-8733-2ea5417b05a1		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			59e44752-458c-40ea-89e1-071164e1e2cc			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
970f1046-76fe-431c-aaad-81df24b1d778		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			3d10a0c2-72f9-4659-aea6-6c471eb1bb3b			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
c80bc41c-8c94-45a5-9f3e-55713c8e98f7		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2fc95c4b-71e3-4a7a-adbf-018b6f9b0de7			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
fd27c50a-b50b-447e-a7da-22d978491e99		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			5395b520-0632-4a5d-b9d7-dd982b16e3bb			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
1c3e9d9c-e8ca-4dac-b931-327a1a8bc287		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			cfa32125-04f8-489b-97e0-3a27c0523995			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
fde23658-0ce7-408b-b2d5-b61943f68390		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7578ab13-767a-4570-b9ce-17859d769568			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
267450d9-f415-4fcf-b56c-fd04734c30c0		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			82b25bf4-8a5a-4d33-b51d-d6b8556b117d			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
aa9b6456-6db6-4b52-a1a7-9781eb6cd8ec		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			0099cddb-ced8-4042-b05a-33a161423ae9			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
d42918b5-152d-431b-997d-d4e5b228f4d2		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			4c2848b2-3a58-4407-be2a-c4ec40ec8f2f			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
b87ac007-37e5-49b7-b9c6-c525b14fd51e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			22981d35-6537-4ec2-9856-f1698c95c043			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
a695e993-0746-4444-a5e7-b813145edee2		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			04f535ab-5946-4e7d-942a-e2cff976554e			\N	\N	2000	\N	\N	f	t	f	f	f	f	f		
f803338a-3359-4d77-b1a1-3e54637ca207		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			a832ed19-3613-46a3-802e-e1d883eda958			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
ffcda9ad-66cd-4928-8c2c-96ab1a99080a		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ab4bed37-f41a-4b73-8f9a-325b7f978dec			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
4540fe10-6d31-409f-a2f8-ae7381a398bd		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			9c268802-4bcd-4163-9668-61d848363019			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
efaf0235-ebc0-484b-98b3-fadda2e4e4a6		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			710157a3-3481-4e41-8e06-f1a7ef02972b			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
0d0e2ad8-7cbf-439e-9d9e-7b83d9ad2460		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			e26bee5d-37d1-4d68-a156-40bdaa6f58d1			\N	\N	2000	\N	\N	f	t	f	f	f	f	f		
6fd56ecb-ce4d-47ac-bec1-b05bd783d92e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			71b8cc94-b99f-4504-9eef-10886c467ed5			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
df664238-4f79-48fb-bffa-96896c3880cb		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			bebe5fca-81d5-42f4-aa1e-88a23ca95381			\N	\N	2000	\N	\N	f	t	f	f	f	f	f		
d57d5ae8-02dc-4911-b850-5e8137aaec8b		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			4a16a904-95cc-4bd2-a8fb-6c0995d2cd91			\N	\N	2000	\N	\N	f	t	f	f	f	f	f		
dd970f99-126d-4ced-8dac-e585c3749252		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			a06cb305-bb6d-423f-90a5-70dc750a7049			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
524bd665-0ce1-4288-af36-e0cfea8bb5fd		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			9eab1774-5581-4b69-bf95-5b08507174e2			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
6698a460-76d3-48e0-974c-e47246ed23e3		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6268f8ef-e6c7-42b7-b028-1254ea50e05f			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
6b6c1cff-e91e-4bae-9acb-03486ba5dda7		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			0f59c54c-d12c-4651-a777-20d9fc4ac096			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
243d5fab-a3f3-4d6f-936f-63698f6de923		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			0e341882-243b-49c5-b661-7b5d3464b9b1			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
ae4909e2-dfc9-456e-8920-1b0d554add54		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7d6d851f-b320-4719-b715-542614bd97b6			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
9bc423f3-8989-42a1-b644-c82e3fb6d755		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			a2b087d2-133d-47f4-9798-ffe5574b7ef4			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
4e8fa5bc-913d-40ab-8386-6f9e48b4986f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			b3e2bda3-476f-4af6-bbe3-f2e90d126958			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
031a7ea9-71fc-4f14-a37d-8f3d139ea56c		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			22990cc0-1ba0-4c3d-8405-a7a16558c0ce			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
625700e0-7bd0-45af-b6ea-3a18f553be94		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			a5f3d7d2-1a07-4663-96da-d1127bf9c78a			\N	\N	1989	\N	\N	f	t	f	f	f	f	f		
2ea7af49-4866-4d78-ae43-22f7c109b86b		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			608b7610-08ee-48bf-a265-22b178b1c1c5			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
52c8ce3b-70b0-456e-ba09-191057e77c27		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7caaa2a3-91db-4057-aa5c-69cc9420bfa7			\N	\N	1988	\N	\N	f	t	f	f	f	f	f		
c990d228-d872-4b15-bebb-4d5fb86433b1		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ca42b030-f1a1-4a16-9e8f-fbdb59d4fe42			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
d3ee594e-4286-4c56-8460-0bdbc2c266ce		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7b03b706-55b8-45f2-98d9-f9b46129c7ca			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
aabd5030-689d-4052-b76a-87166f6b17c2		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6cebef7b-6523-48d5-89c7-cfd83ce086d0			\N	\N	1989	\N	\N	f	t	f	f	f	f	f		
aca6e9f4-007b-4af2-b4e3-d919cf3d5616		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			21077239-5cec-4b11-a2b1-814f2821342d			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
aed97577-d9a4-4431-94af-7706188d8896		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			726f45f5-6282-4ff2-b4d5-bcef90dd7f86			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
a49ddcdf-d3c9-4057-a278-fd5da9e8eace		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			94620349-2ff6-40db-b7a0-f2bbd4938b3e			\N	\N	1989	\N	\N	f	t	f	f	f	f	f		
b456511e-a470-4132-b7cb-8fdbdd2af543		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ea949b59-0e19-481d-8bc8-eb1e95d5da1c			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
c012f6ea-12c6-4a50-9a33-3753c5bca1d1		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			95931441-c7eb-4ac5-a5e6-57afdfa4788b			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
61f404b2-c388-48bc-b526-699bfd0f7c25		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			8151ae76-da88-4c11-bbc4-4d5a45ea5c9c			\N	\N	2009	\N	\N	f	t	f	f	f	f	f		
7e651849-cbb6-4c7d-9cbf-a6a8f3cbe36f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			42c6465c-dfd2-441f-88a5-8242a1decd4d			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
cf00b40d-2097-42dc-b44b-62ef99735e8f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7a270137-bba5-4625-b00f-778e83459cfc			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
6fa9ed3c-fb61-487e-a24e-2fecba297de5		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6860a197-1716-48ad-8549-f0372bc625a1			\N	\N	2000	\N	\N	f	t	f	f	f	f	f		
628bba52-b875-42a5-bb5c-deba4305fcda		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			d3048c20-32aa-49fb-80db-a73acd0932a3			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
9610eb57-6bbf-417e-946b-571ecc3c6de6		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			9c636011-3b74-4912-9f8c-df0b5fccb3ab			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
e568d75f-483b-41d4-8ba4-ab0b2a3ccbc5		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			dea5525d-57c5-42ad-a851-88c19cb9f668			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
98b18403-1a48-4e3f-96de-1b8d654585ae		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			efaac7fd-1bba-4485-b0c2-1ffcd7be17d9			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
8bcaa9a6-e69a-4367-b395-74d750729be3		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			167bed49-9fbc-40d0-88b3-1c3f11f892f5			\N	\N	2000	\N	\N	f	t	f	f	f	f	f		
9f2a73b7-d1b4-4329-af5d-779db9b33652		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			27830c15-3468-4497-87e2-9c15fed413e9			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
4d8da4f7-484f-47ee-8511-a4314d4aa575		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			492f4da7-1d38-44ce-bf27-8a6ba4b0ca07			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
fc3c6b85-f7c3-4afb-a96c-b93fc9b57476		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2cc97078-e10b-40ce-892d-72c235ece5c2			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
03190ca1-c1c8-413e-8da2-782db8c9dee7		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6f12c218-7455-4fcb-814d-2f77b0126b9c			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
6456842a-4e46-4026-9216-7c94c7b635df		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2a43a395-c2b3-4182-a5a2-5258e68dc49a			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
39cf3212-0582-451f-ab0a-a7bb8182a88f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			690553e1-5ac0-4bf5-837f-4a2369691fb8			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
2dd25426-a489-4742-96d4-599f1e136aa3		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			0012ff16-4e81-4cef-b16b-7ef1816f1535			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
ea6b81dd-c931-4ffc-8003-f7a512109d61		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			e26c7be4-4e16-4d69-9f52-10f91c820200			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
9232695e-484b-48e3-8266-1ac98f5ad5e9		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6bf00338-5973-4ba3-82d2-066ad22ff882			\N	\N	1989	\N	\N	f	f	f	f	f	f	f		
4238b846-458b-433d-84ce-8164a4f67ac8		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			826615db-16ff-4381-8cf6-2445f722089f			\N	\N	1989	\N	\N	f	f	f	f	f	f	f		
664a0598-d7ab-49c0-a14d-7421cdce1843		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ac05f4ee-507a-4f5a-8b81-be5ef4de5319			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
291aacb0-7fcd-4ec3-8e06-052f4fa8bb06		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			df520312-c1c3-495a-aea2-a86e90ac48fb			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
f80402b4-91c3-4898-83af-0844ac1de126		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			37f1863b-36a9-4e71-8655-f0c15876084b			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
71ffa8e7-d8c9-4eed-a467-b8f5211ff56e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2de0b196-b011-47c4-acaa-30d04baa4c79			\N	\N	\N	\N	\N	t	t	t	t	f	f	f		
57f701f3-9062-4e9e-a29a-843de96082d4		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			179f5bae-8324-4f48-9c44-80053d22b305			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
c4fcf7da-55df-4568-8554-d24e071bfccb		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f78a062c-0c07-4892-9e56-4ce47c3ee58a			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
c67a3a29-d807-436a-a5d7-f6ace474981b		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			5a8f7ed4-4594-4dd4-a79c-c6d8889a1e6c			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
5d057c99-1247-425b-aa09-d3446a08aba9		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			5943c7de-51ad-4ba6-b276-fb45cba4a3d5			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
9dbcdd7a-ccd2-4c38-8a02-24e20505cc35		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			b1fd6cd9-b339-4f9f-aae6-b86b64e8ceed			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
f27fed9f-169c-4232-9be5-a89824d7630c		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			dbbe718e-8e83-4fc3-85b0-0fb802fd07a6			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
83914335-7c2a-4125-877b-6a5110e62718		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			1b275c58-26d9-49f4-a6b0-0747db51efec			\N	\N	1987	\N	\N	t	t	f	f	f	f	f		
64491481-f732-470e-b257-761b7cc86418		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			629f37cd-8b3d-481b-8854-18f7fe0cc4c6			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
4d4087d6-010a-47c5-b22e-b693fe94f9ab		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6df0c3dc-69a9-48b8-915f-c6124692fe0b			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
22c3c712-2daa-4da3-b9b7-aefc22e55732		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			34d8fff9-16a8-4d99-ad79-30a69017d87a			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
baff508c-3a48-4fdc-8de0-81e1d3a44818		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			caea6b34-a885-46e9-a6a1-820e9164198c			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
38738ab8-2815-4913-b6c1-86696bb5c99f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			25540199-3153-4c00-9ead-7eecb8eef48d			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
e3736d27-d3ae-4483-a487-cc58382d98e2		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f5014532-4334-403b-a818-06a4318defa9			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
6605b0a9-709e-4086-92c0-86f8631d5c5b		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			11a4a7b1-8c4a-44cc-9159-c531b368c4f9			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
57505e6d-230e-4fb9-a6ac-13073bff1324		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			001c8dac-0f7e-4a7f-ac16-fdd47fca4262			\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
a9168617-587a-46cb-afb3-587cc9208e00		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			00064d4c-0adc-4e9c-b95f-d01345e5bd96			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
f80da71d-abff-4015-b16b-8544eff1fed0		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			e8c8e294-2380-437b-8e9d-05ffee98125e			\N	\N	2009	\N	\N	f	t	f	f	f	f	f		
b85ea11b-030e-4ec5-bea0-a62adbd5cc10		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			609b950b-baae-4331-b280-9c16573089fe			\N	\N	\N	\N	\N	f	t	t	f	f	f	f		
659f8bdd-005b-46d3-8032-6b56d2878b9b		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			83c23b6c-17d9-465f-a589-1d2c8cd3593f			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
0373af60-ce66-4352-a330-d70c02317f55		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			489385bb-a43e-4878-b80f-f1188a80dd74			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
8ccb6dbf-b1ab-4bc6-b96a-1f912abbf3ee		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			dae9ff02-dbb4-4608-9414-bf4039dda756			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
1f1f39e6-d6dc-4b35-b542-d64667871645		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			926ddeac-99a6-4940-a6e5-79e2a03a100e			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
e6221e4c-ada6-4756-8ef5-ed148c01a736		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			516b050a-d516-49f5-9b87-ee091138050a			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
f3c3195c-8941-4441-9db5-4d8d79d4b0eb		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			50e808b5-0f46-4453-892f-ae9af9dd578e			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
bae3170a-0f1b-44f3-98d0-1f0f44382791		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			e020b1b9-7e95-498b-9605-38a849a3fd23			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
f51d964b-66ed-4448-989c-61f05c3a6607		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			970ea77e-fd36-4c3a-ba4f-4944d1439934			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
b22a80f7-3728-4e2a-b363-78202c8e7985		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			5791255c-d5b5-441b-be81-497f73038f53			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
fc6c860a-51b1-47ce-a620-a55e3e3fcc24		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			58379bb4-ccba-4312-8ae2-b9e182fb74de			\N	\N	2000	\N	\N	f	t	f	f	f	f	f		
101d2aa3-ba26-485b-bff7-bc7eb4aec613		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6676571e-7ed4-40a3-bb3d-2c26dbd08c56			\N	\N	\N	\N	\N	f	t	t	t	f	f	f		M B
13b1eea5-6d9b-43a1-926b-bcd570a82cfe		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			b00127cb-71bc-4a67-b97f-84bddb16f6ed			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
8c90f56b-9ab6-4b91-9260-7b730270ac84		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			bbf9875a-94e5-44cf-9f60-496f5260ab07			\N	\N	1994	0	\N	f	t	f	f	f	f	f		
4fde4806-5b2d-4e1d-8b7b-7355070fb83a		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7b6c4246-40d7-4891-a348-cb6e3cb2d250			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
7618b681-a571-43f9-bf68-95d080387e8e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			27187a62-968d-49be-91a4-d9afd3389185			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
0ca0ac1a-a82a-4b72-841e-83275264df61		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			d29b6f68-96ee-4a2e-96c0-67e412daf6f5			\N	\N	\N	\N	\N	f	t	t	f	f	f	f		
1680a6cd-2526-4fa3-9891-7c49606b8397		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			8aa20af8-8abf-4862-87a9-2698cd5d1bcd			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
b728015d-621c-450b-989e-9a57d92533ce		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			3f74c91c-4c12-443d-b5df-6522c32971d8			\N	\N	2010	0	16	f	t	f	f	f	f	f		
bb90dadc-9391-4ddb-8bda-277f9ef751f4		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			66d44bbe-4d6e-4011-a106-9619c8efdad7			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
a03f3022-a284-461b-b8e4-ad1e76241309		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			51f4e7ac-f451-48c3-9590-afedd001b967			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
786a60eb-c871-45fe-b31c-f6ef5b820c55		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			60f71172-15da-440b-9641-efdca1d47c6c			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
0c7e17b6-54af-4912-b6a8-9ddf7f41a251		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			d4b33fc3-a839-4095-b638-a99272fb5bed			\N	\N	2009	0	\N	f	t	f	f	f	f	f		
f62c3055-7c9e-404d-8cf6-3fd0b3782b5b		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			12702700-beec-41e5-a271-7aa97bec4d4d			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
112fff18-942a-4c94-955a-f9aed4acfa1e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			085ff608-e560-49b9-b67d-ad1450daba19			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
4c1a7ff6-e3dd-4a2b-8e7b-ca3ddd6df805		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			568caa8d-50d4-41d8-8b9e-3dee1cae25b6			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
5f897134-7be6-40d5-85bb-e2f420971bb0		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			5d8c5d07-cc73-4840-80dc-88fcb17ba6f2			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
05bc223f-fed1-4f67-a67a-c53b3752bf7d		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f9c5acfd-bea4-40bf-80fe-1d8b41f01378			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
968edef7-1f05-4a9c-9704-0c097f04c371		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2ae694eb-d203-4c6a-99ac-377032b54c65			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
439468d1-06ec-4144-8672-06191802fd0a		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			3ac277b3-eb97-4897-a1b0-2c258403a1ee			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
016091ca-a053-41fd-a3bb-1ba7df95c8cf		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			d8c5603a-b137-4110-bb86-9ca38edbd960			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
cfb00655-d225-4357-91d2-978001c0a968		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			56d73e38-23f2-47e9-b709-4d4706e49b30			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
c0c9f22f-b672-44de-be50-2867766b78cb		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			aa653b9f-731a-423f-8a4c-73a0e1b5a943			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
cbfb5847-009c-4321-a4db-126505153d7e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			81e7547e-805f-45cc-a696-1604905c044b			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
dee8ee1f-59ac-4bd1-b272-2fcd80d06451		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			0e7db89f-99e6-4743-a723-d00535a5b052			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
8d740b01-629c-4b58-8947-d327956c4af6		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			cef1f182-6408-4476-9166-25850e76863c	F		\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
f418cf76-de5b-48c1-907e-5afcf97bb29d		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			721d1b83-cd8e-49bf-a3d3-35758cf52809			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
ae01e055-a443-44cc-a973-986b980e268a		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			8db96b62-9912-42b4-b76b-14ee088fbb51			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
8b1c5bd2-617f-4b1c-9be1-2896d9e30682		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			e699dc46-23ac-4a61-ad72-6f251780bf5d			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
4eb429c3-9112-425b-b88a-df66946186d4		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			49ea6362-8cd7-4b68-a331-4bc7e1da53b1			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
b41a1fa0-8ca6-4182-89d1-acfb3c471859		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			72f6e5d7-2d65-4b7a-9c2e-60eca2dd5101			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
3d9501d1-0996-403f-a341-ec3785ddb750		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6d66c5d1-fa3f-4532-af1b-7c0daa800563			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
3eee8c71-3f9d-4c09-bdbe-c5eeb994770e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f5daebc3-1a7c-4a8c-9e5a-a67a05441bb1			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
61498ba5-6ba9-48cc-af22-92b8a07fb9bf		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			84e66492-408d-4ce6-a3c9-0781666fcf2a			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
368deb95-2a39-4a8d-adde-691f2989761b		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f096d2c7-d3b1-4a0b-bbb8-56b4bd6323db			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
5c6f88dd-0952-4d9a-a25f-094877dbfc5d		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			382f81bf-9957-4f64-9a01-7aa64889ac93			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
0c1af31b-b166-4942-99d7-0844c6b94313		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			8ab797c2-4091-40ec-9ec4-f3446a196f90			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
06c69ff3-e1db-47b6-af4c-545a5896077c		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			93c4865a-16d4-44cf-8d35-dce9d107049f			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
e94187b0-122c-4b8c-a259-0d8ed1c57812		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6ba8a199-9e87-4f88-bbf2-532f45518abd			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
d6455ef0-06c6-42a7-8a29-bbb63a38b082		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			429c1387-2ba7-4a17-861a-0c4ecaf1f933			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
c6a57e09-ba2f-440b-aa64-709aa567c146		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2681ade5-003a-486f-8d88-acd14b609735			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
8171ab33-dee9-40db-aa1f-3720518185ec		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6b111f1f-201f-447c-8c15-f28ae7c44789			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
b0cb3344-dff0-457e-b283-ad8d77d43e79		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			1439d2ae-7593-4b77-b489-e4f3c042c914			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
574e033a-4fd1-4bc0-a65c-d1d3acdd1ad1		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			19a342f9-d4d4-4226-9422-a860d43eba02			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
1f3e4392-8450-42f8-a201-9d97ffc0d9a4		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			1db17bde-6eff-436e-bf7f-7ee9cb93bbee			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
d0a6b1b6-ca19-43ae-90c9-bf058e39be01		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			3e2a1332-e0b8-47b7-b024-c87f9ee02c82			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
874c3ff4-f2c1-496a-be92-0496ff72bdaa		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			d26af406-3b50-4be4-9f89-e43db65754db		Child	\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
097729ec-97cb-4933-8b41-11ebec3d9181		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			5d8657c8-e8bf-4a39-a570-489fcbf150cf		Subadult	\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
2eb2e5aa-1d74-4925-9ecd-f58b9463da8e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			198d21d4-c1f0-488e-af8d-025ee6dcd92c	M		\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
f304e5c2-7893-4f1c-a1eb-f642f61f4956		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			693b9153-deb7-4830-b747-c4a1b35d3d19	M		\N	\N	\N	\N	\N	f	t	t	f	f	f	t		
ac89eb8c-e4e4-4ce9-9434-e7c154caddf8		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6a685714-ec97-4f09-a6ef-f313508d8b1d	F		\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
73491716-74f9-4149-aacd-1d3f0a75f9dd		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ad3abe71-021e-4b08-9fe5-3216508d2a84			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
c320e97a-45c6-49b8-bac7-322104e43df7		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ad33fabc-d28e-4308-b244-bc63d39d3865		Subadult	\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
d895bfcb-b1f5-44a2-813b-67ea509a6328		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			555984bb-5632-4f67-93a2-b04782ea3b2c	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B
163e3be7-306e-471e-93b6-09c2def94e71		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			e46bba82-08a7-437d-b980-81fa8b8a5e60		Child <2	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		M MA
45461595-bb58-41ad-931a-92c071522a9b		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			45e682f5-9dba-4e0d-ba5e-68e078c3d20f	F		\N	\N	\N	\N	\N	f	t	t	f	f	f	f		
c84e97a1-d928-4005-9b0d-4c88db304fa9		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7b225114-29ac-4170-8d2c-948fd0730e7f		Subadult	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		M
e1ae9220-003d-4239-a1af-ab6d4886cece		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			57636f06-1c14-4c8a-975f-a8f45760de12			\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
cd4b42aa-857b-4525-8dfc-5ea2eaf923da		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			0cb79a88-8d40-4305-9682-22a7d0a98929			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
155d5087-8149-46e5-a523-1dc3f4226a17		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			d5a06082-d902-4bb9-9c40-41cc797135cc	F		\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
a6d69f07-6e0e-4942-b56f-b23fe9234ecf		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			e834248a-2acd-4c3e-b17f-15c285ea8f58	F		\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
f20c3cc5-9de8-451d-9e75-8ffb7d692ddb		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			0b986d0b-700e-4aff-8d71-4d08e41a6f4a		Child	\N	\N	\N	\N	\N	t	t	f	f	f	f	f		
271eb64a-a855-4652-8d0e-e16e9d632ad1		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			aab3f20b-d0e0-4ca2-b5bc-5dfa24fc434f	F		\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
f3a4fe12-0563-4b41-a319-ff804431b905		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			9ec8c684-4c11-4d8f-87b7-bd41d5d13c3c	F		\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
ae9e6b74-2ba4-4327-9140-34815195ff2d		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f468f41d-5bf3-4f24-9092-9b18c24b42c4	F		\N	\N	\N	\N	\N	f	t	t	t	f	t	f		B M
cac125ad-afa9-42c0-95cc-14f6b760334b		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6a1de0f6-83c6-492e-afed-c308df002cfa	F		\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
7ff19bbc-ad11-4802-8909-3c896ce9e0a6		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			277a16e9-f74e-4a3f-a37f-05c61350c62b		Adult	\N	\N	\N	\N	\N	f	t	t	f	f	f	f		
e7635363-4fee-4cff-92f0-b2dc90d0c192		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			bb709365-3694-4e8c-a26e-6c54a7455ada	F		\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
d5a0aa47-100d-43af-9f9c-4dc518551d1f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2acfd894-bd6d-4ca6-a0c0-79e074454ff1			\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
af5e9e90-14ae-453f-b3ac-5824fb959367		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			8aea66d5-1d89-4f27-b785-609ae626c181	F	Adult	\N	\N	\N	\N	\N	f	t	t	f	f	f	f		
579583bd-ef10-4414-ac86-8e508cfa465b		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			9b6cda38-4ca0-42f4-bcb6-60892b433025	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
de360eed-8883-429c-90e4-e7fb94df4d6d		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			0879b8fb-8791-402e-a7b8-20bfdb9f78d8	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
98885efd-34a1-4572-b274-1227f17c26cf		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			513bf955-425c-4a67-add7-e3d214b3bbc3	F		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
e4fdf155-2e69-4e9f-83ea-299be857bb2d		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f6e3935e-3c20-4d02-b262-a0ed865d0f67		F	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
d084ed96-0628-414e-afe3-68b86bf5086d		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7cb4629e-b401-44b7-8150-b0a2462c4616			\N	\N	\N	\N	\N	f	t	f	t	t	f	f		B M
98af9a22-65ec-4290-ae9f-d9d8e3b106fb		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			b15ff05b-aa02-404a-a33f-482ef2fd9d36	M		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
e739cdcf-115e-44a3-bb78-c08848bf2c1e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			dd9988cc-6c18-49a2-ab5c-835c14074810	M		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
fb18b95b-cc73-4913-ba71-2a27df2a1624		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			79de6a51-f09f-42bc-a3f2-5104d51e99bd			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
c1f6b0df-9e8c-45ca-8665-c471754344c8		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			b5df05be-4a54-4eea-983c-c9115a1538d0	F		\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
6a753c3b-2058-4bb0-8e4b-526c31b8360b		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6c3f409b-922f-4206-b882-1bce1f6f144f		Subadult	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
f99546d5-76ff-4ce7-8690-3e0ebef21731		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			9b9bda8d-2d38-4c0f-b259-d4b90aad09a3	F		\N	\N	\N	\N	\N	f	t	t	f	f	f	f		
595b16f9-fceb-4096-8e17-d9ead3e9680a		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			3717108d-9e18-441b-87d0-07953393efd9	F		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
47844e88-72f2-421b-90fe-ea3b8bee293e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f54b8278-9cae-4df5-a791-6ee66b3d8568	F		\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
4a80d0f5-a2c1-4b1a-9abd-be1e9f24970f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7a53a59c-0358-4a63-9121-635a78cd15a5	M		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
1b1c53e8-6146-4b13-9ab8-dfafaf660419		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			38a89982-f038-4ee2-a244-c1609706d6c1	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
aae34ea8-e89b-4a49-83b0-c3499c114769		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			e5315c7b-a6f7-47e8-9269-9af7b19b53fa	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
20e411b8-410f-4bb9-8af9-7c8b40b0a4f5		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			b60567b0-c240-4f4d-b829-f964d8484871			\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B
6f4aec89-ba85-48d2-8c3b-282e4d9f511a		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			b415bfc8-99d0-4c77-94d8-551964580c7d		Subadult	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
931cdf45-e8be-4358-bf8e-09c42a9bd50b		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ea3889f2-e938-45ae-ab6d-a2d84592da46		Subadult	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
6d4d9b45-1562-4bb5-9211-346ec7c22ac4		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			8a6fbb46-dd60-42ad-9c8e-7bf006ecba27			\N	\N	\N	\N	\N	f	t	t	t	t	f	f		B M
c271dd8b-7236-45fe-a2b9-92b4068d9f0b		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			1ffe12d6-13a6-429b-bb3d-909f8789813a			\N	\N	1994	\N	\N	f	t	t	t	t	f	f		B M
a258e4a0-ad98-4036-8cc4-bbff7df0ce98		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			977d6d89-41a5-4830-a51e-de899e1bf0da	F		\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
d8074d25-1570-443f-a045-ced5368643d4		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			83a35520-6089-4c75-9273-c0c41f9660c7	F		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
1957832b-055c-4c1a-ad6e-e67d891ca533		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			99e73d14-87ab-4774-8723-8a23de10c5e8		Subadult	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
9e7fef8e-33ef-4586-ae03-78522b423830		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			8844537c-6fa0-46c3-9680-cc6fd0fe9539		Child	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
eb1f2940-24ed-467a-8f4f-3aac65eb1328		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			555d2d94-6ca1-4658-ac79-8fa140d0cfb7	M		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
d6f11cf0-28d9-4168-a90c-38ba57960c6e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			3c90ba40-bad9-42a0-a6e3-fde59368c192	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
5e8f6cac-0e94-47c9-a913-1b1e617c7053		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			e8355825-5c14-4b0d-ba4e-1d148dea29e0			\N	\N	\N	\N	\N	f	t	f	t	f	f	f		M
604b2389-2799-4008-81f5-f1a0a65efc34		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			abf00f36-4ecd-425f-90b3-dbe629fc48a4	M		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B
69c880ac-4ebc-4f37-9a53-9939a379bae7		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			4160cc24-1409-4b59-ad10-5f7fc562dc81	F		\N	\N	\N	\N	\N	f	t	t	f	f	f	f		
2a785f2c-ac34-479a-b788-eabe92179997		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			e03a049f-90e2-4068-b1f6-8521b96be1e9	M		\N	\N	2009	0	14	f	t	t	t	f	t	f		B M
2b9d5f7f-82b2-4f78-8872-b9bfdc172931		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			a9189952-85ba-43e8-8696-e2bf7f29ad08			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		B M
2ed3654e-d223-49a3-90d6-ab26cfbd9aa6		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			9da423a0-70c2-4939-aa55-b03b3f4c5bb6			\N	\N	2009	\N	\N	f	t	t	t	f	f	f		M
06eb4a10-6236-4a66-9976-f517f9967fb1		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			53590d35-d2ed-4f01-bf12-330cc6257395		Child	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
4aa4198d-38ed-42ac-bd4c-13224e10c81f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			870efd5e-a937-499d-aa0a-088f3f3ce16d	M		\N	\N	\N	\N	\N	f	f	t	t	f	f	f		B M
815b0c92-1b24-471f-9c5c-338f39dc9d04		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			1190ec61-e986-44e1-b243-c4cb3576821d			\N	\N	\N	\N	\N	f	f	f	t	f	f	f		B M
c0837f51-d3b5-4564-a250-a8d6d073e5fe		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			c9e1f22f-9b02-4284-8fa6-92ef3659e20d			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
57ed13b4-1805-4306-9c23-d9b976a0b73c		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			83fce251-4f6c-43c5-97aa-863753865a34			\N	\N	2006	\N	\N	f	t	f	f	f	f	f		
52d19345-4d97-424c-bf5e-49be1a14d752		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			5e753681-ac1a-406f-82e9-d64d849d4324			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
512a9f54-a398-440e-b44b-8921fadf1285		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f5d0dff6-2560-4463-a2d3-ccb0d7a48543			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
78c4d7ed-ea9e-4f38-944e-73c976a56375		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			9baca943-60a4-48fc-a4f9-2bf9e295c8fa			\N	\N	1994	\N	\N	f	t	f	f	f	f	f		
044dab9d-10d4-4047-ac40-80fee4bb6d39		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			e08d750f-5dc9-4ce5-bca9-d842fd625b4a			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
a45233ee-4695-4e28-84a8-8d90488b10f2		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2cf03596-59b5-41f6-aaef-38720155858a			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
9163c9f3-e6b3-42e4-80b8-1a1b09a84c83		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			68ad1178-4e84-4a6f-bab2-b81e95f742c7			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
675d1e62-07f7-424b-bd62-017630040a5f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			dd961579-58a3-4a91-a852-b897bcbbb4cd			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
251b792a-c971-4cda-8d31-ba383f827c9b		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			5e3af764-4877-4267-8f31-1b4df86175d9			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
83a5c336-7a62-4c9e-b353-53f270e18897		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6baa1593-69b8-40a3-b22a-87e01ac4b15e			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
1d72dc5f-036a-46f9-af06-5f8f037f1322		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			76d9ac67-a02e-44db-b8d1-dc1bd70ab4c6			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
b877c997-18c3-46d3-873b-2da45f74d044		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			3bbca8cc-3d30-4d8c-9b7f-fb802bfe5a00			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
9b058241-0989-40c0-bd20-d8a1bbe7fe4d		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			8798296e-1322-483d-951b-ae1d306f2636			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
dc1671e7-b8ca-47f9-825e-c811ae67c3b1		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			385c5352-dc15-4888-b3e8-fd6ba0991f82			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
44a33c4b-fdeb-49f3-bf68-9f18a0aeba84		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			9d1030e4-7b56-48de-9e36-cd4e85a0af94			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
556d2f67-f599-40a7-9e89-81f19bf45eb9		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			636c3c4c-9389-4f52-b3c7-211d49d717b8			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
0caea488-c02c-458d-b658-9299e52c02d7		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6c9f107f-179a-480e-b146-bee16d8f664b			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
2baac2be-15aa-442a-99c8-4574bf90c595		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			dd58a634-8c11-4110-a8bd-161b0ab1920f			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
fc8f2cfd-8c53-4d77-aa6d-7c58f8f814a9		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f9a3f893-7a0e-4666-97e6-288144f179c3			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
21b304aa-1966-4c97-8b5d-ee89b5780bb3		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			b0f035ef-8204-421e-b763-3201efd29f42			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
4cf53fe0-798a-4c67-b1e3-296c7faa90d1		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			e9208c0a-24be-4465-ab8c-20f4f3917c5c			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
dd9216f4-2be6-4796-8e51-077a09ab0f4e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7c040076-3b1e-4b82-aec3-734b6fab94fb			\N	\N	2000	0	4	f	t	t	t	f	f	f		B M
68c7d8ee-86aa-4d48-b425-19e62ce24f85		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7ee9fb1d-9478-4931-a014-a55c3d1b9b19	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
e8f958b9-d40f-4814-a219-de3e6f665f80		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			69070289-1145-49f3-b706-b2365984be2e	M		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
9ebec670-1cf7-4fcb-93f9-c6bf787738e5		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			236803c0-f2c6-4c65-8b6f-c5556a1f4e50	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
ef2e7e07-6cb1-41fd-884b-92399e27526f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			5dca7e18-3994-4f50-bd95-cda1e0db1cdf			\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
618d1709-9c89-4120-98ea-17bd56b56e14		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			4bf59054-2542-4f6b-a570-e7371723e2b0	M		\N	\N	\N	\N	\N	f	t	t	t	f	f	f	Y	B M
afbafbe0-996f-4a73-8b97-862b94ed0156		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f1b3187b-f3ce-4852-9c4d-f6b937a1209a	M		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
3934a079-33a0-4454-8902-67900f9890b8		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			b0cd0111-72bb-48e1-aa22-e69659ef7fee	F		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
eb7806d3-86a4-418c-96b6-d1346c97550a		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			808b4604-7f5d-41ff-ad7e-61c3a49af312	M		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
d0b4c7eb-afb2-4c42-8bd0-8f3c4efd97a3		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			df3a2d76-ae81-4c95-9191-03ad025cbaba	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
5e5a6dfd-707b-4c77-bc1b-818a7880bb74		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			5f94ca26-0902-45ca-a992-974efecf1ff8	M		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
f1cb7703-82b2-4345-9516-dba5364500a3		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			fb4f2035-c42a-4d72-9db9-e06aa50689b6	M	>45	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
ded5453e-2540-4015-ba2f-18446b88582c		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7b35ab55-2a59-40ac-9b7e-fc809696fadf	M	25-45	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
0b45731c-8dcf-4dad-84b5-616894c3dd76		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			313691f9-169e-4227-bd70-05ca1e16d0a7	F	25-45	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
be37e6ac-ef4c-456a-a056-ea83437a1bae		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			565ac1c0-3331-4fa6-b086-bb120cdb4ad1	M	25-45	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
f98d0860-3d0e-4bda-885d-b15de663dd91		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7009b337-0ae2-4c16-a2c6-edbdc9f36657	M	45-50	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
a538e294-b608-47b4-881c-685f9ff7d92d		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			b00822ce-5281-4cc6-b026-dcb50b3e8e7f	F	45-50	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
9f5db156-e57a-4b28-a4c9-45767d5c5bf2		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			0d0dfe13-756e-4bc0-b68a-0329be2a1532	M	25-45	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
83cb0681-a7b7-4667-af38-0aa8bcec12a3		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			d2433071-531b-44dc-87cc-4740cebbb644	F	25-45	\N	\N	2000	\N	\N	f	t	t	t	f	f	f		B M
d244cc53-69e8-4b60-84bc-a2d38f01f73c		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			5d28653c-5571-42cc-b05b-e24bf928bb28	F	25-45	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
0fe1c6df-2a18-4d83-8562-6a9e255274dc		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7b85b5f4-2399-4bba-a056-98f9a2639dbe	F	25-45	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
46521fd4-e189-4ed2-a6c2-6673e80ef724		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			05f58219-8acd-4f16-beae-f26bb4badff9	F	25-45	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
d20c4941-e9c9-4055-8f22-e7e9666d8bd7		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2831ebbe-0c3e-4829-b7e7-0f84869f294a	F	25-45	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
c82e0b15-9854-454b-96ba-374a8e238f2c		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			489e4813-8475-4ee9-9d69-740c16fd6e30			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
235fa68f-2f70-4784-9af4-f68fcd6ff09f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6855e7a9-7cac-44a2-8e86-7cbc4806ecb7			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
8e0aa796-edea-41ae-8d05-800eb7069133		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ae1f4733-fd1d-4023-bec7-3e303b0c7471			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
cd359025-38ab-4836-93e6-aff3d72c28b7		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			837dcf47-a1a0-4aa7-b77e-31b1ad82d5e7			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
f7019f7a-7b07-476a-97c2-cb795b4f119e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			af989728-249b-4433-8012-b07a018a8d53			\N	\N	1987	\N	\N	f	t	f	f	f	f	f		
084d04ae-a147-4759-a3e0-785e45b349af		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			3dd4b2e8-99d8-42a1-81a4-b378b50c3e66			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
f4573462-0948-45cf-ab93-b38e1e928ffe		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			0628155d-e071-49f0-802b-690eafb70ce6			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
dd8ce6f8-0cc9-407d-a5d0-fc8d8a48302b		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2f5d28b3-b019-43c5-93ed-b55538823877			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
6e318976-6bd6-431b-8974-212cc8a5a2c4		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			3579e73d-25b2-45ca-9817-65c1fff8ee0e			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
e72be7dc-9de9-4abc-9471-63be0b22eb83		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			138b7716-b541-481e-a1d6-6ba33684632a			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
c8282500-efd7-4857-b78a-d7c04ad2b99e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			8a5a15dc-16c5-474f-a627-b5eb6e906105			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
3eb60418-6ddd-462d-87d6-36e8cfa9fbc2		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2bf81165-412e-4cce-9d9e-ee8582ebeae3			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
58ae8642-493e-479c-8046-da918aef691d		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6593785a-c8fd-40ca-9644-20dc2f8653c5			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
3ed79cbe-fed8-42f3-b985-86169973d1bc		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7edc6f64-6073-4723-acae-1410f39ef81e			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
b346e14b-9061-4748-bd2c-e2c4aadef27f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			8812ca45-b053-469b-8016-33173e3231dc			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
70f8376b-4c17-4a31-b5bf-1bd5e126ecf6		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2563cb01-59b0-4f48-999d-3251abf9fbed			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
aaa2eee1-4d0b-417a-97de-7e08d9c02f16		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			77913713-5875-4bc4-92c2-4b847a4d68e7			\N	\N	1994	\N	\N	f	t	f	f	f	f	f		
8bd27188-1930-4209-b5cd-f1ca731902b4		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ee600623-61da-4487-ad81-3765b1bd964f			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
62f329c4-c1a9-4a3b-ab20-3ced225434c7		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f86fa873-3c52-423d-b5b8-3c00cac3979e			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
6128aaf7-d63c-4774-b22f-ff313ed2fd3f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6c9c0b1b-d740-4c1b-8ee4-9570c634f3f7			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
64d955c6-1544-4b75-b63f-e4d07af3b003		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			cee95185-7591-4c8b-94e3-65bdc1492f39			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
986152c0-3902-4bcc-ab96-82000b3267b6		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			96222eb2-e327-42d9-8a79-137c14719a04			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
91d42c96-8cf7-424f-87a3-89cacca82858		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			3e1c112c-d5c4-45ba-ac9d-2159104ec636			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
f6d68f6c-aa0d-4f32-a362-3db8ee0a54ce		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			975d5553-f9b6-4a24-a37a-2827b44503d8			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
8c2096b9-bf02-40a3-8e53-4fe3adcb599f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			4e7f3827-b4af-451e-ab47-34b72db1ef14			\N	\N	1994	\N	\N	f	t	f	f	f	f	f		
e9c00f56-3778-4854-ae00-6fd27787d059		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6c92c53f-c9bb-4c46-9ef9-aba16c48800d			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
2cd098a5-84a4-4eae-b975-d246d152996f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			436c2e7f-6047-4ce7-8c47-0693ebe0b7af			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
5554852f-a113-42d1-86fd-373119ef60f2		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			43f8641e-dea8-421f-975e-5c4627e0e84f			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
d8e5bfbd-6866-4dea-86af-a98d9c55a089		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			c56f8591-76f3-4eeb-9869-ce85bdf8f6b0			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
c0b853ee-20be-46fc-9624-81fab0c2bb1a		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f17ac014-c39a-4d13-a0bd-12ef05e7b39b			\N	\N	2000	\N	\N	f	t	f	f	f	f	f		
4cf53f32-8c26-4dd6-8aa8-cba4b289a50f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f7338570-d788-4205-80fe-1e2a175521a0			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
06b50a9c-420d-44d4-8c07-6a628c597ed8		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			77178016-5151-4cc1-8a5b-fbb7cf41d280			\N	\N	1987	\N	\N	f	t	f	f	f	f	f		
9d7926f2-3fe5-4f67-bf6d-35fad5ee8cf8		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6178f56c-9489-484c-8e4a-b711602dbf03			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
5e4c8515-d5f6-4f88-bf96-98a5ef1980d3		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			a38d927b-c168-41f7-93bd-615f95519254			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
4572d841-745f-46c0-a057-863eddf57208		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			086ab989-bfa2-40d5-a668-7e723d6654a8			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
363f3485-8631-4f0d-bf3e-7d4b68568c29		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			a2a8d7d6-8dc6-4ff6-97f1-30dddc1fabbe			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
189aa3ae-cd94-436a-800e-75ed93583a9e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			e65c093f-9fe6-45f2-a4b0-62d30bd0cb36			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
12ea0612-031b-41cd-9aaf-324e6425697e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			85c95a6c-00aa-4c2a-9cc3-08cf35c76669	M	25-45	\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
592fa5e2-1356-425e-9d82-5aa20cf544b6		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			fbce5210-cb70-4aef-9056-84ebe268116e	F	25-30	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
ed02df42-f5b0-4b30-a08c-ea5a8ca952a5		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2a9e999b-3df0-4846-8620-8a55bffc05b2	M	30-45	\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
28ea7b57-64ba-4397-ab1d-1eaab5e91a59		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7a03e87b-7c32-424d-b095-f879096edbdd	F	18-25	\N	\N	\N	\N	\N	f	t	t	f	f	f	f		
b47136d5-d99f-487f-911a-11df501d1048		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			703696ad-a091-4834-b268-751aef01a4a4	M	25-30	\N	\N	\N	\N	\N	f	t	t	f	f	f	f		
8af0ebdd-2fe4-4d1c-b891-22b5f06c36eb		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			fc1817e3-309c-4fb2-8839-8858e7fdf9f2	M	18-25	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
e3d78568-d0ba-4fdd-b368-45b444b12484		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			675ea5f7-8d82-4b9a-a976-d87cc3adc67b	F	30-40	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
2816b7c5-fb31-439d-a61b-04f22177cb17		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			bfbd8eca-2b6b-4943-b58a-a15dc45fcafa	F	25-30	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B
fb0799d4-6b0d-45ff-b34d-db7aeb819b94		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			0eee2a68-5e4d-4bbd-b288-2080ff83afa5	M	40-50	\N	\N	2000	\N	\N	f	t	t	t	f	f	f		B M
3cdf7d42-6f8c-42a9-a86e-265b466a3192		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			29155c8b-92e1-476b-9469-2a0b00fd730f	M	45-60	\N	\N	2000	\N	\N	f	t	t	t	f	f	f		B M
481aa626-09ad-4098-b7d6-9e8de3cb7c1d		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			de33a00e-1a84-4363-87fc-613a99dfaca0	F	25-30	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
0335b7c5-cae4-4910-8789-a9865a860171		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ddc1d2b5-3e2d-4359-a471-0d21ab1dc993	M	60-65	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
813cd251-3624-44ec-baa4-15ad59c446b1		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			8fb1cd55-03d2-4bf1-96f7-ea0d14a8f026	F	25-45	\N	\N	1989	\N	\N	f	t	t	t	f	f	f		M
b655272c-344a-4845-b1dd-993ec4613e2e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6ce9c973-c6d8-4c18-a505-9bd3a38523ad	M	>45	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
f2fe6681-b79c-4039-9383-b1e5ebe600a6		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			1d26f55a-7942-43ce-952b-a5990561b807	F	25-45	\N	\N	2000	\N	\N	f	t	t	t	f	f	f		B M
302443fe-258d-4bf9-b7e0-292fe4cd1276		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			39681bc2-f253-45f4-8677-80f78d8ba20b	M	25-45	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
336c32cf-d250-4698-ba47-be61c0136df2		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			94c56a26-ea10-40df-a6c9-1c47335b7b4d	F	25-40	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		M
e6153b1e-ee89-491c-b8de-7508bb2a772a		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f3afbe01-8185-4b87-988a-346b7ad23059	F	25-45	\N	\N	2000	\N	\N	f	t	t	t	f	f	f		B M
e37f7b32-8c7f-4d9e-8f64-cb01725f1065		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			8431e7ec-f080-42c5-96e2-79f1f704728b		Subadult <18	\N	\N	\N	\N	\N	f	t	f	f	f	f	f		B M
a6472356-1cf2-4670-be0b-454d92ba7070		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ed3ed119-9553-45ff-b83c-6eacfdaf088f	F	25-45	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
41f662ef-25d1-4928-835d-bea07b528e7e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			89292170-4352-4265-8ca0-51bb4f5ed92b	M	25-45	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
f4575b71-e1a8-4df9-9bdd-8f8edc724601		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			43a85951-77a7-4195-90de-ed43b154133b			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
523ba597-ffd1-4a18-87f8-71c034400b60		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			222c3bfc-8d1c-4fa9-8079-1491249db78c	F	25-45	\N	\N	2000	\N	\N	f	t	t	t	f	f	f		B M
f1dae7ee-7aac-49ca-acea-a738d20c2164		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			5de91827-251c-493c-9c95-b66680d62112	F	25-45	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
a3afc678-42f7-46de-8438-547b261cdcc2		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			1a4f08c6-95a9-407c-8f7a-37cc540a0d17	F	18-25	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
e16f70b1-356a-4970-b59e-774e7ffac7c3		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			4078b18a-07f3-4de5-96e8-e0be5127dd6b	F	18-25	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
cd93d7a3-9bb1-4c88-8f1e-b8cead56d418		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			be092821-79e3-41b5-ad66-0b274d7ffc8f	F	25-45	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		M
78fd084b-5059-4d61-b2c0-0ffd7790a426		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2bf69948-b0ca-44e8-b0cf-6cd1e2abca78	M	45-50	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
ce5c0aab-a3ff-49d8-8e58-dc64d829cc85		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			14ff14d5-3c8d-4ca7-a74a-7564491863df	F	25-45	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
3bc8a1a5-173d-4fef-afdf-09f4276d3143		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			c7104449-54c8-4006-8c3d-2c7b797d1a32	M	45-50	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
6944da97-1238-4b05-b81e-88d644252f9b		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			c66c5404-5b60-413a-8317-47a8189d9318	M	25-45	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		M
3f16c94e-a2de-4a95-a8f1-f22c2abc3b4f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			cbb3564c-ba34-437d-ac5b-683fcd6309fa	M	25-45	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
112bbde3-b27c-4c5e-b33b-31560e6c3314		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7d7b1a55-493b-47f1-a9ff-d67c7ba45109	M	25-45	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
422c7f8f-c444-4661-9b8c-9353e9bfc1bf		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			55c75c79-31ab-4439-9368-244d60a71446	F	25-45	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		M
a7b563a1-1aac-435f-b83a-688199a24179		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			615b98cd-81b8-48c4-ba1e-f9116da50d13		SUBADULT	\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
15565db0-1fd6-409d-9ca0-4a0c53981a76		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			e54e285e-58bc-4833-ba93-74eccd2d30d4	M	25-45	\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
b595eb6d-24f5-4352-9dd2-91ca57409dfb		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			171667c8-5100-4964-8e5d-7f9b2fa4ce9a	M	35-45	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
8615eb3d-4236-418a-9f33-16edca4f0e29		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			c6f7bbb4-2712-490d-bbb5-eee88e649048	M	35-45	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
6ab5eb79-bd27-48cd-94a4-700bb591b4a0		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			507a8513-0e25-47e2-8511-01c18ba2ac95	F	>45	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
402f6861-03bf-4814-8901-b7174c4f89ac		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6d4ad459-7f7d-4618-880f-e14f0d1c4162	F	<45	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
8a03c0c5-ea53-45fb-9591-64e8331c74a0		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			c7a15827-3fe6-4f75-a1d9-102e86325992	M	25-45	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
074ab2e5-adb2-4c89-97bc-1137590ba8bf		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			aac10b9a-5c1b-4044-840c-e231f4b9f022		43290	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
0c214597-a464-4c3c-8e4b-4029abeefc14		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			d32285c6-3bd6-4f76-a3b6-e15be1b8d514		15-Dec	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
1f819ae5-1099-421a-b543-1d1777b1a6ca		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			a1be20dc-c3b7-4242-88e4-84ceb5d4a301	M	45-50	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
1ee4f192-c715-4685-88a8-f748da3d4188		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			c618a64f-0381-4129-a43b-1f75d1d7abbb	F	18-25	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
5ba5669c-fc2a-43e7-b817-c792cf144f5e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			73d5f838-8e34-4acc-aa08-6b8cb0e7c453	F	35-45	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
637ad47e-115a-4485-a11d-e329bcf4c550		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			226c2f3c-e936-4148-ad38-547059c48fa7		<11	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
afcf2c9d-e68c-4531-a2e5-248a9198dfeb		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			0e194738-3b72-49db-a3ae-bea167a6033e	M	18-25	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
dfea6ed3-9cea-40a8-93c4-efe59420513d		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			d9fac7e4-879a-4b14-b068-e016797e6742			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
d2a22049-e40d-4d6b-b3ad-11f5fb353265		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7353d908-19b6-4786-852f-d9287409b794			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
65341120-83b8-4b9a-bf11-c6a9aba875ab		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			0973213f-6048-4663-8204-f90fc5e48231			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
f58b8cbb-d2ed-4856-9168-12c695abaced		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7c59aea6-e80b-4096-b380-14d2481d1109			\N	\N	\N	\N	\N	f	t	t	f	f	f	f		
19023d27-61af-491e-ade8-84dace21f051		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			50ad0ab6-a657-4dcc-8ebb-d51e060f59ba			\N	\N	1989	\N	\N	f	t	f	f	f	f	f		
18cdb782-ff52-4e2c-adc6-9e2a4d4ac576		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			fd1b91c8-8874-4fe5-9b8d-bbd6149f12d4			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
48b4e778-9288-400a-8e4d-ea501d0d2133		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			9ddbfc0f-831d-436b-877e-6a498a78b6a4			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
c5f032b9-20e1-496a-b56a-2809e673841a		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			44cf9aeb-4dab-4a00-a26b-c8fb8e011437			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
d0d2f059-8b0a-4ba5-a249-5ea5c07fa3a3		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			8b09b01d-e37c-4013-bfb2-21550f998a2d			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
f28f88ec-c1f1-46bd-a201-4620fa16a3c6		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			639b108f-441d-42da-b70c-8c8ad5c82b59			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
52f701a0-a326-4453-862a-3a66ce26fccd		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			daeab445-316a-4126-b293-90801b9c7095			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
56451ed7-6ead-4d78-88e5-901f2b5a7c3e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			75468752-63ef-4168-851c-16d412e914f2			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
8ef03413-b218-460a-ac00-8cbd14913027		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			fc4fd552-a9b7-4f3b-9b79-9e2897c24f3c	M		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
4a7120ab-567d-4c48-8953-afdf05858058		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			4cfa09b5-9ef1-42e4-8547-323a3bcfbab0	M		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
f0f202ad-5f4b-4483-826d-051d3620cbd1		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			354862fb-59ff-4011-891d-f086f00f0dfc	M		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
c7c71daf-4704-4a1b-9964-649e4498bf17		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ecd9a0ad-2a4b-4c82-9b0d-47f7546789b1	M		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
bf3d3164-28f7-41ae-bef2-38010a82d595		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			cc28e019-aacf-4c6e-a01f-ba8b133c0c13	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
cf2a160b-8983-434f-928c-1a26f6d65fab		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			b2ee698e-9cf4-466a-b77a-dc1fc1248f09	F		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
87c467f2-d310-45f4-9e29-95376bfce3ac		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			6726f829-3a6b-468a-8598-d110db053581	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		M
113b8800-6024-4e57-a4a4-03032cb05ed4		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			951600aa-de78-42c4-8ee6-f5de9769e7de	F		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B
68547eb9-6cf8-46e3-ad80-b0d8c222f0d4		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			1497ac1f-2778-47d8-a85d-2f8d1d3d63cd	M		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
7f941b08-4eb0-4092-bbe4-5c0441120767		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2324adbc-9849-45a5-9b3d-5f2434cc0a47	F		\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
1e67c112-b220-4423-b696-50d39c1c125d		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			8aecb88b-9f44-46de-9eb7-3e542fd8ad4a	M		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
5ea6cb9a-736c-429c-87b1-5bcf000ec2cb		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			9aa96533-394a-4575-9b76-9b857e6c60dd	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
064ef73f-3c98-45f7-b3cf-830b2e9ca695		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			546e571d-6b58-4800-a70b-4c9dfad064e0	M		\N	\N	2000	\N	\N	f	t	t	t	f	f	f		B M
93d59f34-0fda-4226-976a-19bd657a7de7		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			1f3fdda2-c8c8-4964-8091-a9b1530695b1	M		\N	\N	2000	\N	\N	f	t	t	t	f	f	f		B M
0042c21a-67ae-4349-9e84-e53a418d16a7		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f8ef1a9d-736e-48fe-9dcf-5d60f487910d	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
ee13eef3-7262-4e8c-b665-5efaedcbeba3		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			45e5c215-e0a2-45af-94d7-0531fbab7449	M		\N	\N	2000	\N	\N	f	t	t	t	f	f	f		B M
eb3ff24a-fcac-4fe2-8abe-6b224efcc394		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			d5bd381b-8fec-41a6-b91d-417797f4db97	F		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
b53e0418-84e7-47a5-b9ee-9fca75c31258		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			aa88ffa0-3a5c-4370-a13a-9768b8960b41	F		\N	\N	2000	\N	\N	f	t	t	t	f	f	f		B M
27a11c10-517d-4a9e-af3a-30b855758077		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			67b4a930-47dd-4f98-a93e-0e6fb9e7a66f	M		\N	\N	2000	\N	\N	f	t	t	t	f	f	f		B M
186d4e82-0031-4a98-b99f-974a82937cff		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			8681169b-fee7-4fa2-89a9-2f60e1d193c2	F		\N	\N	2000	0	\N	f	t	t	t	f	f	f		B M
dc839885-4e85-445d-a94a-f008550ea251		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			a856cbe6-2aae-4b51-bcf6-a87a04dab3a9	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
9ae7cada-1be5-461b-9818-5658a615302e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2238a605-8517-4640-acca-700891cfc402	M		\N	\N	2000	0	\N	f	t	f	t	f	f	f		B M
054e951c-f4fc-4ea8-a699-b53308c711ac		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			edde2450-5842-4d7a-a558-6848ee4e6b80	Y		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
31861a2d-1f09-4695-b1d9-95735cb7c525		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			189572a0-2938-4871-8ac9-b8b17b0a07d0	F		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
127795b5-0c40-4f09-926e-d240701e1e1f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			0a1d3dc7-d861-41fc-ac15-eb19ae9a1321	F		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
b43897bb-0c52-4d77-9ac4-e318c95fb8bf		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			9a17ea8a-fddf-4fc6-9d60-c4c1c271ec97	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
674e8234-c13b-4f80-9ea4-3d3ce109dc39		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			fbd79a6d-fc5f-4ba6-ad94-de32e4e54f16	M		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
0b7f07ce-b4db-4918-8221-9e183aa5abfe		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ffdac061-0918-4822-ad28-51c51d07caba	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
f9041a06-a62e-42c8-9bc4-59d82fd8e0be		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			64f29b22-5281-4d61-82f0-d7e0cb5c4021	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
a33420e7-0d3e-410a-bae7-92e550365e82		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f89e0252-3df2-40d1-b9f9-b7ef40ab966d	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
9f7104c7-2487-46a4-9504-ad59bd9ba519		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			a78d29b5-cadf-464d-b99c-710c4602e63a	M		\N	\N	\N	\N	\N	f	t	t	t	f	f	f	B M	
8cb66f21-cd27-4871-9232-65c4815b4328		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			0b71dcca-b646-4f43-8279-8e14a04ede2a	F		\N	\N	1994	\N	\N	f	t	t	t	f	f	f		B M
b4cfeb97-31cb-446d-8036-604f40a8a39a		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			63dde18a-b526-4653-82f1-37c4ee3c57f6	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
a55fce73-ad18-45fa-b727-251b76bd62f5		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			83b179a1-2de3-42ad-8ccc-8d48ae137751	M		\N	\N	1994	\N	\N	f	t	f	t	f	f	f	B M	
6c40a5ec-c7e2-45a9-94ab-06ea403a7da2		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f3350ebc-3158-4c8b-9d1d-945d927415d4	F		\N	\N	1994	\N	\N	f	t	f	t	f	f	f		B M
1d99b966-61f3-48b8-bb6c-0849a068fd9c		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			d8ffc5e4-84e7-4aca-b76e-c696a32fbcd6		SUBADULT	\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
b05381ba-54cc-4610-8716-76b45c6f9a26		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			e448b38b-31a8-4e62-bebc-503ce50053aa			\N	\N	2000	\N	\N	f	t	f	f	f	f	f		
56dedc6d-c276-4d56-8ba0-3a9af9650a56		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			5ab7d487-adaf-4ce7-81bc-1bf0b31b26c3			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
ee4c340c-577f-4e74-ad66-24d3a2f4e22d		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			cd6e5f95-1696-45c3-ad4f-466df26136cd			\N	\N	2000	\N	\N	f	t	f	f	f	f	f		
0112cba9-59df-4cab-b4d2-41d43ab9c93e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			2a690117-df88-43eb-bdd1-5693dff2f192			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
5d5f17ab-b9a1-432e-8546-4351f0227c4a		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			523e7141-55a6-4565-b097-0939345bf0fa			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
f43a1090-80b4-43fb-8e0c-cd0d6a8da858		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7f75abe5-1000-4a61-a65d-6d793d070ac1			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
cc48e74f-0c9b-4b0e-bbb8-2f83e34d0075		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			0f4930bb-746f-45ed-9e3e-e09cdd81aa7b			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
06e8dcbb-4b51-4641-9f3d-ecd95b6747e6		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			94eb8d9a-5b30-415e-90f2-4b497cab9a25			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
9182b317-9c05-4ed0-b531-6a917924a94e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			96d9bb5f-9e05-4112-8c6d-1614e9d45be2			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
d24b30e6-51c4-4da4-9c92-e51e574aa863		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			cdfbee62-21d7-4495-bbfe-965610515392			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
6b310d4e-073d-4069-ad45-db9aa098fcc0		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			5f4983b7-86a6-4a3d-878c-e99eb2e73fdc			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
31092931-1d35-4e6c-8d92-cfd12a2973d9		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			84ec6f73-50e4-4c53-a2cf-f7eeb3af43cf			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
7fe8b3d0-54fc-42ef-9d76-c01b016004b7		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			1a248bef-b01b-470a-9ac9-75d2032a5174	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
1aa0c143-9b08-48ed-b570-427d2bbc613e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			a841dbac-340b-45b8-a337-feaf82bc4e4a	M		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		M
d16993b5-9dad-496c-8247-c26163213164		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			77c88ae7-5fb2-40c2-a14c-75e52df77870	M		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		M
bb3c998f-47ce-42af-9f47-fc23a3e7d929		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			d5cba57d-d390-446f-8d5e-428dc755e0f8	F		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
161db91d-ddce-4976-82e3-f87e0b7974e0		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			33b0e82d-7378-4ac3-8f21-4c3ac05e3557	F		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
bef297b5-fdcf-40e5-997e-ad0d49183f41		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			bd7e54d6-dc93-4dfd-bbf5-fa2c03897af1	F		\N	\N	\N	\N	\N	f	t	t	f	f	f	f		
88e742d9-3061-4ee9-8dec-2ad52ef59617		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			47b47fc0-7e23-4e13-af80-dd4d869b07cc		CHILD	\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
7f7a8966-5224-4df5-80dc-c8188d27e8e6		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f8ae9c87-8f94-48b2-91a0-1ded77135c2a	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
1962ecfc-3245-40c5-998c-3884121c05e4		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ceff6d7b-df35-47d1-81ce-1805dc3896f5	F		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
90141d58-1d06-4232-bec8-9ebcb7fcf42a		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			b3dd7341-3f08-4b70-b7c1-6f88386b618c	F		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
a4585128-7723-4706-9c76-7dc94552aee5		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			c5f3aed2-9391-4ae4-b2ca-e2cf0957f6e9	F		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
7b7d39da-fc2b-4696-968f-2a44038d7c27		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			3e1bf414-67f3-4e83-bd6f-803dff798ecb	F		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		M
29400b54-9af7-43ba-a029-18fa2d5ff0a2		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			1d3e8790-3942-4082-b0c9-3992c5e06684	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
2b2a7949-a5c8-4b54-b981-dd2319ff3402		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f9382f1d-4d98-4b09-93f4-5e514a556122	M		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
7ab86f0c-9645-40ed-b811-4d859ce895c0		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			f6cf58d2-268d-4d06-9dc9-b3bbc7f60613	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
e320113a-04c7-4d70-ace8-6370de05c64b		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			326692b0-50e3-4e96-9728-466361dcbe39	F		\N	\N	\N	\N	\N	f	t	f	t	f	f	f		B M
02d48a5c-ad73-409c-82ab-1eb3fbfa24da		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			8204704f-4df6-42b8-9bab-e74e0829796c	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
02d7e498-0ae8-4152-a13b-59146d1519e7		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			3ea3f8bd-8f6a-4ab4-9e46-be00f34fbefe	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
a3f8d2f2-c5ae-4fe1-9857-ecd581b832c8		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			3353bf5e-cc5f-4e5d-9366-175e539e7ddc	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
69360b3e-73d7-4941-9aa2-2e982c916026		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			b9fae272-6705-4326-9766-6d1680575ffa	M		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
61321324-00bf-4ec0-8076-f5d6d254eefc		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			38b1a8aa-5072-43bf-95c9-ed60dc4acd22	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
5de45755-de6a-4411-af9b-4e2afb972e04		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			d71145d5-d3f1-486e-ace3-4b6f0fb808b4	M		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
40c4705e-a88b-45ca-bfe7-dc49eb399a6e		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			38aaa6a0-74ed-4f80-9dcc-e29f325dfc48	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
2725cf3b-96d0-425f-8ede-45dcc8ef70fe		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			d13cbf29-3dee-4c44-b338-2addff93f12d	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
42ebf5f2-982e-4aa8-8199-c7b166dce9f9		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			33416e53-122b-46ec-86b5-301a2766fe85	F		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
9a627c0e-a386-45e5-b5c1-eca20f900bc2		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			32482789-c995-4258-97be-f288b85ddbe7			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
c23a60f6-1485-49f1-aa53-ede348b7440f		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			95d8cf2c-b4ce-4f45-b49f-928abc0eb7c9			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
c7dc0e43-406f-4070-8f77-dd141f5eb342		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			1f675148-0d25-4070-bbb8-667607637846			\N	\N	2000	\N	\N	f	t	f	f	f	f	f		
66606c6b-3d6c-4aef-9d7a-823f62eec064		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			078c6900-fb51-4b40-857a-8a49ded50147			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
cf40f147-551b-4cf2-94ef-8cd0d56b6bb5		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			7333a417-e9a1-4f60-b0d6-d8f622340673	M		\N	\N	\N	\N	\N	f	t	t	t	f	f	f		B M
84057dc1-991e-4204-ba66-5c8a794e0afe		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			4c16172b-6af6-4d78-bb91-17f13a54cb57			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
e08f8ef8-f775-44e7-8ae4-ed4c75381aa9		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ff8a1373-35fc-45c9-ab17-e72fc221a0a1			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
5d39d1fd-aa1c-410c-8594-6ba8f2a7fd00		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			b00b07ec-acde-40d0-9cad-d0447dd0d417			\N	\N	1994	\N	\N	f	t	f	f	f	f	f		
b858e9a9-b483-4d6c-aae8-48138d1c3deb		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			48dc7d5a-3ea8-4ba7-8c41-f1006eef9d76			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
3d9a6694-0722-4229-8757-dfc753500788		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			c137c78c-6b74-41d4-9b96-3d69adb04d5d			\N	\N	1994	0	\N	f	f	f	f	f	f	f		
3a0c233b-c4b3-4809-b9c3-a85c980d56bf		\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N			ac4edf78-a0a1-43bd-ad73-9e7eebb4ca94			\N	\N	\N	\N	\N	f	t	f	f	f	f	f		
\.


--
-- Data for Name: tibia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tibia (tibia_id, tibia_length, burial_id) FROM stdin;
8cfc74b2-543b-47be-bf00-5c7c8177fa52	39.4	c00a4576-383a-4f92-bb12-15a29c49f507
a202c158-1f4b-4777-b71b-071a665aa6ff	35	21f4d50f-62e9-4390-84d9-da42b0b08980
284f8ce6-a333-471b-a36c-8f4fe2bef0fa	36	cfa91b40-5db4-42a1-bed5-094a4818592d
52f29726-5e94-40e0-9805-37efd6e29fb3	38	496df30f-fe73-4a01-bde7-13a197ed3746
3b72c056-0b70-4011-bf6c-75f7ae5ed64a	38.5	44f9d4a8-bca2-4ebd-8fb1-31326d62d6e9
da491ed3-61b3-47b1-9991-3870f91c6430	34.4	0a048a5d-151a-48ab-a027-ebf29d671ead
\.


--
-- Name: bio_sample bio_samples_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bio_sample
    ADD CONSTRAINT bio_samples_pkey PRIMARY KEY (sample_id);


--
-- Name: burial burials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.burial
    ADD CONSTRAINT burials_pkey PRIMARY KEY (burial_id);


--
-- Name: carbon_dating_analysis carbon_dating_analyses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carbon_dating_analysis
    ADD CONSTRAINT carbon_dating_analyses_pkey PRIMARY KEY (carbon14_id);


--
-- Name: femur femurs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.femur
    ADD CONSTRAINT femurs_pkey PRIMARY KEY (femur_id);


--
-- Name: humerus humeri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.humerus
    ADD CONSTRAINT humeri_pkey PRIMARY KEY (humerus_id);


--
-- Name: location locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);


--
-- Name: pelvis pelves_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pelvis
    ADD CONSTRAINT pelves_pkey PRIMARY KEY (pelvis_id);


--
-- Name: skull skulls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skull
    ADD CONSTRAINT skulls_pkey PRIMARY KEY (skull_id);


--
-- Name: tibia tibias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tibia
    ADD CONSTRAINT tibias_pkey PRIMARY KEY (tibia_id);


--
-- Name: bio_sample bio_samples_burial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bio_sample
    ADD CONSTRAINT bio_samples_burial_id_fkey FOREIGN KEY (burial_id) REFERENCES public.burial(burial_id);


--
-- Name: burial burials_femur_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.burial
    ADD CONSTRAINT burials_femur_id_fkey FOREIGN KEY (femur_id) REFERENCES public.femur(femur_id);


--
-- Name: burial burials_humerus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.burial
    ADD CONSTRAINT burials_humerus_id_fkey FOREIGN KEY (humerus_id) REFERENCES public.humerus(humerus_id);


--
-- Name: burial burials_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.burial
    ADD CONSTRAINT burials_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(location_id);


--
-- Name: burial burials_pelvis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.burial
    ADD CONSTRAINT burials_pelvis_id_fkey FOREIGN KEY (pelvis_id) REFERENCES public.pelvis(pelvis_id);


--
-- Name: burial burials_skull_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.burial
    ADD CONSTRAINT burials_skull_id_fkey FOREIGN KEY (skull_id) REFERENCES public.skull(skull_id);


--
-- Name: burial burials_tibia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.burial
    ADD CONSTRAINT burials_tibia_id_fkey FOREIGN KEY (tibia_id) REFERENCES public.tibia(tibia_id);


--
-- Name: carbon_dating_analysis carbon_dating_analyses_sample_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carbon_dating_analysis
    ADD CONSTRAINT carbon_dating_analyses_sample_id_fkey FOREIGN KEY (sample_id) REFERENCES public.bio_sample(sample_id);


--
-- Name: femur femurs_burial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.femur
    ADD CONSTRAINT femurs_burial_id_fkey FOREIGN KEY (burial_id) REFERENCES public.burial(burial_id);


--
-- Name: humerus humeri_burial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.humerus
    ADD CONSTRAINT humeri_burial_id_fkey FOREIGN KEY (burial_id) REFERENCES public.burial(burial_id);


--
-- Name: pelvis pelves_burial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pelvis
    ADD CONSTRAINT pelves_burial_id_fkey FOREIGN KEY (burial_id) REFERENCES public.burial(burial_id);


--
-- Name: skull skulls_burial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skull
    ADD CONSTRAINT skulls_burial_id_fkey FOREIGN KEY (burial_id) REFERENCES public.burial(burial_id);


--
-- Name: tibia tibias_burial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tibia
    ADD CONSTRAINT tibias_burial_id_fkey FOREIGN KEY (burial_id) REFERENCES public.burial(burial_id);


--
-- PostgreSQL database dump complete
--

