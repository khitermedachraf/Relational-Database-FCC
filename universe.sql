--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: astronaut; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronaut (
    astronaut_id integer NOT NULL,
    name character varying(100) NOT NULL,
    mission_count integer,
    has_spacewalk boolean,
    description text NOT NULL
);


ALTER TABLE public.astronaut OWNER TO freecodecamp;

--
-- Name: astronauts_astronaut_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronauts_astronaut_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronauts_astronaut_id_seq OWNER TO freecodecamp;

--
-- Name: astronauts_astronaut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronauts_astronaut_id_seq OWNED BY public.astronaut.astronaut_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    distance_from_earth numeric(10,2),
    has_life boolean,
    description text NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    weight_in_kg numeric(7,2),
    too_small boolean,
    description text NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    type character varying(50),
    is_spherical boolean,
    has_life boolean,
    description text NOT NULL
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    type character varying(50),
    has_planets boolean,
    description text NOT NULL
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
-- Name: astronaut astronaut_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut ALTER COLUMN astronaut_id SET DEFAULT nextval('public.astronauts_astronaut_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: astronaut; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronaut VALUES (1, 'Neil Armstrong', 2, true, 'First human to walk on the Moon.');
INSERT INTO public.astronaut VALUES (2, 'Yuri Gagarin', 1, false, 'First human to journey into outer space.');
INSERT INTO public.astronaut VALUES (3, 'Buzz Aldrin', 2, true, 'Second person to walk on the Moon.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0.00, true, 'Our home galaxy, containing the Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2540000.00, false, 'The nearest major galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000.00, false, 'The third-largest member of the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 163000.00, false, 'A satellite galaxy of the Milky Way.');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular', 200000.00, false, 'A dwarf galaxy near the Milky Way.');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 23000000.00, false, 'A spiral galaxy with distinctive arms.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ganymede', 5, 14819.00, false, 'The largest moon in the Solar System.');
INSERT INTO public.moon VALUES (2, 'Titan', 6, 13452.00, false, 'The largest moon of Saturn.');
INSERT INTO public.moon VALUES (3, 'Callisto', 5, 10759.00, false, 'A moon of Jupiter, heavily cratered.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 8931.99, false, 'A volcanic moon of Jupiter.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 4799.80, false, 'A moon of Jupiter, possibly has a subsurface ocean.');
INSERT INTO public.moon VALUES (6, 'Triton', 8, 2141.80, false, 'The largest moon of Neptune.');
INSERT INTO public.moon VALUES (7, 'Titania', 7, 352.70, false, 'The largest moon of Uranus.');
INSERT INTO public.moon VALUES (8, 'Rhea', 6, 230.65, false, 'A moon of Saturn.');
INSERT INTO public.moon VALUES (9, 'Oberon', 7, 301.40, false, 'A moon of Uranus.');
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 180.56, false, 'A two-toned moon of Saturn.');
INSERT INTO public.moon VALUES (11, 'Dione', 6, 109.55, false, 'A moon of Saturn.');
INSERT INTO public.moon VALUES (12, 'Ariel', 7, 135.30, false, 'A moon of Uranus.');
INSERT INTO public.moon VALUES (13, 'Umbriel', 7, 117.20, false, 'A moon of Uranus.');
INSERT INTO public.moon VALUES (14, 'Charon', 9, 158.60, false, 'The largest moon of Pluto.');
INSERT INTO public.moon VALUES (15, 'Phoebe', 6, 8.29, true, 'An irregular moon of Saturn.');
INSERT INTO public.moon VALUES (16, 'Tethys', 6, 61.74, false, 'A moon of Saturn.');
INSERT INTO public.moon VALUES (17, 'Mimas', 6, 37.49, true, 'A moon of Saturn, known as the "Death Star".');
INSERT INTO public.moon VALUES (18, 'Enceladus', 6, 108.02, true, 'A moon of Saturn, known for its geysers.');
INSERT INTO public.moon VALUES (19, 'Miranda', 7, 65.90, true, 'A moon of Uranus, known for its unusual surface.');
INSERT INTO public.moon VALUES (20, 'Proteus', 8, 44.00, true, 'A moon of Neptune.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', true, false, 'The smallest planet in the Solar System.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', true, false, 'Known for its thick, toxic atmosphere.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, true, 'The only planet known to support life.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', true, false, 'The Red Planet, known for its iron oxide-rich soil.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', true, false, 'The largest planet in the Solar System.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', true, false, 'Famous for its stunning ring system.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', true, false, 'Known for its tilted axis.');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', true, false, 'Noted for its deep blue color and strong winds.');
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 'Dwarf Planet', true, false, 'A dwarf planet in the Kuiper belt.');
INSERT INTO public.planet VALUES (10, 'Ceres', 1, 'Dwarf Planet', true, false, 'The largest object in the asteroid belt.');
INSERT INTO public.planet VALUES (11, 'Haumea', 1, 'Dwarf Planet', true, false, 'A dwarf planet known for its elongated shape.');
INSERT INTO public.planet VALUES (12, 'Eris', 1, 'Dwarf Planet', true, false, 'A distant dwarf planet, slightly smaller than Pluto.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 'G-type', true, 'The star at the center of our Solar System.');
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 2, 4600, 'G-type', true, 'Part of the closest star system to the Solar System.');
INSERT INTO public.star VALUES (3, 'Sirius', 2, 200, 'A-type', true, 'The brightest star in the night sky.');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 2, 4600, 'M-type', true, 'The closest known star to the Sun.');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 3, 8000, 'M-type', false, 'A red supergiant star in the constellation Orion.');
INSERT INTO public.star VALUES (6, 'Vega', 3, 455, 'A-type', false, 'The fifth-brightest star in the night sky.');


--
-- Name: astronauts_astronaut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronauts_astronaut_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: astronaut astronauts_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronauts_name_key UNIQUE (name);


--
-- Name: astronaut astronauts_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronauts_pkey PRIMARY KEY (astronaut_id);


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

