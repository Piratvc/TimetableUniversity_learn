--CREATE DATABASE "UniversityLearnBase" WITH TEMPLATE = template0 ENCODING = 'UTF8';

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

ALTER DATABASE "UniversityLearnBase" OWNER TO postgres;

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
    name text NOT NULL
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
    name text NOT NULL,
    group_fk bigint NOT NULL
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


CREATE TABLE public.groups_recordslessons (
    group_id bigint NOT NULL,
    recordslessons_id bigint NOT NULL
);

ALTER TABLE public.groups_recordslessons OWNER TO postgres;

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


INSERT INTO public.cabinets (id, title, cabinetnumber) VALUES (1, 'Кабинет информатики', 771);
INSERT INTO public.cabinets (id, title, cabinetnumber) VALUES (2, 'Физики кабинет', 213);
INSERT INTO public.cabinets (id, title, cabinetnumber) VALUES (3, 'Кабинет географии', 321);
INSERT INTO public.cabinets (id, title, cabinetnumber) VALUES (6, 'Русский язык', 366);
INSERT INTO public.cabinets (id, title, cabinetnumber) VALUES (7, 'Кабинет истории 2', 275);

INSERT INTO public.groups (id, numbercource, numbergroup) VALUES (1, 1, 12);
INSERT INTO public.groups (id, numbercource, numbergroup) VALUES (3, 3, 11);
INSERT INTO public.groups (id, numbercource, numbergroup) VALUES (4, 5, 15);
INSERT INTO public.groups (id, numbercource, numbergroup) VALUES (2, 2, 11);
INSERT INTO public.groups (id, numbercource, numbergroup) VALUES (8, 1, 11);
INSERT INTO public.groups (id, numbercource, numbergroup) VALUES (9, 1, 13);

INSERT INTO public.groups_recordslessons (group_id, recordslessons_id) VALUES (1, 2);
INSERT INTO public.groups_recordslessons (group_id, recordslessons_id) VALUES (8, 2);
INSERT INTO public.groups_recordslessons (group_id, recordslessons_id) VALUES (1, 20);
INSERT INTO public.groups_recordslessons (group_id, recordslessons_id) VALUES (2, 20);
INSERT INTO public.groups_recordslessons (group_id, recordslessons_id) VALUES (8, 20);
INSERT INTO public.groups_recordslessons (group_id, recordslessons_id) VALUES (2, 11);
INSERT INTO public.groups_recordslessons (group_id, recordslessons_id) VALUES (4, 11);
INSERT INTO public.groups_recordslessons (group_id, recordslessons_id) VALUES (3, 5);
INSERT INTO public.groups_recordslessons (group_id, recordslessons_id) VALUES (2, 5);
INSERT INTO public.groups_recordslessons (group_id, recordslessons_id) VALUES (3, 10);
INSERT INTO public.groups_recordslessons (group_id, recordslessons_id) VALUES (9, 10);
INSERT INTO public.groups_recordslessons (group_id, recordslessons_id) VALUES (1, 19);
INSERT INTO public.groups_recordslessons (group_id, recordslessons_id) VALUES (4, 19);
INSERT INTO public.groups_recordslessons (group_id, recordslessons_id) VALUES (9, 19);

INSERT INTO public.lecturers (id, name) VALUES (1, 'Василий иванович');
INSERT INTO public.lecturers (id, name) VALUES (2, 'Эдуард Петрович');
INSERT INTO public.lecturers (id, name) VALUES (3, 'Петр Эдуардович');
INSERT INTO public.lecturers (id, name) VALUES (5, 'Иван Иваныч');


INSERT INTO public.lessons (id, title) VALUES (2, 'Физика');
INSERT INTO public.lessons (id, title) VALUES (3, 'Английский');
INSERT INTO public.lessons (id, title) VALUES (1, 'Математика');
INSERT INTO public.lessons (id, title) VALUES (5, 'Биология');

INSERT INTO public.recordslessons (id, lessontitle_fk, lecturername_fk, cabinet_fk, "time") VALUES (2, 1, 1, 3, '2022-08-22');
INSERT INTO public.recordslessons (id, lessontitle_fk, lecturername_fk, cabinet_fk, "time") VALUES (10, 1, 1, 2, '2022-08-22');
INSERT INTO public.recordslessons (id, lessontitle_fk, lecturername_fk, cabinet_fk, "time") VALUES (19, 5, 2, 3, '2022-08-08');
INSERT INTO public.recordslessons (id, lessontitle_fk, lecturername_fk, cabinet_fk, "time") VALUES (11, 2, 2, 2, '2022-08-08');
INSERT INTO public.recordslessons (id, lessontitle_fk, lecturername_fk, cabinet_fk, "time") VALUES (5, 1, 1, 3, '2022-08-08');
INSERT INTO public.recordslessons (id, lessontitle_fk, lecturername_fk, cabinet_fk, "time") VALUES (20, 5, 2, 1, '2022-08-20');

INSERT INTO public.students (id, name, group_fk) VALUES (2, 'Вася', 3);
INSERT INTO public.students (id, name, group_fk) VALUES (17, 'Петр', 2);
INSERT INTO public.students (id, name, group_fk) VALUES (18, 'Студент студентыч', 4);
INSERT INTO public.students (id, name, group_fk) VALUES (16, 'Иван сарафан', 1);
INSERT INTO public.students (id, name, group_fk) VALUES (19, 'Василий', 8);
INSERT INTO public.students (id, name, group_fk) VALUES (20, 'Ираклий', 9);

SELECT pg_catalog.setval('public."Cabinets_ID_seq"', 27, true);


SELECT pg_catalog.setval('public."Groups_ID_seq"', 9, true);


SELECT pg_catalog.setval('public."Lecturers_ID_seq"', 5, true);


SELECT pg_catalog.setval('public."Lessons_ID_seq"', 5, true);



SELECT pg_catalog.setval('public."RecordsLessons_Cabinet_FK_seq"', 1, false);



SELECT pg_catalog.setval('public."RecordsLessons_ID_seq"', 30, true);



SELECT pg_catalog.setval('public."RecordsLessons_LecturerName_FK_seq"', 1, false);



SELECT pg_catalog.setval('public."RecordsLessons_LessonTitle_FK_seq"', 1, false);



SELECT pg_catalog.setval('public."Students_Group_FK_seq"', 2, true);


SELECT pg_catalog.setval('public."Students_ID_seq"', 20, true);


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


ALTER TABLE ONLY public.groups_recordslessons
    ADD CONSTRAINT pk_groups_recordslessons PRIMARY KEY (group_id, recordslessons_id);


CREATE INDEX "fki_Cab_FK" ON public.recordslessons USING btree (cabinet_fk);



CREATE INDEX "fki_Lect_FK" ON public.recordslessons USING btree (lecturername_fk);


CREATE INDEX "fki_Less_FK" ON public.recordslessons USING btree (lessontitle_fk);



CREATE INDEX "fki_Stud_Group_FK" ON public.students USING btree (group_fk);



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


ALTER TABLE ONLY public.students
    ADD CONSTRAINT stud_group_fk FOREIGN KEY (group_fk) REFERENCES public.groups(id) NOT VALID;

