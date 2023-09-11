# コード規約
## パッケージ
### pubspec.yaml
- コメントで、パッケージの役割を明記し、グループ分けをする。
- 基本は `^` で、マイナーアップデートを含める。
  - バージョン固定する場合は、必ず理由を明記する。

### サードパーティのパッケージ
- コントロールしにくい依存を増やすことになるので追加前によく検討する。
  - テストコードが書かれていないパッケージはデグレのリスクが高い。
- 古くなりすぎないようにアップデートしていく。

## 主要なスニペット
- [`arb`]
  - 多言語対応ファイルのためのスニペット
    ```ruby
    {
      "{変数名}": "{文言}",
      "@{変数名}": {
        "description": "{文言}"
      }
    }
    ```
- [`freezed`]
  - freezed クラスの作成（ファイル名から自動的に命名）
- `...of()` 構文による、各種インスタンスの取得
  - [get_instance.code-snippets](../../.vscode/get_instance.code-snippets) を参照
- [`singleton`, `provider`]
  - シングルトン用途で用いるための Provider（ファイル名から自動的に命名）
  - こういうの👇
    ```dart
    final forceUpdatProvider = Provider<ForceUpdate>(
      ForceUpdate.new,
    );

    class ForceUpdate {
      ForceUpdate(this._ref);

      final Ref _ref;
      void call() {
        
      }
    }
    ```
- [`stless`]
  - `StatelessWidget` の生成。ファイル名をそのままクラス名に流用する。
  
    > **Note** 
    > 
    > import 文も同時に生成されるので、vscode の Flutter 拡張スニペットと併用すると便利。
  
- [`stful`]
  - `StatefulWidget` の生成。ファイル名をそのままクラス名に流用する。
  
    > **Note** 
    > 
    > import 文も同時に生成されるので、vscode の Flutter 拡張スニペットと併用すると便利。

- [`stless`, `consumerWidget`]
  - `ConsumerWidget` の生成。ファイル名をそのままクラス名に流用する。
- [`stful`, `statefulConsumerWidget`]
  - `StatefulConsumerWidget` の生成。ファイル名をそのままクラス名に流用する。
- [`page`]
  - 本アプリの開発ルールに則った、ページのウィジェットを生成。
  - ファイル名をそのままクラス名に流用する。
  - 引数ありと、引数なしの２パターン用意。
    - スニペットコード乱立防止のため、StatelessWidget の生成のみ用意。
- [`dialog`]
  - 本アプリの開発ルールに則った、ダイアログのウィジェットを生成。
  - ファイル名をそのままクラス名に流用する。
  - 引数がないダイアログはほぼ存在しないので、引数あり のもののみ用意。
- [`repository`]
  - `repositories/app_server` で使用。
  - アプリサーバーのリポジトリのベースを自動生成する。

## 変数・定数など
- 同一ファイル内でのみ使用するプロパティ、メソッド等はプライベートにする。
- グローバルな定数には `k` の接頭辞を付ける。
    - ローカルの定数に `_k` を付けても良い。
- 数値型はそれぞれの型に沿ったリテラル表記を使う。
    - double 型の引数に int の形式で渡すこともできるが、int なら int、double なら double の表記を常に使う。
- 命名ルール
  - `code => cd`, `context => ctx` などの略称は、原則使わない。
    - コールバック引数の `e` や `i` などは、その限りではない。
  - `AsyncValue`は、`xxxAsync` という命名にする。
    - ex.
      - `final todoListAsync = ref.watch(fetchedTodoListProvider);`
      - `final todoDetailsAsync = ref.watch(fetchedTodoDetailsProvider(todoCode));`,
  - ビジネスロジックに関わる部分は、過度な略称を使わない。
    - ex. todoDetails => ❌ details
  - 略字で構成される単語も、他の変数同様 lowerCamel で命名する。
    - ex.
      - ❌ userID　⭕️ userId
      - ❌ showQRCode　⭕️ showQrCode
      - ❌ isIOS　⭕️ isIos

## ファイル命名
- 単語構造としての正しさより、アルファベット順に並ぶことを意識して、命名する。

  ❌ NG
  ```
  pages
  ├── all_now_playing_todos/
  ├── coupon_code/
  ├── favorite_theater_now_playing_todos/
  ├── nearby_theater_now_playing_todos/
  ├── use_coupon/
  ```

  ⭕️ OK
  ```
  pages
  ├── coupon_code/
  ├── coupon_code_use/
  ├── now_playing_todos_all/
  ├── now_playing_todos_favorite_theater/
  ├── now_playing_todos_nearby_theater/
  ```

## extension
- あくまで、長い書き方を省略するために用いる。
- 処理を共通化する用途で用いてはならない。
- of() コンストラクタで取得する値に関しては、可読性を重視して、`extension` の実装をしない。

    ❌ NG
    ```dart
    extension BuildContextEx on BuildContext {
      ThemeDate get theme => Theme.of(context);
      void pop() => Navigator.of(context).pop();
    }
    ```

## コメント
- **ぱっと見でわかりづらい処理に感じたら、冗長に感じても、できるだけコメントを残す。**
- ルール
  - 処理の説明、分割のためには、通常のコメント(`//`)を使う。
  - 関数・変数宣言する際に、利用する側に「どういう関数・変数」なのかを伝えたい場合は、DartDoc コメント(`///`)を利用する。
- 必要に応じて `TODO:`、`FIXME:`、`WARNING:`、`HACK:` などを付ける。
  - **後で、別のデータを入れる予定の場合は、必ず TODO: をつける**
  - さらに可読性を上げるために、以下の２つの Better Comments を利用する。
    - ` // * ` : 特に重要で、ハイライトをつけたい場合。
    - ` // ! ` : 重要な警告の記述。
- 心構え
  - できるだけ短く。
  - しかし、情報を切り落としすぎて、自分にしか分からないコメントにしない。
  - Why を書くことを意識し、意味のないコメントをしない。

    ❌ NG
    ```dart
    // カウントアップするための値
    var count = 0;
    ```

    ⭕️ OK
    ```dart
    // Analytics に保存するために、カウントするための値
    var count = 0;
    ```
### 例
**⚠️ 実際につかっているコードではない**

```dart
class TodoListTile extends StatelessWidget {
  const TodoListTile({
    required this.isSelected,
    this.iconData,
  });
  
  /// 選択されているかどうか
  final bool isSelected;
  
  /// 座席に被せて表示するアイコン
  final IconData? iconData;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? ColorName.red : ColorName.white,
        // 白の場合、背景と同化してしまうので、ボーダーをつける。
        border: isSelected
          ? Border.none
          : Border.all(
              color: ColorName.red,
              width: 1,
          ),
      ),
      child: // ...
    );
  };
}
```

## 文言追加
flutter_localizations を利用。
追加する文言の変数名は、文言の直訳ではなく、使用用途で命名する。
ex.)
- 文言：`入力項目を確認してください`
- 変数名：
  - ❌ `pleaseConfirmInput`
  - ⭕️ `confirmPageTitle`

1. `lib/l10n/app_ja.arb` に、文言を追加する（[スニペット](#主要なスニペット)）。
2. 自動生成
  ```
  flutter gen-l10n
  ```

## UI 構築
- of()
  - `Navigator.of(context).push(...)` と `Navigator.push(context, ...) `のように２通りの 書き方ができるものがあるが、 `of()` を一貫して用いる。
- build 関数
  - 変数の宣言の優先順は、原則以下です。

    ```dart
    @override
    Widget build(BuildContext context, WidgetRef ref) {
      // 1. BuildContext からの取得
      final theme = Theme.of(context);

      // 2. WidgetRef からの取得
      final todoListAsync = ref.watch(todoListProvider);

      // 3. その他各変数の定義
      final Color buttonBackgroundColor;
      if (selected) {
        selected = customColors.primary;
      } else {
        selected = customColors.surface;
      }


      // 4. 関数の定義
      void onPressed() {
        // ..
      }

      return //...
    }
    ```
- 親ウィジェットから、子ウィジェットの値を操作したい場合は、`State` クラスを public にして、`GlobalKey<XxxState>` で操作させる。
- クラスコンストラクタの引数が多い場合、コメントなどで分割する
  <details>
  <summary>実装例</summary>
  ⭕️ OK

  ```dart
  AlertDialog(
    // icon
    icon: Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: Navigator.of(context).pop,
        icon: const Icon(Icons.clear),
        padding: EdgeInsets.zero,
        style: IconButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        constraints: const BoxConstraints(),
      ),
    ),
    iconPadding: const EdgeInsets.only(
      right: 12,
      top: 12,
    ),

    // title
    title: Text(args.title),

    // content
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          args.content,
  ```
  </details>
- 色
  TODO(Zudah228)
- Typography
  TODO(Zudah228)
- レイアウト
  - 中途半端な奇数になっている場合は、なるべく 4 か 8 の倍数にすること（見た目の違和感がない程度に）
  - 最大値を使う目的で、MediaQuery.of(context).size を使わない。
    - `double.infinity` を利用する。
    - `double.infinity` によってビルドエラーが出る場合は、ウィジェット設計を見直す。
  - 高さ・幅に固定値は基本使わない
    - デバイスサイズの変化に耐えられず、保守性が下がる。
    - 内容物によって動的にへ変化するべき。
    - `IntrinsicWidth / IntrinsicHeight` や `UnconstrainedBox` 、 `Align` などでレイアウトする。
    - 固定値を使った方が良い場合もあるので、そこは適宜相談、コメントの追加をする。
  - 子ウィジェットに Margin を設定しない。
    - その子ウィジェットを少し別の用途で使うときや、他の人がレイアウトするときに不都合が発生してしまう（ Flutter の `Card` ウィジェットにデフォルトの margin が設定されていて、困った経験があるかもしれません）。
    - 「余白を設けるか」「どのような Align で配置するか」は、その子ウィジェットを使う側の関心事。
    - 「余白の値を共通化したい」 という目的の場合は、余白の値を変数に保存して、使い回すようにする。
    - 参考
      - [UIコンポーネントにはマージンをつけるな！絶対にだ！！](https://qiita.com/otsukayuhi/items/d88b5158745f700be534)
      - [なぜ初心者は「UIコンポーネントにマージンをつけるのか」初心者が解説します](https://zenn.dev/ryusou/articles/why-margin-component)

