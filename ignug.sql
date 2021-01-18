PGDMP                         x            ignug    12.3    12.3 �   J           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            K           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            L           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            M           1262    127164    ignug    DATABASE     �   CREATE DATABASE ignug WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Ecuador.1252' LC_CTYPE = 'Spanish_Ecuador.1252';
    DROP DATABASE ignug;
                postgres    false                        2615    130696 
   attendance    SCHEMA        CREATE SCHEMA attendance;
    DROP SCHEMA attendance;
                postgres    false                        2615    130694    authentication    SCHEMA        CREATE SCHEMA authentication;
    DROP SCHEMA authentication;
                postgres    false                        2615    130691    cecy    SCHEMA        CREATE SCHEMA cecy;
    DROP SCHEMA cecy;
                postgres    false                        2615    130693    ignug    SCHEMA        CREATE SCHEMA ignug;
    DROP SCHEMA ignug;
                postgres    false                        2615    130695 	   job_board    SCHEMA        CREATE SCHEMA job_board;
    DROP SCHEMA job_board;
                postgres    false                        2615    130692    web    SCHEMA        CREATE SCHEMA web;
    DROP SCHEMA web;
                postgres    false            �            1259    131108    attendances    TABLE     Q  CREATE TABLE attendance.attendances (
    id bigint NOT NULL,
    attendanceable_type character varying(255) NOT NULL,
    attendanceable_id bigint NOT NULL,
    date date NOT NULL,
    type_id bigint NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 #   DROP TABLE attendance.attendances;
    
   attendance         heap    postgres    false    6            �            1259    131106    attendances_id_seq    SEQUENCE        CREATE SEQUENCE attendance.attendances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE attendance.attendances_id_seq;
    
   attendance          postgres    false    6    249            N           0    0    attendances_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE attendance.attendances_id_seq OWNED BY attendance.attendances.id;
       
   attendance          postgres    false    248            �            1259    130761 
   catalogues    TABLE     u  CREATE TABLE attendance.catalogues (
    id bigint NOT NULL,
    parent_code_id bigint,
    code character varying(100) NOT NULL,
    name character varying(500) NOT NULL,
    type character varying(200) NOT NULL,
    icon character varying(200),
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 "   DROP TABLE attendance.catalogues;
    
   attendance         heap    postgres    false    6            �            1259    130759    catalogues_id_seq    SEQUENCE     ~   CREATE SEQUENCE attendance.catalogues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE attendance.catalogues_id_seq;
    
   attendance          postgres    false    219    6            O           0    0    catalogues_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE attendance.catalogues_id_seq OWNED BY attendance.catalogues.id;
       
   attendance          postgres    false    218            �            1259    131161    tasks    TABLE     z  CREATE TABLE attendance.tasks (
    id bigint NOT NULL,
    attendance_id bigint NOT NULL,
    description character varying(300),
    percentage_advance integer DEFAULT 0 NOT NULL,
    observations character varying(500),
    type_id bigint NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE attendance.tasks;
    
   attendance         heap    postgres    false    6            �            1259    131159    tasks_id_seq    SEQUENCE     y   CREATE SEQUENCE attendance.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE attendance.tasks_id_seq;
    
   attendance          postgres    false    255    6            P           0    0    tasks_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE attendance.tasks_id_seq OWNED BY attendance.tasks.id;
       
   attendance          postgres    false    254                       1259    131188    workdays    TABLE     �  CREATE TABLE attendance.workdays (
    id bigint NOT NULL,
    attendance_id bigint NOT NULL,
    description character varying(300),
    observations json,
    start_time time(0) without time zone,
    end_time time(0) without time zone,
    duration time(0) without time zone,
    type_id bigint NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
     DROP TABLE attendance.workdays;
    
   attendance         heap    postgres    false    6                        1259    131186    workdays_id_seq    SEQUENCE     |   CREATE SEQUENCE attendance.workdays_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE attendance.workdays_id_seq;
    
   attendance          postgres    false    257    6            Q           0    0    workdays_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE attendance.workdays_id_seq OWNED BY attendance.workdays.id;
       
   attendance          postgres    false    256            �            1259    130782    audits    TABLE     �  CREATE TABLE authentication.audits (
    id bigint NOT NULL,
    user_type character varying(255),
    user_id bigint,
    event character varying(255) NOT NULL,
    auditable_type character varying(255) NOT NULL,
    auditable_id bigint NOT NULL,
    old_values text,
    new_values text,
    url text,
    ip_address inet,
    user_agent character varying(1023),
    tags character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 "   DROP TABLE authentication.audits;
       authentication         heap    postgres    false    11            �            1259    130780    audits_id_seq    SEQUENCE     ~   CREATE SEQUENCE authentication.audits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE authentication.audits_id_seq;
       authentication          postgres    false    11    221            R           0    0    audits_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE authentication.audits_id_seq OWNED BY authentication.audits.id;
          authentication          postgres    false    220            �            1259    130699 
   migrations    TABLE     �   CREATE TABLE authentication.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
 &   DROP TABLE authentication.migrations;
       authentication         heap    postgres    false    11            �            1259    130697    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE authentication.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE authentication.migrations_id_seq;
       authentication          postgres    false    208    11            S           0    0    migrations_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE authentication.migrations_id_seq OWNED BY authentication.migrations.id;
          authentication          postgres    false    207            �            1259    130714    oauth_access_tokens    TABLE     l  CREATE TABLE authentication.oauth_access_tokens (
    id character varying(100) NOT NULL,
    user_id bigint,
    client_id bigint NOT NULL,
    name character varying(255),
    scopes text,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone
);
 /   DROP TABLE authentication.oauth_access_tokens;
       authentication         heap    postgres    false    11            �            1259    130705    oauth_auth_codes    TABLE     �   CREATE TABLE authentication.oauth_auth_codes (
    id character varying(100) NOT NULL,
    user_id bigint NOT NULL,
    client_id bigint NOT NULL,
    scopes text,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);
 ,   DROP TABLE authentication.oauth_auth_codes;
       authentication         heap    postgres    false    11            �            1259    130730    oauth_clients    TABLE     �  CREATE TABLE authentication.oauth_clients (
    id bigint NOT NULL,
    user_id bigint,
    name character varying(255) NOT NULL,
    secret character varying(100),
    redirect text NOT NULL,
    personal_access_client boolean NOT NULL,
    password_client boolean NOT NULL,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 )   DROP TABLE authentication.oauth_clients;
       authentication         heap    postgres    false    11            �            1259    130728    oauth_clients_id_seq    SEQUENCE     �   CREATE SEQUENCE authentication.oauth_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE authentication.oauth_clients_id_seq;
       authentication          postgres    false    213    11            T           0    0    oauth_clients_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE authentication.oauth_clients_id_seq OWNED BY authentication.oauth_clients.id;
          authentication          postgres    false    212            �            1259    130742    oauth_personal_access_clients    TABLE     �   CREATE TABLE authentication.oauth_personal_access_clients (
    id bigint NOT NULL,
    client_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 9   DROP TABLE authentication.oauth_personal_access_clients;
       authentication         heap    postgres    false    11            �            1259    130740 $   oauth_personal_access_clients_id_seq    SEQUENCE     �   CREATE SEQUENCE authentication.oauth_personal_access_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE authentication.oauth_personal_access_clients_id_seq;
       authentication          postgres    false    215    11            U           0    0 $   oauth_personal_access_clients_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE authentication.oauth_personal_access_clients_id_seq OWNED BY authentication.oauth_personal_access_clients.id;
          authentication          postgres    false    214            �            1259    130723    oauth_refresh_tokens    TABLE     �   CREATE TABLE authentication.oauth_refresh_tokens (
    id character varying(100) NOT NULL,
    access_token_id character varying(100) NOT NULL,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);
 0   DROP TABLE authentication.oauth_refresh_tokens;
       authentication         heap    postgres    false    11            �            1259    130974 	   role_user    TABLE     |   CREATE TABLE authentication.role_user (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);
 %   DROP TABLE authentication.role_user;
       authentication         heap    postgres    false    11            �            1259    130972    role_user_id_seq    SEQUENCE     �   CREATE SEQUENCE authentication.role_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE authentication.role_user_id_seq;
       authentication          postgres    false    11    237            V           0    0    role_user_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE authentication.role_user_id_seq OWNED BY authentication.role_user.id;
          authentication          postgres    false    236            �            1259    130874    roles    TABLE     ,  CREATE TABLE authentication.roles (
    id bigint NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    system_id bigint NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 !   DROP TABLE authentication.roles;
       authentication         heap    postgres    false    11            �            1259    130872    roles_id_seq    SEQUENCE     }   CREATE SEQUENCE authentication.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE authentication.roles_id_seq;
       authentication          postgres    false    11    231            W           0    0    roles_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE authentication.roles_id_seq OWNED BY authentication.roles.id;
          authentication          postgres    false    230            �            1259    130892    users    TABLE     �  CREATE TABLE authentication.users (
    id bigint NOT NULL,
    ethnic_origin_id bigint NOT NULL,
    location_id bigint NOT NULL,
    identification_type_id bigint NOT NULL,
    identification character varying(20) NOT NULL,
    postal_code character varying(20),
    first_name character varying(1000) NOT NULL,
    second_name character varying(100),
    first_lastname character varying(100) NOT NULL,
    second_lastname character varying(100),
    sex_id bigint NOT NULL,
    gender_id bigint NOT NULL,
    personal_email character varying(100),
    birthdate date,
    blood_type_id bigint,
    user_name character varying(25) NOT NULL,
    email character varying(100) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(200) NOT NULL,
    change_password boolean DEFAULT false NOT NULL,
    state_id bigint NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 !   DROP TABLE authentication.users;
       authentication         heap    postgres    false    11            �            1259    130890    users_id_seq    SEQUENCE     }   CREATE SEQUENCE authentication.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE authentication.users_id_seq;
       authentication          postgres    false    233    11            X           0    0    users_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE authentication.users_id_seq OWNED BY authentication.users.id;
          authentication          postgres    false    232            K           1259    132120    additional_informations    TABLE     �  CREATE TABLE cecy.additional_informations (
    id bigint NOT NULL,
    company_name character varying(200) NOT NULL,
    company_address character varying(150) NOT NULL,
    company_phone character varying(150) NOT NULL,
    company_activity character varying(150) NOT NULL,
    company_sponsor boolean NOT NULL,
    name_contact character varying(150) NOT NULL,
    know_course json NOT NULL,
    course_follow json NOT NULL,
    works boolean NOT NULL,
    state_id bigint NOT NULL,
    registration_id bigint NOT NULL,
    level_instruction bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 )   DROP TABLE cecy.additional_informations;
       cecy         heap    postgres    false    7            J           1259    132118    additional_informations_id_seq    SEQUENCE     �   CREATE SEQUENCE cecy.additional_informations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE cecy.additional_informations_id_seq;
       cecy          postgres    false    7    331            Y           0    0    additional_informations_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE cecy.additional_informations_id_seq OWNED BY cecy.additional_informations.id;
          cecy          postgres    false    330            Y           1259    132262    agreement_companies    TABLE     �  CREATE TABLE cecy.agreement_companies (
    id bigint NOT NULL,
    agreement_id bigint NOT NULL,
    state_id bigint NOT NULL,
    objective character varying(255) NOT NULL,
    date_agreement_signature date NOT NULL,
    expiry_date date NOT NULL,
    representative character varying(150) NOT NULL,
    social_reason character varying(200) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 %   DROP TABLE cecy.agreement_companies;
       cecy         heap    postgres    false    7            X           1259    132260    agreement_companies_id_seq    SEQUENCE     �   CREATE SEQUENCE cecy.agreement_companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE cecy.agreement_companies_id_seq;
       cecy          postgres    false    7    345            Z           0    0    agreement_companies_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE cecy.agreement_companies_id_seq OWNED BY cecy.agreement_companies.id;
          cecy          postgres    false    344            M           1259    132146 
   agreements    TABLE     �   CREATE TABLE cecy.agreements (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE cecy.agreements;
       cecy         heap    postgres    false    7            L           1259    132144    agreements_id_seq    SEQUENCE     x   CREATE SEQUENCE cecy.agreements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE cecy.agreements_id_seq;
       cecy          postgres    false    7    333            [           0    0    agreements_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE cecy.agreements_id_seq OWNED BY cecy.agreements.id;
          cecy          postgres    false    332            O           1259    132159    assistances    TABLE       CREATE TABLE cecy.assistances (
    id bigint NOT NULL,
    state_id bigint NOT NULL,
    duration integer NOT NULL,
    detail_registration_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE cecy.assistances;
       cecy         heap    postgres    false    7            N           1259    132157    assistances_id_seq    SEQUENCE     y   CREATE SEQUENCE cecy.assistances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE cecy.assistances_id_seq;
       cecy          postgres    false    335    7            \           0    0    assistances_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE cecy.assistances_id_seq OWNED BY cecy.assistances.id;
          cecy          postgres    false    334            ;           1259    131871    authorities    TABLE     U  CREATE TABLE cecy.authorities (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    state_id bigint NOT NULL,
    status_id bigint NOT NULL,
    position_id bigint NOT NULL,
    start_position date NOT NULL,
    end_position date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE cecy.authorities;
       cecy         heap    postgres    false    7            :           1259    131869    authorities_id_seq    SEQUENCE     y   CREATE SEQUENCE cecy.authorities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE cecy.authorities_id_seq;
       cecy          postgres    false    7    315            ]           0    0    authorities_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE cecy.authorities_id_seq OWNED BY cecy.authorities.id;
          cecy          postgres    false    314            1           1259    131768 
   catalogues    TABLE     o  CREATE TABLE cecy.catalogues (
    id bigint NOT NULL,
    parent_code_id bigint,
    code character varying(100) NOT NULL,
    name character varying(500) NOT NULL,
    type character varying(200) NOT NULL,
    icon character varying(200),
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE cecy.catalogues;
       cecy         heap    postgres    false    7            0           1259    131766    catalogues_id_seq    SEQUENCE     x   CREATE SEQUENCE cecy.catalogues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE cecy.catalogues_id_seq;
       cecy          postgres    false    305    7            ^           0    0    catalogues_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE cecy.catalogues_id_seq OWNED BY cecy.catalogues.id;
          cecy          postgres    false    304            3           1259    131789    cecy_institutions    TABLE     �   CREATE TABLE cecy.cecy_institutions (
    id bigint NOT NULL,
    state_id bigint NOT NULL,
    logo bigint NOT NULL,
    name character varying(200) NOT NULL,
    slogan character varying(500),
    code character varying(200)
);
 #   DROP TABLE cecy.cecy_institutions;
       cecy         heap    postgres    false    7            2           1259    131787    cecy_institutions_id_seq    SEQUENCE        CREATE SEQUENCE cecy.cecy_institutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE cecy.cecy_institutions_id_seq;
       cecy          postgres    false    7    307            _           0    0    cecy_institutions_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE cecy.cecy_institutions_id_seq OWNED BY cecy.cecy_institutions.id;
          cecy          postgres    false    306            =           1259    131899    courses    TABLE     d  CREATE TABLE cecy.courses (
    id bigint NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    cost numeric(3,2) NOT NULL,
    photo text NOT NULL,
    summary character varying(1000) NOT NULL,
    duration integer NOT NULL,
    modality_id bigint NOT NULL,
    free boolean NOT NULL,
    state_id bigint NOT NULL,
    observation character varying(1000) NOT NULL,
    objective character varying(225) NOT NULL,
    needs json NOT NULL,
    facilities json NOT NULL,
    theoretical_phase json NOT NULL,
    practical_phase json NOT NULL,
    cross_cutting_topics json NOT NULL,
    bibliography json NOT NULL,
    teaching_strategies json NOT NULL,
    participant_type_id bigint NOT NULL,
    area_id bigint NOT NULL,
    level_id bigint NOT NULL,
    required_installing_sources character varying(150) NOT NULL,
    practice_hours integer NOT NULL,
    theory_hours integer NOT NULL,
    practice_required_resources character varying(150) NOT NULL,
    aimtheory_required_resources character varying(150) NOT NULL,
    learning_teaching_strategy character varying(150) NOT NULL,
    proposed_date date NOT NULL,
    approval_date date NOT NULL,
    need_date date NOT NULL,
    local_proposal character varying(500) NOT NULL,
    schedules_id bigint NOT NULL,
    project character varying(150) NOT NULL,
    capacity integer NOT NULL,
    course_type_id bigint NOT NULL,
    specialty_id bigint NOT NULL,
    academic_period_id bigint NOT NULL,
    setec_name character varying(200) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE cecy.courses;
       cecy         heap    postgres    false    7            <           1259    131897    courses_id_seq    SEQUENCE     u   CREATE SEQUENCE cecy.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE cecy.courses_id_seq;
       cecy          postgres    false    7    317            `           0    0    courses_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE cecy.courses_id_seq OWNED BY cecy.courses.id;
          cecy          postgres    false    316            S           1259    132190    department_data    TABLE     p  CREATE TABLE cecy.department_data (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    address character varying(150) NOT NULL,
    charge_id bigint NOT NULL,
    state_id bigint NOT NULL,
    schedule_id bigint NOT NULL,
    canton_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 !   DROP TABLE cecy.department_data;
       cecy         heap    postgres    false    7            R           1259    132188    department_data_id_seq    SEQUENCE     }   CREATE SEQUENCE cecy.department_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE cecy.department_data_id_seq;
       cecy          postgres    false    339    7            a           0    0    department_data_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE cecy.department_data_id_seq OWNED BY cecy.department_data.id;
          cecy          postgres    false    338            I           1259    132089    detail_registrations    TABLE     �  CREATE TABLE cecy.detail_registrations (
    id bigint NOT NULL,
    registration_id bigint NOT NULL,
    state_id bigint NOT NULL,
    status_id bigint NOT NULL,
    status_certificate_id bigint NOT NULL,
    final_grade numeric(3,2) NOT NULL,
    certificate_withdrawn date NOT NULL,
    observation json NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 &   DROP TABLE cecy.detail_registrations;
       cecy         heap    postgres    false    7            H           1259    132087    detail_registrations_id_seq    SEQUENCE     �   CREATE SEQUENCE cecy.detail_registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE cecy.detail_registrations_id_seq;
       cecy          postgres    false    329    7            b           0    0    detail_registrations_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE cecy.detail_registrations_id_seq OWNED BY cecy.detail_registrations.id;
          cecy          postgres    false    328            7           1259    131830    evaluation_mechanisms    TABLE     �   CREATE TABLE cecy.evaluation_mechanisms (
    id bigint NOT NULL,
    state_id bigint NOT NULL,
    status_id bigint NOT NULL,
    type_id bigint NOT NULL,
    technique character varying(200) NOT NULL,
    instrument character varying(200) NOT NULL
);
 '   DROP TABLE cecy.evaluation_mechanisms;
       cecy         heap    postgres    false    7            6           1259    131828    evaluation_mechanisms_id_seq    SEQUENCE     �   CREATE SEQUENCE cecy.evaluation_mechanisms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE cecy.evaluation_mechanisms_id_seq;
       cecy          postgres    false    311    7            c           0    0    evaluation_mechanisms_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE cecy.evaluation_mechanisms_id_seq OWNED BY cecy.evaluation_mechanisms.id;
          cecy          postgres    false    310            9           1259    131853    instructors    TABLE     �   CREATE TABLE cecy.instructors (
    id bigint NOT NULL,
    state_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE cecy.instructors;
       cecy         heap    postgres    false    7            8           1259    131851    instructors_id_seq    SEQUENCE     y   CREATE SEQUENCE cecy.instructors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE cecy.instructors_id_seq;
       cecy          postgres    false    7    313            d           0    0    instructors_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE cecy.instructors_id_seq OWNED BY cecy.instructors.id;
          cecy          postgres    false    312            Q           1259    132177 	   locations    TABLE     �   CREATE TABLE cecy.locations (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE cecy.locations;
       cecy         heap    postgres    false    7            P           1259    132175    locations_id_seq    SEQUENCE     w   CREATE SEQUENCE cecy.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE cecy.locations_id_seq;
       cecy          postgres    false    337    7            e           0    0    locations_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE cecy.locations_id_seq OWNED BY cecy.locations.id;
          cecy          postgres    false    336            c           1259    132383    participants    TABLE     �   CREATE TABLE cecy.participants (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    person_type_id bigint NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE cecy.participants;
       cecy         heap    postgres    false    7            b           1259    132381    participants_id_seq    SEQUENCE     z   CREATE SEQUENCE cecy.participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE cecy.participants_id_seq;
       cecy          postgres    false    355    7            f           0    0    participants_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE cecy.participants_id_seq OWNED BY cecy.participants.id;
          cecy          postgres    false    354            e           1259    132406    person_prerequisites_courses    TABLE     �  CREATE TABLE cecy.person_prerequisites_courses (
    id bigint NOT NULL,
    participant_id bigint NOT NULL,
    course_id bigint NOT NULL,
    state_id bigint NOT NULL,
    payment boolean NOT NULL,
    certified character varying(155) NOT NULL,
    withdrawal date NOT NULL,
    withdrawn boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 .   DROP TABLE cecy.person_prerequisites_courses;
       cecy         heap    postgres    false    7            d           1259    132404 #   person_prerequisites_courses_id_seq    SEQUENCE     �   CREATE SEQUENCE cecy.person_prerequisites_courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE cecy.person_prerequisites_courses_id_seq;
       cecy          postgres    false    357    7            g           0    0 #   person_prerequisites_courses_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE cecy.person_prerequisites_courses_id_seq OWNED BY cecy.person_prerequisites_courses.id;
          cecy          postgres    false    356            a           1259    132355    planification_instructors    TABLE     9  CREATE TABLE cecy.planification_instructors (
    id bigint NOT NULL,
    state_id bigint NOT NULL,
    instructor_id bigint NOT NULL,
    planification_id bigint NOT NULL,
    detail_registration_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 +   DROP TABLE cecy.planification_instructors;
       cecy         heap    postgres    false    7            `           1259    132353     planification_instructors_id_seq    SEQUENCE     �   CREATE SEQUENCE cecy.planification_instructors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE cecy.planification_instructors_id_seq;
       cecy          postgres    false    7    353            h           0    0     planification_instructors_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE cecy.planification_instructors_id_seq OWNED BY cecy.planification_instructors.id;
          cecy          postgres    false    352            ?           1259    131955    planifications    TABLE     �  CREATE TABLE cecy.planifications (
    id bigint NOT NULL,
    date_start date,
    date_end date,
    course_id bigint NOT NULL,
    instructor_id bigint NOT NULL,
    state_id bigint NOT NULL,
    school_period_id bigint NOT NULL,
    planned_end_date date NOT NULL,
    capacity integer NOT NULL,
    observation character varying(1000) NOT NULL,
    conference bigint NOT NULL,
    parallel bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
     DROP TABLE cecy.planifications;
       cecy         heap    postgres    false    7            >           1259    131953    planifications_id_seq    SEQUENCE     |   CREATE SEQUENCE cecy.planifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE cecy.planifications_id_seq;
       cecy          postgres    false    319    7            i           0    0    planifications_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE cecy.planifications_id_seq OWNED BY cecy.planifications.id;
          cecy          postgres    false    318            A           1259    131996    prerequisites    TABLE     �   CREATE TABLE cecy.prerequisites (
    id bigint NOT NULL,
    course_id bigint NOT NULL,
    state_id bigint NOT NULL,
    parent_code_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE cecy.prerequisites;
       cecy         heap    postgres    false    7            @           1259    131994    prerequisites_id_seq    SEQUENCE     {   CREATE SEQUENCE cecy.prerequisites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE cecy.prerequisites_id_seq;
       cecy          postgres    false    321    7            j           0    0    prerequisites_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE cecy.prerequisites_id_seq OWNED BY cecy.prerequisites.id;
          cecy          postgres    false    320            _           1259    132337    profile_instructor_courses    TABLE     �  CREATE TABLE cecy.profile_instructor_courses (
    id bigint NOT NULL,
    course_id bigint NOT NULL,
    state_id bigint NOT NULL,
    required_knowledge character varying(150) NOT NULL,
    required_experience character varying(150) NOT NULL,
    required_skills character varying(150) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 ,   DROP TABLE cecy.profile_instructor_courses;
       cecy         heap    postgres    false    7            ^           1259    132335 !   profile_instructor_courses_id_seq    SEQUENCE     �   CREATE SEQUENCE cecy.profile_instructor_courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE cecy.profile_instructor_courses_id_seq;
       cecy          postgres    false    7    351            k           0    0 !   profile_instructor_courses_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE cecy.profile_instructor_courses_id_seq OWNED BY cecy.profile_instructor_courses.id;
          cecy          postgres    false    350            G           1259    132061    registrations    TABLE     �  CREATE TABLE cecy.registrations (
    id bigint NOT NULL,
    date_registration character varying(50) NOT NULL,
    participant_id bigint NOT NULL,
    state_id bigint NOT NULL,
    type_id bigint NOT NULL,
    number character varying(100) NOT NULL,
    planification_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE cecy.registrations;
       cecy         heap    postgres    false    7            F           1259    132059    registrations_id_seq    SEQUENCE     {   CREATE SEQUENCE cecy.registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE cecy.registrations_id_seq;
       cecy          postgres    false    7    327            l           0    0    registrations_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE cecy.registrations_id_seq OWNED BY cecy.registrations.id;
          cecy          postgres    false    326            U           1259    132218    requirements    TABLE     �   CREATE TABLE cecy.requirements (
    id bigint NOT NULL,
    course_id bigint NOT NULL,
    state_id bigint NOT NULL,
    requirement_type_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE cecy.requirements;
       cecy         heap    postgres    false    7            T           1259    132216    requirements_id_seq    SEQUENCE     z   CREATE SEQUENCE cecy.requirements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE cecy.requirements_id_seq;
       cecy          postgres    false    341    7            m           0    0    requirements_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE cecy.requirements_id_seq OWNED BY cecy.requirements.id;
          cecy          postgres    false    340            E           1259    132037    scheduleables    TABLE     W  CREATE TABLE cecy.scheduleables (
    id bigint NOT NULL,
    state_id bigint NOT NULL,
    schedule_id bigint NOT NULL,
    classroom_id bigint NOT NULL,
    scheduleable_type character varying(255) NOT NULL,
    scheduleable_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE cecy.scheduleables;
       cecy         heap    postgres    false    7            D           1259    132035    scheduleables_id_seq    SEQUENCE     {   CREATE SEQUENCE cecy.scheduleables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE cecy.scheduleables_id_seq;
       cecy          postgres    false    7    325            n           0    0    scheduleables_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE cecy.scheduleables_id_seq OWNED BY cecy.scheduleables.id;
          cecy          postgres    false    324            C           1259    132019 	   schedules    TABLE     ,  CREATE TABLE cecy.schedules (
    id bigint NOT NULL,
    state_id bigint NOT NULL,
    start_time character varying(50) NOT NULL,
    end_time character varying(50) NOT NULL,
    day_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE cecy.schedules;
       cecy         heap    postgres    false    7            B           1259    132017    schedules_id_seq    SEQUENCE     w   CREATE SEQUENCE cecy.schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE cecy.schedules_id_seq;
       cecy          postgres    false    323    7            o           0    0    schedules_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE cecy.schedules_id_seq OWNED BY cecy.schedules.id;
          cecy          postgres    false    322            5           1259    131810    school_periods    TABLE     5  CREATE TABLE cecy.school_periods (
    id bigint NOT NULL,
    code character varying(100) NOT NULL,
    name character varying(500) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    ordinary_start_date date NOT NULL,
    ordinary_end_date date NOT NULL,
    extraordinary_start_date date NOT NULL,
    extraordinary_end_date date NOT NULL,
    especial_start_date date NOT NULL,
    especial_end_date date NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
     DROP TABLE cecy.school_periods;
       cecy         heap    postgres    false    7            4           1259    131808    school_periods_id_seq    SEQUENCE     |   CREATE SEQUENCE cecy.school_periods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE cecy.school_periods_id_seq;
       cecy          postgres    false    309    7            p           0    0    school_periods_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE cecy.school_periods_id_seq OWNED BY cecy.school_periods.id;
          cecy          postgres    false    308            [           1259    132283    target_groups    TABLE     �   CREATE TABLE cecy.target_groups (
    id bigint NOT NULL,
    population_id bigint NOT NULL,
    course_id bigint NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE cecy.target_groups;
       cecy         heap    postgres    false    7            Z           1259    132281    target_groups_id_seq    SEQUENCE     {   CREATE SEQUENCE cecy.target_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE cecy.target_groups_id_seq;
       cecy          postgres    false    347    7            q           0    0    target_groups_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE cecy.target_groups_id_seq OWNED BY cecy.target_groups.id;
          cecy          postgres    false    346            ]           1259    132306    topics    TABLE     9  CREATE TABLE cecy.topics (
    id bigint NOT NULL,
    description character varying(500) NOT NULL,
    parent_code_id bigint,
    state_id bigint NOT NULL,
    course_id bigint NOT NULL,
    type_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE cecy.topics;
       cecy         heap    postgres    false    7            \           1259    132304    topics_id_seq    SEQUENCE     t   CREATE SEQUENCE cecy.topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE cecy.topics_id_seq;
       cecy          postgres    false    349    7            r           0    0    topics_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE cecy.topics_id_seq OWNED BY cecy.topics.id;
          cecy          postgres    false    348            W           1259    132241    working_informations    TABLE     �  CREATE TABLE cecy.working_informations (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    address character varying(150) NOT NULL,
    email character varying(150) NOT NULL,
    phone character varying(150) NOT NULL,
    activity character varying(150) NOT NULL,
    summmary character varying(255) NOT NULL,
    sponsor boolean NOT NULL,
    sponsor_name character varying(255) NOT NULL,
    instructor_id bigint NOT NULL,
    state_id bigint NOT NULL,
    knowledge_course character varying(150) NOT NULL,
    recomendation_course character varying(150) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 &   DROP TABLE cecy.working_informations;
       cecy         heap    postgres    false    7            V           1259    132239    working_informations_id_seq    SEQUENCE     �   CREATE SEQUENCE cecy.working_informations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE cecy.working_informations_id_seq;
       cecy          postgres    false    7    343            s           0    0    working_informations_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE cecy.working_informations_id_seq OWNED BY cecy.working_informations.id;
          cecy          postgres    false    342            �            1259    131058    authorities    TABLE     �  CREATE TABLE ignug.authorities (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    type_id bigint NOT NULL,
    status_id bigint NOT NULL,
    career_id bigint NOT NULL,
    code character varying(100) NOT NULL,
    name character varying(500) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE ignug.authorities;
       ignug         heap    postgres    false    12            �            1259    131056    authorities_id_seq    SEQUENCE     z   CREATE SEQUENCE ignug.authorities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE ignug.authorities_id_seq;
       ignug          postgres    false    245    12            t           0    0    authorities_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE ignug.authorities_id_seq OWNED BY ignug.authorities.id;
          ignug          postgres    false    244            �            1259    131094    careerables    TABLE     �   CREATE TABLE ignug.careerables (
    id bigint NOT NULL,
    career_id bigint NOT NULL,
    careerable_type character varying(255) NOT NULL,
    careerable_id bigint NOT NULL
);
    DROP TABLE ignug.careerables;
       ignug         heap    postgres    false    12            �            1259    131092    careerables_id_seq    SEQUENCE     z   CREATE SEQUENCE ignug.careerables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE ignug.careerables_id_seq;
       ignug          postgres    false    247    12            u           0    0    careerables_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE ignug.careerables_id_seq OWNED BY ignug.careerables.id;
          ignug          postgres    false    246            �            1259    130943    careers    TABLE       CREATE TABLE ignug.careers (
    id bigint NOT NULL,
    institution_id bigint NOT NULL,
    code character varying(50),
    name character varying(200) NOT NULL,
    description character varying(500) NOT NULL,
    modality_id bigint NOT NULL,
    resolution_number character varying(500),
    title character varying(500) NOT NULL,
    acronym character varying(100) NOT NULL,
    type_id bigint NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE ignug.careers;
       ignug         heap    postgres    false    12            �            1259    130941    careers_id_seq    SEQUENCE     v   CREATE SEQUENCE ignug.careers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE ignug.careers_id_seq;
       ignug          postgres    false    12    235            v           0    0    careers_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE ignug.careers_id_seq OWNED BY ignug.careers.id;
          ignug          postgres    false    234            �            1259    130795 
   catalogues    TABLE     p  CREATE TABLE ignug.catalogues (
    id bigint NOT NULL,
    parent_code_id bigint,
    code character varying(100) NOT NULL,
    name character varying(500) NOT NULL,
    type character varying(200) NOT NULL,
    icon character varying(200),
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE ignug.catalogues;
       ignug         heap    postgres    false    12            �            1259    130793    catalogues_id_seq    SEQUENCE     y   CREATE SEQUENCE ignug.catalogues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE ignug.catalogues_id_seq;
       ignug          postgres    false    223    12            w           0    0    catalogues_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE ignug.catalogues_id_seq OWNED BY ignug.catalogues.id;
          ignug          postgres    false    222            �            1259    130816 
   classrooms    TABLE     H  CREATE TABLE ignug.classrooms (
    id bigint NOT NULL,
    code character varying(100) NOT NULL,
    name character varying(500) NOT NULL,
    type_id bigint NOT NULL,
    icon character varying(200),
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE ignug.classrooms;
       ignug         heap    postgres    false    12            �            1259    130814    classrooms_id_seq    SEQUENCE     y   CREATE SEQUENCE ignug.classrooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE ignug.classrooms_id_seq;
       ignug          postgres    false    225    12            x           0    0    classrooms_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE ignug.classrooms_id_seq OWNED BY ignug.classrooms.id;
          ignug          postgres    false    224            �            1259    131127    files    TABLE     �  CREATE TABLE ignug.files (
    id bigint NOT NULL,
    fileable_type character varying(255) NOT NULL,
    fileable_id bigint NOT NULL,
    code character varying(100) NOT NULL,
    name character varying(200) NOT NULL,
    description character varying(500) NOT NULL,
    type character varying(200) NOT NULL,
    icon character varying(200),
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE ignug.files;
       ignug         heap    postgres    false    12            �            1259    131125    files_id_seq    SEQUENCE     t   CREATE SEQUENCE ignug.files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE ignug.files_id_seq;
       ignug          postgres    false    12    251            y           0    0    files_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE ignug.files_id_seq OWNED BY ignug.files.id;
          ignug          postgres    false    250            �            1259    131144    images    TABLE     �  CREATE TABLE ignug.images (
    id bigint NOT NULL,
    imageable_type character varying(255) NOT NULL,
    imageable_id bigint NOT NULL,
    code character varying(100) NOT NULL,
    name character varying(200) NOT NULL,
    description character varying(500) NOT NULL,
    type character varying(200) NOT NULL,
    icon character varying(200),
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE ignug.images;
       ignug         heap    postgres    false    12            �            1259    131142    images_id_seq    SEQUENCE     u   CREATE SEQUENCE ignug.images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE ignug.images_id_seq;
       ignug          postgres    false    12    253            z           0    0    images_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE ignug.images_id_seq OWNED BY ignug.images.id;
          ignug          postgres    false    252            �            1259    130837    institutions    TABLE     &  CREATE TABLE ignug.institutions (
    id bigint NOT NULL,
    code character varying(200),
    name character varying(200) NOT NULL,
    slogan character varying(500),
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE ignug.institutions;
       ignug         heap    postgres    false    12            �            1259    130835    institutions_id_seq    SEQUENCE     {   CREATE SEQUENCE ignug.institutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE ignug.institutions_id_seq;
       ignug          postgres    false    227    12            {           0    0    institutions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE ignug.institutions_id_seq OWNED BY ignug.institutions.id;
          ignug          postgres    false    226            �            1259    130853 	   locations    TABLE     �  CREATE TABLE ignug.locations (
    id bigint NOT NULL,
    parent_code_id bigint,
    code character varying(100) NOT NULL,
    name character varying(500) NOT NULL,
    type character varying(200) NOT NULL,
    principal_street character varying(200),
    secondary_street character varying(200),
    number character varying(100),
    post_code character varying(100),
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE ignug.locations;
       ignug         heap    postgres    false    12            �            1259    130851    locations_id_seq    SEQUENCE     x   CREATE SEQUENCE ignug.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE ignug.locations_id_seq;
       ignug          postgres    false    229    12            |           0    0    locations_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE ignug.locations_id_seq OWNED BY ignug.locations.id;
          ignug          postgres    false    228            �            1259    130992    school_periods    TABLE     6  CREATE TABLE ignug.school_periods (
    id bigint NOT NULL,
    code character varying(100) NOT NULL,
    name character varying(500) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    ordinary_start_date date NOT NULL,
    ordinary_end_date date NOT NULL,
    extraordinary_start_date date NOT NULL,
    extraordinary_end_date date NOT NULL,
    especial_start_date date NOT NULL,
    especial_end_date date NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 !   DROP TABLE ignug.school_periods;
       ignug         heap    postgres    false    12            �            1259    130990    school_periods_id_seq    SEQUENCE     }   CREATE SEQUENCE ignug.school_periods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE ignug.school_periods_id_seq;
       ignug          postgres    false    12    239            }           0    0    school_periods_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE ignug.school_periods_id_seq OWNED BY ignug.school_periods.id;
          ignug          postgres    false    238            �            1259    130750    states    TABLE     �   CREATE TABLE ignug.states (
    id bigint NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(250) NOT NULL,
    description character varying(250),
    state integer NOT NULL
);
    DROP TABLE ignug.states;
       ignug         heap    postgres    false    12            �            1259    130748    states_id_seq    SEQUENCE     u   CREATE SEQUENCE ignug.states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE ignug.states_id_seq;
       ignug          postgres    false    217    12            ~           0    0    states_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE ignug.states_id_seq OWNED BY ignug.states.id;
          ignug          postgres    false    216            �            1259    131012    students    TABLE     n  CREATE TABLE ignug.students (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    town_id bigint NOT NULL,
    school_type_id bigint NOT NULL,
    career_start_date date,
    graduation_year integer,
    cohort character varying(255),
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE ignug.students;
       ignug         heap    postgres    false    12            �            1259    131010    students_id_seq    SEQUENCE     w   CREATE SEQUENCE ignug.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE ignug.students_id_seq;
       ignug          postgres    false    12    241                       0    0    students_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE ignug.students_id_seq OWNED BY ignug.students.id;
          ignug          postgres    false    240            �            1259    131040    teachers    TABLE     �   CREATE TABLE ignug.teachers (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE ignug.teachers;
       ignug         heap    postgres    false    12            �            1259    131038    teachers_id_seq    SEQUENCE     w   CREATE SEQUENCE ignug.teachers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE ignug.teachers_id_seq;
       ignug          postgres    false    243    12            �           0    0    teachers_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE ignug.teachers_id_seq OWNED BY ignug.teachers.id;
          ignug          postgres    false    242                       1259    131540 	   abilities    TABLE     0  CREATE TABLE job_board.abilities (
    id bigint NOT NULL,
    professional_id bigint NOT NULL,
    category_id bigint NOT NULL,
    description character varying(255) NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
     DROP TABLE job_board.abilities;
    	   job_board         heap    postgres    false    8                       1259    131538    abilities_id_seq    SEQUENCE     |   CREATE SEQUENCE job_board.abilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE job_board.abilities_id_seq;
    	   job_board          postgres    false    8    287            �           0    0    abilities_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE job_board.abilities_id_seq OWNED BY job_board.abilities.id;
       	   job_board          postgres    false    286            !           1259    131563    academic_formations    TABLE     �  CREATE TABLE job_board.academic_formations (
    id bigint NOT NULL,
    professional_id bigint NOT NULL,
    category_id bigint NOT NULL,
    professional_degree_id bigint NOT NULL,
    registration_date date,
    senescyt_code character varying(255),
    has_titling boolean DEFAULT false,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 *   DROP TABLE job_board.academic_formations;
    	   job_board         heap    postgres    false    8                        1259    131561    academic_formations_id_seq    SEQUENCE     �   CREATE SEQUENCE job_board.academic_formations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE job_board.academic_formations_id_seq;
    	   job_board          postgres    false    8    289            �           0    0    academic_formations_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE job_board.academic_formations_id_seq OWNED BY job_board.academic_formations.id;
       	   job_board          postgres    false    288                       1259    131399 
   catalogues    TABLE     t  CREATE TABLE job_board.catalogues (
    id bigint NOT NULL,
    parent_code_id bigint,
    code character varying(100) NOT NULL,
    name character varying(500) NOT NULL,
    type character varying(200) NOT NULL,
    icon character varying(200),
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 !   DROP TABLE job_board.catalogues;
    	   job_board         heap    postgres    false    8                       1259    131397    catalogues_id_seq    SEQUENCE     }   CREATE SEQUENCE job_board.catalogues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE job_board.catalogues_id_seq;
    	   job_board          postgres    false    8    275            �           0    0    catalogues_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE job_board.catalogues_id_seq OWNED BY job_board.catalogues.id;
       	   job_board          postgres    false    274                       1259    131441 
   categories    TABLE     t  CREATE TABLE job_board.categories (
    id bigint NOT NULL,
    parent_code_id bigint,
    code character varying(100) NOT NULL,
    name character varying(500) NOT NULL,
    type character varying(200) NOT NULL,
    icon character varying(200),
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 !   DROP TABLE job_board.categories;
    	   job_board         heap    postgres    false    8                       1259    131439    categories_id_seq    SEQUENCE     }   CREATE SEQUENCE job_board.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE job_board.categories_id_seq;
    	   job_board          postgres    false    8    279            �           0    0    categories_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE job_board.categories_id_seq OWNED BY job_board.categories.id;
       	   job_board          postgres    false    278            +           1259    131704    category_offer    TABLE     �   CREATE TABLE job_board.category_offer (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    offer_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 %   DROP TABLE job_board.category_offer;
    	   job_board         heap    postgres    false    8            *           1259    131702    category_offer_id_seq    SEQUENCE     �   CREATE SEQUENCE job_board.category_offer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE job_board.category_offer_id_seq;
    	   job_board          postgres    false    299    8            �           0    0    category_offer_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE job_board.category_offer_id_seq OWNED BY job_board.category_offer.id;
       	   job_board          postgres    false    298                       1259    131462 	   companies    TABLE     �  CREATE TABLE job_board.companies (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    type_id bigint NOT NULL,
    trade_name character varying(300) NOT NULL,
    comercial_activity character varying(500) NOT NULL,
    web_page character varying(500) NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
     DROP TABLE job_board.companies;
    	   job_board         heap    postgres    false    8                       1259    131460    companies_id_seq    SEQUENCE     |   CREATE SEQUENCE job_board.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE job_board.companies_id_seq;
    	   job_board          postgres    false    8    281            �           0    0    companies_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE job_board.companies_id_seq OWNED BY job_board.companies.id;
       	   job_board          postgres    false    280            -           1259    131722    company_professional    TABLE       CREATE TABLE job_board.company_professional (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    professional_id bigint NOT NULL,
    status_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 +   DROP TABLE job_board.company_professional;
    	   job_board         heap    postgres    false    8            ,           1259    131720    company_professional_id_seq    SEQUENCE     �   CREATE SEQUENCE job_board.company_professional_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE job_board.company_professional_id_seq;
    	   job_board          postgres    false    8    301            �           0    0    company_professional_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE job_board.company_professional_id_seq OWNED BY job_board.company_professional.id;
       	   job_board          postgres    false    300            #           1259    131592    courses    TABLE     �  CREATE TABLE job_board.courses (
    id bigint NOT NULL,
    professional_id bigint NOT NULL,
    event_type_id bigint NOT NULL,
    institution_id bigint NOT NULL,
    type_certification_id bigint NOT NULL,
    event_name character varying(255) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    hours character varying(255) NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE job_board.courses;
    	   job_board         heap    postgres    false    8            "           1259    131590    courses_id_seq    SEQUENCE     z   CREATE SEQUENCE job_board.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE job_board.courses_id_seq;
    	   job_board          postgres    false    8    291            �           0    0    courses_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE job_board.courses_id_seq OWNED BY job_board.courses.id;
       	   job_board          postgres    false    290            %           1259    131628 	   languages    TABLE     O  CREATE TABLE job_board.languages (
    id bigint NOT NULL,
    professional_id bigint NOT NULL,
    written_level_id bigint NOT NULL,
    spoken_level_id bigint NOT NULL,
    reading_level_id bigint NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
     DROP TABLE job_board.languages;
    	   job_board         heap    postgres    false    8            $           1259    131626    languages_id_seq    SEQUENCE     |   CREATE SEQUENCE job_board.languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE job_board.languages_id_seq;
    	   job_board          postgres    false    293    8            �           0    0    languages_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE job_board.languages_id_seq OWNED BY job_board.languages.id;
       	   job_board          postgres    false    292                       1259    131488 	   locations    TABLE     �  CREATE TABLE job_board.locations (
    id bigint NOT NULL,
    parent_code_id bigint,
    code character varying(100) NOT NULL,
    name character varying(500) NOT NULL,
    type character varying(200) NOT NULL,
    principal_street character varying(200),
    secondary_street character varying(200),
    number character varying(100),
    post_code character varying(100),
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
     DROP TABLE job_board.locations;
    	   job_board         heap    postgres    false    8                       1259    131486    locations_id_seq    SEQUENCE     |   CREATE SEQUENCE job_board.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE job_board.locations_id_seq;
    	   job_board          postgres    false    8    283            �           0    0    locations_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE job_board.locations_id_seq OWNED BY job_board.locations.id;
       	   job_board          postgres    false    282            /           1259    131745    offer_professional    TABLE     �   CREATE TABLE job_board.offer_professional (
    id bigint NOT NULL,
    professional_id bigint NOT NULL,
    offer_id bigint NOT NULL,
    status_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 )   DROP TABLE job_board.offer_professional;
    	   job_board         heap    postgres    false    8            .           1259    131743    offer_professional_id_seq    SEQUENCE     �   CREATE SEQUENCE job_board.offer_professional_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE job_board.offer_professional_id_seq;
    	   job_board          postgres    false    8    303            �           0    0    offer_professional_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE job_board.offer_professional_id_seq OWNED BY job_board.offer_professional.id;
       	   job_board          postgres    false    302                       1259    131509    offers    TABLE     g  CREATE TABLE job_board.offers (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    code character varying(100) NOT NULL,
    contact character varying(200) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(20) NOT NULL,
    cell_phone character varying(20),
    contract_type_id bigint NOT NULL,
    "position" character varying(255) NOT NULL,
    training_hours character varying(255),
    experience_time character varying(255),
    remuneration character varying(255),
    working_day character varying(255),
    number_jobs character varying(255),
    start_date date NOT NULL,
    end_date date NOT NULL,
    activities json NOT NULL,
    aditional_information text,
    location_id bigint NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE job_board.offers;
    	   job_board         heap    postgres    false    8                       1259    131507    offers_id_seq    SEQUENCE     y   CREATE SEQUENCE job_board.offers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE job_board.offers_id_seq;
    	   job_board          postgres    false    8    285            �           0    0    offers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE job_board.offers_id_seq OWNED BY job_board.offers.id;
       	   job_board          postgres    false    284            '           1259    131661    professional_experiences    TABLE       CREATE TABLE job_board.professional_experiences (
    id bigint NOT NULL,
    professional_id bigint NOT NULL,
    employer character varying(255) NOT NULL,
    "position" character varying(100) NOT NULL,
    job_description character varying(1000) NOT NULL,
    start_date date NOT NULL,
    end_date date,
    reason_leave character varying(1000) NOT NULL,
    current_work boolean DEFAULT false NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 /   DROP TABLE job_board.professional_experiences;
    	   job_board         heap    postgres    false    8            &           1259    131659    professional_experiences_id_seq    SEQUENCE     �   CREATE SEQUENCE job_board.professional_experiences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE job_board.professional_experiences_id_seq;
    	   job_board          postgres    false    8    295            �           0    0    professional_experiences_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE job_board.professional_experiences_id_seq OWNED BY job_board.professional_experiences.id;
       	   job_board          postgres    false    294            )           1259    131683    professional_references    TABLE     �  CREATE TABLE job_board.professional_references (
    id bigint NOT NULL,
    professional_id bigint NOT NULL,
    institution character varying(255) NOT NULL,
    "position" character varying(255) NOT NULL,
    contact character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 .   DROP TABLE job_board.professional_references;
    	   job_board         heap    postgres    false    8            (           1259    131681    professional_references_id_seq    SEQUENCE     �   CREATE SEQUENCE job_board.professional_references_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE job_board.professional_references_id_seq;
    	   job_board          postgres    false    297    8            �           0    0    professional_references_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE job_board.professional_references_id_seq OWNED BY job_board.professional_references.id;
       	   job_board          postgres    false    296                       1259    131420    professionals    TABLE     �   CREATE TABLE job_board.professionals (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    about_me character varying(500),
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 $   DROP TABLE job_board.professionals;
    	   job_board         heap    postgres    false    8                       1259    131418    professionals_id_seq    SEQUENCE     �   CREATE SEQUENCE job_board.professionals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE job_board.professionals_id_seq;
    	   job_board          postgres    false    8    277            �           0    0    professionals_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE job_board.professionals_id_seq OWNED BY job_board.professionals.id;
       	   job_board          postgres    false    276                       1259    131214 
   catalogues    TABLE     &  CREATE TABLE web.catalogues (
    id bigint NOT NULL,
    parent_code_id bigint,
    code text NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    icon text,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE web.catalogues;
       web         heap    postgres    false    4                       1259    131212    catalogues_id_seq    SEQUENCE     w   CREATE SEQUENCE web.catalogues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE web.catalogues_id_seq;
       web          postgres    false    4    259            �           0    0    catalogues_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE web.catalogues_id_seq OWNED BY web.catalogues.id;
          web          postgres    false    258                       1259    131235    links    TABLE     �  CREATE TABLE web.links (
    id bigint NOT NULL,
    linkable_type character varying(255) NOT NULL,
    linkable_id bigint NOT NULL,
    image text NOT NULL,
    url text NOT NULL,
    name text NOT NULL,
    icon text NOT NULL,
    description text,
    status_id bigint NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE web.links;
       web         heap    postgres    false    4                       1259    131233    links_id_seq    SEQUENCE     r   CREATE SEQUENCE web.links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE web.links_id_seq;
       web          postgres    false    261    4            �           0    0    links_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE web.links_id_seq OWNED BY web.links.id;
          web          postgres    false    260                       1259    131257    menus    TABLE     �  CREATE TABLE web.menus (
    id bigint NOT NULL,
    parent_code_id bigint,
    name text NOT NULL,
    url text NOT NULL,
    icon text NOT NULL,
    description text,
    "order" integer NOT NULL,
    type_id bigint NOT NULL,
    status_id bigint NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE web.menus;
       web         heap    postgres    false    4                       1259    131255    menus_id_seq    SEQUENCE     r   CREATE SEQUENCE web.menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE web.menus_id_seq;
       web          postgres    false    4    263            �           0    0    menus_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE web.menus_id_seq OWNED BY web.menus.id;
          web          postgres    false    262                       1259    131325    pages    TABLE     (  CREATE TABLE web.pages (
    id bigint NOT NULL,
    menu_id bigint,
    template_id bigint,
    section_id bigint,
    title character varying(255) NOT NULL,
    subtitle text,
    description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE web.pages;
       web         heap    postgres    false    4                       1259    131323    pages_id_seq    SEQUENCE     r   CREATE SEQUENCE web.pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE web.pages_id_seq;
       web          postgres    false    269    4            �           0    0    pages_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE web.pages_id_seq OWNED BY web.pages.id;
          web          postgres    false    268                       1259    131351 	   resources    TABLE     �  CREATE TABLE web.resources (
    id bigint NOT NULL,
    resourceable_type character varying(255) NOT NULL,
    resourceable_id bigint NOT NULL,
    url text NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    "order" integer NOT NULL,
    type_id bigint NOT NULL,
    status_id bigint NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE web.resources;
       web         heap    postgres    false    4                       1259    131349    resources_id_seq    SEQUENCE     v   CREATE SEQUENCE web.resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE web.resources_id_seq;
       web          postgres    false    4    271            �           0    0    resources_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE web.resources_id_seq OWNED BY web.resources.id;
          web          postgres    false    270            	           1259    131288    sections    TABLE     &  CREATE TABLE web.sections (
    id bigint NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    "order" integer NOT NULL,
    status_id bigint NOT NULL,
    state_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE web.sections;
       web         heap    postgres    false    4                       1259    131286    sections_id_seq    SEQUENCE     u   CREATE SEQUENCE web.sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE web.sections_id_seq;
       web          postgres    false    265    4            �           0    0    sections_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE web.sections_id_seq OWNED BY web.sections.id;
          web          postgres    false    264                       1259    131309    settings    TABLE     ,  CREATE TABLE web.settings (
    id bigint NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    value text NOT NULL,
    type_id bigint NOT NULL,
    image character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE web.settings;
       web         heap    postgres    false    4            
           1259    131307    settings_id_seq    SEQUENCE     u   CREATE SEQUENCE web.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE web.settings_id_seq;
       web          postgres    false    267    4            �           0    0    settings_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE web.settings_id_seq OWNED BY web.settings.id;
          web          postgres    false    266                       1259    131378    texts    TABLE       CREATE TABLE web.texts (
    id bigint NOT NULL,
    page_id bigint NOT NULL,
    type_id bigint NOT NULL,
    title text,
    subtitle text,
    description text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE web.texts;
       web         heap    postgres    false    4                       1259    131376    texts_id_seq    SEQUENCE     r   CREATE SEQUENCE web.texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE web.texts_id_seq;
       web          postgres    false    273    4            �           0    0    texts_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE web.texts_id_seq OWNED BY web.texts.id;
          web          postgres    false    272            �           2604    131111    attendances id    DEFAULT     x   ALTER TABLE ONLY attendance.attendances ALTER COLUMN id SET DEFAULT nextval('attendance.attendances_id_seq'::regclass);
 A   ALTER TABLE attendance.attendances ALTER COLUMN id DROP DEFAULT;
    
   attendance          postgres    false    249    248    249            w           2604    130764    catalogues id    DEFAULT     v   ALTER TABLE ONLY attendance.catalogues ALTER COLUMN id SET DEFAULT nextval('attendance.catalogues_id_seq'::regclass);
 @   ALTER TABLE attendance.catalogues ALTER COLUMN id DROP DEFAULT;
    
   attendance          postgres    false    219    218    219            �           2604    131164    tasks id    DEFAULT     l   ALTER TABLE ONLY attendance.tasks ALTER COLUMN id SET DEFAULT nextval('attendance.tasks_id_seq'::regclass);
 ;   ALTER TABLE attendance.tasks ALTER COLUMN id DROP DEFAULT;
    
   attendance          postgres    false    254    255    255            �           2604    131191    workdays id    DEFAULT     r   ALTER TABLE ONLY attendance.workdays ALTER COLUMN id SET DEFAULT nextval('attendance.workdays_id_seq'::regclass);
 >   ALTER TABLE attendance.workdays ALTER COLUMN id DROP DEFAULT;
    
   attendance          postgres    false    256    257    257            x           2604    130785 	   audits id    DEFAULT     v   ALTER TABLE ONLY authentication.audits ALTER COLUMN id SET DEFAULT nextval('authentication.audits_id_seq'::regclass);
 @   ALTER TABLE authentication.audits ALTER COLUMN id DROP DEFAULT;
       authentication          postgres    false    221    220    221            s           2604    130702    migrations id    DEFAULT     ~   ALTER TABLE ONLY authentication.migrations ALTER COLUMN id SET DEFAULT nextval('authentication.migrations_id_seq'::regclass);
 D   ALTER TABLE authentication.migrations ALTER COLUMN id DROP DEFAULT;
       authentication          postgres    false    208    207    208            t           2604    130733    oauth_clients id    DEFAULT     �   ALTER TABLE ONLY authentication.oauth_clients ALTER COLUMN id SET DEFAULT nextval('authentication.oauth_clients_id_seq'::regclass);
 G   ALTER TABLE authentication.oauth_clients ALTER COLUMN id DROP DEFAULT;
       authentication          postgres    false    212    213    213            u           2604    130745     oauth_personal_access_clients id    DEFAULT     �   ALTER TABLE ONLY authentication.oauth_personal_access_clients ALTER COLUMN id SET DEFAULT nextval('authentication.oauth_personal_access_clients_id_seq'::regclass);
 W   ALTER TABLE authentication.oauth_personal_access_clients ALTER COLUMN id DROP DEFAULT;
       authentication          postgres    false    215    214    215            �           2604    130977    role_user id    DEFAULT     |   ALTER TABLE ONLY authentication.role_user ALTER COLUMN id SET DEFAULT nextval('authentication.role_user_id_seq'::regclass);
 C   ALTER TABLE authentication.role_user ALTER COLUMN id DROP DEFAULT;
       authentication          postgres    false    237    236    237            }           2604    130877    roles id    DEFAULT     t   ALTER TABLE ONLY authentication.roles ALTER COLUMN id SET DEFAULT nextval('authentication.roles_id_seq'::regclass);
 ?   ALTER TABLE authentication.roles ALTER COLUMN id DROP DEFAULT;
       authentication          postgres    false    230    231    231            ~           2604    130895    users id    DEFAULT     t   ALTER TABLE ONLY authentication.users ALTER COLUMN id SET DEFAULT nextval('authentication.users_id_seq'::regclass);
 ?   ALTER TABLE authentication.users ALTER COLUMN id DROP DEFAULT;
       authentication          postgres    false    232    233    233            �           2604    132123    additional_informations id    DEFAULT     �   ALTER TABLE ONLY cecy.additional_informations ALTER COLUMN id SET DEFAULT nextval('cecy.additional_informations_id_seq'::regclass);
 G   ALTER TABLE cecy.additional_informations ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    330    331    331            �           2604    132265    agreement_companies id    DEFAULT     |   ALTER TABLE ONLY cecy.agreement_companies ALTER COLUMN id SET DEFAULT nextval('cecy.agreement_companies_id_seq'::regclass);
 C   ALTER TABLE cecy.agreement_companies ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    344    345    345            �           2604    132149    agreements id    DEFAULT     j   ALTER TABLE ONLY cecy.agreements ALTER COLUMN id SET DEFAULT nextval('cecy.agreements_id_seq'::regclass);
 :   ALTER TABLE cecy.agreements ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    332    333    333            �           2604    132162    assistances id    DEFAULT     l   ALTER TABLE ONLY cecy.assistances ALTER COLUMN id SET DEFAULT nextval('cecy.assistances_id_seq'::regclass);
 ;   ALTER TABLE cecy.assistances ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    335    334    335            �           2604    131874    authorities id    DEFAULT     l   ALTER TABLE ONLY cecy.authorities ALTER COLUMN id SET DEFAULT nextval('cecy.authorities_id_seq'::regclass);
 ;   ALTER TABLE cecy.authorities ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    314    315    315            �           2604    131771    catalogues id    DEFAULT     j   ALTER TABLE ONLY cecy.catalogues ALTER COLUMN id SET DEFAULT nextval('cecy.catalogues_id_seq'::regclass);
 :   ALTER TABLE cecy.catalogues ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    304    305    305            �           2604    131792    cecy_institutions id    DEFAULT     x   ALTER TABLE ONLY cecy.cecy_institutions ALTER COLUMN id SET DEFAULT nextval('cecy.cecy_institutions_id_seq'::regclass);
 A   ALTER TABLE cecy.cecy_institutions ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    306    307    307            �           2604    131902 
   courses id    DEFAULT     d   ALTER TABLE ONLY cecy.courses ALTER COLUMN id SET DEFAULT nextval('cecy.courses_id_seq'::regclass);
 7   ALTER TABLE cecy.courses ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    317    316    317            �           2604    132193    department_data id    DEFAULT     t   ALTER TABLE ONLY cecy.department_data ALTER COLUMN id SET DEFAULT nextval('cecy.department_data_id_seq'::regclass);
 ?   ALTER TABLE cecy.department_data ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    338    339    339            �           2604    132092    detail_registrations id    DEFAULT     ~   ALTER TABLE ONLY cecy.detail_registrations ALTER COLUMN id SET DEFAULT nextval('cecy.detail_registrations_id_seq'::regclass);
 D   ALTER TABLE cecy.detail_registrations ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    329    328    329            �           2604    131833    evaluation_mechanisms id    DEFAULT     �   ALTER TABLE ONLY cecy.evaluation_mechanisms ALTER COLUMN id SET DEFAULT nextval('cecy.evaluation_mechanisms_id_seq'::regclass);
 E   ALTER TABLE cecy.evaluation_mechanisms ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    310    311    311            �           2604    131856    instructors id    DEFAULT     l   ALTER TABLE ONLY cecy.instructors ALTER COLUMN id SET DEFAULT nextval('cecy.instructors_id_seq'::regclass);
 ;   ALTER TABLE cecy.instructors ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    313    312    313            �           2604    132180    locations id    DEFAULT     h   ALTER TABLE ONLY cecy.locations ALTER COLUMN id SET DEFAULT nextval('cecy.locations_id_seq'::regclass);
 9   ALTER TABLE cecy.locations ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    336    337    337            �           2604    132386    participants id    DEFAULT     n   ALTER TABLE ONLY cecy.participants ALTER COLUMN id SET DEFAULT nextval('cecy.participants_id_seq'::regclass);
 <   ALTER TABLE cecy.participants ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    354    355    355            �           2604    132409    person_prerequisites_courses id    DEFAULT     �   ALTER TABLE ONLY cecy.person_prerequisites_courses ALTER COLUMN id SET DEFAULT nextval('cecy.person_prerequisites_courses_id_seq'::regclass);
 L   ALTER TABLE cecy.person_prerequisites_courses ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    357    356    357            �           2604    132358    planification_instructors id    DEFAULT     �   ALTER TABLE ONLY cecy.planification_instructors ALTER COLUMN id SET DEFAULT nextval('cecy.planification_instructors_id_seq'::regclass);
 I   ALTER TABLE cecy.planification_instructors ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    353    352    353            �           2604    131958    planifications id    DEFAULT     r   ALTER TABLE ONLY cecy.planifications ALTER COLUMN id SET DEFAULT nextval('cecy.planifications_id_seq'::regclass);
 >   ALTER TABLE cecy.planifications ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    318    319    319            �           2604    131999    prerequisites id    DEFAULT     p   ALTER TABLE ONLY cecy.prerequisites ALTER COLUMN id SET DEFAULT nextval('cecy.prerequisites_id_seq'::regclass);
 =   ALTER TABLE cecy.prerequisites ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    320    321    321            �           2604    132340    profile_instructor_courses id    DEFAULT     �   ALTER TABLE ONLY cecy.profile_instructor_courses ALTER COLUMN id SET DEFAULT nextval('cecy.profile_instructor_courses_id_seq'::regclass);
 J   ALTER TABLE cecy.profile_instructor_courses ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    350    351    351            �           2604    132064    registrations id    DEFAULT     p   ALTER TABLE ONLY cecy.registrations ALTER COLUMN id SET DEFAULT nextval('cecy.registrations_id_seq'::regclass);
 =   ALTER TABLE cecy.registrations ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    327    326    327            �           2604    132221    requirements id    DEFAULT     n   ALTER TABLE ONLY cecy.requirements ALTER COLUMN id SET DEFAULT nextval('cecy.requirements_id_seq'::regclass);
 <   ALTER TABLE cecy.requirements ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    340    341    341            �           2604    132040    scheduleables id    DEFAULT     p   ALTER TABLE ONLY cecy.scheduleables ALTER COLUMN id SET DEFAULT nextval('cecy.scheduleables_id_seq'::regclass);
 =   ALTER TABLE cecy.scheduleables ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    325    324    325            �           2604    132022    schedules id    DEFAULT     h   ALTER TABLE ONLY cecy.schedules ALTER COLUMN id SET DEFAULT nextval('cecy.schedules_id_seq'::regclass);
 9   ALTER TABLE cecy.schedules ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    323    322    323            �           2604    131813    school_periods id    DEFAULT     r   ALTER TABLE ONLY cecy.school_periods ALTER COLUMN id SET DEFAULT nextval('cecy.school_periods_id_seq'::regclass);
 >   ALTER TABLE cecy.school_periods ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    309    308    309            �           2604    132286    target_groups id    DEFAULT     p   ALTER TABLE ONLY cecy.target_groups ALTER COLUMN id SET DEFAULT nextval('cecy.target_groups_id_seq'::regclass);
 =   ALTER TABLE cecy.target_groups ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    346    347    347            �           2604    132309 	   topics id    DEFAULT     b   ALTER TABLE ONLY cecy.topics ALTER COLUMN id SET DEFAULT nextval('cecy.topics_id_seq'::regclass);
 6   ALTER TABLE cecy.topics ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    348    349    349            �           2604    132244    working_informations id    DEFAULT     ~   ALTER TABLE ONLY cecy.working_informations ALTER COLUMN id SET DEFAULT nextval('cecy.working_informations_id_seq'::regclass);
 D   ALTER TABLE cecy.working_informations ALTER COLUMN id DROP DEFAULT;
       cecy          postgres    false    343    342    343            �           2604    131061    authorities id    DEFAULT     n   ALTER TABLE ONLY ignug.authorities ALTER COLUMN id SET DEFAULT nextval('ignug.authorities_id_seq'::regclass);
 <   ALTER TABLE ignug.authorities ALTER COLUMN id DROP DEFAULT;
       ignug          postgres    false    245    244    245            �           2604    131097    careerables id    DEFAULT     n   ALTER TABLE ONLY ignug.careerables ALTER COLUMN id SET DEFAULT nextval('ignug.careerables_id_seq'::regclass);
 <   ALTER TABLE ignug.careerables ALTER COLUMN id DROP DEFAULT;
       ignug          postgres    false    246    247    247            �           2604    130946 
   careers id    DEFAULT     f   ALTER TABLE ONLY ignug.careers ALTER COLUMN id SET DEFAULT nextval('ignug.careers_id_seq'::regclass);
 8   ALTER TABLE ignug.careers ALTER COLUMN id DROP DEFAULT;
       ignug          postgres    false    234    235    235            y           2604    130798    catalogues id    DEFAULT     l   ALTER TABLE ONLY ignug.catalogues ALTER COLUMN id SET DEFAULT nextval('ignug.catalogues_id_seq'::regclass);
 ;   ALTER TABLE ignug.catalogues ALTER COLUMN id DROP DEFAULT;
       ignug          postgres    false    223    222    223            z           2604    130819    classrooms id    DEFAULT     l   ALTER TABLE ONLY ignug.classrooms ALTER COLUMN id SET DEFAULT nextval('ignug.classrooms_id_seq'::regclass);
 ;   ALTER TABLE ignug.classrooms ALTER COLUMN id DROP DEFAULT;
       ignug          postgres    false    224    225    225            �           2604    131130    files id    DEFAULT     b   ALTER TABLE ONLY ignug.files ALTER COLUMN id SET DEFAULT nextval('ignug.files_id_seq'::regclass);
 6   ALTER TABLE ignug.files ALTER COLUMN id DROP DEFAULT;
       ignug          postgres    false    250    251    251            �           2604    131147 	   images id    DEFAULT     d   ALTER TABLE ONLY ignug.images ALTER COLUMN id SET DEFAULT nextval('ignug.images_id_seq'::regclass);
 7   ALTER TABLE ignug.images ALTER COLUMN id DROP DEFAULT;
       ignug          postgres    false    253    252    253            {           2604    130840    institutions id    DEFAULT     p   ALTER TABLE ONLY ignug.institutions ALTER COLUMN id SET DEFAULT nextval('ignug.institutions_id_seq'::regclass);
 =   ALTER TABLE ignug.institutions ALTER COLUMN id DROP DEFAULT;
       ignug          postgres    false    227    226    227            |           2604    130856    locations id    DEFAULT     j   ALTER TABLE ONLY ignug.locations ALTER COLUMN id SET DEFAULT nextval('ignug.locations_id_seq'::regclass);
 :   ALTER TABLE ignug.locations ALTER COLUMN id DROP DEFAULT;
       ignug          postgres    false    228    229    229            �           2604    130995    school_periods id    DEFAULT     t   ALTER TABLE ONLY ignug.school_periods ALTER COLUMN id SET DEFAULT nextval('ignug.school_periods_id_seq'::regclass);
 ?   ALTER TABLE ignug.school_periods ALTER COLUMN id DROP DEFAULT;
       ignug          postgres    false    239    238    239            v           2604    130753 	   states id    DEFAULT     d   ALTER TABLE ONLY ignug.states ALTER COLUMN id SET DEFAULT nextval('ignug.states_id_seq'::regclass);
 7   ALTER TABLE ignug.states ALTER COLUMN id DROP DEFAULT;
       ignug          postgres    false    217    216    217            �           2604    131015    students id    DEFAULT     h   ALTER TABLE ONLY ignug.students ALTER COLUMN id SET DEFAULT nextval('ignug.students_id_seq'::regclass);
 9   ALTER TABLE ignug.students ALTER COLUMN id DROP DEFAULT;
       ignug          postgres    false    240    241    241            �           2604    131043    teachers id    DEFAULT     h   ALTER TABLE ONLY ignug.teachers ALTER COLUMN id SET DEFAULT nextval('ignug.teachers_id_seq'::regclass);
 9   ALTER TABLE ignug.teachers ALTER COLUMN id DROP DEFAULT;
       ignug          postgres    false    243    242    243            �           2604    131543    abilities id    DEFAULT     r   ALTER TABLE ONLY job_board.abilities ALTER COLUMN id SET DEFAULT nextval('job_board.abilities_id_seq'::regclass);
 >   ALTER TABLE job_board.abilities ALTER COLUMN id DROP DEFAULT;
    	   job_board          postgres    false    286    287    287            �           2604    131566    academic_formations id    DEFAULT     �   ALTER TABLE ONLY job_board.academic_formations ALTER COLUMN id SET DEFAULT nextval('job_board.academic_formations_id_seq'::regclass);
 H   ALTER TABLE job_board.academic_formations ALTER COLUMN id DROP DEFAULT;
    	   job_board          postgres    false    288    289    289            �           2604    131402    catalogues id    DEFAULT     t   ALTER TABLE ONLY job_board.catalogues ALTER COLUMN id SET DEFAULT nextval('job_board.catalogues_id_seq'::regclass);
 ?   ALTER TABLE job_board.catalogues ALTER COLUMN id DROP DEFAULT;
    	   job_board          postgres    false    274    275    275            �           2604    131444    categories id    DEFAULT     t   ALTER TABLE ONLY job_board.categories ALTER COLUMN id SET DEFAULT nextval('job_board.categories_id_seq'::regclass);
 ?   ALTER TABLE job_board.categories ALTER COLUMN id DROP DEFAULT;
    	   job_board          postgres    false    279    278    279            �           2604    131707    category_offer id    DEFAULT     |   ALTER TABLE ONLY job_board.category_offer ALTER COLUMN id SET DEFAULT nextval('job_board.category_offer_id_seq'::regclass);
 C   ALTER TABLE job_board.category_offer ALTER COLUMN id DROP DEFAULT;
    	   job_board          postgres    false    298    299    299            �           2604    131465    companies id    DEFAULT     r   ALTER TABLE ONLY job_board.companies ALTER COLUMN id SET DEFAULT nextval('job_board.companies_id_seq'::regclass);
 >   ALTER TABLE job_board.companies ALTER COLUMN id DROP DEFAULT;
    	   job_board          postgres    false    280    281    281            �           2604    131725    company_professional id    DEFAULT     �   ALTER TABLE ONLY job_board.company_professional ALTER COLUMN id SET DEFAULT nextval('job_board.company_professional_id_seq'::regclass);
 I   ALTER TABLE job_board.company_professional ALTER COLUMN id DROP DEFAULT;
    	   job_board          postgres    false    301    300    301            �           2604    131595 
   courses id    DEFAULT     n   ALTER TABLE ONLY job_board.courses ALTER COLUMN id SET DEFAULT nextval('job_board.courses_id_seq'::regclass);
 <   ALTER TABLE job_board.courses ALTER COLUMN id DROP DEFAULT;
    	   job_board          postgres    false    291    290    291            �           2604    131631    languages id    DEFAULT     r   ALTER TABLE ONLY job_board.languages ALTER COLUMN id SET DEFAULT nextval('job_board.languages_id_seq'::regclass);
 >   ALTER TABLE job_board.languages ALTER COLUMN id DROP DEFAULT;
    	   job_board          postgres    false    292    293    293            �           2604    131491    locations id    DEFAULT     r   ALTER TABLE ONLY job_board.locations ALTER COLUMN id SET DEFAULT nextval('job_board.locations_id_seq'::regclass);
 >   ALTER TABLE job_board.locations ALTER COLUMN id DROP DEFAULT;
    	   job_board          postgres    false    283    282    283            �           2604    131748    offer_professional id    DEFAULT     �   ALTER TABLE ONLY job_board.offer_professional ALTER COLUMN id SET DEFAULT nextval('job_board.offer_professional_id_seq'::regclass);
 G   ALTER TABLE job_board.offer_professional ALTER COLUMN id DROP DEFAULT;
    	   job_board          postgres    false    302    303    303            �           2604    131512 	   offers id    DEFAULT     l   ALTER TABLE ONLY job_board.offers ALTER COLUMN id SET DEFAULT nextval('job_board.offers_id_seq'::regclass);
 ;   ALTER TABLE job_board.offers ALTER COLUMN id DROP DEFAULT;
    	   job_board          postgres    false    285    284    285            �           2604    131664    professional_experiences id    DEFAULT     �   ALTER TABLE ONLY job_board.professional_experiences ALTER COLUMN id SET DEFAULT nextval('job_board.professional_experiences_id_seq'::regclass);
 M   ALTER TABLE job_board.professional_experiences ALTER COLUMN id DROP DEFAULT;
    	   job_board          postgres    false    295    294    295            �           2604    131686    professional_references id    DEFAULT     �   ALTER TABLE ONLY job_board.professional_references ALTER COLUMN id SET DEFAULT nextval('job_board.professional_references_id_seq'::regclass);
 L   ALTER TABLE job_board.professional_references ALTER COLUMN id DROP DEFAULT;
    	   job_board          postgres    false    296    297    297            �           2604    131423    professionals id    DEFAULT     z   ALTER TABLE ONLY job_board.professionals ALTER COLUMN id SET DEFAULT nextval('job_board.professionals_id_seq'::regclass);
 B   ALTER TABLE job_board.professionals ALTER COLUMN id DROP DEFAULT;
    	   job_board          postgres    false    277    276    277            �           2604    131217    catalogues id    DEFAULT     h   ALTER TABLE ONLY web.catalogues ALTER COLUMN id SET DEFAULT nextval('web.catalogues_id_seq'::regclass);
 9   ALTER TABLE web.catalogues ALTER COLUMN id DROP DEFAULT;
       web          postgres    false    258    259    259            �           2604    131238    links id    DEFAULT     ^   ALTER TABLE ONLY web.links ALTER COLUMN id SET DEFAULT nextval('web.links_id_seq'::regclass);
 4   ALTER TABLE web.links ALTER COLUMN id DROP DEFAULT;
       web          postgres    false    261    260    261            �           2604    131260    menus id    DEFAULT     ^   ALTER TABLE ONLY web.menus ALTER COLUMN id SET DEFAULT nextval('web.menus_id_seq'::regclass);
 4   ALTER TABLE web.menus ALTER COLUMN id DROP DEFAULT;
       web          postgres    false    262    263    263            �           2604    131328    pages id    DEFAULT     ^   ALTER TABLE ONLY web.pages ALTER COLUMN id SET DEFAULT nextval('web.pages_id_seq'::regclass);
 4   ALTER TABLE web.pages ALTER COLUMN id DROP DEFAULT;
       web          postgres    false    269    268    269            �           2604    131354    resources id    DEFAULT     f   ALTER TABLE ONLY web.resources ALTER COLUMN id SET DEFAULT nextval('web.resources_id_seq'::regclass);
 8   ALTER TABLE web.resources ALTER COLUMN id DROP DEFAULT;
       web          postgres    false    271    270    271            �           2604    131291    sections id    DEFAULT     d   ALTER TABLE ONLY web.sections ALTER COLUMN id SET DEFAULT nextval('web.sections_id_seq'::regclass);
 7   ALTER TABLE web.sections ALTER COLUMN id DROP DEFAULT;
       web          postgres    false    265    264    265            �           2604    131312    settings id    DEFAULT     d   ALTER TABLE ONLY web.settings ALTER COLUMN id SET DEFAULT nextval('web.settings_id_seq'::regclass);
 7   ALTER TABLE web.settings ALTER COLUMN id DROP DEFAULT;
       web          postgres    false    266    267    267            �           2604    131381    texts id    DEFAULT     ^   ALTER TABLE ONLY web.texts ALTER COLUMN id SET DEFAULT nextval('web.texts_id_seq'::regclass);
 4   ALTER TABLE web.texts ALTER COLUMN id DROP DEFAULT;
       web          postgres    false    273    272    273            �          0    131108    attendances 
   TABLE DATA           �   COPY attendance.attendances (id, attendanceable_type, attendanceable_id, date, type_id, state_id, created_at, updated_at) FROM stdin;
 
   attendance          postgres    false    249   �	      �          0    130761 
   catalogues 
   TABLE DATA           v   COPY attendance.catalogues (id, parent_code_id, code, name, type, icon, state_id, created_at, updated_at) FROM stdin;
 
   attendance          postgres    false    219   �	      �          0    131161    tasks 
   TABLE DATA           �   COPY attendance.tasks (id, attendance_id, description, percentage_advance, observations, type_id, state_id, created_at, updated_at) FROM stdin;
 
   attendance          postgres    false    255   �      �          0    131188    workdays 
   TABLE DATA           �   COPY attendance.workdays (id, attendance_id, description, observations, start_time, end_time, duration, type_id, state_id, created_at, updated_at) FROM stdin;
 
   attendance          postgres    false    257   �      �          0    130782    audits 
   TABLE DATA           �   COPY authentication.audits (id, user_type, user_id, event, auditable_type, auditable_id, old_values, new_values, url, ip_address, user_agent, tags, created_at, updated_at) FROM stdin;
    authentication          postgres    false    221         �          0    130699 
   migrations 
   TABLE DATA           B   COPY authentication.migrations (id, migration, batch) FROM stdin;
    authentication          postgres    false    208   5      �          0    130714    oauth_access_tokens 
   TABLE DATA           �   COPY authentication.oauth_access_tokens (id, user_id, client_id, name, scopes, revoked, created_at, updated_at, expires_at) FROM stdin;
    authentication          postgres    false    210   n      �          0    130705    oauth_auth_codes 
   TABLE DATA           g   COPY authentication.oauth_auth_codes (id, user_id, client_id, scopes, revoked, expires_at) FROM stdin;
    authentication          postgres    false    209   �      �          0    130730    oauth_clients 
   TABLE DATA           �   COPY authentication.oauth_clients (id, user_id, name, secret, redirect, personal_access_client, password_client, revoked, created_at, updated_at) FROM stdin;
    authentication          postgres    false    213   �      �          0    130742    oauth_personal_access_clients 
   TABLE DATA           f   COPY authentication.oauth_personal_access_clients (id, client_id, created_at, updated_at) FROM stdin;
    authentication          postgres    false    215   w      �          0    130723    oauth_refresh_tokens 
   TABLE DATA           `   COPY authentication.oauth_refresh_tokens (id, access_token_id, revoked, expires_at) FROM stdin;
    authentication          postgres    false    211   �      �          0    130974 	   role_user 
   TABLE DATA           A   COPY authentication.role_user (id, user_id, role_id) FROM stdin;
    authentication          postgres    false    237   �      �          0    130874    roles 
   TABLE DATA           d   COPY authentication.roles (id, code, name, system_id, state_id, created_at, updated_at) FROM stdin;
    authentication          postgres    false    231   �      �          0    130892    users 
   TABLE DATA           h  COPY authentication.users (id, ethnic_origin_id, location_id, identification_type_id, identification, postal_code, first_name, second_name, first_lastname, second_lastname, sex_id, gender_id, personal_email, birthdate, blood_type_id, user_name, email, email_verified_at, password, change_password, state_id, remember_token, created_at, updated_at) FROM stdin;
    authentication          postgres    false    233   =      -          0    132120    additional_informations 
   TABLE DATA           �   COPY cecy.additional_informations (id, company_name, company_address, company_phone, company_activity, company_sponsor, name_contact, know_course, course_follow, works, state_id, registration_id, level_instruction, created_at, updated_at) FROM stdin;
    cecy          postgres    false    331   �      ;          0    132262    agreement_companies 
   TABLE DATA           �   COPY cecy.agreement_companies (id, agreement_id, state_id, objective, date_agreement_signature, expiry_date, representative, social_reason, created_at, updated_at) FROM stdin;
    cecy          postgres    false    345   �      /          0    132146 
   agreements 
   TABLE DATA           N   COPY cecy.agreements (id, name, state_id, created_at, updated_at) FROM stdin;
    cecy          postgres    false    333   �      1          0    132159    assistances 
   TABLE DATA           k   COPY cecy.assistances (id, state_id, duration, detail_registration_id, created_at, updated_at) FROM stdin;
    cecy          postgres    false    335                   0    131871    authorities 
   TABLE DATA           �   COPY cecy.authorities (id, user_id, state_id, status_id, position_id, start_position, end_position, created_at, updated_at) FROM stdin;
    cecy          postgres    false    315   "                0    131768 
   catalogues 
   TABLE DATA           p   COPY cecy.catalogues (id, parent_code_id, code, name, type, icon, state_id, created_at, updated_at) FROM stdin;
    cecy          postgres    false    305   ?                0    131789    cecy_institutions 
   TABLE DATA           Q   COPY cecy.cecy_institutions (id, state_id, logo, name, slogan, code) FROM stdin;
    cecy          postgres    false    307   35                0    131899    courses 
   TABLE DATA           ^  COPY cecy.courses (id, code, name, cost, photo, summary, duration, modality_id, free, state_id, observation, objective, needs, facilities, theoretical_phase, practical_phase, cross_cutting_topics, bibliography, teaching_strategies, participant_type_id, area_id, level_id, required_installing_sources, practice_hours, theory_hours, practice_required_resources, aimtheory_required_resources, learning_teaching_strategy, proposed_date, approval_date, need_date, local_proposal, schedules_id, project, capacity, course_type_id, specialty_id, academic_period_id, setec_name, created_at, updated_at) FROM stdin;
    cecy          postgres    false    317   P5      5          0    132190    department_data 
   TABLE DATA              COPY cecy.department_data (id, name, address, charge_id, state_id, schedule_id, canton_id, created_at, updated_at) FROM stdin;
    cecy          postgres    false    339   g6      +          0    132089    detail_registrations 
   TABLE DATA           �   COPY cecy.detail_registrations (id, registration_id, state_id, status_id, status_certificate_id, final_grade, certificate_withdrawn, observation, created_at, updated_at) FROM stdin;
    cecy          postgres    false    329   �6                0    131830    evaluation_mechanisms 
   TABLE DATA           f   COPY cecy.evaluation_mechanisms (id, state_id, status_id, type_id, technique, instrument) FROM stdin;
    cecy          postgres    false    311   �6                0    131853    instructors 
   TABLE DATA           R   COPY cecy.instructors (id, state_id, user_id, created_at, updated_at) FROM stdin;
    cecy          postgres    false    313   �6      3          0    132177 	   locations 
   TABLE DATA           M   COPY cecy.locations (id, name, state_id, created_at, updated_at) FROM stdin;
    cecy          postgres    false    337    7      E          0    132383    participants 
   TABLE DATA           c   COPY cecy.participants (id, user_id, person_type_id, state_id, created_at, updated_at) FROM stdin;
    cecy          postgres    false    355   7      G          0    132406    person_prerequisites_courses 
   TABLE DATA           �   COPY cecy.person_prerequisites_courses (id, participant_id, course_id, state_id, payment, certified, withdrawal, withdrawn, created_at, updated_at) FROM stdin;
    cecy          postgres    false    357   :7      C          0    132355    planification_instructors 
   TABLE DATA           �   COPY cecy.planification_instructors (id, state_id, instructor_id, planification_id, detail_registration_id, created_at, updated_at) FROM stdin;
    cecy          postgres    false    353   W7      !          0    131955    planifications 
   TABLE DATA           �   COPY cecy.planifications (id, date_start, date_end, course_id, instructor_id, state_id, school_period_id, planned_end_date, capacity, observation, conference, parallel, created_at, updated_at) FROM stdin;
    cecy          postgres    false    319   t7      #          0    131996    prerequisites 
   TABLE DATA           f   COPY cecy.prerequisites (id, course_id, state_id, parent_code_id, created_at, updated_at) FROM stdin;
    cecy          postgres    false    321   �7      A          0    132337    profile_instructor_courses 
   TABLE DATA           �   COPY cecy.profile_instructor_courses (id, course_id, state_id, required_knowledge, required_experience, required_skills, created_at, updated_at) FROM stdin;
    cecy          postgres    false    351   �7      )          0    132061    registrations 
   TABLE DATA           �   COPY cecy.registrations (id, date_registration, participant_id, state_id, type_id, number, planification_id, created_at, updated_at) FROM stdin;
    cecy          postgres    false    327   �7      7          0    132218    requirements 
   TABLE DATA           j   COPY cecy.requirements (id, course_id, state_id, requirement_type_id, created_at, updated_at) FROM stdin;
    cecy          postgres    false    341   8      '          0    132037    scheduleables 
   TABLE DATA           �   COPY cecy.scheduleables (id, state_id, schedule_id, classroom_id, scheduleable_type, scheduleable_id, created_at, updated_at) FROM stdin;
    cecy          postgres    false    325   58      %          0    132019 	   schedules 
   TABLE DATA           e   COPY cecy.schedules (id, state_id, start_time, end_time, day_id, created_at, updated_at) FROM stdin;
    cecy          postgres    false    323   R8                0    131810    school_periods 
   TABLE DATA           �   COPY cecy.school_periods (id, code, name, start_date, end_date, ordinary_start_date, ordinary_end_date, extraordinary_start_date, extraordinary_end_date, especial_start_date, especial_end_date, state_id, created_at, updated_at) FROM stdin;
    cecy          postgres    false    309   �8      =          0    132283    target_groups 
   TABLE DATA           e   COPY cecy.target_groups (id, population_id, course_id, state_id, created_at, updated_at) FROM stdin;
    cecy          postgres    false    347   �8      ?          0    132306    topics 
   TABLE DATA           u   COPY cecy.topics (id, description, parent_code_id, state_id, course_id, type_id, created_at, updated_at) FROM stdin;
    cecy          postgres    false    349   �8      9          0    132241    working_informations 
   TABLE DATA           �   COPY cecy.working_informations (id, name, address, email, phone, activity, summmary, sponsor, sponsor_name, instructor_id, state_id, knowledge_course, recomendation_course, created_at, updated_at) FROM stdin;
    cecy          postgres    false    343   9      �          0    131058    authorities 
   TABLE DATA           �   COPY ignug.authorities (id, user_id, type_id, status_id, career_id, code, name, start_date, end_date, state_id, created_at, updated_at) FROM stdin;
    ignug          postgres    false    245   59      �          0    131094    careerables 
   TABLE DATA           S   COPY ignug.careerables (id, career_id, careerable_type, careerable_id) FROM stdin;
    ignug          postgres    false    247   R9      �          0    130943    careers 
   TABLE DATA           �   COPY ignug.careers (id, institution_id, code, name, description, modality_id, resolution_number, title, acronym, type_id, state_id, created_at, updated_at) FROM stdin;
    ignug          postgres    false    235   o9      �          0    130795 
   catalogues 
   TABLE DATA           q   COPY ignug.catalogues (id, parent_code_id, code, name, type, icon, state_id, created_at, updated_at) FROM stdin;
    ignug          postgres    false    223   �9      �          0    130816 
   classrooms 
   TABLE DATA           d   COPY ignug.classrooms (id, code, name, type_id, icon, state_id, created_at, updated_at) FROM stdin;
    ignug          postgres    false    225   0<      �          0    131127    files 
   TABLE DATA           �   COPY ignug.files (id, fileable_type, fileable_id, code, name, description, type, icon, state_id, created_at, updated_at) FROM stdin;
    ignug          postgres    false    251   M<      �          0    131144    images 
   TABLE DATA           �   COPY ignug.images (id, imageable_type, imageable_id, code, name, description, type, icon, state_id, created_at, updated_at) FROM stdin;
    ignug          postgres    false    253   j<      �          0    130837    institutions 
   TABLE DATA           _   COPY ignug.institutions (id, code, name, slogan, state_id, created_at, updated_at) FROM stdin;
    ignug          postgres    false    227   �<      �          0    130853 	   locations 
   TABLE DATA           �   COPY ignug.locations (id, parent_code_id, code, name, type, principal_street, secondary_street, number, post_code, state_id, created_at, updated_at) FROM stdin;
    ignug          postgres    false    229   �<      �          0    130992    school_periods 
   TABLE DATA           �   COPY ignug.school_periods (id, code, name, start_date, end_date, ordinary_start_date, ordinary_end_date, extraordinary_start_date, extraordinary_end_date, especial_start_date, especial_end_date, state_id, created_at, updated_at) FROM stdin;
    ignug          postgres    false    239   �<      �          0    130750    states 
   TABLE DATA           C   COPY ignug.states (id, code, name, description, state) FROM stdin;
    ignug          postgres    false    217   �<      �          0    131012    students 
   TABLE DATA           �   COPY ignug.students (id, user_id, town_id, school_type_id, career_start_date, graduation_year, cohort, state_id, created_at, updated_at) FROM stdin;
    ignug          postgres    false    241    =      �          0    131040    teachers 
   TABLE DATA           P   COPY ignug.teachers (id, user_id, state_id, created_at, updated_at) FROM stdin;
    ignug          postgres    false    243   ==                0    131540 	   abilities 
   TABLE DATA           w   COPY job_board.abilities (id, professional_id, category_id, description, state_id, created_at, updated_at) FROM stdin;
 	   job_board          postgres    false    287   Z=                0    131563    academic_formations 
   TABLE DATA           �   COPY job_board.academic_formations (id, professional_id, category_id, professional_degree_id, registration_date, senescyt_code, has_titling, state_id, created_at, updated_at) FROM stdin;
 	   job_board          postgres    false    289   w=      �          0    131399 
   catalogues 
   TABLE DATA           u   COPY job_board.catalogues (id, parent_code_id, code, name, type, icon, state_id, created_at, updated_at) FROM stdin;
 	   job_board          postgres    false    275   �=      �          0    131441 
   categories 
   TABLE DATA           u   COPY job_board.categories (id, parent_code_id, code, name, type, icon, state_id, created_at, updated_at) FROM stdin;
 	   job_board          postgres    false    279   _                0    131704    category_offer 
   TABLE DATA           ^   COPY job_board.category_offer (id, category_id, offer_id, created_at, updated_at) FROM stdin;
 	   job_board          postgres    false    299   �      �          0    131462 	   companies 
   TABLE DATA           �   COPY job_board.companies (id, user_id, type_id, trade_name, comercial_activity, web_page, state_id, created_at, updated_at) FROM stdin;
 	   job_board          postgres    false    281   �                0    131722    company_professional 
   TABLE DATA           u   COPY job_board.company_professional (id, company_id, professional_id, status_id, created_at, updated_at) FROM stdin;
 	   job_board          postgres    false    301   3�                0    131592    courses 
   TABLE DATA           �   COPY job_board.courses (id, professional_id, event_type_id, institution_id, type_certification_id, event_name, start_date, end_date, hours, state_id, created_at, updated_at) FROM stdin;
 	   job_board          postgres    false    291   P�                0    131628 	   languages 
   TABLE DATA           �   COPY job_board.languages (id, professional_id, written_level_id, spoken_level_id, reading_level_id, state_id, created_at, updated_at) FROM stdin;
 	   job_board          postgres    false    293   m�      �          0    131488 	   locations 
   TABLE DATA           �   COPY job_board.locations (id, parent_code_id, code, name, type, principal_street, secondary_street, number, post_code, state_id, created_at, updated_at) FROM stdin;
 	   job_board          postgres    false    283   ��                0    131745    offer_professional 
   TABLE DATA           q   COPY job_board.offer_professional (id, professional_id, offer_id, status_id, created_at, updated_at) FROM stdin;
 	   job_board          postgres    false    303   ��      �          0    131509    offers 
   TABLE DATA           +  COPY job_board.offers (id, company_id, code, contact, email, phone, cell_phone, contract_type_id, "position", training_hours, experience_time, remuneration, working_day, number_jobs, start_date, end_date, activities, aditional_information, location_id, state_id, created_at, updated_at) FROM stdin;
 	   job_board          postgres    false    285   ��      	          0    131661    professional_experiences 
   TABLE DATA           �   COPY job_board.professional_experiences (id, professional_id, employer, "position", job_description, start_date, end_date, reason_leave, current_work, state_id, created_at, updated_at) FROM stdin;
 	   job_board          postgres    false    295   �                0    131683    professional_references 
   TABLE DATA           �   COPY job_board.professional_references (id, professional_id, institution, "position", contact, phone, state_id, created_at, updated_at) FROM stdin;
 	   job_board          postgres    false    297   7�      �          0    131420    professionals 
   TABLE DATA           c   COPY job_board.professionals (id, user_id, about_me, state_id, created_at, updated_at) FROM stdin;
 	   job_board          postgres    false    277   T�      �          0    131214 
   catalogues 
   TABLE DATA           o   COPY web.catalogues (id, parent_code_id, code, name, type, icon, state_id, created_at, updated_at) FROM stdin;
    web          postgres    false    259   q�      �          0    131235    links 
   TABLE DATA           �   COPY web.links (id, linkable_type, linkable_id, image, url, name, icon, description, status_id, state_id, created_at, updated_at) FROM stdin;
    web          postgres    false    261   ��      �          0    131257    menus 
   TABLE DATA           �   COPY web.menus (id, parent_code_id, name, url, icon, description, "order", type_id, status_id, state_id, created_at, updated_at) FROM stdin;
    web          postgres    false    263   ��      �          0    131325    pages 
   TABLE DATA           x   COPY web.pages (id, menu_id, template_id, section_id, title, subtitle, description, created_at, updated_at) FROM stdin;
    web          postgres    false    269   ț      �          0    131351 	   resources 
   TABLE DATA           �   COPY web.resources (id, resourceable_type, resourceable_id, url, name, description, "order", type_id, status_id, state_id, created_at, updated_at) FROM stdin;
    web          postgres    false    271   �      �          0    131288    sections 
   TABLE DATA           l   COPY web.sections (id, name, description, "order", status_id, state_id, created_at, updated_at) FROM stdin;
    web          postgres    false    265   �      �          0    131309    settings 
   TABLE DATA           e   COPY web.settings (id, name, description, value, type_id, image, created_at, updated_at) FROM stdin;
    web          postgres    false    267   �      �          0    131378    texts 
   TABLE DATA           h   COPY web.texts (id, page_id, type_id, title, subtitle, description, created_at, updated_at) FROM stdin;
    web          postgres    false    273   <�      �           0    0    attendances_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('attendance.attendances_id_seq', 1, false);
       
   attendance          postgres    false    248            �           0    0    catalogues_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('attendance.catalogues_id_seq', 86, true);
       
   attendance          postgres    false    218            �           0    0    tasks_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('attendance.tasks_id_seq', 1, false);
       
   attendance          postgres    false    254            �           0    0    workdays_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('attendance.workdays_id_seq', 1, false);
       
   attendance          postgres    false    256            �           0    0    audits_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('authentication.audits_id_seq', 1, false);
          authentication          postgres    false    220            �           0    0    migrations_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('authentication.migrations_id_seq', 76, true);
          authentication          postgres    false    207            �           0    0    oauth_clients_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('authentication.oauth_clients_id_seq', 2, true);
          authentication          postgres    false    212            �           0    0 $   oauth_personal_access_clients_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('authentication.oauth_personal_access_clients_id_seq', 1, true);
          authentication          postgres    false    214            �           0    0    role_user_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('authentication.role_user_id_seq', 3, true);
          authentication          postgres    false    236            �           0    0    roles_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('authentication.roles_id_seq', 1, false);
          authentication          postgres    false    230            �           0    0    users_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('authentication.users_id_seq', 3, true);
          authentication          postgres    false    232            �           0    0    additional_informations_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('cecy.additional_informations_id_seq', 1, false);
          cecy          postgres    false    330            �           0    0    agreement_companies_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('cecy.agreement_companies_id_seq', 1, false);
          cecy          postgres    false    344            �           0    0    agreements_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('cecy.agreements_id_seq', 1, false);
          cecy          postgres    false    332            �           0    0    assistances_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('cecy.assistances_id_seq', 1, false);
          cecy          postgres    false    334            �           0    0    authorities_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('cecy.authorities_id_seq', 1, false);
          cecy          postgres    false    314            �           0    0    catalogues_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('cecy.catalogues_id_seq', 273, true);
          cecy          postgres    false    304            �           0    0    cecy_institutions_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('cecy.cecy_institutions_id_seq', 1, false);
          cecy          postgres    false    306            �           0    0    courses_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('cecy.courses_id_seq', 7, true);
          cecy          postgres    false    316            �           0    0    department_data_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('cecy.department_data_id_seq', 1, false);
          cecy          postgres    false    338            �           0    0    detail_registrations_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('cecy.detail_registrations_id_seq', 1, false);
          cecy          postgres    false    328            �           0    0    evaluation_mechanisms_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('cecy.evaluation_mechanisms_id_seq', 1, false);
          cecy          postgres    false    310            �           0    0    instructors_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('cecy.instructors_id_seq', 3, true);
          cecy          postgres    false    312            �           0    0    locations_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('cecy.locations_id_seq', 1, false);
          cecy          postgres    false    336            �           0    0    participants_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('cecy.participants_id_seq', 1, false);
          cecy          postgres    false    354            �           0    0 #   person_prerequisites_courses_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('cecy.person_prerequisites_courses_id_seq', 1, false);
          cecy          postgres    false    356            �           0    0     planification_instructors_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('cecy.planification_instructors_id_seq', 1, false);
          cecy          postgres    false    352            �           0    0    planifications_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('cecy.planifications_id_seq', 1, true);
          cecy          postgres    false    318            �           0    0    prerequisites_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('cecy.prerequisites_id_seq', 1, false);
          cecy          postgres    false    320            �           0    0 !   profile_instructor_courses_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('cecy.profile_instructor_courses_id_seq', 1, false);
          cecy          postgres    false    350            �           0    0    registrations_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('cecy.registrations_id_seq', 1, false);
          cecy          postgres    false    326            �           0    0    requirements_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('cecy.requirements_id_seq', 1, false);
          cecy          postgres    false    340            �           0    0    scheduleables_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('cecy.scheduleables_id_seq', 1, false);
          cecy          postgres    false    324            �           0    0    schedules_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('cecy.schedules_id_seq', 2, true);
          cecy          postgres    false    322            �           0    0    school_periods_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('cecy.school_periods_id_seq', 1, true);
          cecy          postgres    false    308            �           0    0    target_groups_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('cecy.target_groups_id_seq', 1, false);
          cecy          postgres    false    346            �           0    0    topics_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('cecy.topics_id_seq', 1, false);
          cecy          postgres    false    348            �           0    0    working_informations_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('cecy.working_informations_id_seq', 1, false);
          cecy          postgres    false    342            �           0    0    authorities_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('ignug.authorities_id_seq', 1, false);
          ignug          postgres    false    244            �           0    0    careerables_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('ignug.careerables_id_seq', 1, false);
          ignug          postgres    false    246            �           0    0    careers_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('ignug.careers_id_seq', 1, false);
          ignug          postgres    false    234            �           0    0    catalogues_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('ignug.catalogues_id_seq', 40, true);
          ignug          postgres    false    222            �           0    0    classrooms_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('ignug.classrooms_id_seq', 1, false);
          ignug          postgres    false    224            �           0    0    files_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('ignug.files_id_seq', 1, false);
          ignug          postgres    false    250            �           0    0    images_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('ignug.images_id_seq', 1, false);
          ignug          postgres    false    252            �           0    0    institutions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('ignug.institutions_id_seq', 1, false);
          ignug          postgres    false    226            �           0    0    locations_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('ignug.locations_id_seq', 1, false);
          ignug          postgres    false    228            �           0    0    school_periods_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('ignug.school_periods_id_seq', 1, false);
          ignug          postgres    false    238            �           0    0    states_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('ignug.states_id_seq', 3, true);
          ignug          postgres    false    216            �           0    0    students_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('ignug.students_id_seq', 1, false);
          ignug          postgres    false    240            �           0    0    teachers_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('ignug.teachers_id_seq', 1, false);
          ignug          postgres    false    242            �           0    0    abilities_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('job_board.abilities_id_seq', 1, false);
       	   job_board          postgres    false    286            �           0    0    academic_formations_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('job_board.academic_formations_id_seq', 1, false);
       	   job_board          postgres    false    288            �           0    0    catalogues_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('job_board.catalogues_id_seq', 100, true);
       	   job_board          postgres    false    274            �           0    0    categories_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('job_board.categories_id_seq', 100, true);
       	   job_board          postgres    false    278            �           0    0    category_offer_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('job_board.category_offer_id_seq', 1, false);
       	   job_board          postgres    false    298            �           0    0    companies_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('job_board.companies_id_seq', 1, false);
       	   job_board          postgres    false    280            �           0    0    company_professional_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('job_board.company_professional_id_seq', 1, false);
       	   job_board          postgres    false    300            �           0    0    courses_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('job_board.courses_id_seq', 1, false);
       	   job_board          postgres    false    290            �           0    0    languages_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('job_board.languages_id_seq', 1, false);
       	   job_board          postgres    false    292            �           0    0    locations_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('job_board.locations_id_seq', 112, true);
       	   job_board          postgres    false    282            �           0    0    offer_professional_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('job_board.offer_professional_id_seq', 1, false);
       	   job_board          postgres    false    302            �           0    0    offers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('job_board.offers_id_seq', 1, false);
       	   job_board          postgres    false    284            �           0    0    professional_experiences_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('job_board.professional_experiences_id_seq', 1, false);
       	   job_board          postgres    false    294            �           0    0    professional_references_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('job_board.professional_references_id_seq', 1, false);
       	   job_board          postgres    false    296            �           0    0    professionals_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('job_board.professionals_id_seq', 1, false);
       	   job_board          postgres    false    276            �           0    0    catalogues_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('web.catalogues_id_seq', 1, false);
          web          postgres    false    258            �           0    0    links_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('web.links_id_seq', 1, false);
          web          postgres    false    260            �           0    0    menus_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('web.menus_id_seq', 1, false);
          web          postgres    false    262            �           0    0    pages_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('web.pages_id_seq', 1, false);
          web          postgres    false    268            �           0    0    resources_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('web.resources_id_seq', 1, false);
          web          postgres    false    270            �           0    0    sections_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('web.sections_id_seq', 1, false);
          web          postgres    false    264            �           0    0    settings_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('web.settings_id_seq', 1, false);
          web          postgres    false    266            �           0    0    texts_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('web.texts_id_seq', 1, false);
          web          postgres    false    272            �           2606    131113    attendances attendances_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY attendance.attendances
    ADD CONSTRAINT attendances_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY attendance.attendances DROP CONSTRAINT attendances_pkey;
    
   attendance            postgres    false    249            �           2606    130769    catalogues catalogues_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY attendance.catalogues
    ADD CONSTRAINT catalogues_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY attendance.catalogues DROP CONSTRAINT catalogues_pkey;
    
   attendance            postgres    false    219                       2606    131170    tasks tasks_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY attendance.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY attendance.tasks DROP CONSTRAINT tasks_pkey;
    
   attendance            postgres    false    255                       2606    131196    workdays workdays_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY attendance.workdays
    ADD CONSTRAINT workdays_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY attendance.workdays DROP CONSTRAINT workdays_pkey;
    
   attendance            postgres    false    257            �           2606    130790    audits audits_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY authentication.audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY authentication.audits DROP CONSTRAINT audits_pkey;
       authentication            postgres    false    221            �           2606    130704    migrations migrations_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY authentication.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY authentication.migrations DROP CONSTRAINT migrations_pkey;
       authentication            postgres    false    208            �           2606    130721 ,   oauth_access_tokens oauth_access_tokens_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY authentication.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY authentication.oauth_access_tokens DROP CONSTRAINT oauth_access_tokens_pkey;
       authentication            postgres    false    210            �           2606    130712 &   oauth_auth_codes oauth_auth_codes_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY authentication.oauth_auth_codes
    ADD CONSTRAINT oauth_auth_codes_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY authentication.oauth_auth_codes DROP CONSTRAINT oauth_auth_codes_pkey;
       authentication            postgres    false    209            �           2606    130738     oauth_clients oauth_clients_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY authentication.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY authentication.oauth_clients DROP CONSTRAINT oauth_clients_pkey;
       authentication            postgres    false    213            �           2606    130747 @   oauth_personal_access_clients oauth_personal_access_clients_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY authentication.oauth_personal_access_clients
    ADD CONSTRAINT oauth_personal_access_clients_pkey PRIMARY KEY (id);
 r   ALTER TABLE ONLY authentication.oauth_personal_access_clients DROP CONSTRAINT oauth_personal_access_clients_pkey;
       authentication            postgres    false    215            �           2606    130727 .   oauth_refresh_tokens oauth_refresh_tokens_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY authentication.oauth_refresh_tokens
    ADD CONSTRAINT oauth_refresh_tokens_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY authentication.oauth_refresh_tokens DROP CONSTRAINT oauth_refresh_tokens_pkey;
       authentication            postgres    false    211            �           2606    130979    role_user role_user_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY authentication.role_user
    ADD CONSTRAINT role_user_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY authentication.role_user DROP CONSTRAINT role_user_pkey;
       authentication            postgres    false    237            �           2606    130879    roles roles_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY authentication.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY authentication.roles DROP CONSTRAINT roles_pkey;
       authentication            postgres    false    231            �           2606    130940    users users_email_unique 
   CONSTRAINT     \   ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 J   ALTER TABLE ONLY authentication.users DROP CONSTRAINT users_email_unique;
       authentication            postgres    false    233            �           2606    130938 !   users users_personal_email_unique 
   CONSTRAINT     n   ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_personal_email_unique UNIQUE (personal_email);
 S   ALTER TABLE ONLY authentication.users DROP CONSTRAINT users_personal_email_unique;
       authentication            postgres    false    233            �           2606    130901    users users_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY authentication.users DROP CONSTRAINT users_pkey;
       authentication            postgres    false    233            X           2606    132128 4   additional_informations additional_informations_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY cecy.additional_informations
    ADD CONSTRAINT additional_informations_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY cecy.additional_informations DROP CONSTRAINT additional_informations_pkey;
       cecy            postgres    false    331            f           2606    132270 ,   agreement_companies agreement_companies_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY cecy.agreement_companies
    ADD CONSTRAINT agreement_companies_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY cecy.agreement_companies DROP CONSTRAINT agreement_companies_pkey;
       cecy            postgres    false    345            Z           2606    132151    agreements agreements_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY cecy.agreements
    ADD CONSTRAINT agreements_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY cecy.agreements DROP CONSTRAINT agreements_pkey;
       cecy            postgres    false    333            \           2606    132164    assistances assistances_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY cecy.assistances
    ADD CONSTRAINT assistances_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY cecy.assistances DROP CONSTRAINT assistances_pkey;
       cecy            postgres    false    335            G           2606    131876    authorities authorities_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY cecy.authorities
    ADD CONSTRAINT authorities_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY cecy.authorities DROP CONSTRAINT authorities_pkey;
       cecy            postgres    false    315            9           2606    131776    catalogues catalogues_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY cecy.catalogues
    ADD CONSTRAINT catalogues_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY cecy.catalogues DROP CONSTRAINT catalogues_pkey;
       cecy            postgres    false    305            ;           2606    131797 (   cecy_institutions cecy_institutions_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY cecy.cecy_institutions
    ADD CONSTRAINT cecy_institutions_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY cecy.cecy_institutions DROP CONSTRAINT cecy_institutions_pkey;
       cecy            postgres    false    307            I           2606    131907    courses courses_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY cecy.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY cecy.courses DROP CONSTRAINT courses_pkey;
       cecy            postgres    false    317            `           2606    132195 $   department_data department_data_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY cecy.department_data
    ADD CONSTRAINT department_data_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY cecy.department_data DROP CONSTRAINT department_data_pkey;
       cecy            postgres    false    339            V           2606    132097 .   detail_registrations detail_registrations_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY cecy.detail_registrations
    ADD CONSTRAINT detail_registrations_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY cecy.detail_registrations DROP CONSTRAINT detail_registrations_pkey;
       cecy            postgres    false    329            C           2606    131835 0   evaluation_mechanisms evaluation_mechanisms_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY cecy.evaluation_mechanisms
    ADD CONSTRAINT evaluation_mechanisms_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY cecy.evaluation_mechanisms DROP CONSTRAINT evaluation_mechanisms_pkey;
       cecy            postgres    false    311            E           2606    131858    instructors instructors_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY cecy.instructors
    ADD CONSTRAINT instructors_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY cecy.instructors DROP CONSTRAINT instructors_pkey;
       cecy            postgres    false    313            ^           2606    132182    locations locations_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY cecy.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY cecy.locations DROP CONSTRAINT locations_pkey;
       cecy            postgres    false    337            p           2606    132388    participants participants_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY cecy.participants
    ADD CONSTRAINT participants_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY cecy.participants DROP CONSTRAINT participants_pkey;
       cecy            postgres    false    355            r           2606    132411 >   person_prerequisites_courses person_prerequisites_courses_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY cecy.person_prerequisites_courses
    ADD CONSTRAINT person_prerequisites_courses_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY cecy.person_prerequisites_courses DROP CONSTRAINT person_prerequisites_courses_pkey;
       cecy            postgres    false    357            n           2606    132360 8   planification_instructors planification_instructors_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY cecy.planification_instructors
    ADD CONSTRAINT planification_instructors_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY cecy.planification_instructors DROP CONSTRAINT planification_instructors_pkey;
       cecy            postgres    false    353            K           2606    131963 "   planifications planifications_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY cecy.planifications
    ADD CONSTRAINT planifications_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY cecy.planifications DROP CONSTRAINT planifications_pkey;
       cecy            postgres    false    319            M           2606    132001     prerequisites prerequisites_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY cecy.prerequisites
    ADD CONSTRAINT prerequisites_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY cecy.prerequisites DROP CONSTRAINT prerequisites_pkey;
       cecy            postgres    false    321            l           2606    132342 :   profile_instructor_courses profile_instructor_courses_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY cecy.profile_instructor_courses
    ADD CONSTRAINT profile_instructor_courses_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY cecy.profile_instructor_courses DROP CONSTRAINT profile_instructor_courses_pkey;
       cecy            postgres    false    351            T           2606    132066     registrations registrations_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY cecy.registrations
    ADD CONSTRAINT registrations_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY cecy.registrations DROP CONSTRAINT registrations_pkey;
       cecy            postgres    false    327            b           2606    132223    requirements requirements_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY cecy.requirements
    ADD CONSTRAINT requirements_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY cecy.requirements DROP CONSTRAINT requirements_pkey;
       cecy            postgres    false    341            Q           2606    132042     scheduleables scheduleables_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY cecy.scheduleables
    ADD CONSTRAINT scheduleables_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY cecy.scheduleables DROP CONSTRAINT scheduleables_pkey;
       cecy            postgres    false    325            O           2606    132024    schedules schedules_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY cecy.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY cecy.schedules DROP CONSTRAINT schedules_pkey;
       cecy            postgres    false    323            =           2606    131825 )   school_periods school_periods_code_unique 
   CONSTRAINT     b   ALTER TABLE ONLY cecy.school_periods
    ADD CONSTRAINT school_periods_code_unique UNIQUE (code);
 Q   ALTER TABLE ONLY cecy.school_periods DROP CONSTRAINT school_periods_code_unique;
       cecy            postgres    false    309            ?           2606    131827 )   school_periods school_periods_name_unique 
   CONSTRAINT     b   ALTER TABLE ONLY cecy.school_periods
    ADD CONSTRAINT school_periods_name_unique UNIQUE (name);
 Q   ALTER TABLE ONLY cecy.school_periods DROP CONSTRAINT school_periods_name_unique;
       cecy            postgres    false    309            A           2606    131818 "   school_periods school_periods_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY cecy.school_periods
    ADD CONSTRAINT school_periods_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY cecy.school_periods DROP CONSTRAINT school_periods_pkey;
       cecy            postgres    false    309            h           2606    132288     target_groups target_groups_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY cecy.target_groups
    ADD CONSTRAINT target_groups_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY cecy.target_groups DROP CONSTRAINT target_groups_pkey;
       cecy            postgres    false    347            j           2606    132314    topics topics_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY cecy.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY cecy.topics DROP CONSTRAINT topics_pkey;
       cecy            postgres    false    349            d           2606    132249 .   working_informations working_informations_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY cecy.working_informations
    ADD CONSTRAINT working_informations_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY cecy.working_informations DROP CONSTRAINT working_informations_pkey;
       cecy            postgres    false    343            �           2606    131066    authorities authorities_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY ignug.authorities
    ADD CONSTRAINT authorities_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY ignug.authorities DROP CONSTRAINT authorities_pkey;
       ignug            postgres    false    245            �           2606    131099    careerables careerables_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY ignug.careerables
    ADD CONSTRAINT careerables_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY ignug.careerables DROP CONSTRAINT careerables_pkey;
       ignug            postgres    false    247            �           2606    130951    careers careers_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY ignug.careers
    ADD CONSTRAINT careers_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY ignug.careers DROP CONSTRAINT careers_pkey;
       ignug            postgres    false    235            �           2606    130803    catalogues catalogues_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY ignug.catalogues
    ADD CONSTRAINT catalogues_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY ignug.catalogues DROP CONSTRAINT catalogues_pkey;
       ignug            postgres    false    223            �           2606    130824    classrooms classrooms_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY ignug.classrooms
    ADD CONSTRAINT classrooms_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY ignug.classrooms DROP CONSTRAINT classrooms_pkey;
       ignug            postgres    false    225                        2606    131135    files files_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY ignug.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY ignug.files DROP CONSTRAINT files_pkey;
       ignug            postgres    false    251                       2606    131152    images images_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY ignug.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY ignug.images DROP CONSTRAINT images_pkey;
       ignug            postgres    false    253            �           2606    130845    institutions institutions_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY ignug.institutions
    ADD CONSTRAINT institutions_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY ignug.institutions DROP CONSTRAINT institutions_pkey;
       ignug            postgres    false    227            �           2606    130861    locations locations_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY ignug.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY ignug.locations DROP CONSTRAINT locations_pkey;
       ignug            postgres    false    229            �           2606    131007 )   school_periods school_periods_code_unique 
   CONSTRAINT     c   ALTER TABLE ONLY ignug.school_periods
    ADD CONSTRAINT school_periods_code_unique UNIQUE (code);
 R   ALTER TABLE ONLY ignug.school_periods DROP CONSTRAINT school_periods_code_unique;
       ignug            postgres    false    239            �           2606    131009 )   school_periods school_periods_name_unique 
   CONSTRAINT     c   ALTER TABLE ONLY ignug.school_periods
    ADD CONSTRAINT school_periods_name_unique UNIQUE (name);
 R   ALTER TABLE ONLY ignug.school_periods DROP CONSTRAINT school_periods_name_unique;
       ignug            postgres    false    239            �           2606    131000 "   school_periods school_periods_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY ignug.school_periods
    ADD CONSTRAINT school_periods_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY ignug.school_periods DROP CONSTRAINT school_periods_pkey;
       ignug            postgres    false    239            �           2606    130758    states states_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY ignug.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY ignug.states DROP CONSTRAINT states_pkey;
       ignug            postgres    false    217            �           2606    131017    students students_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY ignug.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY ignug.students DROP CONSTRAINT students_pkey;
       ignug            postgres    false    241            �           2606    131045    teachers teachers_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY ignug.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY ignug.teachers DROP CONSTRAINT teachers_pkey;
       ignug            postgres    false    243            '           2606    131545    abilities abilities_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY job_board.abilities
    ADD CONSTRAINT abilities_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY job_board.abilities DROP CONSTRAINT abilities_pkey;
    	   job_board            postgres    false    287            )           2606    131569 ,   academic_formations academic_formations_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY job_board.academic_formations
    ADD CONSTRAINT academic_formations_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY job_board.academic_formations DROP CONSTRAINT academic_formations_pkey;
    	   job_board            postgres    false    289                       2606    131407    catalogues catalogues_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY job_board.catalogues
    ADD CONSTRAINT catalogues_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY job_board.catalogues DROP CONSTRAINT catalogues_pkey;
    	   job_board            postgres    false    275                       2606    131449    categories categories_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY job_board.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY job_board.categories DROP CONSTRAINT categories_pkey;
    	   job_board            postgres    false    279            3           2606    131709 "   category_offer category_offer_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY job_board.category_offer
    ADD CONSTRAINT category_offer_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY job_board.category_offer DROP CONSTRAINT category_offer_pkey;
    	   job_board            postgres    false    299            !           2606    131470    companies companies_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY job_board.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY job_board.companies DROP CONSTRAINT companies_pkey;
    	   job_board            postgres    false    281            5           2606    131727 .   company_professional company_professional_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY job_board.company_professional
    ADD CONSTRAINT company_professional_pkey PRIMARY KEY (id);
 [   ALTER TABLE ONLY job_board.company_professional DROP CONSTRAINT company_professional_pkey;
    	   job_board            postgres    false    301            +           2606    131600    courses courses_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY job_board.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY job_board.courses DROP CONSTRAINT courses_pkey;
    	   job_board            postgres    false    291            -           2606    131633    languages languages_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY job_board.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY job_board.languages DROP CONSTRAINT languages_pkey;
    	   job_board            postgres    false    293            #           2606    131496    locations locations_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY job_board.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY job_board.locations DROP CONSTRAINT locations_pkey;
    	   job_board            postgres    false    283            7           2606    131750 *   offer_professional offer_professional_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY job_board.offer_professional
    ADD CONSTRAINT offer_professional_pkey PRIMARY KEY (id);
 W   ALTER TABLE ONLY job_board.offer_professional DROP CONSTRAINT offer_professional_pkey;
    	   job_board            postgres    false    303            %           2606    131517    offers offers_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY job_board.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY job_board.offers DROP CONSTRAINT offers_pkey;
    	   job_board            postgres    false    285            /           2606    131670 6   professional_experiences professional_experiences_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY job_board.professional_experiences
    ADD CONSTRAINT professional_experiences_pkey PRIMARY KEY (id);
 c   ALTER TABLE ONLY job_board.professional_experiences DROP CONSTRAINT professional_experiences_pkey;
    	   job_board            postgres    false    295            1           2606    131691 4   professional_references professional_references_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY job_board.professional_references
    ADD CONSTRAINT professional_references_pkey PRIMARY KEY (id);
 a   ALTER TABLE ONLY job_board.professional_references DROP CONSTRAINT professional_references_pkey;
    	   job_board            postgres    false    297                       2606    131428     professionals professionals_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY job_board.professionals
    ADD CONSTRAINT professionals_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY job_board.professionals DROP CONSTRAINT professionals_pkey;
    	   job_board            postgres    false    277            	           2606    131222    catalogues catalogues_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY web.catalogues
    ADD CONSTRAINT catalogues_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY web.catalogues DROP CONSTRAINT catalogues_pkey;
       web            postgres    false    259                       2606    131243    links links_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY web.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY web.links DROP CONSTRAINT links_pkey;
       web            postgres    false    261                       2606    131265    menus menus_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY web.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY web.menus DROP CONSTRAINT menus_pkey;
       web            postgres    false    263                       2606    131333    pages pages_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY web.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY web.pages DROP CONSTRAINT pages_pkey;
       web            postgres    false    269                       2606    131359    resources resources_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY web.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY web.resources DROP CONSTRAINT resources_pkey;
       web            postgres    false    271                       2606    131296    sections sections_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY web.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY web.sections DROP CONSTRAINT sections_pkey;
       web            postgres    false    265                       2606    131317    settings settings_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY web.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY web.settings DROP CONSTRAINT settings_pkey;
       web            postgres    false    267                       2606    131386    texts texts_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY web.texts
    ADD CONSTRAINT texts_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY web.texts DROP CONSTRAINT texts_pkey;
       web            postgres    false    273            �           1259    131114 7   attendances_attendanceable_type_attendanceable_id_index    INDEX     �   CREATE INDEX attendances_attendanceable_type_attendanceable_id_index ON attendance.attendances USING btree (attendanceable_type, attendanceable_id);
 O   DROP INDEX attendance.attendances_attendanceable_type_attendanceable_id_index;
    
   attendance            postgres    false    249    249            �           1259    130791 (   audits_auditable_type_auditable_id_index    INDEX     {   CREATE INDEX audits_auditable_type_auditable_id_index ON authentication.audits USING btree (auditable_type, auditable_id);
 D   DROP INDEX authentication.audits_auditable_type_auditable_id_index;
       authentication            postgres    false    221    221            �           1259    130792    audits_user_id_user_type_index    INDEX     g   CREATE INDEX audits_user_id_user_type_index ON authentication.audits USING btree (user_id, user_type);
 :   DROP INDEX authentication.audits_user_id_user_type_index;
       authentication            postgres    false    221    221            �           1259    130722 !   oauth_access_tokens_user_id_index    INDEX     l   CREATE INDEX oauth_access_tokens_user_id_index ON authentication.oauth_access_tokens USING btree (user_id);
 =   DROP INDEX authentication.oauth_access_tokens_user_id_index;
       authentication            postgres    false    210            �           1259    130713    oauth_auth_codes_user_id_index    INDEX     f   CREATE INDEX oauth_auth_codes_user_id_index ON authentication.oauth_auth_codes USING btree (user_id);
 :   DROP INDEX authentication.oauth_auth_codes_user_id_index;
       authentication            postgres    false    209            �           1259    130739    oauth_clients_user_id_index    INDEX     `   CREATE INDEX oauth_clients_user_id_index ON authentication.oauth_clients USING btree (user_id);
 7   DROP INDEX authentication.oauth_clients_user_id_index;
       authentication            postgres    false    213            R           1259    132058 5   scheduleables_scheduleable_type_scheduleable_id_index    INDEX     �   CREATE INDEX scheduleables_scheduleable_type_scheduleable_id_index ON cecy.scheduleables USING btree (scheduleable_type, scheduleable_id);
 G   DROP INDEX cecy.scheduleables_scheduleable_type_scheduleable_id_index;
       cecy            postgres    false    325    325            �           1259    131105 /   careerables_careerable_type_careerable_id_index    INDEX     �   CREATE INDEX careerables_careerable_type_careerable_id_index ON ignug.careerables USING btree (careerable_type, careerable_id);
 B   DROP INDEX ignug.careerables_careerable_type_careerable_id_index;
       ignug            postgres    false    247    247            �           1259    131136 %   files_fileable_type_fileable_id_index    INDEX     l   CREATE INDEX files_fileable_type_fileable_id_index ON ignug.files USING btree (fileable_type, fileable_id);
 8   DROP INDEX ignug.files_fileable_type_fileable_id_index;
       ignug            postgres    false    251    251                       1259    131153 (   images_imageable_type_imageable_id_index    INDEX     r   CREATE INDEX images_imageable_type_imageable_id_index ON ignug.images USING btree (imageable_type, imageable_id);
 ;   DROP INDEX ignug.images_imageable_type_imageable_id_index;
       ignug            postgres    false    253    253            
           1259    131244 %   links_linkable_type_linkable_id_index    INDEX     j   CREATE INDEX links_linkable_type_linkable_id_index ON web.links USING btree (linkable_type, linkable_id);
 6   DROP INDEX web.links_linkable_type_linkable_id_index;
       web            postgres    false    261    261                       1259    131360 1   resources_resourceable_type_resourceable_id_index    INDEX     �   CREATE INDEX resources_resourceable_type_resourceable_id_index ON web.resources USING btree (resourceable_type, resourceable_id);
 B   DROP INDEX web.resources_resourceable_type_resourceable_id_index;
       web            postgres    false    271    271            �           2606    131120 (   attendances attendances_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY attendance.attendances
    ADD CONSTRAINT attendances_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 V   ALTER TABLE ONLY attendance.attendances DROP CONSTRAINT attendances_state_id_foreign;
    
   attendance          postgres    false    3281    217    249            �           2606    131115 '   attendances attendances_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY attendance.attendances
    ADD CONSTRAINT attendances_type_id_foreign FOREIGN KEY (type_id) REFERENCES attendance.catalogues(id);
 U   ALTER TABLE ONLY attendance.attendances DROP CONSTRAINT attendances_type_id_foreign;
    
   attendance          postgres    false    249    3283    219            s           2606    130770 ,   catalogues catalogues_parent_code_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY attendance.catalogues
    ADD CONSTRAINT catalogues_parent_code_id_foreign FOREIGN KEY (parent_code_id) REFERENCES attendance.catalogues(id);
 Z   ALTER TABLE ONLY attendance.catalogues DROP CONSTRAINT catalogues_parent_code_id_foreign;
    
   attendance          postgres    false    219    3283    219            t           2606    130775 &   catalogues catalogues_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY attendance.catalogues
    ADD CONSTRAINT catalogues_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 T   ALTER TABLE ONLY attendance.catalogues DROP CONSTRAINT catalogues_state_id_foreign;
    
   attendance          postgres    false    219    217    3281            �           2606    131171 !   tasks tasks_attendance_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY attendance.tasks
    ADD CONSTRAINT tasks_attendance_id_foreign FOREIGN KEY (attendance_id) REFERENCES attendance.attendances(id);
 O   ALTER TABLE ONLY attendance.tasks DROP CONSTRAINT tasks_attendance_id_foreign;
    
   attendance          postgres    false    249    3325    255            �           2606    131181    tasks tasks_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY attendance.tasks
    ADD CONSTRAINT tasks_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 J   ALTER TABLE ONLY attendance.tasks DROP CONSTRAINT tasks_state_id_foreign;
    
   attendance          postgres    false    255    3281    217            �           2606    131176    tasks tasks_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY attendance.tasks
    ADD CONSTRAINT tasks_type_id_foreign FOREIGN KEY (type_id) REFERENCES attendance.catalogues(id);
 I   ALTER TABLE ONLY attendance.tasks DROP CONSTRAINT tasks_type_id_foreign;
    
   attendance          postgres    false    255    219    3283            �           2606    131197 '   workdays workdays_attendance_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY attendance.workdays
    ADD CONSTRAINT workdays_attendance_id_foreign FOREIGN KEY (attendance_id) REFERENCES attendance.attendances(id);
 U   ALTER TABLE ONLY attendance.workdays DROP CONSTRAINT workdays_attendance_id_foreign;
    
   attendance          postgres    false    257    249    3325            �           2606    131207 "   workdays workdays_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY attendance.workdays
    ADD CONSTRAINT workdays_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 P   ALTER TABLE ONLY attendance.workdays DROP CONSTRAINT workdays_state_id_foreign;
    
   attendance          postgres    false    257    3281    217            �           2606    131202 !   workdays workdays_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY attendance.workdays
    ADD CONSTRAINT workdays_type_id_foreign FOREIGN KEY (type_id) REFERENCES attendance.catalogues(id);
 O   ALTER TABLE ONLY attendance.workdays DROP CONSTRAINT workdays_type_id_foreign;
    
   attendance          postgres    false    219    257    3283            �           2606    130985 #   role_user role_user_role_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY authentication.role_user
    ADD CONSTRAINT role_user_role_id_foreign FOREIGN KEY (role_id) REFERENCES authentication.roles(id);
 U   ALTER TABLE ONLY authentication.role_user DROP CONSTRAINT role_user_role_id_foreign;
       authentication          postgres    false    3297    237    231            �           2606    130980 #   role_user role_user_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY authentication.role_user
    ADD CONSTRAINT role_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES authentication.users(id);
 U   ALTER TABLE ONLY authentication.role_user DROP CONSTRAINT role_user_user_id_foreign;
       authentication          postgres    false    3303    233    237            }           2606    130885    roles roles_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY authentication.roles
    ADD CONSTRAINT roles_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 N   ALTER TABLE ONLY authentication.roles DROP CONSTRAINT roles_state_id_foreign;
       authentication          postgres    false    217    3281    231            |           2606    130880    roles roles_system_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY authentication.roles
    ADD CONSTRAINT roles_system_id_foreign FOREIGN KEY (system_id) REFERENCES ignug.catalogues(id);
 O   ALTER TABLE ONLY authentication.roles DROP CONSTRAINT roles_system_id_foreign;
       authentication          postgres    false    3289    231    223            �           2606    130927 !   users users_blood_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_blood_type_id_foreign FOREIGN KEY (blood_type_id) REFERENCES ignug.catalogues(id);
 S   ALTER TABLE ONLY authentication.users DROP CONSTRAINT users_blood_type_id_foreign;
       authentication          postgres    false    223    3289    233            ~           2606    130902 $   users users_ethnic_origin_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_ethnic_origin_id_foreign FOREIGN KEY (ethnic_origin_id) REFERENCES ignug.catalogues(id);
 V   ALTER TABLE ONLY authentication.users DROP CONSTRAINT users_ethnic_origin_id_foreign;
       authentication          postgres    false    233    223    3289            �           2606    130922    users users_gender_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_gender_id_foreign FOREIGN KEY (gender_id) REFERENCES ignug.catalogues(id);
 O   ALTER TABLE ONLY authentication.users DROP CONSTRAINT users_gender_id_foreign;
       authentication          postgres    false    223    233    3289            �           2606    130912 *   users users_identification_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_identification_type_id_foreign FOREIGN KEY (identification_type_id) REFERENCES ignug.catalogues(id);
 \   ALTER TABLE ONLY authentication.users DROP CONSTRAINT users_identification_type_id_foreign;
       authentication          postgres    false    233    223    3289                       2606    130907    users users_location_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_location_id_foreign FOREIGN KEY (location_id) REFERENCES ignug.catalogues(id);
 Q   ALTER TABLE ONLY authentication.users DROP CONSTRAINT users_location_id_foreign;
       authentication          postgres    false    223    3289    233            �           2606    130917    users users_sex_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_sex_id_foreign FOREIGN KEY (sex_id) REFERENCES ignug.catalogues(id);
 L   ALTER TABLE ONLY authentication.users DROP CONSTRAINT users_sex_id_foreign;
       authentication          postgres    false    223    233    3289            �           2606    130932    users users_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 N   ALTER TABLE ONLY authentication.users DROP CONSTRAINT users_state_id_foreign;
       authentication          postgres    false    233    217    3281                       2606    132139 I   additional_informations additional_informations_level_instruction_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.additional_informations
    ADD CONSTRAINT additional_informations_level_instruction_foreign FOREIGN KEY (level_instruction) REFERENCES cecy.catalogues(id);
 q   ALTER TABLE ONLY cecy.additional_informations DROP CONSTRAINT additional_informations_level_instruction_foreign;
       cecy          postgres    false    3385    331    305                       2606    132134 G   additional_informations additional_informations_registration_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.additional_informations
    ADD CONSTRAINT additional_informations_registration_id_foreign FOREIGN KEY (registration_id) REFERENCES cecy.registrations(id);
 o   ALTER TABLE ONLY cecy.additional_informations DROP CONSTRAINT additional_informations_registration_id_foreign;
       cecy          postgres    false    3412    331    327                       2606    132129 @   additional_informations additional_informations_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.additional_informations
    ADD CONSTRAINT additional_informations_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 h   ALTER TABLE ONLY cecy.additional_informations DROP CONSTRAINT additional_informations_state_id_foreign;
       cecy          postgres    false    331    217    3281                       2606    132271 <   agreement_companies agreement_companies_agreement_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.agreement_companies
    ADD CONSTRAINT agreement_companies_agreement_id_foreign FOREIGN KEY (agreement_id) REFERENCES cecy.agreements(id);
 d   ALTER TABLE ONLY cecy.agreement_companies DROP CONSTRAINT agreement_companies_agreement_id_foreign;
       cecy          postgres    false    345    3418    333                       2606    132276 8   agreement_companies agreement_companies_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.agreement_companies
    ADD CONSTRAINT agreement_companies_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 `   ALTER TABLE ONLY cecy.agreement_companies DROP CONSTRAINT agreement_companies_state_id_foreign;
       cecy          postgres    false    345    217    3281                       2606    132152 &   agreements agreements_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.agreements
    ADD CONSTRAINT agreements_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 N   ALTER TABLE ONLY cecy.agreements DROP CONSTRAINT agreements_state_id_foreign;
       cecy          postgres    false    3281    333    217                       2606    132170 6   assistances assistances_detail_registration_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.assistances
    ADD CONSTRAINT assistances_detail_registration_id_foreign FOREIGN KEY (detail_registration_id) REFERENCES cecy.detail_registrations(id);
 ^   ALTER TABLE ONLY cecy.assistances DROP CONSTRAINT assistances_detail_registration_id_foreign;
       cecy          postgres    false    329    335    3414                       2606    132165 (   assistances assistances_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.assistances
    ADD CONSTRAINT assistances_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 P   ALTER TABLE ONLY cecy.assistances DROP CONSTRAINT assistances_state_id_foreign;
       cecy          postgres    false    217    3281    335            �           2606    131892 +   authorities authorities_position_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.authorities
    ADD CONSTRAINT authorities_position_id_foreign FOREIGN KEY (position_id) REFERENCES cecy.catalogues(id);
 S   ALTER TABLE ONLY cecy.authorities DROP CONSTRAINT authorities_position_id_foreign;
       cecy          postgres    false    3385    315    305            �           2606    131882 (   authorities authorities_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.authorities
    ADD CONSTRAINT authorities_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 P   ALTER TABLE ONLY cecy.authorities DROP CONSTRAINT authorities_state_id_foreign;
       cecy          postgres    false    217    315    3281            �           2606    131887 )   authorities authorities_status_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.authorities
    ADD CONSTRAINT authorities_status_id_foreign FOREIGN KEY (status_id) REFERENCES cecy.catalogues(id);
 Q   ALTER TABLE ONLY cecy.authorities DROP CONSTRAINT authorities_status_id_foreign;
       cecy          postgres    false    305    315    3385            �           2606    131877 '   authorities authorities_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.authorities
    ADD CONSTRAINT authorities_user_id_foreign FOREIGN KEY (user_id) REFERENCES authentication.users(id);
 O   ALTER TABLE ONLY cecy.authorities DROP CONSTRAINT authorities_user_id_foreign;
       cecy          postgres    false    233    315    3303            �           2606    131777 ,   catalogues catalogues_parent_code_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.catalogues
    ADD CONSTRAINT catalogues_parent_code_id_foreign FOREIGN KEY (parent_code_id) REFERENCES cecy.catalogues(id);
 T   ALTER TABLE ONLY cecy.catalogues DROP CONSTRAINT catalogues_parent_code_id_foreign;
       cecy          postgres    false    3385    305    305            �           2606    131782 &   catalogues catalogues_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.catalogues
    ADD CONSTRAINT catalogues_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 N   ALTER TABLE ONLY cecy.catalogues DROP CONSTRAINT catalogues_state_id_foreign;
       cecy          postgres    false    217    305    3281            �           2606    131803 0   cecy_institutions cecy_institutions_logo_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.cecy_institutions
    ADD CONSTRAINT cecy_institutions_logo_foreign FOREIGN KEY (logo) REFERENCES ignug.images(id);
 X   ALTER TABLE ONLY cecy.cecy_institutions DROP CONSTRAINT cecy_institutions_logo_foreign;
       cecy          postgres    false    307    3331    253            �           2606    131798 4   cecy_institutions cecy_institutions_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.cecy_institutions
    ADD CONSTRAINT cecy_institutions_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 \   ALTER TABLE ONLY cecy.cecy_institutions DROP CONSTRAINT cecy_institutions_state_id_foreign;
       cecy          postgres    false    307    217    3281            �           2606    131948 *   courses courses_academic_period_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.courses
    ADD CONSTRAINT courses_academic_period_id_foreign FOREIGN KEY (academic_period_id) REFERENCES cecy.catalogues(id);
 R   ALTER TABLE ONLY cecy.courses DROP CONSTRAINT courses_academic_period_id_foreign;
       cecy          postgres    false    305    3385    317            �           2606    131923    courses courses_area_id_foreign    FK CONSTRAINT        ALTER TABLE ONLY cecy.courses
    ADD CONSTRAINT courses_area_id_foreign FOREIGN KEY (area_id) REFERENCES cecy.catalogues(id);
 G   ALTER TABLE ONLY cecy.courses DROP CONSTRAINT courses_area_id_foreign;
       cecy          postgres    false    305    317    3385            �           2606    131938 &   courses courses_course_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.courses
    ADD CONSTRAINT courses_course_type_id_foreign FOREIGN KEY (course_type_id) REFERENCES cecy.catalogues(id);
 N   ALTER TABLE ONLY cecy.courses DROP CONSTRAINT courses_course_type_id_foreign;
       cecy          postgres    false    3385    305    317            �           2606    131928     courses courses_level_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.courses
    ADD CONSTRAINT courses_level_id_foreign FOREIGN KEY (level_id) REFERENCES cecy.catalogues(id);
 H   ALTER TABLE ONLY cecy.courses DROP CONSTRAINT courses_level_id_foreign;
       cecy          postgres    false    3385    305    317            �           2606    131908 #   courses courses_modality_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.courses
    ADD CONSTRAINT courses_modality_id_foreign FOREIGN KEY (modality_id) REFERENCES cecy.catalogues(id);
 K   ALTER TABLE ONLY cecy.courses DROP CONSTRAINT courses_modality_id_foreign;
       cecy          postgres    false    305    317    3385            �           2606    131918 +   courses courses_participant_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.courses
    ADD CONSTRAINT courses_participant_type_id_foreign FOREIGN KEY (participant_type_id) REFERENCES cecy.catalogues(id);
 S   ALTER TABLE ONLY cecy.courses DROP CONSTRAINT courses_participant_type_id_foreign;
       cecy          postgres    false    305    317    3385            �           2606    131933 $   courses courses_schedules_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.courses
    ADD CONSTRAINT courses_schedules_id_foreign FOREIGN KEY (schedules_id) REFERENCES cecy.catalogues(id);
 L   ALTER TABLE ONLY cecy.courses DROP CONSTRAINT courses_schedules_id_foreign;
       cecy          postgres    false    317    3385    305            �           2606    131943 $   courses courses_specialty_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.courses
    ADD CONSTRAINT courses_specialty_id_foreign FOREIGN KEY (specialty_id) REFERENCES cecy.catalogues(id);
 L   ALTER TABLE ONLY cecy.courses DROP CONSTRAINT courses_specialty_id_foreign;
       cecy          postgres    false    3385    317    305            �           2606    131913     courses courses_state_id_foreign    FK CONSTRAINT     ~   ALTER TABLE ONLY cecy.courses
    ADD CONSTRAINT courses_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 H   ALTER TABLE ONLY cecy.courses DROP CONSTRAINT courses_state_id_foreign;
       cecy          postgres    false    217    317    3281                       2606    132211 1   department_data department_data_canton_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.department_data
    ADD CONSTRAINT department_data_canton_id_foreign FOREIGN KEY (canton_id) REFERENCES cecy.locations(id);
 Y   ALTER TABLE ONLY cecy.department_data DROP CONSTRAINT department_data_canton_id_foreign;
       cecy          postgres    false    3422    339    337                       2606    132196 1   department_data department_data_charge_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.department_data
    ADD CONSTRAINT department_data_charge_id_foreign FOREIGN KEY (charge_id) REFERENCES cecy.instructors(id);
 Y   ALTER TABLE ONLY cecy.department_data DROP CONSTRAINT department_data_charge_id_foreign;
       cecy          postgres    false    3397    313    339                       2606    132206 3   department_data department_data_schedule_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.department_data
    ADD CONSTRAINT department_data_schedule_id_foreign FOREIGN KEY (schedule_id) REFERENCES cecy.catalogues(id);
 [   ALTER TABLE ONLY cecy.department_data DROP CONSTRAINT department_data_schedule_id_foreign;
       cecy          postgres    false    339    3385    305                       2606    132201 0   department_data department_data_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.department_data
    ADD CONSTRAINT department_data_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 X   ALTER TABLE ONLY cecy.department_data DROP CONSTRAINT department_data_state_id_foreign;
       cecy          postgres    false    339    3281    217            
           2606    132098 A   detail_registrations detail_registrations_registration_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.detail_registrations
    ADD CONSTRAINT detail_registrations_registration_id_foreign FOREIGN KEY (registration_id) REFERENCES cecy.registrations(id);
 i   ALTER TABLE ONLY cecy.detail_registrations DROP CONSTRAINT detail_registrations_registration_id_foreign;
       cecy          postgres    false    3412    327    329                       2606    132103 :   detail_registrations detail_registrations_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.detail_registrations
    ADD CONSTRAINT detail_registrations_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 b   ALTER TABLE ONLY cecy.detail_registrations DROP CONSTRAINT detail_registrations_state_id_foreign;
       cecy          postgres    false    3281    217    329                       2606    132113 G   detail_registrations detail_registrations_status_certificate_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.detail_registrations
    ADD CONSTRAINT detail_registrations_status_certificate_id_foreign FOREIGN KEY (status_certificate_id) REFERENCES cecy.catalogues(id);
 o   ALTER TABLE ONLY cecy.detail_registrations DROP CONSTRAINT detail_registrations_status_certificate_id_foreign;
       cecy          postgres    false    329    305    3385                       2606    132108 ;   detail_registrations detail_registrations_status_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.detail_registrations
    ADD CONSTRAINT detail_registrations_status_id_foreign FOREIGN KEY (status_id) REFERENCES cecy.catalogues(id);
 c   ALTER TABLE ONLY cecy.detail_registrations DROP CONSTRAINT detail_registrations_status_id_foreign;
       cecy          postgres    false    3385    305    329            �           2606    131836 <   evaluation_mechanisms evaluation_mechanisms_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.evaluation_mechanisms
    ADD CONSTRAINT evaluation_mechanisms_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 d   ALTER TABLE ONLY cecy.evaluation_mechanisms DROP CONSTRAINT evaluation_mechanisms_state_id_foreign;
       cecy          postgres    false    311    217    3281            �           2606    131841 =   evaluation_mechanisms evaluation_mechanisms_status_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.evaluation_mechanisms
    ADD CONSTRAINT evaluation_mechanisms_status_id_foreign FOREIGN KEY (status_id) REFERENCES cecy.catalogues(id);
 e   ALTER TABLE ONLY cecy.evaluation_mechanisms DROP CONSTRAINT evaluation_mechanisms_status_id_foreign;
       cecy          postgres    false    3385    305    311            �           2606    131846 ;   evaluation_mechanisms evaluation_mechanisms_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.evaluation_mechanisms
    ADD CONSTRAINT evaluation_mechanisms_type_id_foreign FOREIGN KEY (type_id) REFERENCES cecy.catalogues(id);
 c   ALTER TABLE ONLY cecy.evaluation_mechanisms DROP CONSTRAINT evaluation_mechanisms_type_id_foreign;
       cecy          postgres    false    3385    311    305            �           2606    131859 (   instructors instructors_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.instructors
    ADD CONSTRAINT instructors_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 P   ALTER TABLE ONLY cecy.instructors DROP CONSTRAINT instructors_state_id_foreign;
       cecy          postgres    false    3281    313    217            �           2606    131864 '   instructors instructors_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.instructors
    ADD CONSTRAINT instructors_user_id_foreign FOREIGN KEY (user_id) REFERENCES authentication.users(id);
 O   ALTER TABLE ONLY cecy.instructors DROP CONSTRAINT instructors_user_id_foreign;
       cecy          postgres    false    3303    313    233                       2606    132183 $   locations locations_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.locations
    ADD CONSTRAINT locations_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 L   ALTER TABLE ONLY cecy.locations DROP CONSTRAINT locations_state_id_foreign;
       cecy          postgres    false    3281    337    217            .           2606    132394 0   participants participants_person_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.participants
    ADD CONSTRAINT participants_person_type_id_foreign FOREIGN KEY (person_type_id) REFERENCES cecy.catalogues(id);
 X   ALTER TABLE ONLY cecy.participants DROP CONSTRAINT participants_person_type_id_foreign;
       cecy          postgres    false    305    355    3385            /           2606    132399 *   participants participants_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.participants
    ADD CONSTRAINT participants_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 R   ALTER TABLE ONLY cecy.participants DROP CONSTRAINT participants_state_id_foreign;
       cecy          postgres    false    217    3281    355            -           2606    132389 )   participants participants_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.participants
    ADD CONSTRAINT participants_user_id_foreign FOREIGN KEY (user_id) REFERENCES cecy.instructors(id);
 Q   ALTER TABLE ONLY cecy.participants DROP CONSTRAINT participants_user_id_foreign;
       cecy          postgres    false    3397    313    355            1           2606    132417 K   person_prerequisites_courses person_prerequisites_courses_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.person_prerequisites_courses
    ADD CONSTRAINT person_prerequisites_courses_course_id_foreign FOREIGN KEY (course_id) REFERENCES cecy.courses(id);
 s   ALTER TABLE ONLY cecy.person_prerequisites_courses DROP CONSTRAINT person_prerequisites_courses_course_id_foreign;
       cecy          postgres    false    357    317    3401            0           2606    132412 P   person_prerequisites_courses person_prerequisites_courses_participant_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.person_prerequisites_courses
    ADD CONSTRAINT person_prerequisites_courses_participant_id_foreign FOREIGN KEY (participant_id) REFERENCES cecy.instructors(id);
 x   ALTER TABLE ONLY cecy.person_prerequisites_courses DROP CONSTRAINT person_prerequisites_courses_participant_id_foreign;
       cecy          postgres    false    3397    357    313            2           2606    132422 J   person_prerequisites_courses person_prerequisites_courses_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.person_prerequisites_courses
    ADD CONSTRAINT person_prerequisites_courses_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 r   ALTER TABLE ONLY cecy.person_prerequisites_courses DROP CONSTRAINT person_prerequisites_courses_state_id_foreign;
       cecy          postgres    false    357    217    3281            ,           2606    132376 R   planification_instructors planification_instructors_detail_registration_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.planification_instructors
    ADD CONSTRAINT planification_instructors_detail_registration_id_foreign FOREIGN KEY (detail_registration_id) REFERENCES cecy.detail_registrations(id);
 z   ALTER TABLE ONLY cecy.planification_instructors DROP CONSTRAINT planification_instructors_detail_registration_id_foreign;
       cecy          postgres    false    329    3414    353            *           2606    132366 I   planification_instructors planification_instructors_instructor_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.planification_instructors
    ADD CONSTRAINT planification_instructors_instructor_id_foreign FOREIGN KEY (instructor_id) REFERENCES cecy.instructors(id);
 q   ALTER TABLE ONLY cecy.planification_instructors DROP CONSTRAINT planification_instructors_instructor_id_foreign;
       cecy          postgres    false    353    3397    313            +           2606    132371 L   planification_instructors planification_instructors_planification_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.planification_instructors
    ADD CONSTRAINT planification_instructors_planification_id_foreign FOREIGN KEY (planification_id) REFERENCES cecy.planifications(id);
 t   ALTER TABLE ONLY cecy.planification_instructors DROP CONSTRAINT planification_instructors_planification_id_foreign;
       cecy          postgres    false    3403    319    353            )           2606    132361 D   planification_instructors planification_instructors_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.planification_instructors
    ADD CONSTRAINT planification_instructors_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 l   ALTER TABLE ONLY cecy.planification_instructors DROP CONSTRAINT planification_instructors_state_id_foreign;
       cecy          postgres    false    353    3281    217            �           2606    131984 0   planifications planifications_conference_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.planifications
    ADD CONSTRAINT planifications_conference_foreign FOREIGN KEY (conference) REFERENCES cecy.catalogues(id);
 X   ALTER TABLE ONLY cecy.planifications DROP CONSTRAINT planifications_conference_foreign;
       cecy          postgres    false    305    319    3385            �           2606    131964 /   planifications planifications_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.planifications
    ADD CONSTRAINT planifications_course_id_foreign FOREIGN KEY (course_id) REFERENCES cecy.courses(id);
 W   ALTER TABLE ONLY cecy.planifications DROP CONSTRAINT planifications_course_id_foreign;
       cecy          postgres    false    319    317    3401            �           2606    131969 3   planifications planifications_instructor_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.planifications
    ADD CONSTRAINT planifications_instructor_id_foreign FOREIGN KEY (instructor_id) REFERENCES cecy.instructors(id);
 [   ALTER TABLE ONLY cecy.planifications DROP CONSTRAINT planifications_instructor_id_foreign;
       cecy          postgres    false    3397    319    313            �           2606    131989 .   planifications planifications_parallel_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.planifications
    ADD CONSTRAINT planifications_parallel_foreign FOREIGN KEY (parallel) REFERENCES cecy.catalogues(id);
 V   ALTER TABLE ONLY cecy.planifications DROP CONSTRAINT planifications_parallel_foreign;
       cecy          postgres    false    305    3385    319            �           2606    131979 6   planifications planifications_school_period_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.planifications
    ADD CONSTRAINT planifications_school_period_id_foreign FOREIGN KEY (school_period_id) REFERENCES cecy.school_periods(id);
 ^   ALTER TABLE ONLY cecy.planifications DROP CONSTRAINT planifications_school_period_id_foreign;
       cecy          postgres    false    319    3393    309            �           2606    131974 .   planifications planifications_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.planifications
    ADD CONSTRAINT planifications_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 V   ALTER TABLE ONLY cecy.planifications DROP CONSTRAINT planifications_state_id_foreign;
       cecy          postgres    false    319    217    3281            �           2606    132002 -   prerequisites prerequisites_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.prerequisites
    ADD CONSTRAINT prerequisites_course_id_foreign FOREIGN KEY (course_id) REFERENCES cecy.courses(id);
 U   ALTER TABLE ONLY cecy.prerequisites DROP CONSTRAINT prerequisites_course_id_foreign;
       cecy          postgres    false    321    3401    317                        2606    132012 2   prerequisites prerequisites_parent_code_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.prerequisites
    ADD CONSTRAINT prerequisites_parent_code_id_foreign FOREIGN KEY (parent_code_id) REFERENCES cecy.prerequisites(id);
 Z   ALTER TABLE ONLY cecy.prerequisites DROP CONSTRAINT prerequisites_parent_code_id_foreign;
       cecy          postgres    false    3405    321    321            �           2606    132007 ,   prerequisites prerequisites_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.prerequisites
    ADD CONSTRAINT prerequisites_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 T   ALTER TABLE ONLY cecy.prerequisites DROP CONSTRAINT prerequisites_state_id_foreign;
       cecy          postgres    false    3281    217    321            '           2606    132343 G   profile_instructor_courses profile_instructor_courses_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.profile_instructor_courses
    ADD CONSTRAINT profile_instructor_courses_course_id_foreign FOREIGN KEY (course_id) REFERENCES cecy.courses(id);
 o   ALTER TABLE ONLY cecy.profile_instructor_courses DROP CONSTRAINT profile_instructor_courses_course_id_foreign;
       cecy          postgres    false    317    3401    351            (           2606    132348 F   profile_instructor_courses profile_instructor_courses_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.profile_instructor_courses
    ADD CONSTRAINT profile_instructor_courses_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 n   ALTER TABLE ONLY cecy.profile_instructor_courses DROP CONSTRAINT profile_instructor_courses_state_id_foreign;
       cecy          postgres    false    3281    351    217                       2606    132067 2   registrations registrations_participant_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.registrations
    ADD CONSTRAINT registrations_participant_id_foreign FOREIGN KEY (participant_id) REFERENCES cecy.instructors(id);
 Z   ALTER TABLE ONLY cecy.registrations DROP CONSTRAINT registrations_participant_id_foreign;
       cecy          postgres    false    327    3397    313            	           2606    132082 4   registrations registrations_planification_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.registrations
    ADD CONSTRAINT registrations_planification_id_foreign FOREIGN KEY (planification_id) REFERENCES cecy.planifications(id);
 \   ALTER TABLE ONLY cecy.registrations DROP CONSTRAINT registrations_planification_id_foreign;
       cecy          postgres    false    327    3403    319                       2606    132072 ,   registrations registrations_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.registrations
    ADD CONSTRAINT registrations_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 T   ALTER TABLE ONLY cecy.registrations DROP CONSTRAINT registrations_state_id_foreign;
       cecy          postgres    false    3281    217    327                       2606    132077 +   registrations registrations_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.registrations
    ADD CONSTRAINT registrations_type_id_foreign FOREIGN KEY (type_id) REFERENCES cecy.catalogues(id);
 S   ALTER TABLE ONLY cecy.registrations DROP CONSTRAINT registrations_type_id_foreign;
       cecy          postgres    false    327    305    3385                       2606    132224 +   requirements requirements_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.requirements
    ADD CONSTRAINT requirements_course_id_foreign FOREIGN KEY (course_id) REFERENCES cecy.courses(id);
 S   ALTER TABLE ONLY cecy.requirements DROP CONSTRAINT requirements_course_id_foreign;
       cecy          postgres    false    3401    341    317                       2606    132234 5   requirements requirements_requirement_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.requirements
    ADD CONSTRAINT requirements_requirement_type_id_foreign FOREIGN KEY (requirement_type_id) REFERENCES cecy.catalogues(id);
 ]   ALTER TABLE ONLY cecy.requirements DROP CONSTRAINT requirements_requirement_type_id_foreign;
       cecy          postgres    false    305    341    3385                       2606    132229 *   requirements requirements_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.requirements
    ADD CONSTRAINT requirements_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 R   ALTER TABLE ONLY cecy.requirements DROP CONSTRAINT requirements_state_id_foreign;
       cecy          postgres    false    341    217    3281                       2606    132053 0   scheduleables scheduleables_classroom_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.scheduleables
    ADD CONSTRAINT scheduleables_classroom_id_foreign FOREIGN KEY (classroom_id) REFERENCES ignug.classrooms(id);
 X   ALTER TABLE ONLY cecy.scheduleables DROP CONSTRAINT scheduleables_classroom_id_foreign;
       cecy          postgres    false    225    3291    325                       2606    132048 /   scheduleables scheduleables_schedule_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.scheduleables
    ADD CONSTRAINT scheduleables_schedule_id_foreign FOREIGN KEY (schedule_id) REFERENCES cecy.schedules(id);
 W   ALTER TABLE ONLY cecy.scheduleables DROP CONSTRAINT scheduleables_schedule_id_foreign;
       cecy          postgres    false    323    325    3407                       2606    132043 ,   scheduleables scheduleables_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.scheduleables
    ADD CONSTRAINT scheduleables_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 T   ALTER TABLE ONLY cecy.scheduleables DROP CONSTRAINT scheduleables_state_id_foreign;
       cecy          postgres    false    3281    325    217                       2606    132030 "   schedules schedules_day_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.schedules
    ADD CONSTRAINT schedules_day_id_foreign FOREIGN KEY (day_id) REFERENCES cecy.catalogues(id);
 J   ALTER TABLE ONLY cecy.schedules DROP CONSTRAINT schedules_day_id_foreign;
       cecy          postgres    false    305    3385    323                       2606    132025 $   schedules schedules_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.schedules
    ADD CONSTRAINT schedules_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 L   ALTER TABLE ONLY cecy.schedules DROP CONSTRAINT schedules_state_id_foreign;
       cecy          postgres    false    323    217    3281            �           2606    131819 .   school_periods school_periods_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.school_periods
    ADD CONSTRAINT school_periods_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 V   ALTER TABLE ONLY cecy.school_periods DROP CONSTRAINT school_periods_state_id_foreign;
       cecy          postgres    false    217    3281    309            !           2606    132294 -   target_groups target_groups_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.target_groups
    ADD CONSTRAINT target_groups_course_id_foreign FOREIGN KEY (course_id) REFERENCES cecy.courses(id);
 U   ALTER TABLE ONLY cecy.target_groups DROP CONSTRAINT target_groups_course_id_foreign;
       cecy          postgres    false    317    347    3401                        2606    132289 1   target_groups target_groups_population_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.target_groups
    ADD CONSTRAINT target_groups_population_id_foreign FOREIGN KEY (population_id) REFERENCES cecy.catalogues(id);
 Y   ALTER TABLE ONLY cecy.target_groups DROP CONSTRAINT target_groups_population_id_foreign;
       cecy          postgres    false    3385    305    347            "           2606    132299 ,   target_groups target_groups_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.target_groups
    ADD CONSTRAINT target_groups_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 T   ALTER TABLE ONLY cecy.target_groups DROP CONSTRAINT target_groups_state_id_foreign;
       cecy          postgres    false    347    217    3281            %           2606    132325    topics topics_course_id_foreign    FK CONSTRAINT     ~   ALTER TABLE ONLY cecy.topics
    ADD CONSTRAINT topics_course_id_foreign FOREIGN KEY (course_id) REFERENCES cecy.courses(id);
 G   ALTER TABLE ONLY cecy.topics DROP CONSTRAINT topics_course_id_foreign;
       cecy          postgres    false    3401    317    349            #           2606    132315 $   topics topics_parent_code_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.topics
    ADD CONSTRAINT topics_parent_code_id_foreign FOREIGN KEY (parent_code_id) REFERENCES cecy.topics(id);
 L   ALTER TABLE ONLY cecy.topics DROP CONSTRAINT topics_parent_code_id_foreign;
       cecy          postgres    false    349    349    3434            $           2606    132320    topics topics_state_id_foreign    FK CONSTRAINT     |   ALTER TABLE ONLY cecy.topics
    ADD CONSTRAINT topics_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 F   ALTER TABLE ONLY cecy.topics DROP CONSTRAINT topics_state_id_foreign;
       cecy          postgres    false    349    3281    217            &           2606    132330    topics topics_type_id_foreign    FK CONSTRAINT     }   ALTER TABLE ONLY cecy.topics
    ADD CONSTRAINT topics_type_id_foreign FOREIGN KEY (type_id) REFERENCES cecy.catalogues(id);
 E   ALTER TABLE ONLY cecy.topics DROP CONSTRAINT topics_type_id_foreign;
       cecy          postgres    false    3385    305    349                       2606    132250 ?   working_informations working_informations_instructor_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.working_informations
    ADD CONSTRAINT working_informations_instructor_id_foreign FOREIGN KEY (instructor_id) REFERENCES cecy.instructors(id);
 g   ALTER TABLE ONLY cecy.working_informations DROP CONSTRAINT working_informations_instructor_id_foreign;
       cecy          postgres    false    313    343    3397                       2606    132255 :   working_informations working_informations_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY cecy.working_informations
    ADD CONSTRAINT working_informations_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 b   ALTER TABLE ONLY cecy.working_informations DROP CONSTRAINT working_informations_state_id_foreign;
       cecy          postgres    false    217    3281    343            �           2606    131082 )   authorities authorities_career_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.authorities
    ADD CONSTRAINT authorities_career_id_foreign FOREIGN KEY (career_id) REFERENCES ignug.careers(id);
 R   ALTER TABLE ONLY ignug.authorities DROP CONSTRAINT authorities_career_id_foreign;
       ignug          postgres    false    245    235    3305            �           2606    131087 (   authorities authorities_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.authorities
    ADD CONSTRAINT authorities_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 Q   ALTER TABLE ONLY ignug.authorities DROP CONSTRAINT authorities_state_id_foreign;
       ignug          postgres    false    217    245    3281            �           2606    131077 )   authorities authorities_status_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.authorities
    ADD CONSTRAINT authorities_status_id_foreign FOREIGN KEY (status_id) REFERENCES ignug.catalogues(id);
 R   ALTER TABLE ONLY ignug.authorities DROP CONSTRAINT authorities_status_id_foreign;
       ignug          postgres    false    3289    223    245            �           2606    131072 '   authorities authorities_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.authorities
    ADD CONSTRAINT authorities_type_id_foreign FOREIGN KEY (type_id) REFERENCES ignug.catalogues(id);
 P   ALTER TABLE ONLY ignug.authorities DROP CONSTRAINT authorities_type_id_foreign;
       ignug          postgres    false    3289    245    223            �           2606    131067 '   authorities authorities_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.authorities
    ADD CONSTRAINT authorities_user_id_foreign FOREIGN KEY (user_id) REFERENCES authentication.users(id);
 P   ALTER TABLE ONLY ignug.authorities DROP CONSTRAINT authorities_user_id_foreign;
       ignug          postgres    false    245    233    3303            �           2606    131100 )   careerables careerables_career_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.careerables
    ADD CONSTRAINT careerables_career_id_foreign FOREIGN KEY (career_id) REFERENCES ignug.careers(id);
 R   ALTER TABLE ONLY ignug.careerables DROP CONSTRAINT careerables_career_id_foreign;
       ignug          postgres    false    3305    235    247            �           2606    130952 &   careers careers_institution_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.careers
    ADD CONSTRAINT careers_institution_id_foreign FOREIGN KEY (institution_id) REFERENCES ignug.institutions(id);
 O   ALTER TABLE ONLY ignug.careers DROP CONSTRAINT careers_institution_id_foreign;
       ignug          postgres    false    235    227    3293            �           2606    130957 #   careers careers_modality_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.careers
    ADD CONSTRAINT careers_modality_id_foreign FOREIGN KEY (modality_id) REFERENCES ignug.catalogues(id);
 L   ALTER TABLE ONLY ignug.careers DROP CONSTRAINT careers_modality_id_foreign;
       ignug          postgres    false    235    223    3289            �           2606    130967     careers careers_state_id_foreign    FK CONSTRAINT        ALTER TABLE ONLY ignug.careers
    ADD CONSTRAINT careers_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 I   ALTER TABLE ONLY ignug.careers DROP CONSTRAINT careers_state_id_foreign;
       ignug          postgres    false    235    3281    217            �           2606    130962    careers careers_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.careers
    ADD CONSTRAINT careers_type_id_foreign FOREIGN KEY (type_id) REFERENCES ignug.catalogues(id);
 H   ALTER TABLE ONLY ignug.careers DROP CONSTRAINT careers_type_id_foreign;
       ignug          postgres    false    223    235    3289            u           2606    130804 ,   catalogues catalogues_parent_code_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.catalogues
    ADD CONSTRAINT catalogues_parent_code_id_foreign FOREIGN KEY (parent_code_id) REFERENCES ignug.catalogues(id);
 U   ALTER TABLE ONLY ignug.catalogues DROP CONSTRAINT catalogues_parent_code_id_foreign;
       ignug          postgres    false    3289    223    223            v           2606    130809 &   catalogues catalogues_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.catalogues
    ADD CONSTRAINT catalogues_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 O   ALTER TABLE ONLY ignug.catalogues DROP CONSTRAINT catalogues_state_id_foreign;
       ignug          postgres    false    3281    223    217            x           2606    130830 &   classrooms classrooms_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.classrooms
    ADD CONSTRAINT classrooms_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 O   ALTER TABLE ONLY ignug.classrooms DROP CONSTRAINT classrooms_state_id_foreign;
       ignug          postgres    false    3281    225    217            w           2606    130825 %   classrooms classrooms_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.classrooms
    ADD CONSTRAINT classrooms_type_id_foreign FOREIGN KEY (type_id) REFERENCES ignug.catalogues(id);
 N   ALTER TABLE ONLY ignug.classrooms DROP CONSTRAINT classrooms_type_id_foreign;
       ignug          postgres    false    225    223    3289            �           2606    131137    files files_state_id_foreign    FK CONSTRAINT     {   ALTER TABLE ONLY ignug.files
    ADD CONSTRAINT files_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 E   ALTER TABLE ONLY ignug.files DROP CONSTRAINT files_state_id_foreign;
       ignug          postgres    false    251    3281    217            �           2606    131154    images images_state_id_foreign    FK CONSTRAINT     }   ALTER TABLE ONLY ignug.images
    ADD CONSTRAINT images_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 G   ALTER TABLE ONLY ignug.images DROP CONSTRAINT images_state_id_foreign;
       ignug          postgres    false    217    253    3281            y           2606    130846 *   institutions institutions_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.institutions
    ADD CONSTRAINT institutions_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 S   ALTER TABLE ONLY ignug.institutions DROP CONSTRAINT institutions_state_id_foreign;
       ignug          postgres    false    227    3281    217            z           2606    130862 *   locations locations_parent_code_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.locations
    ADD CONSTRAINT locations_parent_code_id_foreign FOREIGN KEY (parent_code_id) REFERENCES ignug.locations(id);
 S   ALTER TABLE ONLY ignug.locations DROP CONSTRAINT locations_parent_code_id_foreign;
       ignug          postgres    false    229    3295    229            {           2606    130867 $   locations locations_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.locations
    ADD CONSTRAINT locations_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 M   ALTER TABLE ONLY ignug.locations DROP CONSTRAINT locations_state_id_foreign;
       ignug          postgres    false    217    3281    229            �           2606    131001 .   school_periods school_periods_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.school_periods
    ADD CONSTRAINT school_periods_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 W   ALTER TABLE ONLY ignug.school_periods DROP CONSTRAINT school_periods_state_id_foreign;
       ignug          postgres    false    217    239    3281            �           2606    131028 (   students students_school_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.students
    ADD CONSTRAINT students_school_type_id_foreign FOREIGN KEY (school_type_id) REFERENCES ignug.catalogues(id);
 Q   ALTER TABLE ONLY ignug.students DROP CONSTRAINT students_school_type_id_foreign;
       ignug          postgres    false    223    3289    241            �           2606    131033 "   students students_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.students
    ADD CONSTRAINT students_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 K   ALTER TABLE ONLY ignug.students DROP CONSTRAINT students_state_id_foreign;
       ignug          postgres    false    241    217    3281            �           2606    131023 !   students students_town_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.students
    ADD CONSTRAINT students_town_id_foreign FOREIGN KEY (town_id) REFERENCES ignug.locations(id);
 J   ALTER TABLE ONLY ignug.students DROP CONSTRAINT students_town_id_foreign;
       ignug          postgres    false    229    241    3295            �           2606    131018 !   students students_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.students
    ADD CONSTRAINT students_user_id_foreign FOREIGN KEY (user_id) REFERENCES authentication.users(id);
 J   ALTER TABLE ONLY ignug.students DROP CONSTRAINT students_user_id_foreign;
       ignug          postgres    false    3303    233    241            �           2606    131051 "   teachers teachers_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.teachers
    ADD CONSTRAINT teachers_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 K   ALTER TABLE ONLY ignug.teachers DROP CONSTRAINT teachers_state_id_foreign;
       ignug          postgres    false    3281    217    243            �           2606    131046 !   teachers teachers_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY ignug.teachers
    ADD CONSTRAINT teachers_user_id_foreign FOREIGN KEY (user_id) REFERENCES authentication.users(id);
 J   ALTER TABLE ONLY ignug.teachers DROP CONSTRAINT teachers_user_id_foreign;
       ignug          postgres    false    3303    233    243            �           2606    131551 '   abilities abilities_category_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.abilities
    ADD CONSTRAINT abilities_category_id_foreign FOREIGN KEY (category_id) REFERENCES job_board.catalogues(id);
 T   ALTER TABLE ONLY job_board.abilities DROP CONSTRAINT abilities_category_id_foreign;
    	   job_board          postgres    false    287    3355    275            �           2606    131546 +   abilities abilities_professional_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.abilities
    ADD CONSTRAINT abilities_professional_id_foreign FOREIGN KEY (professional_id) REFERENCES job_board.professionals(id);
 X   ALTER TABLE ONLY job_board.abilities DROP CONSTRAINT abilities_professional_id_foreign;
    	   job_board          postgres    false    3357    287    277            �           2606    131556 $   abilities abilities_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.abilities
    ADD CONSTRAINT abilities_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 Q   ALTER TABLE ONLY job_board.abilities DROP CONSTRAINT abilities_state_id_foreign;
    	   job_board          postgres    false    287    217    3281            �           2606    131575 ;   academic_formations academic_formations_category_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.academic_formations
    ADD CONSTRAINT academic_formations_category_id_foreign FOREIGN KEY (category_id) REFERENCES job_board.categories(id);
 h   ALTER TABLE ONLY job_board.academic_formations DROP CONSTRAINT academic_formations_category_id_foreign;
    	   job_board          postgres    false    3359    279    289            �           2606    131580 F   academic_formations academic_formations_professional_degree_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.academic_formations
    ADD CONSTRAINT academic_formations_professional_degree_id_foreign FOREIGN KEY (professional_degree_id) REFERENCES job_board.catalogues(id);
 s   ALTER TABLE ONLY job_board.academic_formations DROP CONSTRAINT academic_formations_professional_degree_id_foreign;
    	   job_board          postgres    false    289    275    3355            �           2606    131570 ?   academic_formations academic_formations_professional_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.academic_formations
    ADD CONSTRAINT academic_formations_professional_id_foreign FOREIGN KEY (professional_id) REFERENCES job_board.professionals(id);
 l   ALTER TABLE ONLY job_board.academic_formations DROP CONSTRAINT academic_formations_professional_id_foreign;
    	   job_board          postgres    false    277    3357    289            �           2606    131585 8   academic_formations academic_formations_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.academic_formations
    ADD CONSTRAINT academic_formations_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 e   ALTER TABLE ONLY job_board.academic_formations DROP CONSTRAINT academic_formations_state_id_foreign;
    	   job_board          postgres    false    289    217    3281            �           2606    131408 ,   catalogues catalogues_parent_code_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.catalogues
    ADD CONSTRAINT catalogues_parent_code_id_foreign FOREIGN KEY (parent_code_id) REFERENCES job_board.catalogues(id);
 Y   ALTER TABLE ONLY job_board.catalogues DROP CONSTRAINT catalogues_parent_code_id_foreign;
    	   job_board          postgres    false    275    3355    275            �           2606    131413 &   catalogues catalogues_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.catalogues
    ADD CONSTRAINT catalogues_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 S   ALTER TABLE ONLY job_board.catalogues DROP CONSTRAINT catalogues_state_id_foreign;
    	   job_board          postgres    false    217    275    3281            �           2606    131450 ,   categories categories_parent_code_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.categories
    ADD CONSTRAINT categories_parent_code_id_foreign FOREIGN KEY (parent_code_id) REFERENCES job_board.categories(id);
 Y   ALTER TABLE ONLY job_board.categories DROP CONSTRAINT categories_parent_code_id_foreign;
    	   job_board          postgres    false    3359    279    279            �           2606    131455 &   categories categories_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.categories
    ADD CONSTRAINT categories_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 S   ALTER TABLE ONLY job_board.categories DROP CONSTRAINT categories_state_id_foreign;
    	   job_board          postgres    false    217    279    3281            �           2606    131710 1   category_offer category_offer_category_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.category_offer
    ADD CONSTRAINT category_offer_category_id_foreign FOREIGN KEY (category_id) REFERENCES job_board.categories(id);
 ^   ALTER TABLE ONLY job_board.category_offer DROP CONSTRAINT category_offer_category_id_foreign;
    	   job_board          postgres    false    299    3359    279            �           2606    131715 .   category_offer category_offer_offer_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.category_offer
    ADD CONSTRAINT category_offer_offer_id_foreign FOREIGN KEY (offer_id) REFERENCES job_board.offers(id);
 [   ALTER TABLE ONLY job_board.category_offer DROP CONSTRAINT category_offer_offer_id_foreign;
    	   job_board          postgres    false    299    3365    285            �           2606    131481 $   companies companies_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.companies
    ADD CONSTRAINT companies_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 Q   ALTER TABLE ONLY job_board.companies DROP CONSTRAINT companies_state_id_foreign;
    	   job_board          postgres    false    281    3281    217            �           2606    131476 #   companies companies_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.companies
    ADD CONSTRAINT companies_type_id_foreign FOREIGN KEY (type_id) REFERENCES job_board.catalogues(id);
 P   ALTER TABLE ONLY job_board.companies DROP CONSTRAINT companies_type_id_foreign;
    	   job_board          postgres    false    281    275    3355            �           2606    131471 #   companies companies_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.companies
    ADD CONSTRAINT companies_user_id_foreign FOREIGN KEY (user_id) REFERENCES authentication.users(id);
 P   ALTER TABLE ONLY job_board.companies DROP CONSTRAINT companies_user_id_foreign;
    	   job_board          postgres    false    281    233    3303            �           2606    131728 <   company_professional company_professional_company_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.company_professional
    ADD CONSTRAINT company_professional_company_id_foreign FOREIGN KEY (company_id) REFERENCES job_board.companies(id);
 i   ALTER TABLE ONLY job_board.company_professional DROP CONSTRAINT company_professional_company_id_foreign;
    	   job_board          postgres    false    281    3361    301            �           2606    131733 A   company_professional company_professional_professional_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.company_professional
    ADD CONSTRAINT company_professional_professional_id_foreign FOREIGN KEY (professional_id) REFERENCES job_board.professionals(id);
 n   ALTER TABLE ONLY job_board.company_professional DROP CONSTRAINT company_professional_professional_id_foreign;
    	   job_board          postgres    false    277    3357    301            �           2606    131738 ;   company_professional company_professional_status_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.company_professional
    ADD CONSTRAINT company_professional_status_id_foreign FOREIGN KEY (status_id) REFERENCES job_board.catalogues(id);
 h   ALTER TABLE ONLY job_board.company_professional DROP CONSTRAINT company_professional_status_id_foreign;
    	   job_board          postgres    false    301    3355    275            �           2606    131606 %   courses courses_event_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.courses
    ADD CONSTRAINT courses_event_type_id_foreign FOREIGN KEY (event_type_id) REFERENCES job_board.catalogues(id);
 R   ALTER TABLE ONLY job_board.courses DROP CONSTRAINT courses_event_type_id_foreign;
    	   job_board          postgres    false    3355    291    275            �           2606    131611 &   courses courses_institution_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.courses
    ADD CONSTRAINT courses_institution_id_foreign FOREIGN KEY (institution_id) REFERENCES job_board.catalogues(id);
 S   ALTER TABLE ONLY job_board.courses DROP CONSTRAINT courses_institution_id_foreign;
    	   job_board          postgres    false    275    3355    291            �           2606    131601 '   courses courses_professional_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.courses
    ADD CONSTRAINT courses_professional_id_foreign FOREIGN KEY (professional_id) REFERENCES job_board.professionals(id);
 T   ALTER TABLE ONLY job_board.courses DROP CONSTRAINT courses_professional_id_foreign;
    	   job_board          postgres    false    277    3357    291            �           2606    131621     courses courses_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.courses
    ADD CONSTRAINT courses_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 M   ALTER TABLE ONLY job_board.courses DROP CONSTRAINT courses_state_id_foreign;
    	   job_board          postgres    false    3281    291    217            �           2606    131616 -   courses courses_type_certification_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.courses
    ADD CONSTRAINT courses_type_certification_id_foreign FOREIGN KEY (type_certification_id) REFERENCES job_board.catalogues(id);
 Z   ALTER TABLE ONLY job_board.courses DROP CONSTRAINT courses_type_certification_id_foreign;
    	   job_board          postgres    false    3355    291    275            �           2606    131634 +   languages languages_professional_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.languages
    ADD CONSTRAINT languages_professional_id_foreign FOREIGN KEY (professional_id) REFERENCES job_board.professionals(id);
 X   ALTER TABLE ONLY job_board.languages DROP CONSTRAINT languages_professional_id_foreign;
    	   job_board          postgres    false    3357    293    277            �           2606    131649 ,   languages languages_reading_level_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.languages
    ADD CONSTRAINT languages_reading_level_id_foreign FOREIGN KEY (reading_level_id) REFERENCES job_board.catalogues(id);
 Y   ALTER TABLE ONLY job_board.languages DROP CONSTRAINT languages_reading_level_id_foreign;
    	   job_board          postgres    false    293    275    3355            �           2606    131644 +   languages languages_spoken_level_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.languages
    ADD CONSTRAINT languages_spoken_level_id_foreign FOREIGN KEY (spoken_level_id) REFERENCES job_board.catalogues(id);
 X   ALTER TABLE ONLY job_board.languages DROP CONSTRAINT languages_spoken_level_id_foreign;
    	   job_board          postgres    false    293    3355    275            �           2606    131654 $   languages languages_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.languages
    ADD CONSTRAINT languages_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 Q   ALTER TABLE ONLY job_board.languages DROP CONSTRAINT languages_state_id_foreign;
    	   job_board          postgres    false    293    217    3281            �           2606    131639 ,   languages languages_written_level_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.languages
    ADD CONSTRAINT languages_written_level_id_foreign FOREIGN KEY (written_level_id) REFERENCES job_board.catalogues(id);
 Y   ALTER TABLE ONLY job_board.languages DROP CONSTRAINT languages_written_level_id_foreign;
    	   job_board          postgres    false    293    275    3355            �           2606    131497 *   locations locations_parent_code_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.locations
    ADD CONSTRAINT locations_parent_code_id_foreign FOREIGN KEY (parent_code_id) REFERENCES job_board.locations(id);
 W   ALTER TABLE ONLY job_board.locations DROP CONSTRAINT locations_parent_code_id_foreign;
    	   job_board          postgres    false    283    3363    283            �           2606    131502 $   locations locations_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.locations
    ADD CONSTRAINT locations_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 Q   ALTER TABLE ONLY job_board.locations DROP CONSTRAINT locations_state_id_foreign;
    	   job_board          postgres    false    217    3281    283            �           2606    131756 6   offer_professional offer_professional_offer_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.offer_professional
    ADD CONSTRAINT offer_professional_offer_id_foreign FOREIGN KEY (offer_id) REFERENCES job_board.offers(id);
 c   ALTER TABLE ONLY job_board.offer_professional DROP CONSTRAINT offer_professional_offer_id_foreign;
    	   job_board          postgres    false    3365    303    285            �           2606    131751 =   offer_professional offer_professional_professional_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.offer_professional
    ADD CONSTRAINT offer_professional_professional_id_foreign FOREIGN KEY (professional_id) REFERENCES job_board.professionals(id);
 j   ALTER TABLE ONLY job_board.offer_professional DROP CONSTRAINT offer_professional_professional_id_foreign;
    	   job_board          postgres    false    3357    277    303            �           2606    131761 7   offer_professional offer_professional_status_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.offer_professional
    ADD CONSTRAINT offer_professional_status_id_foreign FOREIGN KEY (status_id) REFERENCES job_board.catalogues(id);
 d   ALTER TABLE ONLY job_board.offer_professional DROP CONSTRAINT offer_professional_status_id_foreign;
    	   job_board          postgres    false    303    275    3355            �           2606    131518     offers offers_company_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.offers
    ADD CONSTRAINT offers_company_id_foreign FOREIGN KEY (company_id) REFERENCES job_board.companies(id);
 M   ALTER TABLE ONLY job_board.offers DROP CONSTRAINT offers_company_id_foreign;
    	   job_board          postgres    false    281    285    3361            �           2606    131523 &   offers offers_contract_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.offers
    ADD CONSTRAINT offers_contract_type_id_foreign FOREIGN KEY (contract_type_id) REFERENCES job_board.catalogues(id);
 S   ALTER TABLE ONLY job_board.offers DROP CONSTRAINT offers_contract_type_id_foreign;
    	   job_board          postgres    false    3355    275    285            �           2606    131528 !   offers offers_location_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.offers
    ADD CONSTRAINT offers_location_id_foreign FOREIGN KEY (location_id) REFERENCES job_board.locations(id);
 N   ALTER TABLE ONLY job_board.offers DROP CONSTRAINT offers_location_id_foreign;
    	   job_board          postgres    false    3363    285    283            �           2606    131533    offers offers_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.offers
    ADD CONSTRAINT offers_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 K   ALTER TABLE ONLY job_board.offers DROP CONSTRAINT offers_state_id_foreign;
    	   job_board          postgres    false    217    285    3281            �           2606    131671 I   professional_experiences professional_experiences_professional_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.professional_experiences
    ADD CONSTRAINT professional_experiences_professional_id_foreign FOREIGN KEY (professional_id) REFERENCES job_board.professionals(id);
 v   ALTER TABLE ONLY job_board.professional_experiences DROP CONSTRAINT professional_experiences_professional_id_foreign;
    	   job_board          postgres    false    295    277    3357            �           2606    131676 B   professional_experiences professional_experiences_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.professional_experiences
    ADD CONSTRAINT professional_experiences_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 o   ALTER TABLE ONLY job_board.professional_experiences DROP CONSTRAINT professional_experiences_state_id_foreign;
    	   job_board          postgres    false    295    217    3281            �           2606    131692 G   professional_references professional_references_professional_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.professional_references
    ADD CONSTRAINT professional_references_professional_id_foreign FOREIGN KEY (professional_id) REFERENCES job_board.professionals(id);
 t   ALTER TABLE ONLY job_board.professional_references DROP CONSTRAINT professional_references_professional_id_foreign;
    	   job_board          postgres    false    297    277    3357            �           2606    131697 @   professional_references professional_references_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.professional_references
    ADD CONSTRAINT professional_references_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 m   ALTER TABLE ONLY job_board.professional_references DROP CONSTRAINT professional_references_state_id_foreign;
    	   job_board          postgres    false    297    3281    217            �           2606    131434 ,   professionals professionals_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.professionals
    ADD CONSTRAINT professionals_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 Y   ALTER TABLE ONLY job_board.professionals DROP CONSTRAINT professionals_state_id_foreign;
    	   job_board          postgres    false    217    277    3281            �           2606    131429 +   professionals professionals_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY job_board.professionals
    ADD CONSTRAINT professionals_user_id_foreign FOREIGN KEY (user_id) REFERENCES authentication.users(id);
 X   ALTER TABLE ONLY job_board.professionals DROP CONSTRAINT professionals_user_id_foreign;
    	   job_board          postgres    false    233    277    3303            �           2606    131223 ,   catalogues catalogues_parent_code_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY web.catalogues
    ADD CONSTRAINT catalogues_parent_code_id_foreign FOREIGN KEY (parent_code_id) REFERENCES web.catalogues(id);
 S   ALTER TABLE ONLY web.catalogues DROP CONSTRAINT catalogues_parent_code_id_foreign;
       web          postgres    false    259    3337    259            �           2606    131228 &   catalogues catalogues_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY web.catalogues
    ADD CONSTRAINT catalogues_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 M   ALTER TABLE ONLY web.catalogues DROP CONSTRAINT catalogues_state_id_foreign;
       web          postgres    false    259    3281    217            �           2606    131250    links links_state_id_foreign    FK CONSTRAINT     y   ALTER TABLE ONLY web.links
    ADD CONSTRAINT links_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 C   ALTER TABLE ONLY web.links DROP CONSTRAINT links_state_id_foreign;
       web          postgres    false    217    3281    261            �           2606    131245    links links_status_id_foreign    FK CONSTRAINT     }   ALTER TABLE ONLY web.links
    ADD CONSTRAINT links_status_id_foreign FOREIGN KEY (status_id) REFERENCES web.catalogues(id);
 D   ALTER TABLE ONLY web.links DROP CONSTRAINT links_status_id_foreign;
       web          postgres    false    3337    261    259            �           2606    131266 "   menus menus_parent_code_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY web.menus
    ADD CONSTRAINT menus_parent_code_id_foreign FOREIGN KEY (parent_code_id) REFERENCES web.menus(id);
 I   ALTER TABLE ONLY web.menus DROP CONSTRAINT menus_parent_code_id_foreign;
       web          postgres    false    263    3342    263            �           2606    131281    menus menus_state_id_foreign    FK CONSTRAINT     y   ALTER TABLE ONLY web.menus
    ADD CONSTRAINT menus_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 C   ALTER TABLE ONLY web.menus DROP CONSTRAINT menus_state_id_foreign;
       web          postgres    false    217    3281    263            �           2606    131276    menus menus_status_id_foreign    FK CONSTRAINT     }   ALTER TABLE ONLY web.menus
    ADD CONSTRAINT menus_status_id_foreign FOREIGN KEY (status_id) REFERENCES web.catalogues(id);
 D   ALTER TABLE ONLY web.menus DROP CONSTRAINT menus_status_id_foreign;
       web          postgres    false    259    263    3337            �           2606    131271    menus menus_type_id_foreign    FK CONSTRAINT     y   ALTER TABLE ONLY web.menus
    ADD CONSTRAINT menus_type_id_foreign FOREIGN KEY (type_id) REFERENCES web.catalogues(id);
 B   ALTER TABLE ONLY web.menus DROP CONSTRAINT menus_type_id_foreign;
       web          postgres    false    259    263    3337            �           2606    131334    pages pages_menu_id_foreign    FK CONSTRAINT     t   ALTER TABLE ONLY web.pages
    ADD CONSTRAINT pages_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES web.menus(id);
 B   ALTER TABLE ONLY web.pages DROP CONSTRAINT pages_menu_id_foreign;
       web          postgres    false    269    263    3342            �           2606    131344    pages pages_section_id_foreign    FK CONSTRAINT     }   ALTER TABLE ONLY web.pages
    ADD CONSTRAINT pages_section_id_foreign FOREIGN KEY (section_id) REFERENCES web.sections(id);
 E   ALTER TABLE ONLY web.pages DROP CONSTRAINT pages_section_id_foreign;
       web          postgres    false    3344    269    265            �           2606    131339    pages pages_template_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY web.pages
    ADD CONSTRAINT pages_template_id_foreign FOREIGN KEY (template_id) REFERENCES web.catalogues(id);
 F   ALTER TABLE ONLY web.pages DROP CONSTRAINT pages_template_id_foreign;
       web          postgres    false    3337    259    269            �           2606    131371 $   resources resources_state_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY web.resources
    ADD CONSTRAINT resources_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 K   ALTER TABLE ONLY web.resources DROP CONSTRAINT resources_state_id_foreign;
       web          postgres    false    3281    271    217            �           2606    131366 %   resources resources_status_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY web.resources
    ADD CONSTRAINT resources_status_id_foreign FOREIGN KEY (status_id) REFERENCES web.catalogues(id);
 L   ALTER TABLE ONLY web.resources DROP CONSTRAINT resources_status_id_foreign;
       web          postgres    false    271    3337    259            �           2606    131361 #   resources resources_type_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY web.resources
    ADD CONSTRAINT resources_type_id_foreign FOREIGN KEY (type_id) REFERENCES web.catalogues(id);
 J   ALTER TABLE ONLY web.resources DROP CONSTRAINT resources_type_id_foreign;
       web          postgres    false    271    3337    259            �           2606    131302 "   sections sections_state_id_foreign    FK CONSTRAINT        ALTER TABLE ONLY web.sections
    ADD CONSTRAINT sections_state_id_foreign FOREIGN KEY (state_id) REFERENCES ignug.states(id);
 I   ALTER TABLE ONLY web.sections DROP CONSTRAINT sections_state_id_foreign;
       web          postgres    false    217    265    3281            �           2606    131297 #   sections sections_status_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY web.sections
    ADD CONSTRAINT sections_status_id_foreign FOREIGN KEY (status_id) REFERENCES web.catalogues(id);
 J   ALTER TABLE ONLY web.sections DROP CONSTRAINT sections_status_id_foreign;
       web          postgres    false    265    3337    259            �           2606    131318 !   settings settings_type_id_foreign    FK CONSTRAINT        ALTER TABLE ONLY web.settings
    ADD CONSTRAINT settings_type_id_foreign FOREIGN KEY (type_id) REFERENCES web.catalogues(id);
 H   ALTER TABLE ONLY web.settings DROP CONSTRAINT settings_type_id_foreign;
       web          postgres    false    259    267    3337            �           2606    131387    texts texts_page_id_foreign    FK CONSTRAINT     t   ALTER TABLE ONLY web.texts
    ADD CONSTRAINT texts_page_id_foreign FOREIGN KEY (page_id) REFERENCES web.pages(id);
 B   ALTER TABLE ONLY web.texts DROP CONSTRAINT texts_page_id_foreign;
       web          postgres    false    273    269    3348            �           2606    131392    texts texts_type_id_foreign    FK CONSTRAINT     y   ALTER TABLE ONLY web.texts
    ADD CONSTRAINT texts_type_id_foreign FOREIGN KEY (type_id) REFERENCES web.catalogues(id);
 B   ALTER TABLE ONLY web.texts DROP CONSTRAINT texts_type_id_foreign;
       web          postgres    false    3337    273    259            �      x������ � �      �   /  x��YMo�6<3����6�$[�������]$��Z�-�4�RRR���<:�E��P�]�@f$�7o�щ��A����>8U��G����5W�Weū���K��v�
"� |L�
����������NRB��+kqfw�?�?��.=����`��T���RUzgJ1��[�]k�\�W��ѪfK��K�4ǿ�Pdb �wF��W��y3m<��	�v��˲ޙ�e�����*�����c gbfv�FN�)�l���b�m��O���{�Ql�[�[��UP�ڱ�'��)���<[i�l�6�6�c@��h���ڞ>|!ft@z��A����ުF.�)��$����z a'�3>
�,걯��N9#]�����9MTp�Y�U�{gU��C'	�(�AW:�?;��-���|ZNH�(ȭ~����O��I�(�٦kh2��о����\B�F!��΂��&�5��HI�(M��v�hy�w;~YIŘ�`�sDa�9%���Q���a�zk9'SJ�F%fql�z��e�0�}�1a�6(�iĊM�0��٧#��X�*xX��o�zHsBO��xPӕ~L�)"E��J.��5k���s�.yo\�:M�	������ޠ�wN���)-�>L����q��*t�_���xr�U�i�)�O���mRbǷ�ӎ}�g��N+�I�en�:�̔	"�{p�m����ְ�U%�40o(���|�
f����텝|$��3����͖|LQ��6/v�F>@�\���U��t�Km��Ho����֑έ��Z�HƾF�#\Xe`xW�����c��N~��窱u��=���0
��A@�/��L������qE�#,T�(�F/ޮ���0�� ð��Z7|�:Q4�⯌��X���U=W*�<q�܄���T|���pL�t*<��Z���^��
J�n[ʖх�(&D���k��k�p�țg6�р��34Ow^ҥ�1�� ~B��Lpg�$.��X�8i�G.W��S�Z��2���: c�@�k��cF��!��ե���-:P0�Y�@>�F��GU� 0���k@0`�U�3 ��ޢ.B��J!��ߡʳn�ѽ�S}L�?���Gڃ������� �j��\�MC��Ey�2����R�A�|l��X�'�<��O�W�_�8.�`��O��z�tT3,�j>^��M�<j�?W��6��B�|���d�ƽ!K��j���
����s!p�h,��ז����D��E�a�Yi���O;g�,��烏�A�8��|�	!���SX�BP=���0��7�k��8#�\�Y]�'�Q%��������L�=f8 ?"�On�Ǯo"�s�Č5W���ӕ���0D�&$ULD�eƺ�u��+o+%�ufc5_�G����7hzWa&?룮Z>'(�\����:^4?��c0��D�&�xs4��\jZ�9�t����z�ȥ[�?U��Շ��i� �":�L��aT_�M�>8�F{�^�e�$RD�����F�,�-t��|�H����*)hk���r��?NONN��ŷ�      �      x������ � �      �      x������ � �      �      x������ � �      �   )  x����r�0�������eg��-��m��ۯI�X&�l�ӫ�YG�]��+VwU�e]����x�:��x����!tQ�O��N�I�c $�}��e�I&J���C�u�I'K��,�1ԓ@��|p���=�S ^mx
�1��P�!�!#̽�tFG=�qE�3�Y{��ޒ�U��}3��;wE$#I;�h��C�f�d'�2(AA��M8GIBkHdHa��#{(��Ķ�f�!�`.�M����(왦��]�Z������[Dv9^����Ib$�8�� ��E>�B���'I�^���}���I����^��mK�14W��Nu7?c:����[�¼��S�P S6�`/��<"�cno����ڭMέ�%$	F�B�'T��R���҉������`��}c�W�L��� [ܲ}^#�"a7x�$��^s�n�r�$�A�{�Z��_�Rb�QG�$6�y\�"A\���5������tG�?�
���ۣ��>����[��]Ӓ�G`R�����u�F5�b�q�R���ŚW���=���H[�\R#tq*I����j�C�FY���UM����TCRK�:;��,�3M��3�W,~����S��_�UQf�#X�S5�_�0�T�C�5�Q�����^i��=���z4���!�%-�U{-_�&S��'`1z5�P��y���Y>��}�r��4Gf�9��I�y٠�5]���+� [�DE�����mD�G���ݺd6;����kP
�K&ˋ*=VИǢ�n2t�b,�)m���as������dw9�����:�����t�N�R      �      x������ � �      �      x������ � �      �   �   x��λ�0@�<E_@-ت�^��h\(�i(�oD}z�������L��4�_�ĩРj.1�2�G��A�U<��S�/\���e�V-���ļ�4*�i�^O���R�A��	:�Ƕ:^�z���|X8@�t�ǚ��Mq���ί$��f�g
���n��j�/���x�}S��_ʡkY���Ry      �   '   x�3�4�4202�5��5�P04�22�26�&����� ٹ�      �      x������ � �      �      x�3�4�4�2�4�Ɯ@����� !��      �   6   x�3�4�p
�t�p�q�4B##]K]CS+#c+lb\1z\\\ �T�      �   a  x���KO�0���_��ۄ�q'��ģ��{�b�6nc��`h���q�T鮑fe�33�T )%UQ����k��Lo���yl:�a�7�5P�3lcX�֟���^��C\#a�*c*AQ�P�,Zm�5�3�7qoY�n5�~L8^���埳����[<=���1�n6�q�bb��y�f�iq��Z�������`	4�`�4�ΰ:"y���o#��WB��J����D�}ྵ����Q�h-\D���w=����J�.�思j%3�%0C�5$	X'�1eu��el�6#r�Е��&��6��D7�7[��S�S���~yo>�ߨ)�TU��tHV�O�F3h�9�F_�2�      -      x������ � �      ;      x������ � �      /      x������ � �      1      x������ � �            x������ � �            x��=˒�F���W�H�)�7�'4��MM�a�ݻ㘈�"PMA�h<h�n�{�/������|@�%�%@�{�L��̬�|gV��G8���|�ެ�������7�vr=]��[!#%c|��V���5z�Zv��v����c�}���/�s�Z����8U�t���q��L��i%]|�R8���d��5�kk(��n�V��lQ~�$pq��xk�rb�:�t~�X�r�����t\��}|�J\M���Gg�D���x� ����u�|�F�s��ݘ�� �+gBs*q~��O0�8�Mk26����h�T<��_������]g	�7չk�������d�YM��K���[�	;W	���ߊ�z9O'k�ߝ��hk����+�%����P![W�q�:��
QTMZ�'��?���m�0��J�Hx���H�Թ���LV�Mʷ��b<Y/�ȓjk'�A�!���`&�B����� �����!g^uŤTk����AFa���o|w�Zz����`�W�B�9;-�� �w���H�Q���U�K�D�� ��w���$���0�"�I����Tm��"�e�T���`;%�`'�1���kO~����Ep�w����MX�2������Q_*0�"��ڥ�WҰ��|�jY/�ϭ����
d�KwrT��3�!v�����8�d��puŪ��uJ
�9�↾[^Y1VR� hr��������|�}!ȒR�'�w�˺ K����>�%A3����(?�M�!�f�_�� ���.�<켴����C�Z�*���X����+!Z���ʸi�|7�*;�p�j�;p%��v��WW��qS��z)��eд.d��_��^���+4�	��F�^�37:Q=1�z�>�T�O)}>�I��VĀ�|��춈5mqTO<X�0��M����3X��Q�C$�R��u�M)�B<mZ��t��i�t_��im"�� B����?�װ>���#x�%
���]2��'*
	�XF�K���\D;����^�׻H�e\�+6q����u��m��G"J�N {�?�'-K{���N��	I�&�i»8���0"l�'=��%<C"�c�����Z�����C*���D�i���E�[s��Υ6q�+&G�8�H��K���:<������V��!�=ᐠ �G���ᑦ�.�e(��O�H�=��nN���d0��o��H���R+H�C����MDM���歔'���>N��ҷ�'W�dtY``Ɓ
�`�#P�#�F�荊��?��|��(�i��������V��80�o�-�\�4 6�Δ��v��2�^�lcpK�4�����T��X�ʭ�X�я	�q%;YґZ֫GK��H��OV�5��W��TZe
h�}���>�>T8?Luu���-.���"߅��	���=���P������1$@���F�+ưFm�����[6ֱr_����fo�7����H��d��v��"Zz(�)XnW_W�&Xq�|+k����Ҥ6��W2�0 ��]B�Td���%ntT��C���3*׽ځ1�@�*�� ��G4l�c���I�m3p^���Q@ЕT�.�]*���4��=�%�M`*�0 ������W�8[�T�V[�#����@�$ԁ���U<1~y���ğV���,-��N������N,kcqToL@L���$;����9�o�����L��#��}DU~.���Сz�\�g�����/`��%�u6�o3O[%ZT�����l� G�g�q��#Kf:Hc_-u�"-�W&�Ym&�7
r�\�K^Ut�A�h�����G����I��k���K��}U�]��Â���� Rb�[l�����{p���o���uUa���C�30��1�sk?]q	:=	(�2A�F���@k_f�!��F���i �xt�Fd#2�)f��_�I�Ë�GL��eyɷ�a�������򪆴*0�2D4�V������ݚ�l�R����z@�u�QV��-B�˳Ix$!�,��J6:@��A����ѠM��b,��
��̅��^yX� ;+!X�L �Ū��"�bb�%;`����	O�<�1��
�^�w�Ð���	�Ed�%V�N �]���Pt�8A��s$_}]Z�Pl@m⽦l6��\���L���&{���	gr��D=�)n�<�^����B�f�ԽY(xp�;�c��	��T_u�V=*ힳ����!/,f�T�	���`e��a04�$c� �lk�	�>ǖ��*��?�W�a�L]�XFS&�s�'�N��Uk zb�QW^{؀�a�ʢ�E�{	)J�B	��tHH�Q�y�J�rY�x�\w�7߾�wk0�������`���ʬ~PT:*Md��r�Cxh��uHjd����Ix���&m��$�{�X�K4��ǂ�zZF���M8��T�*�
�{�����:�i 7&^�s���v(@�}��3���.\��i]n�`�\W�qf���M���i��X��M��,N���*{�/���CQȧ�ZعF��4��Γ��Z?$?��m��d�a�N[͑��8`L� 0`N�StE��>1)M�����:lG��p��<~AJ�4�V��tE�gHA)mM���}����ؿU��m*�v�s�y�F�g>����+lA�Y$ArmD���/n�[��R���~�|�<�:����W�Y�ڸy ɸr�?b;��#K��j\
�q\þc�6�.F��@���!�P?7�Nu����;`{gO	r̜�O9�:��cv榙8�A�E�~��e�=�h�X��Z���G���*�i�]aT�qb��j���H�������[`����V��jA(����. �G �;��U:*~0Qo�o�"����> �Z.�7
]#6�&����jL3��5�}⏛�%d9�|J�������I�K1����@��RS�����jx{��)������.��<t��?��+y��f	��!�6Iu��?�0�^!&�8�-}B����l�|$�LG_��D�3��J8��D�j�N�yF�$�������^�r�3����ma��9����lXW��`wΰ���L�m��7Չ�F� `W�z���9��B�ҿ�j̞G�_0D ��z��z��n��/.U��u���)vy��_j75U�+���n�ڄm X�HT��[p��1t�P� (������B�2���DA���VH�h�eW)�7�B�i{ڭ.3�hA��!Uf�*Hߘq�75��:�+_Ż�Rs�M�Hu,�@��wX��T��,f��NcMl�ċ(N<��)��8�@���$y1(�Y>fM���Q�@�`K8���o~�ʡ�8�d L�> v�J�a�`M뚂D�Z��%1dQ�����M��(0���@%:�P��/SQ	�����Ц�5�?6�����R���ʫyĹ�(�Ld����%"OD��� i\��z��x�ƒ�uj��K����֦ˊ�	\Iu� �����x{�,c)�����Ǝ+�X���OhFE�x����j7�?H�j,e�
�H5UI�Fܶ��ې{��6�+�
y� ��,}S1v��Sλ4�^k�u�� Q,6�̬�Iܳ��3�0�i��q3��kN��m�$ ����Ѻ�� �To�S�'2-�)Eٺ��J�^n�YQ��P|h>�\"���3�IW���z��n�=Q]��1����)8$/,�}!
FST��#ȅ�R�v�k@��0m�G3Nw,�yA�"�.�eR����-����U��C�I�礐т��^�����W���� ^�_��V:�c
�#B����'��tZwP�L��	(�3�[0H�������NW�&�F��Y��E	��!Ѕ&�"t��?�m�3�+x�3���z(���!bf?ﱏUgK;��V>D�S��ydL��~p�;fw�.�h���W*A5�h��+a�9Q:�ߎ/���d��@���IP'� �  d�F����x�6T�y�3AiL=��r�e�\To,=f%[Sz)}Ռ��3|:�MؒW.T��<_��mw���6x�'��˦.W�Ħ�A��j'S�#��7�?8�6>��Zi�(����}�3�Et����s��r��oTe���3�f��B$N����c5=�}�m� ���&���N�M4����=�7���N�]nK7̶����:��mB�ĉ�γI٤�u��LǀNeu���M�7- �AE$��	���N��OT��Q9��?Ok�k�����
���A-�0A8���R�}ל������O>?~�	�ߑ�v�j��5�Wt�Awh�����ҿwUF��P��S�`U3O1�i8� ��� dȄ�D��ʞ�yĐ��!�	}ԝ[�[7ow�.��4:J�@�&��u�h0�t��{$tx�ɘ]Gu.�ZL�4�Q�1��<쿎<�l&`hZx��ʘ�(Ƅ {`�@Yh9J�����QY�
��U�^��VY�j���h��5��A��-�?��3�3���O�eC��[�&vܔ���at�	h���GT��g����WG0`�+�w(JT��=���U��	�!C��_�����4	����@,�(>��HlF2K?.L�?�)����t���d�t~�ijκY���l�l%=���'���a�����Q�s=�H�g�D�}OQ�ӯ�������+f��ڣ�t ���y���I��{���#�����u��������oPO��X��ͱ#���������hu�C<�<�	��������Mq<=�\Q����� �u>z�9��J� �:�Qm��TpZK:�O5]��#�wY�l�cs��ET��H-�brϯ'%��j��:L�v��j��2ojPF�#��|]=��	�a�c����Na�enA=�+�0�ƍ�;��1�I��"�!��tJax��#����q�<�q�,��X�����6��gōn���g\��g���.a2��0��(Nd^��	�@�Aq�T��,�-N5W�=d�q�b�0?|Иa����Y��y3W�yt����>w����E�PV�+ܲ(��>���m�4�a��@f���(�8K�`���jL�⼨�
�v�4P��Y��'�B�i-�Ϩ�>C��4v��ȸ�ۨXo\�)���#���9���\F�m��W��~
?Ю��l�L��n�2�0!=q�����9/�uq~pO%��|��.ч̅��اT�t�)S�#�V M�8��D���A��A�����9r��nr��?�Y���ϴ����a��4�ay��X>OZ�<�������<a��=��0a'����3�0+����-W�X"����b�hdR:Q�?�G
�S�u81`N��1�̂�¥�h�r�p�+��٨����=���PV�A���vdL��`Ö�`�d��1�t~SJ=�>�:I&�EE���6#��$�^Qt	��Cu:F����z����9�R�]��)&�X���GƆ�hx�O��|�KV�|����926�)� bL�=WzK�����-0l��^c<?�3W��:��n�č�A~� �3�98r�$0ա���%"�C�8�+4�rT�'4�`�Xqy2#\�a}��#�#0�7b��e	:���xě����Ƭo^�M0ήxjJKu�ޞ~���� 2"��1Õ�nV^�x����Y�*^�š�NF�L8^�] ���ɨ�0��b�ˑ�@%u�Έ�cE��|������`�(�2�6|N����\ɢ݃Z�٢�qr#͐�'Y��\���6<�v�h^ƕ`'۠�.n����q���8��q&��6#�Ix�1�������TOMۭ��-�z���O�4� �!���M»�-�4�8���S���᩺>V`(O�����Ћ.���k�S\��>k��Z3c�y0�suh��i��it��,�4�Qm���2�e|~E����?gcbb70X�28B�z Ë'���g��Mޥ�^��9�S��ʺ������܀��=_�B��^�d��h���V|�n����$%$]G�=��F-�L46��۔�ϸ����lc�� S�):E�܉�B!�:�lc��-Q�U,R|�З_LX<��Fu��Ч��i�ʟ/	-\��|Hn��/�ʊmLeb"y�Il2���Q�1��Xx���aa,S�u� �m��ƹN�����A�82e���w�Ix����A�-�{Z6�O�Iv�4�R���n�{�T�X��xU��օ�U�,N��L��᱁w�?\�Vx9�;s3Lȉ��vںL<w���൯��fz��4�?z`aՇ�W�<�	��^Z��8�s��L`x;�Z?�"��ǋ�>����f7-BNX��yT�կ�d��A�gv |M_����b��^���]Q9��M��C�BW~$eã�5�IW�/t�Ry��|��R�5�A,���y�G�;��tN���=bbz��M4
7��o�1�^�;���At�gu�;Q�K��Q=��� ���0�����aB���>�Ec�A~fC�Zm��*�r�Vbj��Iq�FK�	�Z��2b�4���Z�|������ld�L#�����-^��f2�(��.^T���c�V��sj\�K��f�!�j��jǘ�hc��'w�0-�b��b;��Q6�o�`�)��+		U��F�U��.��V:�$c�4��k�;��ŗak�� Ia�rS�BQH^�3��=n(�Շ���D����0K�mqp|���n;�x~[8b"��l �|C�O�ǰ�ϻI��#�d�c��g���(|�:k�Q�b�t�%�Y}����m��K�|�h̃=�s���0����^XR�!��Z�g��ta#�u�q�%����x젙݂���s��/9͡�s�=�7����|�O�`��-�����ٵm�������N��1�*�auy��k �˗c�o���#8>�w��VGfj$6 `�ud�N`?i{ȯ�(�c�zXj��n��j��4������P��$�����/ �T�����[�i�ͽ�t�I�>s������rz=�;r  ������K��o}��s�Z��<m��3_ԃ9�/t�|r���K�����[��(�I���-曻�iM`�{8}1��7�k¢���[g>�	�~ g(��|������Z��AnV�����/�,f�����/0`1�ݽ���|�_�9����3�엂1W��d^J��_O.A���SK��|�י�h3YKg�Џ�}�m����Z{�`t�qyQF���E:zlF.���g���"d�véEɐƢ!#c)j��'1V�@�q�X�ϋA�����zoaܻ��o���#�����b��	T�����~�W�f��n3�FG�?_
��{d���ju`�_"s�'	!����)���Ee0���M17��?�ېπ)��،F+*����*������~��U���~����k.�*�������� �d�H��*����o��_n>t�            x������ � �           x��Աj�0���S��6���8�d�A��XJۡC-����GʋUV���$!B�}�N����ap���� ������Y�����
#$���x�W/�ܰ�Y�J��LL95�?��7�-(	��bt�^w��u����[g���N���������g�.�6>��ՖՖ䵳����Di[�(��j�`��6D	����0�T�|=TqQ��!m�:b1C��'����uC��3�M�?4����,�� ���I      5      x������ � �      +      x������ � �            x������ � �         2   x�3�4B##]K]CS+#c+�b\F �D�6�6&Zu� 	      3      x������ � �      E      x������ � �      G      x������ � �      C      x������ � �      !   =   x�3�4202�5��5��0@LC(D22��423bS�&K�>CS+#c+Clb\1z\\\ I�      #      x������ � �      A      x������ � �      )      x������ � �      7      x������ � �      '      x������ � �      %   ;   x�3�4�44�20�44�Ff�FF���
��VF�V��ĸ�0�Z�7F��� a�         1   x�3�,I-.�FF��F�eB9�@��������V1�=... ���      =      x������ � �      ?      x������ � �      9      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �  x���Ao�0���W��%Z�-�,MK"�jW�*�L���+'h����c����}C�囧�<{|��BZ��p���k�� �������@���(���M���� xO��_/0򥐄r��'�=H�$�졖hAdI�8"�C�i��#-�_�>p�r�Mx��Ȟ=��z"�P虀�d���1J�Ή$~����k��+R�Wʎ�ׂ�$�'O��E���K(K��ԩ�O�Z�r�gD*��g^�=���~�R"�S8�;����=�`�hk��������P%���aЧ�`��)���c
��.�������6-X�sw�ߥO����D/�@��|;�w)T%�	e-�s!� [Gλ,�]k� �&8� �!��`%v1�]*U��I!�kP;�v�T�W`��C#to�O��*�����E��ʦ��&��1Kg��«��JJ`^�t�on��ȡ4��e��.���M^�C?�4^Y�L��<�v���/[CK�'��i?�J�1��p�m��3�I
�&Dqbb����S�_�nw1��1����7KChc#0Bh�chv�����<����� �7q��I�D{"��I�Q�V^ǻ�p�I���N���P�,q3D��ژ���6���y��m�Y��(F�i��e�l�X���^�/��+{      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   2   x�3�4�tt�s���4�2�4���C1�4�tq�qqu���qqq B
�      �      x������ � �      �      x������ � �            x������ � �            x������ � �      �      x��\�v�ȱ]�_��W��y��"�-J��%�9>�$�R,<UI�1f&�z�cw�&k@F�p���L������̳,+��n�趛���7�l������Ҍ&�N�h���pZg3w���?�9>����-]�-�<�O��]|m��v���Ə��;�~�W�x�v��Y�̿��"|#�rZ�}��ͻ���ݱ;�����e��e��/s|����Mq���a�Q�dɿ��_I�忳��e�w��G����"K�"I����cwx�O��M?}|]�:3�7��v�wh�����q��h�,��-�K�/��5h=X6|�m�S�/G���w�n������M|]ܛ3}��0�gӑi�}�w{�מ��n˒s\r]$i��i��E�`����g~j���0?�í�$3�]�	�vͮ��ݗ/��ϒ|�#Yj�WM��7���¢a�����Y�p��/�[�[Uࢪ�h��ȋօ�����c�'�5�la�F���?���<��2Fm��
,?����4u煞���y�{�r0OY:>wg��`�w�� >�+t�������ł!z2*��q9t�?t�n��K\x�U�fE�$E]�k�����5>7>4<��+��x���xs~��XcG3��m�.�c�׏�6mw���E7��?���»p+��'�'�Zcbf0-�,����_[�kkۤ�ŵe�4It;B��|7��Ͱ�z��!?A��a������&H<����f�m����7� �����N81Y�p2������*��3����O����`7����e�5iQ�u�fY^��`c��W{<G��pAL�l�!6��o��3���o!3�3��T	������	v�hG��|r?�1��`�E�M�d��Sw��ei�:m�4�ʴ�+�?�m��Od����j{��<������[��P�怾���4Ei�~�e�Z�?��,�����g�]��\�%C�/�vPEf�Z*;u�Vi��M�fѥO��o��u��$G�J3�7[��=`���1�#��y��$e�U��pu����!���	���}3�K�hk��e%z�=��%��̹�iBF��<mӲ��]px�	:{:����m��� �^���?S�_�K�`��]|1�F��|,��3h*���7� G7�/^�[p|�[����[�ʡg���LCm�R�AYyU4m�Y.zm�	����v}�5-�8Y �(ߨi�E���9K����=�sã�ӣQ3�"�����Y����
�����H��Wg�AJ4��L��l��N��h���.���`�WfN
��j�S���P��������Z��p�C�����sL��w���qV �${6?�3��K�"~�����N�P3�զD�
˓���$�ոK��1�0��q}���5�� ��?>�`�Ȋ�<"����`!N�a?�� O�W3Ja�QF;�>Fv�O{�P%��R�3�ߴ|�m [�L0Vu�f�����Y��f��d�:��N�"�~�	�Ԣ/����$7A
�g��BE�c�݀]���������^�}lΊ��'���D�i���6K���hH�K���_/�!����0�CR��I}Ŗ�c}/�=��h`�����ugà!a �ZI�(ȶs��`]�!sq�`.&\��b�4a�/D`���� ��M]TiYI��B�!�3O�f��U~F�f|��v�;���aF �.z�S�"�{���j1{V�������^x�d�������H?7-��]R'��:ϳ��^�� �{�� 4uC�%<ugzĶ
6W*j��'xsN��p�c��S��ˣK��Pϰ%GADo���/hwx>�~ZV�ga;8� �i��~ ���m�gX���S�~@�F�k��{i���.��zLC�|��d+n����Id�xB�ʡ{���߆��F�ߑ�0�p��Z56��@^SfyZ�uZg��?��ro�����Wk�Q�*u�@.��q;��E�F�N�o9���'Np��+��)/B;�ENf9��仢�M�
a�,��4��o�_����@0�_ ��'?9~POlQw p>M�`��	p#Ǿ�_x���a��e��@:iz]�
2x���h˂	��EY'EU6����8|��d�C���0!�
q>�s�e�p� Cl�F�-Ң�M
XGC�Q�O�o�V��9;��;�z�ؔ�׏�'<O���&���"-ۢM�M��i�oș��*sv��E����X!�v�2����	ƀ�AT�4������Ap�͹�i�`���ZF0���Z�WS��o���b����*�J1�{@�R�*g�b{A�	�?d��� �QjQ
8B� �IC@D�x��|(�Ȯ�������&��K�$˛�n�&i،hb�<��1N�߸fz�NJ��g}��`V�|+_��A ���Z�
t���N�	ޫ��Ez�m^'��$�8���7H<���w�ZI�Xı'�$+��}�r�3��.BlBHk��+Ao@D��
�Hm�~��F�#_6e�)�5Y	��L�,�����l��L�{�Zj�#$��W��:1?��c)c��8�	�� @��P�����\�1�움 �+\�bQ�mI�@^n�B�N�IM����q5<��o>C��2<'�a�7vox�Z`n��#a_����BB�iД`����rH�x[��86 5�K�+A�4E)�h*�bB}U�Vm[�m
�DקS�Ks������{ʡ�E2%@V�G�8� &8Hu�*J�%.k`@KA�>��X����1KF�-���f 9|x2}��|�ь�-�p+�5��y��@I�'d�
��A3����B�Ǆ�$���;d�)��6���b���:�$�=`Ӥ)a\TU��E������\�gx�62��Zq����,@p�!��^��):�k
��i"Қ\�㌉H�N��Ve�7,�p�� y��ɪ*��`Ѻ�_C}����D�>��V�28�u��S/�>�#䬠w��c ��;����������
���5�xd�2����j+�A��w�SHx���(L�5g�A�2M�G��Βev�[NFAS@�I�?�C�^<������i� v(��Z�����9w�YڔU�@�[�4x����É�:��|Ӑ'���wף��8p�r�/�ɧ�ɂqW���Bc�Ű<�����&�+�*^��8���?�/{�����PO��w����S�U����e�fm �(q$��x�`)h�䁐�_;5� �lT�%O*�:](����ŵ��ț��Z�`}��0~��,��n�+X���fb5|���������n�f��*�/�8y�]~�#g�C�K��	��=<�9w��2���R+D�a'+Ju�ď*,���z���8p���x� v,%Vh�����Zy..�
2�i|��M6a����<�T��o�����'/���gΕ���a����H9	�r��"�ph0ȅ�x���#�j���H .+s��Y]U�j���m|� �TC�Ud8�[�P?�2��d�u�&8� �y�JX))�ӏ��1$�Pa��c�/Ք*SXM� �����I��M��h(�'0i ��a�k�w���J_ʹ8�e���[ދ-�a��Ĵ����X�[��wRvę���D]�Sj�����*��I��<A�҇}UҴCmYG���Dx� ]�0g��N=�SLu���t�b�*�����G�UY�+ �Ty�F
�5x�}�"Gan܃�V"��#�x��gIA���?����7t^<G� ΰ'~7��E�R�*$M\����H��-y�!���n�f� ��φ캼�Hɫ�!���ң�Ć�4�'c������`~Q�����i�:�ei�C9/�(���H�A1f&��2kX���V_Ӧ4��J4�g`A�/"��	���P@�G{��H��-k-xOs�.IժL��a�t��lF�-��휎J�W����3um��`v���*?C����    ~���7���)2����8�ݲ~ni��Y�K۔%q����
����i<��>ԅ�B�:�35�1�Dނ�"���7�R���,Be*ԩ.�	��J�\т5�4MR t�e��j۟`��� m0��sX��9DX
~�?�I+�Ȱ�1Z�Pa��.�`Y�@X �q ͵V�q菂�$�F�ے����l�`��J�'@��w3V�#�Ri�,��u@X�h��Gm�=ϚUF�	�&tN�W.@_� *�]sgģk�y��x����aU!H�`�-�A?SUY�iݢ6����N�	�Dp��u�A,>��Ok�J�|_���'/�*rZ�i���Ͳ��+���ʦ�������e�� �W�M�fI�fMZ ��A�cc���q�(L����C4���� ,7��؉�`@��w��H��.�����&C V�	�����1�y(���:������/{E*���tӧ,L�Җ�rUr��-�_��Ǩ��`� �p h_l�4Ŝ!Sq c��nVܛ_�i���5��,�ZH��P�4
�Ep���܁�������5�h�En!��yez�����Zu�KN��M�\�K���T$���8��Ӱ�:0/�s'���G�ݦ	�d~�w֒���%ź��OB�q���U$�#k{������f	*"ɻ�
9�/�:kۼi�4�^��~�<oO�r(�_s0E�߻�C����݉��V6Eڸo!sq=����*�"�`n����_��a�?��Ǽ��[LAH�ԋ�]���μ@�y��_�����e���Ai�G�+gIo��9�"Y�EG��zEu�t�O�L��h)*Z��W���*�r���� �`k�
L��'u�U�s)3������럞n%^���� B�%���y����:�����Ps���P��T��d�YYW�E��E��uM���d!ޡ�����U��D�E]�Uͧ��s�E�)�
�����#�NJ��#��[p\�ܬӄ�O[�m��$,��X1�ڴ*!�=,���㣍nz�fdև�-���_�›x&¬Q�!זEH��.���*�������E]f�S_��7��qZ�gYȵȫ�6D���9�'�,
�R
)����>w�O{�J�)���|�8|rn���rtsP�S	?ۣ�Mv��+��N`ˡ��q;|5��vy��]��;���rV)�,��d���d�X�y �Ǩ^��RF]�$ʚ��+�� q�-���U�4U^�����q՗����v��ͽJ�޹��9,��ؔz��� b��C)8�huL!�AJ�8�
$����L?nd+Bgm��d�4-�,������	[T��X�A���$e(��ъ@�H�NB!��s�Ό��H��t��:�*`���D�eՌ� �f+�<�����/P/*�Iw�����i��N���	��Xa�
�iA8so�<7����H��Gdu*~��S��dP�i�&ȁ�������4ϣ�DΙ>~��ceF�G�Qe��ȡ$��\:*bLh�!�km��$�N��()�r�J�X|��.���ٖ�+��Um��% �$C��1�qx2O���[�~S�����-�؜�<=��ö<�`��DЬp8�K��<���vAm�a�|�JXS�b0�s音��BÎ��t�姤R?$���[���Dh�9�[W��T!���:<`?h��5���޴��'K8;n�2m�wE�w_;<�M��� ۄRAL,��P���e�r���g $�.XeC�/�	��o�j�g��@bDFF	]�V+>Q5y��y^E�t$
�-�Ӝ�#!0�P�>��D������7�ځ�eR�-��
?8��VVޡ1��j�E��>�g���a����4ɚ���ol�}g����cO
�kIv�N�;]=%�gV"�1��['����w�2c���0B|���+:����I�٨��4R��{��)��Β��.N�xV��r/���y�k�SIR�mҴ&�3Z�J �c?�� &MN[Gd���h}ˁ��V�D�-d �3�×O��>���p��[4իP�͇�h)���'�UV+��pY�O�A����m��H4�n�'-�ޒ�f%2ryם��%�S�a��tMݶxr�Հ��%Vz9�E��˘<&�ӽ��3k9c3H4&����U=7�3�dp�aI��ҬD�@�������.Ƿ�&`co"��$r� �{>�'�����W�qj �d�	k�T$��*��kVc����b��zҺL����7F�ja�WWw^�-�(���,�?�'Yuϡ߱Sbɥ�3���:w��MN�Na��Q/S�[�N`-m�*)�O�C[bƧS�2�_�<'Qhn�%��`r<'���H��&=��Ƥ��-��X�,|��T�/Ҳ(�i�,y+��6m�V�9z��^���D��-��0gK� _���o�≔��;*�����I<�� w=���[��5�2+��B�U��R	� �B��B�B� ��kb8�Q\��~by��Vϑ�֐��M�6�L_�7B�YG���o�,h�`�@�Tx�{�)�EC�8t��IE��	K��p����he�#�ࠖN��TO�T���%��� ���:Y��5��$�P!���9��>��LTc���?��,_d�#](������6��L3��ML�X���S���INAn��1�_���&�U�e��e�4 D�ˣ=M�-/Fs����O*�=�1�L�%�+0�2y`Ypď/ Ў�R�gM<S��:��G$^<·g9|����I�-w��jtV��uYF/�	;�߻�d0ޯ��k<�'�����k�Xc�u�{�#�^�_�.���45�ZH ������W��Sit�D8��4�-w��B�ۼ������L���Y��e"t��Y�g��y'E^��ؗ!:RQV���@1/�$����/ �CAXh~�^Esn@�Xˁ^A��@�	r����=�O�ȵ�T��e�%.�2��
hq���,�@XZVM���Aǘ��:�'�E
��9R��xg�[��*���OxT�Y��3�D3Im��<���H�#7�Q�&@U�j�J!F�;(�vy�g�O�E_� �-r'��2���ʀ]�&�q��w��ot�=w��!�}��z��� ���9c%@�3'~�y���ff��K+��:%wO��Y]$y���.V/ �x������s�*��S^�I��A���t[ׯ������A�ZYsG��LBH��R�cq[UMVfM[!�1��7�a4�g�#Є7\��2�b�T����(0{�\Q�h<?xG�����!q���@/����;�~��nj��n�!i�2ã�#B�	7�ɹ9��e�|� 83 �M�^㠧�%����c�r���tE��^��n�xܨi�Vu�%��*����jp�:wҞ��tc|�vf�!��ieF��p�A�Q�G��?M���H����E�<���N����F�ly��e�&5��ѫ���7]@��Q#�V�}^�dB'D��[i<�zR�a�C�|%���M�k�s�w.��% [��S
��L���p��7�lI�Wm�"�p�=
��Ԥ�Zn��$��1T����Z˽�i�v����ծ'�J8���(��ȋ�����A���@�(���m2GʗK%e�E���o��`�	׹
Ҋw��azvR�t|ne\�]��i����4��6.
H�Q�k��A�G�-�CR�yY�Y�"_L��ob�#�2/�X(S�sq*�^X�4K��!`���w8y��"��ߺ��V���5]�z\��Jq(�`� �$)��� np�8B��9O�~���8O��-���:?[�B� �,ŗ޸+ZG#��@�A���Cj�"����x<J6� ���=f�y��!�gX �D�tj.��NF܇�Uc�'Ň5+��p�`'���W�ܟ��$m��9��ݴjF}eYgE���
z���Թ���v�����ɟ>�ې�2xLr[�G�tZ/P��e6<�6�>/x���&���M��++��u|Zd�v�ey[Ji.͚:��fO�����v��t���@�l j  B����Z//'i�(UkN�v�O�/���m�5n�&�v��lZ?OL�����׀�n���!B��9���:6ry9WE��`z�a뮬�c���M x��O%:��-iƖ����%-��:�ڼ�
�3z��Zԗ�%��_X��$k��Ǟ��Jnxl\ny�f�KЗ���v�T�Gq��1�
��(m�$'�I�i�-�P�2?npN���d���K�wB3��Q� �"��iqC)��ƕrJ�[���t�a��}���ׄW��[�6���$2/*Ҧ�Zd#�������t�!���.��6�k�R����y
S�:#[���&����h|g���;�����*�`������/�G      �      x��\�v�F�}��?�<ؗ~�Hj�DI%���yIV%UUe,�诟X3T��ݶ�ĥ�̌���F��>j��h�L��M�[3��p4]o�y������S7����v��e�u�n����#|y4s7�O÷�96�ow��)��a��E�ь���1��ɎK?�����<�H<���n��~�.�;�����t��)~��y6�=ŏ���'��E�FY�%�J�%M���β����o��nںJ�<ɲ6�n;�]��7_�kz��h����[����p�p��m�w'[����/_�v�;ccx��0����������S_q]����zhp'q����>��C>��f��bc��-�����a�����wSw���q�����J��L���8<\ğv������7������?�v�/
�r�Lsp°����s� F'x���%���	���#�?ҭ��v�b*�7�Z0,8w��j7�0���{x�x��t�-[R�QTMҶU��YVꖘ}�ڌ��)�C
��V�w��l0��=��ޑ���ɓ���t���D[��� �����i،+�ys/��{mxG�{8z�v�s8�E6}�BKZhV%M��I]Utk�}�l|5v�];x�^wy�����F��i]��XC�v�9wD�a=��D�!����g�l�_�G[�[t6+�a{��6���氲�*ʬΒ2� ����V�͎����xzoNb�'�a��5|�{X�%����-��d&ؗ�\�dO�������!|aǮ������g��t�v������f:k|�\C�i����E��Y^�U^��)�<�ⷝ=��ͱ��O�q�O�Cd��i3���|���3����>�C�v�!ޝ��c�9�ɂ�N�gw��?�������np�E	ޛ�m��m�<��Ư{��b��h����X�������Ԃ��3�3,�A'Ih�(!�oP"<����|v��l�N���Q��/�7K�k;�[V�-8n��-Koq�-$��M��ȋ2z;>�sL�3�v���vG�[��0/h�.2�E���-}
��:�Qt��ô%�������@���4�p�&�GnY��ɷ)���iڬ(���l��?ſ�~�C�}�`�Wwql�x��/�*�,�:�ä{vQ�3}�~pmdl�ݡ��n���`�?Kj q[�a��6%���M� �I�4���#�������[���<'͋]5wt`b�&���x���#���c�5�7fzk�\�0�m|��]d+�̓x�=���M�%���YӦy�TU���"H���>�/��Dw8�OD������߃��9z�9���f~eB)��d�1��L��r�C�|���$K��B�%8����fu���gh�ݲ�*@nm	�J��=<��s���_ ����jp�s$�)�y�V���,O���#aWD=�8�;THP=>��H�,k��g$!rf�غ)���Ϊ*M��~R�Utu4pb�͓���1h�G{��#&�FM��Q��.O�8��݂ ��7���R,7��;o����O^��� �)��҇�a)�ٴ݊&k�5u�V�`��1��vO�݀��2�R����5���1��ĭ�9���=0):�=�s�aܰry�=$&fc�|�UU�x��G�ڧ�`���������'/�aSdR�
�CЉ�K��zّ9#<��t�>�u;���^Vy^l�r>�_"��@� fG(�mڂ�-�)��I�����1
�{:t`y=�7�<h��WA|��]x��5"�Vd��9��إ/��z|�Ǆ�P�пia��J��i�g��2����5p�H�#��D/����������Ai��D�RPBAT��_k,Rn8R91<-�_˘�eqm�%D�=CV�������n�$�r�Yh�eS�	p��6��������=���i��A��xI�(@[��1���2
	裤n�:�V�2��cD'� lRU^l��ey��Z�O6_����ktQi�8��	hu�ƜyWiv�ט��;���C?:�Y�b^����g��.�I	BY�z	oZ&!��U��e޶����	@��͸?�V(T�s�k��ʰXk�����+�	4 �yL6E�ɒ�0`N�vK��Z�ԧp��X�MݲXB^Y]7U��IQ�I�����0��`6Y~z��K�8D�NSq��ۤ���<�vL�5�Ͳ��qX�D4���Y8������VN8���L���N!����'�X�<i� ����Z|��[�� ��-�U��O������p)2���>i��O�u("���� �Kx�� �����D�I]�����~��Ԉ?�`�J�jI�����'
[�j��8�&Np{�2JVz��Tr˜���^���-�Ţ��	�X��qR���cC�@��	��#6"����H�q$�㞱C�!������s6-�b�,�)�&-�4�@$�v��F7�f+I��r���8�"F�%�㖼��XsMW�8��) ʝ|'��w��/Qc)�>���7m���R��`�i]��}�ng�nw +@���*��7;�#�ԍ0�):�yy��@�`�{dF��qx��V✓M�Y8���v)�c�?���� hlӾ��pf�l�5 /@.!�a ���w���[d���f��������:-�-AT�&��W|�*�
fPI%��ї9!D�
/���lZ9��pGRU��E��F���{Fw�nVb6X$��%�q��@I��,|�A�?��b�L�qE�t��<���l�0+#��;[ǹ4ZnM�9.8�>��U����p�7JX�p59
X��w"Zh�A��w�?o��6�у�=�sp�<��������V���6y[VIRf��9%]g��]��2>�(d
%yռ0 �!E�3Z��g��Fg
9+�gS瓸ӄ�J�QVB̑��s���6_�	w%���L��������70�i�uI�U+����Qw��C��d�X� :C��c����/3c�GT(Չ1�h��Up� ��&c(۴fB\H~�����5�4�>	����PH�d��VMڍ#�����L5������PԚ�Z�jC&g(:j�gDM�Bp-�_�ڲzV�ʢ�˦-���g�Ȑ=��} fE�V ��Td&@c��X���,�w�a{dT�\�9zvH�W��'�[R�T��P��i��۲�l�4�˦���S�3#`�?-"6�M�#�?=�(q�b��=A���y�>�XN� V"%,��(Ƕ`6��?[��2�Yn�	�����s�+��w����˸"a!���x����@�S���1����q�\c��,R^�+-�%Lq��:�$!��1����*K���1���MҶʋ"z3u{x<�&6P��\v
���8 d"e��0B@���,G���L�q�����0�|NӋX�lZ2��
`JYf��B-�l�<����3d������ �cA�h��+�n%�-m9��̓p±nYsnX���� �%����Ղ�Ҧ!�V%���Q|������=|���*;W^M�]fuL�
5�i�, ���EX��?."c�W���m6���!��"��2;a�M����r	���^Z�u��oƧ��} |}]g%�ԾN���G�A)U��\d�������7��a|
8�C��4n��w�&Z�~V ΫJ�U�F/-mvC�i��ô �`�NW�9�ӛY�� '�K�.wk��&���A&Ň�i8�ț�����[ZՀdҲE�����>t3ߢ��O��ɍu(x{�J�1���G'|M�N���z$�/��(��1�55&��q�'z�e��y��9�4vU'�z�kkz��N�CTN94d6)�~������*\��s-cO��R�}�[�b��M
\�~�!��	�	d���i+ځWcޯ���ItQ�ğ�q�n�˽��"��A�ce�v��7l��(��qGP�������8��/��A���C���NX0���*M�̊��~'`��A�Y��g2���;!    *|���IW�Q*j�JZ]7�v��.R��޴<Bo�8��y�h�l�}'�V���gP�T^!�C_�k��b2�(�a����Zz|�tI�[�\��<�ܑ��i�5w��E��	 �� u�����(-c#�N�2��;����BNB�0J]R�a�j���'%�g�JB�������� �SQ�rb���KX��e^M˴.IO~̤Ǧ�n���S|{Mer�2�^����?D��
$�W
c����d�
:|�C�8 A��CA|f�Zwe5xl�' �Y=��L�=~;���@��w�DM�REc�W")N�}h(Bwm8�kgq�>@4A�c���d�\����� +-����Ķ��
�]w�St�������Ėt"j&�(Ng�N���^Cǹp~֢��tcO�����h̛V��bM�@�8�6U�ٜ���ă��"� ��9���ugp�~*������B�5Yv�f��:�V^"n�������a���ف��y����2c��@6��m�&�������v��������1dځ�F� ��]3��W��3�$aC$è�f�t2-l��N=�2�\t0��Q�w�.�SvI�,-�a�L�|�����Ej#��R#yV�t�G���&!�&����Ka��i��)�/M�>O
�p(@xȶ����XS�u��N�"z����;��>r��q���!5d｝;&�S{ʀ����
�a6ZP�$�J�3K-�P� ���Z�o�eJQ�ʤI�(Xʝᯇ3v��[�q[ᝌ��AkS)�$�&�x�M��aw���`���j�~����]G�7-� [�6y��Y�`+��;@W䪔�h�e���Wy	:�v=H�ɉ�4|��OX&�`M�.)�VlPxe�n��u��J��y�5�����Y�$���=���т�kMܽ$�
(���׮�g?|m$�F�>���xVY94*�V��sHH82��u�,��[^ �l��Ȱ'�p7 �W��4��eP�c��i܆_���!��4�S�½b��=~�����%A�h�,'�i�J[�ԫ�&-�$O��=b_��#v~�q�t���H�v�TIK��{����b\[/���cQ�&Ʌ7��适 
��K�ٹ�ΰSB��&DW�k[8�6O��:�v����Ư��<�q� ��XW��"!�x�|t<����&Y��|���F,_�)��g�O�8Ӗ����U��5#�W�S�X�a�-F�M'�'�����ʄ\)���b�pXCW|��#H���t?n���*̢�B��e�ښ`6��e)N������ȵr���)Tbפl�F�N�����`�E'�;��w�^C��T�}(�(�q�ū���{�4oXn�)-��j!�5m�ڎ��w����g;FnT��\���&��uU ��r�Fq؜�z!4�*����> �h�'ʰ��
D�-�"L�dY�$ظ��#N-��v�.��d�Aߢ�oG.C�N��=�4�Ϧ9,�K��K]q��J�-Ln�4@��Td�u��K�ᐴ�E����B3[�7�G<`B ��
,�h��[�s�ͺn �w�y��"z��0��T����$@S%39�����?q�M�@�-m!y�USbK$4�/�� �p�����m=��F��a3�����5�Z	FW�t	�jB��$�"�y	�d$|��E���Jrݴt�ie�V@G�<�!�����gw���V��'����ҘA/6#�P	�Y�������-����%�s(��� �o���7Լa3��@I�HS�79D�e��?�~��i^�����;�b)V�5���I��4kC����	�����K��!4yr!��;_Vش�� zZ)ă)M����vu.a#55�p4P)�!��k�WI}��f#���$��#��A��E����fa�m�V��Hkyަe�B���<r>��H;�Z��F%��5{�Y<��x�}g�/���Ls��-���^�H��J1���l+��)�NTy����`����������Ò��N��A�X�'ר��[� Sp�5m��QM����|�öQt����"kڢ��f�_����o����	��R/�ј����U���G��ى�:�d�|��:���V�����"��:o�wl�Jn� � �� ���6	d�� HQ��C�x�����)�[�$OwCp�4�-xS��OSk��O�--˦�U'E�D�H7t�Y������9�Ü��b��Q	m��A4o�/���6�IP~���p�5VI�,ɱ��ɋ��} <�.`���)��`�ps>�AV^���cOlMH)7L_��f0~z����n��.�0@�DGƶlC����NK0�6ze��74�h�x�ij���D��B�)\��"A-��K�)]�M�U.�u���'�T�;ՠ�)-��7jfu͔2Q��Y��^�2��#���%����r��BБI� -�A+�P��,��p��62O��k��,B�`	��p���a�<�� ܨ+0�ɢ˱C�L��n���r���i�A�-�g�7J���ZR����B�}S�vM�����!1���g�ZT�6�.��j�,�}�:s��SO��Yi��:`�\IY?����F��������FR�q͸��*a��/s�B���,ڰH!m��,�~_�O �f ��	�=Ϧ+�V{XF3^ݺf�@��6t����q1R�����@�ˢDC{XәM��.�&I�)�� ���, �ؽ����2Qi�+@�[f�r�oo�R(��	����\���vz����7���̲4k��I�_tm��޷ñ�t�;����fx�{���q	�[�"�zo�V�
e :H�3�B�cu�k��n��~�&��%���QR�} v�#��P���jVs�[ �����No=��BJ�7����Vߐ)�����C.dz�ȋ<)�"IEݾ:��V�q�y�^ ���ԃ�Pj@��KY����xF`�z2�]v���\� ��wa!��`�pH�J�?�e+��m��j���1Z.p�ێ�6�+Q��(���8W�����l	j}Q�*�F�̆�`ɭ`�/p@$�
��,-�nO�ۗ�l���J�&Ok�Ue�X��'�D7�K��OS \Ұ�	�*uTĻ�����Ε5<CY]���0w�G���>��y���ۼ�N�2��,��x�s x%�ƌL�oq�$#�.<�PA��z���L�2�	�#��>�>�/XGJ��ڝ�����[��,ɲ���:��*zN���� ����c]�aws���h"���r�C��N�r���n%�I	�h��@���n�a�ϒh�iͭ�fE�*��zx:z��~
�xp�{B��%��]��H�;��~�"|5�ȟr{����. �B�1l�b��#]�4�-p�����d,ڦL����|N��ߝ:�-'z���}�,�q�b��e���e<9��Lفp鐼sR�Ly�:�֝�������Mo�2���V@۪-��I��e) c◐�&ª���/�n��Vd�VG��IQ)�\-뫜�_�p��V��Q�8�۲ ,+M��Ȳ�׈b	`�w]��f����!�a�����0�`O;��w��Hm���K�8M��9�olksn���\E��m���-6##��,�Q��VH��n���<��P�Ku��owc��[t��X����e�n���M�T�v����,�6�&o�r��G���ng��Ρ��K�x<P�*���&8d'�sKf�e�q:�qT�����6��w[�"$��]��7	|�"���qx�V�kC��q�XgR����!\��I���pW��p#��t�a�PG�}���h��B��6o�X�S��'e�2�x7��=�_�;V���S��}r���w�1�I0+�k4������_�K�kub��X�
(=	�y�۪���d�:��*�Q���Sa;�v�S��V�@H�iUtַlauAё�]zӐ��"��8N��l�
'��-'��^�M�3�	 ��$��y���t����!膟t��@���5)�f �   �jli/ҫ��S�^V���E����.v���D%k	{�?���9�^� ]�b���a�9T���s�"�2���ͷ
��Ő��}���)��IB�?�`�<�������N"�8X����e�M��RԀ��H�,P8���GO�G�D����)s����/4gB!�5���`}pM��/#M�\�&G��V�[N����~�0ޟ=            x������ � �      �      x������ � �            x������ � �            x������ � �            x������ � �      �      x��\MW�H�]����-���w�mc���̜�I�Ҕ�*�Zn3��݈HIY4,4��6�
EF�{�#�����?���{՘�Wӷ��ۮ?۶c3t����,�"ޔE�*��8�Dz���������^�%�{?�+����ჵ��|5C�5MxQxe0��_��=}�|\��q�����.��L���c�W���}s�T�~4Me�rL��R����{�5x?�����h_�7U��6�΋?;�{?\�L�T������ΣU?����}�O��k��7�y�G':+�M��
��vܚ�v��G����:H�۫�aܽ*/�/�?��28o�ƪ��p@���6:���,n΃��q4��+|?V�}�#�J��Y��I�#.΃ӆ_ڃM��f[��*-
��u������M'E���h�����i�Óm����?����z��,�}4}���۵�م�@�V�j06l���=�8T�cڟ!���p��mǯ�'Ug����0�HP��k�(N�2O�(������6�m�]p5�=��3���P�����Me���i��v���m���x����[��I�V�!b�(NU���mc@黪���!DR��j���:�<��X��څd�9��7�#���V{�������YVf�Fk��ѿae.@��Ǯ�,O�����mڣ���U�P���s�!�'��p�6��s4�؅Ƕ�q?�z<��>C��?�-�V��������Z����ZmT�F����~�b�m���؛���ٶ�Up>��v'���¯�6-�6�6[k��y��ն"�zp6����~lq�^O�7.�.�2Ɠ"c�"
nl_����d;
{���l�$��hw8���$`�@� Ӑx������_�,��"�38IK�D��ܬ9�.V	�b�,<����	?wMp�r��qK�"f��Y\G�^�G�����Y`�#��)d�u�4e�� r�&�����3đ#<AQDy�%����v�"v���<X����y��1�v_v;��9̱+�)�/�pt��E=�,}mOQ�\w��'Y��T#ރ[��-���j�W����A"���^��v7i��߁([^v��q��nt�Ύo�� (K�ee��(�]��PPu��y2��:�BОx����g\����z��k�{M�28#��~6�<�Q)��'.@�ٙfEYI����XWM�y�5v�`F��9/P�v;�F������H�a�/�@0ϼ��'����N��j�ә�~i�#��".���i������&*�?��o3���q[��pΣAI��o�S�� v4�'E��^O�M����1��H�,/	�΄���9���r3JCy��O?q0����jw�?g0�����G(uT^a=3)pEGd���d�����_�p`���8���0�Cl�P�\���6f��&E��1�OT�GQF�:��դ0�w(��8v�h�)6�	ǅ�Y��� 89�Э�a���aQ�R5'4TƱޔI��<c&�H�"
j�h�1�3tU�1���t�l'D�s��t�F��L���O�FCb�=6"c Uˡ�P�+�i�V�8iR��2�t�#����O]��)�ݹ�7���>,W�WI�8u�٦r���_Im\�$Uq�S�]�_���v��V%���gA��a28�Da�&�%�)��<"��=9~�����Jf���^-�|�>��<7m�؛xw2����r��P���{�!�RQ5���8��Z@̃�5��0j�J'	�S���iL��<�>�}t`�N�J��%���6)�̎�և���%�����F��B�'r Z��f�B] ���+��{�u��F�B'�A�#�J�H��\.�oс$��Bl�9���ʒ(�$Y�*D���98")A~=<�k��n8��	�g=ݏ��c5Lqj�i�WR'�g�%���:\��9N���B���~M��F��Q�)�aM�p8����ǡm&	�9_nL=ᮮ�1�።�!�v{'EA(]�R;�EAP�����{�n�+h���ɱշUsFg k;��yXi�c�[�alzۉy��(�5d���y��Z�B#]��������ɀO��H3s1�q��,�U�����%��6���]���0�X�����΁�P1��x�_�Z*c'8v��ȅ'����e7�[@i;q�h	�&/�U9���,��dϡ�wЂ�j�S?t�!��j�P-��(JL�a�;<N?'W�Ǻ�b��)���P�s+����M��2JR�Yi�a���P}����$ά!V�� b�Ӎ�d	_&ť�䞳9�$Ku�)�U��*�d��P�O
=W�O;-ގ��o�=|�Έ��_d�\.���$��gu@�2>;�<�����^D"�{}�' ?F�N .F��i
�}UCfT����w�}��X��yxճ�;i���;�g\�XeS^U��(��%2���n~�������Eq��2M�}s"'��5�<����'�W�5��J՗	Ռ���R����y��l��톀;FK�e����@��^ʍ�h�n�8
��;��*�K]��-�����hy��0�}Ee\@�fZ��Ul)��{<M�b��=���@c;��o'@���n�ڞc��H�M��*E�\2 �K��n�GC�s��T�g��s���ɥ<y5C� ^eN'~��#��'M#H�5f2	���:U�0Ñ ��U��I�$H�3��^d���ؠ��r#`�N�OOj���M����)S�*K ;$Tk|4�#�>��x���8��h�>۾���g����b�`���鸤̂i\��&�S���]��:)\b��ДM/Z��(\�۟~!��+�(�H\��>iqee^lPI�i�fR�E��>��XND��ð��~ŝ���&��S���JN�F,�������EzM���H��\z��F�(Q
ziG����m��s+���#I�az�R��N"�;�%c�=sذ��{�.�P��1^��Q��)��?���:�������a����%i����v������uo�$��g#wKK��#B��陃/�����������L3��O�� #�|���`�\[NW߿f�Zz�4d�5.îуM{���r�tob��&3_�I�E����ݳ�'������Aw�	������R��|��I�ƄpJ�M�5M�,h��(|{Z&`�<�����SU2,N
�]H� �qc�"ƫr\"KD�>���7zḟ*��2O�b����Seq��P���k@�'�O�푺��!U���;K��|鈞D�$T��:��8��������1ժ�t5V���y�Q��B���{���")���\�Jy����
M�t;OW���4n�ċ/]�^5qɘ6�\���P�B��(w+��|Dݙ�a������
�%j%���<g�\�:���r���kC��QJ�Ŕ��I���<�7-R�&����+xE�@	����B��j��n�S�$����٦��56�̥)�3�%��	?���p�<�tA:���a�%��q��H�nɽ&����W��^h��kB%�*��Bi	
��=o
�ʩ!Oô�r#�K?��i+������/[�����p �p9�����M	�_c8g�h�#��/.�k��v�7R����*8x~��w�K��Q����'��h\J����5��t��E��J@��d�^����`|�b}��Qʬڟ�e{	&�:���7ɏ|י����ˇ��sS�Q����<�u�V�*�c��"�;�A	��&S�*�eӦ�P ɩ4�բ䥪��`�]�t�&����~� `ѣB	L� fi�->ux<C!�`h��2TF�eV�E���������%�1�'9t�q�ʋ�7\�.�,�: ���\�=��ݾn&��BD�i��p�UHk�H������=Yo2.0L��Ҏ7�BYi'��=
㦇[7��~�l�-&�e�2h���K���8,�v(�	�H���.͋n������ A
  s��~�礬��Ť��csMū���0��2+�SG��wp�p�( "���p�o��XW[<�Ӹ��9E�3=�'y�S�Q��R�Sa�Ԙ���FŴ#D<�ᇥI�d�2߬1T��n�i��ЩT܋�Y�e+�PjU������5%1��j��m���g[�2iY@��S]y%�*sPOVLcx�Ԥ�$�)j] J����"�5B��W�u�_���% �B(j�$mۃT.˂�"�x�H��=l��'C[�"k,eF�rǅ��Y<m\�7�A���#�����<`��O�+4b:�I(.���J�t8��,6(�V�(�X�j�#�k|�M�4�PCD�c>x���� ��� +a�0þ���D��uz�t�����4�Wmo�|%�}������6ܘ�鯶�n .[�N���@p�a�L23��fzZ���(r�Ŵѣ�,���	&>��_o�;�r;Swћ��[l�RJ�@�:}$��&���c�L�Xq�~f�,�Q�:G�~aGx�>ښ���"n�^s�L�2�,�b�TRMK�G�|�E�gINW���|eX����\�W�PZ�ݐ��-��y��4�[͠��6`s�C��|H�5����,G}���5�,�����{jj@�9�\�O�u��X��d�1�=��]�M{�a'��(�V-ƔRߩ� �e9ޡ������9�h��u�Rn�*��L����z�Q7��J�T�㍢��
�ʲ�r	���:Ώj�3"8��ޙ�M��6'�����i�Q�=
Ty�w�^�S�TQ'�%M6IQ���2v0��ց���?�mp���e ;I,rϋ\��[��2�:�	�R�*㤢�s��a�+ToH���ن�25�)�]c$,_�t����Ř�UǪ�N��~u�i�Q�^�//S)u�DZ�e���i�y_p��(�J_��]8�����r1#�����"�$�*_EF�J�MT�Z�.e9q�i�GQp^۟&����Aݍ����A�X	w�	+�E�.J�fQt^ӽ�5�J]��J�=|{@�Z(�/-M-y�����\)��c5���eFf�nO;�k4�[��H�gQ`�5�F�\�P��E��5��讪���{��x22��O���#B�K"��e!@>���U�*(d8���:�DJ�z��>��~���d�<�j�%(V��\�e���L#W�.:�4tv��U<�]�Be��q%zZ��آ2jl0�\i��g����\U�U�s;Լ(5xj��:���(�����MI�i�֘૿��x;3� Ic�q���/��JM' ��[�|7y��l��+Z]L�gtk�E[��ҭ��p�6tאO��O��)D�ծb!4o@Ho������n�x!k�D�d0�fZ�� mNp��л݀�D�<�~񎻲�1"�S�HSfB���/��Q�BD��&�u"b����8�2��=��0��78j�opG�;o�s[x8��nd��q����[�En����A�� ��(k--P�ɦkY�v��9�E��M��6��8��O�:(�/��LO*3��a*�֓p�$���*��gk�f�T:���Tp��DJؿ��i?�B�By�X���|ŵ�2^��n��X$���̊M���!�� ��ƶ�}n�z�;�=��ȩ;��޺���|�S��'�"f��b���q���U����t7� &ᛎ�\��\c�@�@�#X\��(S���
]�����ҏ*2�B��Z+�L��!���y
�9�+�;g㨱9]א۹�4G��2�\6�eF����f�u���<�n�y �īF�Z;mU�$O����9�O���u�l7.�/6��K)F��ө�,`�m+�H��6�kȓ��qU�8P8�Q�L��H���#���t��'oư���-B7w�Kޅ��6��j]k����)y�$Is.��5ٷ�#�N����p�[����t#a�Y�U��BȤ!����b��H�F�窈r��|��|Ľm۹�c���0mGLۀ�c�Y������D*�:)�cȻ,n�36|o�=��WI�xy���ܢ���E�r��$W]KSQ*�M���~P���C�|��߾��=��Y;	^_j�"�Y��wD�;��ȳ�W�����@��B*bN�#pALw�U8��幣[�7����I�1����vR��MrעEDȕ	b�Z�q�'{�9}���l� ��4��h\�������K��6mz�s�=�T�y>�{^�t]:>����ɪ�~*���2/U�h�"�������|��~��E;��,�Hw��||i��ROHC��{$B��T��$�(��;��I���CH����G�n�:�M-nF����]�X�y���:��iiW��)��z�{�vOv@ x���Ҭ�]E���U�I!�{/����ÿr�>O�h��
��\�Ҩ/*��v2�Pl��z�P�\�m"�p�� �����r����P0Ѫ�V�d)5Ҕ�<qU?�t�Y���tuC���?^�ʒ�~��V�W�N�:�+�8�U]P��fЃ����D
�����Ե}���O�ϭ��|����T��-������c�|�ϳ�:�P[�5��5#��;��_�u�1�            x������ � �      �      x������ � �      	      x������ � �            x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     