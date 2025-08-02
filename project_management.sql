--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-08-02 18:57:22

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 218 (class 1259 OID 24600)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(100)
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24595)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    hire_date date,
    salary numeric(10,2),
    department_id integer
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24610)
-- Name: employee_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_projects (
    employee_id integer NOT NULL,
    project_id integer NOT NULL,
    assigned_date date
);


ALTER TABLE public.employee_projects OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24605)
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    project_id integer NOT NULL,
    project_name character varying(100),
    start_date date,
    end_date date
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- TOC entry 4862 (class 0 OID 24600)
-- Dependencies: 218
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (department_id, department_name) FROM stdin;
1	Human Resources
2	Finance
3	Information Technology
4	Marketing
5	Legal
6	Operations
7	Customer Service
8	Sales
9	Research and Development
10	Procurement
\.


--
-- TOC entry 4861 (class 0 OID 24595)
-- Dependencies: 217
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employee_id, first_name, last_name, email, hire_date, salary, department_id) FROM stdin;
101	Alice	Johnson	alice.johnson@company.com	2015-03-15	4500.00	1
102	Bob	Smith	bob.smith@company.com	2018-06-23	5200.00	3
103	Carol	Adams	carol.adams@company.com	2012-09-10	6700.00	2
104	David	Lee	david.lee@company.com	2020-01-05	3800.00	4
105	Eve	Martins	eve.martins@company.com	2019-12-11	4000.00	3
106	Frank	Green	frank.green@company.com	2017-07-08	6000.00	8
107	Grace	Brown	grace.brown@company.com	2014-11-02	4900.00	5
108	Hank	Wilson	hank.wilson@company.com	2013-02-17	3100.00	6
109	Ivy	Clark	ivy.clark@company.com	2021-08-30	2700.00	9
110	Jake	White	jake.white@company.com	2022-05-19	3600.00	7
\.


--
-- TOC entry 4864 (class 0 OID 24610)
-- Dependencies: 220
-- Data for Name: employee_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_projects (employee_id, project_id, assigned_date) FROM stdin;
101	201	2023-01-10
102	203	2024-01-05
103	202	2022-05-20
104	204	2025-02-10
105	203	2024-01-07
106	207	2022-04-15
107	205	2023-07-15
108	210	2022-09-10
109	208	2025-01-10
110	206	2021-11-05
\.


--
-- TOC entry 4863 (class 0 OID 24605)
-- Dependencies: 219
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (project_id, project_name, start_date, end_date) FROM stdin;
201	HR Revamp	2023-01-01	2023-12-31
202	Finance Automation	2022-05-15	2023-04-30
203	IT Infrastructure Upgrade	2024-01-01	\N
204	Marketing Blitz 2025	2025-02-01	2025-06-30
205	Legal Compliance	2023-07-10	2024-01-10
206	Customer Portal	2021-11-01	2022-10-31
207	Sales Booster	2022-04-01	2023-03-31
208	R&D Pilot	2025-01-01	\N
209	Procurement Tracker	2024-03-15	2024-11-15
210	Operations Streamline	2022-09-01	2023-09-01
\.


--
-- TOC entry 4709 (class 2606 OID 24604)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- TOC entry 4707 (class 2606 OID 24599)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 4713 (class 2606 OID 24614)
-- Name: employee_projects employee_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_projects
    ADD CONSTRAINT employee_projects_pkey PRIMARY KEY (employee_id, project_id);


--
-- TOC entry 4711 (class 2606 OID 24609)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (project_id);


--
-- TOC entry 4714 (class 2606 OID 24615)
-- Name: employee_projects employee_projects_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_projects
    ADD CONSTRAINT employee_projects_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- TOC entry 4715 (class 2606 OID 24620)
-- Name: employee_projects employee_projects_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_projects
    ADD CONSTRAINT employee_projects_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(project_id);


-- Completed on 2025-08-02 18:57:23

--
-- PostgreSQL database dump complete
--

