import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../genre/entities/genre.dart';
import '../../../question/entities/question.dart';

final selectedGenreProvider =
    StateProvider<Genre>((ref) => const Genre(genreId: '', genreName: ''));

final editingQuestionUuidsNotifierProvider =
    NotifierProvider.autoDispose<EditingQuestionUuIdsNotifier, List<String>>(
  EditingQuestionUuIdsNotifier.new,
);

final editingQuestionProviderFamily =
    StateProvider.autoDispose.family<Question, String>(
  (ref, arg) {
    final genre = ref.watch(selectedGenreProvider);
    return Question(questionId: '', title: '', answer: '', genre: genre);
  },
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
    state.remove(uuid);
    state = [...state];
  }
}
