import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../genre/entities/genre.dart';
import '../../../question/entities/question.dart';

final genreListProvider = FutureProvider<List<Genre>>((ref) {
  return [
    const Genre(genreId: '', genreName: '基礎情報技術者試験'),
    const Genre(genreId: '', genreName: '公認会計士'),
    const Genre(genreId: '', genreName: 'TOEIC450点単語テスト'),
  ];
});

final selectedGenreProvider =
    StateProvider<Genre>((ref) => const Genre(genreId: '', genreName: ''));

final editingQuestionUuidsNotifierProvider =
    NotifierProvider.autoDispose<EditingQuestionUuIdsNotifier, List<String>>(
  EditingQuestionUuIdsNotifier.new,
);

class EditingQuestionUuIdsNotifier extends AutoDisposeNotifier<List<String>> {
  @override
  List<String> build() {
    final uuid = const Uuid().v4();
    return [uuid];
  }

  void addQuestion() {
    final uuid = const Uuid().v4();
    state = [...state, uuid];
  }

  void removeQuestion(String uuid) {
    state = state.map((e) => e == uuid ? null : e).nonNulls.toList();
  }
}

final editingQuestionProviderFamily =
    StateProvider.autoDispose.family<Question, String>(
  (ref, arg) {
    final genre = ref.watch(selectedGenreProvider);
    return Question(questionId: '', title: '', answer: '', genre: genre);
  },
);
