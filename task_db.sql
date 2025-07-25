PGDMP  '    '                }            tam_db    16.9 #   16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)     d           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            e           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            f           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            g           1262    16388    tam_db    DATABASE     q   CREATE DATABASE tam_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE tam_db;
                postgres    false            �            1259    16402    tasks    TABLE       CREATE TABLE public.tasks (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    user_id bigint,
    title text,
    description text,
    priority text,
    status text
);
    DROP TABLE public.tasks;
       public         heap    postgres    false            �            1259    16401    tasks_id_seq    SEQUENCE     u   CREATE SEQUENCE public.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.tasks_id_seq;
       public          postgres    false    218            h           0    0    tasks_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;
          public          postgres    false    217            �            1259    16390    users    TABLE     �   CREATE TABLE public.users (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    email text,
    username text,
    password text
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16389    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    216            i           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    215            �           2604    16405    tasks id    DEFAULT     d   ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);
 7   ALTER TABLE public.tasks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    16393    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            a          0    16402    tasks 
   TABLE DATA           v   COPY public.tasks (id, created_at, updated_at, deleted_at, user_id, title, description, priority, status) FROM stdin;
    public          postgres    false    218   �       _          0    16390    users 
   TABLE DATA           b   COPY public.users (id, created_at, updated_at, deleted_at, email, username, password) FROM stdin;
    public          postgres    false    216   f       j           0    0    tasks_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.tasks_id_seq', 21, true);
          public          postgres    false    217            k           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 16, true);
          public          postgres    false    215            �           2606    16409    tasks tasks_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tasks DROP CONSTRAINT tasks_pkey;
       public            postgres    false    218            �           2606    16399    users uni_users_email 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT uni_users_email UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT uni_users_email;
       public            postgres    false    216            �           2606    16397    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    216            �           1259    16410    idx_tasks_deleted_at    INDEX     L   CREATE INDEX idx_tasks_deleted_at ON public.tasks USING btree (deleted_at);
 (   DROP INDEX public.idx_tasks_deleted_at;
       public            postgres    false    218            �           1259    16400    idx_users_deleted_at    INDEX     L   CREATE INDEX idx_users_deleted_at ON public.users USING btree (deleted_at);
 (   DROP INDEX public.idx_users_deleted_at;
       public            postgres    false    216            a   �  x���Kn�0���)�/Bp8��	Z�-���1c�-�r���INZS�jx![?9߼a/���N�;ej��|TV"8 ��ԕj�H:ԆLA��4�q�
F���#~���ŗ��>�E��:D� _�.��")i�Q.�����T��~J\���a]�+IG �q���eu���8_�둍��^Ū;��f��ECR���K��2X��-�Q���A��PN�`�ڢJ�I�jL;�W�
 7�#���@��2B+	�������Q9� ��Ģ: �$.m�+
3���,4Ȓ:��*U�C6���O�07���bYe�T�(�8p?'��B O�����T�ܨ2 M7�)p�Q��~Q�<��)����By�T�;��٥�n�����wxx[O���V�y+T`�w���\�vZV�Q��UpdoM�� �c2� ׳�_R'<o$��4	7�}p���Hf����	O����x\!;�^�
Z�,���N�Y�N�c)�/1���/f6�s�������8i�T?6�>w��c:���;�o���z�6�˶ߞ��������&�=��5#l�]�����ms�_Sڱ��|�����T��1�^O�u/�4zr9.>��ӡ�?u��3�dUU��*�      _   �   x��οo�@��+:���/pG���2 m�(ո\��: =�z��Cۡ�[^��>�р�cn牂���s��gݼh{�.��\���[Yݻ���)ѳ�|���3�vP��j5�#��<��s}@���u8��0;ՙ������˳�)�~���7��x��)�;�c��B�r���h,y�Ш5�r�M��zWH��n]��g"w�/Y�I�6!tN�O�     