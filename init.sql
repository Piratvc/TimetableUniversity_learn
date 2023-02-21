
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



CREATE TABLE public.cabinets (
    id bigint NOT NULL,
    title text,
    cabinetnumber smallint NOT NULL
);

ALTER TABLE public.cabinets OWNER TO postgres;

CREATE SEQUENCE public."Cabinets_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public."Cabinets_ID_seq" OWNER TO postgres;

ALTER SEQUENCE public."Cabinets_ID_seq" OWNED BY public.cabinets.id;

CREATE TABLE public.groups (
    id bigint NOT NULL,
    numbercource smallint NOT NULL,
    numbergroup smallint NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

CREATE SEQUENCE public."Groups_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Groups_ID_seq" OWNER TO postgres;

ALTER SEQUENCE public."Groups_ID_seq" OWNED BY public.groups.id;

CREATE TABLE public.lecturers (
    id bigint NOT NULL,
    name_id_fk bigint
);


ALTER TABLE public.lecturers OWNER TO postgres;

CREATE SEQUENCE public."Lecturers_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Lecturers_ID_seq" OWNER TO postgres;

ALTER SEQUENCE public."Lecturers_ID_seq" OWNED BY public.lecturers.id;

CREATE TABLE public.lessons (
    id bigint NOT NULL,
    title text NOT NULL
);


ALTER TABLE public.lessons OWNER TO postgres;

CREATE SEQUENCE public."Lessons_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Lessons_ID_seq" OWNER TO postgres;


ALTER SEQUENCE public."Lessons_ID_seq" OWNED BY public.lessons.id;


CREATE TABLE public.recordslessons (
    id bigint NOT NULL,
    lessontitle_fk bigint NOT NULL,
    lecturername_fk bigint NOT NULL,
    cabinet_fk bigint NOT NULL,
    "time" date NOT NULL
);


ALTER TABLE public.recordslessons OWNER TO postgres;

CREATE SEQUENCE public."RecordsLessons_Cabinet_FK_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RecordsLessons_Cabinet_FK_seq" OWNER TO postgres;

ALTER SEQUENCE public."RecordsLessons_Cabinet_FK_seq" OWNED BY public.recordslessons.cabinet_fk;

CREATE SEQUENCE public."RecordsLessons_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RecordsLessons_ID_seq" OWNER TO postgres;

ALTER SEQUENCE public."RecordsLessons_ID_seq" OWNED BY public.recordslessons.id;

CREATE SEQUENCE public."RecordsLessons_LecturerName_FK_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RecordsLessons_LecturerName_FK_seq" OWNER TO postgres;

ALTER SEQUENCE public."RecordsLessons_LecturerName_FK_seq" OWNED BY public.recordslessons.lecturername_fk;

CREATE SEQUENCE public."RecordsLessons_LessonTitle_FK_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RecordsLessons_LessonTitle_FK_seq" OWNER TO postgres;

ALTER SEQUENCE public."RecordsLessons_LessonTitle_FK_seq" OWNED BY public.recordslessons.lessontitle_fk;

CREATE TABLE public.students (
    id bigint NOT NULL,
    group_fk bigint NOT NULL,
    name_id_fk bigint
);


ALTER TABLE public.students OWNER TO postgres;

CREATE SEQUENCE public."Students_Group_FK_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Students_Group_FK_seq" OWNER TO postgres;


ALTER SEQUENCE public."Students_Group_FK_seq" OWNED BY public.students.group_fk;

CREATE SEQUENCE public."Students_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Students_ID_seq" OWNER TO postgres;

ALTER SEQUENCE public."Students_ID_seq" OWNED BY public.students.id;

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

CREATE TABLE public.groups_recordslessons (
    group_id bigint NOT NULL,
    recordslessons_id bigint NOT NULL
);


ALTER TABLE public.groups_recordslessons OWNER TO postgres;

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

CREATE TABLE public.users (
    id bigint NOT NULL,
    name text NOT NULL,
    username text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

ALTER TABLE ONLY public.cabinets ALTER COLUMN id SET DEFAULT nextval('public."Cabinets_ID_seq"'::regclass);

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public."Groups_ID_seq"'::regclass);

ALTER TABLE ONLY public.lecturers ALTER COLUMN id SET DEFAULT nextval('public."Lecturers_ID_seq"'::regclass);

ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public."Lessons_ID_seq"'::regclass);

ALTER TABLE ONLY public.recordslessons ALTER COLUMN id SET DEFAULT nextval('public."RecordsLessons_ID_seq"'::regclass);

ALTER TABLE ONLY public.recordslessons ALTER COLUMN lessontitle_fk SET DEFAULT nextval('public."RecordsLessons_LessonTitle_FK_seq"'::regclass);

ALTER TABLE ONLY public.recordslessons ALTER COLUMN lecturername_fk SET DEFAULT nextval('public."RecordsLessons_LecturerName_FK_seq"'::regclass);

ALTER TABLE ONLY public.recordslessons ALTER COLUMN cabinet_fk SET DEFAULT nextval('public."RecordsLessons_Cabinet_FK_seq"'::regclass);




ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public."Students_ID_seq"'::regclass);




ALTER TABLE ONLY public.students ALTER COLUMN group_fk SET DEFAULT nextval('public."Students_Group_FK_seq"'::regclass);




COPY public.cabinets (id, title, cabinetnumber) FROM stdin;
2	Физики кабинет	213
3	Кабинет географии	321
6	Русский язык	366
7	Кабинет истории 2	275
35	Кабинет истории	376
1	Кабинет информатики	771
\.




COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


COPY public.groups (id, numbercource, numbergroup) FROM stdin;
1	1	12
3	3	11
4	5	15
2	2	11
8	1	11
9	1	13
\.




COPY public.groups_recordslessons (group_id, recordslessons_id) FROM stdin;
1	2
1	20
2	20
8	20
2	11
4	11
3	5
2	5
3	10
1	19
1	5
2	38
8	38
4	38
4	19
9	19
\.




COPY public.lecturers (id, name_id_fk) FROM stdin;
1	23
2	231
5	3
3	4
\.




COPY public.lessons (id, title) FROM stdin;
2	Физика
3	Английский
1	Математика
7	История
5	Биология
\.




COPY public.recordslessons (id, lessontitle_fk, lecturername_fk, cabinet_fk, "time") FROM stdin;
2	1	1	3	2022-08-22
11	2	2	2	2022-08-08
5	1	1	3	2022-08-08
20	5	2	1	2022-08-20
38	5	1	2	2022-09-08
19	5	1	3	2022-08-08
10	1	3	2	2022-08-22
\.




COPY public.roles (id, name) FROM stdin;
15	ROLE_ADMIN
19	ROLE_USER
\.




COPY public.students (id, group_fk, name_id_fk) FROM stdin;
2	3	19
17	2	1
3	8	2
\.



COPY public.user_roles (user_id, role_id) FROM stdin;
19	15
231	19
19	19
1	19
2	19
3	19
4	19
23	19
\.




COPY public.users (id, name, username, password) FROM stdin;
19	Гоша	goha	$2a$04$u9aNkJyfle76RoxSTlsuNeIbWtUe2VNSmoq2pzLGtPSqSOkceCyRm
23	Василий Васильевич	vasa	$2a$04$u9aNkJyfle76RoxSTlsuNeIbWtUe2VNSmoq2pzLGtPSqSOkceCyRm
231	Петр Петрович	pett	$2a$04$u9aNkJyfle76RoxSTlsuNeIbWtUe2VNSmoq2pzLGtPSqSOkceCyRm
1	Леня	lenya	$2a$04$u9aNkJyfle76RoxSTlsuNeIbWtUe2VNSmoq2pzLGtPSqSOkceCyRm
2	Игорь	igor	$2a$04$u9aNkJyfle76RoxSTlsuNeIbWtUe2VNSmoq2pzLGtPSqSOkceCyRm
3	Иван Иваныч	ivan	$2a$04$u9aNkJyfle76RoxSTlsuNeIbWtUe2VNSmoq2pzLGtPSqSOkceCyRm
4	Павел Павлович	pavl	u9aNkJyfle76RoxSTlsuNeIbWtUe2VNSmoq2pzLGtPSqSOkceCyRm
\.



SELECT pg_catalog.setval('public."Cabinets_ID_seq"', 35, true);



SELECT pg_catalog.setval('public."Groups_ID_seq"', 9, true);




SELECT pg_catalog.setval('public."Lecturers_ID_seq"', 5, true);




SELECT pg_catalog.setval('public."Lessons_ID_seq"', 7, true);




SELECT pg_catalog.setval('public."RecordsLessons_Cabinet_FK_seq"', 1, false);




SELECT pg_catalog.setval('public."RecordsLessons_ID_seq"', 39, true);



SELECT pg_catalog.setval('public."RecordsLessons_LecturerName_FK_seq"', 1, false);




SELECT pg_catalog.setval('public."RecordsLessons_LessonTitle_FK_seq"', 1, false);




SELECT pg_catalog.setval('public."Students_Group_FK_seq"', 2, true);



SELECT pg_catalog.setval('public."Students_ID_seq"', 21, true);



ALTER TABLE ONLY public.cabinets
    ADD CONSTRAINT "Cabinets_pkey" PRIMARY KEY (id);



ALTER TABLE ONLY public.groups
    ADD CONSTRAINT "Groups_pkey" PRIMARY KEY (id);


ALTER TABLE ONLY public.lecturers
    ADD CONSTRAINT "Lecturers_pkey" PRIMARY KEY (id);


ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT "Lessons_pkey" PRIMARY KEY (id);


ALTER TABLE ONLY public.recordslessons
    ADD CONSTRAINT "RecordsLessons_pkey" PRIMARY KEY (id);




ALTER TABLE ONLY public.students
    ADD CONSTRAINT "Students_pkey" PRIMARY KEY (id);


ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.groups_recordslessons
    ADD CONSTRAINT pk_groups_recordslessons PRIMARY KEY (group_id, recordslessons_id);




ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT pk_user_roles PRIMARY KEY (user_id, role_id);



ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);



CREATE INDEX "fki_Cab_FK" ON public.recordslessons USING btree (cabinet_fk);



CREATE INDEX "fki_Lect_FK" ON public.recordslessons USING btree (lecturername_fk);


CREATE INDEX "fki_Less_FK" ON public.recordslessons USING btree (lessontitle_fk);



CREATE INDEX "fki_Stud_Group_FK" ON public.students USING btree (group_fk);



CREATE INDEX fki_user_id_fk ON public.students USING btree (name_id_fk);



ALTER TABLE ONLY public.recordslessons
    ADD CONSTRAINT "Cab_FK" FOREIGN KEY (cabinet_fk) REFERENCES public.cabinets(id) NOT VALID;



ALTER TABLE ONLY public.recordslessons
    ADD CONSTRAINT "Lect_FK" FOREIGN KEY (lecturername_fk) REFERENCES public.lecturers(id) NOT VALID;


ALTER TABLE ONLY public.recordslessons
    ADD CONSTRAINT "Less_FK" FOREIGN KEY (lessontitle_fk) REFERENCES public.lessons(id) NOT VALID;


ALTER TABLE ONLY public.groups_recordslessons
    ADD CONSTRAINT groups_recordslessons_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);

ALTER TABLE ONLY public.groups_recordslessons
    ADD CONSTRAINT groups_recordslessons_recordslessons_id_fkey FOREIGN KEY (recordslessons_id) REFERENCES public.recordslessons(id);


ALTER TABLE ONLY public.lecturers
    ADD CONSTRAINT name_id_fk FOREIGN KEY (name_id_fk) REFERENCES public.users(id) NOT VALID;


ALTER TABLE ONLY public.students
    ADD CONSTRAINT stud_group_fk FOREIGN KEY (group_fk) REFERENCES public.groups(id) NOT VALID;


ALTER TABLE ONLY public.students
    ADD CONSTRAINT user_id_fk FOREIGN KEY (name_id_fk) REFERENCES public.users(id);


ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_fk FOREIGN KEY (role_id) REFERENCES public.roles(id);


ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);

