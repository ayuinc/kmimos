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
-- Name: accepted_behaviors; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE accepted_behaviors (
    id integer NOT NULL,
    provider_id integer,
    behavior_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE accepted_behaviors OWNER TO kmimos;

--
-- Name: accepted_behaviors_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE accepted_behaviors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE accepted_behaviors_id_seq OWNER TO kmimos;

--
-- Name: accepted_behaviors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE accepted_behaviors_id_seq OWNED BY accepted_behaviors.id;


--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
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


ALTER TABLE active_admin_comments OWNER TO kmimos;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE active_admin_comments_id_seq OWNER TO kmimos;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: add_user_id_to_testimonies; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE add_user_id_to_testimonies (
    id integer NOT NULL,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE add_user_id_to_testimonies OWNER TO kmimos;

--
-- Name: add_user_id_to_testimonies_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE add_user_id_to_testimonies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE add_user_id_to_testimonies_id_seq OWNER TO kmimos;

--
-- Name: add_user_id_to_testimonies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE add_user_id_to_testimonies_id_seq OWNED BY add_user_id_to_testimonies.id;


--
-- Name: additional_services; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
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


ALTER TABLE additional_services OWNER TO kmimos;

--
-- Name: additional_services_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE additional_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE additional_services_id_seq OWNER TO kmimos;

--
-- Name: additional_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE additional_services_id_seq OWNED BY additional_services.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
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


ALTER TABLE admin_users OWNER TO kmimos;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin_users_id_seq OWNER TO kmimos;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE admin_users_id_seq OWNED BY admin_users.id;


--
-- Name: ages; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE ages (
    id integer NOT NULL,
    age_group_name character varying(255)
);


ALTER TABLE ages OWNER TO kmimos;

--
-- Name: ages_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE ages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ages_id_seq OWNER TO kmimos;

--
-- Name: ages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE ages_id_seq OWNED BY ages.id;


--
-- Name: agings; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE agings (
    id integer NOT NULL,
    provider_id integer,
    age_id integer
);


ALTER TABLE agings OWNER TO kmimos;

--
-- Name: agings_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE agings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE agings_id_seq OWNER TO kmimos;

--
-- Name: agings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE agings_id_seq OWNED BY agings.id;


--
-- Name: behaviors; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE behaviors (
    id integer NOT NULL,
    behavior_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    pet_id integer
);


ALTER TABLE behaviors OWNER TO kmimos;

--
-- Name: behaviors_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE behaviors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE behaviors_id_seq OWNER TO kmimos;

--
-- Name: behaviors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE behaviors_id_seq OWNED BY behaviors.id;


--
-- Name: booked_pets; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE booked_pets (
    id integer NOT NULL,
    booking_id integer,
    pet_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE booked_pets OWNER TO kmimos;

--
-- Name: booked_pets_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE booked_pets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE booked_pets_id_seq OWNER TO kmimos;

--
-- Name: booked_pets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE booked_pets_id_seq OWNED BY booked_pets.id;


--
-- Name: booked_services; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE booked_services (
    id integer NOT NULL,
    booking_id integer,
    service_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    pet_id integer
);


ALTER TABLE booked_services OWNER TO kmimos;

--
-- Name: booked_services_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE booked_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE booked_services_id_seq OWNER TO kmimos;

--
-- Name: booked_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE booked_services_id_seq OWNED BY booked_services.id;


--
-- Name: bookings; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
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


ALTER TABLE bookings OWNER TO kmimos;

--
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bookings_id_seq OWNER TO kmimos;

--
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE bookings_id_seq OWNED BY bookings.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE categories OWNER TO kmimos;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO kmimos;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: comment_valuations; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE comment_valuations (
    id integer NOT NULL,
    comment_id integer,
    valuation_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    value integer
);


ALTER TABLE comment_valuations OWNER TO kmimos;

--
-- Name: comment_valuations_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE comment_valuations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comment_valuations_id_seq OWNER TO kmimos;

--
-- Name: comment_valuations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE comment_valuations_id_seq OWNED BY comment_valuations.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
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


ALTER TABLE comments OWNER TO kmimos;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_id_seq OWNER TO kmimos;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
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


ALTER TABLE countries OWNER TO kmimos;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_id_seq OWNER TO kmimos;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE favorites (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    provider_id integer,
    user_id integer
);


ALTER TABLE favorites OWNER TO kmimos;

--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE favorites_id_seq OWNER TO kmimos;

--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE favorites_id_seq OWNED BY favorites.id;


--
-- Name: localizations; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE localizations (
    id integer NOT NULL,
    provider_id integer,
    location_id integer,
    user_id integer
);


ALTER TABLE localizations OWNER TO kmimos;

--
-- Name: localizations_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE localizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE localizations_id_seq OWNER TO kmimos;

--
-- Name: localizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE localizations_id_seq OWNED BY localizations.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    name character varying(255),
    state_id integer,
    utf_name character varying(255)
);


ALTER TABLE locations OWNER TO kmimos;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE locations_id_seq OWNER TO kmimos;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: meetings; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
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


ALTER TABLE meetings OWNER TO kmimos;

--
-- Name: meetings_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE meetings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE meetings_id_seq OWNER TO kmimos;

--
-- Name: meetings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE meetings_id_seq OWNED BY meetings.id;


--
-- Name: own_sizings; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE own_sizings (
    id integer NOT NULL,
    provider_id integer,
    size_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE own_sizings OWNER TO kmimos;

--
-- Name: own_sizings_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE own_sizings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE own_sizings_id_seq OWNER TO kmimos;

--
-- Name: own_sizings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE own_sizings_id_seq OWNED BY own_sizings.id;


--
-- Name: pet_behaviors; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE pet_behaviors (
    id integer NOT NULL,
    behavior_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    provider_id integer,
    behavior_id integer
);


ALTER TABLE pet_behaviors OWNER TO kmimos;

--
-- Name: pet_behaviors_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE pet_behaviors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pet_behaviors_id_seq OWNER TO kmimos;

--
-- Name: pet_behaviors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE pet_behaviors_id_seq OWNED BY pet_behaviors.id;


--
-- Name: pets; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE pets (
    id integer NOT NULL,
    name character varying(255),
    race character varying(255),
    age integer,
    size double precision,
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
    weight_id integer
);


ALTER TABLE pets OWNER TO kmimos;

--
-- Name: pets_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE pets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pets_id_seq OWNER TO kmimos;

--
-- Name: pets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE pets_id_seq OWNED BY pets.id;


--
-- Name: promotional_codes; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE promotional_codes (
    id integer NOT NULL,
    code character varying(255),
    expire_at timestamp without time zone,
    state character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE promotional_codes OWNER TO kmimos;

--
-- Name: promotional_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE promotional_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE promotional_codes_id_seq OWNER TO kmimos;

--
-- Name: promotional_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE promotional_codes_id_seq OWNED BY promotional_codes.id;


--
-- Name: properties; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE properties (
    id integer NOT NULL,
    property_name character varying(255)
);


ALTER TABLE properties OWNER TO kmimos;

--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE properties_id_seq OWNER TO kmimos;

--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE properties_id_seq OWNED BY properties.id;


--
-- Name: provider_attachments; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE provider_attachments (
    id integer NOT NULL,
    provider_id integer,
    photo character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE provider_attachments OWNER TO kmimos;

--
-- Name: provider_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE provider_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE provider_attachments_id_seq OWNER TO kmimos;

--
-- Name: provider_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE provider_attachments_id_seq OWNED BY provider_attachments.id;


--
-- Name: providers; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
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
    behavior_id integer
);


ALTER TABLE providers OWNER TO kmimos;

--
-- Name: providers_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE providers_id_seq OWNER TO kmimos;

--
-- Name: providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE providers_id_seq OWNED BY providers.id;


--
-- Name: races; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE races (
    id integer NOT NULL,
    race_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE races OWNER TO kmimos;

--
-- Name: races_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE races_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE races_id_seq OWNER TO kmimos;

--
-- Name: races_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE races_id_seq OWNED BY races.id;


--
-- Name: rates; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE rates (
    id integer NOT NULL,
    provider_id integer,
    size_id integer,
    price double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE rates OWNER TO kmimos;

--
-- Name: rates_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rates_id_seq OWNER TO kmimos;

--
-- Name: rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE rates_id_seq OWNED BY rates.id;


--
-- Name: referrals; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE referrals (
    id integer NOT NULL,
    code_value character varying(255),
    referrer_name character varying(255),
    referrer_email character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE referrals OWNER TO kmimos;

--
-- Name: referrals_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE referrals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE referrals_id_seq OWNER TO kmimos;

--
-- Name: referrals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE referrals_id_seq OWNED BY referrals.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE schema_migrations OWNER TO kmimos;

--
-- Name: services; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE services (
    id integer NOT NULL,
    service_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE services OWNER TO kmimos;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE services_id_seq OWNER TO kmimos;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE services_id_seq OWNED BY services.id;


--
-- Name: sizes; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE sizes (
    id integer NOT NULL,
    size_title character varying(255),
    min_size double precision,
    max_size double precision,
    description character varying(255)
);


ALTER TABLE sizes OWNER TO kmimos;

--
-- Name: sizes_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE sizes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sizes_id_seq OWNER TO kmimos;

--
-- Name: sizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE sizes_id_seq OWNED BY sizes.id;


--
-- Name: sizings; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE sizings (
    id integer NOT NULL,
    provider_id integer,
    size_id integer,
    additional_service_id integer
);


ALTER TABLE sizings OWNER TO kmimos;

--
-- Name: sizings_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE sizings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sizings_id_seq OWNER TO kmimos;

--
-- Name: sizings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE sizings_id_seq OWNED BY sizings.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE states (
    id integer NOT NULL,
    name character varying(255),
    country_id integer
);


ALTER TABLE states OWNER TO kmimos;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE states_id_seq OWNER TO kmimos;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE states_id_seq OWNED BY states.id;


--
-- Name: testimonies; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE testimonies (
    id integer NOT NULL,
    body text,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE testimonies OWNER TO kmimos;

--
-- Name: testimonies_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE testimonies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE testimonies_id_seq OWNER TO kmimos;

--
-- Name: testimonies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE testimonies_id_seq OWNED BY testimonies.id;


--
-- Name: user_pets; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE user_pets (
    id integer NOT NULL,
    user_id integer,
    pet_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE user_pets OWNER TO kmimos;

--
-- Name: user_pets_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE user_pets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_pets_id_seq OWNER TO kmimos;

--
-- Name: user_pets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE user_pets_id_seq OWNED BY user_pets.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
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
    place_name character varying(255)
);


ALTER TABLE users OWNER TO kmimos;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO kmimos;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: valuations; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE valuations (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE valuations OWNER TO kmimos;

--
-- Name: valuations_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE valuations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE valuations_id_seq OWNER TO kmimos;

--
-- Name: valuations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE valuations_id_seq OWNED BY valuations.id;


--
-- Name: weights; Type: TABLE; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE TABLE weights (
    id integer NOT NULL,
    name character varying(255),
    min_weight double precision,
    max_weight double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE weights OWNER TO kmimos;

--
-- Name: weights_id_seq; Type: SEQUENCE; Schema: public; Owner: kmimos
--

CREATE SEQUENCE weights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE weights_id_seq OWNER TO kmimos;

--
-- Name: weights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kmimos
--

ALTER SEQUENCE weights_id_seq OWNED BY weights.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY accepted_behaviors ALTER COLUMN id SET DEFAULT nextval('accepted_behaviors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY add_user_id_to_testimonies ALTER COLUMN id SET DEFAULT nextval('add_user_id_to_testimonies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY additional_services ALTER COLUMN id SET DEFAULT nextval('additional_services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY ages ALTER COLUMN id SET DEFAULT nextval('ages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY agings ALTER COLUMN id SET DEFAULT nextval('agings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY behaviors ALTER COLUMN id SET DEFAULT nextval('behaviors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY booked_pets ALTER COLUMN id SET DEFAULT nextval('booked_pets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY booked_services ALTER COLUMN id SET DEFAULT nextval('booked_services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY bookings ALTER COLUMN id SET DEFAULT nextval('bookings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY comment_valuations ALTER COLUMN id SET DEFAULT nextval('comment_valuations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY favorites ALTER COLUMN id SET DEFAULT nextval('favorites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY localizations ALTER COLUMN id SET DEFAULT nextval('localizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY meetings ALTER COLUMN id SET DEFAULT nextval('meetings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY own_sizings ALTER COLUMN id SET DEFAULT nextval('own_sizings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY pet_behaviors ALTER COLUMN id SET DEFAULT nextval('pet_behaviors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY pets ALTER COLUMN id SET DEFAULT nextval('pets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY promotional_codes ALTER COLUMN id SET DEFAULT nextval('promotional_codes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY properties ALTER COLUMN id SET DEFAULT nextval('properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY provider_attachments ALTER COLUMN id SET DEFAULT nextval('provider_attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY providers ALTER COLUMN id SET DEFAULT nextval('providers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY races ALTER COLUMN id SET DEFAULT nextval('races_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY rates ALTER COLUMN id SET DEFAULT nextval('rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY referrals ALTER COLUMN id SET DEFAULT nextval('referrals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY services ALTER COLUMN id SET DEFAULT nextval('services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY sizes ALTER COLUMN id SET DEFAULT nextval('sizes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY sizings ALTER COLUMN id SET DEFAULT nextval('sizings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY states ALTER COLUMN id SET DEFAULT nextval('states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY testimonies ALTER COLUMN id SET DEFAULT nextval('testimonies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY user_pets ALTER COLUMN id SET DEFAULT nextval('user_pets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY valuations ALTER COLUMN id SET DEFAULT nextval('valuations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kmimos
--

ALTER TABLE ONLY weights ALTER COLUMN id SET DEFAULT nextval('weights_id_seq'::regclass);


--
-- Data for Name: accepted_behaviors; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY accepted_behaviors (id, provider_id, behavior_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: accepted_behaviors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('accepted_behaviors_id_seq', 1, false);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY active_admin_comments (id, namespace, body, resource_id, resource_type, author_id, author_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('active_admin_comments_id_seq', 1, false);


--
-- Data for Name: add_user_id_to_testimonies; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY add_user_id_to_testimonies (id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: add_user_id_to_testimonies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('add_user_id_to_testimonies_id_seq', 1, false);


--
-- Data for Name: additional_services; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY additional_services (id, service_id, provider_id, size_id, price, created_at, updated_at) FROM stdin;
1	2	19	\N	50	2015-11-03 07:10:19.421105	2015-11-03 07:10:19.421105
2	2	18	1	20	2015-11-04 00:40:53.435767	2015-11-04 04:13:47.055666
\.


--
-- Name: additional_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('additional_services_id_seq', 2, true);


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
1	admin@example.com	$2a$10$GYG4etnRxap72X5Z1.Ee5O1gq4MO6SWFc2S4ODjRMR0ZpV5H3HFWK	\N	\N	\N	7	2015-10-27 22:11:08.062412	2015-10-27 21:40:35.067695	127.0.0.1	127.0.0.1	2015-10-14 23:29:40.768524	2015-10-27 22:11:08.067937
\.


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('admin_users_id_seq', 1, true);


--
-- Data for Name: ages; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY ages (id, age_group_name) FROM stdin;
1	Adultos
2	Cachorros
\.


--
-- Name: ages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('ages_id_seq', 2, true);


--
-- Data for Name: agings; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY agings (id, provider_id, age_id) FROM stdin;
1	18	1
2	19	1
3	19	2
\.


--
-- Name: agings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('agings_id_seq', 3, true);


--
-- Data for Name: behaviors; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY behaviors (id, behavior_name, created_at, updated_at, pet_id) FROM stdin;
1	Agresivo	2015-10-27 22:20:06.131068	2015-10-27 22:20:06.131068	\N
2	Sociable	2015-10-27 22:20:18.128524	2015-10-27 22:20:18.128524	\N
3	Insociable	2015-10-27 22:20:28.848692	2015-10-27 22:20:28.848692	\N
\.


--
-- Name: behaviors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('behaviors_id_seq', 3, true);


--
-- Data for Name: booked_pets; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY booked_pets (id, booking_id, pet_id, created_at, updated_at) FROM stdin;
1	1	2	2015-10-23 19:04:41.289066	2015-10-23 19:04:41.289066
2	2	2	2015-10-23 22:10:59.690274	2015-10-23 22:10:59.690274
3	3	2	2015-10-23 22:11:17.217693	2015-10-23 22:11:17.217693
4	5	1	2015-11-03 23:02:59.398459	2015-11-03 23:02:59.398459
5	6	1	2015-11-03 23:14:17.127777	2015-11-03 23:14:17.127777
6	7	1	2015-11-03 23:18:58.44774	2015-11-03 23:18:58.44774
\.


--
-- Name: booked_pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('booked_pets_id_seq', 6, true);


--
-- Data for Name: booked_services; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY booked_services (id, booking_id, service_id, created_at, updated_at, pet_id) FROM stdin;
1	1	1	2015-10-23 19:04:41.35879	2015-10-23 19:04:41.35879	\N
2	2	1	2015-10-23 22:10:59.72374	2015-10-23 22:10:59.72374	\N
3	3	1	2015-10-23 22:11:17.231693	2015-10-23 22:11:17.231693	\N
4	7	1	2015-11-03 23:18:58.456807	2015-11-03 23:18:58.456807	1
5	7	2	2015-11-03 23:18:58.549254	2015-11-03 23:18:58.549254	1
\.


--
-- Name: booked_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('booked_services_id_seq', 5, true);


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY bookings (id, start_date, end_date, provider_id, user_first_name, user_last_name, user_phone, user_email, user_message, created_at, updated_at, ref_code, raza, edad, cuidado_especial, token, address, pickup_time, dropoff_time, pet_name, user_id, total) FROM stdin;
1	2015-10-23	2015-10-23	\N	\N	\N	\N	\N		2015-10-23 19:04:40.459051	2015-10-23 19:04:40.459051		\N	\N	0	em-uk3souae	Lima	2015-10-23 18:56:00	2015-10-23 18:56:00	\N	\N	\N
2	2015-10-23	2015-10-23	17	\N	\N	\N	\N	Mensaje	2015-10-23 22:10:59.573309	2015-10-23 22:10:59.573309	67586790	\N	\N	0	gfsrs5fyrkg	Lima	2015-10-23 22:10:00	2015-10-23 22:10:00	\N	2	\N
3	2015-10-23	2015-10-23	17	\N	\N	\N	\N	Mensaje	2015-10-23 22:11:17.199272	2015-10-23 22:11:17.199272	67586790	\N	\N	0	lxqomhzi4d0	Lima	2015-10-23 22:10:00	2015-10-23 22:10:00	\N	2	\N
4	2015-10-27	2015-10-27	18	\N	\N	\N	\N		2015-10-27 13:23:31.89769	2015-10-27 13:23:31.89769		\N	\N	\N	5odtyygkxgk	Lima	\N	\N	\N	2	\N
5	2015-11-03	2015-11-03	18	\N	\N	\N	\N		2015-11-03 23:02:59.345801	2015-11-03 23:02:59.345801		\N	\N	\N	uc5r_bm-ihq		\N	\N	\N	1	\N
6	2015-11-03	2015-11-03	18	\N	\N	\N	\N		2015-11-03 23:14:17.116186	2015-11-03 23:14:17.116186		\N	\N	\N	kw8mcptk9b0		\N	\N	\N	1	0
7	2015-11-03	2015-11-03	18	\N	\N	\N	\N		2015-11-03 23:18:58.437591	2015-11-03 23:18:58.437591		\N	\N	\N	2wfrip_2eg4		\N	\N	\N	1	0
\.


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('bookings_id_seq', 7, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY categories (id, name) FROM stdin;
1	Entrenador
2	Hotel
3	Paseador
4	Veterinario
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('categories_id_seq', 4, true);


--
-- Data for Name: comment_valuations; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY comment_valuations (id, comment_id, valuation_id, created_at, updated_at, value) FROM stdin;
1	25	1	2015-10-28 15:27:26.874667	2015-10-28 15:27:26.874667	\N
2	25	2	2015-10-28 15:27:26.914506	2015-10-28 15:27:26.914506	\N
3	25	3	2015-10-28 15:27:26.922615	2015-10-28 15:27:26.922615	\N
4	25	4	2015-10-28 15:27:26.932454	2015-10-28 15:27:26.932454	\N
5	26	1	2015-10-28 15:33:26.547583	2015-10-28 15:33:26.547583	\N
6	26	2	2015-10-28 15:33:26.555492	2015-10-28 15:33:26.555492	\N
7	26	3	2015-10-28 15:33:26.56281	2015-10-28 15:33:26.56281	\N
8	26	4	2015-10-28 15:33:26.569874	2015-10-28 15:33:26.569874	\N
9	27	1	2015-10-28 15:39:04.666413	2015-10-28 15:39:04.666413	3
10	27	2	2015-10-28 15:39:04.686461	2015-10-28 15:39:04.686461	3
11	27	3	2015-10-28 15:39:04.69407	2015-10-28 15:39:04.69407	1
12	27	4	2015-10-28 15:39:04.701586	2015-10-28 15:39:04.701586	4
13	28	1	2015-10-28 16:39:21.876894	2015-10-28 16:39:21.876894	4
14	28	2	2015-10-28 16:39:21.889719	2015-10-28 16:39:21.889719	1
15	28	3	2015-10-28 16:39:21.898721	2015-10-28 16:39:21.898721	3
16	28	4	2015-10-28 16:39:21.907801	2015-10-28 16:39:21.907801	5
17	29	1	2015-10-28 20:10:35.78114	2015-10-28 20:10:35.78114	4
18	29	2	2015-10-28 20:10:35.789197	2015-10-28 20:10:35.789197	2
19	29	3	2015-10-28 20:10:35.796422	2015-10-28 20:10:35.796422	5
20	29	4	2015-10-28 20:10:35.803647	2015-10-28 20:10:35.803647	1
21	30	1	2015-10-28 20:24:10.44032	2015-10-28 20:24:10.44032	4
22	30	2	2015-10-28 20:24:10.458472	2015-10-28 20:24:10.458472	3
23	30	3	2015-10-28 20:24:10.481921	2015-10-28 20:24:10.481921	2
24	30	4	2015-10-28 20:24:10.5033	2015-10-28 20:24:10.5033	0
25	31	1	2015-10-28 20:26:17.058326	2015-10-28 20:26:17.058326	4
26	31	2	2015-10-28 20:26:17.067135	2015-10-28 20:26:17.067135	2
27	31	3	2015-10-28 20:26:17.076199	2015-10-28 20:26:17.076199	3
28	31	4	2015-10-28 20:26:17.084785	2015-10-28 20:26:17.084785	5
\.


--
-- Name: comment_valuations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('comment_valuations_id_seq', 28, true);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY comments (id, user_id, provider_id, title, body, created_at, updated_at) FROM stdin;
1	2	18	\N	Soy un comentario de prueba	2015-10-24 15:15:17.659755	2015-10-24 15:15:17.659755
2	2	18	\N	Hello	2015-10-24 16:31:42.72973	2015-10-24 16:39:34.103251
3	1	18	\N	Hola	2015-10-24 16:40:07.237225	2015-10-24 16:40:07.237225
4	1	18	\N	Prueba	2015-10-24 16:40:28.81862	2015-10-24 16:40:28.81862
5	1	18	\N	Prueba	2015-10-24 16:43:15.143253	2015-10-24 16:43:15.143253
6	1	18	\N	zd	2015-10-24 16:47:11.829372	2015-10-24 16:47:11.829372
7	1	18	\N	zd	2015-10-24 16:47:14.538117	2015-10-24 16:47:14.538117
8	1	18	\N	asdf	2015-10-24 16:48:19.194625	2015-10-24 16:48:19.194625
9	1	18	\N	asdf	2015-10-24 16:48:38.430755	2015-10-24 16:48:38.430755
10	1	18	\N	asdf	2015-10-24 16:48:51.967273	2015-10-24 16:48:51.967273
11	1	18	\N	asdf	2015-10-24 16:48:52.897936	2015-10-24 16:48:52.897936
12	1	18	\N	prueba 2	2015-10-24 16:51:48.063451	2015-10-24 16:51:48.063451
13	1	18	\N	prueba 2	2015-10-24 16:53:12.511733	2015-10-24 16:53:12.511733
14	1	18	\N	prueba 2	2015-10-24 16:53:50.839641	2015-10-24 16:53:50.839641
15	1	18	\N	asdf	2015-10-24 16:53:55.353819	2015-10-24 16:53:55.353819
16	1	18	\N	Test	2015-10-24 16:53:59.861712	2015-10-24 16:53:59.861712
17	1	18	\N	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas et odio orci. Duis lorem sem, vestibulum ut aliquet eu, posuere sit amet magna. Cras fringilla ac odio vel sagittis. Suspendisse blandit lectus in mi tristique, vitae scelerisque magna ullamcorper. Suspendisse rhoncus eros quis tortor mollis volutpat eget quis ante.	2015-10-24 17:05:54.190832	2015-10-24 17:05:54.190832
18	1	18	\N	Ut imperdiet aliquet sapien eget bibendum. Phasellus rhoncus pellentesque semper. Donec tempor vitae nulla non bibendum. Proin vestibulum nibh at eros pulvinar finibus.	2015-10-24 17:06:17.024477	2015-10-24 17:06:17.024477
19	1	18	\N	 fringilla ac odio vel sagittis. Suspendisse blandit lectus in mi tristique, vitae scelerisque magna ullamcorper. Suspendisse rhoncus eros quis tortor mollis volutpat eget quis ante.	2015-10-24 17:25:16.649776	2015-10-24 17:25:16.649776
20	2	18	\N	Test	2015-10-24 21:13:28.590982	2015-10-24 21:13:28.590982
21	2	18	\N	Prueba	2015-10-25 17:24:55.179668	2015-10-25 17:24:55.179668
22	2	18	\N	Prueba 2	2015-10-27 08:04:42.118591	2015-10-27 08:04:42.118591
23	2	18	\N	Prueba	2015-10-27 23:05:30.05053	2015-10-27 23:05:30.05053
24	2	18	\N	Hello	2015-10-28 15:24:53.001887	2015-10-28 15:24:53.001887
25	2	18	\N	Test	2015-10-28 15:27:26.861246	2015-10-28 15:27:26.861246
26	2	18	\N	3	2015-10-28 15:33:26.502765	2015-10-28 15:33:26.502765
27	2	18	\N	prueba	2015-10-28 15:39:04.638002	2015-10-28 15:39:04.638002
28	2	18	\N	HI	2015-10-28 16:39:21.867057	2015-10-28 16:39:21.867057
29	2	18	\N	Soy un comentario de Prueba	2015-10-28 20:10:35.742288	2015-10-28 20:10:35.742288
30	2	18	\N	Pruebas 	2015-10-28 20:24:10.388916	2015-10-28 20:24:10.388916
31	2	18	\N		2015-10-28 20:26:17.049026	2015-10-28 20:26:17.049026
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('comments_id_seq', 31, true);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY countries (id, name, locale, currency, created_at, updated_at, phone, facebook, twitter, flag, domain, dni_length, dni_label) FROM stdin;
1	México	es-MX	MXN $	2015-10-14 22:57:49.729485	2015-10-14 22:57:49.729485	+55 3455 0138	https://www.facebook.com/pages/Kamimos/1473614136234432?ref=bookmarks	https://twitter.com/KmimosMx	mexico	mx.kmimos.la	13	IFE
2	Argentina	es-AR	ARS $	2015-10-14 22:57:50.394725	2015-10-14 22:57:50.394725	+55 3455 0138	https://www.facebook.com/pages/Kamimos/1473614136234432?ref=bookmarks	https://twitter.com/KmimosMx	argentina	ar.kmimos.la	8	DNI
3	Panamá	es-PA	PAN B/.	2015-10-14 22:57:50.996508	2015-10-14 22:57:50.996508	+507 62453172	https://www.facebook.com/pages/Kamimos/1473614136234432?ref=bookmarks	https://twitter.com/KmimosMx	panama	pa.kmimos.la	12	ID
\.


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('countries_id_seq', 3, true);


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY favorites (id, created_at, updated_at, provider_id, user_id) FROM stdin;
\.


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('favorites_id_seq', 1, false);


--
-- Data for Name: localizations; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY localizations (id, provider_id, location_id, user_id) FROM stdin;
10	2	1	\N
15	13	3	\N
16	13	3	\N
19	16	3	\N
20	16	8	\N
21	16	18	\N
22	16	19	\N
23	16	20	\N
24	17	24	\N
25	17	29	\N
26	17	37	\N
27	17	48	\N
28	17	56	\N
30	17	73	\N
31	17	78	\N
33	18	30	\N
34	18	28	\N
35	18	19	\N
36	18	24	\N
37	18	6	\N
38	\N	29	\N
39	\N	30	\N
40	\N	31	\N
41	\N	32	\N
42	\N	27	\N
29	19	65	\N
32	19	89	\N
\.


--
-- Name: localizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('localizations_id_seq', 42, true);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: kmimos
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
66	Versalles	6	Versalles
93	Albrook	6	Albrook
94	Clayton	6	Clayton
95	Coco del Mar	6	Coco del Mar
96	Altos del Golf	6	Altos del Golf
97	Campo Lindberg	6	Campo Lindberg
98	Brisas del Golf	6	Brisas del Golf
99	12 de Octubre	6	12 de Octubre
100	Rio Abajo	6	Rio Abajo
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('locations_id_seq', 100, true);


--
-- Data for Name: meetings; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY meetings (id, provider_id, user_first_name, user_last_name, user_phone, user_email, token) FROM stdin;
\.


--
-- Name: meetings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('meetings_id_seq', 1, false);


--
-- Data for Name: own_sizings; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY own_sizings (id, provider_id, size_id, created_at, updated_at) FROM stdin;
1	18	2	2015-10-16 14:05:38.72002	2015-10-16 14:05:38.72002
2	19	2	2015-11-03 07:10:19.272148	2015-11-03 07:10:19.272148
3	19	3	2015-11-03 07:10:19.327161	2015-11-03 07:10:19.327161
4	19	1	2015-11-03 07:10:19.337808	2015-11-03 07:10:19.337808
\.


--
-- Name: own_sizings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('own_sizings_id_seq', 4, true);


--
-- Data for Name: pet_behaviors; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY pet_behaviors (id, behavior_name, created_at, updated_at, provider_id, behavior_id) FROM stdin;
\.


--
-- Name: pet_behaviors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('pet_behaviors_id_seq', 1, false);


--
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY pets (id, name, race, age, size, weight, sex, behavior_id, created_at, updated_at, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, size_id, race_id, weight_id) FROM stdin;
2	Fido	Doberman	21	\N	122		\N	2015-10-22 23:25:34.737757	2015-10-23 18:11:47.642966	BW_Python_logo.jpg	image/jpeg	60266	2015-10-23 18:11:44.971985	1	\N	\N
3	Pepito	Pitbull	5	\N	10	M	\N	2015-10-23 18:11:47.865327	2015-10-23 18:12:18.250706	\N	\N	\N	\N	3	\N	\N
8	Suki	\N	6	\N	34	Masculino	2	2015-10-28 21:41:01.583656	2015-10-28 22:55:58.524401	mascota2.jpg	image/jpeg	231578	2015-10-28 22:55:56.882982	2	5	\N
10		\N	\N	\N	\N	\N	\N	2015-10-28 23:30:48.441997	2015-10-28 23:30:48.441997	mascota5.jpg	image/jpeg	244169	2015-10-28 23:30:45.096378	\N	\N	\N
9	Fido	\N	4	\N	\N	Masculino	1	2015-10-28 22:22:58.641892	2015-10-29 00:40:43.19744	mascota1.jpg	image/jpeg	61345	2015-10-28 23:30:43.777851	1	1	\N
11	23	\N	10	\N	\N	Masculino	2	2015-10-29 00:50:02.614644	2015-10-29 00:50:02.614644	mascota2.jpg	image/jpeg	231578	2015-10-29 00:49:58.987584	3	3	\N
1	Fido	Doberman	12	12	12	M	\N	2015-10-21 00:07:20.129334	2015-11-04 05:37:36.383815	mascota2.jpg	image/jpeg	231578	2015-11-03 16:17:00.000562	1	5	\N
\.


--
-- Name: pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('pets_id_seq', 11, true);


--
-- Data for Name: promotional_codes; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY promotional_codes (id, code, expire_at, state, created_at, updated_at) FROM stdin;
\.


--
-- Name: promotional_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('promotional_codes_id_seq', 1, false);


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY properties (id, property_name) FROM stdin;
1	Casa
2	Departamento
\.


--
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('properties_id_seq', 2, true);


--
-- Data for Name: provider_attachments; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY provider_attachments (id, provider_id, photo, created_at, updated_at) FROM stdin;
1	18	Hemingway_House_side_yard.jpg	2015-10-16 14:05:38.833946	2015-10-16 14:05:38.833946
2	18	may-13-2012-003.jpg	2015-10-16 14:05:38.87155	2015-10-16 14:05:38.87155
3	19	mascota4.jpg	2015-11-03 07:10:19.484188	2015-11-03 07:10:19.484188
\.


--
-- Name: provider_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('provider_attachments_id_seq', 3, true);


--
-- Data for Name: providers; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY providers (id, name, last_name_1, last_name_2, dni, email, category_id, created_at, updated_at, password_digest, avg_rating, phone, description, email_c, avatar, price, areas_externas, emergencia, experiencia, iframe_code, property_id, active, latitude, longitude, address, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, has_other_pets, number_of_pets, pets_allowed, has_green, has_yard, pet_behavior_id, on_top, check_in, check_out, is_favorite, behaviors_accepted, behavior_id) FROM stdin;
17	Joel	Ibaceta	\N	1234567891234	niohnex@gmail.com	\N	2015-10-16 12:38:53.525156	2015-10-22 20:48:54.311654	\N	\N	3925778	Lorem ipsum	\N	7462307a8a69c3e7aa725c14fa6908ae.jpeg	100	\N	\N	3	\N	\N	t	-12.088507986388924	-77.03500262756349	Puerto Madero	$2a$10$PEbEG2qb0RwKNMuYu9tpy.VaJndjSORrVd/kXC0rT5nO1xs8JeuVS	\N	\N	\N	1	2015-10-16 12:38:53.944733	2015-10-16 12:38:53.944733	127.0.0.1	127.0.0.1	\N	\N	\N	t	t	\N	t	\N	\N	\N	\N	\N
18	Joel	Ibaceta		1234578653728	joel_3010@hotmail.com	\N	2015-10-16 14:05:38.549856	2015-10-28 12:14:42.480298	\N	\N	39257783	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque imperdiet, felis dictum tincidunt euismod, mi augue dapibus dolor, eget porta ex nunc sit amet est. Maecenas magna massa, commodo id lacus eu, molestie commodo libero. Duis consectetur fringilla posuere. Aenean dignissim, orci vel convallis tempus, justo augue maximus nisl, sed semper velit elit vel eros. Integer interdum luctus quam, pretium fermentum est accumsan a. Nulla facilisi. Etiam vitae purus mi. Etiam ante quam, tempus ac massa non, egestas egestas leo. 	\N	7462307a8a69c3e7aa725c14fa6908ae.jpeg	100	\N	\N	3	\N	\N	t	-12.08851973122764	-77.03500023346986	Toluca	$2a$10$yD.gm2ykS6cSZqx/S2ueSuTqbUsgyyv9IldgXUibdQ8C0ESttBHY2	\N	\N	\N	1	2015-10-16 14:05:39.017776	2015-10-16 14:05:39.017776	127.0.0.1	127.0.0.1	f	5	8	t	t	\N	t	\N	\N	t	\N	\N
16	Joel	Ibaceta		1234567890123	mail@joelibaceta.com	1	2015-10-16 07:44:20.908147	2015-11-03 17:10:58.485706	\N	\N	984740003		\N	\N	\N		f	\N	\N	\N	t	-12.088434190330739	-77.03502626719994	Lima	$2a$10$AhPMIc9cRYsJwgnXgH1FXesr0U4LANhuRtYOwchsXDUoSSJ8As6T6	\N	\N	\N	4	2015-11-03 17:03:34.640596	2015-10-23 00:06:34.414193	127.0.0.1	127.0.0.1	\N	\N	\N	\N	\N	\N	t	\N	\N	\N	--- []\n	\N
19	Joel	Ibaceta	\N	1234567890987	admin@example.com	\N	2015-11-03 07:10:18.324318	2015-11-04 22:52:34.387842	\N	\N	3241412	Lorem ipsum dolor sit amte	\N	7462307a8a69c3e7aa725c14fa6908ae.jpeg	\N	\N	t	5	\N	1	t	-12.0266998	-76.88958430000002	Ate	$2a$10$GCKHki3.Ictu6BJ.u9TStuHHUDdJDF6G1itpnTjfR/2pfRJa1uugO	\N	\N	\N	4	2015-11-04 22:52:34.380235	2015-11-04 22:02:17.989821	127.0.0.1	127.0.0.1	t	5	4	t	t	\N	\N	03:59:00	18:59:00	\N	--- []\n	3
\.


--
-- Name: providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('providers_id_seq', 19, true);


--
-- Data for Name: races; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY races (id, race_name, created_at, updated_at) FROM stdin;
1	Affenpinscher	2015-10-27 21:31:40.818934	2015-10-27 21:31:40.818934
2	Airedale terrier	2015-10-27 21:31:58.504384	2015-10-27 21:31:58.504384
3	Akita Inu	2015-10-27 21:32:09.632984	2015-10-27 21:32:09.632984
4	Akita Americano	2015-10-27 21:32:20.983853	2015-10-27 21:32:20.983853
5	Alano español	2015-10-27 21:32:31.330727	2015-10-27 21:32:31.330727
6	Alaskan malamute	2015-10-27 21:32:43.814441	2015-10-27 21:32:43.814441
7	American Hairless terrier	2015-10-27 21:32:54.798731	2015-10-27 21:32:54.798731
\.


--
-- Name: races_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('races_id_seq', 7, true);


--
-- Data for Name: rates; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY rates (id, provider_id, size_id, price, created_at, updated_at) FROM stdin;
1	18	1	20	2015-10-27 18:29:00.428556	2015-10-27 18:29:00.428556
2	19	2	\N	2015-11-03 07:10:18.968704	2015-11-03 07:10:18.968704
3	19	3	\N	2015-11-03 07:10:19.041651	2015-11-03 07:10:19.041651
4	19	1	\N	2015-11-03 07:10:19.050284	2015-11-03 07:10:19.050284
5	19	2	20	2015-11-03 07:36:35.76757	2015-11-03 07:36:35.76757
6	19	3	30	2015-11-03 07:36:35.778446	2015-11-03 07:36:35.778446
7	19	1	40	2015-11-03 07:36:35.787726	2015-11-03 07:36:35.787726
\.


--
-- Name: rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('rates_id_seq', 7, true);


--
-- Data for Name: referrals; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY referrals (id, code_value, referrer_name, referrer_email, created_at, updated_at) FROM stdin;
\.


--
-- Name: referrals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('referrals_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: kmimos
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
20151104141019
20151104141913
20151104144057
20151104144139
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY services (id, service_name, created_at, updated_at) FROM stdin;
1	Baño	2015-10-21 23:45:31.038202	2015-10-21 23:45:31.038202
2	Corte de pelo y uñas	2015-10-21 23:45:46.024518	2015-10-21 23:45:46.024518
\.


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('services_id_seq', 2, true);


--
-- Data for Name: sizes; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY sizes (id, size_title, min_size, max_size, description) FROM stdin;
2	Medianos	\N	\N	\N
3	Pequeños	\N	\N	\N
1	Grandes	20	50	\N
\.


--
-- Name: sizes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('sizes_id_seq', 3, true);


--
-- Data for Name: sizings; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY sizings (id, provider_id, size_id, additional_service_id) FROM stdin;
1	18	1	\N
2	18	2	\N
3	19	2	\N
4	19	3	\N
5	19	1	\N
6	\N	2	1
7	\N	3	1
8	\N	1	1
\.


--
-- Name: sizings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('sizings_id_seq', 8, true);


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: kmimos
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
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('states_id_seq', 6, true);


--
-- Data for Name: testimonies; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY testimonies (id, body, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: testimonies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('testimonies_id_seq', 1, false);


--
-- Data for Name: user_pets; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY user_pets (id, user_id, pet_id, created_at, updated_at) FROM stdin;
1	1	1	2015-10-21 00:07:20.195275	2015-10-21 00:07:20.195275
2	2	2	2015-10-22 23:25:35.94463	2015-10-22 23:25:35.94463
3	2	3	2015-10-23 18:11:48.051366	2015-10-23 18:11:48.051366
5	8	9	2015-10-28 22:22:58.673658	2015-10-28 22:22:58.673658
7	8	11	2015-10-29 00:50:07.204415	2015-10-29 00:50:07.204415
\.


--
-- Name: user_pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('user_pets_id_seq', 7, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, first_name, last_name, phone, location_id, postal_code, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, address, state_name, place_name) FROM stdin;
8	niohnex@gmail.com	$2a$10$Vo7uW1sRCQTS72yCtuIfwO/3yoV3bHGO4T1.2B.0nZPN4eR0YQF3O	\N	\N	\N	1	2015-10-28 21:41:05.15054	2015-10-28 21:41:05.15054	127.0.0.1	127.0.0.1	2015-10-28 21:41:01.551027	2015-10-28 21:41:51.213371	Joel	Ibaceta	02412934	\N	46460	7462307a8a69c3e7aa725c14fa6908ae.jpeg	image/jpeg	24875	2015-10-28 21:41:50.090666	\N	\N	\N
2	joel_3010@hotmail.com	$2a$10$GOWX7n6aIXqJwOV0jij9vOPyhtn8tnJTbkZwfg5x188qhtMQfhFKG	\N	\N	\N	16	2015-11-03 04:35:06.758616	2015-11-02 16:09:02.681891	127.0.0.1	127.0.0.1	2015-10-22 23:25:33.961847	2015-11-03 04:35:07.029099	Joel	Ibacet	1234123	30	Lima 36	centrosUniversitarios01.jpg	image/jpeg	177983	2015-10-23 18:09:51.857344	Lima	\N	\N
1	mail@joelibaceta.com	$2a$10$AsY91SbztcrZQQP3oTNrYOR66s3lFVwzM55Qvu8OEao.pzINCCCxm	\N	\N	\N	13	2015-11-04 20:40:24.651152	2015-11-04 20:16:24.849685	127.0.0.1	127.0.0.1	2015-10-21 00:07:20.104657	2015-11-04 20:40:24.658722	Joel	Ibaceta	2194123	19	Lima	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('users_id_seq', 8, true);


--
-- Data for Name: valuations; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY valuations (id, name, created_at, updated_at) FROM stdin;
1	Cuidado	2015-10-27 23:14:02.982955	2015-10-27 23:14:02.982955
2	Puntualidad	2015-10-27 23:14:13.759963	2015-10-27 23:14:13.759963
3	Limpieza	2015-10-27 23:14:20.895753	2015-10-27 23:14:20.895753
4	Area de Cuidado	2015-10-27 23:14:34.122513	2015-10-27 23:14:34.122513
\.


--
-- Name: valuations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('valuations_id_seq', 4, true);


--
-- Data for Name: weights; Type: TABLE DATA; Schema: public; Owner: kmimos
--

COPY weights (id, name, min_weight, max_weight, created_at, updated_at) FROM stdin;
\.


--
-- Name: weights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kmimos
--

SELECT pg_catalog.setval('weights_id_seq', 1, false);


--
-- Name: accepted_behaviors_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY accepted_behaviors
    ADD CONSTRAINT accepted_behaviors_pkey PRIMARY KEY (id);


--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: add_user_id_to_testimonies_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY add_user_id_to_testimonies
    ADD CONSTRAINT add_user_id_to_testimonies_pkey PRIMARY KEY (id);


--
-- Name: additional_services_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY additional_services
    ADD CONSTRAINT additional_services_pkey PRIMARY KEY (id);


--
-- Name: admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: ages_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY ages
    ADD CONSTRAINT ages_pkey PRIMARY KEY (id);


--
-- Name: agings_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY agings
    ADD CONSTRAINT agings_pkey PRIMARY KEY (id);


--
-- Name: behaviors_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY behaviors
    ADD CONSTRAINT behaviors_pkey PRIMARY KEY (id);


--
-- Name: booked_pets_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY booked_pets
    ADD CONSTRAINT booked_pets_pkey PRIMARY KEY (id);


--
-- Name: booked_services_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY booked_services
    ADD CONSTRAINT booked_services_pkey PRIMARY KEY (id);


--
-- Name: bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: comment_valuations_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY comment_valuations
    ADD CONSTRAINT comment_valuations_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY localizations
    ADD CONSTRAINT localizations_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: meetings_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY meetings
    ADD CONSTRAINT meetings_pkey PRIMARY KEY (id);


--
-- Name: own_sizings_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY own_sizings
    ADD CONSTRAINT own_sizings_pkey PRIMARY KEY (id);


--
-- Name: pet_behaviors_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY pet_behaviors
    ADD CONSTRAINT pet_behaviors_pkey PRIMARY KEY (id);


--
-- Name: pets_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (id);


--
-- Name: promotional_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY promotional_codes
    ADD CONSTRAINT promotional_codes_pkey PRIMARY KEY (id);


--
-- Name: properties_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: provider_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY provider_attachments
    ADD CONSTRAINT provider_attachments_pkey PRIMARY KEY (id);


--
-- Name: providers_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- Name: races_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY races
    ADD CONSTRAINT races_pkey PRIMARY KEY (id);


--
-- Name: rates_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY rates
    ADD CONSTRAINT rates_pkey PRIMARY KEY (id);


--
-- Name: referrals_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY referrals
    ADD CONSTRAINT referrals_pkey PRIMARY KEY (id);


--
-- Name: services_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY sizes
    ADD CONSTRAINT sizes_pkey PRIMARY KEY (id);


--
-- Name: sizings_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY sizings
    ADD CONSTRAINT sizings_pkey PRIMARY KEY (id);


--
-- Name: states_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: testimonies_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY testimonies
    ADD CONSTRAINT testimonies_pkey PRIMARY KEY (id);


--
-- Name: user_pets_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY user_pets
    ADD CONSTRAINT user_pets_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: valuations_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY valuations
    ADD CONSTRAINT valuations_pkey PRIMARY KEY (id);


--
-- Name: weights_pkey; Type: CONSTRAINT; Schema: public; Owner: kmimos; Tablespace: 
--

ALTER TABLE ONLY weights
    ADD CONSTRAINT weights_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_email ON admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON admin_users USING btree (reset_password_token);


--
-- Name: index_bookings_on_provider_id; Type: INDEX; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE INDEX index_bookings_on_provider_id ON bookings USING btree (provider_id);


--
-- Name: index_localizations_on_location_id; Type: INDEX; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE INDEX index_localizations_on_location_id ON localizations USING btree (location_id);


--
-- Name: index_localizations_on_provider_id; Type: INDEX; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE INDEX index_localizations_on_provider_id ON localizations USING btree (provider_id);


--
-- Name: index_meetings_on_provider_id; Type: INDEX; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE INDEX index_meetings_on_provider_id ON meetings USING btree (provider_id);


--
-- Name: index_providers_on_category_id; Type: INDEX; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE INDEX index_providers_on_category_id ON providers USING btree (category_id);


--
-- Name: index_providers_on_email; Type: INDEX; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE UNIQUE INDEX index_providers_on_email ON providers USING btree (email);


--
-- Name: index_providers_on_reset_password_token; Type: INDEX; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE UNIQUE INDEX index_providers_on_reset_password_token ON providers USING btree (reset_password_token);


--
-- Name: index_states_on_country_id; Type: INDEX; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE INDEX index_states_on_country_id ON states USING btree (country_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: kmimos; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: joelibaceta
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM joelibaceta;
GRANT ALL ON SCHEMA public TO joelibaceta;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

