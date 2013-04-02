--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.2
-- Dumped by pg_dump version 9.2.0
-- Started on 2013-04-02 08:29:12

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 179 (class 3079 OID 11727)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1980 (class 0 OID 0)
-- Dependencies: 179
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 174 (class 1259 OID 24712)
-- Name: albums; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE albums (
    id integer NOT NULL,
    datetime timestamp without time zone DEFAULT now() NOT NULL,
    title character varying(256) NOT NULL
);


ALTER TABLE public.albums OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 24710)
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE albums_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albums_id_seq OWNER TO postgres;

--
-- TOC entry 1981 (class 0 OID 0)
-- Dependencies: 173
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE albums_id_seq OWNED BY albums.id;


--
-- TOC entry 168 (class 1259 OID 24680)
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    news_id integer NOT NULL,
    user_id character varying(256) NOT NULL,
    datetime timestamp without time zone NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 24686)
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- TOC entry 1982 (class 0 OID 0)
-- Dependencies: 169
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- TOC entry 178 (class 1259 OID 24728)
-- Name: homeworks; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE homeworks (
    id integer NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.homeworks OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 24726)
-- Name: homeworks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE homeworks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homeworks_id_seq OWNER TO postgres;

--
-- TOC entry 1983 (class 0 OID 0)
-- Dependencies: 177
-- Name: homeworks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE homeworks_id_seq OWNED BY homeworks.id;


--
-- TOC entry 170 (class 1259 OID 24688)
-- Name: news; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE news (
    id integer NOT NULL,
    datetime timestamp without time zone DEFAULT now(),
    title character varying(256) NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.news OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 24694)
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO postgres;

--
-- TOC entry 1984 (class 0 OID 0)
-- Dependencies: 171
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE news_id_seq OWNED BY news.id;


--
-- TOC entry 176 (class 1259 OID 24720)
-- Name: photos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE photos (
    id integer NOT NULL,
    album_id integer NOT NULL
);


ALTER TABLE public.photos OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 24718)
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photos_id_seq OWNER TO postgres;

--
-- TOC entry 1985 (class 0 OID 0)
-- Dependencies: 175
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE photos_id_seq OWNED BY photos.id;


--
-- TOC entry 172 (class 1259 OID 24696)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id character varying(256) NOT NULL,
    password character(128) NOT NULL,
    first_name character varying(256) NOT NULL,
    last_name character varying(256) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 1951 (class 2604 OID 24715)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY albums ALTER COLUMN id SET DEFAULT nextval('albums_id_seq'::regclass);


--
-- TOC entry 1948 (class 2604 OID 24702)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- TOC entry 1954 (class 2604 OID 24731)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY homeworks ALTER COLUMN id SET DEFAULT nextval('homeworks_id_seq'::regclass);


--
-- TOC entry 1949 (class 2604 OID 24703)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news ALTER COLUMN id SET DEFAULT nextval('news_id_seq'::regclass);


--
-- TOC entry 1953 (class 2604 OID 24723)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photos ALTER COLUMN id SET DEFAULT nextval('photos_id_seq'::regclass);


--
-- TOC entry 1964 (class 2606 OID 24717)
-- Name: albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- TOC entry 1956 (class 2606 OID 24705)
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- TOC entry 1969 (class 2606 OID 24736)
-- Name: homeworks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY homeworks
    ADD CONSTRAINT homeworks_pkey PRIMARY KEY (id);


--
-- TOC entry 1960 (class 2606 OID 24707)
-- Name: news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- TOC entry 1967 (class 2606 OID 24725)
-- Name: photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- TOC entry 1962 (class 2606 OID 24709)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 1957 (class 1259 OID 24748)
-- Name: fki_comments_news_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_comments_news_id ON comments USING btree (news_id);


--
-- TOC entry 1958 (class 1259 OID 24754)
-- Name: fki_comments_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_comments_user_id ON comments USING btree (user_id);


--
-- TOC entry 1965 (class 1259 OID 24742)
-- Name: fki_photos_album_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_photos_album_id ON photos USING btree (album_id);


--
-- TOC entry 1970 (class 2606 OID 24743)
-- Name: comments_news_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_news_id_fkey FOREIGN KEY (news_id) REFERENCES news(id);


--
-- TOC entry 1971 (class 2606 OID 24749)
-- Name: comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 1972 (class 2606 OID 24737)
-- Name: photos_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_album_id_fkey FOREIGN KEY (album_id) REFERENCES albums(id);


--
-- TOC entry 1979 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-04-02 08:29:13

--
-- PostgreSQL database dump complete
--

