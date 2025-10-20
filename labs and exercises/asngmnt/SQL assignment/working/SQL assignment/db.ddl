--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-09-15 12:52:10

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
-- TOC entry 214 (class 1259 OID 16631)
-- Name: call_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.call_rates (
    callrate integer NOT NULL,
    isinternational character varying(5) NOT NULL,
    isroaming character varying(5) NOT NULL,
    costperminute numeric(4,2) NOT NULL
);


ALTER TABLE public.call_rates OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16641)
-- Name: calls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calls (
    phonenumber character varying(13) NOT NULL,
    calltime character varying(16) NOT NULL,
    duration numeric(13,9) NOT NULL,
    connectionid character varying(36) NOT NULL,
    callrate integer NOT NULL
);


ALTER TABLE public.calls OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16656)
-- Name: customer_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_service (
    connectionid character varying(36) NOT NULL
);


ALTER TABLE public.customer_service OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16636)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    phonenumber character varying(13) NOT NULL,
    contractstartdate date NOT NULL,
    dob date NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 3185 (class 2606 OID 16635)
-- Name: call_rates call_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.call_rates
    ADD CONSTRAINT call_rates_pkey PRIMARY KEY (callrate);


--
-- TOC entry 3189 (class 2606 OID 16645)
-- Name: calls calls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calls
    ADD CONSTRAINT calls_pkey PRIMARY KEY (connectionid);


--
-- TOC entry 3191 (class 2606 OID 16660)
-- Name: customer_service customer_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_service
    ADD CONSTRAINT customer_service_pkey PRIMARY KEY (connectionid);


--
-- TOC entry 3187 (class 2606 OID 16640)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (phonenumber);


--
-- TOC entry 3192 (class 2606 OID 16651)
-- Name: calls callrate_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calls
    ADD CONSTRAINT callrate_fk FOREIGN KEY (callrate) REFERENCES public.call_rates(callrate);


--
-- TOC entry 3194 (class 2606 OID 16661)
-- Name: customer_service connectionid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_service
    ADD CONSTRAINT connectionid_fk FOREIGN KEY (connectionid) REFERENCES public.calls(connectionid);


--
-- TOC entry 3193 (class 2606 OID 16646)
-- Name: calls phonenumber_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calls
    ADD CONSTRAINT phonenumber_fk FOREIGN KEY (phonenumber) REFERENCES public.customers(phonenumber);


-- Completed on 2023-09-15 12:52:10

--
-- PostgreSQL database dump complete
--

