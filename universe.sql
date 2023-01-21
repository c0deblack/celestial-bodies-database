--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    age integer,
    year_discovered integer,
    description text NOT NULL,
    name character varying(60) NOT NULL,
    distance numeric(6,2),
    is_sphere boolean DEFAULT true
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    short_name character varying(30) DEFAULT 'SHTNME'::character varying
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    age integer,
    year_discovered integer,
    description text NOT NULL,
    name character varying(60) NOT NULL,
    distance numeric(6,2),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    age integer,
    year_discovered integer,
    description text NOT NULL,
    name character varying(60) NOT NULL,
    distance numeric(6,2),
    star_id integer NOT NULL,
    has_life boolean DEFAULT false
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    age integer,
    year_discovered integer,
    description text NOT NULL,
    name character varying(60) NOT NULL,
    distance numeric(6,2),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 10, 1990, 'Galaxy 1', 'gax1', 10.00, false);
INSERT INTO public.galaxy VALUES (2, 10, 1990, 'Galaxy 2', 'gax2', 10.00, false);
INSERT INTO public.galaxy VALUES (3, 10, 1990, 'Galaxy 3', 'gax3', 10.00, false);
INSERT INTO public.galaxy VALUES (4, 10, 1990, 'Galaxy 4', 'gax4', 10.00, false);
INSERT INTO public.galaxy VALUES (5, 10, 1990, 'Galaxy 5', 'gax5', 10.00, false);
INSERT INTO public.galaxy VALUES (6, 10, 1990, 'Galaxy 6', 'gax6', 10.00, false);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'type 1', 'SHTNME');
INSERT INTO public.galaxy_type VALUES (2, 'type 2', 'SHTNME');
INSERT INTO public.galaxy_type VALUES (3, 'type 3', 'SHTNME');
INSERT INTO public.galaxy_type VALUES (4, 'type 4', 'SHTNME');
INSERT INTO public.galaxy_type VALUES (5, 'type 5', 'SHTNME');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 10, 1000, 'test desc', 'moon 1', 133.30, 1);
INSERT INTO public.moon VALUES (3, 10, 1000, 'test desc', 'moon 2', 133.30, 1);
INSERT INTO public.moon VALUES (4, 10, 1000, 'test desc', 'moon 3', 133.30, 1);
INSERT INTO public.moon VALUES (5, 10, 1000, 'test desc', 'moon 4', 133.30, 1);
INSERT INTO public.moon VALUES (6, 10, 1000, 'test desc', 'moon 5', 133.30, 1);
INSERT INTO public.moon VALUES (7, 10, 1000, 'test desc', 'moon 6', 133.30, 1);
INSERT INTO public.moon VALUES (8, 10, 1000, 'test desc', 'moon 7', 133.30, 1);
INSERT INTO public.moon VALUES (9, 10, 1000, 'test desc', 'moon 8', 133.30, 1);
INSERT INTO public.moon VALUES (10, 10, 1000, 'test desc', 'moon 9', 133.30, 1);
INSERT INTO public.moon VALUES (11, 10, 1000, 'test desc', 'moon 10', 133.30, 1);
INSERT INTO public.moon VALUES (12, 10, 1000, 'test desc', 'moon 11', 133.30, 1);
INSERT INTO public.moon VALUES (13, 10, 1000, 'test desc', 'moon 12', 133.30, 1);
INSERT INTO public.moon VALUES (14, 10, 1000, 'test desc', 'moon 13', 133.30, 1);
INSERT INTO public.moon VALUES (15, 10, 1000, 'test desc', 'moon 14', 133.30, 1);
INSERT INTO public.moon VALUES (16, 10, 1000, 'test desc', 'moon 15', 133.30, 1);
INSERT INTO public.moon VALUES (17, 10, 1000, 'test desc', 'moon 16', 133.30, 1);
INSERT INTO public.moon VALUES (18, 10, 1000, 'test desc', 'moon 17', 133.30, 1);
INSERT INTO public.moon VALUES (19, 10, 1000, 'test desc', 'moon 18', 133.30, 1);
INSERT INTO public.moon VALUES (20, 10, 1000, 'test desc', 'moon 19', 133.30, 1);
INSERT INTO public.moon VALUES (21, 10, 1000, 'test desc', 'moon 20', 133.30, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 10, 1999, 'Planet 1', 'plan1', 345.20, 1, false);
INSERT INTO public.planet VALUES (2, 10, 1999, 'Planet 2', 'plan2', 345.20, 3, false);
INSERT INTO public.planet VALUES (3, 10, 1999, 'Planet 3', 'plan3', 345.20, 3, false);
INSERT INTO public.planet VALUES (4, 10, 1999, 'Planet 4', 'plan4', 345.20, 4, false);
INSERT INTO public.planet VALUES (5, 10, 1999, 'Planet 5', 'plan5', 345.20, 5, false);
INSERT INTO public.planet VALUES (6, 10, 1999, 'Planet 6', 'plan6', 345.20, 6, false);
INSERT INTO public.planet VALUES (7, 10, 1000, 'test desc', 'star001', NULL, 1, false);
INSERT INTO public.planet VALUES (8, 10, 1000, 'test desc', 'star003', NULL, 1, false);
INSERT INTO public.planet VALUES (9, 10, 1000, 'test desc', 'star004', NULL, 1, false);
INSERT INTO public.planet VALUES (10, 10, 1000, 'test desc', 'star005', NULL, 1, false);
INSERT INTO public.planet VALUES (11, 10, 1000, 'test desc', 'star006', NULL, 1, false);
INSERT INTO public.planet VALUES (12, 10, 1000, 'test desc', 'star007', NULL, 1, false);
INSERT INTO public.planet VALUES (13, 10, 1000, 'test desc', 'star008', NULL, 1, false);
INSERT INTO public.planet VALUES (14, 10, 1000, 'test desc', 'star009', NULL, 1, false);
INSERT INTO public.planet VALUES (15, 10, 1000, 'test desc', 'star010', NULL, 1, false);
INSERT INTO public.planet VALUES (16, 10, 1000, 'test desc', 'star011', NULL, 1, false);
INSERT INTO public.planet VALUES (17, 10, 1000, 'test desc', 'star012', NULL, 1, false);
INSERT INTO public.planet VALUES (18, 10, 1000, 'test desc', 'star013', NULL, 1, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 10, 1999, 'Star 1', 'star1', 345.20, 1);
INSERT INTO public.star VALUES (2, 10, 1999, 'Star 3', 'star2', 345.20, 2);
INSERT INTO public.star VALUES (3, 10, 1999, 'Star 3', 'star3', 345.20, 3);
INSERT INTO public.star VALUES (4, 10, 1999, 'Star 4', 'star4', 345.20, 4);
INSERT INTO public.star VALUES (5, 10, 1999, 'Star 5', 'star5', 345.20, 5);
INSERT INTO public.star VALUES (6, 10, 1999, 'Star 6', 'star6', 345.20, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: galaxy_type unique_galaxy_type; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT unique_galaxy_type UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

