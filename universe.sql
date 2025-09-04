--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy_types; Type: TYPE; Schema: public; Owner: freecodecamp
--

CREATE TYPE public.galaxy_types AS ENUM (
    'spiral',
    'elliptical',
    'lenticular',
    'irregular'
);


ALTER TYPE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: planet_types; Type: TYPE; Schema: public; Owner: freecodecamp
--

CREATE TYPE public.planet_types AS ENUM (
    'terrestrial',
    'gas giant',
    'ice giant',
    'dwarf planet'
);


ALTER TYPE public.planet_types OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    average_temperature_in_celsius integer,
    galaxy_types public.galaxy_types,
    planet_types public.planet_types
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    average_temperature_in_celsius integer,
    galaxy_types public.galaxy_types,
    planet_types public.planet_types,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: moon_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_galaxy_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    average_temperature_in_celsius integer,
    galaxy_types public.galaxy_types,
    planet_types public.planet_types,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_galaxy_id_seq OWNED BY public.planet.planet_id;


--
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    life_expectancy integer
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_species_id_seq OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_species_id_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    average_temperature_in_celsius integer,
    galaxy_types public.galaxy_types,
    planet_types public.planet_types,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_galaxy_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_galaxy_id_seq'::regclass);


--
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_species_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', 'A galaxia que contem nosso sistema solar.', true, false, 13600, 0, -173, 'spiral', 'terrestrial');
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Galaxia gigante mais proxima da Via Lactea', false, NULL, 10000, 2.5, NULL, 'spiral', NULL);
INSERT INTO public.galaxy VALUES (4, 'Triangulo', 'Uma das menores galaxias do Grupo Local', false, NULL, 12000, 3, NULL, 'spiral', NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Conhecida por sua aparencia marcante, com um proeminente anel de poeira que a faz parecer um chapeu', false, NULL, 13250, 3, NULL, 'spiral', NULL);
INSERT INTO public.galaxy VALUES (6, 'Redemoinho', 'Galaxia classica e espetacular, famosa por seus bracos espirais bem definidos', false, NULL, 10600, 23, NULL, 'spiral', NULL);
INSERT INTO public.galaxy VALUES (7, 'Olho Negro', 'Famosa pela grande faixa de poeira escura que obscurece parte de seu nucleo brilhante', false, NULL, 13250, 24, NULL, 'spiral', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Lua', 'Unico satelite natural da Terra, com influencia nas mares e estabilizacao do eixo do planeta', false, NULL, 4500, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Fobos', 'Maior lua de Marte, irregular e proxima ao planeta', false, NULL, 4300, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Menor lua de Marte, também com forma irregular', false, NULL, 4300, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Lua vulcanicamente ativa, a mais geologicamente ativa do Sistema Solar', false, NULL, 4500, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Lua gelada, com oceano subterraneo possivelmente habitavel', false, NULL, 4500, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (6, 'Ganimedes', 'Maior lua do Sistema Solar, maior ate que Mercurio', false, NULL, 4500, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (7, 'Calisto', 'Superficie muito craterada, antiga e estavel', false, NULL, 4500, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (8, 'Amalteia', 'Lua irregular, uma das mais internas de Jupiter', false, NULL, 4500, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (9, 'Tita', 'Maior lua de Saturno, com atmosfera densa e lagos de metano liquido', false, NULL, 4500, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (10, 'Encelado', 'Lua gelada, com plumas de agua expelidas de seu interior', false, NULL, 4500, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (11, 'Mimas', 'Lua pequena, com uma cratera gigante que lembra a Estrela da Morte', false, NULL, 4500, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (12, 'Reia', 'Segunda maior lua de Saturno', false, NULL, 4500, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (13, 'Japeto', 'Lua com hemisferios de cores constratantes(um claro e outro escuro)', false, NULL, 4500, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 'Superficie com gelo e canions', false, NULL, 4500, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (15, 'Tetis', 'Grandes falhas tectonicas', false, NULL, 4500, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (16, 'Hiperion', 'Lua irregular e porosa', false, NULL, 4500, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (17, 'Febe', 'Lua capturada, orbita retrograda', false, NULL, 4500, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (18, 'Titania', 'Maior lua de Urano', false, NULL, 4500, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (19, 'Himalia', 'Grande lua irregular', false, NULL, 4500, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (20, 'Elara', 'Lua irregular do grupo Himalia', false, NULL, 4500, NULL, NULL, NULL, NULL, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 'Planeta rochoso, o mais proximo do Sol', false, true, 4500, 0.0000063, 167, NULL, 'terrestrial', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Planeta rochoso, com atmosfera densa e efeito estufa extremo', false, true, 4500, 0.0000027, 464, NULL, 'terrestrial', 1);
INSERT INTO public.planet VALUES (3, 'Terra', 'Planeta rochoso, unico com vida confirmada', true, true, 4540, 0, 15, NULL, 'terrestrial', 1);
INSERT INTO public.planet VALUES (4, 'Marte', 'Planeta rochoso, conhecido como "Planeta Vermelho"', false, true, 4500, 0.0000057, -60, NULL, 'terrestrial', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gigante gasoso, maior planeta do Sistema Solar', false, true, 4500, 0.000082, -108, NULL, 'gas giant', 1);
INSERT INTO public.planet VALUES (6, 'Saturno', 'Gigante gasoso com aneis espetaculares', false, true, 4500, 0.00015, -139, NULL, 'gas giant', 1);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri b', 'Exoplaneta rochoso, na zona habitavel da estrela', false, true, 4800, 4.24, 15, NULL, 'terrestrial', 5);
INSERT INTO public.planet VALUES (8, 'Proxima Centauri d', 'Exoplaneta pequeno e rochoso, muito proximo da estrela', false, true, 4800, 4.24, 100, NULL, 'terrestrial', 5);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 'Exoplaneta na zona habitavel, maior que a Terra', false, true, 4000, 600, 22, NULL, 'terrestrial', 1);
INSERT INTO public.planet VALUES (10, 'Trappist-1e', 'Exoplaneta rochoso na zona habitavel, proximo ao tamanho da Terra', false, true, 7600, 39, 10, NULL, 'terrestrial', 1);
INSERT INTO public.planet VALUES (11, 'Wasp-12b', 'Jupiter quente em orbita extremamente proxima de sua estrela', false, true, 2000, 1400, 2200, NULL, 'gas giant', 1);
INSERT INTO public.planet VALUES (12, 'HD 189733b', 'Exoplaneta gigante com ventos violentos e chuva de vidro', false, true, 1500, 64.5, 1200, NULL, 'gas giant', 1);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 'Homo Sapiens', 'Especie dominante da Terra', 80);
INSERT INTO public.species VALUES (2, 'Aeroflora kepleris', 'Organismos fotossinteticos flutuantes', 200);
INSERT INTO public.species VALUES (3, 'Lithovore centaurian', 'Especie semelhante a fungos ou liquens', 300);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Estrela ana amarela, centro do Sistema Solar', false, true, 4600, 0.0000158, 5500, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Sirius A', 'Estrela binaria brilhante, a mais luminosa do ceu noturno', false, true, 250, 8.6, 9940, NULL, NULL, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Supergigante vermelha da constelacao Orion', false, true, 9, 642, 3500, NULL, NULL, 1);
INSERT INTO public.star VALUES (4, 'Riguel', 'Supergigante azul da constelacao Orion, muito mais massiva que o Sol', false, true, 8, 860, 11000, NULL, NULL, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Ana vermelha, estrela mais proxima do Sol', false, true, 5, 4.24, 3050, NULL, NULL, 1);
INSERT INTO public.star VALUES (6, 'UY Scuti', 'Hipergigante vermelha, considerada uma das maiores estrelas conhecidas em raio', false, true, 9, 9500, 3365, NULL, NULL, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_galaxy_id_seq', 20, true);


--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_galaxy_id_seq', 12, true);


--
-- Name: species_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_species_id_seq', 3, true);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: species species_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_name_key UNIQUE (name);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

