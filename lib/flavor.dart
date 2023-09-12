enum Flavor {
  dev,
  prod,
  ;
}

final flavor = switch (const String.fromEnvironment('FLAVOR')) {
  'dev' => Flavor.dev,
  'prod' => Flavor.prod,
  '' => throw UnsupportedError('環境変数 FLAVOR が設定されていません'),
  _ => throw UnsupportedError(
      '環境変数 FLAVOR に不正な文字列（{$String.fromEnvironment(\'FLAVOR\')}）が含まれています',
    )
};
