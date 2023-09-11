# アーキテクチャのガイドライン
ファイル分割や、アーキテクチャに便利なパッケージの多用をできるだけ抑えた設計にしている。
Riverpod に依存している。

## mock 層
  - 本プロダクトに影響しない、ウィジェットの挙動などを確認するためだけのビルド。
  - integration テストの様な使い方をする。

## domain 層
  - entities

    データクラスの実装
    - データベース構造と同一にするのではなく、アプリで利用するロジックをベースに構成する。
    - UI、リポジトリ、ユースケースに依存しない。
  - repository

    外部データとの通信を行う。
    - パッケージの変更に強くするために、引数や返り値で、パッケージに依存したクラスを返さないようにする。
    - ユースケースに依存しない。
    - プレゼンテーション層から直接利用しない。
  - use_cases

    UI の層と分離する必要がある、ビジネスロジックの実装。
      - Riverpod の Provider を利用した、複雑な画面制御を実現するためのロジックを実装する。
      - presentation 層にロジックを書かせないように、Provider で隠蔽して、呼び出すだけで、**処理が完了・加工済みのデータが取得できる実装を意識する**。
        <details>
        <summary>
        実装例
        </summary>

        ⭕️ OK
        ```dart
        final todoListProvider = Provider(
          (_) => //
        );

        final selectedTodoIndexProvider = StateProvider((ref) => 0);

        final selectedTodoProvider = Provider((ref) {
          final index = ref.watch(selectedTodoIndexProvider);
          final todoList = ref.watch(todoListProvider);

          return todoList[index];
        });

        // pages
        class TodoListPage extends ConsumerWidget {
          @override
          Widget build(BuildContext context, WidgetRef ref) {
            final selectedTodo = ref.watch(selectedTodoProvider);
          
          // ...
        }
        ```

        ❌ NG
        ```dart
        final todoListProvider = Provider(
          (_) => //
        );

        final selectedTodoIndexProvider = StateProvider((ref) => 0);


        // pages
        class todoListPage extends ConsumerWidget {
          @override
          Widget build(BuildContext context, WidgetRef ref) {
            final selectedTodo = ref.watch(
              todoListProvider,
          )[ref.watch(selectedTodoIndexProvider)];
          
            // ...
          }
        ```
        </details>
      - それぞれの Provider の使い分け
        - プレーンの `Provider`
          - 外部からの値の更新を許さない、Readable で安全な provider 。
        - `FutureProvider`、`StreamProvider`
          - 外部からの値の更新を許さない、Readable で安全な provider 。
          - 非同期の取得は、基本こちらを利用する。
          - `FutureProvider` vs. `AsyncNotifierProvider`
            - 非同期で取得したものに、後から追加などしない場合は、`FutureProvider` を利用する。
        - `StateProvider`、`NotifierProvider`、`AsyncNotifierProvider`
          - 後からユーザーの操作などによって state を更新する場合。
          - state としてクラスを定義したい場合は、`states/` ディレクトリを作成する。
      - Provider を、ページ単位でまとめたい場合は、static 変数で名前空間のような定義の仕方をする。

        ```dart
        class TopPageProviders {
          // ! movieProvider だけだと、どこの画面で使うかなどがわからないので、
          // ! TopPageProviders.movieProvider として使えるようにする。
          static final todoProvider = FutureProvider<List<Movie>>(
            // ...
          );
          
          static final selectedTodoIndexProvider = StateProvider<int>(
            (_) => 0,
          );
        }
        ```

<br/><br/>

## presentation 層
- pages
  - pages/xxx/ の階層には、`xxx_page.dart` 以外のファイルを置かない。
    ```md
      ├── presentation
      │   ├── pages/
      │   │   ├── my_list/
      │   │   │   │   <!-- ❌ NG -->
      │   │   │   ├── list_xxx_page.dart 
      │   │   │   ├── xxx_item.dart 
      │   │   │   │
      │   │   │   │   <!-- ⭕️ OK -->
      │   │   │   └── my_list_page.dart
    ```
  - ウィジェットを分離する場合は、同階層に `widgets/` ディレクトリを作って実装する。
    - `widgets/` ディレクトリ内のディレクトリは、自由に分割する。
  - Provider の置き場所で実装がバラバラになるのを防ぐため、 `notifiers/` などのディレクトリを作成して、`StateNotifierProvider` を作成することは禁止。
  - ページの定義方法は、[#ページルート](#ページルート) を参照。
- widgets
  - 複数のページで参照するウィジェットの実装。
  - 極力、ドメインモデルとは分離させるが、特定のデータを表示するために `ConsumerWidget` を実装することもある。
  - ダイアログの実装ルールは、[#ダイアログルート](#ダイアログルート) を参照。
- res
  
  テーマ、カラー定義や、テキストスタイルなどの UI 情報をまとめる。
- route_observers

  画面遷移を検知して、処理を走らせる実装。

# Routeの定義
## ページルート
vscode のスニペットに登録済み。
```dart
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// 4. Equatable で引数の設定
class MoviePageArgs extends Equatable {
  const MoviePageArgs({required this.movieId});
  final String movieId;

  @override
  List<Object?> get props => [movieId];
}

class MoviePage extends StatelessWidget {
  const MoviePage._(this.args);
  final MoviePageArgs args;

  /// 1. ルートの名前文字列
  static const routeName = '/movie';

  /// 2. Route の static メソッドの実装
  static Route<void> route(MoviePageArgs args) {
    return MaterialPageRoute(
      /// 3. RouteObserver のログのため、RouteSettings は必須
      settings: RouteSettings(name: routeName, arguments: args),
      builder: (_) => MoviePage._(args),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('MoviePage')),
    );
  }
}
```

## ダイアログルート
テーマを反映させるため、`Dialog` 関連のウィジェットを利用するか、`Theme.of(context).dialogTheme` などで、テーマを反映させる。

基本的にページと同じ方法で実装する。しかし、以下の点で違う。
- `RouteSettings.name` は、`kDialogRouteName` で固定。
- ページ同様、引数を class まとめるが、`showDialog()` に渡すだけの引数は別で渡す。

```dart
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';
import '../../res/routes/dialog_route_settings.dart';

class RequestDialogArgs extends Equatable {
  const RequestDialogArgs({
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  List<Object?> get props => [
        title,
        content,
  ];
}

class RequestDialog extends StatelessWidget {
  const RequestDialog._(this.args) : super();

  final RequestDialogArgs args;

  static Future<void> show(
    BuildContext context, {
    // showDialog 自体の
    bool barrierDismissible = true,
    required RequestDialogArgs args,
  }) {
    return showDialog<void>(
      // ダイアログは kDialogRouteName で固定
      routeSettings: const RouteSettings(name: kDialogRouteName, arguments: args),
      barrierDismissible: barrierDismissible,
      useRootNavigator: false,
      context: context,
      builder: (_) => RequestDialog._(args),
    );
  }

  // ...
}
```


