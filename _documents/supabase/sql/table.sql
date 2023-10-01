-- ユーザ
CREATE TABLE users(
    user_id uuid,
    user_name text DEFAULT '' NOT NULL,
    PRIMARY KEY(user_id),
    FOREIGN KEY(user_id) REFERENCES auth.users(id) ON DELETE CASCADE
);

-- ジャンル
CREATE TABLE genres(
    genre_id uuid,
    genre_name text NOT NULL,
    PRIMARY KEY(genre_id)
);

-- 問題
CREATE TABLE questions(
    question_id uuid,
    user_id uuid NOT NULL,
    title text NOT NULL,
    answer text NOT NULL,
    genre_id uuid NOT NULL,
    PRIMARY KEY(question_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY(genre_id) REFERENCES genres(genre_id) ON DELETE CASCADE
);

-- 解答例
CREATE TABLE answer_texts(
    question_id uuid,
    answer_text text,
    PRIMARY KEY(question_id, answer_text),
    FOREIGN KEY(question_id) REFERENCES questions(question_id) ON DELETE CASCADE
);

-- 部屋
CREATE TABLE match_rooms(
    match_room_id uuid,
    owner_id uuid NOT NULL,
    invitation_id text NOT NULL,
    is_start boolean DEFAULT false NOT NULL,
    PRIMARY KEY(match_room_id),
    FOREIGN KEY(owner_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- メンバ
CREATE TABLE match_room_members(
    match_room_id uuid,
    user_id uuid,
    PRIMARY KEY(match_room_id, user_id),
    FOREIGN KEY(match_room_id) REFERENCES match_rooms(match_room_id) ON DELETE CASCADE,
    FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 出題
CREATE TABLE match_room_questions(
    match_room_question_id uuid,
    match_room_id uuid NOT NULL,
    question_id uuid NOT NULL,
    order_num integer NOT NULL,
    PRIMARY KEY(match_room_question_id),
    FOREIGN KEY(match_room_id) REFERENCES match_rooms(match_room_id) ON DELETE CASCADE,
    FOREIGN KEY(question_id) REFERENCES questions(question_id) ON DELETE CASCADE
);

-- ユーザ解答
CREATE TABLE user_answers(
    user_answer_id uuid,
    match_room_question_id uuid NOT NULL,
    user_id uuid NOT NULL,
    title text NOT NULL,
    answer text NOT NULL,
    user_answer text DEFAULT '' NOT NULL,
    duration_taken_to_answer numeric NOT NULL,
    is_correct boolean NOT NULL,
    answered_at timestamp with time zone NOT NULL,
    PRIMARY KEY(user_answer_id),
    FOREIGN KEY(match_room_question_id) REFERENCES match_room_questions(match_room_question_id) ON DELETE CASCADE,
    FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
