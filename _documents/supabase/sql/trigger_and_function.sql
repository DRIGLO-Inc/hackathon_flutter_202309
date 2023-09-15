SET search_path = sample;

-- 初期設定
CREATE FUNCTION initialization()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = sample
AS $$
BEGIN
    -- ユーザデータを追加
    INSERT INTO t_users(id)
    VALUES (new.id);

    -- 初期タスクを追加
    INSERT INTO t_tasks(id, user_id, title, done)
    SELECT gen_random_uuid(), new.id, title, false
    FROM m_tasks;

    RETURN new;
END;
$$;

-- 新規登録したとき
CREATE TRIGGER on_auth_user_created
AFTER INSERT ON auth.users
FOR EACH ROW EXECUTE FUNCTION initialization();

-- ユーザ情報を更新したとき
CREATE TRIGGER on_user_updated
before update on t_users
FOR EACH ROW EXECUTE FUNCTION extensions.moddatetime(updated_at);

-- タスクを更新したとき
CREATE TRIGGER on_task_updated
before update on t_tasks
FOR EACH ROW EXECUTE FUNCTION extensions.moddatetime(updated_at);
