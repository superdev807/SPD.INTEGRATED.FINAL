--
-- PostgreSQL database dump
--

-- Dumped from database version 10.9
-- Dumped by pg_dump version 11.4

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

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO spd_web_django_local;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO spd_web_django_local;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO spd_web_django_local;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO spd_web_django_local;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO spd_web_django_local;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO spd_web_django_local;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: spd_web_django_local
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


ALTER TABLE public.auth_user OWNER TO spd_web_django_local;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO spd_web_django_local;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO spd_web_django_local;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO spd_web_django_local;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO spd_web_django_local;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO spd_web_django_local;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: spd_web_django_local
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


ALTER TABLE public.django_admin_log OWNER TO spd_web_django_local;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO spd_web_django_local;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO spd_web_django_local;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO spd_web_django_local;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO spd_web_django_local;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO spd_web_django_local;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO spd_web_django_local;

--
-- Name: spd_pharmacies; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.spd_pharmacies (
    id integer NOT NULL,
    "URL" character varying(4000) NOT NULL,
    "City" character varying(2000) NOT NULL,
    "State" character varying(20) NOT NULL,
    "Zip" character varying(50) NOT NULL,
    "Phone" character varying(500) NOT NULL,
    "Conditions" character varying(1000) NOT NULL,
    "Contact_Email" character varying(6000) NOT NULL,
    "Contact" character varying(6000) NOT NULL,
    "Accreditation" character varying(6000) NOT NULL,
    "Owner_Independent" character varying(6000) NOT NULL,
    "Patient_Services" character varying(6000) NOT NULL,
    "Payer_Services" character varying(6000) NOT NULL,
    "Pharma_Services" character varying(6000) NOT NULL,
    "Locations" character varying(6000) NOT NULL,
    "Limted_Distribution_Drugs" character varying(6000) NOT NULL,
    "Company_Type" character varying(2000) NOT NULL,
    "Name" character varying(1200) NOT NULL,
    "Street" character varying(3000) NOT NULL,
    "State_full" character varying(500) NOT NULL
);


ALTER TABLE public.spd_pharmacies OWNER TO spd_web_django_local;

--
-- Name: spd_pharmacies_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.spd_pharmacies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spd_pharmacies_id_seq OWNER TO spd_web_django_local;

--
-- Name: spd_pharmacies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.spd_pharmacies_id_seq OWNED BY public.spd_pharmacies.id;


--
-- Name: spd_subscription_options_access; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.spd_subscription_options_access (
    id integer NOT NULL,
    display character varying(120)
);


ALTER TABLE public.spd_subscription_options_access OWNER TO spd_web_django_local;

--
-- Name: spd_subscription_options_access_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.spd_subscription_options_access_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spd_subscription_options_access_id_seq OWNER TO spd_web_django_local;

--
-- Name: spd_subscription_options_access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.spd_subscription_options_access_id_seq OWNED BY public.spd_subscription_options_access.id;


--
-- Name: spd_subscription_options_cost; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.spd_subscription_options_cost (
    id integer NOT NULL,
    display character varying(120) NOT NULL,
    cost integer
);


ALTER TABLE public.spd_subscription_options_cost OWNER TO spd_web_django_local;

--
-- Name: spd_subscription_options_cost_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.spd_subscription_options_cost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spd_subscription_options_cost_id_seq OWNER TO spd_web_django_local;

--
-- Name: spd_subscription_options_cost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.spd_subscription_options_cost_id_seq OWNED BY public.spd_subscription_options_cost.id;


--
-- Name: spd_subscription_options_duration; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.spd_subscription_options_duration (
    display character varying(120) NOT NULL,
    calendar_days integer
);


ALTER TABLE public.spd_subscription_options_duration OWNER TO spd_web_django_local;

--
-- Name: spd_subscription_options_records; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.spd_subscription_options_records (
    id integer NOT NULL,
    display character varying(25),
    records integer
);


ALTER TABLE public.spd_subscription_options_records OWNER TO spd_web_django_local;

--
-- Name: spd_subscription_options_records_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.spd_subscription_options_records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spd_subscription_options_records_id_seq OWNER TO spd_web_django_local;

--
-- Name: spd_subscription_options_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.spd_subscription_options_records_id_seq OWNED BY public.spd_subscription_options_records.id;


--
-- Name: spd_subscription_options_renewable; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.spd_subscription_options_renewable (
    id integer NOT NULL,
    display character varying(120) NOT NULL,
    is_renewable boolean NOT NULL
);


ALTER TABLE public.spd_subscription_options_renewable OWNER TO spd_web_django_local;

--
-- Name: spd_subscription_options_renewable_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.spd_subscription_options_renewable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spd_subscription_options_renewable_id_seq OWNER TO spd_web_django_local;

--
-- Name: spd_subscription_options_renewable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.spd_subscription_options_renewable_id_seq OWNED BY public.spd_subscription_options_renewable.id;


--
-- Name: spd_subscription_options_trial; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.spd_subscription_options_trial (
    id integer NOT NULL,
    display character varying(120) NOT NULL,
    is_trial boolean NOT NULL
);


ALTER TABLE public.spd_subscription_options_trial OWNER TO spd_web_django_local;

--
-- Name: spd_subscription_options_trial_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.spd_subscription_options_trial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spd_subscription_options_trial_id_seq OWNER TO spd_web_django_local;

--
-- Name: spd_subscription_options_trial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.spd_subscription_options_trial_id_seq OWNED BY public.spd_subscription_options_trial.id;


--
-- Name: spd_subscription_options_user_type; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.spd_subscription_options_user_type (
    id integer NOT NULL,
    display character varying(120) NOT NULL,
    max_users integer NOT NULL
);


ALTER TABLE public.spd_subscription_options_user_type OWNER TO spd_web_django_local;

--
-- Name: spd_subscription_options_user_type_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.spd_subscription_options_user_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spd_subscription_options_user_type_id_seq OWNER TO spd_web_django_local;

--
-- Name: spd_subscription_options_user_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.spd_subscription_options_user_type_id_seq OWNED BY public.spd_subscription_options_user_type.id;


--
-- Name: spd_subscription_type; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.spd_subscription_type (
    id integer NOT NULL,
    "Access" character varying(60) NOT NULL,
    "Duration" character varying(60) NOT NULL,
    "User_Type" character varying(60) NOT NULL,
    "Records" character varying(60) NOT NULL,
    "Cost" character varying(60) NOT NULL,
    "Renewable" character varying(60) NOT NULL,
    "Trial" character varying(60) NOT NULL
);


ALTER TABLE public.spd_subscription_type OWNER TO spd_web_django_local;

--
-- Name: spd_subscription_type_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.spd_subscription_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spd_subscription_type_id_seq OWNER TO spd_web_django_local;

--
-- Name: spd_subscription_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.spd_subscription_type_id_seq OWNED BY public.spd_subscription_type.id;


--
-- Name: spd_test_fk_subscription_type; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.spd_test_fk_subscription_type (
    id integer NOT NULL,
    "Access_id" integer,
    "Cost_id" integer,
    "Duration_id" integer,
    "Records_id" integer,
    "Renewable_id" integer,
    "Trial_id" integer,
    "User_Type_id" integer,
    "Description" text,
    "Active" boolean NOT NULL,
    assigned_name character varying(100),
    "Testing" boolean NOT NULL
);


ALTER TABLE public.spd_test_fk_subscription_type OWNER TO spd_web_django_local;

--
-- Name: spd_test_fk_subscription_type_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.spd_test_fk_subscription_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spd_test_fk_subscription_type_id_seq OWNER TO spd_web_django_local;

--
-- Name: spd_test_fk_subscription_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.spd_test_fk_subscription_type_id_seq OWNED BY public.spd_test_fk_subscription_type.id;


--
-- Name: spd_test_subscription_type; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.spd_test_subscription_type (
    id integer NOT NULL,
    "Access" character varying(60) NOT NULL,
    "Duration" character varying(60) NOT NULL,
    "User_Type" character varying(60) NOT NULL,
    "Records" character varying(60) NOT NULL,
    "Cost" character varying(60) NOT NULL,
    "Renewable" character varying(60) NOT NULL,
    "Trial" character varying(60) NOT NULL,
    "Description" text
);


ALTER TABLE public.spd_test_subscription_type OWNER TO spd_web_django_local;

--
-- Name: spd_test_subscription_type_id_seq; Type: SEQUENCE; Schema: public; Owner: spd_web_django_local
--

CREATE SEQUENCE public.spd_test_subscription_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spd_test_subscription_type_id_seq OWNER TO spd_web_django_local;

--
-- Name: spd_test_subscription_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spd_web_django_local
--

ALTER SEQUENCE public.spd_test_subscription_type_id_seq OWNED BY public.spd_test_subscription_type.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: spd_web_django_local
--

CREATE TABLE public.users_user (
    email character varying(60) NOT NULL,
    password character varying(60) NOT NULL,
    first_name character varying(60) NOT NULL,
    last_name character varying(60) NOT NULL,
    org_name character varying(60),
    org_type character varying(60),
    org_age character varying(60),
    org_location character varying(60),
    org_leadership_ethnicity character varying(60)
);


ALTER TABLE public.users_user OWNER TO spd_web_django_local;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: spd_pharmacies id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_pharmacies ALTER COLUMN id SET DEFAULT nextval('public.spd_pharmacies_id_seq'::regclass);


--
-- Name: spd_subscription_options_access id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_subscription_options_access ALTER COLUMN id SET DEFAULT nextval('public.spd_subscription_options_access_id_seq'::regclass);


--
-- Name: spd_subscription_options_cost id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_subscription_options_cost ALTER COLUMN id SET DEFAULT nextval('public.spd_subscription_options_cost_id_seq'::regclass);


--
-- Name: spd_subscription_options_records id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_subscription_options_records ALTER COLUMN id SET DEFAULT nextval('public.spd_subscription_options_records_id_seq'::regclass);


--
-- Name: spd_subscription_options_renewable id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_subscription_options_renewable ALTER COLUMN id SET DEFAULT nextval('public.spd_subscription_options_renewable_id_seq'::regclass);


--
-- Name: spd_subscription_options_trial id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_subscription_options_trial ALTER COLUMN id SET DEFAULT nextval('public.spd_subscription_options_trial_id_seq'::regclass);


--
-- Name: spd_subscription_options_user_type id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_subscription_options_user_type ALTER COLUMN id SET DEFAULT nextval('public.spd_subscription_options_user_type_id_seq'::regclass);


--
-- Name: spd_subscription_type id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_subscription_type ALTER COLUMN id SET DEFAULT nextval('public.spd_subscription_type_id_seq'::regclass);


--
-- Name: spd_test_fk_subscription_type id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_test_fk_subscription_type ALTER COLUMN id SET DEFAULT nextval('public.spd_test_fk_subscription_type_id_seq'::regclass);


--
-- Name: spd_test_subscription_type id; Type: DEFAULT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_test_subscription_type ALTER COLUMN id SET DEFAULT nextval('public.spd_test_subscription_type_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
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
19	Can add pharmacies	7	add_pharmacies
20	Can change pharmacies	7	change_pharmacies
21	Can delete pharmacies	7	delete_pharmacies
22	Can add subscription_type	8	add_subscription_type
23	Can change subscription_type	8	change_subscription_type
24	Can delete subscription_type	8	delete_subscription_type
25	Can add test_subscription_type	9	add_test_subscription_type
26	Can change test_subscription_type	9	change_test_subscription_type
27	Can delete test_subscription_type	9	delete_test_subscription_type
28	Can add subscription_ options_ access	10	add_subscription_options_access
29	Can change subscription_ options_ access	10	change_subscription_options_access
30	Can delete subscription_ options_ access	10	delete_subscription_options_access
31	Can add subscription_ options_ cost	11	add_subscription_options_cost
32	Can change subscription_ options_ cost	11	change_subscription_options_cost
33	Can delete subscription_ options_ cost	11	delete_subscription_options_cost
34	Can add subscription_ options_ duration	12	add_subscription_options_duration
35	Can change subscription_ options_ duration	12	change_subscription_options_duration
36	Can delete subscription_ options_ duration	12	delete_subscription_options_duration
37	Can add subscription_ options_ records	13	add_subscription_options_records
38	Can change subscription_ options_ records	13	change_subscription_options_records
39	Can delete subscription_ options_ records	13	delete_subscription_options_records
40	Can add subscription_ options_ renewable	14	add_subscription_options_renewable
41	Can change subscription_ options_ renewable	14	change_subscription_options_renewable
42	Can delete subscription_ options_ renewable	14	delete_subscription_options_renewable
43	Can add subscription_ options_ trial	15	add_subscription_options_trial
44	Can change subscription_ options_ trial	15	change_subscription_options_trial
45	Can delete subscription_ options_ trial	15	delete_subscription_options_trial
46	Can add subscription_ options_ user_ type	16	add_subscription_options_user_type
47	Can change subscription_ options_ user_ type	16	change_subscription_options_user_type
48	Can delete subscription_ options_ user_ type	16	delete_subscription_options_user_type
49	Can add test_fk_subscription_type	17	add_test_fk_subscription_type
50	Can change test_fk_subscription_type	17	change_test_fk_subscription_type
51	Can delete test_fk_subscription_type	17	delete_test_fk_subscription_type
52	Can add user	18	add_user
53	Can change user	18	change_user
54	Can delete user	18	delete_user
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$100000$2hm90W606MV7$XOqZ6d5AMGBuesqKqQyxmOJU/UKYiFwZTWWgONn+wNI=	2019-08-12 18:37:25.29979-04	t	richael			michael.rinaldi.01@gmail.com	t	t	2019-08-12 18:36:24.936454-04
2	pbkdf2_sha256$100000$OW3YJsRSABJD$pa/SfWYLZ+N2S3P6vIQNf+Rq8gHhDeiZ7+Dr1pIky+I=	\N	t	michael			michael.rinaldi.01@gmail.com	t	t	2019-10-05 16:50:14.06834-04
3	pbkdf2_sha256$100000$mpSwIkXCSEAj$Dh/ASEWgzeqMudE9cXo2+nTvYewVVVlJhHfrc2wWUw8=	2019-10-05 16:52:32.029773-04	t	steve			steve@steve.com	t	t	2019-10-05 16:52:00.84279-04
4	pbkdf2_sha256$100000$4YuRgZXF89oE$p70dVqMatQ1ZJjtK/Q64fyrG1OEGybDgiUnBz1qn+1E=	2019-10-29 23:04:43.940052-04	t	rike			rike@rike.com	t	t	2019-10-29 23:04:32.911478-04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-10-29 23:08:52.042018-04	1	Pro	1	[{"added": {}}]	10	4
2	2019-10-29 23:08:56.21328-04	2	Basic	1	[{"added": {}}]	10	4
3	2019-10-29 23:09:35.025804-04	1	Multi (Max 6)	1	[{"added": {}}]	16	4
4	2019-10-29 23:12:15.656494-04	1	7 Days	1	[{"added": {}}]	12	4
5	2019-10-29 23:12:29.990265-04	2	Single	1	[{"added": {}}]	16	4
6	2019-10-29 23:12:47.023742-04	1	25	1	[{"added": {}}]	13	4
7	2019-10-29 23:13:15.549851-04	1	100	1	[{"added": {}}]	11	4
8	2019-10-29 23:13:38.958363-04	1	Yes	1	[{"added": {}}]	14	4
9	2019-10-29 23:13:51.691386-04	1	Yes	1	[{"added": {}}]	15	4
10	2019-10-29 23:14:27.335229-04	1	Basic	1	[{"added": {}}]	17	4
11	2019-10-29 23:21:32.714346-04	3	Multi Basic	1	[{"added": {}}]	10	4
12	2019-10-29 23:21:41.009921-04	4	Multi Pro	1	[{"added": {}}]	10	4
13	2019-10-29 23:22:31.56724-04	2	Weekly	1	[{"added": {}}]	12	4
14	2019-10-29 23:22:56.322128-04	3	Monthly	1	[{"added": {}}]	12	4
15	2019-10-29 23:23:14.05328-04	4	Annually	1	[{"added": {}}]	12	4
16	2019-10-29 23:23:53.63278-04	2	something 50	1	[{"added": {}}]	13	4
17	2019-10-29 23:24:11.38455-04	3	Entire DB	1	[{"added": {}}]	13	4
18	2019-10-29 23:24:26.144491-04	4	50	1	[{"added": {}}]	13	4
19	2019-10-29 23:24:52.648762-04	2	Yes	1	[{"added": {}}]	15	4
20	2019-10-29 23:24:59.296882-04	2	No	2	[{"changed": {"fields": ["display", "is_trial"]}}]	15	4
21	2019-10-29 23:25:51.892032-04	1	Yes	2	[]	14	4
22	2019-10-29 23:25:55.815178-04	2	No	1	[{"added": {}}]	14	4
23	2019-10-29 23:28:11.211135-04	2	11	1	[{"added": {}}]	17	4
24	2019-10-29 23:50:42.994593-04	2	149	1	[{"added": {}}]	11	4
25	2019-10-29 23:50:58.021083-04	3	22	1	[{"added": {}}]	17	4
26	2019-10-29 23:51:35.128883-04	3	500	1	[{"added": {}}]	11	4
27	2019-10-29 23:51:45.813638-04	4	33	1	[{"added": {}}]	17	4
28	2019-10-29 23:52:12.674357-04	1	Basic	3		17	4
29	2019-10-29 23:52:58.833287-04	4	1000	1	[{"added": {}}]	11	4
30	2019-10-29 23:53:18.932224-04	5	55	1	[{"added": {}}]	17	4
31	2019-10-29 23:53:26.373771-04	5	44	2	[{"changed": {"fields": ["assigned_name"]}}]	17	4
32	2019-10-29 23:53:56.079404-04	5	1250	1	[{"added": {}}]	11	4
33	2019-10-29 23:54:09.868873-04	6	66	1	[{"added": {}}]	17	4
34	2019-10-29 23:54:13.892538-04	6	5	2	[{"changed": {"fields": ["assigned_name"]}}]	17	4
35	2019-10-29 23:55:21.782765-04	6	3500	1	[{"added": {}}]	11	4
36	2019-10-29 23:55:30.995344-04	7	6	1	[{"added": {}}]	17	4
37	2019-10-29 23:55:37.567155-04	7	6	2	[{"changed": {"fields": ["Active", "Testing"]}}]	17	4
38	2019-10-29 23:56:29.996202-04	7	250	1	[{"added": {}}]	11	4
39	2019-10-29 23:56:45.464808-04	8	777	1	[{"added": {}}]	17	4
40	2019-10-29 23:58:27.810154-04	8	750	1	[{"added": {}}]	11	4
41	2019-10-29 23:58:40.32595-04	9	888	1	[{"added": {}}]	17	4
42	2019-10-29 23:59:10.526989-04	8	777	2	[{"changed": {"fields": ["Records"]}}]	17	4
43	2019-10-30 00:00:08.436751-04	9	1250	1	[{"added": {}}]	11	4
44	2019-10-30 00:00:23.769263-04	10	99	1	[{"added": {}}]	17	4
45	2019-10-30 00:01:13.739938-04	10	2750	1	[{"added": {}}]	11	4
46	2019-10-30 00:01:33.921206-04	11	100	1	[{"added": {}}]	17	4
47	2019-10-30 00:02:16.217432-04	2	1	2	[{"changed": {"fields": ["assigned_name"]}}]	17	4
48	2019-10-30 00:02:25.145067-04	3	2	2	[{"changed": {"fields": ["assigned_name"]}}]	17	4
49	2019-10-30 00:02:30.648403-04	4	3	2	[{"changed": {"fields": ["assigned_name"]}}]	17	4
50	2019-10-30 00:02:36.082284-04	5	4	2	[{"changed": {"fields": ["assigned_name"]}}]	17	4
51	2019-10-30 00:02:40.202262-04	8	7	2	[{"changed": {"fields": ["assigned_name"]}}]	17	4
52	2019-10-30 00:02:43.920162-04	9	8	2	[{"changed": {"fields": ["assigned_name"]}}]	17	4
53	2019-10-30 00:02:49.456912-04	10	9	2	[{"changed": {"fields": ["assigned_name"]}}]	17	4
54	2019-10-30 00:02:53.728715-04	11	10	2	[{"changed": {"fields": ["assigned_name"]}}]	17	4
55	2019-10-30 00:03:33.273142-04	11	3500	1	[{"added": {}}]	11	4
56	2019-10-30 00:03:44.97223-04	12	11	1	[{"added": {}}]	17	4
57	2019-10-30 00:05:34.236189-04	12	11500	1	[{"added": {}}]	11	4
58	2019-10-30 00:05:47.457731-04	13	12	1	[{"added": {}}]	17	4
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	spd	pharmacies
8	spd	subscription_type
9	spd	test_subscription_type
10	spd	subscription_options_access
11	spd	subscription_options_cost
12	spd	subscription_options_duration
13	spd	subscription_options_records
14	spd	subscription_options_renewable
15	spd	subscription_options_trial
16	spd	subscription_options_user_type
17	spd	test_fk_subscription_type
18	users	user
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-08-12 18:35:09.63268-04
2	auth	0001_initial	2019-08-12 18:35:09.679-04
3	admin	0001_initial	2019-08-12 18:35:09.713518-04
4	admin	0002_logentry_remove_auto_add	2019-08-12 18:35:09.722987-04
5	contenttypes	0002_remove_content_type_name	2019-08-12 18:35:09.73967-04
6	auth	0002_alter_permission_name_max_length	2019-08-12 18:35:09.744256-04
7	auth	0003_alter_user_email_max_length	2019-08-12 18:35:09.753376-04
8	auth	0004_alter_user_username_opts	2019-08-12 18:35:09.759843-04
9	auth	0005_alter_user_last_login_null	2019-08-12 18:35:09.768269-04
10	auth	0006_require_contenttypes_0002	2019-08-12 18:35:09.769638-04
11	auth	0007_alter_validators_add_error_messages	2019-08-12 18:35:09.776072-04
12	auth	0008_alter_user_username_max_length	2019-08-12 18:35:09.787937-04
13	auth	0009_alter_user_last_name_max_length	2019-08-12 18:35:09.795297-04
14	sessions	0001_initial	2019-08-12 18:35:09.800996-04
15	spd	0001_initial	2019-08-12 18:35:09.810169-04
16	spd	0002_test_subscription_type	2019-08-12 18:35:09.814711-04
17	spd	0003_subscription_options_access_subscription_options_cost_subscription_options_duration_subscription_opt	2019-08-12 18:35:09.836899-04
18	spd	0004_auto_20190408_0136	2019-08-12 18:35:09.864927-04
19	spd	0005_subscription_options_duration_calendar_days	2019-08-12 18:35:09.869193-04
20	spd	0006_auto_20190408_0219	2019-08-12 18:35:09.872526-04
21	spd	0007_auto_20190408_0221	2019-08-12 18:35:09.876982-04
22	spd	0008_test_subscription_type_description	2019-08-12 18:35:09.881137-04
23	spd	0009_test_fk_subscription_type_description	2019-08-12 18:35:09.888946-04
24	spd	0010_auto_20190408_0228	2019-08-12 18:35:09.90842-04
25	spd	0011_auto_20190408_0230	2019-08-12 18:35:09.929382-04
26	spd	0012_auto_20190408_0235	2019-08-12 18:35:09.952603-04
27	spd	0013_auto_20190408_0238	2019-08-12 18:35:09.961258-04
28	spd	0014_auto_20190408_0241	2019-08-12 18:35:09.969428-04
29	spd	0015_auto_20190408_0245	2019-08-12 18:35:09.985854-04
30	spd	0016_auto_20190408_0248	2019-08-12 18:35:09.994111-04
31	spd	0017_subscription_options_cost_cost	2019-08-12 18:35:09.999377-04
32	spd	0018_test_fk_subscription_type_assigned_name	2019-08-12 18:35:10.007297-04
33	spd	0019_test_fk_subscription_type_testing	2019-08-12 18:35:10.01962-04
34	spd	0020_auto_20190408_0338	2019-08-12 18:35:10.071541-04
35	spd	0021_pharmacies_state_full	2019-08-12 18:35:10.079076-04
36	spd	0022_auto_20190408_0546	2019-08-12 18:35:10.087175-04
37	spd	0023_auto_20190408_0602	2019-08-12 18:35:10.129731-04
38	spd	0024_auto_20190408_0603	2019-08-12 18:35:10.149113-04
39	spd	0025_auto_20190814_1604	2019-08-14 12:04:44.614519-04
40	users	0001_initial	2019-08-14 12:57:43.66495-04
41	spd	0026_auto_20191030_0558	2019-10-30 01:58:56.149126-04
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
wp6zeng5ayv8d8ikg5b84vz84vcz2q8r	M2IwMmE4ZTM5OTE4YTdiYjMzZDQ5OTI3MjAzOWU3YzVhY2JlZWYwZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNmU3ZDEwODg1MjZkZGNkNmZkMTJlNWMwNDAwYjEwMGMzMzEwODdhIn0=	2019-08-26 18:37:25.301895-04
zxdubfqr4hnjxyn3qinukg69z0ogfmh1	YmUxZDJiNTAzZjZkMTFkMWYyNmFjODMyZWIzNzA3MzJiNDA1NDAyZTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZWQwNzFjMzBlZGM0NzdmZTQzYmEzNjM0MzA1ODMxMzc1NjhiMjAyIn0=	2019-10-19 16:52:32.033406-04
3oez37i5rppfix3r1yal5yda5qb83e73	M2Q4MmUyZmRhYWExYzNiOGYxY2I4MzdjNTc2Mzg2MmZmYzk3MDE5Njp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZGI5OWE4MTUyZjcxZjI0MGZlYjQxZDBhZTBjYTA0NTUwY2I2YzVmIn0=	2019-11-12 22:04:43.943854-05
\.


--
-- Data for Name: spd_pharmacies; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.spd_pharmacies (id, "URL", "City", "State", "Zip", "Phone", "Conditions", "Contact_Email", "Contact", "Accreditation", "Owner_Independent", "Patient_Services", "Payer_Services", "Pharma_Services", "Locations", "Limted_Distribution_Drugs", "Company_Type", "Name", "Street", "State_full") FROM stdin;
518	http://specialtypharmacynewportrichey.com/	New Port Richey	FL	34655	--place holder	HIV, Renal Disease, Hepatitis			URAC	Independent	Refill and transfer prescriptions, Chronic disease management technicians		Patient Assistance programs, Manufacturer programs, Co-pay cards			Private	AB Specialty Pharmacy	2311 Seven Springs Blvd	Florida
519	http://www.acariahealth.com	Orlando	FL	32822	--place holder	Oncology, Crohn's Disease, Hepatitis, HIV, Growth Hormone, Multiple Sclerosis, Rheumatoid Arthritis	don.howard@acariahealth.com	Don Howard	URAC	Envolve Pharmacy Solutions	Clinical programs and support; nursing services; pharmacist available 24/7; claims processing and reimbursement support; copay assistance program; drug therapy training; delivery	Integrated pharmacy and medical specialty drug management, clinical programs support, trend management initiatives, coordination of nursing services, patient education and training, clinical and account management team, copay assistance, billing options, real-time data analysis	Patient copay and reimbursement support; protocol-driven clinical support, REMS and registry programs, disease education and management, limited distribution programs, real-time data analysis, national physician sales network, HUB services, clinical trial participation	Orlando, FL; Columbus, GA; Fairfax, VA; Falls Church, VA; Houston, TX; Lenexa, KS; Commerce, CA; Hawthorne, NY; Raleigh, NC; Sacramento, CA; Slidell, LA; Troy, MI; Wilmington, MA	Actemra, Adcetris, Afinitor, Aldurazyme, Alprolix, Aristada, Arzerra, Avastin, Beleodaq, Benlysta, Bethkis, Blincyto, Bosulif, Ceredase, Cerezyme, Corifact, Cosentyx, Dacogen, Daraprim, Dificid, Dysport, Egrifta, Elaprase, Eloctate, Empliciti, Entyvio, Fabrazyme, Firazyr, Gazyva, Gilenya, Hemlimbra, Herceptin, Hizentra, Hurmira, Hycamtin Oral, Ibrance, Inlyta, Jadenu, Kadcyla, Krystexxa, Lucentis, Macugen, Makena, Mekinist, Mozobil, Myozyme, Naglazyme, Nexavar, NovoEight, NovoSeven, Nplate, Nucala, Nutropin AQ, Opdivo, Otezla, Perjeta, Plegridy, Praluent, Promacta, ProThelial, Repatha, Rituxan, Rixubis, Serostim, Simponi UC, Soliris, Somatuline, Stivarga, Supprelin LA, Sutent, Sylatron, Synagis, Tafinlar, Tarceva, Tasigna, Tecfidera, Thyrogen, Tikosyn, Tobi, Tykerb, Tysabri, Valstar, Vantas, Vecamyl, Velcade, Visudyne, Votrient, Vpriv, Xalkori, Xeomin, Xolair, Xtandi, Yervoy, Zolinza, Zytiga	Subsidiary	AcariaHealth	6923 Lee Vista Blvd, Suite 300	Florida
520	http://www.accredo.com	Memphis	TN	38134	--place holder	Bleeding Disorders, Cystic Fibrosis, Fabry Disease, Gaucher Disease, Growth Hormone, Hemophilia, Hepatitis C, HIV, Hyperlipidemia, Immunology, Fertility, Lupus, Multiple Sclerosis, Neutropenia, Oncology, Osteoarthritis, Osteoporosis, Parkinson's Disease, RSV, Rheumatoid Arthritis, Transplantation	vic.perini@acariahealth.com	Vic Perini	URAC, JCAHO	Express Scripts	Specialty care programs, patient assistance programs, Refill reminders		Adherence, pre-launch services		Adempas, Arcalyst, Carbaglu, Duopa, Gilotrif, Myalept, Orenitram ER, Procysbi, Remodulin, Signifor, Aralast NP® ,GlassiaTM, Zemaira®, Nucala®, Oralair®, Xolair®, Mozobil®, Promacta®, Abraxane®, AdcetrisTM, Alecensa®, Arzerra®, Avastin®, Bosulif®, CabometyxTM, Cotellic ®, Dacogen®, Erbitux®, ErivedgeTM, Folotyn®, GazyvaTM, Hemlimbra, Herceptin®, Hycamtin®, Hycamtin®, Ibrance®, Inlyta®, Intron A ®, Iressa®, Ixempra®, JakafiTM, KadcylaTM, Kepivance®, LenvimaTM, Lonsurf®, LynparzaTM, MekinistTM, Nexavar®, Ninlaro®, PerjetaTM, Pomalyst®, Revlimid®, Rituxan®, Stivarga®, Sutent®, SylatronTM, Sylvant TM, Tafinlar®, TagrissoTM, Tarceva®, TecentriqTM, Thalomid®, Tykerb®, ValchlorTM, Valstar®, Vantas®, Vidaza®, Votrient®, Xtandi®, YervoyT, Xalkori®, Zaltrap®, Zelboraf, Zolinza, Zytiga, Nexplanon, Bethkis®, Cayston®, KalydecoTM, Kitabis PakTM, OrkambiT, Tobi® (tobramycin), Tobi Podhaler, Egrifta, Kuvan, Natpara®, Samsca®, Somatuline Depot®, Somatuline Depot®, Somavert®, Supprelin LA, Aldurazyme, Cerezyme®, Elaprase, Fabrazyme, LumizymeTM, Naglazyme, Ravicti, VimizimTM, VPRIVT, Increlex, Advate®, AdynovateTM, Afstyla®, Alphanate®, Alphanine SD®, AlprolixTM, Bebulin®, Benefix®, EloctateTM, Feiba NF®, Helixate FS®, Hemofil M®, Humate-P ®, Idelvion®, Ixinity®, Koate-DVI®, Kogenate FS®, Kovaltry®, Monoclate-P ®, Mononine®, Novoeight®, Novoseven RT®, Nuwiq®, Profilnine SD®, RecombinateTM, RiaSTAP®, RixubisTM, Tretten, Wilate®, Xyntha®, Berinert®, Cinryze®, Firazyr®, Kalbitor®, Ruconest®, KynamroTM, PraluentT, EsbrietTM OFEV®, Cytogam®, Flebogamma®, Gamastan S-D ®, Gammagard Liquid®, Gammagard S-D ®,, Gamunex-C ®, HizentraTM, HyQvia TM, Privigen, Actemra®, Arcalyst®, Cimzia®, Cosentyx, Humira®(Pediatric), Ilaris®, Otezla, Taltz, Exjade, Acthar H.P. Gel® ,Actimmune®, Apokyn, CeprotinT, DuopaTM, Dysport®, Gattex®, Hetlioz, Krystexxa® Makena, Northera TM, NuplazidTM, OcalivaT, ProthelialT, Sabril®, Solesta®, Soliris®, Thyrogen, Xenazine®, Xiaflex, AmpyraTM, Aubagio, Lemtrada, TecfideraTM, Tysabri, Eylea®, Iluvien, Lucentis®, Macugen, Visudyne, Adempas®, Letairis®, Opsumit®, OrenitramTM, Remodulin®, Tracleer® Tyvaso®, Uptravi®, Veletri®, Ventavis®, Synagis	Subsidiary	Accredo Specialty Pharmacy	1640 Century Center Pkwy Ste 110	Tennessee
521	http://accuraterx.net 	Columbia	MO	65203	--place holder	Asthma, Crohn's Disease, Cystic Fibrosis, Growth Hormone, Hemophilia, Hepatitis C, HIV, Multiple Sclerosis, Rheumatoid Arthritis, Von Willebrand Disease	kmaloney@accuraterx.net	Kirsten Moloney	ACHC	Independent	Customized care coordination, Pharmacy Dispensing and DME, Home Infusion Nursing, 24/7 Pharmacist, Insurance Experts	24/7 Pharmacist, Nurse Case Manager, Insurance Verification and PA Retrieval, Quarterly Reporting			Hemlimbra	Private	Accurate Rx Pharmacy 	103 Corporate Lake Dr., Suite B 	Missouri
522	https://www.accuservpharmacy.com/	Huntingdon	PA	15642	--place holder	Oncology, Crohn's Disease, Renal Disease, HIV, Hepatitis, Transplantation, Psoriasis	marvin@accuservpharmacy.com	Marvin Scheffler	URAC, ACHC	Independent	2-Hour Patient Admittance Guarantee, Delivery, Refill reminders	Prior Authorization	CoPay Assistance	North Huntingdon, PA; Pittsburgh, PA		Private	AccuServe Pharmacy	8731 Route 30North 	Pennsylvania
523	http://www.acropharmacy.com	Sharon Hill	PA	19079	--place holder	Asthma, Cystic Fibrosis, Growth Hormone, Hemophilia, Hepatitis C, HIV, Multiple Sclerosis, Oncology, Osteoporosis, Psoriasis, Rheumatoid Arthritis	gisaak@acropharmacy.com	Greg Isaak	URAC	Premier Inc.	Customized shipping & delivery,  Clinical expert 24/7, Education and counseling, Specialty Therapy Management Programs	Utilization management, Coordinated care with hospital and infusion services	Pre-launch strategy, Advanced data reporting, Sales force support, Marketing outreach, Compliance and adherence programs	Philadelphia, PA; Memphis, TN	Esbriet, OFEV, REVLIMID, Hemlimbra	Subsidiary	Acro Pharmaceutical Services	313 Henderson Drive	Pennsylvania
524	https://actonpharmacy.com/	Acton	MA	01720	--place holder	Compounding, vaccines	saaddinno@dinnohealth.com	Saad Dinno	HQAA	Independent	Counseling and education			Concord, MA; Newton, MA		Private	Acton Pharmacy	563 Massachusetts Ave	Massachusetts
525	http://www.acs-rx.com	Orlando	FL	32809	--place holder	Rheumatoid Arthritis, Psoriasis, Osteoarthritis, Osteoporosis, Crohn's Disease, Hemophilia, Growth Hormone, Bleeding disorders, Hepatitis C, Multiple Sclerosis, Oncology	dennis.wilson@cvshealth.com	Dennis Wilson	URAC	Omnicare	Nursing support, Prescription refills, Benefits investigation and coordination, Billing and reimbursement support, patient assistance programs, Medicare Part D support		Brand support, reimbursement support,  financial support, adherence support, access solutions, REMS support		Farydak, Otelza, Ninlaro, Xenazine, Ibrance, Inlyta, Xalkori, Bosulif, Sutent, Tarceva, Xenaziner, REVLIMID, Otezia	Subsidiary	Advanced Care Scripts	6251 Chancellor Drive, Suite 101	Florida
526	http://aps-rx.net	Laguna Hills	CA	92653	--place holder	Crohn's Disease, Cystic Fibrosis, Growth Hormone, Hemophilia, Multiple Sclerosis, Osteoporosis, Immunology, Psoriasis, Rheumatoid Arthritis, RSV	jroache@aps-rx.net	James Roache		Independent					Synagis	Private	Advanced Pharmacy and Respiratory Care Solutions	26611 Cabot Road, Suite B	California
527	http://iuhealth.org/patients/pharmacies/	Indianapolis	IN	46202	--place holder	Crohn's Disease, Ulcerative Colitis, Growth Hormone, Hepatitis, HIV, Multiple Sclerosis, Oncology, Osteoarthritis, Psoriasis, RSV, Rheumatoid Arthritis, Transplantation, Asthma, PAH	clowe@iuhealth.org	Christopher Lowe	URAC	Indiana University Health	Counseling and education, Financial assistance help					Subsidiary	Advanced Therapies Pharmacy	362 West 15th Street, Suite 1600 GH 1074	Indiana
528	http://www.aetnaspecialtypharmacy.com	Orlando	FL	32809	--place holder	Bleeding Disorders, Asthma, Oncology, Crohn's Disease, Gaucher Disease, Growth Hormone, Hemophilia, Hepatitis, HIV, Fertility, Multiple Sclerosis, Osteoarthritis, Pain Management, Respiratory Disorders, RSV, Rheumatoid Arthritis, Transplantation	mitchemr@aetna.com	Rebecca Mitchem	URAC	Aetna	Delivery, Training, Injection supplies, Specialty CareRx				Ibrance, Inlyta, Xalkori, Bosulif, Sutent, Tarceva, REVLIMID, Nexavar, Letairis, Humira, Hemlimbra	Subsidiary	Aetna Specialty Pharmacy	503 Sunport Lane	Florida
529	http://rxclinicpharmacy.com/	Charlotte	NC	28227	--place holder	HRT, Multiple Sclerosis, Pain Management	amina@rxclinicpharmacy.com	Amina Abubakar		Afya Group	Education/Disease Management, Delivery, Packaging			Charlotte, NC		Subsidiary	Afya Group LLC dba Rx Clinic Pharmacy	7308 E. Independence Blvd Suite I	North Carolina
530	http://ahfpharmacy.org	Los Angeles	CA	90015	--place holder	Fertility, Hepatitis, HIV, Oncology, Transplantation	scott.carruthers@aidshealth.org	Scott Carruthers		AIDS Healthcare Foundation	Free HIV Testing, Delivery			North Miami Beach, FL; Seattle, WA (2); Orlando, FL; Oakland Park, FL; Columbus, OH; Los Angeles, CA (2); Miami Beach, FL (2); Fort Lauderdale, FL (3); Gardena, CA; Jacksonville, FL; Wilton Manors, FL; Washington, DC; Safety Harbor, FL; Long Beach, CA; Miami, FL (2); San Diego, CA; Oakland, CA; Fort Worth, TX; San Francisco, CA; Melville, NY; Brooklyn, NY; Sherman Oaks, CA; Pensacola, FL; Los Angeles, CA (2); Lithonia, GA; West Hollywood, CA; Beverly Hills, CA; Columbia, SC; Dallas, TX (2); Las Vegas, NV; Cleveland, OH; Chicago, IL; Newnan, GA; Atlanta, GA (2); Baton Rouge, LA; Jamaica, NY		Private	AHF Pharmacy	1400 South Grand Ave. Ste 801	California
531	https://akinapharmacy.com/	Chantilly	VA	20151	--place holder	Pain management, HRT, Dermatology, Gastroenterology, Ophthalmology, Fertility	bass@akinapharmacy.com	Bassem Girgis	PCAB, ACHC	Independent	Home delivery, Counseling and education, Compliance management, Prior authorization management, Third party billing and reimbursement management					Private	Akina Pharmacy	4080 Lafayette Center Dr #270	Virginia
532	http://www.alabamafertility.com	Birmingham	AL	35223	--place holder	Fertility		Michael Steinkampf		Independent	Patient support, Insurance assistance					Private	Alabama Fertility Specialists	2700 Highway 280, Suite 370 East	Alabama
533	http://www.albertsons.com/	Boise	ID	83706	--place holder	Oncology, Hepatitis C, Rheumatoid Arthritis, Multiple Sclerosis, Cystic Fibrosis, Behavioral Health, Growth Hormone, Hemophilia, Osteoporosis, Psoriasis, Transplantation	Mark.panzer@albertsons.com	Mark Panzer	ACHC, URAC	Albertson's	Clinical services, Reimbursement and co-pay assistance, Adherence programs	Prior authorization assistance		1,700 in-store pharmacies		Subsidiary	Albertson's Specialty Care	250 Parkcenter Blvd.	Idaho
534	http://www.chihealth.com/specialty-pharmacy	Omaha	NE	 68124	--place holder	Immunology, Psoriasis, Psoriatic arthritis, Rheumatoid arthritis, Ankylosing Spondylitis, Crohn's Disease, Hemophilia, Hepatitis C, HIV, Multiple Sclerosis, Oncology, Transplantation	greg.schardt@alegent.org	Greg Schardt	URAC	CHI Health	24/7 pharmacist, Patient financial advocates, Educational and support					Subsidiary	CHI Specialty Pharmacy	7710 Mercy Road	Nebraska
535	http://www.alexanderdrug.com	Hamilton	NJ	08610	--place holder	Fertility	neil@alexanderdrug.com	Neil Schenkel	URAC	Independent	DesignRx, Financial assistance					Private	Alexander's Twin Pharmacy	1060 Whitehorse Mercerville Road 	New Jersey
536	http://www.allcarepluspharmacy.com	Northborough	MA	01532	--place holder	Crohn's Disease, Hepatitis B, HIV, Psoriasis, Hepatitis C, Multiple Sclerosis, Rheumatoid Arthritis	daniel.apelian@rxallcare.com	Daniel Apelian	URAC, JCAHO, ACHC	Independent	Delivery, Custom Care Plan, Clinical pharmacist available 24/7, Copay assistance and funding	Prior authorizations, Benefits investigations, Submit appeals, Compliance and adherence programs, Copay assistance	Reimbursement support, Patient assistance programs, Adherence support programs, Copay assistance		SOMATULINE DEPOT, SOMAVERT, CINQAIR, NUCALA, XOLAIR, ARALAST NP, GLASSIA, ZEMAIRA, CEPROTIN, BETHKIS, KALYDECO, KITABIS PAK, ORKAMBI, TOBI PODHALER, XIAFLEX, GATTEX, OCALIVA, SOLESTA, SEROSTIM, INCRELEX, ADYNOVATE, CORIFACT, NOVOEIGHT, OBIZUR, TRETTEN, INTRON-A, EGRIFTA, AVEED, NATPARA, SUPPRELIN LA, BIVIGAM, GAMMAPLEX, HIZENTRA, PROMACTA, ACTIMMUNE, TYSABRI, PRALUENT, ALDURAZYME, CERDELGA, CEREZYME, CYSTAGON, ELAPRASE, FABRAZYME, LUMIZYME, MYOZYME, NAGLAZYME, VIMIZIM, VPRIV, AMPYRA, AUBAGIO, PLEGRIDY, TECFIDERA, TYSABRI, ADCETRIS, ARZERRA, BELEODAQ, BENDEKA, BLINCYTO, DARZALEX, EMPLICITI, EVOMELA, GAZYVA, INTRON A, ISTODAX, KEYTRUDA, KYPROLIS, OPDIVO, SYLATRON, TECENTRIQ, THYROGEN, YONDELIS, ALECENSA, COTELLIC, ERIVEDGE, FARYDAK, HYCAMTIN, IBRANCE, INLYTA, JAKAFI, LONSURF, MEKINIST, NEXAVAR, NINLARO, ODOMZO, POMALYST, PURIXAN, REVLIMID, STIVARGA, TAFINLAR, TARCEVA, TYKERB, VOTRIENT, XALKORI, XTANDI, ZELBORAF, ZYKADIA, GENVISC 850, HYMOVIS, SOLIRIS, KUVAN, MAKENA, COSENTYX, OTEZLA, TALTZ, ADEMPAS, LETAIRIS, OPSUMIT, ORENITRAM, REMODULIN, TRACLEER, TYVASO, UPTRAVI, VELETRI, VENTAVIS, ACTEMRA	Private	AllCare Plus Pharmacy Inc.	50 Bearfoot Rd	Massachusetts
537	http://www.allcarepharmacy.com	Little Rock	AK	72204	--place holder	Rheumatoid Arthritis, Crohn's Disease, Ulcerative Colitis, Oncology, Multiple Sclerosis, Growth Hormone, Psoriasis	stephen@allcarepharmacy.com	Stephen Carroll	URAC, ACHC, VIPPS	Independent	Co-pay option, 24/7 customer service, Delivery, Refill management, Education and counseling		MTM, Outreach calls, OTC support, AlphaPack Compliance packaging, custom prescription compounding			Private	Allcare Specialty Pharmacy	10620 Colonel Glenn Rd. Ste 300	Alaska
538	www.alliancerxwp.com	Orlando	FL	32819	--place holder	Asthma, Anemia, Crohn's Disease, Cystic Fibrosis, Enzyme deficiencies, Fertility, Growth Hormone, Hemophilia, Hepatitis C, HIV, IVG, Multiple Sclerosis, Osteoarthritis, Psoriasis, Psoriatric arthritis, PAH, RSV, Rheumatoid Arthritis, Transplant, Urology, Ulcerative Colitis, Von Willebrand Disease	joel.wright@alliancerxwp.com	Joel Wright	URAC, ACHC	Walgreens Boots Alliance, Prime Therapeutics	Deliveries and refills, 24/7 access, Insurance verification and help with prior authorization, Side effect management and adherence support, Financial assistance support			Beaverton, OR; Bethesda, MD; Canton, MI; Deerfield, IL; Frisco, TX; Irving, TX; Pittsburgh, PA; Tempe, AZ	Actemra, Acthar H.P., Actimmune, Adagen, Alecensa, Ampyra, Apokyn, Aralast, Arzerra, Aubagio, Avastin, Aveed, Benlysta, Berinert, Bethkis, Bosulif, Bupheny, Cabometyx, Cayston, Cerdelga, Cosentyx, Cotellic, Cystaran, Dacogen, Daraprim, Darzalex, Egrifta, Ergomar, Erivedge, Esbriet, Exjade, Eylea, Farydak, Gazyva, Gel-One, Glassia, Hemlimbra, Hemangeol, Herceptin, Hetlioz, Hizentra, Humira, Hyqvia, Ibrance, Increlex, Intron-A, Jakafi, Jetrea, Kadcyla, Kalydeco, Kanuma, Kitabis Pak, Kuvan, Kyleena, Kynamro, Kyprolis, Lemtrada, Letairis, Lonsurf, Lucentis, Lumizyme, Macugen, Matulane, MuGard, Naglazyme, Natpara, Nexavar, Ninlaro, Northera, Nucala, Nuplazid, Nutropin, Ocaliva, Ocrevus, OFEV, Opsumit, Oralair, Orkambi, Perjeta, Plegridy, Pomalyst, Qutenza, Ravicti, Revlimid, Riastap, Rituxan, Ruconest, Sabril, Samsca, Skyla, Solesta, Soliris, Somavert, Stivarga, Supprelin, Sutent, Sylatron, Taltz, Tarceva, Tecentriq, Tecfidera, Testopel, Thalomid, Tobi, Tracleer, Tysabri, Varithena, Vecamyl, Vimizim, Visudyne, Vpriv, Xalkori, Xenazine, Xolair, Xtandi, Yervoy, Yondelis, Zelboraf, Zinbryta, Zykadia, Zytiga	Subsidiary	AllianceRx Walgreens Prime	2354 Commerce Park Dr #100,	Florida
539	http://alliedhealthsolutionsrx.com/	Morgantown	WV	26505	--place holder	Crohn's Disease, Ulcerative Colitis, Cystic Fibrosis, Growth Hormone, Hepatitis C, HIV, Multiple Sclerosis, Oncology, Osteoporosis, Osteoarthritis, Psoriasis, Psoriatric arthritis, Rheumatoid arthritis, RSV	sokosl@wvumedicine.org	Louis Sokos	URAC	WVU Medicine	Education and counseling, Refills, Financial support assistance	Prior authorization assistance, Clinical support				Subsidiary	Allied Health Solutions - Specialty Pharmacy	3040 University Ave #1400	West Virginia
540	https://wellness.allinahealth.org/services/504	Minneapolis	MN	55407	--place holder	Multiple Sclerosis, Hepatitis C, Transplantation, Oncology, Inflammatory diseases, Crohn's disease	ann.byre@allina.com	Ann Byre	URAC	Allina Health	Counseling and education, Delivery, Refill reminders, 24x7 support	Review medication benefits/costs, Coordinate prior authorizations				Subsidiary	Allina Health Heart Hospital Pharmacy	920 East 28th Street	Minnesota
541	http://www.alphascriptrx.com	San Carlos	CA	94070	--place holder	HIV, Hepatitis, Transplantation	russell.zukin@alphascriptrx.com	Russell Zukin	URAC	Independent	Pharmacist counseling, Benefit coordination, Mail & Delivery	Prior authorization support				Private	Alphascript, Inc.	1160 Industrial Rd STE 17	California
557	https://www.thpg.org/arlington-cancer-center	Arlington	TX	76012	--place holder	Oncology	alfreddistefano@TexasHealth.org	Alfred DiStefano		Texas Health Resources	Counseling and education, Insurance support			Trophy Club, TX; Arlington, TX		Subsidiary	Arlington Cancer Center	906 West Randol Mill Road	Texas
542	http://alpspharmacy.com/	Springfield	MO	65803	--place holder	Oncology, Crohn's Disease, Cystic Fibrosis, Dermatology, Hepatitis B, Hepatitis C, HIV, Hypercholesterolemia, IBD, Multiple Sclerosis, Osteoporosis, Psoriasis, PAH, Rheumatoid Arthritis, Substance Abuse, Ulcerative Colitis	dsavley@alpshparmacy.com	Don Savley	URAC, ACHC	Independent	Counseling and education, Refill reminders, Insurance benefits exploration	Prior authorization support, Formulary management support	Compliance & Reporting, REM program education		Ingrezza, Vivitrol	Private	Alps Specialty Pharmacy	2828 N. National Ave, Suite B	Missouri
543	http://www.altscripts.com/	West Milwaukee	WI	53215	--place holder	Cardiovascular, COPD, HIV, Diabetes, Hepatitis C, Chemotherapy, Fertility, Hypertension, Gastroenterology, Immunology, Rheumatoid Arthritis, Multiple Sclerosis, Diabetes, Renal Disease, Pain Management		Mike Gindi	JCAHO	CARE Pharmacies	Counseling and education, Delivery, Financial assistance, Pharmacist 24/7		Patient Disease and medication education			Member	AltScripts Specialty Pharmacy	1636 Miller Park Way	Wisconsin
544	http://www.amberpharmacy.com	Omaha	NE	68138	--place holder	IBD, Hepatitis C, HIV/AIDS, Lupus, Oncology, Psoriasis, Rheumatoid Arthritis, Transplantation, Asthma, Dermatology, Gastroenterology, Multiple Sclerosis, RSV	magostino@hy-vee.com	Mike Agostino	URAC, ACHC	Hy-Vee, Inc.	Personal Care Coordinator, Billing, Nursing Services, Financial Assistance Programs	Disease Management, Coordination of Benefits, Partial Dose Dispensing, Reports	Promises Program, Counseling and Education	Omaha, NE; Chicago, IL; Richardson, TX; Philadelphia, PA; Houston, TX; San Bernardino, CA	Xolair, Synagis, Tarceva, Xtandi, REVLIMID	Subsidiary	Amber Pharmacy	10004 S 152nd St, Suite A 	Nebraska
545	http://www.fertilerus.com/	Rockville	MD	20850	--place holder	Fertility	fertilerus@aol.com	Joe Nusbaum		Independent	Counseling and education, shipping			Shady Grove, MD		Private	Ambulatory Care Pharmacy	15001 Shady Grove Road	Maryland
546	http://www.americanoutcomes.com/	Fort Worth	TX	76132	--place holder	IVIG, Multiple Sclerosis, Pain Management, Infusion		Sam Jampolis	URAC, ACHC	Independent	Counseling and education, Delivery, Prescription assessment					Private	American Outcomes Management	5009 South Hulen Street, Suite 107	Texas
547	https://ameripharma.us/	Orange	CA	92868	--place holder	Crohn's Disease, Cystic Fibrosis, Gaucher Disease, Growth Hormone, HIV, Hepatitis B, Hepatitis C, Multiple Sclerosis, Osteoporosis, Immunoglobin, Psoriasis, RSV, Rheumatoid arthritis, Transplantation, Oncology		Andrew Harper	URAC, ACHC	Harper's Pharmacy	Counseling and education, delivery, Financial assistance support, 24/7/365 access	Personalized patient care, Adherence management, Prior authorization support	Compliance and reporting, Product launch support			Subsidiary	AmeriPharma	132 South Anita Drive	California
548	http://www.ameritaiv.com	Centennial	CO	80112	--place holder	Infectious Disease, Immunology, Oncology, Pain Management, Multiple Sclerosis, Hemophilia, Nutritional	richard. iriye@pharmerica.com	Richard Iriye	URAC, ACHC	PharMerica	Counseling and education; 24/4 clinical support		Assists patients who are commercially insured with enrollment in manufacturer-sponsored co-pay programs for branded pharmaceutical products; Helps uninsured patients or those with a state or federally funded healthcare benefit program enroll in assistance programs	Bentonville, Ark; Kingman, AZ; Prescott, AZ; Tucson, AZ; Oxnard, CA; Denver, CO; Colorado Springs, CO; Boise, ID; Olathe, KS; Fairfield, NJ; Tulsa, OK; East Providence, RI; Chattanooga, TN; Nashville, TN; Amarillo, TX; Austin, TX; Dallas, TX; El Paso, TX; San Antonio, TX; Salt Lake City, UT		Subsidiary	Amerita/PharMerica	7307 South Revere Parkway, Suite 200	Colorado
549	http://www.anovorx.com/	Memphis	TN	38134	--place holder	Bleeding disorders	David.Stevens@AnovoRx.com	David Stevens	URAC, ACHC, VAWD	Independent	Medication therapy management, Delivery and shipping, financial assistance, Education and counseling, pharmacist 24/7, Copay assistance investigation, Refill Reminders		Product Launch & Market Access Solutions, Specialty Distribution Services, Hub Services		HEMLIBRA	Private	AnavoRx Group	1710 N Shelby Oaks Dr #1	Tennessee
550	http://www.anazaohealth.com	Tampa	FL	33634	--place holder	Nuclear medicine, Pain management	tbresnahan@anazaohealth.com	Timothy Bresnahan		Independent	Counseling and education			Tampa, FL; Las Vegas, NV		Private	AnazaoHealth Corporation	5710 Hoover Boulevard	Florida
551	http://www.rxapex.com/	Riverside	MO	64150	--place holder	Dermatology, Gastroenterology, Hepatitis, Multiple Sclerosis, HIV, Rheumatoid Arthritis, Hemophilia, Oncology, Transplantation	dlea@rxapex.com	Darren Lea	URAC, ACHC	Independent	Clinical and financial support,Financial assistance support					Private	Apex Specialty Pharmacy	616 NW Platte Valley Drive	Missouri
552	http://www.abdrx.com/	Portland	ME	04101	--place holder	Fertility, Dermatology, Gastroenterology, Growth Hormone, Hepatitis, HIV, Multiple Sclerosis, Oncology, Rheumatoid Arthritis, Transplantation	tmadden@abdrx.com	Thomas Madden	URAC, ACHC	CVS Health	Counseling, Co-pay assistance, Insurance services, Delivery, 24/7 support	Formulary compliance, Waste Management, Member services, Education	Clinical and service support	Portland, ME; Chicago, IL		Subsidiary	Apothecary by Design	141 Preble Street	Maine
553	http://www.apthorprx.com	New York	NY	10024	--place holder	Fertility	 rg1@apthorprx.com	Russell Gellis		Independent	Counseling and education, Delivery, Insurance Screening and Direct Billing				Bravelle, Cetrotide, Follistim, Gonal-F, Menopur, Pregnyl, Ovidrel, Novarel, GANIRELIX ACETATE	Private	Apthorp Pharmacy	2201 Broadway at 78th Street	New York
554	http://www.ardonhealth.com	Portland	OR	97220-9057	--place holder	Crohn's Disease, Hepatitis C, Psoriasis, Rheumatoloid Arthritis< Multiple Sclerosis, Psoriatric arthritis	mina.baghzouz@ardonhealth.com	Mina Baghzouz	URAC, ACHC	Independent	Order and refills, Financial assistance, Patient care program, 24/7 support	Counseling, Reimbursement support, Custom packaging, Nursing advice, Refills, 24/7 support	Adherence assessment, Patient orientation and counseling, Physician consultations and coordination, Medication reimbursement support, Custom packaging		Taltz, Stelara, Cimzia, Enbrel, Humira, Remicade, Simponi, Avonex, Copaxone, Betaseron, Gilenya, Rebif, Olysio, Solvadi, Harvoni, Pegasys, Viekira	Private	Ardon Health, LLC	11835 NE GLENN WIDING DR	Oregon
555	www.arizonaoncology.com	Phoenix	AZ	85044	--place holder	Oncology	brian.schade@usoncology.com.	Brian Schade 		US Oncology Network		Counseling and education, Insurance support				Subsidiary	Arizona Oncology	4530 E. Ray Rd., Suite 178	Arizona
556	http://www.arjinfusion.com 	Lenexa	KS	66214	--place holder	Bleeding Disorders, IVIG, HIV, Hepatitis C, Hemophilia, Neurology, Gastroenterology, Rheumatoid arthritis	lisas@arjinfusioin.com	Lisa Sackuvich		Independent	Insurance reimbursement, 24/7 support	Adherence models, Therapy Management	Data reporting, HUB routing, REMS, High-touch patient care model		Hemlimbra	Private	ARJ Infusion Services	7930 Marshall Drive	Kansas
558	http://asappharmacy.com	Glendale	CA	91206	--place holder	Pain Management, HRT, Dermatology		Gilbert Russell		Independent	Counseling and Education, Delivery, Refills	MTM Services			Hemlimbra	Private	ASAP Pharmacy	1340 East Wilson Avenue	California
559	https://aspcares.com	Farmers Branch	TX	75234	--place holder	Dermatology, Gastroenterology, Hemophilia, Hepatitis, HIV, Multiple Sclerosis, Oncology, Pulmonology, Rheumatoid Arthritis, Transplantation, Urology, Opthalmology, RSV, Wound Care, Pain Management		Tony Pfister	URAC, ACHC, JCAHO	Independent	Delivery, Financial assistance, Counseling and education	Prior authorization assistance	Patient assistance program	Astoria, NY; Miami, FL; Clawson, MI; Oklahoma City, OK; Columbia, MD; Pasadena, TX; Corpus Christi, TX; Plano, TX; Denton, TX; El Paso, TX; San Antonio, TX; Harlingen, TX; Stone Oak, TX; Las Cruces, NM; Sugar Land, TX; Las Vegas, NV; Tyler, TX; McAllen, TX		Private	ASPcares	13988 Diplomat Dr. Ste 100	Texas
560	http://www.aspirerx.com	Mt. Pleasant 	MI	48801	--place holder	Inflammation, Migraines		Jason Rutland		Aspire Health	Counseling and education			Nashville, TN		Subsidiary	AspireRx	121 E Broadway 	Michigan
561	http://www.aurorahealthcare.org/	Elm Grove	WI	53122	--place holder	Oncology, Crohn's Disease, Hepatitis C, HIV, Multiple Sclerosis, Osteoporosis, Psoriasis, Psoriatic Arthritis, Rheumatoid Arthritis	james.motz@aurora.org	Jim Motz	URAC, ACHC	Aurora Health Care	Delivery, Insurance assistance, Counseling and education					Subsidiary	Aurora Specialty Pharmacy	12500 W Bluemound Rd Ste 201	Wisconsin
562	http://www.avella.com	Phoenix	AZ	85085	--place holder	Asthma, Cardiovascular, Dermatology, Fertility, Gastroenterology, Hemophilia, Hepatitis, HIV, Infusion, IVIG, Multiple Sclerosis, Oncology, Ophthalmology, Transplantation, Pain Management, Rheumatoid Arthritis, RSV, Urology	rebecca.shanahan@avella.com	Rebecca Shanahan	URAC, ACHC	Independent	Education, Financial Assistance, 24/7 clinical support	Prior authorization	Adherence programs, Limited distribution drugs	Phoenix, AZ; Scottsdale, AZ; Tucson, AZ; Sacramento, CA; Denver, CO; Columbus, OH; Orlando, FL; St. Louis, MO; Las Vegas, NV; Austin, TX	Calquence, Nucala, Probuphone, Cosentyx, Taltz, Siliq,  Makena, Nutropin AQ, Serostim, Illuvien, Synagis, Actemra, Acthar, Benlysta, Jynarque, Alecensa, Braftovi, Mektovi, Avastin, Bosulif, Cotellic, Erivedge, Exjade, Gazyva, Herceptin, Hycamtin, Ibrance, Imbruvica, Inlyta, Intron-A, Iressa, Jadenu, Jakafi, Kadcyla, Lonsurf, Mekinist, Nexavar, Ninlaro, Odomzo, Perjeta, Pomalyst, Promacta, Revlimid, Rituxan, Rubraca, Stivarga, Sutent, Sylatron, Tafinlar, Tagrisso, Tarceva, Thalomid, Tykerb, Valchlor, Venclexta, Votrient, Xalkori, Xtandi, Zelboraf, Zydelig, Zytiga, Humira, Jetria, Eylea, Fasenra, Nucala, Xolair, Subloca, Probuphine, Olumiant	Private	Avella Specialty Pharmacy	24416 N 19th Ave.	Arizona
563	http://www.avera.org/locations/profile/?id=547	Sioux Falls	SD	57108	--place holder	Oncology, Crohn's Disease, IBD, Cystic fibrosis, Growth Hormone, Hepatitis C, HIV, Multiple Sclerosis, Psoriasis, Psoriatic arthritis, Rheumatoid arthritis, Ankylosing spondylitis, Osteoporosis, Osteoarthritis, Transplantation	brian.lounsbery@avera.org	Brian Lounsbery	URAC, ACHC	Avera Health	Insurance benefit investigation, Therapy management, Counseling and education	Prior Authorization assistance				Subsidiary	Avera McKennan d/b/a Avera Specialty Pharmacy	3900 West Avera Drive	South Dakota
564	http://www.avitapharmacy.com/	Baton Rouge	LA	70808	--place holder	HIV, Hepatitis C, Oncology, Transplantation, Rheumatoid Arthritis, Osteoporosis, Gastroenterology, Dermatology, Behavioral Health, Crohn's Disease, Cystic Fibrosis, Hemophilia, Multiple Sclerosis, Psoriasis, Ulcerative Colitis	erry.purcell@avitadrugs.com	Jerry Purcell	URAC, ACHC, VIPPS	Long's Drugs	Copay assistance, refill reminders, 24/7 pharmacist, Counseling and education		Adherence programs, Prior authorization	Baton Rouge, LA; New Orleans, LA (2); Dallas, TX; San Antonio, TX; Houston, TX; Salisbury, NC; Austin, TX; Decatur, GA; Greenville, SC; Rock Hill, SC	EGRIFTA	Subsidiary	Avita Specialty Pharmacy	5551 Corporate Blvd #102	Louisiana
565	https://banksapothecary.com	Trevose	PA	19053	--place holder	Oncology, Hepatitis, Crohn's Disease, Behavioral Health, Rheumatoid Arthritis, Osteoporosis, Multiple Sclerosis	Keishia@banksapothecary.com	Keishia Whitman	URAC	Independent	24/7 support, Delivery, Co-payment assistance, refill reminders	Prior authorization assistance	REMS assistance, Patient treatment education		Zytiga, Promacta, Exjade, Jadenu, Xgeva, Promacta	Private	Bank's Apothecary	3800 Horizon Blvd.	Pennsylvania
566	https://www.bannerhealth.com/services/pharmacy?	Phoenix	AZ	85006	--place holder	Crohn's Disease, Ulcerative Colitis, Growth Hormone, Hepatitis, HIV, Multiple Sclerosis, Oncology, Osteoarthritis, Psoriasis, RSV, Rheumatoid Arthritis, Transplantation, Asthma, PAH	pamela.nenaber.com	Pamela Nenaber	URAC	Banner Health	Delivery, Financial assistance, Refill reminders, Therapy management programs		Manufacturer copay assistance	Mesa, AZ; Sun City West, AZ; Tucson, AZ; Casa Grande, AZ; Loveland, CO		Subsidiary	Banner Family Pharmacy	1111 East McDowell Road	Arizona
567	https://www.baptisthealth.com/corbin/pages/services/pharmacy.aspx	Corbin	KY	40701	--place holder	Crohn's Disease, Ulcerative Colitis, Growth Hormone, Hepatitis, HIV, Multiple Sclerosis, Oncology, Osteoarthritis, Psoriasis, RSV, Rheumatoid Arthritis, Transplantation, Asthma, PAH	cliff.Niemeier@bhsi.com	Cliff Niemeier		Baptist Health	Co-pay assistance, Counseling and education					Subsidiary	Baptist Health Corbin Pharmacy	1 Trillium Way	Kentucky
568	https://www.baptistonline.org/services/specialty-pharmacy	Memphis	TN	38120	--place holder	Bleeding Disorders Disorders, Oncology, Crohn's Disease, Hepatitis, HIV, Ulcerative Colitis	susan.breeden@bmhcc.org	Susan Breeden		Baptist Memorial Health Care	Counseling and education, 24X7 support, Refill reminders					Subsidiary	Baptist Specialty Pharmacy	6025 Walnut GroveRoad #108	Tennessee
569	https://www.barneshc.com/services/pharmacy-services/precision-specialty-pharmacy	Valdosta	GA	31601	--place holder	Immunology, Alpha-1, Rheumatoid Arthritis, Crohn's Disease, Ulcerative Colitis	karen.butterton@barneshc.com	Karen Butterton	URAC, ACHC	Barnes Healthcare Services	Reimbursement assistance, Patient education program, Therapy management program, Education and counseling, Pharmacist 24x7					Subsidiary	Barnes Precision Specialty Pharmacy	200 Patterson Street	Georgia
570	http://www.barneysrx.com	Augusta	GA	30906	--place holder	HIV, Hepatitis C, Crohn's Disease, Fertility, Multiple Sclerosis, Oncology, Pulmonary, Respiratory Disorders, Transplantation, Renal disease, Hepatitis B, IBD, Osteoarthritis, Osteoporosis, Psoriasis, PAH, Respiratory, Rheumatoid arthritis	augusta@barneysrx.com 	Barry Bryant		Independent	Counseling and education, Refill reminders and delivery, 		Patient assistance programs	Augusta, GA (4); Wrens, GA; Louisville, GA; Grovetown, GA; Serenity, GA	Cimzia	Private	Barney's Pharmacy	2604 Peach Orchard Road	Georgia
571	http://www.barronpharmacy.com	Beachwood	OH	44122	--place holder	Fertility	marshall@barronpharmacy.com	Marshall Barron		Independent	DesignRx program, Counseling and education				Cetrotide, chorionic gonadotropin, Follistim, Gonal-F, Leoprolide, Lovenox, Menopur, Pregnyl, Ovidrel, Novarel, GANIRELIX ACETATE	Private	Barron Pharmacy	23632 Mercantile Road, Suite F	Ohio
671	http://theempharmacy.com/	City of Orange	NJ	07050	--place holder			Ashok Padmanbham	URAC	Independent	Free delivery, Counseling and education					Private	E&M Pharmacy	205 S Essex Ave	New Jersey
572	https://www.bartelldrugs.com/	Seattle	WA	98106	--place holder	Oncology, HIV, Rheumatoid Arthritis, Anemia, Crohn's Disease, Cystic Fibrosis, Hepatitis B, Hepatitis C, Multiple Sclerosis, Osteoporosis, Psoriasis	kathil@bartelldrugs.com	Kathi Lentzsch		Independent	Counseling and education, Renewals, Payment assistance options, Wellness calls, 24x7 support			65 Washington State locations		Private	Bartell Drugs	4025 Delridge Way SW, #400	Washington
573	https://www.baystatehealth.org/services/pharmacy	Springfield	MA	01104	--place holder	Fertility, Immunology, Multiple Sclerosis, Rheumatoid Arthritis, Oncology, Transplantation, Hemophilia, Ankylosing Spondylitis, Crohn's Disease, Cystic Fibrosis, Hepatitis C, HIV, Psoriasis, Psoriatic Arthritis	gary.kerr@baystatehealth.org	Gary Kerr		Baystate Health	Delivery and refill reminders, Medication adherence porgrams, Help obtaining financial assistance, On-call pharmacist support					Subsidiary	Baystate Specialty Pharmacy	298 Carew Street	Massachusetts
574	https://www.beaumont.org/services/pharmacy/specialty-pharmacy	Warren	MI	48092	--place holder	Hepatitis C, Hepatitis B, HIV, Rheumatoid Arthritis, Ulcerative colitis, Crohn's Disease, Multiple Sclerosis, Hyperlipidemia, Psoriatric arthritis	scott.sterret@beaumont.org	Scott Sterett		Beaumont Health System	Counseling and education, Delivery, Refill reminders, 24x7 support	Prior authorization, Adherence support				Subsidiary	Beaumont Specialty Pharmacy	27027Mound Road	Michigan
575	https://www.beneverepharmacy.com/	Collierville	TN	38017	--place holder	Asthma, Crohn's Disease, Dermatology, Gaucher's Disease, Growth Hormone, Hepatitis, Hemophilia, Rheumatoid Arthritis, Multiple Sclerosis, Oncology, Osteoarthritis, Psoriasis, PAH, Transplantation, Ulcerative Colitis	brett@beneverepharmacy.com	Brett Wright	URAC, ACHC	Independent	24x7 customer support, Financial assistance options, Counseling and education	Patient insurance authorization, Patient compliance monitoring	Directly bill co-pay assistance foundations, Compliance management & data collection, Inventory management			Private	Benevere Specialty Pharmacy	1162 West Poplar Avenue	Tennessee
576	http://benzerspecialtypharmacy.com/	Tampa	FL	33619	--place holder	Hepatitis C, Multiple Sclerosis, HIV, Rheumatoid Arthritis, Oncology, Psoriasis, Dermatology		Mike LaBrecque	URAC	Independent	Refills, specialty care management programs, adherence, counseling, reimbursement support	Clinical drug  management	Reimbursement, shipping, managed care support, market support, clinical training, supplies	Tampa, FL; Auburndale, FL; Warren, MI; Westland, MI	Puraxin, Ceprotin, Cosenytx, Aralast	Private	Benzer Specialty Pharmacy	5908 Breckenridge Parkway	Florida
577	http://www.bergenrx.com	Newark	NJ	07103	--place holder	Transplantation, HIV, Hepatitis, Fertility, Oncology	aj@bergenrx.com	Abhijeet Jatania	URAC,  ACHC	Independent	Insurance and billing, Financial assistance, Delivery		Therapy management, Triple C packaging	Newark, NJ (4); Elizabeth, NJ (2)		Private	Bergen Medical Pharmacy 	90 Bergen Street, Suite 1600	New Jersey
578	http://www.berkshirehealthsystems.org/specialty-pharmacy	Pittsfield	MA	01201	--place holder	Fertility, Immunology, Multiple Sclerosis, Rheumatoid Arthritis, Oncology, Transplantation, Hemophilia, Ankylosing Spondylitis, Crohn's Disease, Cystic Fibrosis, Hepatitis C, HIV, Psoriasis, Psoriatic Arthritis	pkeith@bhs1.org	Preston Keith	URAC, ACHC	Berkshire Health System	Counseling and education					Subsidiary	Berkshire Health System Specialty Pharmacy	725 North Street	Massachusetts
579	http://wwww.besscription.com	Sea Cliff	NY	11579	--place holder	Fertility	info@besscription.com	Elizabeth Lempert		Independent	Counseling and education, Delivery				Cetrotide, Enoxaparin, Gonal-F, Lovenox, Menopur, Novarel, Omnitrope, Ovidrel	Private	Besscription	460 Glen Cove Ave	New York
580	http://bestcarepharmacy.com/	Glendale	AZ	85306	--place holder	Oncology, Neurology, IVIG, 		Maudlyn Mary Aladi		Independent	Counseling and education					Private	Best Care Pharmacy	5757 West Thunderbird Road	Arizona
581	https://www.betterlivingnow.com/home/services/public-access-specialty-pharmacy.cfm	Hauppage	NY	11788	--place holder	Diabetes, Asthma, Dermatology, Urology	dpope@betterlivingnow.com	Daniel Pope		Independent	Delivery, Counseling and education				Avastin, Herceptin, Rituxan	Private	Better Living Now	185 Oser Avenue	New York
582	http://www.billingsclinic.com/services-specialties/pharmacy-services/	Billings	MT	59101	--place holder	Hepatitis C, HIV, Rheumatoid Arthritis, Ulcerative colitis, Crohn's Disease, Multiple Sclerosis, Hyperlipidemia	ktownsend@billingsclinic.org	Kyle Townsend		Billings Clinic		Education and counseling	Data aggregation			Subsidiary	Billings Clinic Pharmacy	2800 10th Avenue North	Montana
583	http://www.biotekrx.com/	New Castle	DE	19720	--place holder	Hepatitis, Transplantation, Multiple Sclerosis, Huntington's Disease	Cgadde@biotekrx.com	Chai Gadde	URAC	Independent	Delivery, auto-refill, education and counseling, 24x7 help, financial assistance	Prior authorizations, formulary, evidence-based proptocols and pathways, drug waste management, customized reporting	Logistics, data collection and reporting, compliance and adherence, reimbursement and managed care contracting	Houston, TX	Hemlimbra	Private	BioTek reMEDys	2 Penns Way #404	Delaware
584	http://www.biocurerx.com/	Houston	TX	77036	--place holder	Hepatology, Gastroenterology, Oncology, Rheumatoid Arthritis, Immunology, Dermatology, Neurology, Transplantation	andrew.Maslaveckas@biocurerx.com	Andrew Maslaveckas	ACHC	Independent	Reimbursement and financial assistance, Education, Prior Authorization		Reimbursement and financial assistance, Education, Prior Authorization		Cosentyx, Avastin, Rituxan, Xeljanz. Krystexxa	Private	BioCureRx	8700 Commerce Park Dr. Ste 241	Texas
585	http://biologictx.com/	Totowa	NJ	07512	--place holder	Transplantation, Neurology, Gastroenterology, Hematology, Immunology	SRafanelli@BiologicTx.com email	Sal Rafanelli	URAC, JACHO	Matrix Health	Prescription Refills and Supply Orders, Education on Insurance and Payments, Personalized Care Plan, 			Los Angeles, CA; Miami, FL; Memphis, TN; Chicago, IL	Soliris, Nulojix, Hizentra,  Envarsus® XR 	Subsidiary	BiologicTx	40-D Commerce Way	New Jersey
586	http://www.biologicsinc.com	Cary	NC	27513	--place holder	Oncology	sfrantz@biologicsinc.com	Stuart Frantz	URAC	McKesson Specialty Health	Oncology-certified nurses, Utilization Management, Financial assistance	Specialty cancer case management, Claim integrity	Reporting, Consulting services, Disease-specific programs, Prior Authorization, Access Services		Farydak, Tarceva, Imbruvica, Xalkori, Inlyta, Nexavar, Cabometyxtm,  Nerlynx, Xermelo, Lenvima, Tagrisso, Ibrance, Inlyta, Xalkori, Bosulif, Sutent, REVLIMID, Iclusig, VENCLEXTA, Lonsurf, Xermelo, Imfinzi, 	Subsidiary	Biologics	13000 Weston Parkway, Suite 105	North Carolina
587	http://biomatrixsprx.com/	Weston	FL	33331	--place holder	Hemophilia, Transplantation, Neurology, Oncology, von Willebrand Disease, Bleeding Disorders	bruce.greenberg@biomatrixsprx.com	Bruce Greenberg	URAC	Acorn	Counseling and education, Regional care coordinators, Billing experts, Registered pharmacists				Vonvendi, Hemlibra	Subsidiary	BioMatrix Specialty Pharmacy	3300 Corporate Avenue	Florida
588	http://www.biomedpharmacy.com	Southfield	MI	48075	--place holder	Oncology, Dermatology, HIV, Multiple Sclerosis, Hepatitis C, Crohn's Disease, Rheumatoid Arthritis, Psoriasis, Fertility, Obesity, Growth Hormone	msohoubah@biomedpharmacy.com	Mohamed Sohoubah	ICAP, NCPA	Independent				Southfield, MI; Cincinnati, OH; Lansing, OH		Private	BioMed Specialty Pharmacy	23815 Northwestern Highway	Michigan
589	http://www.bioplusrx.com	Altamonte Springs	FL	32701	--place holder	Hepatitis C, Crohn's Disease, Oncology, HIV, IVIG, Hemophilia, Psoriasis, Psoriatic Arthritis, Rheumatoid Arthritis, Multiple Sclerosis, Growth Hormone	svogt@bioplusrx.com	Stephen Vogt	ACHC, URAC	Independent	Co-pay and financial assistance, benefits verification, 24/7 pharmacists, Delivery, Dose reminders	Disease Therapy Management Services, Partial Fill Dosing, Benefit Coordination, Formulary support services, Real-time reporting	Limited Distribution Drugs, National sales force, Disease Therapy Management Services, Pre and post-launch market research, Benefits investigation, Financial assistance and support, Dedicated brand support teams, Marketing support		Zinbryta, Ibrance, Inlyta, Xalkori, Bosulif, Sutent, Tarceva, REVLIMID, Cosentyx, Hemlimbra	Private	BioPlus Specialty Pharmacy	376 Northlake Blvd.	Florida
590	http://www.biorx.net	High Point	NC	27262	--place holder	Hemophilia, Immunology, Oncology, Hepatitis, Multiple Sclerosis, HIV	ehill@biorx.net	Eric Hill	URAC	Diplomat Specialty Infusion				Cincinnati, OH; Woburn, MA; Greensboro, NC; Urbandale, IA; Savage, MN; Scottsdale, AZ	Corifact, Glassia, Zemaira	Subsidiary	BioRx	200 West Lexington Ave., Suite 203	North Carolina
591	http://www.bioscrip.com	Denver	CO	80202	--place holder	Gastroenterology, Oncology, Multiple Sclerosis, Transplantation, Hemophilia, Immunology	daniel.greenleaf@bioscrip.com	Dan Greenleaf	URAC, ACHC		Infusion therapy, Education and counseling, 24x7 support	Communication and follow-up, Disease specific risk assessment, Medication review and reconciliation	Outcomes data reporting, Pay for performance models	Birmingham, AL; Burbank, CA; Irvine, CA; Ontario, CA; Vernon, CT; Cromwell, CT (2); Tampa, FL; Melbourne, FL; Jacksonville, FL; Albany, GA; Augusta, GA; Savannah, GA; Norcross, GA; Brunswick, GA; Silvis, IL; Elmhurst, IL; Lexington, KY; Hammond, LA; Monroe, LA; Metairie, LA; Baton Rouge, LA; Houma, LA; Lake Charles, LA; Shreveport, LA; Covington, LA; Alexandria, LA; Lafayette, LA; Southborough, MA; Falmouth, MA; Canton, MA; Columbia, MD; Auburn, ME; Eagan, MN; Chesterfield, MO; Peal, MS; Fayetteville, NC; Durham, NC; Charlotte, NC; Omaha, NE; Bedford, NH; Morris Plains, NJ; Norwood, NJ; Livingston, NJ; Somers Point, NJ; Lake Success, NY; Canfield, OH; Cincinnati, OH; Sylvania, OH; Columbus, OH; Horsham, PA; Dunmore, PA; York, PA; West Chester, PA; Smithfield, RI; Mt. Pleasant, SC; Duncan, SC; Knoxville, TN; Memphis, TN; Richardson, TX; Austin, TX; Houston, TX; Richmond, VA; Ashland, VA; Norfolk, VA; Annandale, VA; Newport News, VA; Roanoke, VA; Fredericksburg, VA; Chantilly, VA; Fairfax, VA; Rutland, VT; Fairmont, WV; Charleston, WV	Eylea, Makena, Revlimid, Xiaflex, Radicava, Exjade, Hemlimbra	Public	BioScrip, Inc.	160o Broadway, Suite 700	Colorado
592	http://www.mybdrn.com/	Riverdale	NJ	07457	--place holder	Hemophilia	pvento@mybdrn.com	Pete Vento	URAC, CHAP	Independent	Education and counseling, Clinical outcomes monitoring, clinical waste disposal, 24x7 customer service, Insurance and reimbursement assistance, Product packaging, Delivery				Hemlimbra	Private	Bleeding Disorders Resource Network	1 South Corporate Drive 2nd Fl, Suite D	New Jersey
593	http://www.blountdiscountpharmacy.com	Alcoa	TN	37701	--place holder	Hepatitis C, HIV, Rheumatoid Arthritis, Crohn's Disease, Oncology, Immunology, Dermatology	belinda@blountdiscountpharmacy.com	Belinda Ellis	URAC, CPPA	Independent	Refill reminder, Co-pay assistance programs					Private	Blount Specialty Pharmacy 	129 Gill Street	Tennessee
594	www.boothwynpharmacy.com	Boothwyn	PA	19061	--place holder	Crohn's Disease, Cystic Fibrosis, ERT, Growth Hormone, Hematopoietics, Hepatitis C, IGT, Fertility, Multiple Sclerosis, Neurology, Oncology, Injectable Implant, Ophthalmology, Oncology, Osteoarthritis, Psoriasis, PAH, Rheumatoid Arthritis, RSV, Transplantation		Zachary Klishevich	URAC, ACHC	Independent	Counseling and education, Delivery and refill, Insurance benefit support	Prior Authorization support		Kennett Square, PA		Private	Boothwyn Pharmacy	2341 Chichester Ave	Pennsylvania
595	http://www.bramehuiepharmacy.com	North Wilkesboro	NC	28659	--place holder	Dermatology, Fertility, HRT		Cathy Huie		Independent	Counseling and education					Private	Brame Huie Pharmacy	1920 West Park Drive	North Carolina
596	http://www.braunrx.com	Chicago	IL	60614	--place holder	Fertility, HRT	brett@braunrx.com	Brett Pine		Independent	Counseling and education, Insurance benefit support				Cetrotide, Follistim, Gonal-F, Leuprolide, Menopur, Novarel, Pregnyl, Ovidrel	Private	Braun PharmaCare	2060 N. Clark Street	Illinois
597	http://www.brighamandwomens.org/Departments_and_Services/innovativecare/Specialty-Pharmacy.aspx?sub=1	Boston	MA	02115	--place holder	Fertility, Immunology, Multiple Sclerosis, Rheumatoid Arthritis, Oncology, Transplantation, Hemophilia, Ankylosing Spondylitis, Crohn's Disease, Cystic Fibrosis, Hepatitis C, HIV, Psoriasis, Psoriatic Arthritis	mcarter@partners.org	Michael Carter		Partners HealthCare	Counseling and education	Prescribing pattern analysis	Clinical pathways analysis			Subsidiary	Brigham and Women's Hospital Specialty Pharmacy	75 Francis Street	Massachusetts
598	http://www.briovarx.com	South Portland	ME	04106	--place holder	Ankylosing Spondylitis, Oncology, Crohn's Disease, Growth Hormone, Hemophilia, Hepatitis C, HIV, Fertility, Multiple Sclerosis, Transplantation, Osteoarthritis, Psoriasis, Psoriatric arthritis, PAH, Rheumatoid Arthritis, RSV, Ulcerative Colitis	richard.Couillard@briovarx.com	Richard Couillard	URAC, ACHC, VIPPS	OptumRx, UnitedHealth Group	Consultation, Delivery, Benefits investigation, 24/7 support, Financial assistance	Real-time critical data, Prior Authorization assistance, Clinical expertise	Treatment education, REMS support	Birmingham, AL; Los Angeles, CA; Miramar, FL; Cornelia, GA; Jeffersonville, IN; Lenexa, KS; Lake Charles, LA; South Portland, ME; Avon, MA; Columbus, MS; Las Vegas, NV; Long Island City, NY; Franklin, TN; Lubbock, TX; Dunbar, WV	Aralast, Glassia, Prolastin, Zemaira, Arcalyst, Ilaris, Aldurazyme, Cystadane, Elelyso, Fabrazyme, Hemlimbra, Lumizyme, Myozyme, Naglazyme, Orfadin, Vimizim, Zavesca, Mircera, Berinert, Cinryze, Kalbitor, Ruconest, Ferriprox, Eylea, Lucentis, Caprelsa, Cometriq, Iclusig, Imbruvica, Jakafi, Lenvima, Lynparza, Matulane, Thalomid, Zydelig, Adempas, epoprostenol, Flolan, Remodulin, Tyvaso, Uptravi, Veletri, Ventavis, Ofev, Gattex, Hetlioz, Juxtapid, Korlym, Kynamro, Myalept, Northera, Procysbi, Ravicti, Sabril, Signifor Lar, Solesta, Syprine, Ibrance, Inlyta, Xalkori, Bosulif, Sutent, Tarceva, REVLIMID, Orkambi, Kalydeco, Letairis, Humira, Hyqvia, Cuvitru	Subsidiary	BriovaRx	53 Darling Avenue	Maine
599	http://www.brothersspecialtyrx.com/	Riverside	CA	92505	--place holder	Hemophilia, von Willebrand disease, Bleeding disorders		Scott Carthey	ACHC	Independent	24/7 support, Medical care and delivery, Counseling and education, Financial navigation support	Coordination of services, including education and training	Adherence program support		Hemlimbra	Private	Brother's Healthcare	11705 Slate Avenue, Suite 200	California
600	https://www.byramhealthcare.com/diabetes/specialty-pharmacy	White Plains	NY	10605	--place holder	Diabetes, Wound Care	jmignone@byramhealthcare.com	Jeff Mignone		Owens & Minor	Education materials, Insurance verification, Clinical resources			Worcester, MA; Huntington Beach, CA; Kennesaw, GA; Portland, OR; Spokane, WA; Salt Lake City, UT		Subsidiary	Byram Healthcare	120 Bloomingdale Road, Suite 301	New York
601	https://www.csprx.com	Whittier	CA	90601	--place holder	Hepatitis C, Multiple Sclerosis, Psoriasis, Psoriatric Arhritis, Rheumatoid Arhtritis, Crohn's Disease, Cardiology, Immunology, Dermatology, Oncology, IVIG	george@csprx.com	George Kridner	ACHC	Independent	Insurance assistance, Counseling and education, refill reminders, 24x7 support	Clinical management, Compliance Monitoring	Pipeline Reporting, Site of Care Optimization, Orphan Drug Management, Pharmacovigilance, Product launch, REMS product management, 			Private	California Specialty Pharmacy	13027 Hadley Street	California
602	cancercareyork.navigatingcare.com	York	PA	17403	--place holder	Oncology	dBincarowsky@cancercareyork.com	Donna Bincarowsky		Independent	Counseling and education					Private	Cancer Care Associates of York	25 Monument Road	Pennsylvania
603	http://cancercarespecialists.org	Decatur	IL	62526	--place holder	Oncology, Hematology, Pain Management	abraden@ccsci.net	Allison Braden		Independent	Counseling and education					Private	Cancer Care Specialists of Central Illinois	210 W. McKinley Ave., Suite 1	Illinois
604	www.cancersarasota.com	Sarasota	FL	34233	--place holder	Oncology	sgadam@cancersarasota.com	Shanthy Gadam 		Independent	Counseling and education					Private	Cancer Center of Sarasota-Manatee	3830 Bee Ridge Rd #301	Florida
605	http://www.ucdmc.ucdavis.edu/pharmacy/specialty.html	Sacramento	CA	95817	--place holder	Cardiology, Dermatology, Gastroenterology, Hepatology, Infectious Diseases, Neurology, Oncology, Rheumatology, Transplantation	jlai@UCDAVIS.EDU	Josephine Lai	URAC	UC Davis Health	Delivery, Benefit and Insurance investigation, Financial assistance, Refill reminders, Counseling and education, 24x7 support					Subsidiary	Cancer Center Pharmacy	4501 X Street, Room 108	California
606	http://canyoncarerx.com	Pittsburgh	PA		--place holder	Hemaphilia, von Willebrand disease, Bleeding disorders		Dennis Gomez		Blood Systems	Counseling and education				Hemlimbra, \tIXINITY, Kogenate, ALPROLIX, Afstyla, Idelvion, Helixate, Humate, AlphaNine SD, NUWIQ, ATRYM, Thombate III, Bebulin, FEIBA, Profilnine SD, Benefix, Mononine, Rixubis, NovoSeven, Alphanate, Humate-P, Stimate, Wilate	Subsidiary	CayonCare Rx	3636 Boulevard of the Allies, Suite 400	Pennsylvania
607	http://capitoldrugs.com/	West Hollywood	CA	90069	--place holder	HIV, Pain Management, Growth Hormone, Diabetes, Rheumatoid Arthritis	weho@capitoldrugs.com	Ruth Tittle		Independent	Counseling and education			Sherman Oaks, CA		Private	Capitol Drugs Pharmacy	8578 Santa Monica Blvd	California
608	https://chsprx.com/	Columbia	MD	21046	--place holder	Oncology, Rheumatoid Arthritis, Urology, Neurology, IVIG	thomas.hermann@cardinalhealth.com	Tom Hermann	URAC, ACHC	Cardinal Health	Access to co-pay assistance and financial programs, Investigate benefits, Counseling and education		Channel program support, Patient-centric clinically focused care, Therapy and adherence support, Reporting and analytics		Albumin, Albuked, Albumin, Albuminar, Alburx, Albutein, Buminate, Flexbumin, Kedbumin, Plasbumin, Bivigam, Carimune, NF Flebogamma, Flebogamma, Gammagard, Gammaplex, Gammaked, Gamunex-C, Octagam, Privigen, Hizentra, HepaGam®, Hemlimbra, HyperHep, NABI-HB, Gamastan® SD, HyperRab® SD, HyperRho®-D, MicRhoGam®, RhoGam®, Rhophylac®, WinRho® SD, HyperTet® SD, Berinert®, Cytogam®, ATryn®, Thrombate® III, Bivigam® Carimune®,  Hizentra® Hyqvia®, Hyperrab®, Hyperrho®, Micrhogam® Rhogam®, Rhophylac®, Winrho®, Hypertet®, Hepagam®, Nabi®, Berinert®, Cytogam®, Stimate®, Actemra®* Entyvio, Envarsus® XR, Esbriet,  Kanuma®, Lucentis®, Mitosol, Nitronal, Nutropin, Panretin, Reconest, Soliris, Sylvant, Xolair, Afluria, Fluarix, Flublok, Flucelvax,  FluLaval, FluMist®, Fluvirin, Fluzone, Rabavert, Varivax, Zostavax, Adcetris,  Alecensa, Avastin, Beleodaq, Bosulif, Cotellic, Dacogen, Darzalex, Empliciti, Erivedge, Folotyn, Fusilev, Gazyva, Gilotrif, Halaven, Herceptin,  Ibrance, Inlyta, Iressa, Istodax, Ixempra, Kadcyla Keytruda® Kyprolis® Lenvima® Lonsurf®* Lynparza®* Nexacar®* Odomzo® Oncaspar® Opdivo® Perjeta®* Provenge® Rituxan®* Stivargav* Sutent®* Tagrisso®* Targretin®* Venclexta®* Vidaza® Xalkori®* Yervoy® Yondelis® Zaltrap® Zarxio® Zelboraf®*Nexavar	Subsidiary	Cardinal Health Specialty Pharmacy	7172 Columbia Gateway	Maryland
609	http://carepharmacies.com	Linthicum	MD	21090	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis	mwysong@carepharmacies.com	Mike Wysong		Independent	Counseling and education			California (5); Connecticut (1); District of Columbia (1); Florida (1); Georgia (1); Maryland (24); Massachusetts (1); Missouri (1); New Jersey (2); New York (7); Pennsylvania (3); Tennessee (1); Texas (1); Virginia (4); Wisconsin (4)		Private	CARE Pharmacies Cooperative	939 Elkridge Landing Rd. Suite #195	Maryland
610	http://www.caremedps.com	Lake Success	NY	11042	--place holder	Hemophilia, Fertility, Hepatitis, IVIG, Oncology, Pain Management	cdesrosiers@varemedsp.com	Caleb DesRosiers	URAC, ACHC	PharMerica	Coverage and Reimbursement Assistance, Appeals Assistance, Patient Assistance Program, Counseling and education, 24x7 support	Clinical outcomes monitoring, Patient acuity program, Utilization review, Refill tracking and monitoring, Benefit coordination, Clinical outcome data, Streamlined claims processing	Counseling and education on medication use, Supplies for self-injectables, Refrigerated products shipping, Clinical Care Coordinator		Orencia, Onzetra, Xsail, Ibrance, Inlyta, Xalkori, Bosulif, Sutent, Tarceva, REVLIMID, Hemlimbra, Tibsovo	Subsidiary	CareMed Specialty Pharmacy	1981 Marcus Avenue, Suite 225 	New York
611	https://carepointrx.com	Schaumburg	IL	60173	--place holder	Multiple Sclerosis, RSV, Hepatitis C, Psoriasis, Dermatology, Fertility, Immunology, Osteoporosis, Rheumatoid Arthritis	vzepeda@carepointrx.com	Vanessa Zepeda	URAC, VIPPS	Independent	Counseling and education, Insurance and co-pay assistance	Prior Authorization assistance, Patient-specific adherence reporting	Manufacturer-sponsored support programs, Patient assistance programs, Customized data packages, Marketing support, Manage formularies, REM programs, Adherence programs, Reimbursement services 	Rolling Meadows, IL; Roselle, IL; Seminole, FL; Suwanee, GA; Indianapolis, IN; Lewis Center, OH; Houston, TX		Private	Carepoint Pharmacy	9 East Commerce Drive	Illinois
612	http://www.caresiterx.com	Wilkes-Barre	PA	18765	--place holder	Oncology, Crohn's Disease, DVT, Hemophilia, Hepatitis C, HIV, Fertility, Multiple Sclerosis, Rheumatoid Arthritis	lzaleski@geisinger.edu	Lori Zaleski	URAC	Geisinger Health System	Co-pay assistance, Counseling and support			Woodbine, PA		Subsidiary	CareSite Specialty Rx	25 Church St., 4th Floor	Pennsylvania
750	http://www.invrx.com/	Birmingham	AL	35242	--place holder	Fertility, Hemophilia, Multiple Sclerosis, Rheumatoid Arthritis, Oncology, Transplantation		Mike Sands	URAC	Independent	DesignRx, Prior Authorizations, Financial assistance					Private	Inverness Lone Star Pharmacy	7004 Champion Blvd, S. 100	Alabama
613	http://www.carolinashealthcare.org/medical-services/prevention-wellness/other-prevention-wellness-services/chs-specialty-pharmacy-service-carolina-care	Charlotte	NC	28203	--place holder	Oncology, Fertility, Growth Hormone, Hepatitis C, Hematology, Multiple Sclerosis, Psoriasis, Psoriatic arthritis, Rheumatoid arthritis, Transplantation	john.robicsek@atriumhealth.org	John Robicsek	URAC	Carolinas Healthcare System	Counseling and education, Shipping, Financial assistance					Subsidiary	Atrium Health Specialty Pharmacy	1000 Blythe Boulevard	North Carolina
614	http://www.cascaderx.com/	Poulsbo	WA	98370	--place holder	Pain management, Urology, Dermatology, Wound Care, HRT	info@cascaderx.com	Brandon Knott		Independent	Counseling and education, Shipping, Financial assistance					Private	Cascade Specialty Pharmacy	325 NE Hostmark Street	Washington
615	http://www.clearviewcancer.com	Huntsville	AL	35805	--place holder	Oncology, Hematology	gwalton@ccihsv.com	Gary Walton	ACHC	Independent	Counseling and education					Private	Clearview Cancer Institute Pharmacy	3601 CCI Drive 	Alabama
616	www.ccsoncology.com	Orchard Park	NY	14127	--place holder	Oncology	info@ccsoncology.com	Shannon Gowen 		Independent	Counseling and education					Private	CCS Oncology	3041 Orchard Park Rd	New York
617	https://www.cedars-sinai.edu/Patients/Programs-and-Services/Pharmacy-Services/For-Patients.aspx	Los Angeles	CA	90048	--place holder	Oncology, Transplantation	rita.shane@cshs.org	Rita Shane		Cedars-Sinai Health Center	Counseling and education					Subsidiary	Cedars-Sinai Medical Center	127 South San Vincente Blvd	California
618	http://www.cedrapharmacy.com/	New York	NY	10065	--place holder	Crohn's Disease, Hepatitis, HIV, Rheumatoid Arthritis, Psoriasis, Transplantation, Multiple Sclerosis, Oncology	mazenk@cedrapharmacy.com	Mazen Karnaby	URAC, ACHC	Independent	Delivery, Financial Assistance, Patient Education	Prior Authorization support	Adherence programs, Counseling, Reimbursement support	2nd Avenue, New York, NY; Broadway, New York, NY; Dallas, TX; Houston, TX; Montebello, CA; Bronx, NY		Private	Cedra Pharmacy	1207 2nd Ave	New York
619	https://www.challiance.org/cha-services/specialty-pharmacy	Cambridge	MA	02139	--place holder	Dermatology, Oncology, Gastroenterology, Hematology, Nuerology, Ophthalmology, Urology	monoroto@challinace.org	Marco Onoroto	URAC	Cambridge Health Alliance	Counseling and education, 24x7 support, Refill reminders					Subsidiary	CHA Outpatient Specialty Pharmacy	1493 Cambridge Street	Massachusetts
620	http://www.chartwellpa.com	Pittsburgh	PA	15205	--place holder	Dermatology, Endocrinology, Enzyme Deficiencies, Gastroenterology, Hepatitis, Neurology, Fertility, Oncology, Rheumatoid Arthritis, Urology, Behavioral Health, Multiple Sclerosis, Pain Management, Pulmonology		Mike Haley	URAC, ACHC	UPMC	24/7 support, Counseling and Education, Delivery					Subsidiary	Chartwell Pennsylvania, L.P.	215 Beecham Drive	Pennsylvania
621	https://carepharmacies.com/blog/location/chevy-chase-care-pharmacy-2/	Chevy Chase	MD	20815	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis		Elnaz Darj		CARE Pharmacies						Member	Chevy Chase Care Pharmacy	8531 Connecticut Avenue	Maryland
622	http://www.chihealth.com/specialty-pharmacy	Omaha	NE	68124	--place holder	Autoimmune Disorders, Psoriasis, Rheumatoid Arthritis, Ankylosing Spondylitis, Juvenile Idiopathic Arthritis, Crohn's Disease, Hemophilia		Greg Schardt	URAC	CHI Health	Education, Financial Assistance, Delivery					Subsidiary	CHI Health Specialty Pharmacy	 7710 Mercy Road	
623	http://www.chihealth.com/specialty-pharmacy	Omaha	NE	68124	--place holder	Autoimmunne Disorders, Psoriasis, Psoriatic Arthritis, Ankylosing Spondylitis, Juvenile Idiopathic Arthritis, Crohn's Disease, Hemophilia, Hepatitis C, HIV, Multiple Sclerosis, Oncology, Transplantation		Greg Schardt	URAC	CHI Health	Counseling and education, Patient financial advocates					Subsidiary	CHI Specialty Pharmacy	7710 Mercy Road	Nebraska
624	http://www.carolinashealthcare.org/medical-services/prevention-wellness/other-prevention-wellness-services/chs-specialty-pharmacy-service-carolina-care	Charlotte	NC	28203	--place holder	Oncology, Ferility, Growth Hormone, Hepatitis C, Hematology, Multiple Sclerosis, Psoriasis, Rheumatoid Arthritis, Transplantation		Lisa Sutton	URAC	Carolinas HealthCare System	Counseling and education, shipping, Financial assistance					Subsidiary	CHS Specialty Pharmacy Services	1001 Blythe Boulevard	North Carolina
625	http://www.cigna.com	Philadelphia	PA	19192	--place holder	Fertility, Multiple Sclerosis, Hepatitis C, Rheumatoid Arthritis, Oncology, Crohn's Disease, Psoriasis		Jeff Nielsen	URAC	Cigna	Pharmacist access, Delivery, Tamper-resistant packaging, Therapy management				Adcetris, Afinitor, Aldurazym, Acthar, Actimmune, Adcetris,  Afinitor, Aldurazyme, Alecensa, Alprolix, Ampyra, Aubagio, Aralast, Benlysta, Bethkis, Blincyto, Bosulif, Ceprotin, Cerdelga, Ceredase, Cerezyme, Cosentyx, Cotellic, Dacogen, Darzalex, Depocyt, Dupixent, Egrifta, Elaprase, Eloctate, Entyvio, Erivedge, Esbriet, Exjade, Extavia, Eylea, Fabrazyme, Farydak, Firazyr, Fuzeon, Gazyva, Gilenya, Glassia, Herceptin, Hizentra, Humira,  HYQVIA, Ibrance, Ilaris, Iluvien, Inlyta, Jadenu, Jevtana, Kadcyla, Kcentra, Keytruda, Kevzara, Kitabis , Krystexxa, Kuvan, Kyleena, Kynamro, Kyprolis, Lemtrada, Letairis, Liletta, Lucentis, Lumizyme, Macugen, Mirena, Myozyme, Naglazyme, Nexavar, Ninlaro, Nucala, Nulojix, Ocrevus, Opdivo, Opsumit, Orencia, Otezla, Panhematin, Perjeta, Plegridy, Pomalyst, Purixan, Pulmozyme, Revlimid, Samsca, Serostim, Simponi, Simponi,  Aria, Siliq, Skyla, Soliris, Somatuline Depot, Somavert, Stelara, Stivarga, Supprelina,Sutent, Sylatron, Synagis, Tafinlar, Taltz, Tarceva, Tasigna, Tecentriq, Tecfidera, Thalomid, Thyrogen, Tobi, Tobi Podhaler, Tracleer, Tysabri, Valstar, Vantas, Varithena, Vimizim, Vivitrol, Vpriv, Xalkori, Xeljanz, Xolair, Xtandi, Yervoy, Zaltrap, Zarxio, Zelboraf, Zinbryt, Zykadia, Zytiga, Bethkis, Blincyto, Bosulif	Subsidiary	Cigna Specialty Pharmacy	Two Liberty Place	Pennsylvania
626	http://care.worldhealthclinicians.org/	Norwalk	CT	06850	--place holder	Hepatitis, HIV		Ranjeeta Mhatre	URAC	World Health Clinicians	Delivery and refills, Financial assistance				Hemlimbra	Subsidiary	Circle Care Center Pharmacy	618 West Ave	Connecticut
627	http://www.citizensrx.co	Edwardsville	IL	62025	--place holder	Bleeding Disorders, Diabetes, Immunology, Fertility, Crohn's Disease, Rheumatoid arthritis, Hepatitis C, Growth hormone, Osteoarthritis		John Burns	URAC	Independent		Claims processing, Formulary management, Prior authorization and utilization management, On-line reporting and analytics tools		Oak Park, IL; Burbank, CA; Chicago, IL; New York, NY; Seattle, WA		Private	CitizensRx	103 West Vandalia	Illinois
649	http://www.ucdmc.ucdavis.edu/pharmacy/specialty.html	Sacramento	CA	95817	--place holder	Cardiovascualr, Dermatology, Gastroenterology, Hepatology, Infectious Diseases, Neurology, Oncology, Rheumatoid Arthritis, Transplantation		Josephine Lai		UC Davis Health	Delivery, Benefit and Insurance investigation, Financial assistance, Refill reminders					Subsidiary	Cypress Pharmacy	2221 Stockton Blvd., Room 1130	California
628	http://citydrugsonline.com/pharmacy/	New York	NY	10065	--place holder	Immunology, Crohn's disease, Multiple Sclerosis, Oncology, Rheumatoid Arthritis, Transplantation		Alex Zeygeril	URAC, ACHC	Independent	Prior Authorization, Clinical Counseling, Financial Counseling and Co-Pay Support, Patient Education and training, Delivery and refill	Refill reminders, Co-payment and financial assistance, Delivery options, 24/7 clinical assistance, Patient education and counseling, Full reimbursement support	Data reporting, Clinical support			Private	City Drugs Specialty Pharmacy	1273 First Avenue	New York
629	http://www.cityviewpharmacy.com	Astoria	NY	11102	--place holder	HIV, Oncology, Fertility, Hepatitis		Harry Xidias		Independent	Delivery		Adherence and compliance tools			Private	City View Pharmacy	23-07 Astoria Boulevard	New York
630	http://my.clevelandclinic.org/departments/pharmacy	Cleveland	OH	44195	--place holder	Multiple Sclerosis, Hepatitis C, Transplantation, Oncology		Scott Knoer	URAC	Cleveland Clinic	Pharmacist 24/7, Counseling and education, Insurance assistance					Subsidiary	Cleveland Clinic 	9500 Euclid Avenue	Ohio
631	https://carepharmacies.com/blog/location/columbia-hickory-care-pharmacy/	Columbia	MD	21044	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis		H. Yung		CARE Pharmacies	Counseling and education					Member	Columbia Hickory Care Pharmacy	10805 Hickory Ridge Road	Maryland
632	https://carepharmacies.com/blog/location/comcare-pharmacy/	Bowie	MD	20716	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis		M. Toyalowo		CARE Pharmacies						Member	ComCare Pharmacy	15419 Excelsior Drive	Maryland
633	http://www.commcarepharmacy.com	Fort Lauderdale	FL	33306	--place holder	HIV, Hepatitis, Dermatology, Transplantation, Gastroenterology, Oncology, Rheumatoid Arthritis, Multiple Sclerosis, Respiratory Disorders		Greg Isaak	URAC, ACHC	Premier, Inc.	Copayment assistance, Insurance specialists, Free delivery	Compliance reporting, Prior Authorization	Adherence and compliance programs, Custom reporting, Restricted distribution	Hemlimbra	Tarceva	Subsidiary	Commcare Pharmacy	2817 East Oakland Park Boulevard, Suite 303 	Florida
634	http://comsprx.com/	St Petersburg	FL	33711	--place holder	HIV, Hepatitis C		Nikul Panchu	URAC, ACHC	Independent	Education, Compliance tracking, Prior Authorization					Private	Community Speiclaty Pharmacy	1617 34th ST. South Unit B	Florida
635	www.compassoncology.com	Portland	OR	97216	--place holder	Oncology		Brad Perrigo 		Independent						Private	Compass Oncology	10101 SE Main Street, Suite 1012	Oregon
636	https://www.comhs.org/services/pharmacy/outpatient-retail-pharmacy-services	Munster	IN	46321	--place holder			Elizabeth Clements		Community Healthcare System	Counseling and education, delivery, Identification of finacial assistance programs, 24x7 support	Insurance authorization and benefits coorination				Subsidiary	Community Surgery Center Pharmacy	801 MacArthur Blvd.	Indiana
637	http://condopharmacy.com/	Plattsburgh	NY	12901	--place holder	Pain management, HRT, Dermatology		Jean Moore		Independent						Private	Condo Pharmacy	28 Montcalm Avenue	New York
638	http://contracostaoncology.com	Walnut Creek	CA	94598	--place holder	Oncology		Michael P. Sherman		Independent						Private	Contra Costa Oncology	500 Lennon Lane	California
639					--place holder										Hemlimbra		Cook's Children Home Health		
640	http://www.coordinatedcarenetwork.org/	Pittsburgh	PA	15235	--place holder	HIV, Transplant, Behavioral Health, Oncology, Hepatitis C		Jeffrey Palmer	URAC	Independent	24/7 access, Counseling and education, Monthly refill reminders, Adherence tracking			Philadelphia, PA; Newark, NJ; Fort Lauderdale, FL		Private	Coordinated Care Network Pharmacy	300 Penn Center Blvd # 505	Pennsylvania
641	http://www.coramrx.com	Malvern	PA	19355	--place holder	Alpha-1, Hemophilia, IVIG, SCig, Multiple Sclerosis, Pain Management, Transplantation		Jennifer Shobert		CVS Specialty	Pharmacist 24/7, Delivery, Education and counseling	Insurance verification, Therapy management			Gatttex	Subsidiary	CoramRx Specialty Pharmacy Services	4 Spring Mill Drive	Pennsylvania
642	http://www.cornerstonepharm.com/	Valhalla	NY	10595	--place holder	Asthma, Oncology, Growth Hormone, Cystic Fibrosis, PAH, Transplantation, Osteoarthritis, Rheumatoid Arthritis, Crohn's Disease, Multiple Sclerosis, Hepatitis, Fertility, Bleeding Disorders, Psoriasis, Oncology, HIV		Jerry Mirra		Medical Centre Pharmacy	Counseling and education, Insurance assistance, Pre-authorizations, delivery					Affiliate 	Cornerstone Pharmacy	14 Madison Avenue	New York
643	http://costcohealthsolutions.com	Corona	CA	92880	--place holder			Theresa Hanna		Costco	Delivery, Counseling					Subsidiary	Costco Health Solutions	215 Deininger Circle, Suite A	California
644	http://cottrillspharmacy.com/	Arcade	NY	14009	--place holder	Hemophilia, Von Willebrand Disease, IVIG, Multiple Sclerosis, Fertility, HIV, Hepatitis, Transplantation		Dave Obrochta	URAC, ACHC	Independent	Reimbursement specialists, Counseling and support, 24/7 customer service				Hemlimbra	Private	Cottrill's Pharmacy, Inc.	255 Main St	New York
645	http://www.providence.org/credena-health	Portland	OR	97213	--place holder	Rheumatoid Arthritis, Multiple Sclerosis, Oncology, Hepatitis C, Cardiovascular, Crohn's disease, Fertility, Growth hormone, Hemophilia, HIV, Psoriasis		Austin Ewing	URAC	Providence Health	Counseling and education, 24/7 support, Financial assistance, Delivery					Subsidiary	Credena Health Specialty Pharmacy	6348 NE Halsey Street, Suite A	Oregon
646	http://www.curanthealth.com	Largo	FL	33777	--place holder	Asthma, Cystic Fibrosis, Diabetes, Hepatitis C, HIV, Renal Disease, Psoriasis, Rheumatoid Arthritis		Patrick Dunham	URAC, ACHC	Independent	Refills, , Pharmacist, Co-pay assistance	340B				Private	Curant Health	7209 Bryan Dairy Rd.	Florida
647	https://curexa.com/	Egg Harbor Township	NJ	08234	--place holder	HIV, Hepatitis, Crohn's Disease, Psoriasis, Ulcerative Colitis, Ankylosing Spondylitis, Rheumatoid Arthritis, Osteoporosis, Oncology, Pain Management, Fertility, Growth Hormone, Multiple Sclerosis, Osteoarthritis, Transplantation, Wound Care, Cystic Fibrosis, Hemophilia, Growth Hormone, Alpha 1, Asthma, Cardiovascualr, COPD, Chronic Kidney Disease, Factor Deficiencies, Anticoagulation, Hereditary Angioedema, Hypernatremia, Huntingdon's Disease		Andrew Lyle	URAC, ACHC	Independent	Refill reminders, Counseling and education, 24/7 clinical support, Access to translators	Prioritized patient support	Custom designed programs and reporting			Private	Curexa Pharmacy	3007 Ocean Heights Avenue	New Jersey
648	http://www.caremark.com	Woonsocket	RI	02895	--place holder	Growth Hormone, Immunology, Bleeding Disorders, Cystic Fibrosis, Gastroenterology, Hemophilia, HIV, Fertility, Inflammatory diseases, Oncology, Osteoarthritis, Osteoporosis, Psoriasis, PAH, Pulmonary, Renal disease, RSV, Rheumatoid Arthritis, Transplantation		lan Lotvin	JCAHO, URAC	CVS Health	Refills and delivery, 24/7 pharmacist, CareTeam support, Financial assistance			24 retail, 11 mail	ACTEMRA, ACTHAR H.P. GEL, ACTIMMUNE, ADCETRIS, ADEMPAS, ALDURAZYME, ALECENSA, ALUNBRIG, AMPYRA, APOKYN, ARALAST NP, ARCALYST, Arestin, ARZERRA, AUBAGIO, AVEED, BAVENCIO, BELEODAQ, BENDEKA, BERINERT, BETHKIS, BIVIGAM, BLINCYTO, BUPHENYL, CABOMETYX, CEPROTIN, CERDELGA, CEREZYME, CINQAIR, CINRYZE, CORIFACT, COSENTYX, COTELLIC, CYSTAGON, DARZALEX, EGRIFTA, ELAPRASE, ELELYSO, EMPLICITI, ERIVEDGE, ESBRIET, EVOMELA, EXJADE, EYLEA, FABRAZYME, FARYDAK, FIRAZYR, GAMMAPLEX, GATTEX, GAZYVA, GENVISC 850, GLASSIA, H. P. ACTHAR GEL, Hemlimbra, HIZENTRA, HYCAMTIN, HYMOVIS,IBRANCE, ILARIS*, ILUVIEN*, IMFINZI*, IMPLANON*, INCRELEX*, INLYTA*, INTRON A*, IRESSA*, ISTODAX*, JADENU*, JAKAFI*, KALBITOR*, KEVZARA*, KEYTRUDA*, KITABIS PAK*, KRYSTEXXA*, KUVAN*, KYLEENA*, KYNAMRO*, KYPROLIS*, LEMTRADA*, LETAIRIS*, LONSURF, LUCENTIS*, LUMIZYME*, MACUGEN*, MAKENA*, MEKINIST*, MIRENA*, MOZOBIL*, MYOZYME*, NAGLAZYME*, NATPARA*, NEXAVAR*, NEXPLANON*, NINLARO*, NORTHERA*, NOVOEIGHT*, NUCALA*, NUPLAZID*, OBIZUR*, OCALIVA*, OCREVUS*, ODOMZO*, OFEV*, OPDIVO*, OPSUMIT*, ORALAIR*, ORENITRAM*, OTEZLA*, OZURDEX*, PERJETA*, PLEGRIDY*, POMALYST*, PRALUENT*, PROMACTA*, PURIXAN*, RADICAVA*, RAVICTI*, REMODULIN*, RETISERT*, REVLIMID*, RITUXAN HYCELA*, RUBRACA*, RUCONEST*, SABRIL*, SAMSCA*, SEROSTIM*, SKYLA*, SOLESTA*, SOLIRIS*, SOMATULINE DEPOT*, SOMAVERT*, STIVARGA*, SUPPRELIN LA*, SYLATRON*, TAFINLAR*, TAGRISSO*, TALTZ*, TARCEVA*, TECENTRIQ*, TECFIDERA*, THYROGEN*, TOBI*, TOBI PODHALER*, TRACLEER*, TRETTEN*, TYKERB*, TYSABRI*, TYVASO*, UPTRAVI*, VELETRI*, VENTAVIS*, VIMIZIM*, VISUDYNE*, VONVENDI*, VOTRIENT*, VPRIV*, XALKORI*, XENAZINE*, XEOMIN*, XOLAIR*, XTANDI*, YONDELIS*, ZALTRAP*, ZECUITY*, ZELBORAF*, ZEMAIRA*, ZINBRYTA*, ZYKADIA*, ZYTIGA* 	Subsidiary	CVS Specialty Pharmacy	One CVS Drive	Rhode Island
650	http://www.cfpharmacy.com	Orlando	FL	32803	--place holder	Cystic Fibrosis		Lois Adams		HHCS	Counseling and education, Financial assistance, Pharmacist 24/7		Customized data and services, New drug launch coordination, Marketing support, Adherence programs			Subsidiary	Cystic Fibrosis Pharmacy	3901 East Colonial Drive	Florida
651	http://www.cfservicespharmacy.com	Bethesda	MD	20814	--place holder	Cystic Fibrosis			URAC	Walgreens					Kalydeco, Cayston, Creon, Tobi	Subsidiary	Cystic Fibrosis Services	6931 Arlington Road, Suite 400	Maryland
652	http://www.dartmouth-hitchcock.org/at-hospital/specialty-pharmacy.html	Lenbanon	NH	03756	--place holder	Asthma, Ankylosing Spondylitis, Oncology, Cystic Fibrosis, Hepatitis C, Hyperlipemia, Fertility, IBD, Multiple Sclerosis, Juvenile Arthritis, Neutropenia, Psoriasis, Psoriatric Arthritis, Rheumatoid Arthritis		Craig Pike	CHAP	Dartmouth-Hitchcock Medical Center	Counseling and education, 24x7 support, Copay assistance, Refiull remidners, Delivery					Subsidiary	Dartmouth-Hitchcock Specialty Pharmacy	1 Medical Center Drive	New Hampshire
653	http://davitarx.com	Coppell	TX	75019	--place holder	Renal Disease		Len Schiavone	JCAHO	Davita Healthcare Partners	Delivery, Adherence program, Insurance benefit assistance, 24/7 pharmacist			Chandler, AZ; Orlando, FL; San Bruno, CA; Coppell, TX		Subsidiary	DaVita Rx	1234 Lakeshore Drive, Suite 200	Texas
654	www.daytonphysicians.com	Dayton	OH	45414	--place holder	Oncology		Joshua Cox		Independent						Private	Dayton Physicians Network	6680 Poe Ave, Suite 200	Ohio
655	http://drugcopharmacy.com/	Roanoke Rapids	NC	27870	--place holder	Bleeding Disorders, Crohn's Disease, IVIG, Multiple Sclerosis, Enzyme Disorders, Transplantation		Gene Minton		Independent	Counseling and education			Ahoskie, NC; Littleton, NC; Nashville, NC		Private	DDP Pharmacy, Inc.	107 Smith Church Rd	North Carolina
656	https://decillionhealthcare.com	Dublin	OH	43017	--place holder	Hepatitis C, HIV, IVIG, SCIG, Multiple Sclerosis, Oncology, Rheumatoid Arthritis, RSV, Gastroenterology		Kenneth Ford	JCAHO	Biometrix	Counseling and education, 24x7 support, Benefit assistance, delivery	Access tied to chronic accreditations				Subsidiary	Decillion Healthcare	270 Cramer Creek Court	OHio
657	http://www.delcodrugs.com	Staten Island	NY	10312	--place holder	Hormone replacement, Fertility, HIV, Hepatitis		Robert Annicharico		Independent						Private	Delco Drugs	3833 Richmond Ave	New York
658	www.dvohmg.com	Pleasant Hill	CA	94523	--place holder	Oncology		Lori Orr		Independent						Private	Diablo Valley Oncology/Hematology	400 Taylor Blvd., Suite 202	California
659	http://www.dikdrugco.com/	Scottsdale	AZ	85260	--place holder	Bleeding Disorders, Crohn's Disease, Growth Hormone, Hepatitis C, Immunology, Multiple Sclerosis, Rheumatoid Arthritis, Psoriasis		John Henry Dik	URAC, ACHC	Independent	Infusion support					Private	Dik Drug Infusion Pharmacy	7898 E ACOMA DR\nSUITE 104\n	Arizona
660	http://diplomatpharmacy.com	Flint	MI	48507	--place holder	Alpha 1, Cystic Fibrosis, Dermatology, Fabry Disease, Fertility, Growth Hormone, Hemophilia, Hepatitis, HIV, Immunology, Multiple Sclerosis, Oncology, RSV, Rheumatoid Arthritis, Transplantation		Phil Hagerman	URAC		Assistance with financial issues, complicated medication therapies, refill processing, third-party funding support programs, side effect management and adherence monitoring	Compliance and persistency programs, Benefits investigation, Prior Authorization	REMS support, HUB services	Cincinnati, OH; Ontario, CA; Flint, MI; Carlsbad, CA; Raleigh, NC; Scottsdale, AZ; Woburn, MA: Enfield, CT; Buffalo Grove, IL; Media, PA; Savage, MN: Fort Lauderdale, FL; Urbandale, IA; Columbia, MD; Greensboro, NC	Ampyra, Aveed, Calquence, Cometriq, Esbriet, Hemlimbra, Ibrance, Iclusig, Imbruvica, Inlyta, Keveyis, Nexavar, Orkambi, Plegridy, Praluent, Tagrisso, Tykerb, Votrient, Zydelig, Zykadia, Ocrevus, Nerlynx, Xalkori, Bosiluf, Sutent, Nityr, Orcevus, Xolair, Zejula, Ibrance, Inlyta, Xalkori, Bosulif, Sutent, Tarceva, REVLIMID, Cuvposa, Cabometyx, VENCLEXTA, Humira, Nerlynx, Cuvitru, Zejula, Xermelo, Kisqali, Dupixent, Verzenio	Public	Diplomat Pharmacy	4100 S. Saginaw Street	Michigan
661	http://www.cooperhealth.org/departments-programs/direct-meds-camden	Camden	NJ	08103	--place holder			Kairi Liou		Cooper University Health Care						Subsidiary	Direct Meds of Camden	One Cooper Plaza	New Jersey
662	http://www.directrx.com	Troy	MI	48084	--place holder	Crohn's Disease, Hepatitis C, HIV, Multiple Sclerosis, Oncology, Osteoporosis, Transplantation, Psoriasis, Respiratory Disorders, Rheumatoid Arthritis		Santa Zawaideh	URAC, ACHC	Serve-You-Rx	Pharmacist availability, Compliance packaging, Delivery					Subsidiary	DirectRx Pharmacy	1179 Maplelawn Drive 	Michigan
663	http://www.dobbsferrypharmacy.com	Dobbs Ferry	NY	10522	--place holder	Fertility		Bruce Glickman		Independent	DesignRx					Private	Dobbs Ferry Pharmacy	18 Cedar Street	New York
664	http://www.centrichealthresources.com	Chesterfield	MO	63005	--place holder	Growth Hormone		Penny Bemus	URAC	Dohmen Life Sciences	Counseling and education, Assessments	Monitoring	REMS support, Reimbursement support, Custom reporting, Program management, 3PL services			Subsidiary	Dohmen Life Science Services	17877 Chesterfield Airport Road	Missouri
665	http://www.dolphinhealth.com/index.php	Oakland	CA	94605	--place holder	Hepatitis C, Rheumatoloid Arthritis, Gastroenterology, Multiple Sclerosis		Kalpesh Patel	URAC	Independent	Financial assistance					Private	Dolphin Health	7400 Macarthur Blvd. Suite A	California
666	http://dotspharmacy.com/	Charleston	SC	29412	--place holder	Dermatology, Hepatitis C, Rheumatoloid Arthritis, Cardiovascular		Dottie Farfone		Independent	24x7 access, Counseling and education					Private	Dottie's Pharmacy	354 Folly Road	South Carolina
667	https://drugcopharmacy.com/	Roanoke Rapids	NC	27870	--place holder	Bleeding Disorders, Crohn's Disease, IVIG, Multiple Sclerosis, Enzyme Disorders, Transplantation		Gene Minton	URAC	Independent	Counseling and education, Refill reminders			Ahoskie, NC; Littleton, NC; Nashville, NC	Hemlimbra	Private	Drugco Discount Pharmacy	107 Smith Church Road	North Carolina
668	https://www.dukehealth.org/locations/duke-specialty-pharmacy	Durham	NC	27710	--place holder	Oncology, Hepatology, HIV, Rheumatoid Arthritis, Cystic Fibrosis, Transplantation, Neurology		Colin Sheffield		Duke Cancer Center	Benefit verification assistance					Subsidiary	Duke Specialty Pharmacy	20 Duke Medicine Circle Room 0N44	North Carolina
669	www.duncanrxcenter.com	Mayfield	KY		--place holder	Crohn's Disease, Hepatitis C, Multiple Sclerosis, Psoriasis, RSV, Rheumatoid Arthritis, Women's Health		Andy Hayden	ACHC	Independent						Private	Duncan Specialty Pharmacy	317 West Broadway Street	Kentucky
670	https://www.dunnmeadow.com/	Fort Lee	NJ	07024	--place holder	Oncology		Randall Novak	URAC, ACHC	Independent	24x7 support, Benefits investigation, Prior Authorization support, Financial assistance porgrams	Prior Authorizations, Patient Safety & Compliance, Adherence and Compliance				Private	Dunn Meadow LLC	1555 Center Avenue, 1st Floor	New Jersey
672	http://echodrugs.net/	Brooklyn	NY	11211	--place holder	Hepatitis C, Gastroenterology, Oncology, Respiratory Disorders, Transplantation, Diabetes, Dermatology, Rheumatoloid Arthritis, Multiple Sclerosis		Mark Tartakovsky	Pending	Independent	Counseling and education, 24-hour clinical call center	Disease therapy management programs, Actional reports			Ibrance, Inlyta, Xalkori, Bosulif, Sutent	Private	Echo SalveoSpecialty Pharmacy	260 Broadway	New York
673	https://edgepharmacy.com/	Colchester	VT	05446	--place holder			William Chatoff	ACHC	Independent						Private	Edge Pharmacy	856 Hercules Drive, Suite 30	Vermont
674	https://www.einstein.edu	Philadelphia	PA	19115	--place holder	Oncology, Hepatitis C		Deborah Hauser	URAC	Einstein Medical Center	Education and counseling, Delivery			Elkins Park, PA (2); East Norriton, PA; Collegeville, PA; Philadelphia, PA (4)		Subsidiary	Einstein at Center One Pharmacy	9880 Bustleton Avenue	Pennsylvania
675	http://www.elwynspecialtycare.com	Glen Mills	PA	19342	--place holder	Fertility, Hepatitis, Crohn's Disease, HIV, Multiple Sclerosis, Oncology, Rheumatoid Arthritis, Psoriasis, Bleeding Disorders, Hemophilia		Stephen Seiden	URAC, ACHC	Elwyn Pharmacy Group	24/7 support, Delivery, Prior Authorization processing, Co-pay and financial assistance, Limited distribution medication access, Patient specific packaging, Two way adherence portal technology	Prior authorization processing, Auto-enroll manufacture medication specific support programs; 	Benefits investigation, Prior Authorization assistance, Copay Card Assistance, Home Delivery	Media, PA; Charleston, WV; Glen Rock, NJ		Subsidiary	Elwyn Specialty Care	54 Conchester Road	Pennsylvania
676	http://www.empirespecialtypharmacy.com	West New York	NJ	07093	--place holder	Oncology, Crohn's Disease, Gastroenterology, Hemophilia, Hepatitis, Immunology, Multiple Sclerosis, Osteoporosis, Rheumatoid Arthritis, Cystic Fibrosis, Dermatology		Peter Barkachi	URAC, JCAHO	Independent	Delivery, Financial and reimbursement assistance					Private	Empire Specialty Pharmacy	6601 Bergenline Avenue	New Jersey
677	http://encompassrx.com/	Atlanta	GA	30318	--place holder	Hepatitis C, Fertility, IBD, Multiple Sclerosis, Transplantation		Deepak Ranade	URAC	Independent	Benefit verification, Financial assistance, Manufacturer Patient assistance program, Counseling and education, On call pharmacist, Delivery, Refill reminder and compliance calls	Disease state management, Educational support, Refill and lab test reminders, Pharmacist support 24/7	Clinical pharmacist support, Manufacturer-approved education, Therapy specific targeted intervention, Custom data reporting			Private	Encompass Rx	500 Bishop St. NW\nSuite A-3	Georgia
678	https://www.enexiaspecialty.com/	Staten Island	NY	10310	--place holder	Bleeding Disorders, Dermatology, Gastroenterology, Hepatitis, Neutropenia, Pulmonology, Oncology, Osteoporosis		Boris Natenzon		Independent	Counseling and education, delivery	Prior authorization	Compliance	Brooklyn, NY; Staten Island, NY; New York, NY		Private	Enexia Specialty	826 Forest Avenue	New York
679	http://www.entrustrx.com/	Spring Hill	TN	37174	--place holder	Hepatitis C, Oncology, Growth Hormone, Multiple Sclerosis, Rheumatoid Arthritis, Alpha 1, Anticoagulant, Asthma, Bleeding Disorders, Crohn's Disease, Cystic Fibrosis, Endocrine disorders, Growth Hormone, Hemophilia, HIV, Immunology, Inflammatory disease, Osteoarthritis, Osteoporosis, PAH, RSV, Transplantation, Ulcerative colitis		Tim Liebmann	URAC, ACHC	Fred's Inc.	Counseling and education, Financial and copay assistance, 24/7 pharmacist and support	Prior Authorization and compliance programs		Memphis, TN; Columbus, MS; Murfreesboro, TN		Subsidiary	EntrustRx	2001 Campbell Station Parkway	Tennessee
680	https://www.envisionpharmacies.com	North Canton	OH	44720	--place holder	Allergies, Alzheimer's, Arthritis, Asthma, Autism, Crohn's Disease, Diabetes, Epilepsy, Glaucoma, Growth Hormone, Heart Disease, Hematopoietic, Hemophilia, Hepatitis C, IVIG, Renal disease, Lung diseases, Multiple Sclerosis, Oncology, Osteoporosis, Parkinson's, Psoriasis, Rheumatoid Arthritis, Transplantation		Donald Gale	URAC	EnvisionPharmacies	Insurance and financial assistance, Counseling and education, Delivery, 24x7 pharmacist support	Prior authorization	Patient assistance programs, Product launch assistance, Clinical support focused on patient outcomes, Reporting and insights	Educational materials	Euflexxa, Hyalgan, Orthovisc, Supartz,\nSynvisc, Vimpat, and Synagis	Subsidiary	Envison Specialty	7835 Freedon Avenue NW	Ohio
681	http://www.ethicalfactorrx.com/	Moosic	PA	18507	--place holder	Hemophilia, Hepatitis C, HIV, Rheumatoid Arthritis, Crohn's Disease, Asthma, Immunology, Oncology, Crohn's Disease, Fertility, Multiple Sclerosis, Diabetes, Hyperlipidemia		Lisa Tomcykoski	URAC	Independent	Specialized dispensing, Patient care management, Financial counseling/assistance				Hemlimbra	Private	Ethical Factor Rx	330 Montage Mountain Rd.\nSuite a-11	Pennsylvania
682	http://www.eversrx.com	Jamaica	NY	11436	--place holder	HIV, Hepatitis, Fertility, Gastroenterology, Oncology, Transplantation		Anthony Varikos	ACHC	Independent	Education, delivery, Financial assistance	Payor Authorization	Packaging, Adherence			Private	Evers Pharmacy	Evers Pharmacy	New York
683	www.exactcarepharmacy.com	Lakewood	NJ	08701	--place holder			Brad Hess		Nautic Partners	Medication management, Delivery and refills, Education and counseling			Lakewood, NJ		Subsidiary	ExactCare Pharmacy	160 Airport Rd	New Jersey
684	http://www.exactusrx.com	Tampa	FL	33634	--place holder	Bleeding Disorders, Cystic Fibrosis, Crohn's Disease, Hemophilia, Hepatitis, Growth Hormone, Multiple Sclerosis, Neutropenia, Oncology, Osteoarthritis, Psoriasis, RSV, Rheumatoid Arthritis, PAH, Lysosomal Storage Disorders		Warren Beiderman	URAC	WellCare Health Plans	Phone-based outreach, Targeted education, Adherence support, Refill reminders				Ibrance, Inlyta, Xalkori, Bosulif, Sutent, Tarceva, REVLIMID, Iclusig, Letairis, Hemlimbra	Subsidiary	Exactus Pharmacy Solutions	4110 George Road, Suite 100	Florida
685		Atlanta	GA	30303	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis		John Lee		CARE Pharmacies	Counseling and Education					Member	Express Drugs & Surgicals	212 Edgewood Avenue	Georgia
686	http://www.expresshealthmart.com/	Brooklyn	NY	11225	--place holder	Acromegaly, Fertility, Growth Hormone, Hepatitis C, HIV, Multiple Sclerosis, Oncology, Osteoarthritis, Transplantation		Bob Weinberg		Independent	Delivery, Counseling and education					Private	Express Health Mart	1173 Norstrand Avenue	New York
687	http://fandmrx.com	Flowood	MS	39232	--place holder	Hepatitis, Oncology, Bleeding Disorders, Rheumatoid arthritis, Transplantation			ACHC	ReCept Pharmacy	Counseling and education, delivery, benefit coordination		Compliance program			Subsidiary	F&M Specialty Pharmacy	117 Luckney Station	Mississippi
727	http://www.healypharmacy.com	Naperville	IL	60540	--place holder	Oncology, HIV, Hepatitis, Rheumatoid Arthritis, Fertility, Dermatology, Gastroenterology		Brian Healy		Apothecary By Design	Counseling and education, Delivery and refills, Insurance verification		Adherence programs			Subsidiary	Healy Pharmacy	100 Spalding Drive	Illinois
688	http://fosrx.com/wp/	Cumberland	MD	21502	--place holder	PAH, HIV, Hepatitis, Transplantation, Rheumatoid Arthritis, Hemophilia, Oncology, Multiple Sclerosis, Hyperlipidemia, Diabetes, Crohn's Disease, Fertility, Immunology		Sajal Roy	URAC, JCAHO	Independent	Counseling and education, delivery, benefit coordination	Insurance authorization and claims filing, Clinical counseling and support, Patient-specific billing program, Compliance checks				Private	Factor One Source Pharmacy	308 Virginia Ave	Maryland
689	http://www.factorsupport.com	Camarillo	CA	93012	--place holder	Hemophilia, von Willebrand Disease, Immunology, Neurology, HAE, Alpha-1, Hepatitis, Multiple Sclerosis, Rheumatoid Arthritis, HIV, PAH, Crohn's Disease, Psoriasis		Holly Shaw	URAC, ACHC	Matrix Health Group	On-call, 24-hour access, Next-day delivery, Infusion log support	Patient Assistance Program	Patient Assistance Program			Subsidiary	Factor Support Network Pharmacy	900 Avenida Acaso, Suite A	California
690	http://www.fairview.org/Pharmacy/Specialtypharmacy	Minneapolis	MN	55414	--place holder	Fertility, Immunology, Multiple Sclerosis, Rheumatoid Arthritis, Oncology, Transplantation, Hemophilia, Ankylosing Spondylitis, Crohn's Disease, Cystic Fibrosis, Hepatitis C, HIV, Psoriasis, Psoriatic Arthritis		Kyle Skiermont	URAC	Fairview Health Services	Refills and Delivery				Orkambi, Kalydeco, Kuvan	Subsidiary	Fairview Specialty Pharmacy	711 Kasota Ave. SE	Minnesota
691	https://sanrafaelfarmacia.com/en/	Santurce	PR	00909	--place holder	Oncology, HIV, Rheumatoid Arthritis, Multiple Sclerosis, Hepatitis C		Angel Diaz Rivas	URAC	Independent	Counseling and education					Private	Farmacia San Rafael	851 Lafayette	Puerto Rico
692	http://www.fastaccessrx.com	Metairie	LA	70002	--place holder	Rheumatoid Arthritis, Dermatology, Oncology, Immunology, Hemophilia, Endocrinology, Gastroenterology, Neurology		Stephen Lacoste	URAC, JCAHO	Factor One Source Pharmacy	Clinical support, Delivery	Benefit management, Insurance verification			Hemlimbra	Subsidiary	Fast Access Specialty Therapeutics	3131 N I-10 Service Rd E, #202	Louisiana
693	http://www.fennyspecialtyrx.com/	Jersey City	NJ	07302	--place holder	Multiple Sclerosis, HIV, Hepatitis, Crohn's Disease, Dermatology, Oncology, Transplantation, Bleeding Disorders, Asthma, DVT, Growth Hormone, Hemophilia, Fertility, Immunology		Badrinath Boggaram	ACHC	Independent	Delivery, Blister Packs, Billing and Insurance assistance, Injection training					Private	Fenny Pharmacy LLC	129 Newark Avenue	New Jersey
694					--place holder										Hemlimbra		Fidelis Specialty Pharmacy		
695					--place holder										Hemlimbra		First Choice IV		
696	http://www.mygnp.com/store?id=0013000000ioApDAAU&account=gnp-pharmacy-address-505-Gramatan-Avenue-Mount-Vernon-NY-10552	Mt. Vernon	NY	10552	--place holder	Cardiovascular, Diabetes, HIV, Hepatitis				AmerisourceBergen						Subsidiary	Fleetwood Pharmacy	505 Gramatan Ave	New York
697	http://flexcarepharmacy.com/	Washington	DC	20020	--place holder	Paim Management, Asthma, Fertility, HRT		Vivian Nanacho		Independent	Counseling and education, Free delivery, MTM programs					Private	Flex Care Pharmacy	3681 Alabama Avenue SE	District of Columbia
698	http://www.flspecialtypharmacy.com/	Jacksonville	FL	32256	--place holder	Oncology		Kelsie Mack		Cancer Specialists of North Florida	Counseling and education, Co-pay assistance, Delivery			Fleming Island, FL; Jacksonville, FL (5); Jacksonville Beach, FL; Middleburg, FL; 		Subsidiary	Florida Specialty Pharmacy	7015 AC Skinner Parkway, Suite 2	Florida
699	http://www.myfocusrx.com	West Babylon	NY	11704	--place holder	Oncology, IVIG, Hepatitis C, Crohn's Disease, Rheumatoid Arthritis, Psoriasis, Osteoarthritis		Lou Puleo	URAC, JCAHO	Independent	Counseling and education, Benefits investigation, Prior Authorization, Financial/Co-pay assistance		Adherence program, Multiple medication packaging			Private	FocusRx	1035 Straight Path 	New York
700	http://www.fwmoh.com	Fort Wayne	IN	46845	--place holder	Oncology		Steven Meyer		Independent						Private	Fort Wayne Medical Oncology and Hematology 	11143 Parkview Plaza Dr #100	Indiana
701	http://www.foundcare.com	Earth City	MO	63045	--place holder	Cystic Fibrosis		Mike Schultz	URAC	Independent	Reimbursement assistance		Compliance and adherence, Distribution and third party logistics		Orkambi, Kalydeco, Cayston	Private	Foundation Care LLC	4010 Wedgeway Court	Missouri
702	http://www.frdspecialtyrx.com	Los Angeles	CA	91042	--place holder	Asthma, Cardiovascular, Dermatology, Fertility, Gastroenterology, Hemophilia, Hepatitis, HIV, IVIG, Infusion, Multiple Sclerosis, Oncology, Transplantation, Rheumatology, RSV, Urology		Leo Kay		Independent	Financial assistance, Co-pay assistance, Auto-refill program, Delivery, 24/7 support		Prior Authorization, MTM, Limited Distribution Drugs			Private	FRD Specialty Pharmacy	6253 Foothill Blvd.	California
703	http://www.freedomfertility.com	Byfield	MA	1922	--place holder	Fertility		Bill O'Neil		Express Scripts	Financial assistance, 24x7 support, Clinical support				Bravelle®, Cetrotide® Chorionic Gonadatropin (brands include Novarel®, Pregnyl ®) Crinone®, Endometrin®, Follistim AQ®, Ganirelix, Gonal-F ® , Ovidrel®	Subsidiary	Freedom Fertility Pharmacy	12 Kent Way	Massachusetts
704	http://www.hhcs.com/freedom	Orlando	FL	32803	--place holder	Cystic Fibrosis		Lois Adams	ACHC	HHCS	Circle of Care Program, Refills, Patient Assistance Programs		Customized services and data packages, Patient support/assistance programs, New drug launch coordination, Marketing support, Adherence programs			Subsidiary	Freedom Pharmacy & Wellness Center 	3901 E Colonial Drive	Florida
705	http://www.fmcna.com	Waltham	MA	2451	--place holder	Renal disease		Billy Kim		DaVita	24/7 support, counseling and education, Financial assistance		Prior authorization, Customized reporting, Compliance and adherence programs			Subsidiary	Fresenius Rx (2,200 dialysis centers)	920 Winter Street	Massachusetts
706	http://www.froedtert.com/patients-visitors/pharmacy	Milwaukee	WI	53226	--place holder	Fertility, Immunology, Multiple Sclerosis, Rheumatoid Arthritis, Oncology, Transplantation, Hemophilia, Ankylosing Spondylitis, Crohn's Disease, Cystic Fibrosis, Hepatitis C, HIV, Psoriasis, Psoriatic Arthritis		Chris Sanders	URAC	Froedtert & Medical College of Wisconsin	Counseling and education, Benefit assistance, Delivery and refills, 24x7 support, Financial assistance, 					Subsidiary	Froedtert Specialty Pharmacy	9200 West Winconsin Avenue	Wisconsin
707	http://www.genoa-qol.com/	Tukwila	WA	98188	--place holder	Behavioral Health, Substance use disorders		David Vucurevich		Independent	Pick-up and delivery, On-site clinical pharmacist 24x7, 					Private	Genoa, a QoL Healthcare Company	18300 Cascade Avenue South, Suite 251	Washington
728	https://www.heb.com/static-page/article-template/specialty-pharmacy	San Antonio	TX	78204	--place holder	Bleeding Disorders, Hemophilia, Oncology, Multiple Sclerosis, Cystic Fibrosis, Hyperlipidemia, IBD, Dermatology, Rheumatoid Arhritis, Hepatitis C		Gabe Quintanilla	URAC, ACHC	H-E-B Food Stores	Delivery					Subsidiary	HEB Specialty Pharmacy	646 South Flores Street	Texas
708	http://gentryhealthservices.com/	Medina	OH	44256	--place holder	HIV, Crohn's Disease, Growth Hormone, Hepatitis, Hyperlipidemia, Multiple Sclerosis, Osteoporosis, Psoriasis, Psoriatic Arthritis, Rheumatoid Arhritis		Brandon Hardin	URAC, ACHC	Independent	Insurance verification, 24/7 assistance, Financial assistance	Clinical interventions, Prior authorization, 24/7 access	Medication counseling and self-administration training, Medication review program, Customized clinical program, Patient access to medications, Customized fulfillment programs, Customized reporting, 3PLs and Hubs, Patient Advocacy			Private	Gentry Health Services	1090 Enterprise Dr	Ohio
709	http://www.giopharm.com	Newark	NJ	07107	--place holder	Crohn's Disease, Diabetes, Hepatitis, HIV, Multiple Sclerosis, Oncology, Osteoporosis, Osteoarthritis, Psoriasis, Rheumatoid Arthritis		Trushar Sheth	URAC, ACHC	Independent	Medicine-on-Time, Delivery and refills	Reports and monitor waste reduction, Prior Authorization, Compliance, Intervention	Medication and therapy packaging, Pilot programs within patient profile, Patient usage reporting, Assistance with product launches and distribution of education material			Private	Gianotto's Specialty Pharmacy	195 First Avenue	New Jersey
710	https://specialtyrx.gianteagle.com	Moon Township	PA	15108	--place holder	Oncology, Rheumatoid arthritis, Psoriasis, Crohn's disease, Multiple Sclerosis, HIV, Growth Hormone, Osteoporosis, Hepatitis C		Debbie Krasnow	URAC, ACHC	Giant Eagle	Counseling and education, Financial assistance	Benefit investigation services, Financial assistance services	Disease-specific care teams, Customized drug therapy management, Utilization and adherence monitoring, Refill reminders, Physician outreach and care coordination, 24x7 pharmacist, Manufacturer-sponsored support programs			Subsidiary	Giant Eagle Specialty Pharmacy	600 Lindbergh Drive	Pennsylvania
711	https://carepharmacies.com/blog/location/glen-echo-care-pharmacy-2/	Bethesda	MD	20816	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis		Ata Dizdar		CARE Pharmacies						Member	Glen Echo Pharmacy	7311 MacArthur Blvd	Maryland
712	http://glenrockmedicalpharmacy.com	Glen Rock	NJ	07452	--place holder	Fertility, Hepatitis, Crohn's Disease, HIV, Multiple Sclerosis, Oncology, Rheumatoid Arthritis, Psoriasis, Anemia, Anti-Psychotic, Hemophilia		Mary Schouten-Norris	URAC, ACHC	Elwyn Pharmacy Group	DesignRx, Delivery, 24/7 support, Adherence, Financial assistance, Injection training, Prior authorization		Copay and foundation program assistance, Limited distribution medication access, Customized disease specific referral forms, Packaging options, Adherence program			Subsidiary	Glen Rock Medical Pharmacy	210 Rock Road	New Jersey
713	http://www.globedrugstore.net/	Brooklyn	NY	11209	--place holder	Hepatitis C, HIV, Psoriasis, Rheumatoid arthritis, Crohn's Disease, Osteoporosis		Brett Cohen	JCAHO	Independent	Counseling and education	Prior authorization				Private	Globe Drug and Surgical	405 86th Street	New York
714	https://carepharmacies.com/blog/location/goodcare-pharmacy/	Washington	DC	20032	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis				CARE Pharmacies						Member	GoodCARE Pharmacy	2910 Martin Luther King Jr Ave SE	District of Columbia
715	http://www.grassysprainpharmacy.com	Yonkers	NY	10710	--place holder	Fertility		Alex Kavrazonis		Westchester Pharmacy Group	Refills, Auto-refill program, Delivery					Subsidiary	Grassy Sprain Pharmacy	640 Tuckahoe Road 	New York
716	www.ghc.org	Seattle	WA	98124	--place holder	Crohn's Disease, Cystic Fibrosis, Hepatitis, HIV, Multiple Sclerosis, Oncology, Osteoporosis, Renal Disease, Rheumatoid Arthritis, Infusion		Paul Yoon, Manager		Group Health Coop	Treatment monitoring, financial assistance options, 24/7 support					Health System	Group Health Specialty Pharmacy	P.O. Box 34590 	Washington
717	http://www.grubbspharmacy.com/	Washington	DC	20003	--place holder	Oncology, Crohn's Disease, Behavioral Health, HIV, Osteoporosis, Rheumatoid Arthritis		Michael Kim		Independent	Counseling and education, Delivery, Refills					Private	Grubb's CARE Pharmacy	326 East Capitol Street NE	District of Columbia
718	http://grubbsnw.com	Washington	DC	20036	--place holder	HIV/AIDS, Fertility, Hepatitis C, Rheumatoid Arthritis		Yoosup Chang		Independent	Clinical counseling, delivery		Adherence program, MTM services			Private	Grubb's NW Specialty Pharmacy	1517 17th Street NW	District of Columbia
719	http://grubbspharmacyse.com/	Washington	DC	20020	--place holder	Oncology, Crohn's Disease, Behavioral Health, HIV, Osteoporosis, Rheumatoid Arthritis		William Fadel		Independent	Counseling and education, Delivery, Refills					Private	Grubb's Southeast Pharmacy	1800 Martin Luther King Jr Ave SE	District of Columbia
720	http://www.gundersenhealth.org/services/pharmacy/specialty-pharmacy-service/	La Crosse	WI	54601	--place holder	Fertility, Immunology, Multiple Sclerosis, Rheumatoid Arthritis, Oncology, Transplantation, Hemophilia, Ankylosing Spondylitis, Crohn's Disease, Cystic Fibrosis, Hepatitis C, HIV, Psoriasis, Psoriatic Arthritis		Jolene Garrett		Gundersen Health System	Refills, Prior authorizations, Delivery, support			La Crosse, WI; Onalaska, WI		Subsidiary	Gundersen Health System's Specialty Pharmacy	1900 South Avenue	Wisconsin
721	http://halethorpepharmacy.com/	Baltimore	MD	21227	--place holder	Diabetes		George Garmer		Independent	Counseling and education, Free delivery					Private	Halethorpe Pharmacy	1307 Francis Avenue	Maryland
722	https://hartfordhospital.org/health-professionals/education/residencies-fellowships/pharmacy-residencies/hartford-hospital-pharmacy-department	Hartford	CT	06103	--place holder	Hemophilia, Multiple Sclerosis, Hepatitis, Rheumatoid Arthritis, HIV, Pulmonology, Asthma, Crohn's Disease, Oncology, Transplantation, Hyperlipidemia		Eric Arlia		Hartford HealthCare						Subsidiary	Hartford HealthCare Specialty Pharmacy	1 State Street	Connecticut
723		Jersey City	NJ	07304	--place holder					Independent						Private	Health Care Pharmacy	953 Garfield Avenue	New Jersey
724	https://www.lvhn.org/our_services/key_support_services/pharmacy	Allentown	PA	18103	--place holder	Bleeding Disorders, Neutropenia, Oncology, Enzyme Deficiencies, Endocrine Disorders, Fertility, Growth Hormone, Hemophilia, Hepatitis, HIV, Multiple Sclerosis, Osteoporosis, Pulmonolgy, Respiratory Disorders, Transplantation		Brian Lenich		Lehigh Valley Health Network	Refills and shipping			Allentown, PA; Bethlehem, PA		Subsidiary	Health Spectrum Pharmacy Services	1200 S. Cedar Crest Blvd.	Pennsylvania
725					--place holder										Hemlimbra		Healthcare Evolution		
726	http://www.healthsourcepharmacy.com	New York	NY	10065	--place holder	Fertility, Oncology, Pain Management, Transplantation, Diabetes				Independent	Delivery			New York, NY (2)		Private	HealthSource Pharmacy	1302 Second Avenue at 68th Street	New York
751	http://www.ivcareoptions.com/	Macon	GA	31201	--place holder	IVIG, Pain management		Freddie Dwozan	URAC	Independent						Private	IV Care Options	151 College Street	Georgia
729	http://heightsspecialty.com/	Hasbrouck Heights	NJ	07601	--place holder	Oncology, Transplantation		Sam Papasavas	URAC	Independent	Identify copay assistance. Identify manufacturer programs, Counseling and education	Coordination of benefits, pharmacy billing and reimbursement counseling, utilization management protocols	Full benefits investigation and co-pay assistance review in addition to proper drug administration and counseling on side effects/drug interactions			Private	Heights Specialty Pharmacy	450 Boulevard	New Jersey
730	http://www.hoacny.com	East Syracuse	NY	13057	--place holder	Oncology		Maryann Roefaro		Independent						Private	Hematology Oncology Associates of CNY	5008 Brittonfield Pkwy	New York
731	http://www.hog.org	Atlanta	GA	30350	--place holder	Hemophilia, von Willebrand disease, Bleeding Disorders		Tom Hoover		Independent	Delivery, Counseling and education, 					Private	Hemophilia of Georgia	8800 Roswell Road, Suite 170	Georgia
732	https://www.pharmacyadvantagerx.com	Detroit	MI	48202	--place holder	Crohn's Disease, Psoriasis, Rheumatoid arthritis, Psoiasis, Oncology, Growth Hormone, Hemophilia, Hepatitis C, HIV, Fertility, Multiple Sclerosis, Neurology, Transplantation		James Kalus		Henry Ford Health System	Delivery, Financial assistance programs, Clinical support and education, Refill reminder, Prior Authorization					Subsidiary	Henry Ford Specialty Pharmacy	2799 W. Grand Blvd.	Michigan
733					--place holder										Hemlimbra		Heritage Biologics		
734					--place holder										Hemlimbra		Herndon Pharmacy		
735	http://hillcrestpharmacy.com/	San Diego	CA	92104	--place holder	Fertility, HIV, Oncology, Diabetes, Hepatitis		Susan Baeza	URAC	Independent	Counseling and education, Delivery and refills, Chronic Disease Management, Insurance consultations	Prior authorization process		Vista, CA		Private	Hillcrest Pharmacy	120 University Ave 	California
736	https://www.cincinnatichildrens.org/service/h/home-care/services/pharmacy	Cincinnati	OH	45229	--place holder	IVIG, Growth hormone, Pain management, Oncology, RSV, Osteoporosis, Transplantation, Hemophilia		Mark Thomas		Cincinnati Children's		Delivery, Counseling and education 				Subsidiary	Home Care Services	3333 Burnet Avenue	Ohio
737	http://hometechadvanced.com/	Sharon Hill	PA	19079	--place holder	IVIG, Hemophilia, Hepatitis, Multiple Sclerosis, HIV, Rheumatoid Arthritis, Crohn's Disease, PAH, Dermatology, Growth hormone, Pain management		Jennifer Walden	ACHC, URAC	Independent	365/24/7 Access, Dispense and Delivery, Case Management Coordination, Reimbursement Management	Establish clinical protocols, Monitoring utilization compliance and outcomes, Financial assistance	Customized data reporting, inventory management and clinical protocols to support manufacturers programs and Hub services			Private	Hometech Advanced Therapies	505 Elmwood Avenue	Pennsylvania
738	http://www.howardrx.com/	Columbia	MD	21045	--place holder	Rheumatoid arthritis, Hepatitis C, Oncology, HIV				Independent	Counseling and education, Free delivery	Prior authorization				Private	Howard Pharmacy	8900 Columbia 100 Parkway, Suite H	Maryland
739	http://hpcspecialtypharmacy.com	Mobile	AL	36602	--place holder	Crohn's Disease, Hemophilia, Hepatitis C, Immunology, Multiple Sclerosis		Todd Vereen	URAC, ACHC	Independent	Clinical support and education, Medication management, Financial assistance	Clinical education and training, Formulary management, MTM, Reimbursement	Patient assistance programs		Hemlimbra	Private	HPC Specialty Pharmacy	63 South Royal St, Suite 710	Alabama
740	https://www.rightsourcerx.com	Springdale	OH	45246	--place holder	Oncology, HIV, Multiple Sclerosis, Rheumatoid Arthritis, Hemophilia, Psoriasis, Crohn's Disease, Immunology		Adam Hanauer		Humana	Education and counseling, Financial assistance				Ibrance, Inlyta, Xalkori, Bosulif, Sutent, Tarceva, REVLIMID, Nexavar, Iclusig, Letairis, Humira, Hemlimbra	Subsidiary	Humana Specialty Pharmacy	111 Merchant Street	Ohio
741	http://www.hvrxsolutions.com	Omaha	NE	68138	--place holder	Anemia, Asthma, Bleeding disorders, Crohn's Disease, Cystic Fibrosis, Enzyme deficiencies, Fertility, Growth Hormone, Hemophilia, Hepatitis, HIV, IVIG, Multiple Sclerosis, Oncology, Osteoarthritis, Psoriasis, Psoriatic arthritis, Rheumatoid arthritis, RSV, Transplantation, Urology		Amy Adams	URAC, ACHC	Hy-Vee/Amber Pharmacy	Adherence checks, 24/7 support and delivery, Financial assistance programs	DURs, Coordination of Benefits, Information Reporting	Prior Authorizations, Limited Distribution medications			Subsidiary	Hy-Vee Pharmacy Solutions 	10004 South 152nd Street, Suite C	Nebraska
742	http://illinoiscancercare.com	Peoria	IL	61615	--place holder	Oncology		Jason Harlowe 		Independent						Private	Illinois Cancer Care	8940 N Wood Sage Rd	Illinois
743	https://carepharmacies.com/blog/location/indian-head-pharmacy/	Indian Health	MD	20640	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis		James Chen		CARE Pharmacies	Counseling and education					Member	Indian Head Pharmacy	4115 Indian Head Hwy	Maryland
744	http://www.infinitipharmacy.com/	Pompano Beach	FL	33062	--place holder	Hepatitis C, IBD, HIV, Multiple Sclerosis, Oncology, Psoriasis, Rheumatoid arthritis		Deepak Ranade	URAC, ACHC	Independent	Benefit verification, Financial assistance, Counseling and education, 24x7 pharmacist, Delivery and refills	Disease state management	Manufacturer Patient Assistance Program			Private	Infiniti Pharmacy	1338 North Federal Highway	Florida
745	https://www.icsrx.com/	Bentonville	AR	72712	--place holder	Dermatology, Gastroenterology, Hepatitis C, HIV, Hypercholesterolemia, Rheumatoid Arthritis		Jonathan Gintonio	URAC, PCAB	Independent	Insurance coverage assistance, 24x7 support, Counseling and education, Medication therapy management					Private	Infinity Care Solutions	1204 SE 28th Street, Suite 2	Arkansas
746	http://infuscience.com 	Gurnee	IL	60031	--place holder	Gastroenterology, Oncology, Multiple Sclerosis, Transplantation, Hemophilia, Immunology		Paul Wettengel	URAC, ACHC	BioScrip				Savannah, GA; Eagan, MN; Omaha, NE; Mt. Pleasant, SC; Chantilly, VA		Subsidiary	InfuScience	1225 Tri-State Parkway, Suite 510	Illinois
747	https://intermountainhealthcare.org/services/pharmacy/specialty-pharmacy/	Midvale	UT	84047	--place holder	Asthma, Bleeding Disorders, Ankylosing spondylitis, Crohn's disease, Cystic fibrosis, Chronic iron overload, Chronic uticaria, Growth Hormone, Hepatitis, Hereditary angiodema, Hidradenitis suppurativa, HIV, Multiple sclerosis, Oncology, Osteoarthritis, Osteoporosis, Psoriasis, Psoriatic arthritis, PAH, Rheumatoid arthritis, RSV, Ulcerative colitis		Marc Holley	URAC	Intermountain Healthcare	Counseling and education, 24x7 pharmacist, Refills and delivery, Financial assistance	Prior authorization assistance				Subsidiary	Intermountain Specialty Pharmacy	7268 Bingham Jct Blvd	Utah
748					--place holder										Hemlimbra		InTouch Pharmacy		
749	https://www.invtrinity.com/	Trinity	AL	35673	--place holder	Hemophilia		Christopher Simpson	URAC, ACHC	Independent						Private	Inverness Apothecary Trinity	24333 Gordon Terry Parkway Suite B	Alabama
752		Jessup	MD	20794	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis		Abtin Youssefi 		CARE Pharmacies	Counseling and education					Member	IV Solutions	8610 Washington Blvd #110	Maryland
753	http://www.ivsolutions.org/	Los Angeles	CA	90034	--place holder	Dermatology, Gastroenterology, Hematology, Oncology, Pain Management, Rheumatoid Arthritis, Infectious Disease, Bleeding Disorders, Transplantation			JCAHO	Independent	Counseling and education, Delivery, 24x7 support					Private	IV Solutions	3384 Motor Ave	California
754	http://hospitals.jefferson.edu/departments-and-services/specialty-pharmacy.html	Philadelphia	PA	19107	--place holder	Crohn's Disease, Psoriasis, Rheumatoid arthritis, Psoriatic Arthritis, Oncology, Growth Hormone, Hemophilia, Hepatitis C, HIV, Fertility, Multiple Sclerosis, Neurology, Transplantation		Christie DeLash		Jefferson Health	Counseling and education, Patient financial advocacy, Clinical 24x7 support, Delivery					Subsidiary	Jefferson Specialty Pharmacy	919 Walnut Street, Suite 813	Pennsylvania
755	http://www.hopkinsmedicine.org/patient_care/outpatient_pharmacy/specialty_pharmacy.html	Baltimore	MD	21205	--place holder	Hepatitis C, Rheumatoid arthritis, Crohn's disease, Ulcerative colitis, Ankylosing spondylitis, Psoriasis, Psoriatic arthritis, Growth hormone 		Christine Ng	URAC	Johns Hopkins Health System	Counseling and education, Insurance approval					Subsidiary	Johns Hopkins Specialty Pharmacy	1810 East Monument Street	Maryland
756	http://www.jolietoncology.com	Joliet	IL	60435	--place holder	Oncology		Sarode K. Pundaleeka 		Independent						Private	Joliet Hematology Oncology Associates	2614 W Jefferson Street	Illinois
757	http://www.josefspharmacy.com	Raleigh	NC	27610	--place holder	Crohn's Disease, HIV, Multiple Sclerosis, Osteoporosis, Psoriasis, Psoriatic Arthritis, Rheumatoid Arthritis		Finny Joseph	URAC	Independent	Delivery, Refills, Counseling and education, Financial assistance		Adherence programs			Private	Josefs Pharmacy LLC	2100 New Bern Ave	North Carolina
758	http://www.kabafusion.com	Cerritos	CA	90703	--place holder	Immunology, Transplantation, Infusion		Sohail Masood	URAC, ACHC	Independent	Pharmacist and reimbursement support, Insurance verification, Prior Authorization	Patient education		Cerritos, CA; Edison, NJ; Dallas, TX; Chicago, IL; Shrewsbury, MA; Horsham, PA		Private	KabaFusion	17777 Center Court Drive, Suite 550 	California
759	http://www.kaiserpermanente.org	Oakland	CA	94612	--place holder	Bleeding Disorders, Crohn's Disease, Cystic Fibrosis, Hepatitis, Growth Hormone, HIV, Fertility, Multiple Sclerosis, Oncology, Osteoporosis, PAH, Rheumatoid Arthritis, Ulcerative Colitis, Wilson's Disease		Victor Moye	URAC	Kaiser Foundation			REMs support		Orkambi, Kalydeco, Iclusig, Letairis	Subsidiary	Kaiser Permanente Specialty Pharmacy	1 Kaiser Plaza	California
760	http://www.kerrhealth.com	Raleigh	NC	27616	--place holder	Oncology, COPD, Multiple sclerosis, HIV, Rheumatoid arthritis, Transplantation, Behavioral health, Dermatology, Fertility		Mike Brown		Walgreens	24x7 clinical support, Delivery	 Insurance benefit verification, Prior authorization				Subsidiary	Kerr Health Specialty Pharmacy	8431 Garvey Drive, Suite 121 	North Carolina
761	http://www.keystonerx.com	Grand Rapids	MI	49546	--place holder	Fertility, Pain Management			PCAB	Independent						Private	Keystone Pharmacy	4021 Cascade RD SE, Suite 50	Michigan
762	http://www.kingspharmacy.org	New York	NY	10013	--place holder	Crohn's Disease, Fertility, Hemophilia, Hepatitis C, HIV, IVIG, Oncology, Rheumatoid Arthritis, Transplantation		Ron Del Gaudio	URAC, ACHC	Independent	Financial Assistance, delivery, Insurance Verification, 24/7 pharmacist, Prior authorization		Patient Assistance Programs	New York, NY; Brooklyn, NY		Private	King's Pharmacy	5 Hudson Street	New York
763	https://pharmacy.kmart.com/newrx-speciality-pharmacy	Hoffman Estates	IL	60179	--place holder	Bleeding Disorders, Oncology, Crohn's disease, Cystic Fibrosis, Growth Hormone, Hepatitis C, HIV, Multiple Sclerosis, Osteoporosis, Renal Disease, Rheumatoid Arthritis, Transplantation		John Crupie		Kmart	Financial assistance help, 24x7 support	Prior authorization			Hemlimbra	Subsidiary	Kmart Specialty Pharmacy	3333 Beverly Road	Illinois
764	http://www.kohlls.com	Omaha	NE	68105	--place holder	Behavioral Health, Hepatitis C, HIV, Hypercholesterolemia, Multiple Sclerosis, Oncology, Osteoporosis, Psoriasis, Rheumatoid Arthritis		David Kohll		Independent	Insurance and co-pay verification, refill reminders, Delivery	Prior authorization	Manufacturer co-pay cards, Patient assistance program, Manufacturer support enrollment	Lincoln, NE; Malvern, IA; Omaha, NE (4); Papillion, NE; 		Private	Kohll's Pharmacy and Homecare	2923 Leavenworth Street	Nebraska
765	http://www.komotomedicalpharmacy.com/	Bakersfield	CA	93301	--place holder	Asthma, Diabetes, Hepatitis C, Enteral Nutrition, HRT, Infusion		Brian Komoto		Komoto Healthcare	Counseling and education, Refills			Delano, CA		Subsidiary	Komoto Pharmacy	2110 Truxtun Ave Ste 100	California
766	http://kraupnerpharmacy.com	Brooklyn	NY	11237	--place holder	Diabetes, Fertility		Andrew Yang		Independent	Delivery, DesignRx					Private	Kraupner Pharmacy	457 Knickerbocker Ave.	New York
767	http://www.axiumhealthcare.com	Lake Mary	FL	32746	--place holder	Crohn's Disease, Cystic Fibrosis, Gaucher's Disease, Growth Hormone, Hemophilia, Bleeding Disorders, Hepatitis C, Hereditary Angioedema, HIV, Immunology, Multiple Sclerosis, Oncology, Psoriasis, Rheumatoid Arthritis, Transplantation		Tom Dervin		Kroger	Insurance and copay assistance		Therapy specific clinical teams, Limited distribution drug access Disease state education, Outcomes management	Guaynabo, PR; Cleveland, TN; Garden Grove, CA; Irvine, CA; Lake Mary, FL; Los Angeles, CA; Harvey, LA; Orlando, FL; Vicksburg, MS	Orkambi, Kalydeco, Ibrance, Inlyta, Xalkori, Bosulif, Sutent, Tarceva, REVLIMID, Iclusig, Sylatron, Intron A, Cayston, Humira	Subsidiary	Kroger Specialty Pharmacy	550 Technology Park	Florida
768	http://www.biofusion.com	Torrance	CA	90501	--place holder	Immunology		James Markis		Kroger						Subsidiary	Biofusion	19110 Van Ness Ave. 	California
769	http://www.thenewave.com/go/langley-park-care-pharmacy	Takoma Park	MD	20912	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis		Merlyn Crandon-Enyi		CARE Pharmacies	Counseling and education					Member	Langley Park Pharmacy	7676 New Hampshire Avenue, Suite 104	Maryland
770	https://www.emkreative-project.com/	Laurel	MD	20707	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis		Ali Thakkar		CARE Pharmacies	Counseling and education					Member	Laurel Main Street Pharmacy	667 Main Street	Maryland
790	http://www.mayoclinic.org	Rochester	MN	55905	--place holder	Hemophilia, Growth hormone, Hepatitis, Immunology, IBD, Oncology, Pulmonology, Transplantation, Osteoporosis, Psoriasis, Rheumatoid Arthritis		Andrea Swanson	ACHC	Mayo Clinic	Coordination of billing and claims					Subsidiary	Mayo Clinic Specialty Pharmacy	200 First St. S.W.	Minnesota
771	http://www.ldirx.com	Creve Coeur	MO	63141	--place holder	HIV, Asthma, Oncology, Cystic Fibrosis, DVT, Gaucher's Disease, Growth Hormone, Hemophilia, Hepatitis C, Hunter's Syndrome, Fertility, Multiple Sclerosis, Osteoporosis, Psoriasis, Psoriatic arthritis, RSV, Rheumatoid arthritis, Transplantation		Deanna Clinard		Diplomat	Education and support, Follow-up and monitoring	Prior Authorization	Medication adherence assessment and support			Subsidiary	LDI Specialty Pharmacy	701 Emerson Road, Suite 301 	Missouri
772	http://www.legacyrxpharmacy.com	Orlando	FL	32822	--place holder	Dermatology, Pain management				Independent	Delivery					Private	LegacyRx	6435 Hazeltine National Drive, Suite 140	Florida
773	http://www.leroyrx.com	Bronx	NY	10467	--place holder	Rheumatoid Arthritis, Oncology, Crohn's Disease, Diabetes, Hepatitis, HIV, Multiple Sclerosis, Osteoporosis, Psoriasis		Jung Soo Kim		Independent	Co-pay assistance		Adherence, Prior Authorization			Private	LeMed Pharmacy	159 E Gun Hill Rd	New York
774	http://www.ecu.edu/cs-dhs/ecuphysicians	Greenville	NC	27834	--place holder	Oncology		Todd Jackson	URAC	East Carolina University	Counseling and education, Monitoring drug therapy and interactions, Copay insurance					Subsidiary	Leo Jenkins Cancer Center Pharmacy	600 Moye Boulevard	North Carolina
775	http://www.leroyrx.com/pharmacy-specialty	Bronx	NY	10467	--place holder	Arthritis, Rheumatoid arthritis, Oncology, Crohn's Disease, Diabetes, Hepatitis, HIV, Multiple Sclerosis, Osteoporosis, Psoriasis		Rushabh Shah	URAC	Independent						Private	Leroy Pharmacy	314 East 204th Street	New York
776	http://www.lifespan.org/pharmacy/	Providence	RI	2903	--place holder	Oncology, Multiple Sclerosis, Rheumatoid Arthritis, IBD, Hepatitis C		Christine Berard-Collins	URAC	LifeSpan	Refills and delivery					Subsidiary	Lifespan Pharmacy	167 Point Street	Rhode Island
777	http://www.lindencare.com	Syosset	NY	11791	--place holder	Pain management		Marc Weiner	URAC	Independent	Patient and financial assistance, Customized medication packaging, Prior authorization, Refills, Counseling, Education and compliance management, Pharmaceutical assistance programs		Product distribution and specialized handling, Data reporting, REMS support, Patient and physician education, Product launch and commercialization support			Private	Linden Care LLC	123 Eileen Way	New York
778	http://www.linsonpharmacy.com/	Fargo	ND	58103	--place holder			Allison Hursman		Independent	MTM and counseling, Delivery					Private	Linson Pharmacy	3175 25th Street South	North Dakota
779	http://medical-center.lomalindahealth.org/our-services/pharmacy/medical-center	Loma Linda	CA	92354	--place holder	Crohn's Disease, Psoriasis, Rheumatoid arthritis, Psoriatic Arthritis, Oncology, Growth Hormone, Hemophilia, Hepatitis C, HIV, Fertility, Multiple Sclerosis, Neurology, Transplantation		Paul Norris		Loma Linda University Medical Center	Counseling and education					Subsidiary	Loma Linda University Medical Center	11234 Anderson Street, Room 2301	California
780	http://www.longsrx.com	Lexington	SC	29072	--place holder	Oncology, Crohn's Disease, Cystic Fibrosis, Hemophilia, Hepatitis, HIV, Multiple Sclerosis, Psoriasis, Rheumatoid arthritis, Ulcerative colitis		Kenneth Long	URAC, ACHC	Long's Drugs	Columbia, SC					Subsidiary	Long's Specialty Pharmacy	1216 W Main St # D	South Carolina
781	http://www.lovelace.com	Albuquerque	NM	87102	--place holder	Oncology, Crohn's Disease, Cystic Fibrosis, Hemophilia, Hepatitis, HIV, Multiple Sclerosis, Psoriasis, Rheumatoid arthritis, Ulcerative colitis		Brad Trom		Lovelace Health System	Delivery, Pharmacist 24/7			Albuquerque, NM (9); Rio Bravo, NM; Rio Rancho, NM; Santa Fe, NM		Subsidiary	Lovelace Specialty Pharmacy	500 Walter St NE	New Mexico
782	https://ololrmc.com/pages/all-care-and-services/lsu-health-baton-rouge/lsu-health-br-.aspx	Baton Rouge	LA	70808	--place holder	HIV, Hepatitis C, Bleeding Disorders		Pam Nogueira	URAC	LSU Health Baton Rouge	Counseling and education, Medication therapy management					Subsidiary	LSU Health Baton Rouge MidCity Pharmacy	1401 North Foster Drive	Louisiana
783	https://www.lumicera.com/	Madison	WI	53713	--place holder	Growth Hormone, Hepatitis C, Multiple Sclerosis, Rheumatoid Arthritis, Bleeding Disorders, Immunology, Crohn's Disease, Renal Disease, Cystic Fibrosis, Enzyme Deficiencies, Hemophilia, HIV, Fertility, Oncology, Osteoarthritis, Osteoporosis, Psoriasis, Psoriatic Arthritis, PAH, Transplantation		Tony Wood	URAC	Independent	Delivery, financial assistance	Integrated patient care management, Consultation, Administrative support	Injection training, Adherence program, Targeted pilot programs, Product launch support, Clinical trial assistance, Reporting capabilities, Customized packaging programs			Navitus Health Services	Lumicera Health Services	2601 West Beltline Highway, Suite 302	Wisconsin
784	https://www1.magellanrx.com/magellan-rx	Orlando	FL	32812	--place holder	Bleeding Disorders, Oncology, Crohn's Disease, Cystic Fibrosis, Anemia, Growth Hormone, Hemophilia, Hepatitis, HIV, Gaucher Disease, Immunology, Fertility, Multiple Sclerosis, Neutropenia, Osteoarthritis, Osteoporosis, Parkinson's, PAH, RSV		Eddie Wong	URAC	Magellan Health		Prior authorizations			Tarceva, REVLIMID, Humira, Hemlimbra	Subsidiary	Magellan Rx Pharmacy	6870 Shadowridge Dr, Ste 111	Florida
785		Sayreville	NJ	08872	--place holder	Hepatitis C, HIV, Multiple Sclerosis, Oncology, Psteoporosis, Psoriasis, Rheumatoid Arthritis		Anup Borawala		Independent						Private	Main Street Specialty Pharmacy	881 Main Street	New Jersey
786	http://www.mandelsclinicalpharmacy.com 	Somerset	NJ	8873	--place holder	Fertility		Terry Malanda	URAC, ACHC	Independent	Counseling and education, Financial assistance, Pharmacist 24/7					Private	Mandell's Clinical Pharmacy	7 Cedar Grove Lane #24	New Jersey
787	https://www.marshfieldclinic.org/services/pharmacy	Marshfield	WI	54449	--place holder	Arthritis, Bleeding Disorders, Oncology, Crohn's Disease, Cystic Fibrosis, Growth Hormone, Hemophilia, Multiple Sclerosis, Transplantation, Osteoporosis, Psoriasis, PAH, Hepatitis		Sarah Rall	URAC	Marshfield Clinic	Insurance benefit coordination, Payment assistance, Medication adherence, Education and support					Subsidiary	Marshfield Clinic Specialty Pharmacy	603 South Central Avenue	Wisconsin
788	http://www.mastdrug.com	Williamston	NC	27892	--place holder	Hepatitis C, Multiple Sclerosis, Rheumatoid Arthritis		Bill Mast		Independent	Delivery, Counseling and education					Private	Mast Drug Specialty Pharmacy	307 W Boulevard St, Apt A	North Carolina
789	http://www.maxor.com	Amarillo	TX	79101	--place holder	Crohn's Disease, Hepatitis C, Osteoarthritis, Osteoporosis, Rheumatoid Arthritis, Dermatology, Ankylosing Spondylitis, Oncology, Enzyme Deficiencies, Growth Hormone, Hemophilia, HIV, Fertility, Multiple Sclerosis, Transplantation, Osteoarthritis, Psoriasis, RSV		Eric Wan	ACHC	Maxor	Counseling and education, Refills and delivery, Insurance billing and assistance	 monitoring	Customized data reporting		Orkambi, Kalydeco, Cayston, Hemlimbra	Subsidiary	Maxor Specialty	216 S. Polk Street	Texas
791	http://mdrusa.com	Encino	CA	91316	--place holder	Fertility		Kevin Carden		Independent	Financing, Counseling and education			Los Angeles, CA		Private	MDR Pharmaceutical Care	17071 Ventura Boulevard	California
792	http://medcenterspecialtypharmacy.com/	Charleston	WV	25304	--place holder	Fertility, Hepatitis, Crohn's Disease, HIV, Multiple Sclerosis, Oncology, Rheumatoid Arthritis, Psoriasis, Anemia, Behavioral Health, Hemophilia, Bleeding Disorders		Nicholas Karalis	URAC, ACHC	Elwyn Specialty Group	Disease therapy management, Delivery, Financial assistance, Prior authorization					Subsidiary	Med Center Specialty Pharmacy	3100 MacCorkle Avenue S.E.	West Virginia
793	http://www.medcartpharmacy.com	Livonia	MI	48150	--place holder	Crohn's Disease, HIV, Hepatitis, Fertility, Growth Hormone, Multiple Sclerosis, Oncology, Psoriasis, Rheumatoid Arthritis		Eddie Abueida	URAC	Albertson's	Delivery, 24/7 customer service, Counseling and education	Compliance and medication adherence, Billing services	Customized reporting, Inventory management support			Subsidiary	MedCart Specialty Pharmacy	32131 Industrial Road	Michigan
794	http://www.medexbiocare.com	Memphis	TN	38133	--place holder	Hemophilia, von Willebrand Disease, Bleeding Disorders		Terry Peck		Matrix Health Group	Reimbursement Specialists, 24/7 pharmacists, Insurance assistance, Education materials		Patient Assistance Programs			Subsidiary	Medex Biocare Pharmacy	8024 Stage Hills Boulevard, Suite 107	Tennessee
795	http://MedExpressPharmacy.com	Salisbury	NC	28145	--place holder	HIV, Hepatitis C, Behavioral Health, Oncology, Rheumatoid Arthritis, Transplantation		Jerry Purcell		Avita Pharmacy	Copay assistance, Refill reminders, 24/7 pharmacist	Prior authorization	Limited distribution drugs			Subsidiary	MedExpress Pharmacy, Ltd.	P.O. Box 1666	North Carolina
796	http://mcprx.com	San Diego	CA	92102	--place holder	Transplantation, Growth Hormone, Behavioral Health, Hepatitis, Oncology, HIV, Multiple Sclerosis, Rheumatoid Arthritis, HRT		George Awad		Independent	Delivery, Prior Authorization			Chula Vista, CA (3); San Diego, CA (7)		Private	Medical Center Pharmacy	610 Gateway Center Way, Suite G	California
797	http://medicascripts.com/	Tampa	FL	33613	--place holder	Crohn's Disease, Hepatitis, Hepatitis C, Dermatology, HIV, Hypercholesterolemia, Neurology, Oncology, Ophthalmology, Orthopedic Surgery, Osteoarthritis, Osteoporosis, Pulmonology, Rheumatoid Arthritis, Urology, Transplantation		Guy English		Independent	Counseling and education, Delivery, 24x7 clinical support	Prior Authorization, Copay Reimbursement, Compliance reporting				Private	MedicaScripts Specialty Pharmacy	15511 N. Florida Ave.	Florida
798	http://www.medicorx.com	Van Nuys	CA	91406	--place holder	Oncology, IVIG, Rheumatoid Arthritis, Multiple Sclerosis, Hepatitis C, Crohn's Disease, Osteoporosis, Psoriasis, HIV		Vladimir Lenchitsky	URAC, ACHC	Independent	Adherence/Compliance, Clinical and Education materials, 24/7 clinical pharmacist	Data collection and reporting, Prior Authorization, Reporting and analysis	Data packages, Manufacturer program assistance, REMS, Clinical program participation			Private	MedicoRx Specialty Pharmacy	7039 Valjean Ave.	California
799	http://www.medilinkrxcare.com/	Voorhees Township	NJ	08043	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis		Gus Tzaferos		CARE Pharmacies	Counseling and education					Member	Medilink RxCare	Eagle Plaza, 709 County Rte 561	New Jersey
800	http://www.medprorx.com	Raleigh	NC	27615	--place holder	Immunology				Diplomat	Counseling and education, Refills, Financial assistance, Benefit coordination					Subsidiary	MedPro Rx, Inc.	140 Northway Court	North Carolina
801	http://www.medquickrx.com/	San Gabriel	CA	91776	--place holder	HIV, Hepatitis, Multiple Sclerosis, Rheumatoid Arthritis, Fibromy algia, Osteoporosis, Oncology, CODP, ITP, Hemophilia, Behavioral Health		Poch Blanco	URAC	Independent	Counseling and education, Refills, Financial assistance, Benefit coordination	Patient centered management, Clinical counseling	HUB Program management, Data management and reporting, Patient assistance programs			Private	MedQuick Pharmacy	546 West Las Tunas Drive	California
802	http://medwinsspecialtypharmacy.com/	Saginaw	MI	48607	--place holder	HIV, Hepatitis C		Khaja Mohammed	URAC	Independent	Counseling and education, refills, transfers					Private	Medwins Specialty Pharmacy	301 East Genesee Avenue, Suite 100	Michigan
803	http://aureushealthservices.com/	Pittsburgh	PA	15205	--place holder	HCV, HIV, Crohn's Disease, Rheumatoid Arthritis, Psoriasis, Osteoarthritis, Multiple Sclerosis, Transplantation		Paul Valenti	URAC, ACHC	Meijer	Referral and Enrollment, Benefits and Reimbursement		Custom-packed pill boxes, Reporting, Adherence intervention, Compliance, Prior Authorization			Subsidiary	Meijer Specialty Pharmacy (Aureus Pharmacy)	305 Merchant Lane	Pennsylvania
804	https://www.memorialcare.org/services/pharmacy	Long Beach	CA	90806	--place holder	Crohn's Disease, Psoriasis, Rheumatoid arthritis, Psoriatic Arthritis, Oncology, Growth Hormone, Hemophilia, Hepatitis C, HIV, Fertility, Multiple Sclerosis, Neurology, Transplantation		Brian Stuckman		MemorialCare Health System						Subsidiary	MemorialCare Health System Specialty Pharmacy	2801 Atlantic Avenue	California
805	http://www.mercy-healthpartners.org/hackley-pharmacy	Muskegon	MI	49442	--place holder	Hepatitis, HIV		Scott Butler		Mercy Health	Counseling and education	Medication therapy management				Subsidiary	Mercy Health Pharmacy Hackley	1675 Leahy Street #11	Michigan
806	https://www.mercy.net/practice/mercy-specialty-pharmacy-st-louis	St. Louis	MO	63141	--place holder	Hematology, Oncology		Jonathan Lakamp		Mercy Health	Counseling and education, Insurance and financial assistance, Delivery		Manufacturers’ co-pay cards			Subsidiary	Mercy Specialty Pharmacy-St. Louis	607 S. New Ballas Road	Missouri
807	https://carepharmacies.com/blog/location/metro-care-pharmacy/	Washington	DC	20011	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis		Sanjeev Bhalla		CARE Pharmacies	Counseling and education					Member	Metro CARE Pharmacy	6323 Georgia Ave NW	District of Columbia
808	http://www.metrodrugs.com	New York	NY	10065	--place holder	Fertility		Joe Tawil	URAC	Independent	24/7 support, Mail delivery					Private	Metro Drugs	931 Lexington Ave	New York
809	https://www.metrohealth.org/specialty-pharmacy	Valley View	OH	44125	--place holder	Hepatitis C, HIV		Jay Kuhn		The MetroHealth System						Subsidiary	MetroHealth Specialty Pharmacy	9885 Rockside Road	Ohio
810	http://metrorxsp.com/	New York	NY	10029	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis		Ali Mohammed		Independent						Private	MetroRx Specialty Pharmacy	1976 2nd Avenue	New York
834	http://www.pti-nps.com/nps	Boys Town	NE	68010	--place holder			Kevin Hartman	URAC, ACHC	Independent	Delivery			Nashville, TN; Paducah, KY		Private	NPS Pharmacy	PO Box 407	Nebraska
811	https://www.millerdrug.com/	Bangor 	ME	04401	--place holder	Asthma, Bleeding Disorders, Crohn's Disease, Cystic Fibrosis, Growth Hormone, Hepatitis, Immunology, Multiple Sclerosis, Oncology, Psoriasis, PAH, Respiratory Disorders, Rheumatoid Arthritis, Transplantation				Independent	Counseling and education, Delivery, Refills, 24x7 clinical support, Financial assistance investigation	Prior authorization, Medication adherence	Medication appropriateness, Compliance and adherence			Private	Miller Drug LLC	210 State Street	Maine
812	www.mnoncology.com	St. Paul	MN	55114	--place holder	Oncology		Jan Merriman		Independent						Private	Minnesota Oncology	2550 University Avenue West, Suite 110-N	Minnesota
813					--place holder										Hemlimbra		Mississippi Center for Advanced Medicine		
814	http://www.mmspharmacy.com	Nashville	TN	37228	--place holder	Renal disease, Oncology		Tom Hermann		Cardinal Health	Patient education, Adherence programs, Refill reminders and shipping, Insurance assistance	Benefits coordination				Subsidiary	MMS Solutions 	202 Cumberland Bend 	Tennessee
815	http://www.modernhealthinc.com 	Monrovia	CA	91016	--place holder	IVIG, HIV, Cystic Fibrosis, Transplantation, Hepatitis C, Rheumatoid Arthritis, Dermatology		Richard Nguyen		Kroger						Subsidiary	ModernHEALTH Specialty Pharmacy	110 E Huntington Drive	California
816	https://moffitt.org/tests-treatments/treatments/pharmacy/	Tampa	FL	33612	--place holder	Oncology, Hematology		Dave Craig		Moffit Cancer Center						Subsidiary	Moffit Cancer Center Pharmacy	12902 USF Magnolia Drive #1170	Florida
817	http://www.morgancare.com/	Washington	DC	20007	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis		Michael Wysong		CARE Pharmacies	Counseling and education					Member	Morgan CARE Pharmacy	3001 P Street, N.W.	District of Columbia
818		Washington	DC	20011	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis				CARE Pharmacies	Counseling and education					Member	Morningstar Specialty Pharmacy	833 Kennedy St NW	District of Columbia
819	https://carepharmacies.com/blog/location/mount-pleasant-care-pharmacy/	Washington	DC	20010	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis				CARE Pharmacies	Counseling and education					Member	Mount Pleasant CARE Pharmacy	3169 Mt Pleasant St NW	District of Columbia
820	http://www.nallepharmacy.biz	Charlotte	NC	28207	--place holder	Fertility		Tommy Dagemhart		Independent	Counseling and education					Private	Nalle Pharmacy	1918 Randolph Road	North Carolina
821	https://www.nebraskamed.com/pharmacy	Omaha	NE	68105	--place holder	Crohn's Disease, Psoriasis, Rheumatoid arthritis, Psoriatic Arthritis, Oncology, Growth Hormone, Hemophilia, Hepatitis C, HIV, Fertility, Multiple Sclerosis, Neurology, Transplantation		Gale Dunahoo	URAC	Nebraska Medicine	Counseling and education, Financial assistance help, Delivery	Prior authorization				Subsidiary	Nebraska Medicine Durham Outpatient Center	4400 Emile Street	Nebraska
822	www.newenglandcancerspecialists.org	Scarborough	ME	04074	--place holder	Oncology		Eric Dallara 		Independent						Private	New England Cancer Specialists	100 Campus Drive, Suite 108	Maine
823	https://carepharmacies.com/blog/location/new-era-care-pharmacy/	Capitol Heights	MD	20743	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis		Delina Nwachukwu		CARE Pharmacies	Counseling and education					Member	New Era Care Pharmacy	1436 Addison Rd S	Maryland
824	http://www.nhmedsupply.com/	Washington	DC	20011	--place holder	HIV, Oncology, Pain Management, Transplantation		Frank Cassidy		CARE Pharmacies	Counseling and education, Delivery	Billing assistance, Compliance reports				Member	New Hampshire CARE Pharmacy	5001 New Hampshire Ave NW, 	District of Columbia
825	http://www.nhoh.com	Hooksett	NH	03106	--place holder	Oncology		A. Collier Smyth 		Independent						Private	New Hampshire Oncology-Hematology PA	200 Technology Drive	New Hampshire
826	http://www.newlondonspecialtypharmacy.com/	New York	NY	10011	--place holder	Transplantation, HIV/AIDS, Hepatitis C, Rheumatoid Arthritis, Oncology, Multiple Sclerosis, Psoriasis		John Fazio	URAC, ACHC	Independent	Financial assistance	Compliance management, Centralized technology, Authorization process, Dispensing support	Assistance with patient compliance, interactions and product utilization			Private	New London Specialty Pharmacy	246 8th Avenue, 2nd floor suite A	New York
827	www.newyorkoncology.com	Albany	NY	12206	--place holder	Oncology		Nancy Egerton 		Independent						Private	New York Oncology Hematology	400 Patroon Creek Blvd., Suite 1	New York
828	http://www.kinneydrugs.com	Gouverneur	NY	13642	--place holder	Asthma, Bleeding Disorders, Oncology, Cystic Fibrosis, Growth Hormone, Hepatitis, Hereditary Angioedema, HIV, Fertility, IBD, Multiple Sclerosis, Transplantation, Psoriasis, Rheumatoid Arthritis		Steve McCoy	URAC, ACHC	KPH Healthcare Services	Care teams, Clinical management programs, Benefits and co-pay assistance, Delivery and refills	Prior authorization, Customized clinical pathways, Customized reporting	 Customized reporting, Training/Advocacy Room, Education materials to support therapeutic initiatives, Delivery		Hemlimbra	Subsidiary	Noble Health Associates LLC	520 East Main Street	New York
829	http://www.nmhs.net/outpatient_infusion.php	Tupelo	MS	38801	--place holder	Hematology, Oncology, IVIG		Wes Pitts		North Mississippi Medical Center						Subsidiary	North Mississippi Medical Center Specialty Pharmacy	990 S. Madison St., Suite 2	Mississippi
830	https://carepharmacies.com/blog/location/northgate-care-pharmacy/	Waldorf	MD	20602	--place holder	HIV, Oncology, Pain Management, Transplantation		Vincent Ippolito		CARE Pharmacies	Counseling and education, Delivery					Member	Northgate Pharmacy	3973 St. Charles Parkway	Maryland
831	https://www.nm.org	Chicago	IL	60611	--place holder	HIV, Oncology, Transplantation		John Keller		Northwestern Memorial Hospital	Patient education, Benefits investigation, Financial assistance					Subsidiary	Northwestern Medicine Specialty Pharmacy	251 East Huron Street	Illinois
832	https://nortonhealthcare.com/pages/nhc-pharmacy.aspx	Louisville	KY	40207	--place holder	Oncology, Crohn's Disease, Cystic Fibrosis, Hemophilia, Hepatitis, HIV, Multiple Sclerosis, Psoriasis, Rheumatoid arthritis, Ulcerative colitis		William Allen	URAC	Norton Healthcare	Counseling and education					Subsidiary	Norton Women's & Children's Hospital	4001 Dutchmans Lane	Kentucky
833	http://www.novanthealth.org	Winston-Salem	NC	27103	--place holder	Dermatology, Gastroenterology, Oncology, Pain Management, Rheumatoid Arthritis		Andrew Wright	URAC	Novant Health	Counseling and education, Disease state management			Winston-Salem, NC		Subsidiary	Novant Health Pharmacy Services	2085 Frontis Plaza Blvd.	North Carolina
835	http://www.nufactor.com/	Temecula	CA	92591	--place holder	IVIG, Hemophilia, von Willebrand disease, Bleeding Disorders, Oncology		Chris Ground	URAC/JCAHO	FFF Enterprises	Reimbursement support, Infusion specialists, On-call pharmacists	Validation of services, Assessment of site-of-care, Condition-specific therapy management, Automation of authorizations, Claim coordination, Reporting and assessment of utilization and outcomes			Hemlimbra	Subsidiary	NuFACTOR Specialty Pharmacy	41093 County Center Drive\nSuite B	California
836	http://www.oceanbreezehealthcare.com	New York	NY	10305	--place holder	Growth Hormone, Fertility, IBD, Osteoporosis, Multiple Sclerosis, Acromegaly		Dominick Spada 		Independent	Counseling and education, 24x7 support, Refills and delivery	Formulary management, MTM, Data Reporting	Patient Assistance Programs, Interim Drug Programs, Reimbursement services and solutions, Data aggregation and analysis			Private	Ocean Breeze Healthcare	235 Dongan Hills Avenue, Suite 2B	New York
837	https://www.ochsner.org/services/specialty-pharmacy	New Orleans	LA	70121	--place holder	Oncology, Transplantation, Crohn's Disease, Ulcerative Colitis, Growth Hormone, Hepatitis C, HIV, Multiple Sclerosis, Psoriasis, Rheumatoid Arthritis, Fertility, Anticoagulation, Ankylosing Spondylitis, Neutropenia, Osteoporosis, Parkinson's Disease, Pulmonology		Christi Parson	URAC	Ochsner Health System	Patient Assistance Program, Counseling and education, Clinical pharmacists 24x7, Proactive refills and shipping					Subsidiary	Ochsner Specialty Pharmacy	1405 Jefferson Hwy., Ste. A	Louisiana
838	https://cancer.osu.edu/cancer-specialties/cancer-care-and-treatment/clinical-services/pharmacy	Columbus	OH	43210	--place holder	Oncology, Hepatitis C		Robert Weber		The Ohio State University Comprehensive Cancer Center	Counseling and education					Subsidiary	Ohio State University Outpatient Pharmacy	460 W. 10th Ave., L012	Ohio
839	http://benzerspecialtypharmacy.com/	Tampa	FL	33610	--place holder	Hepatitis C, Multiple Sclerosis, HIV, Rheumatoid Arthritis, Oncology, Psoriasis, Dermatology		Alpesh Patel		Benzer Specialty Pharmacy						Subsidiary	OHM Pharmacy Services	5980 Breckenridge Hwy	Florida
840	http://www.onco360.com	New York	NY	10022	--place holder	Oncology		Paul Jardina	URAC, ACHC, JCAHO	Independent	Counseling and education, Financial assistance, Refill reminders, 24/7 support	Total Protocol Management, Patient advocates	Patient assistance program support, Limited distribution drugs, Clinical program support, Reporting capabilities	Louisville, KY; Great Neck, NY; Buffalo, NY; Waltham, MA	Adcetris, Avastin, Bosulif, Cerezyme, Cotellic, Erivedge, Farydak, Gazyva, Herceptin, Hycamtin, Ibrance, Imbruvica, Inlyta, Intron A, Kadcyla, Keytruda, Kisqali, Lonsurf, Mekinist, Mozobil, Nerlynx, Nexavar, Ninlaro, Nplate, Promacta, Revlimid, Rituxan, Soliris, Stivarga, Sutent, Sylatron, Tafinlar, Tarceva, Tecentriq, Thalomid, Tykerb, Vancexta, Votrient, Xalkori, Yervoy, Zaltrap, Zelboraf, Zydelig, Zykadia, Zytiga, VENCLEXTA	Private	Onco360	410 Park Avenue, Suite 820	New York
841	http://www.oncologyconsultants.com	Houston	TX	77074	--place holder	Oncology		Yen Nguyen 		Independent						Private	Oncology Consultants	7737 Southwest Fwy #575	Texas
842	http://www.ohcmail.com	Cincinnati	OH	45242	--place holder	Oncology, Hematology, Bleeding disorders, Hemophilia		Brian Bourbeau		OHC	Counseling and assistance, Delivery, Insurance and financial assistance, Co-pay assistance					Subsidiary	Oncology Hematology Care (OHC) Pharmacy	4350 Malsbary Road	Ohio
843	http://opharmagroup.com/	Delray Beach	FL	33445	--place holder	Oncology		Edelmira Lara	URAC	Independent						Private	Oncology Pharmacy Group	4733 W Atlantic Ave, Suite 2	Florida
844	http://www.oncologyplus.com	Brandon	FL	33511	--place holder	Oncology		Zach Scholl		Avella Specialty Pharmacy						Subsidiary	Oncology Plus	1072 E. Brandon Blvd	Florida
845	http://www.mycareadvantage.com	Ft. Worth	TX	76177	--place holder	Oncology			URAC	McKesson Specialty Health	Insurance verification and co-pay assistance, 24x7 pharmacist support	Prior authorization support	Patient assistance programs		Jakafi, Ibrance, Inlyta, Xalkori, Bosulif, Sutent, Tarceva, REVLIMID	Subsidiary	OncologyRx Care Advantage 	13501 Park Vista Blvd., Suite 150	Texas
846	http://www.oncosourcerx.com	Columbia	MD	21046	--place holder	Oncology			URAC, ACHC, JCAHO	Cardinal Health Specialty Pharmacy					Xolair, ColciGel, Tykerb, Votrient, Xalkori, Xtandi, Zelboraf, Intron A, Sylatron, Erividge, Hycamtin, Inylta, Jakafi, Mekinist, Mugard, Pomalyst, Revlimid, Stivargo, Tafinlar, Otezia, Actemra, Otelza, Ibrance, Inlyta, Xalkori, Bosulif, Sutent, Tarceva	Subsidiary	OncoSource Rx	7172 Columbia Gateway Drive	Maryland
847					--place holder										Hemlimbra		OneSource Home Care		
848	http://www.optimedspecialtyrx.com/	Kalamazoo	MI	49009	--place holder	Crohn's Disease, Ulcerative Colitis, Hepatitis C, Immunology, Psoriasis, Rheumatoid Arthritis		Andrew Reeves	URAC, ACHC, JCAHO	Independent	Financial Support & Advocacy Services, Refill Reminders, Shipping, Delivery	Customizable Patient-Centric Management Programs, Prior Authorizations	Medication & Disease Education and Training		Cosentyx	Private	OptiMed Specialty Pharmacy	6480 Technology Avenue, Suite A	Michigan
849	http://optioncare.com/	Buffalo Grove	IL	60089	--place holder	Growth Hormone, RSV, Hepatitis C, Multiple Sclerosis, Hemophilia, Immunology, Oncology		Paul Mastrapa	URAC, ACHC	Walgreens	Counseling and education	Clinical monitoring and reporting		Los Angeles, CA; Panama City, FL	Radicava, Cuvitru, Coagadex, Hemlimbra	Subsidiary	Option Care Enterprises	485 Half Day Road, Suite 300	Illinois
850	http://www.ohsu.edu/xd/health/services/pharmacy	Portland	OR	97239	--place holder	Fertility, Oncology, Cystic Fibrosis, Hepatitis C, HIV, Multiple Sclerosis, Psoriatic Arthritis, Rheumatoid Arthritis, Spondyloarthritis		Amy Szczulowski	URAC	Oregon Health & Science University	Refill reminders, Home delivery, 24x7 pharmacist, Insurance benefit review, Prior authorization, Financial assistance					Subsidiary	Oregon Health & Science University Specialty Pharmacy	3181 S.W. Sam Jackson Park Rd.	Oregon
851	http://www.orsinihealthcare.com	Elk Grove Village	IL	60007	--place holder	Renal disease, Crohn's disease, Cystic fibrosis, Enzyme Replacement therapy, HAE, Hemophilia, Hepatitis, HIV, Fertility, IVIG, Multiple Sclerosis, Oncology, Psoriasis, RSV, Rheumatoid arthritis, Transplantation		Tony Orsini	URAC, JCAHO	Independent	Insurance assistance, 24/7 support, Delivery		Customized packaging programs, Targeted pilot programs, Product launch support and pull through, Drug trial assistance, Full reporting capabilities			Private	Orsini Healthcare	1111 Nicholas Boulevard	Illinois
852	http://osohomecare.com/	Irvine	CA	92614	--place holder	IVIG, Factor Therapy, Infusion, Transplantation		Randy Bohart	ACHC	Independent					Hemlimbra	Private	Oso Home Care	17175 Gillette Ave	California
853	http://owlrexall.com	Covina	CA	91722	--place holder	Pain management, IVIG, Hemophilia, Bleeding disorders, Growth Hormone		Mike Gindi	JCAHO	Independent						Private	Owl Specialty Pharmacy	401 N. Vincent Ave	California
854	pacificcancercare.com	Monterey	CA	93940	--place holder	Oncology		Roger Shiffman		Independent						Private	Pacific Cancer Center	5 Harris Court, Building T, Suite 201	California
855	http://www.pacshoresoncology.com	Glendale	CA	91204	--place holder	Oncology		Scott Thompson 		Independent						Private	Pacific Shores Medical Group	222 W. Eulalia Street, #100-B	California
856	https://carepharmacies.com/blog/location/palisades-care-pharmacy/	Washington	DC	20016	--place holder	HIV, Oncology, Pain Management, Transplantation		Jessica Karam		CARE Pharmacies	Counseling and education, Delivery					Member	Palisades Pharmacy	5185 MacArthur Blvd, NW	District of Columbia
857	http://www.pantherspecialty.com	New Brighton	PA	15066	--place holder	Bleeding disorders, Crohn's Disease, Women's Health, Growth Hormone, Hepatitis C, HIV, Multiple Sclerosis, Oncology, Rheumatoid Arthritis, Transplantation		Gordon Vanscoy	URAC, ACHC, JCAHO,CPPA	Independent	Patient assistance support, Benefits investigation, 24/7 support and delivery, 	Adherence/refill reminders, Counseling and education	Patient assistance support, Adherence, Product management, Robust data reporting		Crixivan, Tikosyn, Folan, Zelboraf, Cerezyme	Private	PantherRx Specialty Pharmacy	600 5th Street	Pennsylvania
858	http://paragonhealthcare.com/	Dallas	TX	75248	--place holder	Hemophilia, Immunology		Richard Allen	URAC	Independent	Counseling and education				Hemlimbra	Private	Paragon Hemophilia Solutions	17111 Preston Road 100	Texas
859	http://paramountsprx.com/hospital-programs/	Melville	NY	11747	--place holder	HIV, Hepatitis C, Oncology, Inflammatory disease		Al DosSantos		Independent	Counseling and education, Insurance authorization, Delivery	Therapy-specific medication management		Albany, NY		Private	Paramount Specialty Pharmacy	1860 Walt Whitman Road #700	New York
860	http://www.tnoncology.com/park-pharmacy	Nashville	TN	37203	--place holder	Oncology, Hematology		Stacey McCullough	URAC, ACHC, JCAHO	Tennessee Oncology	Prior Authorization, Financial assistance, Delivery, 24x7 support					Subsidiary	Park Pharmacy	300 20th Avenue North, Suite 301	Tennessee
861	https://parkwayrx.com	Howell	NJ	07731	--place holder	Rheumatoid arthritis, Hepatitis, Crohn's Disease, Lupus, Oncology, Fertility, Bone disease, Multiple Sclerosis, Growth Hormone, Bleeding disorders, Immunology		Alan Bleznick	URAC, ACHC, JCAHO	Independent	Insurance and billing, Financial assistance, Delivery, Compliance monitoring					Private	Parkway Pharmacy	3502 U.S. Highway 9	New Jersey
862	http://www.pathstonehealth.com/	Jacksonville	FL	32254	--place holder	HIV, Hepatitis C, Rheumatoid Arthritis		M. Sandlin Grimm		Winn-Dixie Stores	Delivery and refills, Copay and financial assistance	Patient care advocates, Medication delivery management, Access to medication records	REMS support, Clinical management, Compliance and adherence, Reporting			Subsidiary	Pathstone Health Services	5244 Edgewood Court	Florida
863	https://www.pennmedicine.org	Philadelphia	PA	19107	--place holder	Oncology, HIV, Hepatitis C, Multiple Sclerosis, Ulcerative colitis, Crohn's Disease, Transplantation, Rheumatoid arthritis, Auto-immune disorders, Psoriasis, Ankylosing Spondylitis		Suzanne Brown		Penn Medicine	Counseling and education					Subsidiary	Penn Specialty Pharmacy	800 Spruce Street	Pennsylvania
864	http://hmc.pennstatehealth.org/pharmacy/patient-care/specialty-pharmacy	Hershey	PA	17033	--place holder	Rheumatoid Arthritis, Hepatitis, Psoriasis, Oncology		Jill Rebuck		Penn State Milton S. Hershey Medical Center	Counseling and education					Subsidiary	Penn State Milton S. Hershey Medical Center Specialty Pharmacy	500 University Drive, PO Box 850 C3608	Pennsylvania
865	http://www.pentechealth.com/	Glen Mills	PA	19342	--place holder	Renal Disease, Infusion, Immunology		Barbara Knightly		Independent						Private	Pentec Health	50 Applied Card Way	Pennsylvania
866					--place holder												PerforMix Specialty Pharmacy		
867	http://www.performrx.com	Philadelphia	PA	19113	--place holder	Ankylosing Spondylitis, Crohn's Disease, Cystic Fibrosis, Multiple Sclerosis, RSV, Rheumatoid Arthritis		Dino Martino	URAC	Perform Rx	Patient support programs, Fulfillment and refill reminders, Adherence programs				Hemlimbra	Subsidiary	PerformSpecialty	200 Stevens Drive	Pennsylvania
868	https://www.pfsprx.com/	Clark	NJ	07066	--place holder	Hepatitis C, HIV, Oncology, Rheumatoid Arthritis, Endocrinology, Dermatology, Gastroenterology, Multiple Sclerosis, Transplantation		Alex Grant		Independent	Counseling and education, Refills and delivery				Cosentyx	Private	PFSP Specialty Pharmacy	210 Westfield Avenue	New Jersey
869	http://pharmacarehawaii.com	Honolulu,	HI	96819	--place holder	Crohn's Disease, Growth Hormone, Hemophilia, Hepatitis, HIV, Fertility, Multiple Sclerosis, Oncology, Psoriasis, Rheumatoid Arthritis		Byron Yoshino		Independent						Private	Pharmacare Hawaii	3375 Koapaka Street, Suite G320	Hawaii
870	http://www.psipharmacy.com	Bogart	GA	30622	--place holder	Dermatology, Cystic Fibrosis, Growth Hormone, Hepatitis C, Crohn's Disease		Conrad Thompson	URAC	Maxor National Pharmacy Services					Cayston, Bethkis, Orkambi, Kalydeco	Subsidiary	Pharmaceutical Specialties, Inc.	150 Cleveland Road, Suite A	Georgia
871	http://www.pharmacyadvantagerx.com	Troy	MI	48083	--place holder	Oncology, Hepatitis, Multiple Sclerosis, Growth Hormone, Fertility, Transplantation, Rheumatoid Arthritis, Psoriasis, Crohn’s Disease 		Daniel Kus	URAC	Independent	Financial Assistance, Prior Authorization assistance, Benefits investigation, Disease specific programs, Delivery	Compliance monitoring	Customized packaging, Drug trial assistance, Therapy management for adherence, Patient counseling and support		Tecfidera, Xolair	Private	Pharmacy Advantage 	735 John R Road, Suite 150	Michigan
872	http://www.pctn.net/	Nolensvile	TN	37135	--place holder	Rheumatoid Arthritis, Oncology, Crohn's Disease, Diabetes, Hepatitis, HIV, Psoriasis, Transplantation		Tim Albonetti	URAC	Independent	Counseling and education, delivery, insurance verification					Private	Pharmacy Care of Tennessee	934 Oldham Drive	Tennessee
873	http://www.kentuckyonehealth.org/pharmacy-about-pharmacy-plus	Louisville	KY	40229	--place holder	Bleeding Disorders, Oncology, Crohn's Disease, Growth Hormone, Hepatitis C, HIV, Multiple Sclerosis, Neutropenia, Rheumatoid Arthritis, RSV, Transplantation		Jeffrey Goldberg	URAC	KentuckyOne Health						Subsidiary	Pharmacy Plus Specialty	5111 Commerce Crossings Drive	Kentucky
874	http://pharmacysolutions.com/	North Chicago	IL	60064	--place holder	Crohn's Disease, Ankylosing Spondylitis, Rheumatoid Arthritis, Psoriatric Arthritis, Ulcerative Colitis, Oncology		Christopher Sprague		Abbvie	Counseling and education, Insurance and coverage support, Financial assistance options				Humira, Lupron Depot, Lupaneta Pack	Subsidiary	Pharmacy Solutions	1400 Sheridan Road	Illinois
875	http://psgrx.com/	Rocky River	OH	44116	--place holder	Crohn's Disease, Fertility, Growth Hormone, Hepatitis, HIV, Infectious disease, Multiple Sclerosis, Oncology, Osteoporosis, Psoriasis, Rheumatoid Arthritis, Transplantation		Dan Seighman	URAC	Independent	24/7 personal consultation, Physician collaboration, Delivery and follow-up, Benefits and financial assistance					Private	Pharmacy Specialty Group	1250 Linda Street	Ohio
876	http://pharmahealthspecialty.com	Fairhaven	MA	02719	--place holder	Behavioral Health, Oncology, Crohn's Disease, Cystic Fibrosis, Hepatitis C, HIV, Multiple Sclerosis, Psoriasis, Rheumatoid Arthritis		Jennifer Torrey	URAC, ACHC	Independent	Delivery, 24/7 pharmacist, Insurance verification, Co-pay and funding assistance, Prior Authorization assistance, Reimbursement counseling, 	Adherence monitoring, Patient and physician education, Clinical intervention, Data analysis and reporting, 				Private	PharmaHealth Specialty	132 Alden Road	Massachusetts
877	http://pharmblue.com/	Warrendale	PA	15086	--place holder	HIV, Behavioral Health, Pain Management, Diabetes		Mike Nelson	URAC, ACHC	Independent	Counseling and education, 24x7 support, Insurance experts	Adherence management	Contolled Rx management, 340B benefits			Private	PharmBlue LLC	40 Penwood Place	Pennsylvania
878	http://www.pharmedquest.com/	Brea	CA	92822	--place holder	HIV, Hepatitis C		Meera Hasolkar		Independent	Counseling and education, Delivery	Prior authorizations		Anaheim, CA; Arleta, CA; City of Commerce, CA; Garden Grove, CA; Huntington Park, CA; Los Angeles, CA (2); Merced, CA; Modesto, CA; North Hollywood, CA; Pico Rivera, CA; Pomona, CA; Santa Ana, CA; West Covina, CA (2); Winetka, CA		Private	PharMedQuest Pharmacy Services	330 E Lambert Rd #100	California
879	https://www.pillpack.com/	Manchester	NH	03101	--place holder	HIV, Hepatitis C, Oncology, Fertility, Multiple Sclerosis, Diabetes, Renal disease, Rheumatoid arthritis		Timothy Parker		CARE Pharmacies	Counseling and education					Member	Pillpack, Inc.	250 Commercial St #2012	New Hampshire
880	http://www.pintopharmacy.com/	Jersey City	NJ	07306	--place holder	Diabetes, Crohn's Disease, Hepatitis, HIV, Multiple Sclerosis, Oncology, Osteoporosis, Psoriasis, Rheumatoid Arthritis, RSV, Fertility, PAH, Pulmonology, Growth Hormone, Hemophilia			URAC (in progress)	Independent	Counseling and education, 24x7 support, Delivery, Disease specific porgrams					Private	Pinto's Specialty Pharmacy	161 Palisade Avenue	New Jersey
881	https://carepharmacies.com/blog/location/plumtree-pharmacy/	Bel Air	MD	21015	--place holder	HIV, Oncology, Pain Management, Transplantation		Kathleen Pellittier		CARE Pharmacies	Counseling and education, Delivery					Member	Plumtree Pharmacy	208 Plumtree Rd Suite A 	Maryland
882	https://praxisrx.com	Tampa	FL	33634	--place holder	Bleeding disorders, Asthma, Crohn's Disease, Cystic fibrosis, Enzyme deficiencies, Gaucher Disease, Growth hormone, Hemophilia, Hepatitis		Bill Bailey		Independent	24/7 Support, Delivery, Financial Support					Private	PraxisRx Specialty Pharmacy	5455 West Waters Avenue, Suite 214	Florida
883					--place holder										Hemlimbra		Premier Infusion Care		
884	http://www.premierkidscare.com	Monroe	GA	30655	--place holder	Growth Hormone		Chella Leicht	ACHC	Independent	Insurance authorization, Counseling and education, Financial assistance					Private	Premier Kids Care	221 Plaza Drive	Georgia
885	http://www.premierpharmacy.com	Valley Village	CA	91601	--place holder	HIV, Oncology, Hemophilia, Hepatitis, Multiple Sclerosis, Rheumatoid Arthritis, PAH, Asthma, Transplantation		Stephen Sanuel	URAC, ACHC	Independent	Patient and Copayment assistance, Treatment advocacy and education, 24/7 consultation and delivery, 					Private	Premier Pharmacy Services	12500 Burbank Blvd.	California
886					--place holder										Hemlimbra		Premier Specialty Infusion		
887	https://www.phs.org/doctors-services/services-centers/supporting-services/Pages/pharmacy-services.aspx	Albuquerque	NM	87109	--place holder	Oncology, Crohn's Disease, Cystic Fibrosis, Hemophilia, Hepatitis, HIV, Multiple Sclerosis, Psoriasis, Rheumatoid arthritis, Ulcerative colitis		Monica Judkins		Presbyterian Health	Counseling and education					Subsidiary	Presbyterian Specialty Care Pharmacy	5901 Harper Drive NE	New Mexico
888	http://carepharmacies.com/prestons-care-pharmacy/	Arlington	VA	22207	--place holder	Growth Hormone, Dermatology		Michael Kim		CARE Pharmacies						Member	Preston's CARE Pharmacy	5101 Lee Highway	Virginia
889	http://www.pricechopper.com/pharmacy/specialty-pharmacy	Schenectady	NY	12308	--place holder	Rheumatoid Arthritis, Osteoarthritis, Hepatitis C, Psoriasis, Rheumatoid Arthritis, Multiple Sclerosis, Crohn's Disease, Psoriasis, Osteoporosis, Growth Hormone, HIV, Ulcerative Colitis, Transplantation, Crohn's Disease		Kathy Bryant		Price Chopper	Counseling and education	Enforcement of clinical protocols and drug formularies, Dose management, Waste minimization, Clinical management programs, Clinical outcomes and utilization reporting 	Inventory management, Pharmacy and medical billing, Administration of patient assistance programs, Product launch and commercialization support, Patient and physician education, Custom data reporting, REMS program assistance, Access copay and financial assistance programs	80 locations in CT, MA, NH, NY and PA		Subsidiary	Price Chopper Specialty Pharmacy	461 Nott Street	New York
890	http://www.PrimeAidrx.com	Union City	NJ	7087	--place holder	HRT, Oncology, Rheumatoid Arthritis, Hepatitis C, Hemophilia, Bleeding disorders, Growth Hormone, HIV, Dermatology, Multiple Sclerosis		Yana Shtindler	URAC, JCAHO	Independent	Delivery, Benefits investigation and Insurance coordination	Adherence reporting, Treatment education				Private	Prime Aid Pharmacy 	3915 Bergenline Ave.	New Jersey
891	http://www.primetherapeutics.com	Orlando	FL	32819	--place holder	Ankylosing spondylitis, Crohn's disease, Cystic Fibrosis, Fertility, Growth Hormone, Hemophilia, Hepatitis C, HIV, Multiple Sclerosis, Oncology, Immunology, Psoriasis, Psoriatic arthritis, Pulmonology, Rheumatoid arthritis, RSV 		Raechele McMahan	URAC, ACHC	Prime Therapeutics	Delivery, Counseling and education				Ibrance, Inlyta, Xalkori, Bosulif, Sutent, Alecensa, Beleodaq, Blincyto, Caprelsa, Cometriq, Coetllic, Cyramza, Erivedge, Farydak, Herceptin, Imlygic, Iressa, Jakafi, Keytruda, Lenvima, Matulane, Mekinist, Nexavar, Opdivo, Pomalyst, Portrazza, Purixan, Revlimid, Rituxan, Stivarga, Tafinlar, Tagrisso, Tykerb, Unituxin, Votrient, Yervoy, Zelboraf, Zydelig, Zykadia, Apokyn, Promacta, Northera, Tysabri, Xenazine, Adagen, Aldurazyme, Cystagon, Elaprase, Elelyso, Fabrazyme, Kuvan, Naglazyme, Orfadin, Strensiq, Chenodal, Gattex, Egrifta, Increlex, Omnitrope, Korlym, Signifor LAR, Somavert, Synagis, Letairis, Ofev, Remodulin, Uptravi, Xyrem, Exjade, Tarceva, Iclusig	Subsidiary	Prime Therapeutics Specialty Pharmacy	2354 Commerce Park Drive, Suite 100	Florida
892					--place holder												ProCare Rx		
893					--place holder										Hemlimbra		ProPace Payless		
894	http://oregon.providence.org/our-services/p/providence-specialty-pharmacy-services/	Portland	OR	97213	--place holder	Rheumatoid Arthritis, Multiple Sclerosis, Hepatitis C, Oncology, Bleeding disorders, IBD, DVT, Hemophilia, HIV, Osteoarthritis, Psoriasis		Austin Ewing	URAC	Providence Health & Services	Insurance coordination and assistance, Counseling and education, Financial assistance programs, Delivery	Clinical drug review				Subsidiary	Providence Specialty Pharmacy Services	6410 NE Halsey	Oregon
895	http://www.publix.com/pharmacy-wellness/pharmacy/pharmacy-services/specialty	Lakeland	FL	33811	--place holder	Hepatitis, Oncology, Inflammatory Diseases		Katie Scanlon Petti	URAC, ACHC	Publix	Counseling and education					Subsidiary	Publix Specialty Pharmacy	3300 Publix Corporate Parkway	Florida
896	http://www.qualitaspharmacy.com/	South Plainfield	NJ	07080	--place holder	Oncology, Hepatitis, HIV, Multiple Sclerosis, Rheumatoid Arthritis, Transplantation, Rare genetic conditions		Suzanne Sesta	URAC	Independent	Counseling and education, Assessment and reassessment, Ongoing monitoring, Insurance coordination and financial assistance, 24x7 pharmacist and nurse, Delivery					Private	Qualitas Pharmacy Services	603 Montrose Avenue	New Jersey
897					--place holder										Hemlimbra		Quality Home Infusion		
898	http://www.qualityspecialtypharmacy.com	Tampa	FL	33617	--place holder	Dermatology, Gastroenterology, Hepatology, Infectious Disease, Fertility, Neurology, Oncology, Pulmonology, Rheumatoid Arthritis, Urology		Alex Maydan	URAC	Independent	Coordination of Insurance Benefits, Financial Assistance programs, Counseling and education, Refill compliance, 	Adherence monitoring, Reporting, Patient education and support		Bronx, NY; Tampa, FL; Jacksonville, FL; Lomita, CA		Private	Quality Specialty Pharmacy	5144 E Busch Blvd	Florida
899	http://www.queensmedical.com	Fresh Meadows	NY	11366	--place holder	Oncology		Susan Dicosola 		Independent						Private	Queens Medical Associates	176-60 Union Tpke #360	New York
900	http://www.realodiscountdrug.com/	Lillington	NC	27564	--place holder	Rheumatoid Arthritis, Psoriasis, Multiple Sclerosis, Crohn's Disease, HIV		Rob Bizzell	URAC	Independent	Counseling and education, Financial support, Delivery 24x7 pharmacist	Prior authorization				Private	Realo Specialty Care	130 Pine Street	North Carolina
901	http://receptrx.com	Fort Worth	TX	76119	--place holder	Hepatitis C, Rheumatoid Arthritis, Crohn's Disease, Psoriasis, HIV, Oncology, Pain Management		Carmine DeNardo	URAC, ACHC	Independent	Counseling and education, Financial, Co-pay and Reimbursement assistance, Injectable training, Benefit investigation		Protocol-driven, product specific clinical programs, Clinical appropriateness reviews, Patient education and training, REMS compliance, Patient adherence and compliance programs, Reporting and analytics	Fort Worth, TX; Grapevine, TX; Fort Worth, TX; Flowood, MS; Houston, TX; Bellaire, TX; San Antonio, TX; Corpus Christi, TX; El Paso, TX; Birmingham, AL; Riverview, FL; Austin, TX; Mobile, AL; Edinburg, TX; Coral Springs, FL; Metairie, LA; Houston, TX; Austin, TX; Arlington, TX; San Antonio, TX; San Braunfels, TX; San Antonio, TX; Jenks, OK; El Paso, TX (2); Auto, TX; Pearland, TX; Fort Walton, FL; Weatherford, TX; Edmond, OK		Private	ReCept Pharmacy	5500 E. Loop 820 South, Suite 102	Texas
902					--place holder										Hemlimbra		Red Chip Enterprises		
903	http://www.redlinepharmacy.com	Hastings	NE	68901	--place holder	Fertility, Growth Hormone, Women's Health, Dermatology, Pain Management		Tim Redline	ACHC	Independent						Private	Redline Pharmacy	401 West 33rd St, Suite #100	Nebraska
904	www.regionalcancercare.org	Hackensack	NJ	07601	--place holder	Oncology		Terrill Jordan 		Independent						Private	Regional Cancer Care Associates 	25 Main Street, Suite 601	New Jersey
905	https://www.regionalonehealth.org/outpatient-pharmacy/	Memphis	TN	38103	--place holder	Oncology, Crohn's Disease, Cystic Fibrosis, Hemophilia, Hepatitis, HIV, Multiple Sclerosis, Psoriasis, Rheumatoid arthritis, Ulcerative colitis		Kay Ryan	URAC	Regional One Health				Memphis, TN		Subsidiary	Regional One Health	880 Madison Avenue	Tennessee
906	http://www.regionalhealth.com	Rapid City	SD	57703	--place holder	Oncology, Crohn's Disease, Cystic Fibrosis, Growth Hormone, Hepatitis C, HIV, Multiple Sclerosis, Psoriasis, Psoriatic Arthritis, Rheumatoid Arthritis, Ankylosing Spondylitis, Osteoporosis, Osteoarthritis, Transplantation		Lenny Petrick	URAC	Regional Health	Benefit investigation, Financial assistance, Therapy Management, Refill reminders	Clinical care protocols, Specialized data management systems				Subsidiary	Regional Specialty Pharmacy	1906 Lombardy Drive	South Dakota
907	http://www.reliancerxsp.com	Amherst	NY	14221	--place holder	Respiratory disorders, Oncology, Multiple Sclerosis, Rheumatoid Arthritis		Amy Nash	URAC	Independent Health	Counseling and education, Delivery and 24/7 support	Prior authorization				Subsidiary	Reliance Rx	45 Earhart Dr., Suite 110	New York
908	http://www.repromedfertility.com/	Dallas	TX	75204	--place holder	Fertility		Anil Pinto		Independent	Financial assistance					Private	Repromed Fertility Center	3800 San Jacinto Street	Texas
909	http://www.restorerx.com	Brunswick	TN	38014	--place holder	Arthritis, Renal Disease, Crohn's Disease, DVT, Gaucher Disease, Growth Hormone, Hemophilia, Hepatitis, HIV, Multiple Sclerosis, Oncology, Transplantation, Psoriasis, Ulcerative Colitis, von Willebrand Disease		Craig Akers	URAC	Independent	Delivery, Financial assistance with copays	Clinical and step therapy programs, DUR, Patient education and counseling, Therapy adherence monitoring				Private	ReStore Rx	169 Brunswick Road	Tennessee
910	http://www.richies.com/	Conroe	TX	77404	--place holder	Dermatology, HRT		Richie Ray		Independent						Private	Richie's Specialty Pharmacy	12820 Highway 105 West	Texas
911	http://www.richmondfertilitycenter.com/	Richmond	VA	23229	--place holder	Fertility		Anish Shah		Independent	Education and counseling, Financial assistance			Fredericksburg, VA		Private	Richmond Center for Fertility	9030 Stony Point Parkway, Suite 450	Virginia
912	http://riospharmacy.com	Morton	PA	19070	--place holder	IVIG		Loc Dao		Independent						Private	Rios Pharmacy	35 South Morton Avenue	Pennsylvania
913	http://riteaidspecialtypharmacy.com/	Gaithersburg	MD	20878	--place holder	Oncology, Crohn's Disease, Cystic Fibrosis, DVT, Diabetes, Fertility, Growth Hormone, Hepatitis C, HIV, Multiple Sclerosis, Osteoporosis, Psoriasis, PAH, Rheumatoid Arthritis, Transplantation		Angela Morris	URAC	Rite Aid	Counseling and education, Delivery, 24x7 pharmacist				Ibrance, Inlyta, Xalkori, Bosulif, Sutent	Subsidiary	Rite Aid Specialty Pharmacy	704 Quince Orchard Rd	Maryland
914	https://carepharmacies.com/blog/location/rollins-care-pharmacy/	Rockville	MD	20852	--place holder	HIV, Oncology, Pain Management, Transplantation		Andrew Fox		CARE Pharmacies	Counseling and education, Delivery					Member	Rollins CARE Pharmacy	184 Rollins Ave	Maryland
915	http://www.rosemontpharmacy.com	Rosemont	PA	19010	--place holder	Fertility, Women's Health		Ennio Magnarelli		Independent	Pharmacist on-call 24/7, Delivery, Training and Education and Counseling, Refill reminders, Financial assistance	Prior authorization coordination	Compliance monitoring			Private	Rosemont Specialty Pharmacy	1149 E. Lancaster Avenue	Pennsylvania
916	https://stores.healthmart.com/rosspharmacy/stores.aspx	Los Alamitos	CA	90720	--place holder	HIV, Oncology, Pain Management, Transplantation		Andrew Fox		Independent	Counseling and education, Delivery					Private	Ross Pharmacy	10879 Los Alamitos Blvd.	California
917	https://www.rush.edu/patients-visitors/hospital-amenities/pharmacy	Chicago	IL	60612	--place holder	Dermatology, Gastroenterology, Hepatology, Infectious disease, Multiple Sclerosis, Rheumatoid arthritis		Scott Sonnenschein		Rush University Medical Center	Counseling and education, insurance verification and price authorization, prescription fulfullment and refill management, patient education	Adherence monitoring				Subsidiary	Rush Specialty Pharmacy	1653 West Congress Parkway	Illinois
918	http://rutlandpharmacy.com/	Rutland	VT	05701	--place holder	HIV, Oncology, Pain Management, Transplantation		Amanda Winchell	URAC	Independent	Counseling and education, Delivery					Private	Rutland Pharmacy	75 Allen Street	Vermont
919	http://www.rxbiotech.com	West Hollywood	CA	90048	--place holder	Bleeding disorders, Anticoagulants, Endocrine, Immunology, Behavioral Health, Gaucher's Disease, Growth Hormone, Oncology, Fertility, Hemophilia, Multiple Sclerosis, Hepatitis, Neutropenia, Osteoarthritis, Osteoporosis, HIV, Pain Management, Parkinson Disease, Psoriasis, Pulmonology, Crohn's Disease, Cystic Fibrosis, Hunter's Syndrome		Mak Bagheri		Giant Eagle	Counseling and education, Delivery, Prior Authorization, Pharmacist and Nurse support	Insurance authorization, 				Subsidiary	RX Biotech	8737 Beverly Blvd.	California
920	http://www.rxclinicpharmacy.com/	Charlotte	NC	28227	--place holder	HRT, Pain Management		Amino Abubakar	URAC	Independent	Counseling and education, Delivery					Private	Rx Clinic Pharmacy	7308 East Independence Blvd.	North Carolina
921	https://www.flcancer.com/rxtogoservice	Fort Myers	FL	33916	--place holder	Oncology		Melody Chang	URAC	Florida Cancer Specialists	Delivery, Counseling and education, Insurance assistance				Pomalyst	Subsidiary	Rx To Go	4371 Veronica S. Shoemaker	Florida
922	http://www.safeway.com/ShopStores/Pharmacy-Services.page	Pleasanton	CA	94588	--place holder	Oncology, Hepatitis, Behavioral Health, Osteoporosis, Psoriasis, Rheumatoid Arthritis, Crohn's Disease, Transplantation, Multiple Sclerosis		Brian Hille	ACHC	Safeway	Insurance/benefits and financial assistance investigation, Delivery, Counseling and education	Prior authorization support, patient education			Ibrance, Inlyta, Xalkori, Bosulif, Sutent, Orkambi	Subsidiary	Safeway Specialty Care	5918 Stoneridge Mall Rd	California
923	http://www.salveospecialty.com	St. Petersburg	FL	33701	--place holder	Ankylosing Spondylitis, Oncology, Crohn's Disease, Growth Hormone, Hemophilia, Hepatitis C, Fertility, Multiple Sclerosis, Transplantation, Osteoarthritis, Psoriasis, PAH, Rheumatoid Arthritis, RSV		Jeff Freedman	URAC, ACHC	OptumRx, UnitedHealth Group	Consultation, Delivery, Benefits investigation, 24/7 support	Real-time critical data, Prior Authorization, Clinical expertise	Treatment education, REMS support			Subsidiary	Salveo Specialty Pharmacy	270 First Avenue South, Suite 302 	Florida
924	http://www.schnucks.com	St. Louis	MO	63146	--place holder	HIV, Multiple Sclerosis, Oncology, Rheumatoid Arthritis, Gastroenterology, Fertility		David Chism		Schnucks	Delivery, Patient education, Refill reminders	Disease state management programs		Springfield, IL; Rockford, IL; Brentwood, MO; Lindelll, MO		Subsidiary	Schnucks Specialty Pharmacy	3960 Lindell Blvd.	Missouri
925	https://www.sclhealth.org/locations/saint-joseph-hospital/services/pharmacy/treatments/	Denver	CO	80218	--place holder	Ankylosing spondylitis, Autoimmune disorders, Bleeding disorders, Oncology, Crohn's disease, Hepatitis C, HIV, Multiple sclerosis, Psoriasis, Psoriatric arthritis, Rheumatoid arthritis, Juvenile arthritis		Ron Sparks		SCL Health Saint Joseph	Counseling and education					Subsidiary	SCL Health Pharmacy Services - Franklin Pharmacy	1830 Franklin Street, Suite 190	Colorado
926	http://www.scriptcare.com	Beaumont	TX	77706	--place holder	Asthma, Dermatology		Kevin Brown	URAC	Independent	Consultation and Performance reporting					Private	Script Care, Ltd.	6380 Folsom Drive	Texas
927	http://www.scriptsiterx.com/	San Francisco	CA	94102	--place holder	Behavioral Health, HIV, Dermatology		Mark Bornholdt		Independent						Private	ScriptSite Pharmacy	870 Market St #1028	California
928	http://www.senderrarx.com	Richardson	TX	75081	--place holder	Asthma, Cardiovascular, Crohn's Disease, Endocrine Disorders, Hemophilia, Hepatitis C, Multiple Sclerosis, Immunology, Osteoarthritis, Osteoporosis, Psoriasis, Rheumatoid Arthritis, Ulcerative Colitis		Win Purifoy	URAC, ACHC	Independent	Delivery	Prior authorizations, Medical protocol programs	Trial, adherence, compliance, Real-time data, 	Richardson, TX; Flint, MI	Taltz, ColcuGel	Private	Senderra RX Specialty Pharmacy	1301 East Arapaho Road, Suite 101	Texas
929	http://www.shoppersdrugmart.ca	Toronto	CA	M2J 4W8 	--place holder	Oncology, Chemotherapy, Arthritis, Asthma, COPD		Pavithra Ravi		Shoppers Drug Mart	Counsel and education, Refill reminders, Reimbursement assistance	Case management	Reporting and analytics			Subsidiary	Shoppers Drug Mart Specialty Health Network	243 Consumers Road	Canada
930	https://www.simplicityrxpharmacy.com/	West Chester Township	OH	45246	--place holder	Oncology, Hepatitis, Multiple Sclerosis, HIV, Rheumatoid Arthritis, Psoriasis, Crohn's Disease		Brad Manning	URAC	Independent	Counseling and education, Financial assistance, refills, 24x7 support	Prior authorization support, Financial and patient support		Kentucky, Indiana		Private	Simplicity Rx	10160 International Blvd	Ohio
931	http://www.skyemedjustrx.com	Lake Mary	FL	32741	--place holder	Hepatitis C, HIV, IBD, Multiple Sclerosis, Psoriasis, Oncology, Osteoporosis, RSV, Rheumatoid Arthritis, Psoriasis		Deepak Ranade	ACHC	Independent	Insurance and financial assistance, Counseling and education, On-call pharmacist, Delivery and refill reminders, 	Prior authorizations, Medication adherence	Patient Assistance Programs, Patient educator manufacturer materials, Reporting			Private	Skyemed JustRx	765 Primera Blvd - Suite 1021	Florida
932	skywalkpharmacy.com	Milwaukee	WI	53214	--place holder	Oncology, Cystic Fibrosis, Transplantation, Growth Hormone, Crohn's Disease, Endocrine disorders, Enzyme deficiencies, Epilepsy and Seizures, Growth Hormone, Hemophilia, Bleeding Disorders, HIV, Immunology, Rheumatoid Arthritis, Mitochondrial and other Genetic Disorders, Multiple Sclerosis, Psoriasis, PAH, Transplantation, Tuberculosis		Jake Olson		CARE Pharmacies	Patient counseling, drug information education and comprehensive support services, Delivery	Benefits investigation, prior authorizations and reimbursement support		Mequon, WI; New Berlin, WI; West Allis, WI		Member	Skywalk Pharmacy	6737 W Washington St	Wisconsin
933	https://www.ynhh.org/patients-visitors/amenities/pharmacy.aspx	Hamden	CT	06105	--place holder	Oncology, Hepatitis C, HIV, Cystic Fibrosis, Multiple Sclerosis, Rheumatoid Arthritis		Renee Havriliak		Yale New Haven Health System	Counseling and education, Reimbursement support, delivery, refills					Subsidiary	Smilow Cancer Center Hospital Specialty Pharmacy	1100 Sherman Avenue	Connecticut
934	http://smppharmacy.com/	Miami	FL	33143	--place holder	Fertility, HIV, Rheumatoid Arthritis, Dermatology, Hepatitis C, Osteoarthritis		Armando Bardisa	URAC, ACHC	Independent	Counseling and education, Customized financial solutions, Shipping, Co-pay Assistance, Counseling and education, Delivery	Prior authorization support, Medication Therapy Management	Medication Therapy Management	Miami, FL	ColciGel	Private	SMP Pharmacy Solutions	6050 South Dixie Highway	Florida
935	http://www.soleohealth.com/	Canton	MA	02021	--place holder	Anti-infective, Bleeding Disorders, Immunology		Barbara Prosser	JCAHO, URAC	Independent	Counseling and education, 24x7 pharmacist and nurse access, Reimbursement specialists		Dedicated account team, National clinical management and distribution coverage, Extensive health plan and payor access, Clinical protocol development		Hyqvia, Coagadex, Helimbra	Private	Soleo Health	5 Shawmut Rd #103	Massachusetts
936	www.solerarx.com	Pompano Beach	FL	33064	--place holder	HIV, Hepatitis C, Oncology, Rheumatoid Arthritis, Multiple Sclerosis, Rare Genetic Disorders and Wound Care		Nicholas Saraniti, CEO	ACPE	Independent	Free Delivery, Free Vitamins, Disease State Management Programs, Copayment Assistance, Insurance Specialists		Proactive patient communication, Connect patients to manufacturer support programs, Compliance and adherence programs			Private	Solera Specialty Pharmacy	2100 Park Central Blvd N	Florida
937	http://www.sconcology.net	Columbia	SC	29210	--place holder	Oncology		Jan Montgomery 		Independent						Private	South Carolina Oncology Associates	166 Stoneridge Drive	South Carolina
938	https://www.southcoast.org	Fairhaven	MA	02719	--place holder	Transplantation, Steroid therapies, Epogen and neupogen, Multiple Sclerosis, Cystic Fibrosis, Rheumatoid Arthritis, Immunology, HIV, Hepatitis C, Oncology, Crohn's Disease, Hemophilia		Scott Flanagan		Southcoast Health	24x7 clinical support, Delivery, Counseling and education	Ongoing status reporting	Comprehensive monitoring, Adjunct therapies, Reimbursement support, Co-pay assistance			Subsidiary	Southcoast Specialty Pharmacy	206 Mill Road	Massachusetts
939	https://www.leadingcancercare.com	Lincoln	NE	68510	--place holder	Oncology		Julie Watson		Independent						Private	Southeast Nebraska Cancer Center	201 S 68th St Pl # 100	Nebraska
940	http://www.spsrx.net	Birmingham	AL	35210	--place holder	Fertility		Philip Boyd		Guardian Pharmacy	Counseling and education, 24x7 pharmacist, Insurance verification					Subsidiary	Southern Pharmaceutical Services	1950 Crestwood Boulevard	Alabama
941	https://www.ssrx.com	Houston	TX	77030	--place holder	ALS, Arthritis, Asthma, Oncology, COPD, Cystic Fibrosis, Diabetes, Cardiovascualr, Osteoporosis, Respiratory Disorders		Harish Katharani	URAC, ACHC	Southside Group of Companies		Counseling and education, Delivery and refills, 		Woodland Hill, CA; Tallahassee, FL; Mamou, LA; San Antonio, TX; Katy, TX; Corpus Christi, TX; Houston, TX (8); Galveston, TX; The Woodlands, TX; Baytown, TX		Subsidiary	Southside Infusion Pharmacy	7700 Main St #100	Texas
942	https://southwestcare.org/	Sante Fe	NM	87505	--place holder	HIV, Hepatitis C		David Ginsburg	URAC	Independent	Counseling and education, Automatic refill program, Delivery, Copay assistance program help	Medication therapy management				Private	Southwest Care Center	649 Harkle Rd East	New Mexico
943	www.jaxpharmacy.com	Jacksonville	FL	32224	--place holder			Gregory Balotin	PCAB	Independent						Private	SP2, LLC	3740 St Johns Bluff Rd S #19	Florida
944		Baltimore	MD	21215	--place holder			Gertha Lewis		Independent						Private	Specialty Meds Rx	2901 Druid Park Drive	Maryland
945	http://www.spnninc.com/	Sarasota	FL	34240	--place holder	Infusion		Cherylann Gregory	URAC	Independent						Private	Specialty Pharmacy Nursing Network	1626 Barber Road, Suite B	Florida
946	https://stcare.envolvehealth.com	Orlando	FL	32819	--place holder	Hemophilia, Bleeding Disorders		Matt Angell	JACHO, URAC	Envolve Health	Delivery, Pharmacist 24x7, Counseling and education	Clinical programs supporting outcomes, Trend management initiatives, Patient adherence monitoring and support programs, Real-time data analysis and reporting	Patient copay assistance programs, Facilitation of manufacturer sponsored, patient-specific disease education and management, Data collection programs, Clinical trial management, HUB services, Real-time data analysis and reporting			Subsidiary	Specialty Therapeutic Care	8427 South Park Circle, Suite 400	Florida
947	http://www.deancare.com/	Madison	WI	53713	--place holder	Ankylosing Spondylitis, Crohn's Disease, Growth Hormone, Hepatitis C, HIV, Multiple Sclerosis, Oncology, Psoriasis, Psoriatic Arthritis		Mohammad Kharbat		SSM Health	Insurance Specialists, Free Delivery, Copay Assistance, Financial Support					Subsidiary	SSM Health Specialty Pharmacy	1313 Fish Hatchery Road	Wisconsin
948	http://www.stjohnprovidence.org/specialty-pharmacy	Farmington Hills	MI	48336	--place holder	Oncology, HIV, Hepatitis C, Multiple Sclerosis, Ulcerative colitis, Crohn's Disease, Transplantation, Rheumatoid arthritis, Auto-immune disorders, Psoriasis, Ankylosing Spondylitis		Michael Ragatzki	URAC	Ascension Health	Counseling and education, Therapy management, Financial assistance help	Prior authorization				Subsidiary	St. John Specialty Pharmacy	30055 Northwestern Hwy	Michigan
949	https://www.stjude.org/treatment/patient-resources/resources-on-campus/patient-pharmacy.html	Memphis	TN	38105	--place holder	Pediatrics		Wendell Cheatham		St. Jude's Children's Research Hospital	Counseling and education					Subsidiary	St. Jude Pharmacy	262 Danny Thomas Place	Tennessee
950	http://www.slhduluth.com/Find-a-Location/Northland-Pharmacy.aspx	Duluth	MN	55805	--place holder	Rheumatoid Arthritis, Multiple Sclerosis, Hepatitis C, Oncology, Bleeding disorders, IBD, DVT, Hemophilia, HIV, Osteoarthritis, Psoriasis		Kristopher Haugen		St. Luke's Hospital	Counselimg and education	Medication therapy management				Subsidiary	St. Luke's Northland Pharmacy	915 East First Street	Minnesota
951	https://carepharmacies.com/blog/location/stat-script-specialty-pharmacy/	Huntington Station	NY	11746	--place holder	Diabetes, Fertility, COPD, IBD, Gastroenterology		Al Thakkar		CARE Pharmacies						Member	Stat Script Specialty Pharmacy	1800A New York Avenue	New York
952	https://carepharmacies.com/blog/location/state-care-pharmacy/	Washington	DC	20020	--place holder					CARE Pharmacies						Member	State CARE Pharmacy	2041 Martin L King Jr SE #100	District of Columbia
953	http://www.sterlingspecialtycare.com/	Mendota Heights	MN	55120	--place holder	Psoriatric arthritis, Hepatitis C, HIV, IBD, Multiple Sclerosis, Oncology, Opthalmology, Osteoporosis, Psoriasis, Rheumatoid Arthritis		Tim Gallagher		Independent	Counseling and education, Delivery	Benefits monitoring	Reporting capabilities, Guideline adherence		Cosentyx, Otzela, Praluent, Repatha	Private	Sterling Specialty Pharmacy	1312 Northland Drive	Minnesota
954	http://www.stroheckersrx.com	Portland	OR	97202	--place holder	Fertility, HRT, Pain Management, Urology		Ronald Dulwick		Independent	24/7 pharmacist					Private	Stroheckers Pharmacy	1286 SE Holgate Blvd. C-1	Oregon
955	http://www.successmeds.com	Marlton	NJ	8053	--place holder	Fertility		Joe Dweck		Independent	Counseling and education, DesignRx					Private	Success Meds, LLC	9002-C Lincoln Drive West	New Jersey
956	http://www.summitcancercenters.com	Spokane Valley	WA	99216	--place holder	Oncology		Manpreet Chalal 		Independent						Private	Summit Cancer Centers	13424 E. Mission	Washington
957	https://www.superiorbiologics.com	Hawthorne	NY	10532	--place holder	Immunology, Hemophilia, Bleeding Disorders, Hepatitis C, Growth Hormone, Rheumatoid Arthritis		Kam Ghazvini	URAC, ACHC	Independent	Counseling and education, 24x7 pharmacist and nurse access, Customized clinical programs			Schaumburg, IL; Las vegas, NV	Helimbra	Private	Superior Biologics NY	200 Saw Mill River Road	New York
958	www.mysurecare.com	El Paso	TX	79902	--place holder	Hepatitis C, HIV, Crohn's Disease, Rheumatoid Arthritis, High Cholesterol		Daniel Moreno	ACHC	Independent	Financial assistance					Private	Surecare Specialty Pharmacy	4005 N Mesa St	Texas
959	https://www.swedishamerican.org/locations/specialty-pharmacy-swedishamerican	Rockford	IL	61104	--place holder	Rheumatoid Arthritis, Multiple Sclerosis, Crohn's disease, Growth hormone, Hemophilia, HIV, Psoriatric arthritis, Hepatitis, Hyperlipidemia, Asthma		Lindsay Cwynar		UW Health	24x7 support,  Benefits investigation, Copay assistance, Financial information assistance, Counseling and education, Refill and side-effect management	Adherence/compliance monitoring, Clinical interventions and follow-up				Subsidiary	SwedishAmerican Specialty Pharmacy	1401 East State Street	Illinois
960	http://www.taconicrx.com/	Jefferson Valley	NY	10535	--place holder	Fertility		Anthony Ciarletta		Westchester Pharmacy Group						Subsidiary	Taconic Pharmacy	3659 Lee Road	New York
961	http://www.target.com	Minneapolis	MN	55403	--place holder	Rheumatoid Arthritis, Multiple Sclerosis, Hepatitis C, Oncology, Bleeding disorders, IBD, DVT, Hemophilia, HIV, Osteoarthritis, Psoriasis				CVS Health	Counseling and education, 24x7 support, Benefit investigation, Prior authorization processing, Financial and co-pay assistance			1,650 locations		Subsidiary	Target Pharmacy	1000 Nicollet Mall	Minnesota
962	http://www.texaschildrenshealthplan.org/for-members/star/pharmacy-services	Houston	TX	77230	--place holder			Jonathan Vecchiet		Texas Children's Health Plan						Subsidiary	TCH Specialty Pharmacy	PO Box 301011, NB 8360	Texas
963	http://www.texasoncology.com	Dallas	TX	75251	--place holder	Oncology		James Schwartz 		Independent						Private	Texas Oncology	12221 Merit Dr., Suite 500	Texas
964	http://www.texasoncology.com/who-we-are/affiliations/oncology-pharmacy-services	Dallas	TX	75246	--place holder	Oncology		James Schwartz		Texas Oncology	Counseling and education, delivery			38 Texas locations		Subsidiary	Texas Oncology Pharmacy Services 	3410 Worth St #100	Texas
965	https://www.tampafamilypharmacy.com/	Tampa	FL	33609	--place holder	HRT, Dermatology, Pain Management, Podiatry, Wound Care, Hospice and Palliative Care, Pediatrics and NICU, Endocrinology, Allergy and ENT		Haley Miller	URAC, ACHC	Independent	Counseling and education, Patient support programs, Refills and delivery					Private	TFP Specialty	2919 W. Swann Avenue	Florida
966	http://thealliancepharmacy.org/	Westbury	NY	11590	--place holder	Hemophilia, Bleeding Disorders		Vincent Fusaro	URAC, ACHC	Independent	Counseling and education, 24x7 support, Delivery, Reimbursement support, 					Private	The Alliance Pharmacy	44 Bond Street	New York
967	http://www.thechemistshoppharmacy.com/	New York	NY	10016	--place holder				PCAB	Independent				Long Island City, NY		Private	The Chemist Shop Pharmacy	30 East 40th Street	New York
968	http://www.walgreens.com	Deerfield	IL	60015	--place holder	Oncology, Crohn's Disease, Ulcerative Colitis, Cystic Fibrosis, Hepatitis C, HIV, Fertility, Multiple Sclerosis, Psoriasis, Psoriatic Arthritis, Rheumatoid Arthritis, Transplantation		Ray Trancredi	URAC, ACHC	Walgreens Boots Alliance	Counseling and education, 24x7 support, Insurance verification, Refill reminders, Financial assistance, Delivery			San Francisco, CA; Sherman Oaks, CA; West Hollywood, CA; Washington, DC; Atlanta, GA; Chciago, IL; Indianapolis, IN; Baltimore, MD; Boston, MA; Minneapolis, MN; St. Louis, MO; Las Vegas, NV; Bronx, NY; Hawthorne, NY; Philadelphia, PA; Memphis, TN; Dallas, TX (2); Houston, TX; Seattle, WA; Milwaukee, WI	Arixtra, Fragmin, Heparin, Iprivask, Lovenox,Actimunne, Afinitor, Afinitor Disperz, Alecensa, Bosulif, Cabomeyyx, Cotellic, Eligard, Erivedge, Farydak, Gleevec, Hycamtin, Ibrnace, Inlyta, Jakafi, Lonsurf,Lupron Depot, Matulane, Mekinist, Nexavar, Ninlaro, Odomzo, Ponalyst, Purixan, Revlimid, Sandostatin, Sprycel, Stivarga, Sutent, Sylatron, Tafinlar, Tarceva, Targretin, Tasigna, Temodar, Thalomid, Trelstar, Tykerb, Votrient, Xalkori, Xeloda, Xtandi, Zykadia, Zelboraf, Zoladex, Zolinza, Zytiga, Aranesp, Granix, Leukine, Neulasta, Neumega, Neupogen, Procrit, Zarxio, Baraclude, Copegus, Daklinza, Harvoni, Hepsera, Epculsa, Firazyr, Ruconest, Praluent, Repatha, Esbriet, Ofev, Cuvitru, Gammagard Liqued, Incivek, Infergen, Intron A, Moderiba, Olysio, Pegasys, Pegintron, Rebetol, Ribapak, Ribasphere, Ribatab, Solvadi, Technivie, Tyzeka, Vemlidy, Victrelis, Viekira Pak, Viekira XR, Zepatier, Aranesp, Epogen, Sensipar, Bethkis, Cayston, Kalydeco, Kitibis Pak, Orkambi, Pulmozyme, Tobi, Cerdelga, Kynamro, Vimizim, Genotropin, Geref, Humatrope, Increlex, Norditropin, Omnitrope, Saizen, Sandostatin, Serostim, Somatuline Depot, Somavert, Tev-Tropin, Zomacton, Zorbitive, Kuvan, Mircera, Promacta, Samsca, Gammaked, Gamunex-C, Hizentra, Hyqvia, Actemra, Cimzia, Cosentyx, Enbrel, Humira, Orencia, Ostezia, Otrexup, Rasuvo, Simponi, Stelara, Xeljanz, Bravelle, Cetrotide, Follisitim, Ganirelix Acetate, Gonal-F, Menopur, Novarel, Ovidrel, Pregnyl, Repronex, Exjade, Jadenu, Actimmune, Apokyn, Cystadane, Cystaran, Daraprim, Dupixent, Egrifta, Gattex, Glassia, Hetlioz, Lupaneta Pack, Natpara, Northera, Ocaliva, Ravicti, Stimate, Syprine, Xenazine, Avonex, Ampyra, Aubagio, Betaseron, Copaxone, Extavia, Gilenya, Glatopa, Plegridy, Rebif, Tecfidera, Zinbryta, Astagraf XL, Cellcept, Cyclosporine, Envarsus, Gengraf, Hecoria, Myfortic, Neoral, Prograf, Rapamune, Sandimmune, Zortress, Forteo, Enbrel, Humira, Stelara, Taltz, Adcirca, Latairis, Opsumit, Traceleer, Acthar H.P., Sabril	Subsidiary	The Community, A Walgreens Pharmacy	200 Wilmot Road 	Illinois
969	http://www.zangcenter.com	Columbus	OH	43219	--place holder	Oncology		Christine Pfaff		Independent						Private	The Zangmeister Cancer Center	3100 Plaza Properties Blvd	Ohio
970	http://www.thriftywhite.com/	Plymouth	MN	55442	--place holder	Acromegaly, Auto Immune, HIV, Cystic Fibrosis, Oncology, Growth Hormone, Hepatitis, Coagulation Disorders, Neutropenia, Osteoarthritis, Osteoporosis, PAH, Transplantation		Tim Weippert	URAC	Thrifty White				80+ locations		Subsidiary	Thrifty White Pharmacy	6055 Nathan Lane, Suite 200	Minnesota
971	http://www.tlcrxpharmacy.com	Harvey	LA	70058	--place holder	HIV, Hepatitis C, Oncology, Rheumatoid Arthritis, Psoriatic Arthritis, Crohn's Disease		Chad Latimer		Kroger						Subsidiary	TLCRx	2731 Manhattan Blvd, Suite B17 	Louisiana
972	https://tnhpharmacy.com	Van Nuys	CA	91405	--place holder	Oncology, Crohn's Disease, Cystic Fibrosis, Hepatitis, HIV, Multiple Sclerosis, Psoriasis, Rheumatoid Arthritis, Transplantation, Infusion 		Avo Minasyan	URAC	Diplomat	Delivery, Counseling and education, 24x7 access to pharmacist and clinical specialists, Financial services, Prior Authorization, C0-payment	Coordination of eligibility, benefits, billing, and reimbursement, Patient adherence to utilization	Identify foundations for financial assistance, Product launch support, Monitor compliance		Tarceva, REVLIMID, Humira, Cimzia, Simponi, Entyvio, Afinitor, Bosulif, Erivedge, Farydak, Ibrance, Jakafi, Mekinist, Nexavar, Tarceva, Tykerb, Votrient, Xeloda, Xtandi, Harvoni, Solvadi, Plysio, Cosentyx, Enbrel, Otezia, Stelara, Taltz, Erivedge, Cimzia, Orencia, Xeljanz	Subsidiary	TNH Advanced Specialty Pharmacy	15211 Vanowen St. Ste 301	California
973	http://www.tnhpharmacy.com	Van Nuys	CA	91405	--place holder	Oncology, Crohn's Disease, Cystic Fibrosis, Hepatitis, HIV, Multiple Sclerosis, Psoriasis, Rheumatoid Arthritis, Transplantation, Infusion 		Raymond Shirvanyan	URAC	Independent	Delivery, Counseling and education, 24x7 pharmacist, Delivery, Financial assistance		Limited distribution drugs			Private	TNH Pharmacy II	15211 Vanowen St. Ste # 301	California
974	http://www.totalcarerx.com	Flushing	NY	11355	--place holder			Bob Hopkins		Independent						Private	Total Care Rx, Inc.	57-37 Main Street	New York
975	http://www.transcriptpharmacy.com	Jackson	MS	39232	--place holder	Asthma, Behavioral Health, Renal disease, Crohn's Disease, Cystic Fibrosis, DVT, Diabetes, Endocrinology, Growth Hormone, Hematology, Hemophilia, Hepatitis, HIV, Multiple Sclerosis, Neurology, Oncology, Osteoporosis, Osteoarthritis, Pain management, Psoriasis, Pulmonology, Rheumatoid arthritis, Transplantation		Clifton Osborne	URAC	Independent	Treatment adherence, Benefits investigation, Call customers if medications are not renewed on time and often check in to see if treatments are working or causing any problems	Prior authorization assistance	Patient assistance program, Customized compliance reports			Private	Transcript Pharmacy	2506 Lakeland Drive, Suite 201 	Mississippi
976	http://transitionrx.com/	Trevose	PA	19053	--place holder			Christopher Di Lascia		Independent			Support for New Product Launches and Orphan Drugs, Nationwide Insurance Support and Pharmacy HUB Services, Patient Assistance and Co-Pay Support			Private	Transitions Patient Services	4 Neshaminy Interplex Dr.	Pennsylvania
977	http://www.trottaspharmacy.com/	Harrison	NY	10528	--place holder	Fertility, Behavioral Health, Immunology		Amy Adler		Westchester Pharmacy Group	Counseling and education, Delivery					Subsidiary	Trotta's West Street Pharmacy	15 Halstead Avenue	New York
978					--place holder										Helimbra		Twelvestone Health		
979	http://www.tosprx.com/	Lubbock	TX	79410	--place holder	Bleeding Disorders, Asthma, Crohn's Disease, Cystic Fibrosis, Fertility, Gaucher Disease, Hemophilia, Hepatitis, HIV, Hunter's Syndrome, Immunology, Multiple Sclerosis, Neutropenia, Oncology, Osteoarthritis, Osteoporosis, Parkinson Disease, Psoriasis, PAH, RSV, Rheumatoid Arthritis, Thrombolytic			URAC	Independent	Counseling and education, Refill reminders	Prior authorization, Clinical counseling, Foundation assistance				Private	Twin Oaks Specialty Pharmacy	3436 34th Street	Texas
980	http://carepharmacies.com/twins-pharmacy	Berwyn Heights	MD	20740	--place holder	Asthma, Bleeding disorders, Coagulation disorders, Gastroenterology, Hematopoietic, HIV, HRT, IBD, Lipid disorders, Osteoporosis, Psoriasis, PAH, Renal disease, Seizure disorders, Transplantation		Jeanette Otero		CARE Pharmacies	Counseling and education, Compliance packaging					Member	Twins Pharmacy	6201 Greenbelt Road, Suite L4	Maryland
981	http://www.uofmhealth.org/conditions-treatments/specialty-pharmacy-services	Ann Arbor	MI	48109	--place holder	Crohn's Disease, Cystic Fibrosis, Fertility, Growth Hormone, Oncology, Hepatitis C, Multiple Sclerosis, Psoriasis, Rheumatoid Arthritis, Transplantation		Lindsey Clark									U-M Specialty Pharmacy	4260 Plymouth R	Michigan
982	https://www.uabmedicine.org/specialty-pharmacy-services	Birmingham	AL	35249	--place holder	Oncology, Crohn's Disease, Hepatitis C, Multiple Sclerosis, Rheumatoid Arthritis, Osteoarthritis, Psoriatric Arthritis, Cystic Fibrosis		Joshua Whitley	URAC	UAB Health System	Counseling and education, Individualized therapy management, Refill reminders, Financial counseling					Subsidiary	UAB Specialty Pharmacy	601 19th Street South, 4th Floor	Alabama
983	https://www.ucdmc.ucdavis.edu/pharmacy/specialty.html	Sacramento	CA	95817	--place holder	Cardiovascular, Dermatology, Gastroenterology, Hepatology, Infectious Disease, Neurology, Oncology, Rheumatology, Transplantation		Kathie Le	URAC	UC Davis Health	Delivery, Counseling and education, Benefit Investigation/Insurance Billing/Financial Assistance, Refill reminder					Subsidiary	UC Davis Specialty Pharmacy	2315 Stockton Blvd	California
984	https://health.ucsd.edu	San Diego	CA	92093	--place holder	Hepatitis C, Transplantation, Oncology, Rheumatoid arthritis, Multiple sclerosis		Katie Derry	URAC	UC San Diego Health	Education, Financial Assistance, Delivery					Subsidiary	UC San Diego Health Specialty Pharmacy	3855 Health Sciences Drive	California
985	http://uchealth.com/pharmacy/specialty-pharmacy/	Cincinnati	OH	45229	--place holder	Rheumatoid arthritis, Hepatitis C, Crohn's Disease, Multiple Sclerosis, Ulcerative colitis, Transplantation, Oncology		Justin Campbell	URAC	UC Health	24x7 support, Counseling and education, Billing and financial assistance, Shipment and delivery					Subsidiary	UC Health Specialty Pharmacy	3200 Burnet Street	Ohio
986	http://www.ucirvinehealth.org/patients-visitors/pharmacy	Orange	CA	92868	--place holder	Growth Hormone, Hepatitis C, HIV Multiple Sclerosis, Oncology, Rheumatoid Arthritis, Transplantation		Bruce Ball		UC Irvine Health	Shipping, Counseling and education					Subsidiary	UC Irvine Health Outpatient Pharmacy	101 The City Drive South	California
987	https://ufhealth.org/pharmacy-shands-cancer-hospital	Gainesville	FL	32608	--place holder	Oncology		Alissa Voils		UF Health						Subsidiary	UF Health Pharmacy – Shands Cancer Hospital	1515 SW Archer Road	Florida
988	http://www.uky.edu	Lexington	KY	40536	--place holder	Crohn's Disease, Cystic Fibrosis, Fertility, Growth Hormone, Oncology, Hepatitis C, Multiple Sclerosis, Psoriasis, Rheumatoid Arthritis, Transplantation		Philip Schwieterman	URAC	UK HealthCare 	Insurance and financial assistance, Education and counseling					Subsidiary	UK Health Care Specialty Pharmacy	900 South Limestone	Kentucky
989	http://www.umsrx.com/	Worcester	MA	01655	--place holder	Transplantation, Multiple Sclerosis, HIV, Fertility, Cystic Fibrosis, Oncology		Harshvina Patel	URAC	UMASS Memorial Medical Center	Pick-up and delivery, Counseling and education, Verify insurance coverage, Financial assistance identification	Prior Authorizations, Verify insurance coverage, Identifying opportunities for financial assistance, Patient-Centered Medication Adherence, Disease State Therapy Programs, Data-Driven Approach				Subsidiary	UMASS Memorial Specialty Pharmacy	55 Lake Avenue North, ACC Building−First Floor	Massachusetts
990	http://www.pharm.med.umich.edu/specialty_pharmacy	Ann Arbor	MI	48109	--place holder	Crohn's Disease, Cystic Fibrosis, Fertility, Hepatitis, Growth Hormone, Multiple Sclerosis, Oncology, Psoriasis, Rheumatoid Arthritis, Transplantation		Sandy Goel		Michigan Medicine	Financial Counseling, 24x7 pharmacist, Refill reminder, Delivery, Clinical support and education					Subsidiary	UMHS Specialty Pharmacy	4260 Plymouth Road 	Michigan
991	https://www.med.unc.edu/htcenter/pharmacy-program	Chapel Hill	NC	27517	--place holder	Hemophilia		Dan Dalton	URAC, ACHC	UNC Health Care						Subsidiary	UNC Hemophilia Treatment Center Pharmacy	6340 Quadrangle Drive, Suite 50	North Carolina
992	http://www.uncmedicalcenter.org/uncmc/patients-visitors/amenities/pharmacies/specialty-pharmacy-service/	Durham	NC	27703	--place holder	Hepatitis C, Neurology, Oncology, Rheumatology, Transplantation		Scott Savage	URAC	UNC Health Care	Financial assistance, Refills and shipping, Counseling and education		Medication therapy management, Adherence monitoring			Subsidiary	UNC Shared Services Center Pharmacy	4400 Emperor Blvd	North Carolina
993					--place holder										Helimbra		Unipartners		
994	https://www.unitypoint.org/specialty-pharmacy.aspx	West Des Moines	IA	50266	--place holder	Allergy, Dermatology, Gastroenterology, Hepatitis C, HIV, Multiple Sclerosis, Neurology, Oncology, Hematology, RSV, Rheumatoid Arthritis		Brian Benson	URAC	UnityPoint Health	Insurance benefit and authorization verification, Counseling and education, Delivery and refills	Data for patient outcomes	REMS requirements, Patient compliance monitoring, Patient training, Biometric and utilization monitoring, Ability to provide data			Subsidiary	UnityPoint at Home Specialty Pharmacy	1776 West Lakes Parkway, Suite 400	Iowa
995	http://www.universitycancer.com	Athens	GA	30607	--place holder	Oncology, Bleeding Disorders		Gina Powell		Independent						Private	University Cancer and Blood Disorders	3320 Old Jefferson Road, Building 700	Georgia
996	http://www.universitychemists.com	New York	NY	10003	--place holder	HIV, Infusion, Transplantation, Oncology		Angela DiLorenzo		Independent	Delivery, Counseling and education					Private	University Chemists	74 University Place 	New York
997	http://www.uchospitals.edu/visitor/for-patients/guide/specialty-pharmacy/index.html	Chicago	IL	60637	--place holder	Rheumatoid arthritis, Oncology, Fertility, IBD, Multiple Sclerosis, Hepatitis C, Dermatology		Kevin Colgan		The University of Chicago Medicine		Counseling and education, Delivery and refills, 24x7 support				Subsidiary	University of Chicago Medical Center Specialty Pharmacy	5758 S. Maryland Avenue, MC 9041 	Illinois
998	https://hospital.uillinois.edu/primary-and-specialty-care/pharmacy/prescription-services/specialty-pharmacy-services	Chicago	IL	60605	--place holder	Dermatology, Ophthalmology, ENT and Allergy		Kyle Mork	URAC	UI Health	Counseling and education, Shipping and refills, Co-pay assisatnce referrals					Subsidiary	University of Illinois at Chicago Wood Street Pharmacy	840 S Wood Street	Illinois
999	https://uihc.org/specialty-pharmacy-services	Iowa City	IA	52242	--place holder	Oncology, HIV, Huntington disease, Fertility, IBD, Hepatitis C, Mutiple Sclerosis, Transplantation, Cystic Fibrosis, Rheumatoid Arthritis, Dermatology		Wendi Slaughter	URAC, JCAHO	University of Iowa Hospitals and Clinics 	Counseling and education					Subsidiary	University of Iowa Hospitals and Clinics Specialty Pharmacy	200 Hawkins Drive	Iowa
1000	http://www.kansashealthsystem.com/medical-services/pharmacy-department/specialty-pharmacy	Kansas City	KS		--place holder	Cardiovascular, Dermatology, Gastroenterology, Hepatology, Infectious Disease, Neurology, Oncology, Rheumatoid arthritis, Transplantation		Rick Couldry		University of Kansas Health System	Counseling and education, Delivery, Refill reminders, Pharmacy patient advocacy					Subsidiary	University of Kansas Health System Specialty Pharmacy	39yh and Raibow Blvd.	Kansas
1001	https://www.urmc.rochester.edu	Rochester	NY	14642	--place holder	Oncology, Multiple Sclerosis, Gastroenterology, Hepatology, Immunology, Rheumatoid arthritis		David Kirshner	URAC	University of Rochester Health System	Education, Financial Assistance, Delivery					Subsidiary	University of Rochester Medical Center Specialty Pharmacy	601 Elmwood Ave, Box 617	New York
1002	http://www.hsc.utah.edu	Salt Lake City	UT	84108	--place holder	Oncology, Crohn's Disease, Cystic Fibrosis, Hemophilia, Hepatitis C, HIV, Fertility, Multiple Sclerosis, Transplantation, Psoriasis, Rheumatoid Arthritis		Lonnie Smith	URAC	University of Utah Health Care	Delivery, 24x7 pharmacist, Benefits assistance, Prior authorization, Copay and patient assistance			Murray, UT; Salt Lake City, UT (4); West Valley City, UT; South Jordan, UT		Subsidiary	University of Utah Hospitals and Clinics	675 Arapeen Drive, Suite 102	Utah
1003	http://www.uwhealth.org/pharmacy/pharmacy-services/10922	Madison	WI	53792	--place holder	HIV, Cystic Fibrosis, Diabetes, Cardiovascular, Infusion		Kack Temple		UW Health	Counseling and education, Delivery, 24x7 pharmacist, Refill reminders					Subsidiary	University of Wisconsin Healthcare Pharmacy Service	600 Highland Avenue	Wisconsin
1004	https://www.ghs.org/healthcareservices/upstate-pharmacy/	Greenville	SC	29605	--place holder	Oncology, Neurology, Gastroenterology		Steven Ranck		Greenville Health System		Ensure access and affordability, Pick-up and delivery, Counseling and education			Revlimid	Subsidiary	Upstate Medical Pharmacy	701 Grove Road	South Carolina
1005	http://www.upstatepharmacy.com	West Seneca	NY	14224	--place holder	Oncology		Ted Kuzniarek		Independent	Delivery	Claim authorization, Billing assistance				Private	Upstate Pharmacy Ltd.	40 North America Drive	New York
1006	http://www.urmc.rochester.edu/pharmacy/pharmacies/specialty.cfm	Rochester	NY	14642	--place holder	Oncology, Multiple Sclerosis, Gastroenterology, Hepatology, Immunology, Rheumatoid arthritis		Allison Trawinski	URAC	University of Rochester Medical Center	Delivery, 24x7 pharmacist, Counseling and education, Co-pay assistance		Disease specific programs			Subsidiary	URMC Specialty Pharmacy	601 Elmwood Ave	New York
1007	http://www.usbioservices.com	Frisco	TX	75034	--place holder	Dermatology, Gastroenterology, Growth Hormone, Hepatitis C, Hereditary Angioedema, Immunology, IBD, Multiple Sclerosis, Oncology, Ophthalmology, Osteoporosis, Rare Diseases, Rheumatoid arthritis, RSV, Infusion, Urology		Kelly Ratliff	URAC, ACHC	AmerisourceBergen	24x7 pharmacist and nurse support, Prior authorization assistance, Patient educational materials, Delivery	Clinical analytics, Case manager portal, Therapy coordination to various sites of care, 24x7 clinical support	Commercialization solutions, Therapy access services, Clinical support and education, Adherence programs, REMS, Clinical trial assistance, Orphan therapies for rare diseases	Dothan, AL; Anaheim, CA; Denver, CO; Lenexa, KS; Linthicum Heights, MD; Charlotte, NC; Boothwyn, PA; Frisco, TX	Ibrance, Inlyta, Xalkori, Bosulif, Sutent, Xolair, Nexavar, Tesaro, Rubraca, Iressa, Tagrisso, Jakafi, Hyqvia, Emflaza, Zyvox, Tarceva, REVLIMID, Humira, Xolair, Verzenio	Subsidiary	US Bioservices	3101 Gaylord Parkway	Texas
1008	http://www.welldyne.com/us-specialty-care-overview	Englewood	CO	80155	--place holder	Oncology, Crohn's Disease, Growth Hormone, Hepatitis C, HIV, Fertility, Multiple Sclerosis, Osteoporosis, Psoriasis, Rheumatoid Arthritis		Nick Page	URAC	WelldyneRx	Payment assistance, Disease and drug education, 24/7 access, Delivery			Lakeland, FL	Revlimid, Somavert, Aldurazyme, Fabrazyme, Zemaira, Serostim, Aralast, Xolair, Macugen, Exjade, Kuvan, Sabril, Ampyra, Apokyn, Ventavis	Subsidiary	US Specialty Care	PO Box 4517	Colorado
1009	http://www.utahcancer.com	Salt Lake City	UT	84106	--place holder	Oncology		Neil Nebughr 		Independent						Private	Utah Cancer Specialists	3838 South 700 East, Suite 100	Utah
1010	https://www.medicalcenter.virginia.edu/pharmacy	Charlottesville	VA	22908	--place holder	Crohn's Disease, Cystic Fibrosis, Growth Hormone, Hemophilia, Bleeding disorders, Hepatitis, HIV, Immunology, Oncology, Osteoarthritis, Osteoporosis, Psoriac Arthritis, PAH, Rheumatoid Arthritis, Transplantation		Noah Greenberg		University of Virginia Health System	Insurance benefit coordination			5 UVA locations		Subsidiary	UVA Specialty Pharmacy	PO Box 800674	Virginia
1011	https://www.uvmhealth.org/medcenter/pages/departments-and-programs/pharmacy-services/specialty-pharmacy.aspx	Burlington	VT	05401	--place holder	Cardiovascular, Dermatology, Gastroenterology, Hepatology, Infectious Disease, Neurology, Oncology, Rheumatology, Transplantation		Joseph Aloi	URAC	UVM Medical Center	Counseling and education, Biling and claim coordination, Identify patient assistance porgrams	Medication adherence				Subsidiary	UVM Specialty Pharmacy	111 Colchetser Avenue	Vermont
1012	http://myvcarepharmacy.com/	Framingham	MA	01701	--place holder	Bleeding disorders, Crohn's Disease, Hepatitis, HIV, Multiple Sclerosis, Psoriasis, Rheumatoid Arthritis		Hase James	URAC	Independent	Counseling and education, Delivery and refills, Chronic Disease Management, Insurance consultations					Private	V-Care Pharmacy 	151 Cochituate Road	Massachusetts
1013	http://valuedrugs.net/	White Plains	NY	10607	--place holder			Laurence Miressi		Independent				Brewster, NY; Briarcliff, NY; Bronxville, NY; Eastchester, NY; Greenlawn, NY; Huntington, NY; Rockerfeller, NY; Sayville, NY		Private	Valuable Drugs	377 Tarrytown Road	New York
1014	http://www.vsprx.com	Duncansville	PA	16635	--place holder	Oncology, Crohn's Disease, Cystic Fibrosis, Hemophilia, Hepatitis C, HIV, Fertility, Multiple Sclerosis, Transplantation, Psoriasis, Rheumatoid Arthritis		Greg Drew	URAC	Value Drug Company	24x7 support, Insurance verification, Delivery, Prior Authorization processing, Copay assistance and foundation research					Subsidiary	Value Specialty Pharmacy	1333 Plank Road, Suite 200	Pennsylvania
1015	http://www.mc.vanderbilt.edu	Nashville	TN	37232	--place holder	Transplantation, Endocrinology, Cystic Fibrosis, Hemophilia, Hepatitis C, Infectious Disease, IBD, Crohn's Disease, Lipid Specialty, Multiple Sclerosis, Oncology, Hematology, Rheumatology, PAH		Brandon Newman		Vanderbilt Health	Therapy management programs, Counseling and education, Delivery and refill reminders, Financial counseling					Health System	Vanderbilt Specialty Pharmacy	1215 21st Avenue South	Tennessee
1016	https://vascorx.com	Phoenix	AZ	85032	--place holder	Women's Health, Gastroenterology, Rheumatology, HIV, IVIG, Endocrinology, Oncology, Hepatitis, Allergy / Respiratory, Fertility, Urology, Infusion		Ernesto Garza	URAC, ACHC	Independent	Education, Financial Assistance, Delivery					Private	Vasco Rx Pharmacy	4045 E. Bell Rd., Suite 163	Arizona
1017	http://www.villagefertilitypharmacy.com/	Waltham	MA	02451	--place holder	Fertility		Stuart Levine	URAC	Apothecary By Design	Counseling and education, Refills, Insurance specialists			Waltham, MA (2)		Subsidiary	Village Fertility Pharmacy	335 Bear Hill Road	Massachusetts
1018	http://www.vitalcarerx.com	Meridian	MS	39301	--place holder	Arthritis, Crohn's Disease, Psoriasis, Hemophilia, Oncology, Immunology, Multiple Sclerosis, Hepatitis C, HIV, RSV, Cystic Fibrosis		Brad Gilchrist	URAC, ACHC	Independent	24x7 clinical support, Benefits investigation, Counseling and education, Delivery	Payor contracting	Data agreements, Fee-for-service agreements, Limited distribution drugs			Private	Vital Care Rx	1501 23rd Avenue, Suite B	Mississippi
1019	https://www.northwell.edu/vivo-health	New Hyde Park	NY	11042	--place holder	HIV, Hepatitis C, Oncology, Rheumatoid Arthritis, Fertility		David Kim		Northwell Health	Counseling and education, 24-hour clinical call center	Medication therapy management, Prior Authorization assistance	Medication adherence porgrams			Subsidiary	Vivo Health Specialty Pharmacy 	410 Lakeville Road	New York
1020	https://prescriptions.wakehealth.edu/specialty-pharmacy	Winston-Salem	NC	27157	--place holder	Transplantation, HIV, Hepatitis, Rheumatoid Arthritis, Multiple Sclerosis, Oncology, Osteoporosis		Brian Marlow	URAC	Wake Forest Baptist Health	Counseling and education, Delivery					Subsidiary	Wake Forest Baptist Health Specialty Rx	Medical Center Blvd.	North Carolina
1021	http://www.walmartstores.com	Lake Mary	FL	32746	--place holder	Bleeding disorders, Oncology, Crohn's Disease, Cystic Fibrosis, Growth hormone, Hemophilia, Hepatitis, HIV, Fertility, IVIG, Multiple Sclerosis, Osteoporosis, Psoriasis, Rheumatoid Arthritis, Transplantation		Jennifer Emsden	URAC	Walmart Stores	Patient education, Reimbursement and claims assistance, Shipping				Tarceva	Subsidiary	Walmart Specialty Pharmacy	100 Technology Park	Florida
1022	https://www.washingtonfertility.com/	Annandale	VA	22003	--place holder	Fertility		Pierre Asmar		Independent	Education and Counseling, Financial assistance			Rockville, MD; Annandale, VA; Fredericksburg, VA; Reston, VA		Private	Washington Fertility Center	4316 L Evergreen Lane	Virginia
1023	https://www.wegmans.com/pharmacy/specialty-pharmacy.html	Rochester	NY	14624	--place holder	Crohn's Disease, Hepatitis C, Multiple Sclerosis, Psoriasis, Psoriatric Arthritis, Rheumatoid Arthritis, Ulcerative Colitis, IBD, Osteoporosis		Kimberly Elliott		Wegmens Food Stores	Education and Counseling					Subsidiary	Wegmans Specialty Pharmacy	100 Wegmans Market Street	New York
1024	http://www.wellpartner.com	Portland	OR	97224	--place holder	Asthma, Anemia, Autoimmune disorders, Oncology, Crohn's disease, Cystic fibrosis, Dermatology, Gastroenterology, Growth Hormone, Hemolytic disorders, Hemophilia, Hepatitis, Hereditary Angioedema, HIV, Immunology, Fertility, Lupus, Multiple Sclerosis, Osteoarthritis, Osteoporosis, RSV, Retinal disorders, Rheumatoid arthritis, Transplantation, Urology		Harish Thiagaraj	URAC, ACHC	Independent	Therapy management, 24x7 clinical support				Aldurazyme, Cerezyme, Elaprase, Fabrazyme, Lumizyme, Myozyme, Naglayme	Private	Wellpartner, Inc.	7216 South West Durham Road Suite 200 	Oregon
1025	http://wvumedicine.org/	Morgantown	WV	26505	--place holder	Cardiovascular, Dermatology, Gastroenterology, Hepatology, Infectious Disease, Neurology, Oncology, Rheumatology, Transplantation		Louis Sokos		WVU Medicine						Subsidiary	West Virginia University Specialty Pharmacy	1 Medical Center Drive	West Virginia
1026	http://wooripharmacy.com/	Los Angeles	CA	90004	--place holder	Crohn's Disease, Cystic Fibrosis, Psoriasis, Fertility, Gastroenterology, Hemophilia, Hepatitis, HIV, Behavioral Health, Multiple Sclerosis, Oncology, Osteoporosis, Rheumatology, Transplantation		Sang Lee	URAC	Independent	Counseling and education, 24x7 support, Benefit assistance, delivery					Private	Woori Pharmacy	266 S.Harvard Blvd. Ste.120	California
1027	http://ymedical.com/	Irving	TX	75063	--place holder	Immune Globulin, Hepatitis C, Hemophilia, Bleeding Disorders, Growth Hormone, Rheumatoid Arthritis		Jamie Patterson	URAC	Independent	24/7/365 access, dispense and delivery, Reimbursment assistance	Clinical Care protocols, Specialized data management systems				Private	Y Medical Associates	8840 N MacArthur Blvd	Texas
1028	https://www.ynhhs.org/patient-care/outpatient-pharmacy-services.aspx	Hamden	CT	06514	--place holder	Oncology, Hepatitis C, HIV, Cystic Fibrosis, Multiple Sclerosis, Rheumatology, Transplantation		Lorraine Lee		Yale New Haven Health System	24x7 customer support, Delivery and refills, Counseling and education, Insurance assistance					Subsidiary	Yale New Haven Health Outpatient Pharmacy	1100 Sherman Avenue	Connecticut
1029		Bronx	NY	10462	--place holder	HIV		Jerry Zive									Zive Pharmacy & Surgical	811 Lydig Avenue	New York
\.


--
-- Data for Name: spd_subscription_options_access; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.spd_subscription_options_access (id, display) FROM stdin;
1	Pro
2	Basic
3	Multi Basic
4	Multi Pro
\.


--
-- Data for Name: spd_subscription_options_cost; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.spd_subscription_options_cost (id, display, cost) FROM stdin;
1	100	100
2	149	149
3	500	500
4	1000	1000
5	1250	1250
6	3500	3500
7	250	250
8	750	750
9	1250	1250
10	2750	2750
11	3500	3500
12	11500	11500
\.


--
-- Data for Name: spd_subscription_options_duration; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.spd_subscription_options_duration (display, calendar_days) FROM stdin;
7 Days	7
Weekly	7
Monthly	28
Annually	364
\.


--
-- Data for Name: spd_subscription_options_records; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.spd_subscription_options_records (id, display, records) FROM stdin;
1	25	25
2	something 50	50
3	Entire DB	0
4	50	50
\.


--
-- Data for Name: spd_subscription_options_renewable; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.spd_subscription_options_renewable (id, display, is_renewable) FROM stdin;
1	Yes	t
2	No	f
\.


--
-- Data for Name: spd_subscription_options_trial; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.spd_subscription_options_trial (id, display, is_trial) FROM stdin;
1	Yes	t
2	No	f
\.


--
-- Data for Name: spd_subscription_options_user_type; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.spd_subscription_options_user_type (id, display, max_users) FROM stdin;
1	Multi (Max 6)	6
2	Single	1
\.


--
-- Data for Name: spd_subscription_type; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.spd_subscription_type (id, "Access", "Duration", "User_Type", "Records", "Cost", "Renewable", "Trial") FROM stdin;
\.


--
-- Data for Name: spd_test_fk_subscription_type; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.spd_test_fk_subscription_type (id, "Access_id", "Cost_id", "Duration_id", "Records_id", "Renewable_id", "Trial_id", "User_Type_id", "Description", "Active", assigned_name, "Testing") FROM stdin;
6	2	5	4	3	1	2	2	ffsfs	t	5	t
7	1	6	4	3	1	2	2	fsdffsfsd	t	6	t
2	2	1	2	1	1	1	2	asddasdasdsda	t	1	t
3	1	2	2	4	1	1	2	dsfsdfsfdsfsdfsdfsd	t	2	t
4	2	3	3	3	1	1	2	asdasdadad	t	3	t
5	1	4	3	3	1	2	2	adfdfdsfsdf	t	4	t
8	2	7	2	1	1	1	1	asadasasd	t	7	t
9	1	8	2	4	1	1	1	fsfsfs	t	8	t
10	2	9	3	3	1	2	1	qdasdadas	t	9	t
11	1	10	3	3	1	2	1	fsfsfsf	t	10	t
12	2	11	4	3	1	2	1	asdasdas	t	11	t
13	1	12	4	3	1	2	1	asdsadasdasd	t	12	t
\.


--
-- Data for Name: spd_test_subscription_type; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.spd_test_subscription_type (id, "Access", "Duration", "User_Type", "Records", "Cost", "Renewable", "Trial", "Description") FROM stdin;
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: spd_web_django_local
--

COPY public.users_user (email, password, first_name, last_name, org_name, org_type, org_age, org_location, org_leadership_ethnicity) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 54, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 4, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 58, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 41, true);


--
-- Name: spd_pharmacies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.spd_pharmacies_id_seq', 1029, true);


--
-- Name: spd_subscription_options_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.spd_subscription_options_access_id_seq', 4, true);


--
-- Name: spd_subscription_options_cost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.spd_subscription_options_cost_id_seq', 12, true);


--
-- Name: spd_subscription_options_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.spd_subscription_options_records_id_seq', 4, true);


--
-- Name: spd_subscription_options_renewable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.spd_subscription_options_renewable_id_seq', 2, true);


--
-- Name: spd_subscription_options_trial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.spd_subscription_options_trial_id_seq', 2, true);


--
-- Name: spd_subscription_options_user_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.spd_subscription_options_user_type_id_seq', 2, true);


--
-- Name: spd_subscription_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.spd_subscription_type_id_seq', 1, false);


--
-- Name: spd_test_fk_subscription_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.spd_test_fk_subscription_type_id_seq', 13, true);


--
-- Name: spd_test_subscription_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spd_web_django_local
--

SELECT pg_catalog.setval('public.spd_test_subscription_type_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: spd_pharmacies spd_pharmacies_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_pharmacies
    ADD CONSTRAINT spd_pharmacies_pkey PRIMARY KEY (id);


--
-- Name: spd_subscription_options_access spd_subscription_options_access_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_subscription_options_access
    ADD CONSTRAINT spd_subscription_options_access_pkey PRIMARY KEY (id);


--
-- Name: spd_subscription_options_cost spd_subscription_options_cost_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_subscription_options_cost
    ADD CONSTRAINT spd_subscription_options_cost_pkey PRIMARY KEY (id);


--
-- Name: spd_subscription_options_duration spd_subscription_options_duration_display_a170ba65_pk; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_subscription_options_duration
    ADD CONSTRAINT spd_subscription_options_duration_display_a170ba65_pk PRIMARY KEY (display);


--
-- Name: spd_subscription_options_duration spd_subscription_options_duration_display_a170ba65_uniq; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_subscription_options_duration
    ADD CONSTRAINT spd_subscription_options_duration_display_a170ba65_uniq UNIQUE (display);


--
-- Name: spd_subscription_options_records spd_subscription_options_records_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_subscription_options_records
    ADD CONSTRAINT spd_subscription_options_records_pkey PRIMARY KEY (id);


--
-- Name: spd_subscription_options_renewable spd_subscription_options_renewable_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_subscription_options_renewable
    ADD CONSTRAINT spd_subscription_options_renewable_pkey PRIMARY KEY (id);


--
-- Name: spd_subscription_options_trial spd_subscription_options_trial_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_subscription_options_trial
    ADD CONSTRAINT spd_subscription_options_trial_pkey PRIMARY KEY (id);


--
-- Name: spd_subscription_options_user_type spd_subscription_options_user_type_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_subscription_options_user_type
    ADD CONSTRAINT spd_subscription_options_user_type_pkey PRIMARY KEY (id);


--
-- Name: spd_subscription_type spd_subscription_type_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_subscription_type
    ADD CONSTRAINT spd_subscription_type_pkey PRIMARY KEY (id);


--
-- Name: spd_test_fk_subscription_type spd_test_fk_subscription_type_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_test_fk_subscription_type
    ADD CONSTRAINT spd_test_fk_subscription_type_pkey PRIMARY KEY (id);


--
-- Name: spd_test_subscription_type spd_test_subscription_type_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_test_subscription_type
    ADD CONSTRAINT spd_test_subscription_type_pkey PRIMARY KEY (id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (email);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: spd_subscription_options_duration_display_a170ba65_like; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX spd_subscription_options_duration_display_a170ba65_like ON public.spd_subscription_options_duration USING btree (display varchar_pattern_ops);


--
-- Name: spd_test_fk_subscription_type_Access_id_a8281656; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX "spd_test_fk_subscription_type_Access_id_a8281656" ON public.spd_test_fk_subscription_type USING btree ("Access_id");


--
-- Name: spd_test_fk_subscription_type_Cost_id_10cd7e6e; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX "spd_test_fk_subscription_type_Cost_id_10cd7e6e" ON public.spd_test_fk_subscription_type USING btree ("Cost_id");


--
-- Name: spd_test_fk_subscription_type_Duration_id_0d407f5d; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX "spd_test_fk_subscription_type_Duration_id_0d407f5d" ON public.spd_test_fk_subscription_type USING btree ("Duration_id");


--
-- Name: spd_test_fk_subscription_type_Records_id_b7d594f3; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX "spd_test_fk_subscription_type_Records_id_b7d594f3" ON public.spd_test_fk_subscription_type USING btree ("Records_id");


--
-- Name: spd_test_fk_subscription_type_Renewable_id_bfde05dc; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX "spd_test_fk_subscription_type_Renewable_id_bfde05dc" ON public.spd_test_fk_subscription_type USING btree ("Renewable_id");


--
-- Name: spd_test_fk_subscription_type_Trial_id_997c0925; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX "spd_test_fk_subscription_type_Trial_id_997c0925" ON public.spd_test_fk_subscription_type USING btree ("Trial_id");


--
-- Name: spd_test_fk_subscription_type_User_Type_id_327860e2; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX "spd_test_fk_subscription_type_User_Type_id_327860e2" ON public.spd_test_fk_subscription_type USING btree ("User_Type_id");


--
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: spd_web_django_local
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: spd_test_fk_subscription_type spd_test_fk_subscrip_Access_id_a8281656_fk_spd_subsc; Type: FK CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_test_fk_subscription_type
    ADD CONSTRAINT "spd_test_fk_subscrip_Access_id_a8281656_fk_spd_subsc" FOREIGN KEY ("Access_id") REFERENCES public.spd_subscription_options_access(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: spd_test_fk_subscription_type spd_test_fk_subscrip_Cost_id_10cd7e6e_fk_spd_subsc; Type: FK CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_test_fk_subscription_type
    ADD CONSTRAINT "spd_test_fk_subscrip_Cost_id_10cd7e6e_fk_spd_subsc" FOREIGN KEY ("Cost_id") REFERENCES public.spd_subscription_options_cost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: spd_test_fk_subscription_type spd_test_fk_subscrip_Records_id_b7d594f3_fk_spd_subsc; Type: FK CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_test_fk_subscription_type
    ADD CONSTRAINT "spd_test_fk_subscrip_Records_id_b7d594f3_fk_spd_subsc" FOREIGN KEY ("Records_id") REFERENCES public.spd_subscription_options_records(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: spd_test_fk_subscription_type spd_test_fk_subscrip_Renewable_id_bfde05dc_fk_spd_subsc; Type: FK CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_test_fk_subscription_type
    ADD CONSTRAINT "spd_test_fk_subscrip_Renewable_id_bfde05dc_fk_spd_subsc" FOREIGN KEY ("Renewable_id") REFERENCES public.spd_subscription_options_renewable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: spd_test_fk_subscription_type spd_test_fk_subscrip_Trial_id_997c0925_fk_spd_subsc; Type: FK CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_test_fk_subscription_type
    ADD CONSTRAINT "spd_test_fk_subscrip_Trial_id_997c0925_fk_spd_subsc" FOREIGN KEY ("Trial_id") REFERENCES public.spd_subscription_options_trial(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: spd_test_fk_subscription_type spd_test_fk_subscrip_User_Type_id_327860e2_fk_spd_subsc; Type: FK CONSTRAINT; Schema: public; Owner: spd_web_django_local
--

ALTER TABLE ONLY public.spd_test_fk_subscription_type
    ADD CONSTRAINT "spd_test_fk_subscrip_User_Type_id_327860e2_fk_spd_subsc" FOREIGN KEY ("User_Type_id") REFERENCES public.spd_subscription_options_user_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

