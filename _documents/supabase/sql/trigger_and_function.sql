-- 初期設定
CREATE OR REPLACE FUNCTION initialization()
RETURNS trigger
LANGUAGE plpgsql
SECURITY definer
AS $$
BEGIN
    -- ユーザデータを追加
    INSERT INTO users(id, user_name)
    VALUES (new.id, 'ユーザ');

    RETURN new;
END;
$$;

-- 新規登録したとき
CREATE TRIGGER on_auth_user_created
AFTER INSERT ON auth.users
FOR EACH ROW EXECUTE FUNCTION initialization();

-- ランダムに問題を10個取得
CREATE OR REPLACE FUNCTION get_random_question_ids()
RETURNS text[]
LANGUAGE plpgsql
SECURITY definer
AS $$
DECLARE
    result text[];
BEGIN
    SELECT ARRAY_AGG(question_id) INTO result
    FROM questions
    ORDER BY random()
    LIMIT 10;
    RETURN result;
END;
$$;

-- 問題を更新したとき
-- CREATE TRIGGER on_question_updated
-- before update on questions
-- FOR EACH ROW EXECUTE FUNCTION extensions.moddatetime(updated_at);
