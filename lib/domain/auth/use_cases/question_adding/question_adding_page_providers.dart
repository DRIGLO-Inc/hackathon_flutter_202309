import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../genre/entities/genre.dart';
import '../../../question/entities/question.dart';

final selectedGenreProvider =
    StateProvider<Genre>((ref) => const Genre(genreId: '', genreName: ''));

final editingQuestionsCountProvider =
    StateProvider.autoDispose<int>((ref) => 1);

final editingQuestionProviderFamily =
    StateProvider.autoDispose.family<Question, int>(
  (ref, arg) {
    final genre = ref.watch(selectedGenreProvider);
    return Question(questionId: '', title: '', answer: '', genre: genre);
  },
);
