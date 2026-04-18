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
\ connect universe
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
-- Name: galaxy_type; Type: TYPE; Schema: public; Owner: freecodecamp
--

CREATE TYPE public.galaxy_type AS ENUM (
    'spiral',
    'elliptical',
    'irregular'
);
ALTER TYPE public.galaxy_type OWNER TO freecodecamp;
--
-- Name: planet_type; Type: TYPE; Schema: public; Owner: freecodecamp
--

CREATE TYPE public.planet_type AS ENUM (
    'terrestrial',
    'gas_giant',
    'ice_giant',
    'dwarf',
    'lava',
    'ocean'
);
ALTER TYPE public.planet_type OWNER TO freecodecamp;
--
-- Name: star_type; Type: TYPE; Schema: public; Owner: freecodecamp
--

CREATE TYPE public.star_type AS ENUM (
    'red dward',
    'yellow dwarf',
    'giant',
    'neutron'
);
ALTER TYPE public.star_type OWNER TO freecodecamp;
SET default_tablespace = '';
SET default_table_access_method = heap;
--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    star_id integer,
    diameter_km numeric,
    name character varying(50) NOT NULL
);
ALTER TABLE public.asteroid OWNER TO freecodecamp;
--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;
--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;
--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type public.galaxy_type,
    age_billions_years numeric,
    diameter_light_years integer,
    has_black_hole boolean
);
ALTER TABLE public.galaxy OWNER TO freecodecamp;
--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
    planet_id integer,
    radius_km integer,
    has_atmosphere boolean,
    orbital_period_days numeric
);
ALTER TABLE public.moon OWNER TO freecodecamp;
--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
    name character varying(50) NOT NULL,
    star_id integer,
    type public.planet_type,
    has_life boolean,
    distance_from_star_mil_km numeric,
    number_of_moons integer,
    descr text
);
ALTER TABLE public.planet OWNER TO freecodecamp;
--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
    type public.star_type,
    surface_temp_kelvin integer,
    mass_solar_units numeric,
    number_of_planets integer,
    galaxy_id integer
);
ALTER TABLE public.star OWNER TO freecodecamp;
--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;
--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;
--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
ALTER COLUMN asteroid_id
SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);
--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
ALTER COLUMN galaxy_id
SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);
--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
ALTER COLUMN moon_id
SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);
--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
ALTER COLUMN planet_id
SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);
--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
ALTER COLUMN star_id
SET DEFAULT nextval('public.star_star_id_seq'::regclass);
--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid
VALUES (1, 1, 939.4, 'Ceres');
INSERT INTO public.asteroid
VALUES (2, 1, 525.4, 'Vesta');
INSERT INTO public.asteroid
VALUES (3, 1, 511.0, 'Pallas');
INSERT INTO public.asteroid
VALUES (4, 1, 326.0, 'Hygiea');
INSERT INTO public.asteroid
VALUES (5, 1, 232.0, 'Interamnia');
INSERT INTO public.asteroid
VALUES (6, 1, 225.0, 'Europa');
INSERT INTO public.asteroid
VALUES (7, 1, 217.0, 'Davida');
INSERT INTO public.asteroid
VALUES (8, 1, 186.0, 'Sylvia');
INSERT INTO public.asteroid
VALUES (9, 1, 169.0, 'Eunomia');
INSERT INTO public.asteroid
VALUES (10, 1, 0.5, 'Bennu');
--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy
VALUES (1, 'Milky Way', 'spiral', 13.6, 100000, true);
INSERT INTO public.galaxy
VALUES (2, 'Andromeda', 'spiral', 10.0, 220000, true);
INSERT INTO public.galaxy
VALUES (3, 'Triangulum', 'spiral', 13.0, 60000, true);
INSERT INTO public.galaxy
VALUES (
        4,
        'Messier 87',
        'elliptical',
        13.0,
        120000,
        true
    );
INSERT INTO public.galaxy
VALUES (
        5,
        'Large Magellanic Cloud',
        'irregular',
        13.3,
        14000,
        false
    );
INSERT INTO public.galaxy
VALUES (
        6,
        'Small Magellanic Cloud',
        'irregular',
        13.0,
        7000,
        false
    );
INSERT INTO public.galaxy
VALUES (7, 'Sombrero', 'spiral', 13.25, 49000, true);
INSERT INTO public.galaxy
VALUES (8, 'Whirlpool', 'spiral', 4.0, 76000, true);
INSERT INTO public.galaxy
VALUES (
        9,
        'Centaurus A',
        'elliptical',
        12.0,
        60000,
        true
    );
INSERT INTO public.galaxy
VALUES (10, 'Pinwheel', 'spiral', 10.0, 170000, true);
--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon
VALUES (1, 'Luna', 3, 1737, false, 27.3);
INSERT INTO public.moon
VALUES (2, 'Phobos', 4, 11, false, 0.32);
INSERT INTO public.moon
VALUES (3, 'Deimos', 4, 6, false, 1.26);
INSERT INTO public.moon
VALUES (4, 'Io', 5, 1822, true, 1.77);
INSERT INTO public.moon
VALUES (5, 'Europa', 5, 1561, true, 3.55);
INSERT INTO public.moon
VALUES (6, 'Ganymede', 5, 2634, true, 7.15);
INSERT INTO public.moon
VALUES (7, 'Callisto', 5, 2410, true, 16.69);
INSERT INTO public.moon
VALUES (8, 'Titan', 6, 2575, true, 15.95);
INSERT INTO public.moon
VALUES (9, 'Enceladus', 6, 252, true, 1.37);
INSERT INTO public.moon
VALUES (10, 'Triton', 8, 1353, true, 5.88);
INSERT INTO public.moon
VALUES (11, 'Mimas', 6, 198, false, 0.94);
INSERT INTO public.moon
VALUES (12, 'Tethys', 6, 531, false, 1.89);
INSERT INTO public.moon
VALUES (13, 'Dione', 6, 561, true, 2.74);
INSERT INTO public.moon
VALUES (14, 'Rhea', 6, 764, true, 4.52);
INSERT INTO public.moon
VALUES (15, 'Iapetus', 6, 734, false, 79.32);
INSERT INTO public.moon
VALUES (16, 'Miranda', 7, 236, false, 1.41);
INSERT INTO public.moon
VALUES (17, 'Ariel', 7, 579, false, 2.52);
INSERT INTO public.moon
VALUES (18, 'Umbriel', 7, 585, false, 4.14);
INSERT INTO public.moon
VALUES (19, 'Titania', 7, 789, false, 8.71);
INSERT INTO public.moon
VALUES (20, 'Oberon', 7, 761, false, 13.46);
--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet
VALUES (
        1,
        'Mercury',
        1,
        'terrestrial',
        false,
        57.9,
        0,
        'Smallest planet and closest to the Sun.'
    );
INSERT INTO public.planet
VALUES (
        2,
        'Venus',
        1,
        'lava',
        false,
        108.2,
        0,
        'Hottest planet due to runaway greenhouse effect.'
    );
INSERT INTO public.planet
VALUES (
        3,
        'Earth',
        1,
        'ocean',
        true,
        149.6,
        1,
        'The only known planet to harbor life.'
    );
INSERT INTO public.planet
VALUES (
        4,
        'Mars',
        1,
        'terrestrial',
        false,
        227.9,
        2,
        'The Red Planet, target of many rover missions.'
    );
INSERT INTO public.planet
VALUES (
        5,
        'Jupiter',
        1,
        'gas_giant',
        false,
        778.5,
        95,
        'Largest planet in the solar system with the Great Red Spot.'
    );
INSERT INTO public.planet
VALUES (
        6,
        'Saturn',
        1,
        'gas_giant',
        false,
        1433.5,
        146,
        'Famous for its extensive ring system.'
    );
INSERT INTO public.planet
VALUES (
        7,
        'Uranus',
        1,
        'ice_giant',
        false,
        2872.5,
        28,
        'Ice giant that rotates on its side.'
    );
INSERT INTO public.planet
VALUES (
        8,
        'Neptune',
        1,
        'ice_giant',
        false,
        4495.1,
        16,
        'Windiest planet with supersonic storms.'
    );
INSERT INTO public.planet
VALUES (
        9,
        'Pluto',
        1,
        'dwarf',
        false,
        5906.4,
        5,
        'Dwarf planet in the Kuiper Belt.'
    );
INSERT INTO public.planet
VALUES (
        10,
        'Proxima Centauri b',
        2,
        'terrestrial',
        false,
        7.5,
        0,
        'Closest known exoplanet to our solar system.'
    );
INSERT INTO public.planet
VALUES (
        11,
        'Kepler-22b',
        3,
        'ocean',
        false,
        133.5,
        0,
        'Potentially habitable exoplanet in the habitable zone.'
    );
INSERT INTO public.planet
VALUES (
        12,
        'TRAPPIST-1e',
        2,
        'terrestrial',
        false,
        4.3,
        0,
        'Rocky exoplanet with potential for liquid water.'
    );
--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star
VALUES (1, 'Sun', 'yellow dwarf', 5778, 1.0, 8, 1);
INSERT INTO public.star
VALUES (
        2,
        'Proxima Centauri',
        'red dward',
        3042,
        0.12,
        3,
        1
    );
INSERT INTO public.star
VALUES (
        3,
        'Alpha Centauri A',
        'yellow dwarf',
        5790,
        1.1,
        0,
        1
    );
INSERT INTO public.star
VALUES (4, 'Sirius A', 'yellow dwarf', 9940, 2.02, 0, 1);
INSERT INTO public.star
VALUES (5, 'Betelgeuse', 'giant', 3600, 16.5, 0, 1);
INSERT INTO public.star
VALUES (6, 'Rigel', 'giant', 12100, 21.0, 0, 1);
INSERT INTO public.star
VALUES (7, 'Vega', 'yellow dwarf', 9602, 2.1, 0, 1);
INSERT INTO public.star
VALUES (8, 'Polaris', 'giant', 6015, 5.4, 0, 1);
INSERT INTO public.star
VALUES (
        9,
        'Barnard''s Star',
        'red dward',
        3134,
        0.14,
        1,
        1
    );
INSERT INTO public.star
VALUES (10, 'Arcturus', 'giant', 4286, 1.08, 0, 1);
--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 10, true);
--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);
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

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);
--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
ADD CONSTRAINT asteroid_name_key UNIQUE (name);
--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);
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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);
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
- -