SET search_path = sample;

ALTER TABLE t_users ENABLE ROW LEVEL SECURITY;
ALTER TABLE t_tasks ENABLE ROW LEVEL SECURITY;
ALTER TABLE m_tasks ENABLE ROW LEVEL SECURITY;

-- T ユーザ
CREATE POLICY "ALL (USER SELF)"
ON t_users
FOR ALL
TO authenticated
USING (auth.uid() = id);

-- T タスク
CREATE POLICY "ALL (USER SELF)"
ON t_tasks
FOR ALL
TO authenticated
USING (auth.uid() = user_id);

-- M タスク
CREATE POLICY "SELECT (AUTH USER)"
ON m_tasks
FOR SELECT
TO authenticated
USING (true);

CREATE POLICY "INSERT (DRIGLO)"
ON m_tasks
FOR INSERT
TO authenticated
WITH CHECK ("right"((auth.jwt() ->> 'email'::text), 11) = '@driglo.net'::text);

CREATE POLICY "UPDATE (DRIGLO)"
ON m_tasks
FOR UPDATE
TO authenticated
USING ("right"((auth.jwt() ->> 'email'::text), 11) = '@driglo.net'::text);

CREATE POLICY "DELETE (DRIGLO)"
ON m_tasks
FOR DELETE
TO authenticated
USING ("right"((auth.jwt() ->> 'email'::text), 11) = '@driglo.net'::text);
