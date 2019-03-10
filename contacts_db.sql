--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: contacts_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_address (
    id integer NOT NULL,
    city character varying(64) NOT NULL,
    street_name character varying(64) NOT NULL,
    house_number character varying(6) NOT NULL,
    flat_number character varying(6)
);


ALTER TABLE public.contacts_address OWNER TO postgres;

--
-- Name: contacts_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_address_id_seq OWNER TO postgres;

--
-- Name: contacts_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_address_id_seq OWNED BY public.contacts_address.id;


--
-- Name: contacts_email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_email (
    id integer NOT NULL,
    email character varying(64) NOT NULL,
    email_type integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.contacts_email OWNER TO postgres;

--
-- Name: contacts_email_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_email_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_email_id_seq OWNER TO postgres;

--
-- Name: contacts_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_email_id_seq OWNED BY public.contacts_email.id;


--
-- Name: contacts_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_groups (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.contacts_groups OWNER TO postgres;

--
-- Name: contacts_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_groups_id_seq OWNER TO postgres;

--
-- Name: contacts_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_groups_id_seq OWNED BY public.contacts_groups.id;


--
-- Name: contacts_groups_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_groups_person (
    id integer NOT NULL,
    groups_id integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.contacts_groups_person OWNER TO postgres;

--
-- Name: contacts_groups_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_groups_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_groups_person_id_seq OWNER TO postgres;

--
-- Name: contacts_groups_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_groups_person_id_seq OWNED BY public.contacts_groups_person.id;


--
-- Name: contacts_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_person (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    surname character varying(64) NOT NULL,
    description text NOT NULL,
    address_id integer,
    picture character varying(100)
);


ALTER TABLE public.contacts_person OWNER TO postgres;

--
-- Name: contacts_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_person_id_seq OWNER TO postgres;

--
-- Name: contacts_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_person_id_seq OWNED BY public.contacts_person.id;


--
-- Name: contacts_phone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_phone (
    id integer NOT NULL,
    phone_number bigint NOT NULL,
    phone_type integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.contacts_phone OWNER TO postgres;

--
-- Name: contacts_phone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_phone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_phone_id_seq OWNER TO postgres;

--
-- Name: contacts_phone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_phone_id_seq OWNED BY public.contacts_phone.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: contacts_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_address ALTER COLUMN id SET DEFAULT nextval('public.contacts_address_id_seq'::regclass);


--
-- Name: contacts_email id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_email ALTER COLUMN id SET DEFAULT nextval('public.contacts_email_id_seq'::regclass);


--
-- Name: contacts_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_groups ALTER COLUMN id SET DEFAULT nextval('public.contacts_groups_id_seq'::regclass);


--
-- Name: contacts_groups_person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_groups_person ALTER COLUMN id SET DEFAULT nextval('public.contacts_groups_person_id_seq'::regclass);


--
-- Name: contacts_person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_person ALTER COLUMN id SET DEFAULT nextval('public.contacts_person_id_seq'::regclass);


--
-- Name: contacts_phone id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_phone ALTER COLUMN id SET DEFAULT nextval('public.contacts_phone_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add groups	7	add_groups
20	Can change groups	7	change_groups
21	Can delete groups	7	delete_groups
22	Can add person	8	add_person
23	Can change person	8	change_person
24	Can delete person	8	delete_person
25	Can add email	9	add_email
26	Can change email	9	change_email
27	Can delete email	9	delete_email
28	Can add address	10	add_address
29	Can change address	10	change_address
30	Can delete address	10	delete_address
31	Can add phone	11	add_phone
32	Can change phone	11	change_phone
33	Can delete phone	11	delete_phone
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: contacts_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_address (id, city, street_name, house_number, flat_number) FROM stdin;
2	Warszawa	Puławska	1	2
3	Warsaw	Puławska	1	2
4	Warszawa	Puławska	5	5
5	W	Puławska	23	23
6	Warszawa	Domaniewska	1	1
10	TECHNO	Maczupikczu	1000	55
12	Kraków	Brogi	40	44
\.


--
-- Data for Name: contacts_email; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_email (id, email, email_type, person_id) FROM stdin;
4	ffhjklde	1	11
\.


--
-- Data for Name: contacts_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_groups (id, name) FROM stdin;
5	123234
4	adddd
6	adjhgf
\.


--
-- Data for Name: contacts_groups_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_groups_person (id, groups_id, person_id) FROM stdin;
32	4	11
33	6	11
\.


--
-- Data for Name: contacts_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_person (id, name, surname, description, address_id, picture) FROM stdin;
7	Jacek	Michalczewski	UUU	12	\N
11	Bozenka	Kowalska	fajna kozelanka	\N	\N
14	Michael	Scott	Regional Manager of Dunder Mifflin	\N	avatar-Michael-Scott.jpg
\.


--
-- Data for Name: contacts_phone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_phone (id, phone_number, phone_type, person_id) FROM stdin;
11	6646464	3	11
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	contacts	groups
8	contacts	person
9	contacts	email
10	contacts	address
11	contacts	phone
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-11-13 10:41:05.37698+01
2	auth	0001_initial	2018-11-13 10:41:05.631277+01
3	admin	0001_initial	2018-11-13 10:41:05.716171+01
4	admin	0002_logentry_remove_auto_add	2018-11-13 10:41:05.7551+01
5	contenttypes	0002_remove_content_type_name	2018-11-13 10:41:05.834928+01
6	auth	0002_alter_permission_name_max_length	2018-11-13 10:41:05.855005+01
7	auth	0003_alter_user_email_max_length	2018-11-13 10:41:05.892003+01
8	auth	0004_alter_user_username_opts	2018-11-13 10:41:05.92977+01
9	auth	0005_alter_user_last_login_null	2018-11-13 10:41:05.964403+01
10	auth	0006_require_contenttypes_0002	2018-11-13 10:41:05.971665+01
11	auth	0007_alter_validators_add_error_messages	2018-11-13 10:41:06.003049+01
12	auth	0008_alter_user_username_max_length	2018-11-13 10:41:06.069786+01
13	auth	0009_alter_user_last_name_max_length	2018-11-13 10:41:06.102756+01
14	sessions	0001_initial	2018-11-13 10:41:06.14548+01
15	contacts	0001_initial	2018-11-13 10:58:13.530625+01
16	contacts	0002_auto_20181113_1157	2018-11-13 12:57:15.434702+01
17	contacts	0003_auto_20181114_1426	2018-11-14 15:26:36.284737+01
18	contacts	0004_auto_20181115_1722	2018-11-15 18:22:39.228071+01
19	contacts	0005_person_picture	2018-11-19 14:19:07.392769+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 33, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: contacts_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_address_id_seq', 14, true);


--
-- Name: contacts_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_email_id_seq', 4, true);


--
-- Name: contacts_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_groups_id_seq', 6, true);


--
-- Name: contacts_groups_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_groups_person_id_seq', 36, true);


--
-- Name: contacts_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_person_id_seq', 14, true);


--
-- Name: contacts_phone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_phone_id_seq', 11, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: contacts_address contacts_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_address
    ADD CONSTRAINT contacts_address_pkey PRIMARY KEY (id);


--
-- Name: contacts_email contacts_email_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_email
    ADD CONSTRAINT contacts_email_pkey PRIMARY KEY (id);


--
-- Name: contacts_groups_person contacts_groups_person_groups_id_person_id_d7041105_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_groups_person
    ADD CONSTRAINT contacts_groups_person_groups_id_person_id_d7041105_uniq UNIQUE (groups_id, person_id);


--
-- Name: contacts_groups_person contacts_groups_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_groups_person
    ADD CONSTRAINT contacts_groups_person_pkey PRIMARY KEY (id);


--
-- Name: contacts_groups contacts_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_groups
    ADD CONSTRAINT contacts_groups_pkey PRIMARY KEY (id);


--
-- Name: contacts_person contacts_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_person
    ADD CONSTRAINT contacts_person_pkey PRIMARY KEY (id);


--
-- Name: contacts_phone contacts_phone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_phone
    ADD CONSTRAINT contacts_phone_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: contacts_email_person_id_353a4f5d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_email_person_id_353a4f5d ON public.contacts_email USING btree (person_id);


--
-- Name: contacts_groups_person_groups_id_99ffbf76; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_groups_person_groups_id_99ffbf76 ON public.contacts_groups_person USING btree (groups_id);


--
-- Name: contacts_groups_person_person_id_f59f8bb3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_groups_person_person_id_f59f8bb3 ON public.contacts_groups_person USING btree (person_id);


--
-- Name: contacts_person_address_id_b60152fc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_person_address_id_b60152fc ON public.contacts_person USING btree (address_id);


--
-- Name: contacts_phone_person_id_3a84a2e6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_phone_person_id_3a84a2e6 ON public.contacts_phone USING btree (person_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacts_email contacts_email_person_id_353a4f5d_fk_contacts_person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_email
    ADD CONSTRAINT contacts_email_person_id_353a4f5d_fk_contacts_person_id FOREIGN KEY (person_id) REFERENCES public.contacts_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacts_groups_person contacts_groups_person_groups_id_99ffbf76_fk_contacts_groups_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_groups_person
    ADD CONSTRAINT contacts_groups_person_groups_id_99ffbf76_fk_contacts_groups_id FOREIGN KEY (groups_id) REFERENCES public.contacts_groups(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacts_groups_person contacts_groups_person_person_id_f59f8bb3_fk_contacts_person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_groups_person
    ADD CONSTRAINT contacts_groups_person_person_id_f59f8bb3_fk_contacts_person_id FOREIGN KEY (person_id) REFERENCES public.contacts_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacts_person contacts_person_address_id_b60152fc_fk_contacts_address_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_person
    ADD CONSTRAINT contacts_person_address_id_b60152fc_fk_contacts_address_id FOREIGN KEY (address_id) REFERENCES public.contacts_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacts_phone contacts_phone_person_id_3a84a2e6_fk_contacts_person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_phone
    ADD CONSTRAINT contacts_phone_person_id_3a84a2e6_fk_contacts_person_id FOREIGN KEY (person_id) REFERENCES public.contacts_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

