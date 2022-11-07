--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: autores; Type: TABLE; Schema: public; Owner: fran
--

CREATE TABLE public.autores (
    nombre text NOT NULL,
    apellido text NOT NULL,
    alias text,
    publicacion_mas_vendida text NOT NULL,
    fecha_de_nacimiento date
);


ALTER TABLE public.autores OWNER TO fran;

--
-- Name: bibliotecas; Type: TABLE; Schema: public; Owner: fran
--

CREATE TABLE public.bibliotecas (
    nombre text NOT NULL,
    direccion text,
    administrador text NOT NULL,
    naturaleza_juridica text,
    fecha_de_inauguracion date
);


ALTER TABLE public.bibliotecas OWNER TO fran;

--
-- Name: editoriales; Type: TABLE; Schema: public; Owner: fran
--

CREATE TABLE public.editoriales (
    nombre text NOT NULL,
    libro text NOT NULL,
    autor text
);


ALTER TABLE public.editoriales OWNER TO fran;

--
-- Name: libros; Type: TABLE; Schema: public; Owner: fran
--

CREATE TABLE public.libros (
    nombre text NOT NULL,
    autor text,
    fecha_de_publicado date NOT NULL,
    saga_literaria text,
    genero text
);


ALTER TABLE public.libros OWNER TO fran;

--
-- Name: precios; Type: TABLE; Schema: public; Owner: fran
--

CREATE TABLE public.precios (
    libro text NOT NULL,
    autor text NOT NULL,
    precio integer
);


ALTER TABLE public.precios OWNER TO fran;

--
-- Data for Name: autores; Type: TABLE DATA; Schema: public; Owner: fran
--

COPY public.autores (nombre, apellido, alias, publicacion_mas_vendida, fecha_de_nacimiento) FROM stdin;
Angel David	Revilla	Dross	Luna de Plutòn	1982-05-16
Gabriel	Garcia Marquez	Gabo	Cien años de soledad	1927-03-06
Phillip	Pullman	No registra	Luces del norte	1946-10-19
German	Garmendia	Hola soy German	#ChupaElPerro	1990-04-25
Rubèn	Doublas	elrubiusOMG	El Libro Troll	1990-02-13
Jordi	Caudillo	Elrincondegiorgio	Sueños de Acero y Neon	1984-08-28
Raul	Alvarez	AuronPlay	De lo peor, lo mejor	1988-11-05
Calvin Cordozar	Broadus	Snoop Dogg	Rolling Words	1971-10-20
\.


--
-- Data for Name: bibliotecas; Type: TABLE DATA; Schema: public; Owner: fran
--

COPY public.bibliotecas (nombre, direccion, administrador, naturaleza_juridica, fecha_de_inauguracion) FROM stdin;
Librerìa Francesa	Avenida Caracas #90-60	Julio Giron	Privada	4940-10-08
Luis Angel Arango 	Diagonal 25C #18-20	Octavio Cuenca	Publica	1952-10-08
Gabriel Garcìa Marquez	Unal	Sabela Hermoso	Publica	1652-10-08
Julio Mario Santodomingo	Carrera 23 #54-5	Elvira Pino	Publica	3485-10-08
LibGen	ww.libgen.is	 Neus Pareja 	Privada	3854-10-08
The uncensored Library	visit.uncensoredlibrary.com	Samara Vergara	Publica	3515-10-08
Biblioteca de la Dieta	1-chome-10-1 Nagatachō	Iratxe Serna	Privada	3519-10-08
Virgilio Barco	Carrera 69 #78-90	Francesca Alonso	Publica	6871-10-08
\.


--
-- Data for Name: editoriales; Type: TABLE DATA; Schema: public; Owner: fran
--

COPY public.editoriales (nombre, libro, autor) FROM stdin;
Alfaguara	Cien años de soledad	Gabriel Garcia Marquez
Planeta	La guerra de Ysaak	Angel David Revilla
Grupo Z	Luces del norte	Phillip Pullman
\.


--
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: fran
--

COPY public.libros (nombre, autor, fecha_de_publicado, saga_literaria, genero) FROM stdin;
La guerra de Ysaak	Angel David Revilla	2017-03-08	Luna de Plutòn	Sci-fi Espacial
Cien años de soledad	Gabriel Garcia Marquez	1967-06-05	Independiente	Realismo Magico
Luces del norte	Phillip Pullman	1995-07-15	La materia Oscura	Fantasìa
#ChupaElPerro	German Garmendia	2016-04-16	Independiente	Autoayuda
El Libro Troll	Rubèn Doublas	2014-06-15	Indepentiente	Humor
Sueños de Acero y Neon	Jordi Caudillo	2016-02-23	Inpedendiente	Cyberpunk
De lo peor, lo mejor	Raul Alvarez	2015-03-05	Independiente	Autoayuda
Rolling Words	Calvin Cordozar Broadus	2012-03-15	Independiente	Libro Fumable
\.


--
-- Data for Name: precios; Type: TABLE DATA; Schema: public; Owner: fran
--

COPY public.precios (libro, autor, precio) FROM stdin;
Cien años de soledad	Gabriel Garcia Marquez	120000
La guerra de Ysaak	Angel David Revilla	80000
Luces del norte	Phillip Pullman	250000
\.


--
-- Name: autores autores_pkey; Type: CONSTRAINT; Schema: public; Owner: fran
--

ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autores_pkey PRIMARY KEY (nombre, publicacion_mas_vendida, apellido);


--
-- Name: bibliotecas bibliotecas_pkey; Type: CONSTRAINT; Schema: public; Owner: fran
--

ALTER TABLE ONLY public.bibliotecas
    ADD CONSTRAINT bibliotecas_pkey PRIMARY KEY (nombre, administrador);


--
-- Name: editoriales editoriales_pkey; Type: CONSTRAINT; Schema: public; Owner: fran
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_pkey PRIMARY KEY (nombre, libro);


--
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: fran
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (nombre, fecha_de_publicado);


--
-- Name: precios precios_pkey; Type: CONSTRAINT; Schema: public; Owner: fran
--

ALTER TABLE ONLY public.precios
    ADD CONSTRAINT precios_pkey PRIMARY KEY (libro, autor);


--
-- Name: editoriales editoriales_libro_autor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fran
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_libro_autor_fkey FOREIGN KEY (libro, autor) REFERENCES public.precios(libro, autor) NOT VALID;


--
-- Name: libros libros_nombre_autor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fran
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_nombre_autor_fkey FOREIGN KEY (nombre, autor) REFERENCES public.precios(libro, autor) NOT VALID;


--
-- PostgreSQL database dump complete
--

