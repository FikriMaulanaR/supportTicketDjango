--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

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
-- Name: Ticket_ticket; Type: TABLE; Schema: public; Owner: fikrimaulanar
--

CREATE TABLE public."Ticket_ticket" (
    id bigint NOT NULL,
    "Subject" character varying(100) NOT NULL,
    "Description" character varying(1000) NOT NULL,
    "Created_at" timestamp with time zone NOT NULL,
    "Last_update" timestamp with time zone NOT NULL,
    "Status" character varying(10),
    "Level" character varying(10) NOT NULL,
    "Customer_id" integer,
    "Up_File" character varying(100)
);


ALTER TABLE public."Ticket_ticket" OWNER TO fikrimaulanar;

--
-- Name: Ticket_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: fikrimaulanar
--

CREATE SEQUENCE public."Ticket_ticket_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ticket_ticket_id_seq" OWNER TO fikrimaulanar;

--
-- Name: Ticket_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fikrimaulanar
--

ALTER SEQUENCE public."Ticket_ticket_id_seq" OWNED BY public."Ticket_ticket".id;


--
-- Name: Ticket_ticketcomment; Type: TABLE; Schema: public; Owner: fikrimaulanar
--

CREATE TABLE public."Ticket_ticketcomment" (
    id bigint NOT NULL,
    date timestamp with time zone NOT NULL,
    comment character varying(1000) NOT NULL,
    admin_id integer NOT NULL,
    ticket_id bigint NOT NULL,
    "Up_Doc" character varying(100)
);


ALTER TABLE public."Ticket_ticketcomment" OWNER TO fikrimaulanar;

--
-- Name: Ticket_ticketcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: fikrimaulanar
--

CREATE SEQUENCE public."Ticket_ticketcomment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ticket_ticketcomment_id_seq" OWNER TO fikrimaulanar;

--
-- Name: Ticket_ticketcomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fikrimaulanar
--

ALTER SEQUENCE public."Ticket_ticketcomment_id_seq" OWNED BY public."Ticket_ticketcomment".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: fikrimaulanar
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO fikrimaulanar;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: fikrimaulanar
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO fikrimaulanar;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fikrimaulanar
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: fikrimaulanar
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO fikrimaulanar;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: fikrimaulanar
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO fikrimaulanar;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fikrimaulanar
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: fikrimaulanar
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO fikrimaulanar;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: fikrimaulanar
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO fikrimaulanar;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fikrimaulanar
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: fikrimaulanar
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO fikrimaulanar;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: fikrimaulanar
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO fikrimaulanar;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: fikrimaulanar
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO fikrimaulanar;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fikrimaulanar
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: fikrimaulanar
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO fikrimaulanar;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fikrimaulanar
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: fikrimaulanar
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO fikrimaulanar;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: fikrimaulanar
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO fikrimaulanar;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fikrimaulanar
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: fikrimaulanar
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


ALTER TABLE public.django_admin_log OWNER TO fikrimaulanar;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: fikrimaulanar
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO fikrimaulanar;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fikrimaulanar
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: fikrimaulanar
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO fikrimaulanar;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: fikrimaulanar
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO fikrimaulanar;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fikrimaulanar
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: fikrimaulanar
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO fikrimaulanar;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: fikrimaulanar
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO fikrimaulanar;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fikrimaulanar
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: fikrimaulanar
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO fikrimaulanar;

--
-- Name: members_profile; Type: TABLE; Schema: public; Owner: fikrimaulanar
--

CREATE TABLE public.members_profile (
    id bigint NOT NULL,
    "Address" character varying(200),
    "Birth" date,
    "Phone" character varying(15),
    user_id integer NOT NULL
);


ALTER TABLE public.members_profile OWNER TO fikrimaulanar;

--
-- Name: members_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: fikrimaulanar
--

CREATE SEQUENCE public.members_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_profile_id_seq OWNER TO fikrimaulanar;

--
-- Name: members_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fikrimaulanar
--

ALTER SEQUENCE public.members_profile_id_seq OWNED BY public.members_profile.id;


--
-- Name: Ticket_ticket id; Type: DEFAULT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public."Ticket_ticket" ALTER COLUMN id SET DEFAULT nextval('public."Ticket_ticket_id_seq"'::regclass);


--
-- Name: Ticket_ticketcomment id; Type: DEFAULT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public."Ticket_ticketcomment" ALTER COLUMN id SET DEFAULT nextval('public."Ticket_ticketcomment_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: members_profile id; Type: DEFAULT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.members_profile ALTER COLUMN id SET DEFAULT nextval('public.members_profile_id_seq'::regclass);


--
-- Data for Name: Ticket_ticket; Type: TABLE DATA; Schema: public; Owner: fikrimaulanar
--

COPY public."Ticket_ticket" (id, "Subject", "Description", "Created_at", "Last_update", "Status", "Level", "Customer_id", "Up_File") FROM stdin;
6	Lorem Ipsum	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	2022-06-17 16:20:28.17659+07	2022-06-17 16:20:28.176629+07	Open	Low	2	dokumen/WhatsApp_Image_2022-03-23_at_18.34.49_jeG2NH2.jpeg
7	Lorem Ipsum	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	2022-06-17 19:30:16.940357+07	2022-06-18 09:43:11.749865+07	Close	Low	1	
\.


--
-- Data for Name: Ticket_ticketcomment; Type: TABLE DATA; Schema: public; Owner: fikrimaulanar
--

COPY public."Ticket_ticketcomment" (id, date, comment, admin_id, ticket_id, "Up_Doc") FROM stdin;
22	2022-06-17 22:41:49.477885+07	You can see all detail on the link at the bottom	1	6	dokumen/comment/WhatsApp_Image_2022-03-23_at_18.34.49_UWqN5ZQ.jpeg
23	2022-06-18 09:42:33.638311+07	Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.	1	7	
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: fikrimaulanar
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: fikrimaulanar
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: fikrimaulanar
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add ticket	7	add_ticket
26	Can change ticket	7	change_ticket
27	Can delete ticket	7	delete_ticket
28	Can view ticket	7	view_ticket
29	Can add ticket comment	8	add_ticketcomment
30	Can change ticket comment	8	change_ticketcomment
31	Can delete ticket comment	8	delete_ticketcomment
32	Can view ticket comment	8	view_ticketcomment
33	Can add profile	9	add_profile
34	Can change profile	9	change_profile
35	Can delete profile	9	delete_profile
36	Can view profile	9	view_profile
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: fikrimaulanar
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
4	pbkdf2_sha256$260000$D7dPMD8FN6GSWqPyV6cQ8v$Fs7xRVAdjHasA+X/6oYx4K42S4754n/LY6iacZmAeak=	\N	f	TestUser1	Test	User1	testuser1@gmail.com	f	t	2022-06-16 20:03:22+07
5	pbkdf2_sha256$260000$k5J80v7AmMgWUC9WT3nguk$61ADYywZnOEAWx+/Jp5ZOCv8yHuzobMGbzzGNtqE0po=	\N	f	TestUser2	Test	User2	testuser2@gmail.com	f	t	2022-06-16 20:03:40+07
3	pbkdf2_sha256$260000$ehAuJ3GaaN3lr16omJsdJM$Ao0dxc5KSh+rHY0n97SIF4IVxy/mX9VM7jRMpj6CyFg=	2022-06-16 20:20:16.803787+07	f	TestUser	Test	User	testuser@gmail.com	f	t	2022-06-16 20:03:02+07
2	pbkdf2_sha256$260000$jJXsZ1E0qVP7NHJt2pl6NN$px6KXZ85+n2xvaRhCzN0p1dGzvm/agDjB22sx5i1UBQ=	2022-06-17 16:23:30.699524+07	f	UserFikri	User	Fikri	userfikri@gmail.com	f	t	2022-06-16 18:56:09+07
1	pbkdf2_sha256$260000$uN5Fb8jfGSEubrCSbggipt$KHjC1w4crzeAy0lOwSu6/5L49lGQmjX8Sg8QIeKtY0s=	2022-06-18 09:39:52.953685+07	t	adminsupport	Admin Technical	Support	adminsupport@gmail.com	t	t	2022-06-16 18:55:44.504921+07
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: fikrimaulanar
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: fikrimaulanar
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: fikrimaulanar
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-06-16 18:56:09.826968+07	2	UserFikri	1	[{"added": {}}]	4	1
2	2022-06-16 18:56:18.809756+07	2	UserFikri	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
3	2022-06-16 20:03:02.961914+07	3	TestUser	1	[{"added": {}}]	4	1
4	2022-06-16 20:03:13.935923+07	3	TestUser	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
5	2022-06-16 20:03:22.405424+07	4	TestUser1	1	[{"added": {}}]	4	1
6	2022-06-16 20:03:33.043855+07	4	TestUser1	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
7	2022-06-16 20:03:40.825254+07	5	TestUser2	1	[{"added": {}}]	4	1
8	2022-06-16 20:03:49.071769+07	5	TestUser2	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
9	2022-06-17 10:19:37.320275+07	5	TicketComment object (5)	3		8	1
10	2022-06-17 10:19:37.419984+07	4	TicketComment object (4)	3		8	1
11	2022-06-17 10:19:37.43112+07	3	TicketComment object (3)	3		8	1
12	2022-06-17 10:19:37.442565+07	2	TicketComment object (2)	3		8	1
13	2022-06-17 10:19:37.45306+07	1	TicketComment object (1)	3		8	1
14	2022-06-17 10:30:09.435052+07	8	TicketComment object (8)	3		8	1
15	2022-06-17 10:30:09.456031+07	7	TicketComment object (7)	3		8	1
16	2022-06-17 10:30:09.467025+07	6	TicketComment object (6)	3		8	1
17	2022-06-17 10:38:29.165101+07	10	TicketComment object (10)	3		8	1
18	2022-06-17 10:38:29.258705+07	9	TicketComment object (9)	3		8	1
19	2022-06-17 10:40:43.30729+07	11	TicketComment object (11)	3		8	1
20	2022-06-17 10:54:13.108935+07	13	TicketComment object (13)	2	[{"changed": {"fields": ["Up_Doc"]}}]	8	1
21	2022-06-17 10:55:38.253417+07	13	TicketComment object (13)	3		8	1
22	2022-06-17 10:57:05.184718+07	4	adminsupport | Lorem Ipsum	2	[{"changed": {"fields": ["Up_File"]}}]	7	1
23	2022-06-17 10:59:14.941083+07	4	adminsupport | Lorem Ipsum	3		7	1
24	2022-06-17 10:59:15.034315+07	3	TestUser | Lorem Ipsum	3		7	1
25	2022-06-17 10:59:15.045169+07	2	TestUser | Lorem Ipsum	3		7	1
26	2022-06-17 10:59:15.056161+07	1	UserFikri | Lorem Ipsum	3		7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: fikrimaulanar
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	Ticket	ticket
8	Ticket	ticketcomment
9	members	profile
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: fikrimaulanar
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-06-16 18:55:00.608176+07
2	auth	0001_initial	2022-06-16 18:55:01.474687+07
3	Ticket	0001_initial	2022-06-16 18:55:01.763166+07
4	Ticket	0002_auto_20220614_1853	2022-06-16 18:55:01.812312+07
5	Ticket	0003_auto_20220615_2044	2022-06-16 18:55:01.833044+07
6	Ticket	0004_auto_20220616_1303	2022-06-16 18:55:01.863605+07
7	admin	0001_initial	2022-06-16 18:55:02.052005+07
8	admin	0002_logentry_remove_auto_add	2022-06-16 18:55:02.069231+07
9	admin	0003_logentry_add_action_flag_choices	2022-06-16 18:55:02.082272+07
10	contenttypes	0002_remove_content_type_name	2022-06-16 18:55:02.11798+07
11	auth	0002_alter_permission_name_max_length	2022-06-16 18:55:02.138367+07
12	auth	0003_alter_user_email_max_length	2022-06-16 18:55:02.161318+07
13	auth	0004_alter_user_username_opts	2022-06-16 18:55:02.183909+07
14	auth	0005_alter_user_last_login_null	2022-06-16 18:55:02.205768+07
15	auth	0006_require_contenttypes_0002	2022-06-16 18:55:02.218242+07
16	auth	0007_alter_validators_add_error_messages	2022-06-16 18:55:02.235167+07
17	auth	0008_alter_user_username_max_length	2022-06-16 18:55:02.279576+07
18	auth	0009_alter_user_last_name_max_length	2022-06-16 18:55:02.30382+07
19	auth	0010_alter_group_name_max_length	2022-06-16 18:55:02.327171+07
20	auth	0011_update_proxy_permissions	2022-06-16 18:55:02.346027+07
21	auth	0012_alter_user_first_name_max_length	2022-06-16 18:55:02.359004+07
22	members	0001_initial	2022-06-16 18:55:02.473201+07
23	sessions	0001_initial	2022-06-16 18:55:02.628294+07
24	Ticket	0005_auto_20220617_1020	2022-06-17 10:20:22.78461+07
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: fikrimaulanar
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
0ox4vjdv98bvkhqnzeenq96q6lyk6684	.eJxVjEEOwiAQRe_C2hAYBiou3XsGMgwTqRqalHZlvLtt0oVu33v_v1Widalp7TKnsaiLAnX6ZZn4KW0X5UHtPmme2jKPWe-JPmzXt6nI63q0fweVet3W7E2EEIjRI5KJOcoZA_ngHBZEA-BYosQBrGVxFCUHsINBQNh4UJ8vuOY2sg:1o28CQ:P8Pz5zyAbdy4G3NjF7OQ4Ud44SvRAxMOlgw53iXlmeo	2022-07-01 16:23:30.72177+07
rtidhbj8sq7qq8kc4l9ivzwj36ox9utc	.eJxVjEEOwiAQRe_C2hAGkTIu3fcMZIBBqgaS0q6Md7dNutDtf-_9t_C0LsWvnWc_JXEVIE6_W6D45LqD9KB6bzK2usxTkLsiD9rl2BK_bof7d1Col622RMignKUBQGe02WEAy5k0IqpoQXEyrIwBPYDJeNnMlPQZlXOIJD5fzL02-g:1o2B6Q:JaS-FC1dQmw1nT79zrMxvgA-4RpS1oi7F_TiS6qc1jI	2022-07-01 19:29:30.281409+07
ysy1f4s5004b06p3fatfkbhtu03zp7fl	.eJxVjEEOwiAQRe_C2hAGkTIu3fcMZIBBqgaS0q6Md7dNutDtf-_9t_C0LsWvnWc_JXEVIE6_W6D45LqD9KB6bzK2usxTkLsiD9rl2BK_bof7d1Col622RMignKUBQGe02WEAy5k0IqpoQXEyrIwBPYDJeNnMlPQZlXOIJD5fzL02-g:1o2ONN:ictkdWg4H0_n3ZBBzFcAT_Jeoa-Waci3qeUjCSw_Nrw	2022-07-02 09:39:53.178493+07
\.


--
-- Data for Name: members_profile; Type: TABLE DATA; Schema: public; Owner: fikrimaulanar
--

COPY public.members_profile (id, "Address", "Birth", "Phone", user_id) FROM stdin;
4	\N	\N	\N	4
5	\N	\N	\N	5
3	\N	\N	\N	3
2	\N	\N	\N	2
1	\N	\N	\N	1
\.


--
-- Name: Ticket_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fikrimaulanar
--

SELECT pg_catalog.setval('public."Ticket_ticket_id_seq"', 7, true);


--
-- Name: Ticket_ticketcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fikrimaulanar
--

SELECT pg_catalog.setval('public."Ticket_ticketcomment_id_seq"', 23, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fikrimaulanar
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fikrimaulanar
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fikrimaulanar
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fikrimaulanar
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fikrimaulanar
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fikrimaulanar
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fikrimaulanar
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 26, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fikrimaulanar
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fikrimaulanar
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: members_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fikrimaulanar
--

SELECT pg_catalog.setval('public.members_profile_id_seq', 5, true);


--
-- Name: Ticket_ticket Ticket_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public."Ticket_ticket"
    ADD CONSTRAINT "Ticket_ticket_pkey" PRIMARY KEY (id);


--
-- Name: Ticket_ticketcomment Ticket_ticketcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public."Ticket_ticketcomment"
    ADD CONSTRAINT "Ticket_ticketcomment_pkey" PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: members_profile members_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.members_profile
    ADD CONSTRAINT members_profile_pkey PRIMARY KEY (id);


--
-- Name: members_profile members_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.members_profile
    ADD CONSTRAINT members_profile_user_id_key UNIQUE (user_id);


--
-- Name: Ticket_ticket_Customer_id_5b5290c1; Type: INDEX; Schema: public; Owner: fikrimaulanar
--

CREATE INDEX "Ticket_ticket_Customer_id_5b5290c1" ON public."Ticket_ticket" USING btree ("Customer_id");


--
-- Name: Ticket_ticketcomment_admin_id_728c94e5; Type: INDEX; Schema: public; Owner: fikrimaulanar
--

CREATE INDEX "Ticket_ticketcomment_admin_id_728c94e5" ON public."Ticket_ticketcomment" USING btree (admin_id);


--
-- Name: Ticket_ticketcomment_ticket_id_f1963115; Type: INDEX; Schema: public; Owner: fikrimaulanar
--

CREATE INDEX "Ticket_ticketcomment_ticket_id_f1963115" ON public."Ticket_ticketcomment" USING btree (ticket_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: fikrimaulanar
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: fikrimaulanar
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: fikrimaulanar
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: fikrimaulanar
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: fikrimaulanar
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: fikrimaulanar
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: fikrimaulanar
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: fikrimaulanar
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: fikrimaulanar
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: fikrimaulanar
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: fikrimaulanar
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: fikrimaulanar
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: fikrimaulanar
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: Ticket_ticket Ticket_ticket_Customer_id_5b5290c1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public."Ticket_ticket"
    ADD CONSTRAINT "Ticket_ticket_Customer_id_5b5290c1_fk_auth_user_id" FOREIGN KEY ("Customer_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Ticket_ticketcomment Ticket_ticketcomment_admin_id_728c94e5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public."Ticket_ticketcomment"
    ADD CONSTRAINT "Ticket_ticketcomment_admin_id_728c94e5_fk_auth_user_id" FOREIGN KEY (admin_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Ticket_ticketcomment Ticket_ticketcomment_ticket_id_f1963115_fk_Ticket_ticket_id; Type: FK CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public."Ticket_ticketcomment"
    ADD CONSTRAINT "Ticket_ticketcomment_ticket_id_f1963115_fk_Ticket_ticket_id" FOREIGN KEY (ticket_id) REFERENCES public."Ticket_ticket"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: members_profile members_profile_user_id_f907d594_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fikrimaulanar
--

ALTER TABLE ONLY public.members_profile
    ADD CONSTRAINT members_profile_user_id_f907d594_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

