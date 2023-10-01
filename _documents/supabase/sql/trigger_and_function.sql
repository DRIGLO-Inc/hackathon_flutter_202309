-- 初期設定
CREATE FUNCTION initialization()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
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

-- 問題を更新したとき
-- CREATE TRIGGER on_question_updated
-- before update on questions
-- FOR EACH ROW EXECUTE FUNCTION extensions.moddatetime(updated_at);
