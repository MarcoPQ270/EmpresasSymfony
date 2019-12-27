PGDMP                         w            empresa    9.6.16    9.6.16 "    m           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            n           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            o           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            p           1262    16393    empresa    DATABASE     �   CREATE DATABASE empresa WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Mexico.1252' LC_CTYPE = 'Spanish_Mexico.1252';
    DROP DATABASE empresa;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            q           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            r           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16461    empresas    TABLE       CREATE TABLE public.empresas (
    idempresa integer NOT NULL,
    nomempresa character varying(150),
    direempresa character varying(200),
    corrempresa character varying(80),
    descipempresa character varying(250),
    telefono character varying(15)
);
    DROP TABLE public.empresas;
       public         postgres    false    3            �            1259    16459    empresas_idempresa_seq    SEQUENCE        CREATE SEQUENCE public.empresas_idempresa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.empresas_idempresa_seq;
       public       postgres    false    3    190            s           0    0    empresas_idempresa_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.empresas_idempresa_seq OWNED BY public.empresas.idempresa;
            public       postgres    false    189            �            1259    16470    empresavisita    TABLE     �   CREATE TABLE public.empresavisita (
    idempresa integer,
    idusuario integer,
    fechavisita timestamp without time zone DEFAULT now()
);
 !   DROP TABLE public.empresavisita;
       public         postgres    false    3            �            1259    16396    tipousuario    TABLE     g   CREATE TABLE public.tipousuario (
    idtipousr integer NOT NULL,
    tipousr character varying(20)
);
    DROP TABLE public.tipousuario;
       public         postgres    false    3            �            1259    16394    tipousuario_idtipousr_seq    SEQUENCE     �   CREATE SEQUENCE public.tipousuario_idtipousr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.tipousuario_idtipousr_seq;
       public       postgres    false    186    3            t           0    0    tipousuario_idtipousr_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.tipousuario_idtipousr_seq OWNED BY public.tipousuario.idtipousr;
            public       postgres    false    185            �            1259    16448    usuario    TABLE     �   CREATE TABLE public.usuario (
    idusuario integer NOT NULL,
    nomusuario character varying(80),
    correo character varying(80),
    "contraseña" character varying(25),
    domicilio character varying(80),
    idtipousr integer
);
    DROP TABLE public.usuario;
       public         postgres    false    3            �            1259    16446    usuario_idusuario_seq    SEQUENCE     ~   CREATE SEQUENCE public.usuario_idusuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.usuario_idusuario_seq;
       public       postgres    false    3    188            u           0    0    usuario_idusuario_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.usuario_idusuario_seq OWNED BY public.usuario.idusuario;
            public       postgres    false    187            �           2604    16464    empresas idempresa    DEFAULT     x   ALTER TABLE ONLY public.empresas ALTER COLUMN idempresa SET DEFAULT nextval('public.empresas_idempresa_seq'::regclass);
 A   ALTER TABLE public.empresas ALTER COLUMN idempresa DROP DEFAULT;
       public       postgres    false    189    190    190            �           2604    16399    tipousuario idtipousr    DEFAULT     ~   ALTER TABLE ONLY public.tipousuario ALTER COLUMN idtipousr SET DEFAULT nextval('public.tipousuario_idtipousr_seq'::regclass);
 D   ALTER TABLE public.tipousuario ALTER COLUMN idtipousr DROP DEFAULT;
       public       postgres    false    186    185    186            �           2604    16451    usuario idusuario    DEFAULT     v   ALTER TABLE ONLY public.usuario ALTER COLUMN idusuario SET DEFAULT nextval('public.usuario_idusuario_seq'::regclass);
 @   ALTER TABLE public.usuario ALTER COLUMN idusuario DROP DEFAULT;
       public       postgres    false    188    187    188            i          0    16461    empresas 
   TABLE DATA               l   COPY public.empresas (idempresa, nomempresa, direempresa, corrempresa, descipempresa, telefono) FROM stdin;
    public       postgres    false    190   �$       v           0    0    empresas_idempresa_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.empresas_idempresa_seq', 1, false);
            public       postgres    false    189            j          0    16470    empresavisita 
   TABLE DATA               J   COPY public.empresavisita (idempresa, idusuario, fechavisita) FROM stdin;
    public       postgres    false    191   �$       e          0    16396    tipousuario 
   TABLE DATA               9   COPY public.tipousuario (idtipousr, tipousr) FROM stdin;
    public       postgres    false    186   �$       w           0    0    tipousuario_idtipousr_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.tipousuario_idtipousr_seq', 1, false);
            public       postgres    false    185            g          0    16448    usuario 
   TABLE DATA               e   COPY public.usuario (idusuario, nomusuario, correo, "contraseña", domicilio, idtipousr) FROM stdin;
    public       postgres    false    188   %       x           0    0    usuario_idusuario_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.usuario_idusuario_seq', 1, false);
            public       postgres    false    187            �           2606    16469    empresas pkempresa 
   CONSTRAINT     W   ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT pkempresa PRIMARY KEY (idempresa);
 <   ALTER TABLE ONLY public.empresas DROP CONSTRAINT pkempresa;
       public         postgres    false    190    190            �           2606    16453    usuario pkusuario 
   CONSTRAINT     V   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT pkusuario PRIMARY KEY (idusuario);
 ;   ALTER TABLE ONLY public.usuario DROP CONSTRAINT pkusuario;
       public         postgres    false    188    188            �           2606    16401    tipousuario tipousuario_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.tipousuario
    ADD CONSTRAINT tipousuario_pkey PRIMARY KEY (idtipousr);
 F   ALTER TABLE ONLY public.tipousuario DROP CONSTRAINT tipousuario_pkey;
       public         postgres    false    186    186            �           2606    16474 *   empresavisita empresavisita_idempresa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empresavisita
    ADD CONSTRAINT empresavisita_idempresa_fkey FOREIGN KEY (idempresa) REFERENCES public.empresas(idempresa);
 T   ALTER TABLE ONLY public.empresavisita DROP CONSTRAINT empresavisita_idempresa_fkey;
       public       postgres    false    191    190    2027            �           2606    16479 *   empresavisita empresavisita_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empresavisita
    ADD CONSTRAINT empresavisita_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);
 T   ALTER TABLE ONLY public.empresavisita DROP CONSTRAINT empresavisita_idusuario_fkey;
       public       postgres    false    191    188    2025            �           2606    16454    usuario usuario_idtipousr_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_idtipousr_fkey FOREIGN KEY (idtipousr) REFERENCES public.tipousuario(idtipousr);
 H   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_idtipousr_fkey;
       public       postgres    false    188    2023    186            i      x������ � �      j      x������ � �      e      x������ � �      g      x������ � �     