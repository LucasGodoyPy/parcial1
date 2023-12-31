PGDMP     6    ,                {            lucian    15.3    15.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24788    lucian    DATABASE     }   CREATE DATABASE lucian WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
    DROP DATABASE lucian;
                postgres    false            �            1259    24789    ciudad    TABLE     �   CREATE TABLE public.ciudad (
    id integer NOT NULL,
    ciudad character varying(30),
    departamento character varying(30),
    postal integer
);
    DROP TABLE public.ciudad;
       public         heap    postgres    false            �            1259    24792    cliente    TABLE     �   CREATE TABLE public.cliente (
    idcliente integer,
    idpersona integer NOT NULL,
    fechaingreso timestamp without time zone NOT NULL,
    calificacion character varying(30) NOT NULL,
    estado character varying(30) NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    24795    cuentas    TABLE     w  CREATE TABLE public.cuentas (
    id integer NOT NULL,
    idcliente integer,
    nrocuenta character varying(30),
    fechaalta date,
    tipocuenta character varying(30),
    estado character varying(30),
    saldo real,
    nrocontrato character varying(30),
    costomantenimiento real,
    promedioacreditacion character varying(30),
    moneda character varying(30)
);
    DROP TABLE public.cuentas;
       public         heap    postgres    false            �            1259    24798    cuentas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cuentas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cuentas_id_seq;
       public          postgres    false    216                       0    0    cuentas_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.cuentas_id_seq OWNED BY public.cuentas.id;
          public          postgres    false    217            �            1259    24799    movimientos    TABLE     $  CREATE TABLE public.movimientos (
    idmovimiento integer NOT NULL,
    idcuenta integer,
    fechamovimiento date,
    tipomovimiento character varying,
    saldoanterior real,
    saldoactual real,
    montomovimiento real,
    cuentaorigen real,
    cuentadestino real,
    canal real
);
    DROP TABLE public.movimientos;
       public         heap    postgres    false            �            1259    24804    persona    TABLE     s  CREATE TABLE public.persona (
    id integer NOT NULL,
    idciudad integer,
    nombre character varying(30),
    apellido character varying(30),
    tipodocumento character varying(30),
    nrodocumento character varying(30),
    direccion character varying(100),
    email character varying(100),
    celular character varying(30),
    estado character varying(30)
);
    DROP TABLE public.persona;
       public         heap    postgres    false            u           2604    24817 
   cuentas id    DEFAULT     h   ALTER TABLE ONLY public.cuentas ALTER COLUMN id SET DEFAULT nextval('public.cuentas_id_seq'::regclass);
 9   ALTER TABLE public.cuentas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216                      0    24789    ciudad 
   TABLE DATA           B   COPY public.ciudad (id, ciudad, departamento, postal) FROM stdin;
    public          postgres    false    214   �                 0    24792    cliente 
   TABLE DATA           [   COPY public.cliente (idcliente, idpersona, fechaingreso, calificacion, estado) FROM stdin;
    public          postgres    false    215                    0    24795    cuentas 
   TABLE DATA           �   COPY public.cuentas (id, idcliente, nrocuenta, fechaalta, tipocuenta, estado, saldo, nrocontrato, costomantenimiento, promedioacreditacion, moneda) FROM stdin;
    public          postgres    false    216   0                 0    24799    movimientos 
   TABLE DATA           �   COPY public.movimientos (idmovimiento, idcuenta, fechamovimiento, tipomovimiento, saldoanterior, saldoactual, montomovimiento, cuentaorigen, cuentadestino, canal) FROM stdin;
    public          postgres    false    218   M                 0    24804    persona 
   TABLE DATA           �   COPY public.persona (id, idciudad, nombre, apellido, tipodocumento, nrodocumento, direccion, email, celular, estado) FROM stdin;
    public          postgres    false    219   j                  0    0    cuentas_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.cuentas_id_seq', 1, false);
          public          postgres    false    217            w           2606    24809    ciudad ciudad_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT ciudad_pkey;
       public            postgres    false    214            y           2606    24811    cuentas cuentas_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cuentas DROP CONSTRAINT cuentas_pkey;
       public            postgres    false    216            {           2606    24813    movimientos movimientos_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.movimientos
    ADD CONSTRAINT movimientos_pkey PRIMARY KEY (idmovimiento);
 F   ALTER TABLE ONLY public.movimientos DROP CONSTRAINT movimientos_pkey;
       public            postgres    false    218            }           2606    24815    persona persona_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_pkey;
       public            postgres    false    219                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     