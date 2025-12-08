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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'myusername', 1, 18);
INSERT INTO public.users VALUES (2, 'user_1765200439536', 1, 774);
INSERT INTO public.users VALUES (4, 'user_1765200439535', 1, 835);
INSERT INTO public.users VALUES (19, 'jihane', 3, 7);
INSERT INTO public.users VALUES (27, 'user_1765202234028', 2, 120);
INSERT INTO public.users VALUES (12, 'user_1765200742220', 2, 724);
INSERT INTO public.users VALUES (26, 'user_1765202234029', 5, 453);
INSERT INTO public.users VALUES (11, 'user_1765200742221', 5, 226);
INSERT INTO public.users VALUES (10, 'jih', 2, 9);
INSERT INTO public.users VALUES (14, 'user_1765201196217', 2, 53);
INSERT INTO public.users VALUES (29, 'user_1765202325242', 2, 764);
INSERT INTO public.users VALUES (13, 'user_1765201196218', 5, 24);
INSERT INTO public.users VALUES (28, 'user_1765202325243', 5, 132);
INSERT INTO public.users VALUES (16, 'user_1765201450486', 2, 483);
INSERT INTO public.users VALUES (15, 'user_1765201450487', 5, 161);
INSERT INTO public.users VALUES (18, 'user_1765201646796', 2, 647);
INSERT INTO public.users VALUES (17, 'user_1765201646797', 5, 349);
INSERT INTO public.users VALUES (21, 'user_1765201843439', 2, 59);
INSERT INTO public.users VALUES (20, 'user_1765201843440', 5, 81);
INSERT INTO public.users VALUES (23, 'user_1765201923272', 2, 82);
INSERT INTO public.users VALUES (22, 'user_1765201923273', 5, 357);
INSERT INTO public.users VALUES (25, 'user_1765202092923', 2, 32);
INSERT INTO public.users VALUES (24, 'user_1765202092924', 5, 185);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 29, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

