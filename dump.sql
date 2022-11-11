--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-2.pgdg20.04+2)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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

--
-- Name: heroku_ext; Type: SCHEMA; Schema: -; Owner: u6ksc93pa02lph
--

CREATE SCHEMA heroku_ext;


ALTER SCHEMA heroku_ext OWNER TO u6ksc93pa02lph;

--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA heroku_ext;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.categories OWNER TO vpusihwbpvbaxr;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO vpusihwbpvbaxr;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE TABLE public.images (
    id integer NOT NULL,
    url text NOT NULL,
    "recipeId" integer NOT NULL
);


ALTER TABLE public.images OWNER TO vpusihwbpvbaxr;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO vpusihwbpvbaxr;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- Name: images_recipeId_seq; Type: SEQUENCE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE SEQUENCE public."images_recipeId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."images_recipeId_seq" OWNER TO vpusihwbpvbaxr;

--
-- Name: images_recipeId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER SEQUENCE public."images_recipeId_seq" OWNED BY public.images."recipeId";


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE TABLE public.ingredients (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.ingredients OWNER TO vpusihwbpvbaxr;

--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE SEQUENCE public.ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_id_seq OWNER TO vpusihwbpvbaxr;

--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;


--
-- Name: ingredients_name_seq; Type: SEQUENCE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE SEQUENCE public.ingredients_name_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_name_seq OWNER TO vpusihwbpvbaxr;

--
-- Name: ingredients_name_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER SEQUENCE public.ingredients_name_seq OWNED BY public.ingredients.name;


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE TABLE public.recipes (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    name character varying(255) DEFAULT NULL::character varying NOT NULL,
    serves integer NOT NULL,
    "prepTime" integer NOT NULL,
    method text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.recipes OWNER TO vpusihwbpvbaxr;

--
-- Name: recipes/categories; Type: TABLE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE TABLE public."recipes/categories" (
    id integer NOT NULL,
    "recipeId" integer NOT NULL,
    "categoryId" integer NOT NULL
);


ALTER TABLE public."recipes/categories" OWNER TO vpusihwbpvbaxr;

--
-- Name: recipes/categories_categoryId_seq; Type: SEQUENCE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE SEQUENCE public."recipes/categories_categoryId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."recipes/categories_categoryId_seq" OWNER TO vpusihwbpvbaxr;

--
-- Name: recipes/categories_categoryId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER SEQUENCE public."recipes/categories_categoryId_seq" OWNED BY public."recipes/categories"."categoryId";


--
-- Name: recipes/categories_id_seq; Type: SEQUENCE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE SEQUENCE public."recipes/categories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."recipes/categories_id_seq" OWNER TO vpusihwbpvbaxr;

--
-- Name: recipes/categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER SEQUENCE public."recipes/categories_id_seq" OWNED BY public."recipes/categories".id;


--
-- Name: recipes/categories_recipeId_seq; Type: SEQUENCE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE SEQUENCE public."recipes/categories_recipeId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."recipes/categories_recipeId_seq" OWNER TO vpusihwbpvbaxr;

--
-- Name: recipes/categories_recipeId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER SEQUENCE public."recipes/categories_recipeId_seq" OWNED BY public."recipes/categories"."recipeId";


--
-- Name: recipes/ingredients; Type: TABLE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE TABLE public."recipes/ingredients" (
    id integer NOT NULL,
    "recipeId" integer NOT NULL,
    "ingredientId" integer NOT NULL,
    quantity character varying(100)
);


ALTER TABLE public."recipes/ingredients" OWNER TO vpusihwbpvbaxr;

--
-- Name: recipes/ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE SEQUENCE public."recipes/ingredients_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."recipes/ingredients_id_seq" OWNER TO vpusihwbpvbaxr;

--
-- Name: recipes/ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER SEQUENCE public."recipes/ingredients_id_seq" OWNED BY public."recipes/ingredients".id;


--
-- Name: recipes/ingredients_ingredientId_seq; Type: SEQUENCE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE SEQUENCE public."recipes/ingredients_ingredientId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."recipes/ingredients_ingredientId_seq" OWNER TO vpusihwbpvbaxr;

--
-- Name: recipes/ingredients_ingredientId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER SEQUENCE public."recipes/ingredients_ingredientId_seq" OWNED BY public."recipes/ingredients"."ingredientId";


--
-- Name: recipes/ingredients_recipeId_seq; Type: SEQUENCE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE SEQUENCE public."recipes/ingredients_recipeId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."recipes/ingredients_recipeId_seq" OWNER TO vpusihwbpvbaxr;

--
-- Name: recipes/ingredients_recipeId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER SEQUENCE public."recipes/ingredients_recipeId_seq" OWNED BY public."recipes/ingredients"."recipeId";


--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE SEQUENCE public.recipes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_id_seq OWNER TO vpusihwbpvbaxr;

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER SEQUENCE public.recipes_id_seq OWNED BY public.recipes.id;


--
-- Name: recipes_userId_seq; Type: SEQUENCE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE SEQUENCE public."recipes_userId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."recipes_userId_seq" OWNER TO vpusihwbpvbaxr;

--
-- Name: recipes_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER SEQUENCE public."recipes_userId_seq" OWNED BY public.recipes."userId";


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "closedAt" timestamp without time zone
);


ALTER TABLE public.sessions OWNER TO vpusihwbpvbaxr;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO vpusihwbpvbaxr;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: sessions_userId_seq; Type: SEQUENCE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE SEQUENCE public."sessions_userId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."sessions_userId_seq" OWNER TO vpusihwbpvbaxr;

--
-- Name: sessions_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER SEQUENCE public."sessions_userId_seq" OWNED BY public.sessions."userId";


--
-- Name: users; Type: TABLE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(50) NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.users OWNER TO vpusihwbpvbaxr;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: vpusihwbpvbaxr
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO vpusihwbpvbaxr;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: images recipeId; Type: DEFAULT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.images ALTER COLUMN "recipeId" SET DEFAULT nextval('public."images_recipeId_seq"'::regclass);


--
-- Name: ingredients id; Type: DEFAULT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);


--
-- Name: ingredients name; Type: DEFAULT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN name SET DEFAULT nextval('public.ingredients_name_seq'::regclass);


--
-- Name: recipes id; Type: DEFAULT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.recipes ALTER COLUMN id SET DEFAULT nextval('public.recipes_id_seq'::regclass);


--
-- Name: recipes userId; Type: DEFAULT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.recipes ALTER COLUMN "userId" SET DEFAULT nextval('public."recipes_userId_seq"'::regclass);


--
-- Name: recipes/categories id; Type: DEFAULT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public."recipes/categories" ALTER COLUMN id SET DEFAULT nextval('public."recipes/categories_id_seq"'::regclass);


--
-- Name: recipes/categories recipeId; Type: DEFAULT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public."recipes/categories" ALTER COLUMN "recipeId" SET DEFAULT nextval('public."recipes/categories_recipeId_seq"'::regclass);


--
-- Name: recipes/categories categoryId; Type: DEFAULT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public."recipes/categories" ALTER COLUMN "categoryId" SET DEFAULT nextval('public."recipes/categories_categoryId_seq"'::regclass);


--
-- Name: recipes/ingredients id; Type: DEFAULT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public."recipes/ingredients" ALTER COLUMN id SET DEFAULT nextval('public."recipes/ingredients_id_seq"'::regclass);


--
-- Name: recipes/ingredients recipeId; Type: DEFAULT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public."recipes/ingredients" ALTER COLUMN "recipeId" SET DEFAULT nextval('public."recipes/ingredients_recipeId_seq"'::regclass);


--
-- Name: recipes/ingredients ingredientId; Type: DEFAULT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public."recipes/ingredients" ALTER COLUMN "ingredientId" SET DEFAULT nextval('public."recipes/ingredients_ingredientId_seq"'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: sessions userId; Type: DEFAULT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.sessions ALTER COLUMN "userId" SET DEFAULT nextval('public."sessions_userId_seq"'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: vpusihwbpvbaxr
--

COPY public.categories (id, name) FROM stdin;
1	pasta
2	meat
3	chicken
4	fish
5	sea food
6	soup
7	pizza
8	snack
9	dessert
10	salad
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: vpusihwbpvbaxr
--

COPY public.images (id, url, "recipeId") FROM stdin;
1	https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-1001491_11-2e0fa5c.jpg?quality=90&webp=true&resize=300,272	33
\.


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: vpusihwbpvbaxr
--

COPY public.ingredients (id, name) FROM stdin;
105	pancetta
106	large eggs
107	sea salt and freshly ground black pepper
108	spaghetti
109	unsalted butter
110	pecorino cheese
111	parmesan
112	plump garlic cloves, peeled and left whole
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: vpusihwbpvbaxr
--

COPY public.recipes (id, "userId", name, serves, "prepTime", method, "createdAt") FROM stdin;
33	1	Spaghetti Carbonara	4	20	STEP 1\nPut a large saucepan of water on to boil.\n\nSTEP 2\nFinely chop the 100g pancetta, having first removed any rind. Finely grate 50g pecorino cheese and 50g parmesan and mix them together.\n\nSTEP 3\nBeat the 3 large eggs in a medium bowl and season with a little freshly grated black pepper. Set everything aside.\n\nSTEP 4\nAdd 1 tsp salt to the boiling water, add 350g spaghetti and when the water comes back to the boil, cook at a constant simmer, covered, for 10 minutes or until al dente (just cooked).\n\nSTEP 5\nSquash 2 peeled plump garlic cloves with the blade of a knife, just to bruise it.\n\nSTEP 6\nWhile the spaghetti is cooking, fry the pancetta with the garlic. Drop 50g unsalted butter into a large frying pan or wok and, as soon as the butter has melted, tip in the pancetta and garlic.\n\nSTEP 7\nLeave to cook on a medium heat for about 5 minutes, stirring often, until the pancetta is golden and crisp. The garlic has now imparted its flavour, so take it out with a slotted spoon and discard.\n\nSTEP 8\nKeep the heat under the pancetta on low. When the pasta is ready, lift it from the water with a pasta fork or tongs and put it in the frying pan with the pancetta. Don’t worry if a little water drops in the pan as well (you want this to happen) and don’t throw the pasta water away yet.\n\nSTEP 9\nMix most of the cheese in with the eggs, keeping a small handful back for sprinkling over later.\n\nSTEP 10\nTake the pan of spaghetti and pancetta off the heat. Now quickly pour in the eggs and cheese. Using the tongs or a long fork, lift up the spaghetti so it mixes easily with the egg mixture, which thickens but doesn’t scramble, and everything is coated.\n\nSTEP 11\nAdd extra pasta cooking water to keep it saucy (several tablespoons should do it). You don’t want it wet, just moist. Season with a little salt, if needed.\n\nSTEP 12\nUse a long-pronged fork to twist the pasta on to the serving plate or bowl. Serve immediately with a little sprinkling of the remaining cheese and a grating of black pepper. If the dish does get a little dry before serving, splash in some more hot pasta water and the glossy sauciness will be revived.	2022-11-11 01:13:22.676349
\.


--
-- Data for Name: recipes/categories; Type: TABLE DATA; Schema: public; Owner: vpusihwbpvbaxr
--

COPY public."recipes/categories" (id, "recipeId", "categoryId") FROM stdin;
20	33	1
\.


--
-- Data for Name: recipes/ingredients; Type: TABLE DATA; Schema: public; Owner: vpusihwbpvbaxr
--

COPY public."recipes/ingredients" (id, "recipeId", "ingredientId", quantity) FROM stdin;
97	33	109	50g
98	33	112	2
99	33	111	50g
100	33	108	350g
101	33	105	100g
102	33	110	50g
103	33	106	3
104	33	107	\N
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: vpusihwbpvbaxr
--

COPY public.sessions (id, "userId", token, "createdAt", "closedAt") FROM stdin;
16	1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2ODAwNTc3MX0.uynXC0Rq1KpFDI5cIFMh924lH7ERpEoUpGondMXtbT0	2022-11-09 14:56:11.594119	2022-11-09 15:20:23.245563
17	1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2ODAwNzUzOX0.CYTZSIYByjlYUNX_b4qOX2EJjE33lbX84fyZNN5EWBU	2022-11-09 15:25:39.668217	2022-11-09 15:25:58.913433
18	1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2ODAwNzU2Nn0.8SIdNPb5ngICelaJ5164yZD2uorfhpP-1l2X2jhDH_I	2022-11-09 15:26:06.305429	2022-11-09 16:43:33.087202
19	1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2ODAxMjI1Nn0.q-wj2pTkd7ycf4u2CDQMVPt1tXxvs84wCO1ygCA0_9A	2022-11-09 16:44:17.132003	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vpusihwbpvbaxr
--

COPY public.users (id, name, email, password, "createdAt") FROM stdin;
1	Miguel	miguel@email.com	$2b$10$mlJaGPWi.p3bHeOOwQKM7OKdaFPxxmuV.Gs3xD.dR1t6XsVag9jXG	2022-11-09 14:13:26.343622
2	Luiza	luiza@email.com	$2b$10$x3KEFMHlHEi3t.MwkY9b9uHrZpr01iTPNyXhs45eVc2BrUsOvTiM2	2022-11-09 14:25:13.140915
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public.categories_id_seq', 11, true);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public.images_id_seq', 1, true);


--
-- Name: images_recipeId_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public."images_recipeId_seq"', 1, false);


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 112, true);


--
-- Name: ingredients_name_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public.ingredients_name_seq', 1, false);


--
-- Name: recipes/categories_categoryId_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public."recipes/categories_categoryId_seq"', 1, false);


--
-- Name: recipes/categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public."recipes/categories_id_seq"', 20, true);


--
-- Name: recipes/categories_recipeId_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public."recipes/categories_recipeId_seq"', 1, false);


--
-- Name: recipes/ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public."recipes/ingredients_id_seq"', 104, true);


--
-- Name: recipes/ingredients_ingredientId_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public."recipes/ingredients_ingredientId_seq"', 1, false);


--
-- Name: recipes/ingredients_recipeId_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public."recipes/ingredients_recipeId_seq"', 1, false);


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public.recipes_id_seq', 33, true);


--
-- Name: recipes_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public."recipes_userId_seq"', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public.sessions_id_seq', 19, true);


--
-- Name: sessions_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public."sessions_userId_seq"', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: categories categories_pk; Type: CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pk PRIMARY KEY (id);


--
-- Name: images images_pk; Type: CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pk PRIMARY KEY (id);


--
-- Name: ingredients ingredients_pk; Type: CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pk PRIMARY KEY (id);


--
-- Name: recipes/ingredients receipe/ingredients_pk; Type: CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public."recipes/ingredients"
    ADD CONSTRAINT "receipe/ingredients_pk" PRIMARY KEY (id);


--
-- Name: recipes/categories recipes/categories_pk; Type: CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public."recipes/categories"
    ADD CONSTRAINT "recipes/categories_pk" PRIMARY KEY (id);


--
-- Name: recipes recipes_pk; Type: CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: images images_fk0; Type: FK CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_fk0 FOREIGN KEY ("recipeId") REFERENCES public.recipes(id);


--
-- Name: recipes/categories recipes/categories_fk0; Type: FK CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public."recipes/categories"
    ADD CONSTRAINT "recipes/categories_fk0" FOREIGN KEY ("recipeId") REFERENCES public.recipes(id);


--
-- Name: recipes/categories recipes/categories_fk1; Type: FK CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public."recipes/categories"
    ADD CONSTRAINT "recipes/categories_fk1" FOREIGN KEY ("categoryId") REFERENCES public.categories(id);


--
-- Name: recipes/ingredients recipes/ingredients_fk0; Type: FK CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public."recipes/ingredients"
    ADD CONSTRAINT "recipes/ingredients_fk0" FOREIGN KEY ("recipeId") REFERENCES public.recipes(id);


--
-- Name: recipes/ingredients recipes/ingredients_fk1; Type: FK CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public."recipes/ingredients"
    ADD CONSTRAINT "recipes/ingredients_fk1" FOREIGN KEY ("ingredientId") REFERENCES public.ingredients(id);


--
-- Name: recipes recipes_fk0; Type: FK CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: SCHEMA heroku_ext; Type: ACL; Schema: -; Owner: u6ksc93pa02lph
--

GRANT USAGE ON SCHEMA heroku_ext TO vpusihwbpvbaxr;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: vpusihwbpvbaxr
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO vpusihwbpvbaxr;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO vpusihwbpvbaxr;


--
-- PostgreSQL database dump complete
--

