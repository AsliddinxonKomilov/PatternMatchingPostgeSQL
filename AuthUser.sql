-- Table: public.authuser

-- DROP TABLE IF EXISTS public.authuser;

CREATE TABLE IF NOT EXISTS public.authuser
(
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    full_name character varying COLLATE pg_catalog."default" NOT NULL,
    email character varying COLLATE pg_catalog."default",
    phone character varying COLLATE pg_catalog."default",
    password character varying COLLATE pg_catalog."default",
    CONSTRAINT authuser_pkey PRIMARY KEY (id),
    CONSTRAINT authuser_email_check CHECK (email::text ~* '^[a-z0-9]{4,20}@[a-z]{2,10}\.[a-z]{2,10}$'::text),
    CONSTRAINT authuser_password_check CHECK (password::text ~ '[a-z]'::text AND password::text ~ '[A-Z]'::text AND password::text ~ '[0-9]'::text AND password::text ~ '[@#$%()]'::text AND length(password::text) >= 8),
    CONSTRAINT authuser_phone_check CHECK (phone::text ~* '^\+998(33|71|77|88|90|91|93|94|95|97|99)[0-9]{7}$'::text)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.authuser
    OWNER to postgres;
