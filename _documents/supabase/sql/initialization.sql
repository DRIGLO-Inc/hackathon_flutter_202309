-- タイムゾーンの設定
ALTER DATABASE postgres SET timezone TO 'UTC';

-- 拡張機能の追加
CREATE EXTENSION IF NOT EXISTS moddatetime SCHEMA extensions;

-- スキーマの追加
CREATE SCHEMA sample;
