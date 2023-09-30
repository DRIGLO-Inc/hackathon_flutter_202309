// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Question _$$_QuestionFromJson(Map<String, dynamic> json) => _$_Question(
      questionId: json['question_id'] as String,
      title: json['title'] as String,
      answer: json['answer'] as String,
      answerTexts: (json['answer_texts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      genre: Genre.fromJson(json['genre'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'title': instance.title,
      'answer': instance.answer,
      'answer_texts': instance.answerTexts,
      'genre': instance.genre,
    };
