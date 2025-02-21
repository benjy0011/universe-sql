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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_billions integer,
    distance_mly numeric(10,2),
    morphology character varying(30),
    mass numeric(12,2),
    satellite_count integer
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter integer,
    is_geologically_active boolean
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(50),
    size integer,
    is_active boolean
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    orbit_period integer,
    description text,
    has_life boolean
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    brightness integer,
    is_variable boolean
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13, 0.00, 'Spiral', 1500.00, 60);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10, 2.54, 'Spiral', 1250.00, 45);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12, 3.00, 'Spiral', 500.00, 15);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 8, 23.50, 'Spiral', 800.00, 30);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 11, 29.80, 'Elliptical', 600.00, 25);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 7, 21.20, 'Spiral', 900.00, 40);
INSERT INTO public.galaxy VALUES (7, 'Centaurus A', 10, 12.70, 'Elliptical', 1100.00, 50);
INSERT INTO public.galaxy VALUES (8, 'Messier 81', 9, 11.80, 'Spiral', 950.00, 35);
INSERT INTO public.galaxy VALUES (9, 'Messier 82', 8, 11.50, 'Irregular', 400.00, 20);
INSERT INTO public.galaxy VALUES (10, 'Large Magellanic Cloud', 13, 0.16, 'Irregular', 150.00, 5);
INSERT INTO public.galaxy VALUES (11, 'Small Magellanic Cloud', 12, 0.20, 'Irregular', 100.00, 3);
INSERT INTO public.galaxy VALUES (12, 'IC 1101', 14, 1000.00, 'Elliptical', 20000.00, 300);
INSERT INTO public.galaxy VALUES (13, 'NGC 1300', 9, 61.00, 'Spiral', 700.00, 28);
INSERT INTO public.galaxy VALUES (14, 'NGC 4993', 12, 140.00, 'Elliptical', 1300.00, 55);
INSERT INTO public.galaxy VALUES (15, 'Cartwheel', 6, 500.00, 'Ring', 800.00, 40);
INSERT INTO public.galaxy VALUES (16, 'NGC 6744', 10, 30.00, 'Spiral', 1000.00, 50);
INSERT INTO public.galaxy VALUES (17, 'Sunflower', 8, 75.00, 'Spiral', 650.00, 22);
INSERT INTO public.galaxy VALUES (18, 'Blue Snowball', 7, 55.00, 'Irregular', 300.00, 10);
INSERT INTO public.galaxy VALUES (19, 'Black Eye', 9, 18.00, 'Spiral', 850.00, 38);
INSERT INTO public.galaxy VALUES (20, 'Cigar', 11, 3.80, 'Irregular', 400.00, 12);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 3474, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 1, 22, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, false);
INSERT INTO public.moon VALUES (4, 'Europa', 3, 3121, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 5268, false);
INSERT INTO public.moon VALUES (6, 'Callisto', 4, 4821, false);
INSERT INTO public.moon VALUES (7, 'Io', 5, 3643, true);
INSERT INTO public.moon VALUES (8, 'Rhea', 6, 1528, false);
INSERT INTO public.moon VALUES (9, 'Titan', 7, 5150, true);
INSERT INTO public.moon VALUES (10, 'Enceladus', 8, 504, true);
INSERT INTO public.moon VALUES (11, 'Dione', 9, 1122, false);
INSERT INTO public.moon VALUES (12, 'Tethys', 10, 1062, false);
INSERT INTO public.moon VALUES (13, 'Mimas', 11, 396, false);
INSERT INTO public.moon VALUES (14, 'Iapetus', 12, 1469, false);
INSERT INTO public.moon VALUES (15, 'Oberon', 13, 1523, false);
INSERT INTO public.moon VALUES (16, 'Titania', 14, 1578, false);
INSERT INTO public.moon VALUES (17, 'Umbriel', 15, 1169, false);
INSERT INTO public.moon VALUES (18, 'Miranda', 16, 472, false);
INSERT INTO public.moon VALUES (19, 'Triton', 17, 2706, true);
INSERT INTO public.moon VALUES (20, 'Nereid', 18, 340, false);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 1, 'Orion Nebula', 'Emission', 24, true);
INSERT INTO public.nebula VALUES (2, 2, 'Eagle Nebula', 'Emission', 70, true);
INSERT INTO public.nebula VALUES (3, 3, 'Ring Nebula', 'Planetary', 1, false);
INSERT INTO public.nebula VALUES (4, 4, 'Helix Nebula', 'Planetary', 2, false);
INSERT INTO public.nebula VALUES (5, 5, 'Carina Nebula', 'Emission', 200, true);
INSERT INTO public.nebula VALUES (6, 6, 'Lagoon Nebula', 'Emission', 50, true);
INSERT INTO public.nebula VALUES (7, 7, 'Omega Nebula', 'Emission', 40, true);
INSERT INTO public.nebula VALUES (8, 8, 'Crab Nebula', 'Supernova Remnant', 11, false);
INSERT INTO public.nebula VALUES (9, 9, 'Tarantula Nebula', 'Emission', 200, true);
INSERT INTO public.nebula VALUES (10, 10, 'North America Nebula', 'Emission', 100, true);
INSERT INTO public.nebula VALUES (11, 11, 'Trifid Nebula', 'Emission', 25, true);
INSERT INTO public.nebula VALUES (12, 12, 'Rosette Nebula', 'Emission', 65, true);
INSERT INTO public.nebula VALUES (13, 13, 'Butterfly Nebula', 'Planetary', 1, false);
INSERT INTO public.nebula VALUES (14, 14, 'Eskimo Nebula', 'Planetary', 1, false);
INSERT INTO public.nebula VALUES (15, 15, 'Dumbbell Nebula', 'Planetary', 3, false);
INSERT INTO public.nebula VALUES (16, 16, 'Swan Nebula', 'Emission', 30, true);
INSERT INTO public.nebula VALUES (17, 17, 'Pleiades Reflection Nebula', 'Reflection', 5, true);
INSERT INTO public.nebula VALUES (18, 18, 'California Nebula', 'Emission', 60, true);
INSERT INTO public.nebula VALUES (19, 19, 'Heart Nebula', 'Emission', 40, true);
INSERT INTO public.nebula VALUES (20, 20, 'Soul Nebula', 'Dark', 100, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 365, 'Our home planet.', true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 687, 'The Red Planet.', false);
INSERT INTO public.planet VALUES (3, 'Kepler-22b', 2, 290, 'Exoplanet in the habitable zone.', true);
INSERT INTO public.planet VALUES (4, 'Jupiter', 3, 4333, 'Gas giant with many moons.', false);
INSERT INTO public.planet VALUES (5, 'Saturn', 4, 10759, 'Known for its prominent ring system.', false);
INSERT INTO public.planet VALUES (6, 'Uranus', 5, 30687, 'Ice giant with a unique tilt.', false);
INSERT INTO public.planet VALUES (7, 'Neptune', 6, 60190, 'Furthest known planet in our solar system.', false);
INSERT INTO public.planet VALUES (8, 'Venus', 7, 225, 'Hottest planet in the solar system.', false);
INSERT INTO public.planet VALUES (9, 'Mercury', 8, 88, 'Smallest planet, closest to the sun.', false);
INSERT INTO public.planet VALUES (10, 'ExoPlanet-X', 9, 400, 'A mysterious exoplanet.', false);
INSERT INTO public.planet VALUES (11, 'Gliese 581c', 10, 130, 'Potentially habitable exoplanet.', true);
INSERT INTO public.planet VALUES (12, 'Kepler-452b', 11, 385, 'Earth-like exoplanet.', true);
INSERT INTO public.planet VALUES (13, 'Proxima b', 12, 11, 'Orbiting our nearest star.', true);
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1e', 13, 6, 'Part of a system with seven Earth-sized planets.', true);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1f', 14, 9, 'Another Earth-sized planet in TRAPPIST-1 system.', true);
INSERT INTO public.planet VALUES (16, 'HD 209458 b', 15, 3, 'First exoplanet observed transiting its star.', false);
INSERT INTO public.planet VALUES (17, '55 Cancri e', 16, 18, 'Super-Earth with high temperatures.', false);
INSERT INTO public.planet VALUES (18, 'GJ 1214 b', 17, 38, 'Water world with possible cloud layers.', false);
INSERT INTO public.planet VALUES (19, 'CoRoT-7b', 18, 0, 'A rocky exoplanet extremely close to its star.', false);
INSERT INTO public.planet VALUES (20, 'LHS 1140b', 19, 25, 'A rocky planet in the habitable zone.', true);
INSERT INTO public.planet VALUES (21, 'Kepler-62f', 20, 267, 'Potentially habitable exoplanet in a multi-planet system.', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 100, false);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 85, false);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 2, 30, true);
INSERT INTO public.star VALUES (4, 'Sirius', 3, 120, false);
INSERT INTO public.star VALUES (5, 'Vega', 4, 110, true);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 5, 90, true);
INSERT INTO public.star VALUES (7, 'Rigel', 6, 95, false);
INSERT INTO public.star VALUES (8, 'Polaris', 7, 80, false);
INSERT INTO public.star VALUES (9, 'Antares', 8, 88, true);
INSERT INTO public.star VALUES (10, 'Spica', 9, 105, false);
INSERT INTO public.star VALUES (11, 'Aldebaran', 10, 75, false);
INSERT INTO public.star VALUES (12, 'Pollux', 11, 70, false);
INSERT INTO public.star VALUES (13, 'Castor', 12, 65, true);
INSERT INTO public.star VALUES (14, 'Arcturus', 13, 115, false);
INSERT INTO public.star VALUES (15, 'Capella', 14, 95, false);
INSERT INTO public.star VALUES (16, 'Deneb', 15, 100, true);
INSERT INTO public.star VALUES (17, 'Mimosa', 16, 85, false);
INSERT INTO public.star VALUES (18, 'Alnilam', 17, 90, true);
INSERT INTO public.star VALUES (19, 'Alnitak', 18, 95, false);
INSERT INTO public.star VALUES (20, 'Bellatrix', 19, 80, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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
-- Name: nebula nebula_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

