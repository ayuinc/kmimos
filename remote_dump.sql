--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: accepted_behaviors; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE accepted_behaviors (
    id integer NOT NULL,
    provider_id integer,
    behavior_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE accepted_behaviors OWNER TO nsebzzaeuiubut;

--
-- Name: accepted_behaviors_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE accepted_behaviors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE accepted_behaviors_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: accepted_behaviors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE accepted_behaviors_id_seq OWNED BY accepted_behaviors.id;


--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE active_admin_comments (
    id integer NOT NULL,
    namespace character varying(255),
    body text,
    resource_id character varying(255) NOT NULL,
    resource_type character varying(255) NOT NULL,
    author_id integer,
    author_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE active_admin_comments OWNER TO nsebzzaeuiubut;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE active_admin_comments_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: add_user_id_to_testimonies; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE add_user_id_to_testimonies (
    id integer NOT NULL,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE add_user_id_to_testimonies OWNER TO nsebzzaeuiubut;

--
-- Name: add_user_id_to_testimonies_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE add_user_id_to_testimonies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE add_user_id_to_testimonies_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: add_user_id_to_testimonies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE add_user_id_to_testimonies_id_seq OWNED BY add_user_id_to_testimonies.id;


--
-- Name: additional_services; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE additional_services (
    id integer NOT NULL,
    service_id integer,
    provider_id integer,
    size_id integer,
    price double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE additional_services OWNER TO nsebzzaeuiubut;

--
-- Name: additional_services_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE additional_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE additional_services_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: additional_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE additional_services_id_seq OWNED BY additional_services.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE admin_users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE admin_users OWNER TO nsebzzaeuiubut;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin_users_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE admin_users_id_seq OWNED BY admin_users.id;


--
-- Name: ages; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE ages (
    id integer NOT NULL,
    age_group_name character varying(255)
);


ALTER TABLE ages OWNER TO nsebzzaeuiubut;

--
-- Name: ages_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE ages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ages_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: ages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE ages_id_seq OWNED BY ages.id;


--
-- Name: agings; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE agings (
    id integer NOT NULL,
    provider_id integer,
    age_id integer
);


ALTER TABLE agings OWNER TO nsebzzaeuiubut;

--
-- Name: agings_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE agings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE agings_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: agings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE agings_id_seq OWNED BY agings.id;


--
-- Name: behaviors; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE behaviors (
    id integer NOT NULL,
    behavior_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    pet_id integer
);


ALTER TABLE behaviors OWNER TO nsebzzaeuiubut;

--
-- Name: behaviors_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE behaviors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE behaviors_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: behaviors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE behaviors_id_seq OWNED BY behaviors.id;


--
-- Name: booked_pets; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE booked_pets (
    id integer NOT NULL,
    booking_id integer,
    pet_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE booked_pets OWNER TO nsebzzaeuiubut;

--
-- Name: booked_pets_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE booked_pets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE booked_pets_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: booked_pets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE booked_pets_id_seq OWNED BY booked_pets.id;


--
-- Name: booked_services; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE booked_services (
    id integer NOT NULL,
    booking_id integer,
    service_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    pet_id integer
);


ALTER TABLE booked_services OWNER TO nsebzzaeuiubut;

--
-- Name: booked_services_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE booked_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE booked_services_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: booked_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE booked_services_id_seq OWNED BY booked_services.id;


--
-- Name: bookings; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE bookings (
    id integer NOT NULL,
    start_date date,
    end_date date,
    provider_id integer,
    user_first_name character varying(255),
    user_last_name character varying(255),
    user_phone character varying(255),
    user_email character varying(255),
    user_message character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    ref_code character varying(255),
    raza character varying(255),
    edad character varying(255),
    cuidado_especial text,
    token character varying(255),
    address character varying(255),
    pickup_time timestamp without time zone,
    dropoff_time timestamp without time zone,
    pet_name character varying(255),
    user_id integer,
    total double precision
);


ALTER TABLE bookings OWNER TO nsebzzaeuiubut;

--
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bookings_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE bookings_id_seq OWNED BY bookings.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE categories OWNER TO nsebzzaeuiubut;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: comment_valuations; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE comment_valuations (
    id integer NOT NULL,
    comment_id integer,
    valuation_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    value integer
);


ALTER TABLE comment_valuations OWNER TO nsebzzaeuiubut;

--
-- Name: comment_valuations_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE comment_valuations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comment_valuations_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: comment_valuations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE comment_valuations_id_seq OWNED BY comment_valuations.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    user_id integer,
    provider_id integer,
    title character varying(255),
    body text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE comments OWNER TO nsebzzaeuiubut;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE countries (
    id integer NOT NULL,
    name character varying(255),
    locale character varying(255),
    currency character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    phone character varying(255),
    facebook character varying(255),
    twitter character varying(255),
    flag character varying(255),
    domain character varying(255),
    dni_length integer,
    dni_label character varying(255)
);


ALTER TABLE countries OWNER TO nsebzzaeuiubut;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE favorites (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    provider_id integer,
    user_id integer
);


ALTER TABLE favorites OWNER TO nsebzzaeuiubut;

--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE favorites_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE favorites_id_seq OWNED BY favorites.id;


--
-- Name: localizations; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE localizations (
    id integer NOT NULL,
    provider_id integer,
    location_id integer,
    user_id integer
);


ALTER TABLE localizations OWNER TO nsebzzaeuiubut;

--
-- Name: localizations_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE localizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE localizations_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: localizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE localizations_id_seq OWNED BY localizations.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    name character varying(255),
    state_id integer,
    utf_name character varying(255)
);


ALTER TABLE locations OWNER TO nsebzzaeuiubut;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE locations_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: meetings; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE meetings (
    id integer NOT NULL,
    provider_id integer,
    user_first_name character varying(255),
    user_last_name character varying(255),
    user_phone character varying(255),
    user_email character varying(255),
    token character varying(255)
);


ALTER TABLE meetings OWNER TO nsebzzaeuiubut;

--
-- Name: meetings_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE meetings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE meetings_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: meetings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE meetings_id_seq OWNED BY meetings.id;


--
-- Name: own_sizings; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE own_sizings (
    id integer NOT NULL,
    provider_id integer,
    size_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE own_sizings OWNER TO nsebzzaeuiubut;

--
-- Name: own_sizings_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE own_sizings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE own_sizings_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: own_sizings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE own_sizings_id_seq OWNED BY own_sizings.id;


--
-- Name: pet_behaviors; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE pet_behaviors (
    id integer NOT NULL,
    behavior_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    provider_id integer,
    behavior_id integer
);


ALTER TABLE pet_behaviors OWNER TO nsebzzaeuiubut;

--
-- Name: pet_behaviors_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE pet_behaviors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pet_behaviors_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: pet_behaviors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE pet_behaviors_id_seq OWNED BY pet_behaviors.id;


--
-- Name: pets; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE pets (
    id integer NOT NULL,
    name character varying(255),
    weight double precision,
    sex character varying(255),
    behavior_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer,
    photo_updated_at timestamp without time zone,
    size_id integer,
    race_id integer,
    weight_id integer,
    age_id integer
);


ALTER TABLE pets OWNER TO nsebzzaeuiubut;

--
-- Name: pets_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE pets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pets_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: pets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE pets_id_seq OWNED BY pets.id;


--
-- Name: promotional_codes; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE promotional_codes (
    id integer NOT NULL,
    code character varying(255),
    expire_at timestamp without time zone,
    state character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE promotional_codes OWNER TO nsebzzaeuiubut;

--
-- Name: promotional_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE promotional_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE promotional_codes_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: promotional_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE promotional_codes_id_seq OWNED BY promotional_codes.id;


--
-- Name: properties; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE properties (
    id integer NOT NULL,
    property_name character varying(255)
);


ALTER TABLE properties OWNER TO nsebzzaeuiubut;

--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE properties_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE properties_id_seq OWNED BY properties.id;


--
-- Name: provider_attachments; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE provider_attachments (
    id integer NOT NULL,
    provider_id integer,
    photo character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE provider_attachments OWNER TO nsebzzaeuiubut;

--
-- Name: provider_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE provider_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE provider_attachments_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: provider_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE provider_attachments_id_seq OWNED BY provider_attachments.id;


--
-- Name: providers; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE providers (
    id integer NOT NULL,
    name character varying(255),
    last_name_1 character varying(255),
    last_name_2 character varying(255),
    dni character varying(255),
    email character varying(255),
    category_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    password_digest character varying(255),
    avg_rating double precision,
    phone character varying(255),
    description text,
    email_c character varying(255),
    avatar character varying(255),
    price double precision,
    areas_externas character varying(255),
    emergencia boolean,
    experiencia integer,
    iframe_code text,
    property_id integer,
    active boolean DEFAULT true,
    latitude character varying(255),
    longitude character varying(255),
    address character varying(255),
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    has_other_pets boolean,
    number_of_pets integer,
    pets_allowed integer,
    has_green boolean,
    has_yard boolean,
    pet_behavior_id integer,
    on_top boolean,
    check_in time without time zone,
    check_out time without time zone,
    is_favorite boolean,
    behaviors_accepted character varying(255),
    behavior_id integer,
    only_sterilizated boolean
);


ALTER TABLE providers OWNER TO nsebzzaeuiubut;

--
-- Name: providers_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE providers_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE providers_id_seq OWNED BY providers.id;


--
-- Name: races; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE races (
    id integer NOT NULL,
    race_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE races OWNER TO nsebzzaeuiubut;

--
-- Name: races_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE races_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE races_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: races_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE races_id_seq OWNED BY races.id;


--
-- Name: rates; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE rates (
    id integer NOT NULL,
    provider_id integer,
    size_id integer,
    price double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE rates OWNER TO nsebzzaeuiubut;

--
-- Name: rates_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rates_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE rates_id_seq OWNED BY rates.id;


--
-- Name: referrals; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE referrals (
    id integer NOT NULL,
    code_value character varying(255),
    referrer_name character varying(255),
    referrer_email character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE referrals OWNER TO nsebzzaeuiubut;

--
-- Name: referrals_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE referrals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE referrals_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: referrals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE referrals_id_seq OWNED BY referrals.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE schema_migrations OWNER TO nsebzzaeuiubut;

--
-- Name: services; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE services (
    id integer NOT NULL,
    service_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE services OWNER TO nsebzzaeuiubut;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE services_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE services_id_seq OWNED BY services.id;


--
-- Name: sizes; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE sizes (
    id integer NOT NULL,
    size_title character varying(255),
    min_size double precision,
    max_size double precision,
    description character varying(255),
    symbol character varying(255)
);


ALTER TABLE sizes OWNER TO nsebzzaeuiubut;

--
-- Name: sizes_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE sizes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sizes_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: sizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE sizes_id_seq OWNED BY sizes.id;


--
-- Name: sizings; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE sizings (
    id integer NOT NULL,
    provider_id integer,
    size_id integer,
    additional_service_id integer
);


ALTER TABLE sizings OWNER TO nsebzzaeuiubut;

--
-- Name: sizings_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE sizings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sizings_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: sizings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE sizings_id_seq OWNED BY sizings.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE states (
    id integer NOT NULL,
    name character varying(255),
    country_id integer
);


ALTER TABLE states OWNER TO nsebzzaeuiubut;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE states_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE states_id_seq OWNED BY states.id;


--
-- Name: testimonies; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE testimonies (
    id integer NOT NULL,
    body text,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE testimonies OWNER TO nsebzzaeuiubut;

--
-- Name: testimonies_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE testimonies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE testimonies_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: testimonies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE testimonies_id_seq OWNED BY testimonies.id;


--
-- Name: user_pets; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE user_pets (
    id integer NOT NULL,
    user_id integer,
    pet_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE user_pets OWNER TO nsebzzaeuiubut;

--
-- Name: user_pets_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE user_pets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_pets_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: user_pets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE user_pets_id_seq OWNED BY user_pets.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    phone character varying(255),
    location_id integer,
    postal_code character varying(255),
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer,
    photo_updated_at timestamp without time zone,
    address text,
    state_name character varying(255),
    place_name character varying(255),
    confirmation_token character varying(255),
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying(255)
);


ALTER TABLE users OWNER TO nsebzzaeuiubut;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: valuations; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE valuations (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE valuations OWNER TO nsebzzaeuiubut;

--
-- Name: valuations_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE valuations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE valuations_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: valuations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE valuations_id_seq OWNED BY valuations.id;


--
-- Name: weights; Type: TABLE; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE TABLE weights (
    id integer NOT NULL,
    name character varying(255),
    min_weight double precision,
    max_weight double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE weights OWNER TO nsebzzaeuiubut;

--
-- Name: weights_id_seq; Type: SEQUENCE; Schema: public; Owner: nsebzzaeuiubut
--

CREATE SEQUENCE weights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE weights_id_seq OWNER TO nsebzzaeuiubut;

--
-- Name: weights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nsebzzaeuiubut
--

ALTER SEQUENCE weights_id_seq OWNED BY weights.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY accepted_behaviors ALTER COLUMN id SET DEFAULT nextval('accepted_behaviors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY add_user_id_to_testimonies ALTER COLUMN id SET DEFAULT nextval('add_user_id_to_testimonies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY additional_services ALTER COLUMN id SET DEFAULT nextval('additional_services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY ages ALTER COLUMN id SET DEFAULT nextval('ages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY agings ALTER COLUMN id SET DEFAULT nextval('agings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY behaviors ALTER COLUMN id SET DEFAULT nextval('behaviors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY booked_pets ALTER COLUMN id SET DEFAULT nextval('booked_pets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY booked_services ALTER COLUMN id SET DEFAULT nextval('booked_services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY bookings ALTER COLUMN id SET DEFAULT nextval('bookings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY comment_valuations ALTER COLUMN id SET DEFAULT nextval('comment_valuations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY favorites ALTER COLUMN id SET DEFAULT nextval('favorites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY localizations ALTER COLUMN id SET DEFAULT nextval('localizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY meetings ALTER COLUMN id SET DEFAULT nextval('meetings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY own_sizings ALTER COLUMN id SET DEFAULT nextval('own_sizings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY pet_behaviors ALTER COLUMN id SET DEFAULT nextval('pet_behaviors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY pets ALTER COLUMN id SET DEFAULT nextval('pets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY promotional_codes ALTER COLUMN id SET DEFAULT nextval('promotional_codes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY properties ALTER COLUMN id SET DEFAULT nextval('properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY provider_attachments ALTER COLUMN id SET DEFAULT nextval('provider_attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY providers ALTER COLUMN id SET DEFAULT nextval('providers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY races ALTER COLUMN id SET DEFAULT nextval('races_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY rates ALTER COLUMN id SET DEFAULT nextval('rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY referrals ALTER COLUMN id SET DEFAULT nextval('referrals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY services ALTER COLUMN id SET DEFAULT nextval('services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY sizes ALTER COLUMN id SET DEFAULT nextval('sizes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY sizings ALTER COLUMN id SET DEFAULT nextval('sizings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY states ALTER COLUMN id SET DEFAULT nextval('states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY testimonies ALTER COLUMN id SET DEFAULT nextval('testimonies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY user_pets ALTER COLUMN id SET DEFAULT nextval('user_pets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY valuations ALTER COLUMN id SET DEFAULT nextval('valuations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nsebzzaeuiubut
--

ALTER TABLE ONLY weights ALTER COLUMN id SET DEFAULT nextval('weights_id_seq'::regclass);


--
-- Data for Name: accepted_behaviors; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY accepted_behaviors (id, provider_id, behavior_id, created_at, updated_at) FROM stdin;
5	1	2	2015-11-05 01:34:49.769605	2015-11-05 01:34:49.769605
6	1	4	2015-11-05 01:34:49.77412	2015-11-05 01:34:49.77412
7	181	3	2015-11-07 10:53:22.773267	2015-11-07 10:53:22.773267
8	181	4	2015-11-07 10:53:22.775534	2015-11-07 10:53:22.775534
9	182	2	2015-11-07 13:15:47.285632	2015-11-07 13:15:47.285632
10	182	3	2015-11-07 13:15:47.289518	2015-11-07 13:15:47.289518
11	182	4	2015-11-07 13:15:47.291391	2015-11-07 13:15:47.291391
12	183	2	2015-11-07 14:58:49.720919	2015-11-07 14:58:49.720919
13	183	3	2015-11-07 14:58:49.722985	2015-11-07 14:58:49.722985
14	183	1	2015-11-07 14:58:49.725306	2015-11-07 14:58:49.725306
15	183	4	2015-11-07 14:58:49.728835	2015-11-07 14:58:49.728835
16	184	2	2015-11-07 15:19:57.659742	2015-11-07 15:19:57.659742
17	184	3	2015-11-07 15:19:57.662766	2015-11-07 15:19:57.662766
\.


--
-- Name: accepted_behaviors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('accepted_behaviors_id_seq', 17, true);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY active_admin_comments (id, namespace, body, resource_id, resource_type, author_id, author_type, created_at, updated_at) FROM stdin;
1	admin	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.	1	Provider	1	AdminUser	2015-10-17 06:46:12.526118	2015-10-17 06:46:12.526118
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('active_admin_comments_id_seq', 2, false);


--
-- Data for Name: add_user_id_to_testimonies; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY add_user_id_to_testimonies (id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: add_user_id_to_testimonies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('add_user_id_to_testimonies_id_seq', 1, false);


--
-- Data for Name: additional_services; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY additional_services (id, service_id, provider_id, size_id, price, created_at, updated_at) FROM stdin;
1	1	1	\N	40	2015-10-17 06:40:41.893501	2015-11-02 22:16:35.503391
5	2	1	\N	10	2015-11-05 05:44:53.676799	2015-11-05 05:44:53.676799
6	5	1	\N	30	2015-11-05 05:44:53.693806	2015-11-05 05:44:53.693806
10	6	181	\N	56	2015-11-07 10:53:22.587171	2015-11-07 10:53:22.587171
11	1	182	\N	34	2015-11-07 13:15:47.169951	2015-11-07 13:15:47.169951
12	5	182	\N	43	2015-11-07 13:15:47.182477	2015-11-07 13:15:47.182477
13	1	183	\N	100	2015-11-07 14:58:49.702557	2015-11-07 14:58:49.702557
14	1	183	\N	150	2015-11-07 14:58:49.711353	2015-11-07 14:58:49.711353
15	1	184	\N	10	2015-11-07 15:19:57.61818	2015-11-07 15:19:57.61818
16	2	184	\N	20	2015-11-07 15:19:57.639459	2015-11-07 15:19:57.639459
17	13	1	\N	344	2015-11-12 04:54:03.681829	2015-11-12 04:54:03.681829
\.


--
-- Name: additional_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('additional_services_id_seq', 17, true);


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
1	admin@example.com	$2a$10$ZgOoFICQgzYjYt6QV1YEIeVeTTG6lZMVYrURweBfPypDUPX/qEYOu	\N	\N	\N	18	2015-11-07 06:28:41.870872	2015-11-06 17:46:08.119522	190.236.100.159	190.236.100.159	2015-10-16 18:07:28.860976	2015-11-07 06:28:41.873793
\.


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('admin_users_id_seq', 2, false);


--
-- Data for Name: ages; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY ages (id, age_group_name) FROM stdin;
1	Adultos
2	Cachorros
\.


--
-- Name: ages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('ages_id_seq', 3, false);


--
-- Data for Name: agings; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY agings (id, provider_id, age_id) FROM stdin;
219	19	1
220	19	2
221	28	2
222	59	1
223	59	2
224	43	1
225	43	2
226	8	1
227	8	2
228	15	1
15	15	2
16	56	1
17	56	2
18	55	1
19	55	2
20	28	1
21	54	1
22	54	2
23	53	1
24	53	2
25	60	1
26	60	2
27	61	1
28	61	2
29	62	1
30	64	1
31	64	2
32	65	1
33	65	2
34	66	1
35	66	2
36	67	1
40	69	1
41	69	2
42	70	1
43	70	2
44	71	1
45	71	2
51	74	2
52	75	1
53	75	2
54	76	1
55	76	2
57	77	2
60	79	1
61	79	2
62	82	1
63	82	2
65	83	2
66	84	2
67	85	1
68	85	2
69	86	1
72	88	1
73	88	2
76	90	1
77	90	2
78	91	1
79	91	2
82	93	1
83	93	2
86	96	1
87	96	2
88	97	1
89	97	2
90	98	1
91	98	2
93	99	2
94	100	1
95	100	2
96	101	1
97	102	1
98	102	2
99	103	1
100	103	2
103	105	1
104	105	2
136	138	1
137	138	2
154	149	2
156	152	2
157	153	1
158	153	2
163	156	1
164	156	2
165	157	1
167	158	1
168	158	2
169	159	1
170	159	2
171	160	1
172	160	2
173	161	1
174	162	1
175	162	2
176	163	1
177	163	2
178	164	1
179	164	2
180	166	1
181	166	2
188	170	1
189	170	2
190	171	1
191	171	2
194	173	1
200	176	1
201	176	2
202	177	1
203	177	2
207	179	2
208	180	1
213	183	1
214	183	2
215	185	1
217	186	1
218	187	2
2	1	1
1	184	2
37	67	2
50	74	1
64	83	1
92	99	1
152	148	2
153	149	1
155	152	1
195	173	2
216	185	2
56	77	1
85	95	1
138	139	1
141	142	1
142	142	2
145	144	1
146	144	2
149	147	1
150	147	2
151	148	1
\.


--
-- Name: agings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('agings_id_seq', 229, false);


--
-- Data for Name: behaviors; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY behaviors (id, behavior_name, created_at, updated_at, pet_id) FROM stdin;
2	Social	\N	\N	\N
3	Antisocial	\N	\N	\N
1	Agresivo con otros perros	\N	\N	\N
4	Agresivo con humanos	\N	\N	\N
\.


--
-- Name: behaviors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('behaviors_id_seq', 5, false);


--
-- Data for Name: booked_pets; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY booked_pets (id, booking_id, pet_id, created_at, updated_at) FROM stdin;
1	179	1	2015-10-23 23:59:19.329617	2015-10-23 23:59:19.329617
2	181	2	2015-10-28 06:01:11.94463	2015-10-28 06:01:11.94463
3	182	4	2015-11-02 21:32:19.455473	2015-11-02 21:32:19.455473
4	184	0	2015-11-03 17:22:48.426344	2015-11-03 17:22:48.426344
5	186	7	2015-11-05 04:44:44.229533	2015-11-05 04:44:44.229533
6	187	7	2015-11-05 04:45:36.11671	2015-11-05 04:45:36.11671
7	188	7	2015-11-05 04:49:29.054558	2015-11-05 04:49:29.054558
8	190	7	2015-11-05 05:19:40.437802	2015-11-05 05:19:40.437802
9	190	8	2015-11-05 05:19:40.440106	2015-11-05 05:19:40.440106
10	191	7	2015-11-05 05:35:44.843664	2015-11-05 05:35:44.843664
11	191	8	2015-11-05 05:35:44.84936	2015-11-05 05:35:44.84936
12	192	7	2015-11-05 05:52:34.328278	2015-11-05 05:52:34.328278
13	192	8	2015-11-05 05:52:34.330807	2015-11-05 05:52:34.330807
14	193	7	2015-11-05 06:06:34.04789	2015-11-05 06:06:34.04789
15	194	8	2015-11-05 14:56:01.784601	2015-11-05 14:56:01.784601
16	195	7	2015-11-05 20:02:40.731961	2015-11-05 20:02:40.731961
17	196	0	2015-11-05 22:32:47.950274	2015-11-05 22:32:47.950274
18	197	10	2015-11-05 22:43:25.334803	2015-11-05 22:43:25.334803
19	198	10	2015-11-05 22:54:23.8608	2015-11-05 22:54:23.8608
20	199	10	2015-11-05 22:55:45.288009	2015-11-05 22:55:45.288009
21	200	7	2015-11-07 04:11:45.081956	2015-11-07 04:11:45.081956
22	201	8	2015-11-07 05:34:46.21058	2015-11-07 05:34:46.21058
23	201	7	2015-11-07 05:34:46.21528	2015-11-07 05:34:46.21528
24	202	7	2015-11-07 07:38:57.859244	2015-11-07 07:38:57.859244
25	203	7	2015-11-07 08:24:55.282969	2015-11-07 08:24:55.282969
26	204	8	2015-11-07 09:53:35.264115	2015-11-07 09:53:35.264115
27	204	7	2015-11-07 09:53:35.269373	2015-11-07 09:53:35.269373
28	205	7	2015-11-07 10:09:05.293021	2015-11-07 10:09:05.293021
29	205	8	2015-11-07 10:09:05.298443	2015-11-07 10:09:05.298443
30	206	14	2015-11-07 12:31:07.564387	2015-11-07 12:31:07.564387
31	207	14	2015-11-07 12:34:28.141662	2015-11-07 12:34:28.141662
32	208	15	2015-11-07 13:20:18.678074	2015-11-07 13:20:18.678074
33	209	14	2015-11-07 14:19:18.665253	2015-11-07 14:19:18.665253
34	210	14	2015-11-07 14:22:46.324873	2015-11-07 14:22:46.324873
35	211	14	2015-11-07 14:51:47.375837	2015-11-07 14:51:47.375837
36	212	14	2015-11-07 15:02:49.819735	2015-11-07 15:02:49.819735
37	213	18	2015-11-07 15:11:30.246007	2015-11-07 15:11:30.246007
38	214	18	2015-11-07 15:23:35.500801	2015-11-07 15:23:35.500801
39	215	18	2015-11-07 16:44:05.032909	2015-11-07 16:44:05.032909
40	216	18	2015-11-07 16:57:13.266714	2015-11-07 16:57:13.266714
41	217	18	2015-11-07 17:05:51.259366	2015-11-07 17:05:51.259366
42	218	18	2015-11-09 15:09:27.533652	2015-11-09 15:09:27.533652
43	219	16	2015-11-09 21:36:05.399268	2015-11-09 21:36:05.399268
44	219	17	2015-11-09 21:36:05.602469	2015-11-09 21:36:05.602469
45	220	16	2015-11-10 02:18:55.081491	2015-11-10 02:18:55.081491
46	220	17	2015-11-10 02:18:55.08618	2015-11-10 02:18:55.08618
47	221	14	2015-11-11 12:36:23.012708	2015-11-11 12:36:23.012708
48	222	14	2015-11-11 23:17:33.72142	2015-11-11 23:17:33.72142
49	223	14	2015-11-11 23:29:16.337524	2015-11-11 23:29:16.337524
50	224	14	2015-11-11 23:30:20.465699	2015-11-11 23:30:20.465699
51	225	14	2015-11-12 00:21:50.461995	2015-11-12 00:21:50.461995
52	226	14	2015-11-12 00:27:33.984281	2015-11-12 00:27:33.984281
53	227	14	2015-11-12 02:32:44.273518	2015-11-12 02:32:44.273518
54	229	14	2015-11-12 02:46:46.309922	2015-11-12 02:46:46.309922
55	230	14	2015-11-12 02:58:58.598438	2015-11-12 02:58:58.598438
56	231	14	2015-11-12 03:01:34.048294	2015-11-12 03:01:34.048294
57	232	14	2015-11-12 03:14:04.22063	2015-11-12 03:14:04.22063
58	233	14	2015-11-12 03:32:41.618788	2015-11-12 03:32:41.618788
59	234	14	2015-11-12 03:46:26.375336	2015-11-12 03:46:26.375336
60	235	14	2015-11-12 06:17:52.149363	2015-11-12 06:17:52.149363
\.


--
-- Name: booked_pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('booked_pets_id_seq', 60, true);


--
-- Data for Name: booked_services; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY booked_services (id, booking_id, service_id, created_at, updated_at, pet_id) FROM stdin;
1	179	1	2015-10-23 23:59:19.334754	2015-10-23 23:59:19.334754	\N
2	179	4	2015-10-23 23:59:19.339738	2015-10-23 23:59:19.339738	\N
3	186	1	2015-11-05 04:44:44.239944	2015-11-05 04:44:44.239944	0
4	190	1	2015-11-05 05:19:40.441701	2015-11-05 05:19:40.441701	7
5	190	3	2015-11-05 05:19:40.444287	2015-11-05 05:19:40.444287	8
6	191	1	2015-11-05 05:35:44.852208	2015-11-05 05:35:44.852208	7
7	191	3	2015-11-05 05:35:44.857609	2015-11-05 05:35:44.857609	8
8	191	1	2015-11-05 05:35:44.861219	2015-11-05 05:35:44.861219	8
9	192	1	2015-11-05 05:52:34.333321	2015-11-05 05:52:34.333321	7
10	192	3	2015-11-05 05:52:34.335702	2015-11-05 05:52:34.335702	8
11	193	1	2015-11-05 06:06:34.051022	2015-11-05 06:06:34.051022	8
12	194	9	2015-11-05 14:56:01.788932	2015-11-05 14:56:01.788932	7
13	196	1	2015-11-05 22:32:47.954776	2015-11-05 22:32:47.954776	10
14	197	1	2015-11-05 22:43:25.337367	2015-11-05 22:43:25.337367	10
15	198	1	2015-11-05 22:54:23.863464	2015-11-05 22:54:23.863464	10
16	200	1	2015-11-07 04:11:45.084673	2015-11-07 04:11:45.084673	7
17	201	1	2015-11-07 05:34:46.217887	2015-11-07 05:34:46.217887	7
18	201	2	2015-11-07 05:34:46.222488	2015-11-07 05:34:46.222488	8
19	203	11	2015-11-07 08:24:55.291521	2015-11-07 08:24:55.291521	7
20	203	12	2015-11-07 08:24:55.295457	2015-11-07 08:24:55.295457	7
21	204	1	2015-11-07 09:53:35.273614	2015-11-07 09:53:35.273614	7
22	204	2	2015-11-07 09:53:35.280112	2015-11-07 09:53:35.280112	8
23	205	1	2015-11-07 10:09:05.301345	2015-11-07 10:09:05.301345	8
24	205	3	2015-11-07 10:09:05.306805	2015-11-07 10:09:05.306805	7
25	206	3	2015-11-07 12:31:07.56728	2015-11-07 12:31:07.56728	14
26	206	2	2015-11-07 12:31:07.570188	2015-11-07 12:31:07.570188	14
27	208	1	2015-11-07 13:20:18.681596	2015-11-07 13:20:18.681596	15
28	208	5	2015-11-07 13:20:18.686758	2015-11-07 13:20:18.686758	15
29	209	1	2015-11-07 14:19:18.667407	2015-11-07 14:19:18.667407	14
30	210	3	2015-11-07 14:22:46.327046	2015-11-07 14:22:46.327046	14
31	211	3	2015-11-07 14:51:47.378351	2015-11-07 14:51:47.378351	14
32	212	1	2015-11-07 15:02:49.821888	2015-11-07 15:02:49.821888	14
33	212	6	2015-11-07 15:02:49.824219	2015-11-07 15:02:49.824219	14
34	213	1	2015-11-07 15:11:30.254309	2015-11-07 15:11:30.254309	18
35	213	3	2015-11-07 15:11:30.262918	2015-11-07 15:11:30.262918	18
36	214	2	2015-11-07 15:23:35.503882	2015-11-07 15:23:35.503882	18
37	216	2	2015-11-07 16:57:13.270308	2015-11-07 16:57:13.270308	18
38	217	1	2015-11-07 17:05:51.271616	2015-11-07 17:05:51.271616	18
39	217	2	2015-11-07 17:05:51.277244	2015-11-07 17:05:51.277244	18
40	218	1	2015-11-09 15:09:27.544455	2015-11-09 15:09:27.544455	18
41	219	1	2015-11-09 21:36:05.678597	2015-11-09 21:36:05.678597	16
42	220	1	2015-11-10 02:18:55.089207	2015-11-10 02:18:55.089207	16
43	221	1	2015-11-11 12:36:23.019523	2015-11-11 12:36:23.019523	14
44	222	1	2015-11-11 23:17:33.724165	2015-11-11 23:17:33.724165	14
45	222	12	2015-11-11 23:17:33.726325	2015-11-11 23:17:33.726325	14
46	223	3	2015-11-11 23:29:16.341881	2015-11-11 23:29:16.341881	14
47	223	12	2015-11-11 23:29:16.345647	2015-11-11 23:29:16.345647	14
48	224	1	2015-11-11 23:30:20.472215	2015-11-11 23:30:20.472215	14
49	224	12	2015-11-11 23:30:20.475123	2015-11-11 23:30:20.475123	14
50	225	1	2015-11-12 00:21:50.468452	2015-11-12 00:21:50.468452	14
51	225	12	2015-11-12 00:21:50.473621	2015-11-12 00:21:50.473621	14
52	226	1	2015-11-12 00:27:33.992822	2015-11-12 00:27:33.992822	14
53	227	1	2015-11-12 02:32:44.285142	2015-11-12 02:32:44.285142	14
54	229	5	2015-11-12 02:46:46.31195	2015-11-12 02:46:46.31195	14
55	230	3	2015-11-12 02:58:58.601312	2015-11-12 02:58:58.601312	14
56	231	1	2015-11-12 03:01:34.052174	2015-11-12 03:01:34.052174	14
57	232	1	2015-11-12 03:14:04.225363	2015-11-12 03:14:04.225363	14
58	233	1	2015-11-12 03:32:41.628995	2015-11-12 03:32:41.628995	14
59	234	1	2015-11-12 03:46:26.385479	2015-11-12 03:46:26.385479	14
60	235	13	2015-11-12 06:17:52.154636	2015-11-12 06:17:52.154636	14
\.


--
-- Name: booked_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('booked_services_id_seq', 60, true);


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY bookings (id, start_date, end_date, provider_id, user_first_name, user_last_name, user_phone, user_email, user_message, created_at, updated_at, ref_code, raza, edad, cuidado_especial, token, address, pickup_time, dropoff_time, pet_name, user_id, total) FROM stdin;
5	2015-03-26	2015-03-31	28	Roberto	Gonzalez	55555555	r.gonzalez@desdigitec.com	Prueba de correo	2015-03-06 14:07:37.531143	2015-03-06 14:07:37.531143		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	2015-03-14	2015-03-15	15	Andrea Josefina	Luviano Garcia	8180882143	r.gonzalez@desdigitec.com		2015-03-14 00:13:09.067204	2015-03-14 00:13:09.067204		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
58	2015-05-01	2015-05-04	15	Andrea	Luviano	8180882143	andrealuviano@hotmail.com	Hace dos meses aproximadamente Bucho se quedó con ustedes. Espero que en esta ocasión lo puedan cuidar tan bien como en esa ocasión. 	2015-04-30 21:39:08.327802	2015-04-30 21:39:08.327802		Pitbull	4 años	No	aculfnmk6gy	Río Nilo No.64 interior 501. Colonia Cuauhtémoc, Delegación Cuauhtémoc. Distrito Federal	2015-04-30 08:00:00	2015-04-30 08:00:00	Bucho	\N	\N
4	2015-03-03	2015-03-04	28	Roberto	Gonzalez	12345678	r.gonzalez@desdigitec.com	pruebaIpara facebook	2015-02-27 14:21:44.785284	2015-02-27 14:21:44.785284	prueba	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	2015-03-28	2015-04-05	35	Jesus 	Benitez	5560665305	benitezjj@yahoo.com	Se toma a consideración que la mascota es cachorro y se contrata servicio extra de vacunas a consideración del cliente.	2015-03-16 21:09:32.777876	2015-03-16 21:09:32.777876		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	2015-03-20	2015-03-21	33	Lorena	sanchez	5531096380	lorilors@hotmail.com	hola quisiera dejar a mi perrita con esta persona pero quisiera más información sobre ella y también leí que con la primera reservación recibo una noche gratis como aplica esto? Muchas gracias 	2015-03-18 03:18:28.060091	2015-03-18 03:18:28.060091		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	2015-03-27	2015-03-29	15	Nai	Carrasco	5567078605	naio333@hotmail.com		2015-03-19 17:45:25.358861	2015-03-19 17:45:25.358861		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	2015-03-20	2015-03-22	35	Ana 	Bernal	5545304581	addeokan@gmail.com	Hola! Me interesa saber si pueden cuidar a mi perrita labrador 2 días? \nCuanto sería?	2015-03-19 21:46:12.689567	2015-03-19 21:46:12.689567		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
57	2015-05-01	2015-05-04	15	Andrea	Luviano	8180882143	andrealuviano@hotmail.com	Hace dos meses aproximadamente Bucho se quedó con ustedes. Espero que en esta ocasión lo puedan cuidar tan bien como en esa ocasión. 	2015-04-30 21:39:08.320466	2015-04-30 21:39:08.320466		Pitbull	4 años	No	cfym8ffgozc	Río Nilo No.64 interior 501. Colonia Cuauhtémoc, Delegación Cuauhtémoc. Distrito Federal	2015-04-30 08:00:00	2015-04-30 08:00:00	Bucho	\N	\N
59	2015-05-06	2015-05-08	56	Gerardo	Flores	5530200531	gerardo.flores87@gmail.com		2015-05-07 00:20:54.290469	2015-05-07 00:20:54.290469		Spitz Japones	18 meses	no	fdu38wy1ly0	arquimedes 55 int 302	2015-05-07 21:00:00	2015-05-07 18:00:00	Codzito	\N	\N
60	2015-05-14	2015-05-17	54	Maria del Rosario	Rojas Contreras	7222477064	mrrc23@gmail.com	baño adicional 	2015-05-13 17:29:36.087817	2015-05-13 17:29:36.087817		cruza de chihuahua con poudle	1 año	no ninguno	c2vj05nczne	Albert Einstein 124, int 302 b, Col. Cientifico, Toluca, Estado de México. Referencia:\nA una calle de Jose marti, cercano al Walmart  "Alfredo del mazo"	2015-05-13 10:00:00	2015-05-13 15:00:00	illich	\N	\N
61	2015-06-05	2015-06-13	19	Ivonne Nayaly	Lopez gonzalez	67194852/ 0445526951361	ivonnelg_2102@hotmail.com	Contacto adicional Carlos Jacome 0445539402337 , Baño para ambas mascotas en tina normal.	2015-05-13 18:31:08.889892	2015-05-13 18:31:08.889892		Shnauzer y cruza	1 y 1 año	Tienden a escarbar en las macetas de plantas	chivxf-jon8	Talleres gráficos 40, edif D, Depto 401, Agricola Pantitlan, Del. Iztacalco. Distrito Federal\n\nReferencia: dos cuadras del metro Pantitlan	2015-05-13 18:00:00	2015-05-13 19:00:00	Paris y Shakira	\N	\N
62	\N	\N	56	Mariana 	Beltrán León 	5534665841	mbeltran_leon@hotmail.com	Dias sabado 16 y domingo 17 de Mayo. Esterilizadas. 	2015-05-15 02:29:41.760203	2015-05-15 02:29:41.760203		Criollas	3 y 2 años	No	e63bbfsycdq	Reforma 307 int. B#6 Col. Lomas Estrella C.P. 09890 Del. Iztapalapa 	2015-05-15 09:00:00	2015-05-15 18:00:00	Hera y Kali	\N	\N
63	2015-05-16	2015-05-17	15	Andrea	Luviano	8180882143	andrealuviano@hotmail.com		2015-05-16 00:01:36.23553	2015-05-16 00:01:36.23553		pitbull	4 años	ninguno	pwvvxsqlhbi	Río Nilo No.64 interior 501. Colonia Cuauhtémoc, Delegación Cuauhtémoc. Distrito Federal	2015-05-16 06:00:00	2015-05-16 17:00:00	Bucho	\N	\N
64	2015-05-29	2015-06-05	54	Lucero	Sanchez Rivera	7222702823 / 7224275974	luceristica@hotmail.com		2015-05-21 22:34:08.977097	2015-05-21 22:34:08.977097		Dachshund / Salchica	7 años	Ninguno	gyocv2en3ok	Calle tlacotepec, 203, Col Jorge Jimenez Cantu, Metepec. Referencia Plaza las Americas	2015-05-21 09:00:00	2015-05-21 15:00:00	Chester	\N	\N
66	\N	\N	28	Prueba	Ayu	2336347	adelrio@ayuinc.com		2015-05-25 22:37:52.351694	2015-05-25 22:37:52.351694		Fox	100		0cjki8qaegg	Dirección	\N	\N	Prueba	\N	\N
67	2015-06-18	2015-06-19	56	arabela	rojas	235325	adelrio@ayuinc.com	rwerwe	2015-05-25 23:44:08.339109	2015-05-25 23:44:08.339109		fox	11	rwerwe	rkxgfndpvda	werwer	2015-05-25 09:30:00	2015-05-25 11:30:00	koro	\N	\N
69	2015-05-28	2015-06-01	19	Andrea	Luviano	8180882143	andrealuviano@hotmail.com		2015-05-28 16:57:53.981699	2015-05-28 16:57:53.981699		Pitbull	4 años 	Ninguno	efrcjlyquak	Río Nilo No.64 interior 501. Colonia Cuauhtémoc, Delegación Cuauhtémoc. Distrito Federal	2015-05-28 16:00:00	2015-05-28 20:00:00	Bucho	\N	\N
70	2015-06-09	2015-06-12	19	Josue 	Garcia 	5536499627	Masksolomusik@hotmail.com	Saludos ya conocí a Gabriel y me pareció muy confiables gracias 	2015-06-02 04:27:15.346669	2015-06-02 04:27:15.346669		Pastor belga mallinois	5. Meses 	Pasear	b9enoxf0zje	Norte 80-a 6216	2015-06-02 07:00:00	2015-06-02 22:00:00	Marley	\N	\N
72	2015-06-18	2015-06-21	15	Erika	Barbosa Piza	5543377475	erikapiza@hotmail.com	Por favor si Juan puede llamarme para platicar y conocerlo.	2015-06-16 01:52:49.558862	2015-06-16 01:52:49.558862		Criollo. French con Maltés	6 años	No. Solamente que come pollo. Yo se los daría.	mgebq12r1z8	San Gabino Mnz 840 Lote 23, Santa Úrsula Coapa	2015-06-16 20:00:00	2015-06-16 20:00:00	Ameca	\N	\N
73	2015-07-08	2015-07-09	56	Roberto	Gonzalez	55555555555	r.gonzalez@desdigitec.com		2015-06-30 23:21:06.177617	2015-06-30 23:21:06.177617		p	ad	asdasd	wiauy4xzwnw	adssd	2015-06-30 10:30:00	2015-06-30 10:30:00	prueba	\N	\N
75	2015-07-08	2015-07-10	28	PRUEBA DESDE KMIMOS.COM.MX	S	5566319999	robcuevas2002@yahoo.com		2015-06-30 23:23:26.735384	2015-06-30 23:23:26.735384		ATROFIO	25		c-rvfz_w-ca	ASDASDA	\N	\N	BARUSH	\N	\N
76	2015-07-15	2015-07-18	64	PRUEBA DESDE CANI.MX	A	1231231231231	robcuevas2002@yahoo.com		2015-06-30 23:25:23.086555	2015-06-30 23:25:23.086555		GRUÑON	25		ieukbpb95pu	ADSAD	\N	\N	BARUSH	\N	\N
77	2015-08-17	2015-08-24	54	Patricia 	Alonso	5527559117	cpalonso@hotmail.com		2015-07-01 22:48:21.6896	2015-07-01 22:48:21.6896		Golden retriever	4 años	Ninguno	cnjddga2a7k	Calzada de la Romería 22, int 2, Colinas del Sur, Alvaro Obregon, Distrito Federal.	2015-07-01 09:00:00	2015-07-01 12:00:00	Beto	\N	\N
101	2015-08-08	2015-08-15	56	Melisa	Dominguez	554194 0332	melisan27@gmail.com		2015-08-08 19:38:37.746082	2015-08-08 19:38:37.746082		Labrador chocalte	2. 5 años	Ninguno	d2or5yhfukw	La clienta dejara la mascota en el hogar de los cuidadores	2015-08-08 18:00:00	2015-08-08 09:00:00	Maya 	\N	\N
79	2015-08-03	2015-08-13	56	Michelle 	Ricoy	5530391614	ricoymichelle@hotmail.com		2015-07-11 14:23:00.351017	2015-07-11 14:23:00.351017		Crioya y Labrador 	4 meses y 11 años	Roger, presenta ansiedad si se le deja sólo y de igual manera a la explosión de fuegos artificiales. La dueña nos compartirá sus tranquilizantes.	j398yzcxvky	Prolongación Ocotepec 48, San Jerónimo, Del. Magdalena Contreras, Distrito Federal	2015-07-11 09:00:00	2015-07-11 16:00:00	Kenia y Roger	\N	\N
80	2015-07-23	2015-07-26	43	Martha	Ordoñez	5543160376	Anganaya23@hotmail.com	Me gustaría hablar contigo.	2015-07-11 17:15:51.983219	2015-07-11 17:15:51.983219		French poodle	3años	No	a5h2ypjlkhm	Prolongación Vasco de Quiroga 4800 Col Santa Fe  	2015-07-11 09:00:00	2015-07-11 18:00:00	Camila	\N	\N
81	2015-07-28	2015-08-06	19	Cecilia	Arratia	5591973910	cecisosa55@hotmail.com	Se contrata servicio adicional de baño.	2015-07-14 15:33:29.843291	2015-07-14 15:33:29.843291		Crioya-Maltes	9 meses	Ninguno	c_cugnjnsag	Islas barbados no.1 chiluca, Atizapan de Zaragoza , Estado de México\n	2015-07-14 13:00:00	2015-07-14 18:00:00	Candy	\N	\N
83	2015-07-24	2015-08-09	19	Edith 	Hernández 	5548486105	edi.hpar@gmail.com	Hola podrías darnos más información sobre cómo funciona el hospedaje de nuestra perrita en tu casa? Te agradecerles tu pronta respuesta. Gracias 	2015-07-18 04:39:32.143299	2015-07-18 04:39:32.143299	7066BA 	Criolla	2 años 	No	c9cqopaboow	Encinos 65 colonia Miguel Hidalgo 	2015-07-18 09:00:00	\N	Lula	\N	\N
85	2015-07-31	2015-08-08	19	Maria del Carmen	Alonso Nava	53835872/5531099552	maricarmen7882@hotmail.com		2015-07-22 20:56:11.164456	2015-07-22 20:56:11.164456		Beagle	2 años	La mascota se encuentra en las ultimas semanas del celo en esa fecha. Considerar apartar de los machos.	0er5cli5nfe	Armas Norte 100A "Los cedros", Edif E, Depto 201, Col. San Jeronimo Tepetlaco, Del. Azcapotzalco.	2015-07-22 18:00:00	2015-07-22 18:00:00	Kira	\N	\N
86	2015-07-28	2015-08-01	54	Alonso	Andrade	5537256782	tigrillo2@hotmail.com	Hola,,, Como puedo comunicarme contigo para poder platicar y aclarar todas mis duda? saludos	2015-07-23 15:12:38.542511	2015-07-23 15:12:38.542511	Cupon 25% en la revista pet city	Criollo	12		3ou9kqkr3ww	Abraham Gonzales Col. Santa Maria Aztahuacan Iztapalapa	\N	\N	Dartagñan	\N	\N
87	2015-07-24	2015-07-27	19	Anaylen	Bernal	5545304581	addeokan@gmail.com		2015-07-23 23:17:03.101393	2015-07-23 23:17:03.101393		Labrador	1 año	Ninguno	0uz1liqnkbu	Av. Iman 580. Pedregal de Carrasco ,Edif FIDJI 301, Col. Rinconada la Hacienda, Coyoacan, DF	2015-07-23 07:00:00	2015-07-23 07:00:00	Chucha	\N	\N
88	2015-08-24	2015-08-28	56	Brenda 	Delgado	56539709	brendamdg@gmail.com		2015-07-26 01:20:48.521519	2015-07-26 01:20:48.521519		Schnnauzer miniatura 	1 año 6 meses y 1 año respectivamente	Ambas son literalmente nuestras perrijas. Trish, tiene una afección cardíaca controlada y toma medicamento todas las noches y al caminar necesita descanso q ella misma manifiesta	rvrhdtjlcto	Circuito Bahamas 308, int. A-201, col. Campestre Estrella, del. Iztapalapa, c.p. 09880	2015-07-26 09:00:00	2015-07-26 12:00:00	Cuquis y Trish	\N	\N
179	2015-10-23	2015-10-23	2	\N	\N	\N	\N		2015-10-23 23:59:19.319648	2015-10-23 23:59:19.319648		\N	\N	0	3y70j3o2lkk		2015-10-23 23:50:00	2015-10-23 23:50:00	\N	1	\N
180	2015-10-28	2015-11-12	1	\N	\N	\N	\N	asdfasfda	2015-10-28 05:38:29.398524	2015-10-28 05:38:29.398524		\N	\N	\N	sgulktqqrs0	asfdasfa	\N	\N	\N	2	\N
181	2015-10-28	2015-10-28	2	\N	\N	\N	\N	afdafasfa	2015-10-28 06:01:11.934172	2015-10-28 06:01:11.934172		\N	\N	\N	dorswui1i-4	adfafa	\N	\N	\N	2	\N
182	2015-05-11	2015-11-02	1	\N	\N	\N	\N	No	2015-11-02 21:32:19.433054	2015-11-02 21:32:19.433054	123ASD	\N	\N	\N	ryq--9xjspy	Lima	\N	\N	\N	4	\N
183	2015-11-05	2015-11-02	1	\N	\N	\N	\N		2015-11-02 22:28:50.75006	2015-11-02 22:28:50.75006		\N	\N	\N	apfwulgg7p0		\N	\N	\N	5	\N
184	2015-11-03	2015-11-03	1	\N	\N	\N	\N		2015-11-03 17:22:47.502132	2015-11-03 17:22:47.502132		\N	\N	\N	oyvktpiwvdy		\N	\N	\N	2	\N
185	2015-11-04	2015-11-04	1	\N	\N	\N	\N		2015-11-04 00:15:16.14575	2015-11-04 00:15:16.14575		\N	\N	\N	ydcpxtsoe8c		\N	\N	\N	3	0
186	2015-11-20	2015-11-29	1	\N	\N	\N	\N	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod	2015-11-05 04:44:44.22112	2015-11-05 04:44:44.22112		\N	\N	\N	xlekrlcw5a8	Calle 123	2015-11-05 17:55:00	2015-11-05 13:30:00	\N	6	225
187	2015-11-19	2015-11-29	1	\N	\N	\N	\N	lorem ipsum	2015-11-05 04:45:36.113792	2015-11-05 04:45:36.113792		\N	\N	\N	e6wifefqv8a	Calle 123	2015-11-05 17:35:00	2015-11-05 17:50:00	\N	6	250
188	2015-11-19	2015-11-21	1	\N	\N	\N	\N	lorem ipsum	2015-11-05 04:49:29.049502	2015-11-05 04:49:29.049502		\N	\N	\N	ygmmdyn3sfk	Calle 123	2015-11-05 17:35:00	2015-11-05 09:30:00	\N	6	50
189	\N	\N	1	\N	\N	\N	\N		2015-11-05 04:58:51.650826	2015-11-05 04:58:51.650826		\N	\N	\N	wmz6chztpeu		\N	\N	\N	3	0
190	2015-11-26	2015-11-28	1	\N	\N	\N	\N	lorem	2015-11-05 05:19:40.429369	2015-11-05 05:19:40.429369		\N	\N	\N	zjspuk40wmk	Calle 123	2015-11-05 17:18:00	2015-11-05 09:18:00	\N	6	100
191	2015-11-20	2015-11-22	1	\N	\N	\N	\N	Lorem	2015-11-05 05:35:44.836209	2015-11-05 05:35:44.836209		\N	\N	\N	xfnblomzkgg	Calle 123	2015-11-05 17:34:00	2015-11-05 14:34:00	\N	6	240
192	2015-11-20	2015-11-28	1	\N	\N	\N	\N	asdadadada	2015-11-05 05:52:34.325203	2015-11-05 05:52:34.325203		\N	\N	\N	r0sar17wqti	Calle 123	2015-11-05 18:51:00	2015-11-05 13:51:00	\N	6	540
193	2015-11-20	2015-11-26	1	\N	\N	\N	\N		2015-11-05 06:06:33.973916	2015-11-05 06:06:33.973916		\N	\N	\N	ewbejsw9poq	Calle 123	\N	\N	\N	6	150
194	2015-11-05	2015-11-07	1	\N	\N	\N	\N		2015-11-05 14:56:01.77679	2015-11-05 14:56:01.77679		\N	\N	\N	l7yxxmg4fkg	Calle 123	2015-11-05 08:54:00	2015-11-05 08:54:00	\N	6	50
195	2015-12-10	2016-01-05	1	\N	\N	\N	\N		2015-11-05 20:02:40.693954	2015-11-05 20:02:40.693954		\N	\N	\N	xzzbk11m78c	Calle 123	2015-11-05 15:01:00	2015-11-05 15:01:00	\N	6	650
196	\N	\N	1	\N	\N	\N	\N		2015-11-05 22:32:47.944526	2015-11-05 22:32:47.944526		\N	\N	\N	0sai3dr61sy	rio grande 37\r\ncolinas del lago	\N	\N	\N	7	0
197	2015-11-05	2015-11-07	1	\N	\N	\N	\N	sale a pasear 3 veces al dia	2015-11-05 22:43:25.33002	2015-11-05 22:43:25.33002		\N	\N	\N	fxafpxohv38	rio grande 37\r\ncolinas del lago	2015-11-05 16:42:00	2015-11-05 16:42:00	\N	7	50
198	2015-11-05	2015-11-07	2	\N	\N	\N	\N		2015-11-05 22:54:23.857717	2015-11-05 22:54:23.857717		\N	\N	\N	5x25j4amls0	rio grande 37\r\ncolinas del lago	2015-11-05 16:53:00	2015-11-05 16:53:00	\N	7	140
199	2015-11-14	2015-11-15	2	\N	\N	\N	\N		2015-11-05 22:55:45.285085	2015-11-05 22:55:45.285085		\N	\N	\N	ypphevm4n1y	rio grande 37\r\ncolinas del lago	2015-11-05 16:53:00	2015-11-05 16:53:00	\N	7	140
200	2015-11-27	2015-11-30	1	\N	\N	\N	\N		2015-11-07 04:11:45.078001	2015-11-07 04:11:45.078001	\N	\N	\N	\N	angorzs9esc	Calle 123	2015-11-07 13:35:00	2015-11-07 17:50:00	\N	6	115
201	2015-11-20	2015-11-27	1	\N	\N	\N	\N	dasfafasdfafdasfafasfadfasfadfafafas	2015-11-07 05:34:46.205322	2015-11-07 05:34:46.205322	\N	\N	\N	\N	i4vt5rdykkq	Calle 123	2015-11-07 17:15:00	2015-11-07 17:34:00	\N	6	480
202	2015-11-15	2015-11-21	2	\N	\N	\N	\N		2015-11-07 07:38:57.854457	2015-11-07 07:38:57.854457	\N	\N	\N	\N	7slm4rqvoee	Calle 123	\N	\N	\N	6	0
203	2015-11-19	2015-11-28	1	\N	\N	\N	\N	safasfasfasdfasfdasfasfdasfas	2015-11-07 08:24:55.273223	2015-11-07 08:24:55.273223	\N	\N	\N	\N	oazwk9obepu	Calle 123	2015-11-07 17:24:00	2015-11-07 21:24:00	\N	6	318
204	2015-11-19	2015-11-27	1	\N	\N	\N	\N	PLADPLAPDASKDFPAFASFJASDLKFJASLFJASFJASKLFJSDLKJFGHDSLJKGHSJKLFGHSX	2015-11-07 09:53:34.436814	2015-11-07 09:53:34.436814	\N	\N	\N	\N	vrvfigzvhmq	Calle 123	2015-11-07 21:52:00	2015-11-07 09:35:00	\N	6	540
205	2015-11-18	2015-11-26	1	\N	\N	\N	\N	Bsjsjsjsnanandbdbd	2015-11-07 10:09:05.287442	2015-11-07 10:09:05.287442	\N	\N	\N	\N	85ujpdo_-t4	Calle 123	2015-11-07 09:07:00	2015-11-07 13:07:00	\N	6	0
206	2015-11-12	2015-11-27	1	\N	\N	\N	\N	asfadsfdasfadsfasdfa	2015-11-07 12:31:07.560608	2015-11-07 12:31:07.560608	\N	\N	\N	\N	j_nmi9bgkoy	panamericana 	2015-11-07 17:30:00	2015-11-07 16:30:00	\N	9	492
207	2015-11-13	2015-11-27	2	\N	\N	\N	\N	afdafsas	2015-11-07 12:34:28.138557	2015-11-07 12:34:28.138557	\N	\N	\N	\N	ebauga79clg	panamericana 	2015-11-07 07:34:00	2015-11-07 07:34:00	\N	9	840
208	2015-11-19	2015-11-27	1	\N	\N	\N	\N	dfasfasfdafdadsfas	2015-11-07 13:20:18.674028	2015-11-07 13:20:18.674028	\N	\N	\N	\N	1gxlil-r-pg	adfafafa	2015-11-07 08:19:00	2015-11-07 08:19:00	\N	10	324
209	2015-06-11	2015-11-11	1	\N	\N	\N	\N		2015-11-07 14:19:18.662558	2015-11-07 14:19:18.662558	\N	\N	\N	\N	z7md9kn9lv8	panamericana 	2015-11-07 09:18:00	2015-11-07 12:18:00	\N	9	3720
210	2015-11-07	2015-11-14	1	\N	\N	\N	\N		2015-11-07 14:22:46.32203	2015-11-07 14:22:46.32203	\N	\N	\N	\N	vcswjipojmc	panamericana 	2015-11-07 09:21:00	2015-11-07 11:21:00	\N	9	288
211	2015-08-11	2015-12-11	1	\N	\N	\N	\N		2015-11-07 14:51:47.372602	2015-11-07 14:51:47.372602	\N	\N	\N	\N	uhjmnmzikk0	panamericana 	2015-11-07 09:51:00	2015-11-07 11:51:00	\N	9	3048
212	2015-11-10	2015-11-14	1	\N	\N	\N	\N		2015-11-07 15:02:49.816793	2015-11-07 15:02:49.816793	\N	\N	\N	\N	kkvskuh4zzg	panamericana 	2015-11-07 10:02:00	2015-11-07 13:02:00	\N	9	144
213	2015-11-17	2015-11-21	1	\N	\N	\N	\N		2015-11-07 15:11:30.238673	2015-11-07 15:11:30.238673	\N	\N	\N	\N	evttqyjnuyk		2015-11-07 10:10:00	2015-11-07 13:10:00	\N	12	195.599999999999994
214	2015-11-10	2015-11-14	184	\N	\N	\N	\N		2015-11-07 15:23:35.497799	2015-11-07 15:23:35.497799	\N	\N	\N	\N	jd-iy-hthqm		2015-11-07 10:23:00	2015-11-07 10:23:00	\N	12	168
215	2015-11-17	2015-11-21	184	\N	\N	\N	\N		2015-11-07 16:44:05.0272	2015-11-07 16:44:05.0272	\N	\N	\N	\N	8orwlcft4tk		2015-11-07 11:43:00	2015-11-07 11:43:00	\N	12	168
216	2015-11-17	2015-11-24	184	\N	\N	\N	\N		2015-11-07 16:57:13.262148	2015-11-07 16:57:13.262148	\N	\N	\N	\N	ebnqxmfbzby		2015-11-07 11:55:00	2015-11-07 11:55:00	\N	12	276
217	2015-11-10	2015-11-14	184	\N	\N	\N	\N		2015-11-07 17:05:51.246573	2015-11-07 17:05:51.246573	\N	\N	\N	\N	8wdmbrh4cvw		2015-11-07 12:05:00	2015-11-07 12:05:00	\N	12	180
218	2015-11-10	2015-11-14	184	\N	\N	\N	\N		2015-11-09 15:09:27.505699	2015-11-09 15:09:27.505699	\N	\N	\N	\N	yalr_mponqo		2015-11-09 10:08:00	2015-11-09 10:08:00	\N	12	156
219	2015-04-11	2015-04-18	183	\N	\N	\N	\N	no	2015-11-09 21:36:05.23814	2015-11-09 21:36:05.23814	\N	\N	\N	\N	nfgx5bvggbc	Bosques duraznos 65\r\nBosques de las lomas	2015-11-09 15:33:00	2015-11-09 15:33:00	\N	11	3780
220	2015-07-02	2015-07-11	183	\N	\N	\N	\N		2015-11-10 02:18:55.073952	2015-11-10 02:18:55.073952	\N	\N	\N	\N	ct5emlofji0	Bosques duraznos 65\r\nBosques de las lomas	2015-11-10 20:14:00	2015-11-10 20:14:00	\N	11	4860
221	2015-11-19	2015-11-27	1	\N	\N	\N	\N		2015-11-11 12:36:22.999347	2015-11-11 12:36:22.999347	\N	\N	\N	\N	pdj-qybujxg	panamericana fadsfafa	2015-11-11 13:35:00	2015-11-11 16:35:00	\N	9	240
222	2015-11-19	2015-11-28	1	\N	\N	\N	\N		2015-11-11 23:17:33.7177	2015-11-11 23:17:33.7177	\N	\N	\N	\N	120r6ncxwpw	panamericana	2015-11-11 18:16:00	2015-11-11 18:16:00	\N	9	453.600000000000023
223	2015-11-13	2015-11-26	1	\N	\N	\N	\N		2015-11-11 23:29:16.327196	2015-11-11 23:29:16.327196	\N	\N	\N	\N	dn2_kg3uzos	panamericana	2015-11-11 18:28:00	2015-11-11 18:28:00	\N	9	601.200000000000045
224	2015-11-20	2015-11-27	1	\N	\N	\N	\N		2015-11-11 23:30:19.752137	2015-11-11 23:30:19.752137	\N	\N	\N	\N	dtncz7f8rqs	panamericana	2015-11-11 18:29:00	2015-11-11 18:30:00	\N	9	369.600000000000023
225	2015-11-25	2015-11-28	1	\N	\N	\N	\N		2015-11-12 00:21:50.454928	2015-11-12 00:21:50.454928	\N	\N	\N	\N	8awl2wjplz8	panamericana	2015-11-12 19:21:00	2015-11-12 19:21:00	\N	9	201.599999999999994
226	2015-11-20	2015-11-27	1	\N	\N	\N	\N		2015-11-12 00:27:33.974103	2015-11-12 00:27:33.974103	\N	\N	\N	\N	kpri5gp0b9e	panamericana	2015-11-12 19:27:00	2015-11-12 19:27:00	\N	9	342
227	2015-11-20	2015-11-28	1	\N	\N	\N	\N		2015-11-12 02:32:44.258762	2015-11-12 02:32:44.258762	\N	\N	\N	\N	h7zqb5-jdqw	panamericana	2015-11-12 21:32:00	2015-11-12 21:32:00	\N	9	384
228	2015-11-20	2015-11-28	1	\N	\N	\N	\N		2015-11-12 02:34:45.417644	2015-11-12 02:34:45.417644	\N	\N	\N	\N	kfcjtyrqum4	panamericana	2015-11-12 21:32:00	2015-11-12 21:32:00	\N	9	384
229	2015-11-20	2015-11-27	1	\N	\N	\N	\N		2015-11-12 02:46:46.306917	2015-11-12 02:46:46.306917	\N	\N	\N	\N	ppfwmnn6oze	panamericana	2015-11-12 21:46:00	2015-11-12 21:46:00	\N	9	330
230	2015-11-19	2015-11-27	1	\N	\N	\N	\N		2015-11-12 02:58:58.594392	2015-11-12 02:58:58.594392	\N	\N	\N	\N	zd-jnvbp3qm	panamericana	2015-11-12 21:58:00	2015-11-12 21:58:00	\N	9	363.600000000000023
231	2015-11-11	2015-11-26	1	\N	\N	\N	\N		2015-11-12 03:01:34.044021	2015-11-12 03:01:34.044021	\N	\N	\N	\N	d5xgudbt5ec	panamericana	2015-11-12 22:01:00	2015-11-12 22:01:00	\N	9	678
232	2015-11-26	2015-11-29	1	\N	\N	\N	\N		2015-11-12 03:14:04.214267	2015-11-12 03:14:04.214267	\N	\N	\N	\N	j_x46r9ecvm	panamericana	2015-11-12 22:13:00	2015-11-12 22:13:00	\N	9	174
233	2015-11-14	2015-11-19	1	\N	\N	\N	\N		2015-11-12 03:32:41.603639	2015-11-12 03:32:41.603639	\N	\N	\N	\N	tic8ctigdku	panamericana	2015-11-12 22:32:00	2015-11-12 22:32:00	\N	9	258
234	2015-11-14	2015-11-19	1	\N	\N	\N	\N		2015-11-12 03:46:26.35954	2015-11-12 03:46:26.35954	\N	\N	\N	\N	-v02yhxrwp8	panamericana	2015-11-12 22:32:00	2015-11-12 22:32:00	\N	9	258
235	2015-11-19	2015-11-28	1	\N	\N	\N	\N		2015-11-12 06:17:52.140465	2015-11-12 06:17:52.140465	\N	\N	\N	\N	noqfqymxo10	panamericana	2015-11-12 01:17:00	2015-11-12 01:17:00	\N	9	790.799999999999955
\.


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('bookings_id_seq', 235, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY categories (id, name) FROM stdin;
1	Entrenador
2	Hotel
3	Paseador
4	Veterinario
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('categories_id_seq', 5, false);


--
-- Data for Name: comment_valuations; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY comment_valuations (id, comment_id, valuation_id, created_at, updated_at, value) FROM stdin;
1	4	1	2015-10-30 13:26:33.523202	2015-10-30 13:26:33.523202	4
2	4	2	2015-10-30 13:26:33.530465	2015-10-30 13:26:33.530465	4
3	4	3	2015-10-30 13:26:33.533053	2015-10-30 13:26:33.533053	4
4	4	4	2015-10-30 13:26:33.535712	2015-10-30 13:26:33.535712	4
5	5	1	2015-11-02 17:05:59.463816	2015-11-02 17:05:59.463816	4
6	5	2	2015-11-02 17:05:59.470145	2015-11-02 17:05:59.470145	4
7	5	3	2015-11-02 17:05:59.473404	2015-11-02 17:05:59.473404	4
8	5	4	2015-11-02 17:05:59.475914	2015-11-02 17:05:59.475914	5
9	6	1	2015-11-05 04:08:52.454262	2015-11-05 04:08:52.454262	0
10	6	2	2015-11-05 04:08:52.458888	2015-11-05 04:08:52.458888	0
11	6	3	2015-11-05 04:08:52.461322	2015-11-05 04:08:52.461322	0
12	6	4	2015-11-05 04:08:52.463756	2015-11-05 04:08:52.463756	0
13	7	1	2015-11-05 04:09:11.310094	2015-11-05 04:09:11.310094	0
14	7	2	2015-11-05 04:09:11.316205	2015-11-05 04:09:11.316205	0
15	7	3	2015-11-05 04:09:11.320053	2015-11-05 04:09:11.320053	0
16	7	4	2015-11-05 04:09:11.324758	2015-11-05 04:09:11.324758	0
17	8	1	2015-11-05 04:13:57.286369	2015-11-05 04:13:57.286369	0
18	8	2	2015-11-05 04:13:57.292415	2015-11-05 04:13:57.292415	0
19	8	3	2015-11-05 04:13:57.295711	2015-11-05 04:13:57.295711	0
20	8	4	2015-11-05 04:13:57.298295	2015-11-05 04:13:57.298295	0
21	9	1	2015-11-05 04:20:09.200559	2015-11-05 04:20:09.200559	0
22	9	2	2015-11-05 04:20:09.204429	2015-11-05 04:20:09.204429	0
23	9	3	2015-11-05 04:20:09.20723	2015-11-05 04:20:09.20723	0
24	9	4	2015-11-05 04:20:09.209732	2015-11-05 04:20:09.209732	0
25	10	1	2015-11-05 04:23:15.411152	2015-11-05 04:23:15.411152	5
26	10	2	2015-11-05 04:23:15.418623	2015-11-05 04:23:15.418623	5
27	10	3	2015-11-05 04:23:15.421537	2015-11-05 04:23:15.421537	4
28	10	4	2015-11-05 04:23:15.42405	2015-11-05 04:23:15.42405	1
29	11	1	2015-11-05 05:51:05.961945	2015-11-05 05:51:05.961945	5
30	11	2	2015-11-05 05:51:05.966934	2015-11-05 05:51:05.966934	5
31	11	3	2015-11-05 05:51:05.969474	2015-11-05 05:51:05.969474	5
32	11	4	2015-11-05 05:51:05.972259	2015-11-05 05:51:05.972259	5
33	12	1	2015-11-05 05:51:23.62109	2015-11-05 05:51:23.62109	5
34	12	2	2015-11-05 05:51:23.623966	2015-11-05 05:51:23.623966	5
35	12	3	2015-11-05 05:51:23.62776	2015-11-05 05:51:23.62776	5
36	12	4	2015-11-05 05:51:23.633141	2015-11-05 05:51:23.633141	5
37	13	1	2015-11-06 01:05:24.727279	2015-11-06 01:05:24.727279	4
38	13	2	2015-11-06 01:05:24.734187	2015-11-06 01:05:24.734187	4
39	13	3	2015-11-06 01:05:24.737431	2015-11-06 01:05:24.737431	3
40	13	4	2015-11-06 01:05:24.742685	2015-11-06 01:05:24.742685	1
41	14	1	2015-11-06 01:05:29.31398	2015-11-06 01:05:29.31398	4
42	14	2	2015-11-06 01:05:29.316867	2015-11-06 01:05:29.316867	4
43	14	3	2015-11-06 01:05:29.319529	2015-11-06 01:05:29.319529	3
44	14	4	2015-11-06 01:05:29.322391	2015-11-06 01:05:29.322391	1
45	15	1	2015-11-06 01:08:12.334885	2015-11-06 01:08:12.334885	3
46	15	2	2015-11-06 01:08:12.340488	2015-11-06 01:08:12.340488	3
47	15	3	2015-11-06 01:08:12.343475	2015-11-06 01:08:12.343475	3
48	15	4	2015-11-06 01:08:12.346584	2015-11-06 01:08:12.346584	3
49	16	1	2015-11-06 01:09:02.952541	2015-11-06 01:09:02.952541	4
50	16	2	2015-11-06 01:09:02.954988	2015-11-06 01:09:02.954988	1
51	16	3	2015-11-06 01:09:02.957414	2015-11-06 01:09:02.957414	1
52	16	4	2015-11-06 01:09:02.959781	2015-11-06 01:09:02.959781	2
53	17	1	2015-11-06 23:30:41.699936	2015-11-06 23:30:41.699936	4
54	17	2	2015-11-06 23:30:41.7041	2015-11-06 23:30:41.7041	2
55	17	3	2015-11-06 23:30:41.706716	2015-11-06 23:30:41.706716	4
56	17	4	2015-11-06 23:30:41.709626	2015-11-06 23:30:41.709626	3
57	18	1	2015-11-07 10:07:17.639345	2015-11-07 10:07:17.639345	5
58	18	2	2015-11-07 10:07:17.643642	2015-11-07 10:07:17.643642	5
59	18	3	2015-11-07 10:07:17.646006	2015-11-07 10:07:17.646006	4
60	18	4	2015-11-07 10:07:17.648304	2015-11-07 10:07:17.648304	4
61	19	1	2015-11-07 11:42:17.003741	2015-11-07 11:42:17.003741	4
62	19	2	2015-11-07 11:42:17.006236	2015-11-07 11:42:17.006236	5
63	19	3	2015-11-07 11:42:17.007376	2015-11-07 11:42:17.007376	5
64	19	4	2015-11-07 11:42:17.00855	2015-11-07 11:42:17.00855	5
65	20	1	2015-11-07 13:21:32.59954	2015-11-07 13:21:32.59954	4
66	20	2	2015-11-07 13:21:32.602568	2015-11-07 13:21:32.602568	4
67	20	3	2015-11-07 13:21:32.604405	2015-11-07 13:21:32.604405	3
68	20	4	2015-11-07 13:21:32.606235	2015-11-07 13:21:32.606235	3
69	21	1	2015-11-07 14:49:41.422665	2015-11-07 14:49:41.422665	5
70	21	2	2015-11-07 14:49:41.424468	2015-11-07 14:49:41.424468	3
71	21	3	2015-11-07 14:49:41.426153	2015-11-07 14:49:41.426153	5
72	21	4	2015-11-07 14:49:41.427785	2015-11-07 14:49:41.427785	2
73	22	1	2015-11-07 15:02:48.634588	2015-11-07 15:02:48.634588	2
74	22	2	2015-11-07 15:02:48.641969	2015-11-07 15:02:48.641969	3
75	22	3	2015-11-07 15:02:48.650653	2015-11-07 15:02:48.650653	4
76	22	4	2015-11-07 15:02:48.653356	2015-11-07 15:02:48.653356	3
77	23	1	2015-11-07 15:10:21.124844	2015-11-07 15:10:21.124844	5
78	23	2	2015-11-07 15:10:21.127805	2015-11-07 15:10:21.127805	5
79	23	3	2015-11-07 15:10:21.149483	2015-11-07 15:10:21.149483	5
80	23	4	2015-11-07 15:10:21.165668	2015-11-07 15:10:21.165668	5
81	24	1	2015-11-07 16:39:02.580782	2015-11-07 16:39:02.580782	0
82	24	2	2015-11-07 16:39:02.584095	2015-11-07 16:39:02.584095	0
83	24	3	2015-11-07 16:39:02.586569	2015-11-07 16:39:02.586569	0
84	24	4	2015-11-07 16:39:02.588955	2015-11-07 16:39:02.588955	0
\.


--
-- Name: comment_valuations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('comment_valuations_id_seq', 84, true);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY comments (id, user_id, provider_id, title, body, created_at, updated_at) FROM stdin;
1	2	2	\N	Excelente!	2015-10-28 00:17:56.578635	2015-10-28 00:17:56.578635
2	2	2	\N	Super	2015-10-28 00:18:21.706964	2015-10-28 00:18:21.706964
4	3	2	\N	Excelente	2015-10-30 13:26:33.507982	2015-10-30 13:26:33.507982
13	4	2	\N	Soy un comentario de Prueba	2015-11-06 01:05:24.719962	2015-11-06 01:05:24.719962
14	4	2	\N	Soy un comentario de Prueba	2015-11-06 01:05:29.311088	2015-11-06 01:05:29.311088
15	4	2	\N	Prueba	2015-11-06 01:08:12.329073	2015-11-06 01:08:12.329073
16	4	2	\N	Prueba	2015-11-06 01:09:02.949817	2015-11-06 01:09:02.949817
19	9	1	\N	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. 	2015-11-07 11:42:17.000621	2015-11-07 11:42:17.000621
20	10	1	\N	dsfasfasfsacasdascasdcadcasd	2015-11-07 13:21:32.596096	2015-11-07 13:21:32.596096
21	9	1	\N	Quiero dejar un comentario con este cuidador porque me gustó mucho su forma de trabajo	2015-11-07 14:49:41.420762	2015-11-07 14:49:41.420762
22	11	183	\N	Hola, prueba	2015-11-07 15:02:48.628948	2015-11-07 15:02:48.628948
23	12	1	\N	Gran cuidador	2015-11-07 15:10:21.116135	2015-11-07 15:10:21.116135
24	12	184	\N	Esta es la primera evaluacion que incluyo en este perfil	2015-11-07 16:39:02.577235	2015-11-07 16:39:02.577235
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('comments_id_seq', 24, true);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY countries (id, name, locale, currency, created_at, updated_at, phone, facebook, twitter, flag, domain, dni_length, dni_label) FROM stdin;
2	Argentina	es-AR	ARS $	2015-10-16 18:07:27.429771	2015-10-16 18:07:27.429771	+55 3455 0138	https://www.facebook.com/pages/Kamimos/1473614136234432?ref=bookmarks	https://twitter.com/KmimosMx	argentina	ar.kmimos.la	8	DNI
3	Panamá	es-PA	PAN B/.	2015-10-16 18:07:27.950632	2015-10-16 18:07:27.950632	+507 62453172	https://www.facebook.com/pages/Kamimos/1473614136234432?ref=bookmarks	https://twitter.com/KmimosMx	panama	pa.kmimos.la	12	ID
1	México	es-MX	MXN $	2015-10-16 18:07:26.954261	2015-11-12 02:29:45.580052	55 1791 4931 / 55 6578 6147	https://www.facebook.com/pages/Kamimos/1473614136234432?ref=bookmarks	https://twitter.com/KmimosMx	mexico	mx.kmimos.la	13	IFE
\.


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('countries_id_seq', 4, false);


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY favorites (id, created_at, updated_at, provider_id, user_id) FROM stdin;
1	2015-11-05 06:38:43.986095	2015-11-05 06:38:43.986095	1	3
2	2015-11-05 06:41:16.949996	2015-11-05 06:41:16.949996	1	3
3	2015-11-05 06:41:44.517274	2015-11-05 06:41:44.517274	1	6
4	2015-11-05 23:10:51.296876	2015-11-05 23:10:51.296876	2	7
5	2015-11-06 01:08:44.728951	2015-11-06 01:08:44.728951	2	4
6	2015-11-07 07:17:53.686465	2015-11-07 07:17:53.686465	2	6
7	2015-11-07 12:29:13.64502	2015-11-07 12:29:13.64502	1	9
8	2015-11-07 12:32:54.339379	2015-11-07 12:32:54.339379	2	9
9	2015-11-07 13:18:27.937041	2015-11-07 13:18:27.937041	1	10
10	2015-11-07 15:10:02.620236	2015-11-07 15:10:02.620236	1	12
11	2015-11-07 15:20:55.505266	2015-11-07 15:20:55.505266	184	12
\.


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('favorites_id_seq', 11, true);


--
-- Data for Name: localizations; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY localizations (id, provider_id, location_id, user_id) FROM stdin;
1	1	20	\N
2	1	23	\N
3	1	7	\N
4	1	16	\N
5	2	26	\N
6	2	7	\N
7	2	10	\N
8	4	7	\N
9	4	12	\N
11	5	5	\N
12	5	7	\N
885	184	17	\N
886	184	18	\N
17	6	12	\N
18	7	1	\N
19	7	2	\N
20	7	3	\N
21	7	4	\N
22	7	5	\N
23	7	6	\N
25	7	8	\N
26	7	9	\N
27	7	10	\N
28	7	11	\N
31	7	14	\N
32	7	15	\N
33	7	16	\N
36	8	1	\N
815	79	121	\N
816	79	120	\N
817	79	119	\N
818	79	118	\N
819	79	117	\N
820	79	116	\N
45	9	9	\N
46	9	10	\N
49	10	6	\N
50	10	7	\N
51	10	12	\N
52	10	15	\N
887	184	19	\N
888	184	20	\N
10	1	1	\N
13	1	12	\N
14	1	1	\N
15	1	5	\N
16	1	7	\N
889	184	21	\N
890	184	22	\N
891	184	23	\N
892	184	24	\N
893	184	25	\N
894	184	26	\N
821	181	1	\N
822	181	2	\N
823	181	3	\N
824	181	4	\N
825	181	5	\N
826	181	6	\N
827	181	7	\N
828	181	8	\N
829	181	9	\N
830	181	10	\N
831	181	11	\N
832	181	12	\N
833	181	13	\N
834	181	14	\N
835	181	15	\N
836	181	16	\N
837	182	1	\N
838	182	2	\N
839	182	3	\N
840	182	4	\N
841	182	5	\N
842	182	6	\N
843	182	7	\N
844	182	8	\N
845	182	9	\N
846	182	10	\N
847	182	11	\N
848	182	12	\N
849	182	13	\N
850	182	14	\N
851	182	15	\N
852	182	16	\N
853	183	29	\N
854	183	30	\N
855	183	31	\N
856	183	32	\N
857	183	27	\N
858	183	28	\N
859	183	17	\N
860	183	18	\N
861	183	19	\N
862	183	20	\N
863	183	21	\N
864	183	22	\N
865	183	23	\N
866	183	24	\N
867	183	25	\N
868	183	26	\N
869	183	1	\N
870	183	2	\N
871	183	3	\N
872	183	4	\N
873	183	5	\N
874	183	6	\N
875	183	7	\N
876	183	8	\N
877	183	9	\N
878	183	10	\N
879	183	11	\N
880	183	12	\N
881	183	13	\N
882	183	14	\N
883	183	15	\N
884	183	16	\N
\.


--
-- Name: localizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('localizations_id_seq', 894, true);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY locations (id, name, state_id, utf_name) FROM stdin;
1	Xochimilco	1	Xochimilco
2	Tlalpan	1	Tlalpan
3	Tláhuac	1	Tláhuac
4	Magdalena Contreras	1	Magdalena Contreras
5	Milpa Alta	1	Milpa Alta
6	Miguel Hidalgo	1	Miguel Hidalgo
7	Venustiano Carranza	1	Venustiano Carranza
8	Iztapalapa	1	Iztapalapa
9	Iztacalco	1	Iztacalco
10	Gustavo A. Madero	1	Gustavo A. Madero
11	Cuauhtémoc	1	Cuauhtémoc
12	Coyoacán	1	Coyoacán
13	Cuajimalpa de Morelos	1	Cuajimalpa de Morelos
14	Benito Juárez	1	Benito Juárez
15	Azcapotzalco	1	Azcapotzalco
16	Álvaro Obregón	1	Álvaro Obregón
17	Texcoco	2	Texcoco
18	Acolman	2	Acolman
19	Coacalco	2	Coacalco
20	Toluca	2	Toluca
21	Tlalnepantla	2	Tlalnepantla
22	Naucalpan	2	Naucalpan
23	Metepec	2	Metepec
24	Cuautitlan Izcalli	2	Cuautitlan Izcalli
25	Cuautitlan 	2	Cuautitlan 
26	Atizapán	2	Atizapán
27	Guadalajara	3	Guadalajara
28	Zapopan	3	Zapopan
29	Escobedo	4	Escobedo
30	San Pedro	4	San Pedro
31	San Nicolas de los Garza	4	San Nicolas de los Garza
32	Monterrey	4	Monterrey
33	Agronomía	5	Agronomía
34	Almagro	5	Almagro
35	Balvanera	5	Balvanera
36	Barracas	5	Barracas
37	Belgrano	5	Belgrano
38	Boedo	5	Boedo
39	Caballito	5	Caballito
40	Chacarita	5	Chacarita
41	Coghlan	5	Coghlan
42	Colegiales	5	Colegiales
43	Constitución	5	Constitución
44	Flores	5	Flores
45	Floresta	5	Floresta
46	La Boca	5	La Boca
47	La Paternal	5	La Paternal
48	Liniers	5	Liniers
49	Mataderos	5	Mataderos
50	Monte Castro	5	Monte Castro
51	Montserrat	5	Montserrat
52	Nueva Pompeya	5	Nueva Pompeya
53	Nuñez	5	Nuñez
54	Palermo	5	Palermo
55	Parque Avellaneda	5	Parque Avellaneda
56	Parque Chacabuco	5	Parque Chacabuco
57	Parque Chas	5	Parque Chas
58	Parque Patricios	5	Parque Patricios
59	Puerto Madero	5	Puerto Madero
60	Recoleta	5	Recoleta
61	Retiro	5	Retiro
62	Saavedra	5	Saavedra
63	San Cristóbal	5	San Cristóbal
64	San Nicolás	5	San Nicolás
65	San Telmo	5	San Telmo
67	Villa Crespo	5	Villa Crespo
68	Villa Devoto	5	Villa Devoto
69	Villa General Mitre	5	Villa General Mitre
70	Villa Lugano	5	Villa Lugano
71	Villa Luro	5	Villa Luro
72	Villa Ortúzar	5	Villa Ortúzar
73	Villa Pueyrredón	5	Villa Pueyrredón
74	Villa Real	5	Villa Real
75	Villa Riachuelo	5	Villa Riachuelo
76	Villa Santa Rita	5	Villa Santa Rita
77	Villa Soldati	5	Villa Soldati
78	Villa Urquiza	5	Villa Urquiza
79	Villa del Parque	5	Villa del Parque
80	Vélez Sarsfield	5	Vélez Sarsfield
81	San Francisco	6	San Francisco
82	Costa del Este	6	Costa del Este
83	Punta Paitilla	6	Punta Paitilla
84	Punta Pacifica	6	Punta Pacifica
85	El Cangrejo	6	El Cangrejo
86	Marbella	6	Marbella
87	Bella Vista	6	Bella Vista
88	Obarrio	6	Obarrio
89	Avenida Balboa	6	Avenida Balboa
90	El Dorado	6	El Dorado
91	Vía España	6	Vía España
92	Costa Sur	6	Costa Sur
93	Albrook	6	Albrook
94	Clayton	6	Clayton
95	Coco del Mar	6	Coco del Mar
96	Altos del Golf	6	Altos del Golf
97	Campo Lindberg	6	Campo Lindberg
98	Brisas del Golf	6	Brisas del Golf
99	12 de Octubre	6	12 de Octubre
100	Rio Abajo	6	Rio Abajo
66	Versalles	6	Versalles
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('locations_id_seq', 101, false);


--
-- Data for Name: meetings; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY meetings (id, provider_id, user_first_name, user_last_name, user_phone, user_email, token) FROM stdin;
1	1	Lalo	Gonzalez	999900673	lalogf@gmail.com	xfxvvcezdb0
\.


--
-- Name: meetings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('meetings_id_seq', 1, true);


--
-- Data for Name: own_sizings; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY own_sizings (id, provider_id, size_id, created_at, updated_at) FROM stdin;
1	1	1	2015-10-17 06:40:41.807661	2015-10-17 06:40:41.807661
2	1	2	2015-10-17 06:40:41.824549	2015-10-17 06:40:41.824549
3	2	1	2015-10-17 06:54:14.60792	2015-10-17 06:54:14.60792
4	181	3	2015-11-07 10:53:22.488962	2015-11-07 10:53:22.494719
5	181	4	2015-11-07 10:53:22.491813	2015-11-07 10:53:22.497045
6	181	1	2015-11-07 10:53:22.493203	2015-11-07 10:53:22.499044
7	182	3	2015-11-07 13:15:47.076332	2015-11-07 13:15:47.084893
8	182	4	2015-11-07 13:15:47.079527	2015-11-07 13:15:47.087571
9	182	2	2015-11-07 13:15:47.081265	2015-11-07 13:15:47.090163
10	182	1	2015-11-07 13:15:47.08304	2015-11-07 13:15:47.092908
11	183	3	2015-11-07 14:58:49.533018	2015-11-07 14:58:49.53674
12	183	2	2015-11-07 14:58:49.534793	2015-11-07 14:58:49.540086
13	184	3	2015-11-07 15:19:57.445612	2015-11-07 15:19:57.477396
14	184	4	2015-11-07 15:19:57.449357	2015-11-07 15:19:57.488931
15	184	2	2015-11-07 15:19:57.461862	2015-11-07 15:19:57.500342
16	184	1	2015-11-07 15:19:57.474426	2015-11-07 15:19:57.506817
\.


--
-- Name: own_sizings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('own_sizings_id_seq', 16, true);


--
-- Data for Name: pet_behaviors; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY pet_behaviors (id, behavior_name, created_at, updated_at, provider_id, behavior_id) FROM stdin;
1	\N	2015-11-05 01:34:49.793473	2015-11-05 01:34:49.793473	1	2
2	\N	2015-11-07 10:53:22.767423	2015-11-07 10:53:22.767423	181	3
3	\N	2015-11-07 10:53:22.771077	2015-11-07 10:53:22.771077	181	4
4	\N	2015-11-07 13:15:47.277704	2015-11-07 13:15:47.277704	182	3
5	\N	2015-11-07 13:15:47.282194	2015-11-07 13:15:47.282194	182	1
6	\N	2015-11-07 14:58:49.717522	2015-11-07 14:58:49.717522	183	2
7	\N	2015-11-07 15:19:57.653163	2015-11-07 15:19:57.653163	184	2
8	\N	2015-11-07 15:19:57.655776	2015-11-07 15:19:57.655776	184	3
\.


--
-- Name: pet_behaviors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('pet_behaviors_id_seq', 8, true);


--
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY pets (id, name, weight, sex, behavior_id, created_at, updated_at, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, size_id, race_id, weight_id, age_id) FROM stdin;
10	Rocu	8	Masculino	2	2015-11-05 22:32:00.916247	2015-11-07 07:01:42.761528	\N	\N	\N	\N	2	210	\N	\N
9		\N	\N	\N	2015-11-05 05:17:45.483796	2015-11-07 07:01:54.811433	\N	\N	\N	\N	\N	245	\N	\N
8	Party	\N	Masculino	2	2015-11-05 05:17:44.884907	2015-11-07 07:02:04.345547	missing.png	image/png	89792	2015-11-05 05:17:44.425332	2	243	\N	\N
7	Toti	20	Femenino	2	2015-11-05 03:39:10.849324	2015-11-07 07:02:10.856883	missing.png	image/png	89792	2015-11-05 03:39:10.582328	2	243	\N	\N
6	12	\N	Masculino	3	2015-11-04 21:08:47.133376	2015-11-07 07:02:19.142578	PicApp_-_Apple_iPhone_6_White.png	image/png	190837	2015-11-04 21:08:46.724302	3	343	\N	\N
5	Firulais	20	Masculino	3	2015-11-02 21:51:20.207103	2015-11-07 07:02:32.885708	7462307a8a69c3e7aa725c14fa6908ae.jpeg	image/jpeg	24875	2015-11-02 21:51:19.871677	2	343	\N	\N
4	Bobby	20	Masculino	1	2015-11-02 21:29:50.970495	2015-11-07 07:02:43.79501	mascota2.jpg	image/jpeg	231578	2015-11-02 21:29:50.517762	2	223	\N	\N
2	Lab	30	Masculino	2	2015-10-28 00:16:11.534085	2015-11-07 07:02:54.975816	16840395246_a2841b0f4e_z.jpg	image/jpeg	86014	2015-11-02 23:44:13.6562	2	323	\N	\N
1	Lazie	5	\N	1	2015-10-23 23:43:53.043984	2015-11-07 07:03:03.838566	Quintamiraflores_ok_55_.png	image/png	850570	2015-10-23 23:43:49.758185	1	333	\N	\N
11	Frozen	32	Masculino	3	2015-11-07 10:41:37.682569	2015-11-07 10:41:37.682569	missing.png	image/png	89792	2015-11-07 10:41:37.00465	4	320	\N	\N
12	49	\N	Masculino	3	2015-11-07 10:42:52.066773	2015-11-07 10:42:52.066773	\N	\N	\N	\N	2	311	\N	\N
13		\N	\N	\N	2015-11-07 10:42:52.075608	2015-11-07 10:42:52.075608	\N	\N	\N	\N	\N	\N	\N	\N
15	Toti	54	Femenino	3	2015-11-07 13:17:36.477107	2015-11-07 13:17:36.477107	missing.png	image/png	89792	2015-11-07 13:17:36.224055	2	372	\N	\N
16	Rufus	25	Masculino	3	2015-11-07 15:02:04.670295	2015-11-07 15:02:04.670295	\N	\N	\N	\N	4	261	\N	\N
17	rocku	10	Masculino	2	2015-11-07 15:02:04.67939	2015-11-07 15:02:04.67939	\N	\N	\N	\N	2	373	\N	\N
18	Pepa	123	Masculino	2	2015-11-07 15:09:15.962828	2015-11-07 15:09:15.962828	IMG_4945.JPG	image/jpeg	560229	2015-11-07 15:09:14.596503	2	202	\N	\N
3	Joel	14	Masculino	3	2015-10-29 19:14:40.665843	2015-11-11 19:47:49.21482	mascota4.jpg	image/jpeg	411106	2015-10-29 19:14:39.906449	\N	223	\N	\N
14	Lalo	23	Masculino	1	2015-11-07 11:35:28.062468	2015-11-11 23:16:28.432074	thumb_missing.png	image/png	10042	2015-11-07 11:35:27.967376	4	205	\N	1
\.


--
-- Name: pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('pets_id_seq', 18, true);


--
-- Data for Name: promotional_codes; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY promotional_codes (id, code, expire_at, state, created_at, updated_at) FROM stdin;
\.


--
-- Name: promotional_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('promotional_codes_id_seq', 1, false);


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY properties (id, property_name) FROM stdin;
1	Casa
2	Departamento
\.


--
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('properties_id_seq', 3, false);


--
-- Data for Name: provider_attachments; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY provider_attachments (id, provider_id, photo, created_at, updated_at) FROM stdin;
1	1	hq_web_Cuidador_Cari_o.png	2015-10-17 06:40:41.938211	2015-10-17 06:40:41.938211
2	1	hq_web_casa.png	2015-10-17 06:40:42.104784	2015-10-17 06:40:42.104784
3	2	1506994_10152201823422448_1268010541_n.jpg	2015-10-17 06:54:14.621596	2015-10-17 06:54:14.621596
4	2	1506994_10152201823422448_1268010541_n.jpg	2015-10-17 06:54:14.724587	2015-10-17 06:54:14.724587
13	15	Captura_de_pantalla_2015-04-06_a_la_s__17.58.46.png	2015-04-06 22:59:15.142161	2015-04-06 22:59:15.142161
16	15	Captura_de_pantalla_2015-04-06_a_la_s__18.05.45.png	2015-04-06 23:06:23.085651	2015-04-06 23:06:23.085651
17	15	Captura_de_pantalla_2015-04-06_a_la_s__18.06.05.png	2015-04-06 23:07:50.515793	2015-04-06 23:07:50.515793
18	15	Captura_de_pantalla_2015-04-06_a_la_s__18.07.00.png	2015-04-06 23:07:50.99791	2015-04-06 23:07:50.99791
19	15	Captura_de_pantalla_2015-04-06_a_la_s__18.01.53.png	2015-04-06 23:08:17.501028	2015-04-06 23:08:17.501028
50	54	11096603_783398948423586_5474978665196620991_o.jpg	2015-04-08 16:35:31.848699	2015-04-08 16:35:31.848699
51	54	IMG_20150330_181327.jpg	2015-04-08 16:35:32.252813	2015-04-08 16:35:32.252813
52	54	IMG_20150406_144122.jpg	2015-04-08 16:36:39.67848	2015-04-08 16:36:39.67848
53	54	IMG_20150406_144217.jpg	2015-04-08 16:36:40.577602	2015-04-08 16:36:40.577602
55	54	IMG_20150408_104312.jpg	2015-04-08 16:38:05.496922	2015-04-08 16:38:05.496922
56	54	IMG-20150406-WA0007.jpg	2015-04-08 16:39:29.573225	2015-04-08 16:39:29.573225
58	53	6.jpg	2015-04-08 18:26:48.99498	2015-04-08 18:26:48.99498
59	53	cnino1.jpg	2015-04-08 18:27:10.929257	2015-04-08 18:27:10.929257
60	53	4.jpg	2015-04-08 18:27:30.481856	2015-04-08 18:27:30.481856
61	53	2.jpg	2015-04-08 18:27:57.261308	2015-04-08 18:27:57.261308
63	53	7.jpg	2015-04-08 18:28:40.158888	2015-04-08 18:28:40.158888
67	19	hq_web_Cuidador_Parque.png	2015-04-09 22:48:02.916603	2015-04-09 22:48:02.916603
68	19	hq_web_Lola_Casa.png	2015-04-09 22:48:03.055492	2015-04-09 22:48:03.055492
74	56	hq_web_casa.png	2015-04-10 17:39:13.29667	2015-04-10 17:39:13.29667
75	56	hq_web_Cuidador.png	2015-04-10 17:39:13.445912	2015-04-10 17:39:13.445912
76	56	hq_web_Cuidador_Cari_o.png	2015-04-10 17:39:13.591564	2015-04-10 17:39:13.591564
77	56	hq_web_Cuidadores.png	2015-04-10 17:39:18.676222	2015-04-10 17:39:18.676222
78	56	hq_web_Cuidadores_2.png	2015-04-10 17:39:18.775174	2015-04-10 17:39:18.775174
79	56	hq_web_Lugar_Fachada.png	2015-04-10 17:39:18.868341	2015-04-10 17:39:18.868341
80	56	hq_web_Mascota_1.png	2015-04-10 17:39:18.964972	2015-04-10 17:39:18.964972
81	55	hq_web_Cuidadores_3.png	2015-04-10 17:51:53.96722	2015-04-10 17:51:53.96722
83	55	hq_web_Cuidadores.png	2015-04-10 17:52:43.338223	2015-04-10 17:52:43.338223
73	28	hq_web_Patio_Casa.png	2015-04-09 22:49:59.608923	2015-04-09 22:49:59.608923
84	55	hq_web_Escaleras.png	2015-04-10 17:52:43.455403	2015-04-10 17:52:43.455403
85	55	hq_web_Mascotas.png	2015-04-10 17:52:43.601265	2015-04-10 17:52:43.601265
90	54	IMG_20150419_103007_-_copia.jpg	2015-04-19 16:40:18.081781	2015-04-19 16:40:18.081781
92	60	Captura_de_pantalla_2015-04-29_a_la_s__10.30.26.png	2015-04-29 15:30:47.955053	2015-04-29 15:30:47.955053
94	60	Captura_de_pantalla_2015-04-29_a_la_s__10.33.00.png	2015-04-29 15:33:34.414654	2015-04-29 15:33:34.414654
96	60	Captura_de_pantalla_2015-04-29_a_la_s__10.39.48.png	2015-04-29 15:40:13.730923	2015-04-29 15:40:13.730923
98	60	Captura_de_pantalla_2015-04-29_a_la_s__10.45.00.png	2015-04-29 15:45:15.150107	2015-04-29 15:45:15.150107
99	60	CaptINSERe_pantalla_2015-04-29_a_la_s__10.43.06.png	2015-04-29 15:46:02.871823	2015-04-29 15:46:02.871823
100	62	IMG00607-20110623-1851.jpg	2015-04-29 16:17:25.203405	2015-04-29 16:17:25.203405
101	54	20150505_085715.jpg	2015-05-05 14:34:32.519978	2015-05-05 14:34:32.519978
5	57	eating-grass.jpg	2015-11-05 01:39:39.136259	2015-11-05 05:11:52.375207
102	181	eating-grass.jpg	2015-11-07 10:53:22.595484	2015-11-07 10:53:22.595484
103	182	missing.png	2015-11-07 13:15:47.193597	2015-11-07 13:15:47.193597
104	1	Screen_Shot_2015-11-03_at_7.43.21_a.m..png	2015-11-07 14:59:13.900235	2015-11-07 14:59:13.900235
\.


--
-- Name: provider_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('provider_attachments_id_seq', 104, true);


--
-- Data for Name: providers; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY providers (id, name, last_name_1, last_name_2, dni, email, category_id, created_at, updated_at, password_digest, avg_rating, phone, description, email_c, avatar, price, areas_externas, emergencia, experiencia, iframe_code, property_id, active, latitude, longitude, address, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, has_other_pets, number_of_pets, pets_allowed, has_green, has_yard, pet_behavior_id, on_top, check_in, check_out, is_favorite, behaviors_accepted, behavior_id, only_sterilizated) FROM stdin;
2	Mariana	Villanueva	\N	3210987654321	lalo@soulutions.com.pe	\N	2015-10-17 06:54:14.598454	2015-11-03 20:28:29.871282	\N	\N	987654321	Hola! me llamo Mariana, pero todos me dicen Mai, me encantan los perros y desde muy chiquita me gusta rescatar animales. Mi compañero fiel Milou (yorkshire) y yo, nos aseguraremos de darle a tu perrito una experiencia inolvidable y linda. De Lunes a Viernes medio día, tu perrihijo mientras estoy de trabajo, estará bajo el cuidado de mi hermana quien es amante de los perros también, ella cuida a Milou en el día y estará al pendiente de tu peque., en cuanto llego de la ofis, yo me hago cargo de seguir consintiéndolo, siempre estoy al pendiente de ellos en todo momento y los cuido como al mío propio asi que no te apures que estará en buenas manos! lo divertido es que los fines de semana soy libre de la vida corporativa asi que estaremos en parques, jugando y divirtiéndonos mucho! Si tuvieras requisitos especiales para tu perrihijo no dudes en avisarme para adecuarnos a él (ella). Me gusta leer libros relacionados con el cuidado de perros, también me dedico a la reposteria canina y disfruto de crear comidas balanceadas y en la manera de lo posible órganicas para consentirlos. También me gusta reforzar el entrenamiento positivo y siempre procuro que sea fruta fresca o verduras (claro las permitidas para perros) o biscuits órganicos como premios. Tu pequeñin estará muy contento con nosotros y nos aseguraremos que su estancia sea muy felíz, tranquila y amigable vigilandolo y estando muy al pendiente de el(ella) programando momentos para descansar, salir y sus horarios de comida.	\N	thumb_1506994_10152201823422448_1268010541_n.jpg	300	\N	\N	\N	\N	2	t	19.4331002	-99.1629991	Lago Mask 406	$2a$10$yA./5OzS9WopIZmeUZtcT.sIARInky0m98BO0nnpHXWPWlf/wAiA2	\N	\N	\N	1	2015-10-17 06:54:14.993001	2015-10-17 06:54:14.993001	190.42.3.16	190.42.3.16	\N	3	2	t	t	\N	t	\N	\N	t	--- []\n	3	\N
177	Jael 	Roa	Araiza 	2356789013948	Jael.roa@hotmail.com	2	2015-10-06 18:53:51.141915	2015-10-09 12:43:06.327951	$2a$10$DaSY3bEAMVBMQGiLE1hI8.1oSNsQYb70WahidWqP.nA5OUguXyxZK	\N	0445510487001	Hola! Me llamo Jael y amo a los animales, rescato perritos perdidos y encuentro a sus familias y/o les busco hogar.  Me hace muy feliz cuidar, mimar perritos y jugar con ellos.	Jael.roa@hotmail.com	image.jpeg	300	Cuento con un jardín para pasear con correa.	f	10		2	f	\N	\N	\N		\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	t	\N	\N	\N
19	GABRIEL 	GARDUÑO	BONILLA	1190048192760	gabrielgb2007@hotmail.com	2	2014-10-29 16:39:48.94153	2015-09-30 22:51:08.824992	$2a$10$ymKBdVKkJv5QTD3O0voLyuBhMgDsMweMsw5/EYZHAQm9ETuduHMmW	5	5559047230	Tu perro se sentirá como en su casa. Mi trabajo diario es cuidar y entrenar perros con mucho cariño desde hace 20 años.  Cuando diariamente salgo a entrenar a los perritos que tengo a cargo aprovecho y paseo a los que se están quedando conmigo en casa, además tengo una perrita muy juguetona que siempre hace sentir felices a sus invitados.  Tengo también un parque muy cerca en donde los saco a que se diviertan.	gabrielgb2007@hotmail.com	Captura_de_pantalla_2015-04-06_a_la_s__16.32.29.png	150	Vivo a dos calles de un parque y tengo un patio en mi casa de 35 metros cuadrados	t	20	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1598.8556192805725!2d-99.10115059999998!3d19.457094400000013!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85d1fbe021d1e8f7%3A0x1e51a7fc79921aff!2sNte+90+4714%2C+Nueva+Tenochtitlan%2C+Gustavo+A.+Madero%2C+07890+Cd+de+M%C3%A9xico%2C+D.F.!5e1!3m2!1ses!2smx!4v1428356262323" width="600" height="450" frameborder="0" style="border:0"></iframe>	1	f	\N	\N	\N		\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	t	\N	\N	\N
62	Rubí 	Fernández	Nava	0480010424821	simialucida@gmail.com	2	2015-04-29 16:02:12.796902	2015-08-21 16:00:12.017425	$2a$10$6wr6rFvoI6GPrITnWlFBq.IqqR2LnKUSKd5zAmW9EwKY4eQUkQhBC	\N	5530377187	Blondie, mi golden retriever, Satán mi gato, Emilio mi hijo mi pareja y yo gustamos de recibir invitados en la familia. Mi casa no es muy grande pero pueden pasear por ella y sentarse en las escaleras a ver pasar gente o subirse a la azotea a tomar el sol, acostarse en el sillón o con todos en la siesta de la tarde y salir a correr al jardín comunal.	simialucida@gmail.com	2014-07-25_07.49.24.jpg	150	La azotea donde pueden subir y bajar a la casa.	f	20	01170	1	f	\N	\N	\N		\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	t	\N	\N	\N
180	María de Lourdes 	Bieletto	Padilla 	BIPL581129MV2	Loutto@yahoo.com.mx	2	2015-10-06 23:51:55.594017	2015-10-09 12:50:04.897936	$2a$10$oEVcJTov1qXi1IWKhcQXmOfvxyDJDrsc78cpDfPlXWgrOFXC7T/ZK	\N	5529523633	Tengo espacio suficiente para que los perros que queden a mi cuidado, pasen una estancia cómoda y con un trato de mucho afecto y  calidad.\nTambién ofrezco baño,  no peluquería.	Loutto@yahoo.com.mx	image.jpeg	200	Un jardín de aproximadamente 40mt2, un patio de 25mt2 y una terraza de 20mt2	f	20		1	f	\N	\N	\N		\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	t	\N	\N	\N
61	Carmen Ized	Barba	Gonzalez	0000000000111	ibarba87@outlook.es	2	2015-04-28 16:16:00.550981	2015-09-03 14:27:11.52088	$2a$10$AHFSDVEOwPKAPOg.SquTG.UB0nW4hkycfRsbg3Xnglj9lcnVGWpQC	\N	3339575631	Me encargo de dar paseos a perritos de manera individual o grupal. Me gustan mucho los animales, en mi casa tengo 2 perritos de raza criollo de tamaño pequeño que son mi adoración. Normalmente cuando me dejan a las mascotas les dedico mucho tiempo a estar jugando con ellos y que no se sientan tristes o les sea difícil no estar en su casa. De igual forma, los saco a pasear diario a todos por lo menos 1 hora al día, pero si tu lo quieres puedo sacarlo varias veces. También te ofrezco bañarlos durante el tiempo que estén conmigo .En cuanto a la atención veterinaria, unos de mis vecinos son veterinarios por lo que siempre estarán bien cuidados en cualquier emergencia que pueda ocurrir.	ibarba87@outlook.es	\N	200	Parque a 2 cuadras de mi casa	t	5	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2883.136319098548!2d-103.36398550000017!3d20.63033000777524!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8428ad88b1af0c23%3A0x7cfc1460a82e3f8f!2sOscar+Men%C3%A9ndez+2508%2C+Echeverr%C3%ADa%2C+44970+Guadalajara%2C+Jal.!5e1!3m2!1ses!2smx!4v1430237744841" width="600" height="450" frameborder="0" style="border:0"></iframe>	2	f	\N	\N	\N		\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	t	\N	\N	\N
60	Donaji	Ramirez 	Peñaloza	0058049785997	leonordonaji@yahoo.com.mx	2	2015-04-27 18:30:37.754494	2015-04-29 15:43:31.082312	$2a$10$4y9VKCFHwzU4Gzv9zJd36.j/LaOqR5ES9QRl20otsSeojLO1eHROm	\N	5540901613	Yo puedo cuidar a tu perrito con el mismo cariño con el que cuido a mis perritos, yo tengo un yorkie y una cruza de maltes y yorkie que son mi adoración. Me gusta manetenerlos lo mas consentidos en mi casa pero bien educados, ellos tienen su horario de comida y conocen muy bien donde pueden estar jugando y donde no. Soy de la idea de cuidar y tratar a las mascotas con todo el respeto y cariño que merecen por ser seres vivos, así mismo busco hacer sentir a tu mascota como en casa en base a un cuidado con refuerzos positivos en los que les doy premios para que se sientan mas cómodos.Con todo gusto podemos conocernos para que sepas donde vas a dejar a tu mascota, o bien si lo gustas puedo acercarme a tu domicilio para recoger a tu pequeño. También si así lo gustaras puedo bañar a tu mascota dentro del mismo tiempo de la estadía y te aseguro que estará bien cuidado durante todo su tiempo conmigo.	leonordonaji@yahoo.com.mx	Captura_de_pantalla_2015-04-29_a_la_s__10.43.06.png	150	Un patio trasero protegido, con áreas de sombra y sol, a una cuadra de distancia hay 2 diferentes parques donde podemos salir ha divertirnos y hacer ejercicio	t	10	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1609.9967127820162!2d-98.97650179999998!3d19.603860900000004!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85d1ee5dae8d2dd5%3A0xa3b45c092f097a81!2sLago+de+Texcoco+22%2C+Tepexpan%2C+M%C3%A9x.!5e1!3m2!1ses!2smx!4v1430155794431" width="600" height="450" frameborder="0" style="border:0"></iframe>	1	t	\N	\N	\N		\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	f	\N	\N	\N
184	Herman	Marin	\N	1234213213232	herman@laboratoria.la	\N	2015-11-07 15:19:56.667107	2015-11-07 17:48:22.71625	\N	\N	3298492348	Hola Soy Herman, El cuidador estrella de esta comunidad. Me encantan los perros!	\N	IMG_4965.JPG	\N	\N	t	2	\N	1	t	19.434502	-99.14628859999999	Av. Juárez #70. Colonia Centro, México, Distrito Federal, 06010, México	$2a$10$zLGoGLFgLYef0o5PfXcVYuqGfJ0K2CHG14qOVzLz25xnuNLPJ9vhy	\N	\N	\N	4	2015-11-07 17:46:03.031296	2015-11-07 16:31:12.150968	190.235.42.164	190.235.42.164	\N	\N	2	\N	\N	\N	\N	15:13:00	15:13:00	\N	\N	\N	\N
183	Roberto 	 G Young	\N	0000000000203	red.91@hotmail.com	\N	2015-11-07 14:58:49.49437	2015-11-10 02:32:38.596304	\N	\N	43434123	hola Soy berto G. Young, esta es una descripcion de prueba	\N	\N	\N	\N	t	10	\N	1	t	19.4043268	-99.24151069999999	Bosques duraznos 65, bosques de las lomas, Miguel hidalgo	$2a$10$RaRuS3gJ2w0LsSWLAEdCGuVs9a0tMlpZr1IucnQTynQBcIO28lcQm	\N	\N	\N	2	2015-11-10 02:32:38.593244	2015-11-07 14:58:49.735989	189.217.155.17	189.217.155.17	t	2	10	t	t	\N	\N	17:40:00	14:40:00	\N	\N	\N	f
1	Cesar	Rincon	\N	1234567890123	lalo@laboratoria.la	\N	2015-10-17 06:40:41.610164	2015-11-12 04:53:32.600635	\N	\N	987612313131	¡Hola, yo soy Ale! He tenido perros la mayor parte de mi vida, grandes y chicos, tranquilos y no tanto. Actualmente tengo una perrita salchicha que adopté por medio de una Asociación. Julia, mi perrita, convive bien con otros perros. Mi profesión me permite trabajar desde casa, por lo que cuento con el tiempo necesario para jugar y pasear a nuestros huéspedes caninos. Cuento con muchos parques cerca y para tú tranquilidad, un Hospital Veterinario 24hrs a la vuelta. A nuestro lado, tu perrito estará como en casa y será un miembro más de la familia.	\N	thumb_2013-03-13_11-19-06_817.jpg	200	\N	\N	3	\N	2	t	19.4206204	-99.15327880000001	Rtno. 15 30, Avante, 04460 Ciudad de México, D.F.	$2a$10$jcXyPMKalS7CeiIMn3xcNuAQL76Q.SPZoqmca/xx9pSLej/USF4LG	\N	\N	\N	23	2015-11-12 04:53:32.596541	2015-11-11 20:44:21.726885	190.236.100.159	190.236.100.159	t	3	5	t	t	\N	t	13:00:00	11:00:00	t	--- []\n	2	t
\.


--
-- Name: providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('providers_id_seq', 184, true);


--
-- Data for Name: races; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY races (id, race_name, created_at, updated_at) FROM stdin;
201	Affenpinscher	\N	\N
202	Airedale terrier	\N	\N
203	Akita Inu	\N	\N
204	Akita Americano	\N	\N
205	Alano español	\N	\N
206	Alaskan malamute	\N	\N
207	American Hairless terrier	\N	\N
208	American Staffordshire Terrier	\N	\N
209	Antiguo Perro Pastor Inglés	\N	\N
210	Appenzeller	\N	\N
211	Australian Cattle Dog	\N	\N
212	Australian Silky Terrier	\N	\N
213	Azawakh	\N	\N
214	Bardino (Perro majorero)	\N	\N
215	Basenji	\N	\N
216	Basset hound	\N	\N
217	Beagle	\N	\N
218	Beauceron	\N	\N
219	Bichon frisé	\N	\N
220	Bichón maltés	\N	\N
221	Bobtail	\N	\N
222	Bloodhound	\N	\N
223	Border collie	\N	\N
224	Borzoi	\N	\N
225	Boston terrier	\N	\N
226	Bóxer	\N	\N
227	Braco alemán de pelo corto	\N	\N
228	Braco alemán de pelo duro	\N	\N
229	Braco de Auvernia	\N	\N
230	Braco francés	\N	\N
231	Braco húngaro	\N	\N
232	Braco italiano	\N	\N
233	Braco tirolés	\N	\N
234	Braco de Saint Germain	\N	\N
235	Braco de Weimar	\N	\N
236	Bull Terrier	\N	\N
237	Bulldog americano	\N	\N
238	Bulldog francés	\N	\N
239	Bulldog inglés	\N	\N
240	Bullmastiff	\N	\N
241	Can de palleiro	\N	\N
242	Caniche	\N	\N
243	Cão da Serra da Estrela	\N	\N
244	Cão da Serra de Aires	\N	\N
245	Cão de Agua Português	\N	\N
246	Cão de Castro Laboreiro	\N	\N
247	Cão de Fila de São Miguel	\N	\N
248	Chesapeake Bay Retriever	\N	\N
249	Chihuahueño	\N	\N
250	Crestado Chino	\N	\N
251	Chow chow	\N	\N
252	Clumber spaniel	\N	\N
253	Cocker spaniel americano	\N	\N
254	Cocker spaniel inglés	\N	\N
255	Collie	\N	\N
256	Bearded collie	\N	\N
257	Dachshund	\N	\N
258	Dálmata	\N	\N
259	Dandie Dinmont Terrier	\N	\N
260	Deerhound	\N	\N
261	Dobermann	\N	\N
262	Dogo alemán	\N	\N
263	Dogo argentino	\N	\N
264	Dogo de burdeos	\N	\N
265	Dogo del Tíbet	\N	\N
266	Dogo guatemalteco	\N	\N
267	English springer spaniel	\N	\N
268	Entlebucher	\N	\N
269	Épagneul bretón	\N	\N
270	Épagneul français	\N	\N
271	Epagneul papillón	\N	\N
272	Eurasier	\N	\N
273	Fila Brasileiro	\N	\N
274	Flat-Coated Retriever	\N	\N
275	Fox Terrier	\N	\N
276	Galgo español	\N	\N
277	Galgo húngaro	\N	\N
278	Galgo inglés	\N	\N
279	Galgo italiano	\N	\N
280	Golden retriever	\N	\N
281	Gran danés	\N	\N
282	Gegar colombiano	\N	\N
283	Greyhound	\N	\N
284	Grifón belga	\N	\N
285	Hovawart	\N	\N
286	Husky siberiano	\N	\N
287	Jack Russell Terrier	\N	\N
288	Keeshond	\N	\N
289	Kerry blue terrier	\N	\N
290	Komondor	\N	\N
291	Kuvasz	\N	\N
292	Labrador	\N	\N
293	Lakeland Terrier	\N	\N
294	Laekenois	\N	\N
295	Landseer	\N	\N
296	Lebrel afgano	\N	\N
297	Leonberger	\N	\N
298	Perro lobo de Saarloos	\N	\N
299	Lhasa apso	\N	\N
300	Löwchen	\N	\N
301	Maltés	\N	\N
302	Malinois	\N	\N
303	Manchester terrier	\N	\N
304	Mastín afgano	\N	\N
305	Mastín del Pirineo	\N	\N
306	Mastín español	\N	\N
307	Mastín inglés	\N	\N
308	Mastín napolitano	\N	\N
309	Mastín tibetano	\N	\N
310	Mucuchies	\N	\N
311	Mudi	\N	\N
312	Nova Scotia Duck Tolling Retriever	\N	\N
313	Ovejero magallánico	\N	\N
314	Pastor alemán	\N	\N
315	Pastor belga	\N	\N
316	Pastor blanco suizo	\N	\N
317	Pastor catalán	\N	\N
318	Pastor croata	\N	\N
319	Pastor garafiano	\N	\N
320	Pastor holandés	\N	\N
321	Pastor peruano Chiribaya	\N	\N
322	Pastor de los Pirineos	\N	\N
323	Pastor leonés	\N	\N
324	Pastor mallorquín	\N	\N
325	Pastor maremmano-abrucés	\N	\N
326	Pastor vasco	\N	\N
327	Pekinés	\N	\N
328	Pembroke Welsh Corgi	\N	\N
329	Pequeño Lebrel Italiano	\N	\N
330	Perdiguero francés	\N	\N
331	Perdiguero portugués	\N	\N
332	Perro cimarrón uruguayo	\N	\N
333	Perro de agua americano	\N	\N
334	Perro de agua español	\N	\N
335	Perro de agua irlandés	\N	\N
336	Perro de agua portugués	\N	\N
337	Perro dogo mallorquín	\N	\N
338	Perro esquimal canadiense	\N	\N
339	Perro de Montaña de los Pirineos	\N	\N
340	Perro fino colombiano	\N	\N
341	Perro pastor de las islas Shetland	\N	\N
342	Perro peruano sin pelo	\N	\N
343	Phalène	\N	\N
344	Pinscher alemán	\N	\N
345	Pinscher miniatura	\N	\N
346	Pitbull	\N	\N
347	Podenco canario	\N	\N
348	Podenco ibicenco	\N	\N
349	Podenco portugués	\N	\N
350	Pointer	\N	\N
351	Pomerania	\N	\N
352	Presa canario	\N	\N
353	Pudelpointer	\N	\N
354	Pug	\N	\N
355	Puli	\N	\N
356	Pumi	\N	\N
357	Rafeiro do Alentejo	\N	\N
358	Ratonero bodeguero andaluz	\N	\N
359	Ratonero mallorquín	\N	\N
360	Ratonero valenciano	\N	\N
361	Rhodesian Ridgeback	\N	\N
362	Rottweiler	\N	\N
363	Saluki	\N	\N
364	Samoyedo	\N	\N
365	San Bernardo	\N	\N
366	Schnauzer estándar	\N	\N
367	Schnauzer gigante	\N	\N
368	Schnauzer miniatura	\N	\N
369	Staffordshire Bull Terrier	\N	\N
370	Setter inglés	\N	\N
371	Setter irlandés	\N	\N
372	Shar Pei	\N	\N
373	Shiba Inu	\N	\N
374	Shih Tzu	\N	\N
375	Siberian husky	\N	\N
376	Skye terrier	\N	\N
377	Spitz enano	\N	\N
378	Spitz grande	\N	\N
379	Spitz mediano	\N	\N
380	Spitz japonés	\N	\N
381	Sussex spaniel	\N	\N
382	Teckel	\N	\N
383	Terranova	\N	\N
384	Terrier alemán	\N	\N
385	Terrier australiano	\N	\N
386	Terrier brasileño	\N	\N
387	Terrier chileno	\N	\N
388	Terrier escocés	\N	\N
389	Terrier galés	\N	\N
390	Terrier irlandés	\N	\N
391	Terrier ruso negro	\N	\N
392	Terrier tibetano	\N	\N
393	Tervueren	\N	\N
394	Weimaraner	\N	\N
395	West Highland White Terrier	\N	\N
396	Whippet	\N	\N
397	Wolfsspitz	\N	\N
398	Xoloitzcuintle	\N	\N
399	Yorkshire terrier	\N	\N
\.


--
-- Name: races_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('races_id_seq', 400, false);


--
-- Data for Name: rates; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY rates (id, provider_id, size_id, price, created_at, updated_at) FROM stdin;
1	1	1	20	\N	\N
2	1	2	25	\N	\N
3	1	3	30	\N	\N
4	1	4	35	\N	\N
6	2	1	50	2015-11-03 20:26:20.490684	2015-11-03 20:26:20.490684
7	2	2	70	2015-11-03 20:26:34.09526	2015-11-03 20:26:34.09526
8	2	3	90	2015-11-03 20:26:42.956211	2015-11-03 20:26:42.956211
9	2	4	100	2015-11-03 20:26:51.189732	2015-11-03 20:26:51.189732
10	181	3	23	2015-11-07 10:53:22.462575	2015-11-07 10:53:22.462575
11	181	4	42	2015-11-07 10:53:22.466048	2015-11-07 10:53:22.466048
12	181	2	42	2015-11-07 10:53:22.467949	2015-11-07 10:53:22.467949
13	181	1	32	2015-11-07 10:53:22.470958	2015-11-07 10:53:22.470958
14	182	3	24	2015-11-07 13:15:47.039731	2015-11-07 13:15:47.039731
15	182	4	54	2015-11-07 13:15:47.043051	2015-11-07 13:15:47.043051
16	182	2	56	2015-11-07 13:15:47.045598	2015-11-07 13:15:47.045598
17	182	1	54	2015-11-07 13:15:47.04784	2015-11-07 13:15:47.04784
18	183	3	150	2015-11-07 14:58:49.500067	2015-11-07 14:58:49.500067
19	183	4	200	2015-11-07 14:58:49.502375	2015-11-07 14:58:49.502375
20	183	2	250	2015-11-07 14:58:49.504542	2015-11-07 14:58:49.504542
21	183	1	\N	2015-11-07 14:58:49.506694	2015-11-07 14:58:49.506694
22	184	3	10	2015-11-07 15:19:57.298987	2015-11-07 15:19:57.298987
23	184	4	20	2015-11-07 15:19:57.305625	2015-11-07 15:19:57.305625
24	184	2	30	2015-11-07 15:19:57.309271	2015-11-07 15:19:57.309271
25	184	1	40	2015-11-07 15:19:57.317958	2015-11-07 15:19:57.317958
\.


--
-- Name: rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('rates_id_seq', 25, true);


--
-- Data for Name: referrals; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY referrals (id, code_value, referrer_name, referrer_email, created_at, updated_at) FROM stdin;
1	D5412B	Karla Alarcón	Karla.alarc@gmail.com	2015-02-28 17:02:29.726648	2015-02-28 17:02:29.726648
2	1D17DD	Ester Consuelo Serrano Mendoza 	cony_sm@Yahoo.com.mx	2015-04-01 06:26:27.185565	2015-04-01 06:26:27.185565
3	ADE17B	Lorena 	asken03@hotmail.com	2015-04-10 06:06:17.98113	2015-04-10 06:06:17.98113
4	C2A468	Paty	hans2272@hotmail.com	2015-04-14 03:37:42.806585	2015-04-14 03:37:42.806585
5	76A833	Paulina Gutierrez	sacli1@hhotmail.com	2015-04-14 06:01:15.723787	2015-04-14 06:01:15.723787
6	67C36D	Ada Susana Sánchez González 	hebreos10_39@hotmail.com	2015-04-18 00:16:18.903456	2015-04-18 00:16:18.903456
7	6E9A8A	Gabriela Zapata	gabriela.fuschino@gmail.com	2015-04-30 21:01:22.270233	2015-04-30 21:01:22.270233
8	60F843	Nelly Aguilar	m_nelly.a@hormail.com	2015-05-04 05:24:04.624809	2015-05-04 05:24:04.624809
9	6AE0BD	Eduardo	Ened01@hotmail.com	2015-07-17 21:17:57.342116	2015-07-17 21:17:57.342116
10	7066BA	Edith Hernández 	edi.hpar@gmail.com	2015-07-18 04:23:54.659529	2015-07-18 04:23:54.659529
12	527CBE	Luna	Zaritaorza@hotmail.com	2015-08-02 21:27:12.959136	2015-08-02 21:27:12.959136
13	A94DDE	SANDRA 	liz.970212@gmail.com	2015-08-11 02:35:57.27056	2015-08-11 02:35:57.27056
14	B41B51	Katia	Fercha_k12@hotmail.com	2015-08-25 04:13:59.108287	2015-08-25 04:13:59.108287
15	5AA034	angel martinez palacios	starlord8538@gmail.com	2015-08-26 03:15:46.015626	2015-08-26 03:15:46.015626
17	55712E	Samantha Soto	samantha.finanzas@hotmail.com	2015-09-23 21:09:54.655561	2015-09-23 21:09:54.655561
50	B3161A	Elizabeth Ballinas Landa	elizabethballinas@ymail.com	2015-09-25 23:41:50.930121	2015-09-25 23:41:50.930121
51	274547	Annie	Ranita.annie@gmail.com	2015-09-26 13:52:32.725036	2015-09-26 13:52:32.725036
52	F742FA	Andrea Espinosa	andrea.espinosa66@gmail.com	2015-09-28 03:23:49.469184	2015-09-28 03:23:49.469184
\.


--
-- Name: referrals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('referrals_id_seq', 53, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY schema_migrations (version) FROM stdin;
20140902152307
20140902152803
20140902210537
20140902212603
20140902231431
20140910163216
20141007225812
20141009172639
20141009184742
20141009192426
20141029172124
20150101184602
20150109011531
20150110001414
20150121173240
20150121213023
20150325221218
20150325221307
20150325222506
20150326194701
20150326194900
20150326195132
20150326203324
20150326211416
20150326211904
20150326212010
20150327212932
20150330171513
20150406204604
20150406210300
20150407002919
20150407003211
20150407160446
20150407161403
20150415172016
20150601195627
20150601203136
20150602231925
20150605175423
20150727184520
20150727203940
20150731212450
20150731220311
20150804233110
20150810064809
20150814145700
20150814162413
20151002194245
20151012192549
20151014232144
20151014232208
20151014233438
20151015171720
20151015194317
20151015203937
20151015204104
20151015210812
20151015211010
20151015211600
20151015211613
20151015213054
20151015215002
20151015215441
20151015221204
20151019164242
20151019164429
20151020221922
20151020222926
20151020222951
20151020223024
20151020223114
20151020223134
20151020232223
20151020234241
20151020234305
20151020234425
20151021001551
20151021001926
20151022153510
20151022194837
20151022225846
20151022231218
20151023014409
20151023152558
20151023154230
20151023191146
20151024171218
20151024171313
20151026220431
20151026220545
20151026220749
20151026220816
20151027122928
20151027201255
20151027201320
20151027204527
20151027205941
20151027210046
20151027233328
20151027233902
20151028052758
20151028130823
20151028151542
20151028173711
20151029160219
20151029205030
20151103225803
20151104042808
20151104043120
20151104141913
20151104144057
20151104144139
20151106164041
20151106174420
20151107063329
20151107064223
20151107103256
20151111200833
20151111202211
20151111202715
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY services (id, service_name, created_at, updated_at) FROM stdin;
5	Visita al veterinario	2015-10-20 20:59:27.901435	2015-10-20 20:59:27.901435
6	Acupuntura	2015-10-20 21:58:59.848339	2015-10-20 21:58:59.848339
10	Limpieza dental	2015-10-27 23:47:54.029022	2015-11-10 03:56:56.195431
13	Baño	2015-11-12 04:39:00.571268	2015-11-12 04:39:00.571268
14	Corte de pelo y uñas	2015-11-12 04:39:13.118512	2015-11-12 04:39:13.118512
1	Transportación sencilla	2015-11-05 05:43:52.605583	2015-11-12 04:39:53.929745
2	Transportación redonda	2015-11-07 06:32:18.014496	2015-11-12 04:40:11.452554
15	Guardería	2015-10-20 20:58:58.20522	2015-11-12 04:44:57.84999
\.


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('services_id_seq', 14, true);


--
-- Data for Name: sizes; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY sizes (id, size_title, min_size, max_size, description, symbol) FROM stdin;
3	Pequeños	0	25.3999999999999986		S
4	Gigantes	73.7000000000000028	200		XL
2	Medianos	25.5	50.7999999999999972		M
1	Grandes	50.8999999999999986	73.5999999999999943		L
\.


--
-- Name: sizes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('sizes_id_seq', 5, false);


--
-- Data for Name: sizings; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY sizings (id, provider_id, size_id, additional_service_id) FROM stdin;
1	1	2	\N
2	\N	2	1
4	2	1	\N
5	2	2	\N
6	2	3	\N
7	\N	2	2
8	\N	3	2
9	\N	1	1
10	\N	4	1
11	\N	3	3
13	\N	1	3
15	1	3	\N
16	1	1	\N
17	1	4	\N
22	\N	3	4
23	\N	2	4
24	\N	1	4
25	\N	4	4
26	\N	3	5
27	\N	2	5
28	\N	1	5
29	\N	4	5
30	\N	3	6
31	\N	2	6
32	\N	1	6
33	\N	4	6
34	\N	3	7
36	\N	2	7
37	\N	1	7
38	\N	4	8
39	\N	2	8
40	\N	4	9
41	181	4	\N
42	181	1	\N
43	\N	3	10
44	\N	4	10
45	\N	2	10
46	\N	1	10
47	182	3	\N
48	182	4	\N
49	182	2	\N
50	182	1	\N
51	\N	3	11
52	\N	4	11
53	\N	2	11
54	\N	1	11
55	\N	3	12
56	\N	4	12
57	\N	2	12
58	\N	1	12
59	183	3	\N
60	183	2	\N
61	183	1	\N
62	\N	3	13
63	\N	2	13
64	\N	1	14
65	\N	3	1
66	\N	4	3
67	\N	2	3
68	\N	4	7
69	\N	3	8
70	\N	1	8
71	\N	3	9
72	\N	2	9
73	\N	1	9
74	184	3	\N
75	184	4	\N
76	184	2	\N
77	184	1	\N
78	\N	3	15
79	\N	4	15
80	\N	2	15
81	\N	1	15
82	\N	3	16
83	\N	4	16
84	\N	2	16
85	\N	1	16
86	\N	3	17
87	\N	4	17
88	\N	2	17
89	\N	1	17
\.


--
-- Name: sizings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('sizings_id_seq', 89, true);


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY states (id, name, country_id) FROM stdin;
1	Distrito Federal	1
2	Estado de México	1
3	Jalisco	1
4	Nuevo León	1
5	Buenos Aires	2
6	Ciudad de Panamá	3
\.


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('states_id_seq', 7, false);


--
-- Data for Name: testimonies; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY testimonies (id, body, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: testimonies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('testimonies_id_seq', 1, false);


--
-- Data for Name: user_pets; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY user_pets (id, user_id, pet_id, created_at, updated_at) FROM stdin;
1	1	1	2015-10-23 23:43:53.097012	2015-10-23 23:43:53.097012
2	2	2	2015-10-28 00:16:11.566138	2015-10-28 00:16:11.566138
3	3	3	2015-10-29 19:14:41.325187	2015-10-29 19:14:41.325187
4	4	4	2015-11-02 21:29:51.701258	2015-11-02 21:29:51.701258
5	5	5	2015-11-02 21:51:21.055097	2015-11-02 21:51:21.055097
6	2	6	2015-11-04 21:08:50.690654	2015-11-04 21:08:50.690654
7	6	7	2015-11-05 03:39:11.38575	2015-11-05 03:39:11.38575
8	6	8	2015-11-05 05:17:45.481028	2015-11-05 05:17:45.481028
9	6	9	2015-11-05 05:17:45.486945	2015-11-05 05:17:45.486945
10	7	10	2015-11-05 22:32:00.93269	2015-11-05 22:32:00.93269
11	8	11	2015-11-07 10:41:38.029214	2015-11-07 10:41:38.029214
12	8	12	2015-11-07 10:42:52.073147	2015-11-07 10:42:52.073147
13	8	13	2015-11-07 10:42:52.080377	2015-11-07 10:42:52.080377
14	9	14	2015-11-07 11:35:28.429239	2015-11-07 11:35:28.429239
15	10	15	2015-11-07 13:17:37.020922	2015-11-07 13:17:37.020922
16	11	16	2015-11-07 15:02:04.677101	2015-11-07 15:02:04.677101
17	11	17	2015-11-07 15:02:04.693994	2015-11-07 15:02:04.693994
18	12	18	2015-11-07 15:09:16.243293	2015-11-07 15:09:16.243293
\.


--
-- Name: user_pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('user_pets_id_seq', 18, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, first_name, last_name, phone, location_id, postal_code, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, address, state_name, place_name, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email) FROM stdin;
2	jorge@laboratoria.la	$2a$10$dGnhMpkeLW6bQXIFxVMsJOyfWcMwnMayIlYRyyn/ok2RbLkQW0U4W	\N	\N	\N	15	2015-11-06 22:36:12.281652	2015-11-05 01:43:43.785977	190.236.100.159	190.236.100.159	2015-10-28 00:16:11.524749	2015-11-06 22:36:12.302269	Jorge	Guevara	987654321	\N	44100	brasilia.png	image/png	101123	2015-10-29 03:55:07.988914	\N	\N	\N	\N	\N	\N	\N
3	mail@joelibaceta.com	$2a$10$ftBukHapFr1GWHc3mFMB2Oh6bIpiLwPdTd./I2V/BdkyUhpJ3t8P2	\N	\N	\N	11	2015-11-11 01:19:51.272004	2015-11-09 22:52:59.971158	190.236.100.159	190.236.100.159	2015-10-29 19:14:40.658323	2015-11-11 01:19:51.275025	Joel	Ibaceta	2141234	\N	46460	7462307a8a69c3e7aa725c14fa6908ae.jpeg	image/jpeg	24875	2015-10-29 19:15:03.823008	\N	\N	\N	\N	\N	\N	\N
4	joel_3010@hotmail.com	$2a$10$wjmCUcZ0oU87k0aQZJCePu6aLtOL9SEQg3Y52GvPMoIdPyni/t6D2	\N	\N	\N	12	2015-11-11 17:54:17.227448	2015-11-10 14:58:43.594213	190.236.100.159	190.222.237.36	2015-11-02 21:29:50.95997	2015-11-11 17:54:17.231209	Joel	Ibaceta	2314123	\N	64640	7462307a8a69c3e7aa725c14fa6908ae.jpeg	image/jpeg	24875	2015-11-02 21:29:50.26679	\N	\N	\N	\N	\N	\N	\N
8	lalo@irinon.com	$2a$10$D8RTbRwA6xVHb.gPD.qSq.xyfhZeqAKmKPWXfPB652PojBxDZeDNa	\N	\N	\N	1	2015-11-07 10:41:38.252503	2015-11-07 10:41:38.252503	190.42.3.16	190.42.3.16	2015-11-07 10:41:37.677559	2015-11-07 10:41:38.255036	Art	Apart	9876543210123	\N	44100	missing.png	image/png	89792	2015-11-07 10:41:36.770132	Panamericana 1232131	\N	\N	\N	\N	\N	\N
5	herman@laboratoria.la	$2a$10$YhR7rZLe1Bg4i2FjpqyiF.gCNXpzc59iyOHW4xpXTPvf04rDNE0xO	\N	\N	\N	1	2015-11-02 21:51:21.485943	2015-11-02 21:51:21.485943	190.236.100.159	190.236.100.159	2015-11-02 21:51:20.20184	2015-11-02 21:51:21.487809	German	Marin	12345678	\N	64640	7462307a8a69c3e7aa725c14fa6908ae.jpeg	image/jpeg	24875	2015-11-02 21:51:19.549541	\N	\N	\N	\N	\N	\N	\N
9	lalo@arteaparte.pe	$2a$10$oMCfs6GFY1bpHsp5nCS0a.KRQikWhb5ewKAR.IHZdZIHDKFa8Hxg2	\N	\N	\N	19	2015-11-12 04:54:24.503218	2015-11-11 23:14:45.756059	190.236.100.159	190.236.100.159	2015-11-07 11:35:28.058464	2015-11-12 04:54:24.50795	Cuidador	Mexicano	987654321	\N	44100	missing.png	image/png	89792	2015-11-07 11:35:27.705108	panamericana	\N	\N	\N	\N	\N	\N
10	lalo@soulutions.com.pe	$2a$10$4YQCY/3TaN/r5IL.vOGdfO7nrCT6RM81qPPC7k.YF1B/HAo/PUJnS	\N	\N	\N	1	2015-11-07 13:17:37.977151	2015-11-07 13:17:37.977151	190.42.3.16	190.42.3.16	2015-11-07 13:17:36.467454	2015-11-07 13:17:37.978905	Lalo	Gonzalez	987654321	\N	44100	missing.png	image/png	89792	2015-11-07 13:17:35.925643	adfafafa	\N	\N	\N	\N	\N	\N
13	jc.pichardo@hotmail.com	$2a$10$Lcqy2eTxqkSV3ziDx9SWc.0tsuZrtKmpD.hKQGvEjRtbCjPH.z7cG	\N	\N	\N	1	2015-11-09 16:31:10.41552	2015-11-09 16:31:10.41552	177.224.25.160	177.224.25.160	2015-11-09 16:31:10.402074	2015-11-09 16:31:10.418296	Jonathan	Colin	72222222	\N	52104	\N	\N	\N	\N	XXXX XXXX XXXX	\N	\N	\N	\N	\N	\N
12	coloradomarin@gmail.com	$2a$10$UbYd46I9skXVHByYM.69c.YnEjWi3XKgdysVGOUjdRSkgWM9zBqdm	\N	\N	\N	7	2015-11-09 20:33:40.790327	2015-11-09 17:32:43.45071	132.184.64.59	132.184.64.241	2015-11-07 15:09:15.958445	2015-11-09 20:33:40.793127	Herman	Marin	997509973	\N	06900	IMG_4794.JPG	image/jpeg	119747	2015-11-07 15:09:14.247794		\N	\N	\N	\N	\N	\N
11	r.gonzalez@desdigitec.com	$2a$10$F7u7Dk0FLynrp/IRhfA2YOVaArcGpuQwpKtQfbtEqwqBwNjLblrk2	\N	\N	\N	3	2015-11-10 01:55:43.484185	2015-11-09 21:33:05.400297	189.217.155.17	189.217.155.17	2015-11-07 15:02:04.649984	2015-11-10 01:55:43.488034	Barush	young 	43436578	\N	11700	\N	\N	\N	\N	Bosques duraznos 65\r\nBosques de las lomas	\N	\N	\N	\N	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('users_id_seq', 13, true);


--
-- Data for Name: valuations; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY valuations (id, name, created_at, updated_at) FROM stdin;
1	Cuidado	2015-10-30 12:45:55.936723	2015-10-30 12:45:55.936723
2	Puntualidad	2015-10-30 12:47:19.711339	2015-10-30 12:47:19.711339
3	Limpieza	2015-10-30 13:17:39.064316	2015-10-30 13:17:39.064316
4	Confianza	2015-10-30 13:17:53.326728	2015-11-10 03:43:27.744741
\.


--
-- Name: valuations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('valuations_id_seq', 5, false);


--
-- Data for Name: weights; Type: TABLE DATA; Schema: public; Owner: nsebzzaeuiubut
--

COPY weights (id, name, min_weight, max_weight, created_at, updated_at) FROM stdin;
1	\N	\N	\N	\N	\N
\.


--
-- Name: weights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nsebzzaeuiubut
--

SELECT pg_catalog.setval('weights_id_seq', 2, false);


--
-- Name: accepted_behaviors_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY accepted_behaviors
    ADD CONSTRAINT accepted_behaviors_pkey PRIMARY KEY (id);


--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: add_user_id_to_testimonies_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY add_user_id_to_testimonies
    ADD CONSTRAINT add_user_id_to_testimonies_pkey PRIMARY KEY (id);


--
-- Name: additional_services_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY additional_services
    ADD CONSTRAINT additional_services_pkey PRIMARY KEY (id);


--
-- Name: admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: ages_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY ages
    ADD CONSTRAINT ages_pkey PRIMARY KEY (id);


--
-- Name: agings_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY agings
    ADD CONSTRAINT agings_pkey PRIMARY KEY (id);


--
-- Name: behaviors_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY behaviors
    ADD CONSTRAINT behaviors_pkey PRIMARY KEY (id);


--
-- Name: booked_pets_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY booked_pets
    ADD CONSTRAINT booked_pets_pkey PRIMARY KEY (id);


--
-- Name: booked_services_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY booked_services
    ADD CONSTRAINT booked_services_pkey PRIMARY KEY (id);


--
-- Name: bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: comment_valuations_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY comment_valuations
    ADD CONSTRAINT comment_valuations_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY localizations
    ADD CONSTRAINT localizations_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: meetings_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY meetings
    ADD CONSTRAINT meetings_pkey PRIMARY KEY (id);


--
-- Name: own_sizings_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY own_sizings
    ADD CONSTRAINT own_sizings_pkey PRIMARY KEY (id);


--
-- Name: pet_behaviors_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY pet_behaviors
    ADD CONSTRAINT pet_behaviors_pkey PRIMARY KEY (id);


--
-- Name: pets_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (id);


--
-- Name: promotional_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY promotional_codes
    ADD CONSTRAINT promotional_codes_pkey PRIMARY KEY (id);


--
-- Name: properties_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: provider_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY provider_attachments
    ADD CONSTRAINT provider_attachments_pkey PRIMARY KEY (id);


--
-- Name: providers_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- Name: races_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY races
    ADD CONSTRAINT races_pkey PRIMARY KEY (id);


--
-- Name: rates_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY rates
    ADD CONSTRAINT rates_pkey PRIMARY KEY (id);


--
-- Name: referrals_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY referrals
    ADD CONSTRAINT referrals_pkey PRIMARY KEY (id);


--
-- Name: services_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY sizes
    ADD CONSTRAINT sizes_pkey PRIMARY KEY (id);


--
-- Name: sizings_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY sizings
    ADD CONSTRAINT sizings_pkey PRIMARY KEY (id);


--
-- Name: states_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: testimonies_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY testimonies
    ADD CONSTRAINT testimonies_pkey PRIMARY KEY (id);


--
-- Name: user_pets_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY user_pets
    ADD CONSTRAINT user_pets_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: valuations_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY valuations
    ADD CONSTRAINT valuations_pkey PRIMARY KEY (id);


--
-- Name: weights_pkey; Type: CONSTRAINT; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

ALTER TABLE ONLY weights
    ADD CONSTRAINT weights_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_email ON admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON admin_users USING btree (reset_password_token);


--
-- Name: index_bookings_on_provider_id; Type: INDEX; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE INDEX index_bookings_on_provider_id ON bookings USING btree (provider_id);


--
-- Name: index_localizations_on_location_id; Type: INDEX; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE INDEX index_localizations_on_location_id ON localizations USING btree (location_id);


--
-- Name: index_localizations_on_provider_id; Type: INDEX; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE INDEX index_localizations_on_provider_id ON localizations USING btree (provider_id);


--
-- Name: index_meetings_on_provider_id; Type: INDEX; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE INDEX index_meetings_on_provider_id ON meetings USING btree (provider_id);


--
-- Name: index_providers_on_category_id; Type: INDEX; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE INDEX index_providers_on_category_id ON providers USING btree (category_id);


--
-- Name: index_providers_on_email; Type: INDEX; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE UNIQUE INDEX index_providers_on_email ON providers USING btree (email);


--
-- Name: index_providers_on_reset_password_token; Type: INDEX; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE UNIQUE INDEX index_providers_on_reset_password_token ON providers USING btree (reset_password_token);


--
-- Name: index_states_on_country_id; Type: INDEX; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE INDEX index_states_on_country_id ON states USING btree (country_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: nsebzzaeuiubut; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: nsebzzaeuiubut
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM nsebzzaeuiubut;
GRANT ALL ON SCHEMA public TO nsebzzaeuiubut;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

