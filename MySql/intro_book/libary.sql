--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.4
-- Dumped by pg_dump version 9.6.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.users_books DROP CONSTRAINT users_books_book_id_fkey;
ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_book_id_fkey;
ALTER TABLE ONLY public.all_users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.users_books DROP CONSTRAINT users_books_pkey;
ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
ALTER TABLE ONLY public.books DROP CONSTRAINT books_isbn_key;
ALTER TABLE ONLY public.addresses DROP CONSTRAINT addresses_pkey;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.reviews ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.books ALTER COLUMN id DROP DEFAULT;
DROP TABLE public.users_books;
DROP SEQUENCE public.reviews_id_seq;
DROP TABLE public.reviews;
DROP SEQUENCE public.books_id_seq;
DROP TABLE public.books;
DROP TABLE public.all_users;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP TABLE public.addresses;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: bhavikpatel
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO bhavikpatel;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: bhavikpatel
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: bhavikpatel
--

CREATE TABLE addresses (
    user_id integer NOT NULL,
    street character varying(30) NOT NULL,
    city character varying(30) NOT NULL,
    state character varying(30) NOT NULL
);


ALTER TABLE addresses OWNER TO bhavikpatel;

--
-- Name: users; Type: TABLE; Schema: public; Owner: bhavikpatel
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(25) NOT NULL,
    enabled boolean DEFAULT true,
    last_login timestamp without time zone DEFAULT now() NOT NULL,
    book_title character varying(25),
    review_content character varying(100),
    rating integer,
    address character varying(25)
);


ALTER TABLE users OWNER TO bhavikpatel;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: bhavikpatel
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO bhavikpatel;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bhavikpatel
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: all_users; Type: TABLE; Schema: public; Owner: bhavikpatel
--

CREATE TABLE all_users (
    id integer DEFAULT nextval('users_id_seq'::regclass) NOT NULL,
    full_name character varying(25) NOT NULL
);


ALTER TABLE all_users OWNER TO bhavikpatel;

--
-- Name: books; Type: TABLE; Schema: public; Owner: bhavikpatel
--

CREATE TABLE books (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    author character varying(100) NOT NULL,
    published_date timestamp without time zone NOT NULL,
    isbn integer
);


ALTER TABLE books OWNER TO bhavikpatel;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: bhavikpatel
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_id_seq OWNER TO bhavikpatel;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bhavikpatel
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: bhavikpatel
--

CREATE TABLE reviews (
    id integer NOT NULL,
    book_id integer NOT NULL,
    user_id integer NOT NULL,
    review_content character varying(255),
    rating integer,
    published_date timestamp without time zone DEFAULT now()
);


ALTER TABLE reviews OWNER TO bhavikpatel;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: bhavikpatel
--

CREATE SEQUENCE reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reviews_id_seq OWNER TO bhavikpatel;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bhavikpatel
--

ALTER SEQUENCE reviews_id_seq OWNED BY reviews.id;


--
-- Name: users_books; Type: TABLE; Schema: public; Owner: bhavikpatel
--

CREATE TABLE users_books (
    user_id integer NOT NULL,
    book_id integer NOT NULL,
    checkout_date timestamp without time zone,
    return_date timestamp without time zone
);


ALTER TABLE users_books OWNER TO bhavikpatel;

--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: bhavikpatel
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: bhavikpatel
--

ALTER TABLE ONLY reviews ALTER COLUMN id SET DEFAULT nextval('reviews_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: bhavikpatel
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: bhavikpatel
--

INSERT INTO addresses VALUES (1, '1 market street', 'san francisco', 'ca');
INSERT INTO addresses VALUES (2, '2 Elm Street', 'San Francisco', 'CA');


--
-- Data for Name: all_users; Type: TABLE DATA; Schema: public; Owner: bhavikpatel
--

INSERT INTO all_users VALUES (1, 'John Smith');
INSERT INTO all_users VALUES (2, 'Jack Wilson');
INSERT INTO all_users VALUES (3, 'Jack Smith');


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: bhavikpatel
--

INSERT INTO books VALUES (2, 'My Second SQL book', 'John Mayer', '2017-08-29 13:16:39.411945', NULL);
INSERT INTO books VALUES (3, 'My Third SQL book', 'Cary Flint', '2017-08-29 13:17:04.975072', NULL);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bhavikpatel
--

SELECT pg_catalog.setval('books_id_seq', 1, false);


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: bhavikpatel
--

INSERT INTO reviews VALUES (3, 2, 2, 'review_content', NULL, '2017-08-29 13:16:57.090402');


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bhavikpatel
--

SELECT pg_catalog.setval('reviews_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: bhavikpatel
--

INSERT INTO users VALUES (4, 'John Smith', false, '2017-08-28 21:47:32.272011', 'Chaos', 'where is the butterfly effect?', 5, '2 Market Street');
INSERT INTO users VALUES (5, 'Jane Smith', true, '2017-08-28 21:57:12.575097', 'Simple Taoism', 'About living in balance?', 5, '3 Market Street');
INSERT INTO users VALUES (6, 'Jane Smith', true, '2017-08-28 21:58:12.586521', 'The Storyteller', 'Memories of WWI', 4, '3 Market Street');
INSERT INTO users VALUES (1, 'John Smith', true, '2017-08-29 13:12:25.357504', NULL, NULL, NULL, NULL);
INSERT INTO users VALUES (3, 'Alice Munro', true, '2017-08-29 13:17:04.658213', NULL, NULL, NULL, NULL);


--
-- Data for Name: users_books; Type: TABLE DATA; Schema: public; Owner: bhavikpatel
--

INSERT INTO users_books VALUES (1, 2, '2017-08-29 13:16:40.751688', NULL);
INSERT INTO users_books VALUES (2, 2, '2017-08-29 13:16:56.505127', NULL);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bhavikpatel
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: bhavikpatel
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (user_id);


--
-- Name: books books_isbn_key; Type: CONSTRAINT; Schema: public; Owner: bhavikpatel
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_isbn_key UNIQUE (isbn);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: bhavikpatel
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: bhavikpatel
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: users_books users_books_pkey; Type: CONSTRAINT; Schema: public; Owner: bhavikpatel
--

ALTER TABLE ONLY users_books
    ADD CONSTRAINT users_books_pkey PRIMARY KEY (user_id, book_id);


--
-- Name: all_users users_pkey; Type: CONSTRAINT; Schema: public; Owner: bhavikpatel
--

ALTER TABLE ONLY all_users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bhavikpatel
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE;


--
-- Name: users_books users_books_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bhavikpatel
--

ALTER TABLE ONLY users_books
    ADD CONSTRAINT users_books_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(id) ON UPDATE CASCADE;


--
-- PostgreSQL database dump complete
--

