import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../genre/entities/genre.dart';
import '../../../genre/use_cases/genre_fetch_all.dart';
import '../../../genre/use_cases/genre_fetch_by_genre.dart';
import '../../entities/question.dart';
import '../../repositories/question_repository.dart';

final genreListProvider = FutureProvider.autoDispose<List<Genre>>((ref) {
  return ref.read(genreFetchAllProvider)();
});

final genreListByGenreProvider = FutureProvider.autoDispose<List<Genre>>((ref) {
  final genre = ref.watch(selectedGenreProvider);
  return ref.read(genreFetchByGenreProvider)(genre);
});

final fetchQuestionCounts = FutureProvider.family.autoDispose<int, Genre>(
  (ref, genre) => ref.read(questionRepository).questionCount(genre: genre),
);

final selectedGenreProvider = StateProvider.autoDispose<Genre>(
  (ref) => const Genre(genreId: '', genreName: ''),
);

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
