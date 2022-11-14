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
2	chicken
3	meat
4	fish
5	snack
6	salad
7	dessert
8	sea food
9	soup
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: vpusihwbpvbaxr
--

COPY public.images (id, url, "recipeId") FROM stdin;
\.


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: vpusihwbpvbaxr
--

COPY public.ingredients (id, name) FROM stdin;
1	pancetta
2	pecorino cheese
3	unsalted butter
4	parmesan
5	spaghetti
6	large eggs
7	plump garlic cloves, peeled and left whole
8	sea salt and freshly ground black pepper
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: vpusihwbpvbaxr
--

COPY public.recipes (id, "userId", name, serves, "prepTime", method, "createdAt") FROM stdin;
\.


--
-- Data for Name: recipes/categories; Type: TABLE DATA; Schema: public; Owner: vpusihwbpvbaxr
--

COPY public."recipes/categories" (id, "recipeId", "categoryId") FROM stdin;
\.


--
-- Data for Name: recipes/ingredients; Type: TABLE DATA; Schema: public; Owner: vpusihwbpvbaxr
--

COPY public."recipes/ingredients" (id, "recipeId", "ingredientId", quantity) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: vpusihwbpvbaxr
--

COPY public.sessions (id, "userId", token, "createdAt", "closedAt") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vpusihwbpvbaxr
--

COPY public.users (id, name, email, password, "createdAt") FROM stdin;
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public.categories_id_seq', 9, true);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public.images_id_seq', 2, true);


--
-- Name: images_recipeId_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public."images_recipeId_seq"', 1, false);


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 8, true);


--
-- Name: recipes/categories_categoryId_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public."recipes/categories_categoryId_seq"', 1, false);


--
-- Name: recipes/categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public."recipes/categories_id_seq"', 3, true);


--
-- Name: recipes/categories_recipeId_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public."recipes/categories_recipeId_seq"', 1, false);


--
-- Name: recipes/ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public."recipes/ingredients_id_seq"', 16, true);


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

SELECT pg_catalog.setval('public.recipes_id_seq', 3, true);


--
-- Name: recipes_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public."recipes_userId_seq"', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vpusihwbpvbaxr
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, true);


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
    ADD CONSTRAINT images_fk0 FOREIGN KEY ("recipeId") REFERENCES public.recipes(id) ON DELETE CASCADE;


--
-- Name: recipes/ingredients receipe/ingredients_fk0; Type: FK CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public."recipes/ingredients"
    ADD CONSTRAINT "receipe/ingredients_fk0" FOREIGN KEY ("recipeId") REFERENCES public.recipes(id) ON DELETE CASCADE;


--
-- Name: recipes/ingredients receipe/ingredients_fk1; Type: FK CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public."recipes/ingredients"
    ADD CONSTRAINT "receipe/ingredients_fk1" FOREIGN KEY ("ingredientId") REFERENCES public.ingredients(id) ON DELETE CASCADE;


--
-- Name: recipes/categories recipes/categories_fk0; Type: FK CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public."recipes/categories"
    ADD CONSTRAINT "recipes/categories_fk0" FOREIGN KEY ("recipeId") REFERENCES public.recipes(id) ON DELETE CASCADE;


--
-- Name: recipes/categories recipes/categories_fk1; Type: FK CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public."recipes/categories"
    ADD CONSTRAINT "recipes/categories_fk1" FOREIGN KEY ("categoryId") REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: recipes recipes_fk0; Type: FK CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: vpusihwbpvbaxr
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


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

