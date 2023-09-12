SET search_path = sample;

CREATE VIEW v_tasks
WITH (security_invoker = on) AS
SELECT t.id, t.title
FROM t_tasks as t;
