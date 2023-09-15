
# 索引
| ファイル名 | 概要 |
| :--: | :--: |
| [initialization.sql](./sql/initialization.sql) | 初期設定 |
| [table.sql](./sql/table.sql) | テーブル作成 |
| [table_rls.sql](./sql/table_rls.sql) | テーブル RLS 設定 |
| [trigger_and_function.sql](./sql/trigger_and_function.sql) | トリガ & 関数の作成 |
| [view.sql](./sql/view.sql) | ビュー作成 |
| [storage_rls.sql](./sql/storage_rls.sql) | Storage RLS 設定 |
| [others.sql](./sql/others.sql) | その他 |

# テーブルの命名規則
マスタデータの接頭辞 `m_`
トランザクションデータの接頭辞 `t_`
（Supabase のダッシュボードでは名前順でテーブルが並ぶため）

# 注意点
- [ ] スキーマ/テーブル/ビューの作成後は権限を正しく設定し直す
- public **以外**のスキーマを使用するとき
   - 以下2点の設定が必要
      - [ ]  Settings > API > API settings > Exposed schemas
      - [ ]  Settings > API > API settings > Extra search path
   - スキーマ内のオブジェクトに対するクエリは先頭に `SET search_path = (スキーマ名)` を付ける

# RLS
| 用語 | 意味|
| :--: | :--: |
| ANYONE | 誰でも |
| AUTH USER | 認証済みユーザ |
| USER SELF | ユーザ自身のもののみ |
| DRIGLO | 社員のみ（@driglo.net） |
| MADE PUBLIC | 公開しているとき（is_private = false） |
| RELATED USERS | 関係するユーザのみ |
