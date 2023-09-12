-- スキーマに対する権限
GRANT USAGE ON SCHEMA sample TO anon, authenticated;

-- テーブルに対する権限
GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA sample
TO anon, authenticated;

SET search_path = sample;

-- ビューに対する権限
GRANT SELECT ON v_tasks
TO authenticated;

-- リアルタイム機能の設定
ALTER publication supabase_realtime ADD TABLE t_tasks;
