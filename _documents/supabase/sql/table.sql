SET search_path = sample;

CREATE TABLE t_users(
    id uuid,
    name text DEFAULT '' NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id) REFERENCES auth.users(id) ON DELETE CASCADE
);

CREATE TABLE t_tasks(
    id uuid,
    user_id uuid NOT NULL,
    title text DEFAULT '' NOT NULL,
    done boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES t_users(id) ON DELETE CASCADE
);

CREATE TABLE m_tasks(
    id integer,
    title text NOT NULL,
    PRIMARY KEY(id)
);
