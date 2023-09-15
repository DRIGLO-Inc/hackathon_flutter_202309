-- プロフィール
CREATE POLICY "SELECT FROM PROFILE (AUTH USER)"
ON storage.objects
FOR SELECT
TO authenticated
USING (
    -- 「sample」バケットの「profile」フォルダ
    -- sample/{user_id}/profile/{filename}
    bucket_id = 'sample'
    AND (storage.foldername(name)) [3] = 'profile'
    -- 自身のファイル
    AND owner = auth.uid()
);
