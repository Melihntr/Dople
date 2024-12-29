--
-- PostgreSQL database dump
--

-- Dumped from database version 15.7
-- Dumped by pg_dump version 16.3

-- Started on 2024-12-29 14:21:48

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
-- TOC entry 215 (class 1259 OID 17339)
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    latitude double precision,
    longitude double precision,
    capital character varying(255)
);


ALTER TABLE public.country OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17338)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_id_seq OWNER TO postgres;

--
-- TOC entry 3336 (class 0 OID 0)
-- Dependencies: 214
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.country.id;


--
-- TOC entry 217 (class 1259 OID 17409)
-- Name: guess; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guess (
    id bigint NOT NULL,
    gameid bigint,
    playerguess character varying(255),
    distance double precision,
    guessnumber integer,
    country_id bigint NOT NULL,
    game_id bigint,
    guess_number integer NOT NULL,
    player_guess character varying(255)
);


ALTER TABLE public.guess OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17408)
-- Name: guess_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.guess_id_seq OWNER TO postgres;

--
-- TOC entry 3337 (class 0 OID 0)
-- Dependencies: 216
-- Name: guess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guess_id_seq OWNED BY public.guess.id;


--
-- TOC entry 3178 (class 2604 OID 17366)
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- TOC entry 3179 (class 2604 OID 17420)
-- Name: guess id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guess ALTER COLUMN id SET DEFAULT nextval('public.guess_id_seq'::regclass);


--
-- TOC entry 3328 (class 0 OID 17339)
-- Dependencies: 215
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name, latitude, longitude, capital) FROM stdin;
149	Sao Tome and Principe	0.33768	6.73053	Sao Tome City
189	Vatican City	41.906487	12.453641	Vatican
161	South Korea	35.8385	128.55227	Seoul
181	Uganda	0.31354	32.56779	Kampala
182	Ukraine	50.44876	30.48994	Kiev
183	United Arab Emirates	25.21261	55.27614	Abu Dhabi
184	United Kingdom	53.40902	-2.99005	London
186	Uruguay	-34.89779	-56.18322	Montevideo
14	Bangladesh	23.685	90.3563	Dhaka
187	Uzbekistan	39.65608	66.9584	Tashkent
190	Venezuela	10.49195	-66.8481	Caracas
191	Vietnam	21.03047	105.84211	Hanoi
194	Zimbabwe	-17.82713	31.05066	Harare
38	Comoros	-11.875	43.8722	Moroni
58	Fiji	-17.7134	178.065	Suva
61	Gabon	-0.8037	11.6094	Libreville
26	Bulgaria	42.70705	23.31268	Sofia
82	Italy	43.7752	11.24612	Rome
79	Iraq	33.32063	44.35408	Baghdad
2	Albania	41.33255	19.8099	Tirana
3	Algeria	36.73272	3.04675	Algiers
4	Andorra	42.50752	1.52755	Andorra la Vella
5	Angola	-8.82247	13.23057	Luanda
10	Austria	47.80145	13.04479	Vienna
12	Bahamas	25.06801	-77.45283	Nassau
15	Barbados	13.05951	-59.50761	Bridgetown
16	Belarus	53.8738	27.52801	Minsk
18	Belize	17.50591	-88.1962	Belmopan
19	Benin	6.35102	2.42777	Porto-Novo
23	Botswana	-24.61652	25.87932	Gaborone
24	Brazil	-5.74945	-35.205	Brasília
25	Brunei	4.88713	114.94511	Bandar Seri Begawan
27	Burkina Faso	12.36851	-1.52754	Ouagadougou
28	Burundi	-3.38841	29.35094	Gitega
46	Denmark	57.04837	9.93891	Copenhagen
30	Cambodia	12.7115	104.88874	Phnom Penh
31	Cameroon	3.86521	11.51621	Yaoundé
35	Chile	-36.62041	-72.95245	Santiago
29	Cape Verde	17.0193	-25.0675	Praia
36	China	22.30745	114.18573	Beijing
37	Colombia	6.25489	-75.58797	Bogotá
94	Lesotho	-29.35394	27.50851	Maseru
40	Costa Rica	9.93833	-84.04862	San José
41	Croatia	45.81228	15.98697	Zagreb
49	Dominican Republic	18.45266	-69.93844	Santo Domingo
50	Ecuador	-2.15773	-79.91282	Quito
51	Egypt	30.03945	31.23047	Cairo
52	El Salvador	13.69663	-89.22956	San Salvador
55	Estonia	56.36321	25.58238	Tallinn
59	Finland	62.12972	25.66462	Helsinki
60	France	48.56047	1.03341	Paris
62	Gambia	13.4649	-16.69241	Banjul
63	Georgia	43.5124	39.86336	Tbilisi
64	Germany	53.54862	9.98213	Berlin
65	Ghana	5.54664	-0.20119	Accra
66	Greece	40.63093	22.95042	Athens
68	Guatemala	14.63232	-90.51379	Guatemala City
75	Iceland	64.1148	-21.9155	Reykjavik
76	India	26.91073	75.79791	New Delhi
77	Indonesia	-8.72948	115.16833	Jakarta
78	Iran	35.7689	51.37279	Tehran
80	Ireland	51.89788	-8.4762	Dublin
81	Israel	31.6905	34.57623	Jerusalem
83	Jamaica	18.02273	-76.7732	Kingston
84	Japan	34.68845	135.19864	Tokyo
85	Jordan	31.96863	35.91158	Amman
86	Kazakhstan	51.15366	71.4288	Astana
87	Kenya	-1.30121	36.8272	Nairobi
39	Congo	-4.79925	11.84586	Brazzaville
89	Kuwait	29.3843	47.98072	Kuwait City
90	Kyrgyzstan	42.87986	74.57393	Bishkek
92	Latvia	56.95353	24.00814	Riga
93	Lebanon	33.9253	35.58904	Beirut
95	Liberia	6.31408	-10.79804	Monrovia
97	Liechtenstein	47.21316	9.52248	Vaduz
98	Lithuania	54.89939	23.90988	Vilnius
99	Luxembourg	49.61403	6.1285	Luxembourg City
132	Palestine	31.90449	35.20518	Jerusalem
150	Saudi Arabia	24.73211	46.67355	Riyadh
151	Senegal	14.80375	-17.33759	Dakar
152	Serbia	44.79216	20.48496	Belgrade
153	Seychelles	-4.633	55.46279	Victoria
155	Singapore	1.129808	103.79758	Singapore
156	Slovakia	48.14946	17.1145	Bratislava
157	Slovenia	46.05815	14.5014	Ljubljana
160	South Africa	-33.92859	18.44553	Cape Town
112	Monaco	43.7333	7.4167	Monaco
163	Spain	40.42651	-3.7058	Madrid
164	Sri Lanka	6.94182	79.86035	Kolombo
167	Sweden	57.70729	11.97006	Stockholm
168	Switzerland	46.94896	7.44986	Bern
172	Thailand	13.75681	100.49831	Thimphu
177	Tunisia	36.80851	10.18295	Tunis
185	United States	33.75833	-84.39057	Washington DC
147	Samoa	-13.759	-172.1046	Apia
148	San Marino	43.9333	12.45	San Marino
113	Mongolia	47.91753	106.92221	Ulaanbaatar
178	Turkey	37.0202	35.26029	Ankara
74	Hungary	47.50057	19.05483	Budapest
1	Afghanistan	34.52572	69.17722	Kabul
6	Antigua and Barbuda	17.12711	-61.84692	Saint John's
7	Argentina	-37.97855	-54.54577	Buenos Aires
8	Armenia	40.17946	44.50591	Yerevan
9	Australia	-31.94993	115.8588	Canberra
11	Azerbaijan	40.3952	49.86096	Baku
13	Bahrain	26.2379	50.57044	Manama
17	Belgium	51.06012	3.7151	Brussels
20	Bhutan	27.47999	89.63877	Thimphu
21	Bolivia	-16.48673	-68.18465	Sucre
22	Bosnia and Herzegovina	43.85844	18.39834	Sarajevo
32	Canada	45.55209	-73.66632	Ottawa
42	Cuba	23.14684	-82.35785	Havana
43	Cyprus	35.15755	33.35783	Nicosia
44	Czech Republic	50.10346	14.43208	Prague
56	Eswatini	-26.49941	31.37572	Eswatini
91	Laos	18.40616	102.42608	Vientiane
102	Malaysia	3.14542	101.69794	Kuala Lumpur
105	Malta	35.89687	14.47571	Valletta
109	Mexico	21.13374	-101.7074	Mexico City
111	Moldova	47.02385	28.83355	Chisinau
114	Montenegro	42.77978	18.95576	Podgorica
115	Morocco	33.60896	-7.56742	Rabat
117	Myanmar	21.97936	96.09898	Naypyidaw
118	Namibia	-22.56795	17.08553	Windhoek
120	Nepal	27.71521	85.32717	Kathmandu
121	Netherlands	52.35376	4.86732	Amsterdam
122	New Zealand	-41.23631	174.79637	Wellington
125	Nigeria	6.51832	3.35192	Abuja
127	North Macedonia	41.99242	21.42675	Skopje
128	Norway	58.1555	8.01482	Oslo
129	Oman	23.60209	58.39047	Muscat
130	Pakistan	33.6516	72.96816	Islamabad
133	Panama	8.98229	-79.52005	Panama City
135	Paraguay	-25.29547	-57.58147	Asunción
136	Peru	-12.04604	-77.03152	Lima
137	Philippines	15.05814	120.65789	Manila
138	Poland	53.12367	18.00592	Warsaw
139	Portugal	38.69507	-9.21512	Lisbon
140	Qatar	25.34917	51.50687	Doha
141	Romania	44.43181	26.10175	Bucharest
142	Russia	59.93157	30.35757	Moscow
143	Rwanda	-1.94627	30.05992	Kigali
\.


--
-- TOC entry 3330 (class 0 OID 17409)
-- Dependencies: 217
-- Data for Name: guess; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guess (id, gameid, playerguess, distance, guessnumber, country_id, game_id, guess_number, player_guess) FROM stdin;
\.


--
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 214
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 194, true);


--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 216
-- Name: guess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guess_id_seq', 203, true);


--
-- TOC entry 3181 (class 2606 OID 17368)
-- Name: country countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 3183 (class 2606 OID 17422)
-- Name: guess guess_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guess
    ADD CONSTRAINT guess_pkey PRIMARY KEY (id);


--
-- TOC entry 3184 (class 2606 OID 17415)
-- Name: guess guess_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guess
    ADD CONSTRAINT guess_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(id);


-- Completed on 2024-12-29 14:21:48

--
-- PostgreSQL database dump complete
--

