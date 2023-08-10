/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Post type in your schema. */
class Post extends amplify_core.Model {
  static const classType = const _PostModelType();
  final String id;
  final String? _content;
  final String? _userID;
  final List<Comment>? _Comments;
  final List<Like>? _Likes;
  final List<String>? _style;
  final List<String>? _instrument;
  final String? _pic_key;
  final String? _video_key;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  PostModelIdentifier get modelIdentifier {
      return PostModelIdentifier(
        id: id
      );
  }
  
  String? get content {
    return _content;
  }
  
  String get userID {
    try {
      return _userID!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Comment>? get Comments {
    return _Comments;
  }
  
  List<Like>? get Likes {
    return _Likes;
  }
  
  List<String>? get style {
    return _style;
  }
  
  List<String>? get instrument {
    return _instrument;
  }
  
  String? get pic_key {
    return _pic_key;
  }
  
  String? get video_key {
    return _video_key;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Post._internal({required this.id, content, required userID, Comments, Likes, style, instrument, pic_key, video_key, createdAt, updatedAt}): _content = content, _userID = userID, _Comments = Comments, _Likes = Likes, _style = style, _instrument = instrument, _pic_key = pic_key, _video_key = video_key, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Post({String? id, String? content, required String userID, List<Comment>? Comments, List<Like>? Likes, List<String>? style, List<String>? instrument, String? pic_key, String? video_key}) {
    return Post._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      content: content,
      userID: userID,
      Comments: Comments != null ? List<Comment>.unmodifiable(Comments) : Comments,
      Likes: Likes != null ? List<Like>.unmodifiable(Likes) : Likes,
      style: style != null ? List<String>.unmodifiable(style) : style,
      instrument: instrument != null ? List<String>.unmodifiable(instrument) : instrument,
      pic_key: pic_key,
      video_key: video_key);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
      id == other.id &&
      _content == other._content &&
      _userID == other._userID &&
      DeepCollectionEquality().equals(_Comments, other._Comments) &&
      DeepCollectionEquality().equals(_Likes, other._Likes) &&
      DeepCollectionEquality().equals(_style, other._style) &&
      DeepCollectionEquality().equals(_instrument, other._instrument) &&
      _pic_key == other._pic_key &&
      _video_key == other._video_key;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Post {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("content=" + "$_content" + ", ");
    buffer.write("userID=" + "$_userID" + ", ");
    buffer.write("style=" + (_style != null ? _style!.toString() : "null") + ", ");
    buffer.write("instrument=" + (_instrument != null ? _instrument!.toString() : "null") + ", ");
    buffer.write("pic_key=" + "$_pic_key" + ", ");
    buffer.write("video_key=" + "$_video_key" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Post copyWith({String? content, String? userID, List<Comment>? Comments, List<Like>? Likes, List<String>? style, List<String>? instrument, String? pic_key, String? video_key}) {
    return Post._internal(
      id: id,
      content: content ?? this.content,
      userID: userID ?? this.userID,
      Comments: Comments ?? this.Comments,
      Likes: Likes ?? this.Likes,
      style: style ?? this.style,
      instrument: instrument ?? this.instrument,
      pic_key: pic_key ?? this.pic_key,
      video_key: video_key ?? this.video_key);
  }
  
  Post copyWithModelFieldValues({
    ModelFieldValue<String?>? content,
    ModelFieldValue<String>? userID,
    ModelFieldValue<List<Comment>?>? Comments,
    ModelFieldValue<List<Like>?>? Likes,
    ModelFieldValue<List<String>?>? style,
    ModelFieldValue<List<String>?>? instrument,
    ModelFieldValue<String?>? pic_key,
    ModelFieldValue<String?>? video_key
  }) {
    return Post._internal(
      id: id,
      content: content == null ? this.content : content.value,
      userID: userID == null ? this.userID : userID.value,
      Comments: Comments == null ? this.Comments : Comments.value,
      Likes: Likes == null ? this.Likes : Likes.value,
      style: style == null ? this.style : style.value,
      instrument: instrument == null ? this.instrument : instrument.value,
      pic_key: pic_key == null ? this.pic_key : pic_key.value,
      video_key: video_key == null ? this.video_key : video_key.value
    );
  }
  
  Post.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _content = json['content'],
      _userID = json['userID'],
      _Comments = json['Comments'] is List
        ? (json['Comments'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Comment.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _Likes = json['Likes'] is List
        ? (json['Likes'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Like.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _style = json['style']?.cast<String>(),
      _instrument = json['instrument']?.cast<String>(),
      _pic_key = json['pic_key'],
      _video_key = json['video_key'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'content': _content, 'userID': _userID, 'Comments': _Comments?.map((Comment? e) => e?.toJson()).toList(), 'Likes': _Likes?.map((Like? e) => e?.toJson()).toList(), 'style': _style, 'instrument': _instrument, 'pic_key': _pic_key, 'video_key': _video_key, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'content': _content,
    'userID': _userID,
    'Comments': _Comments,
    'Likes': _Likes,
    'style': _style,
    'instrument': _instrument,
    'pic_key': _pic_key,
    'video_key': _video_key,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<PostModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<PostModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CONTENT = amplify_core.QueryField(fieldName: "content");
  static final USERID = amplify_core.QueryField(fieldName: "userID");
  static final COMMENTS = amplify_core.QueryField(
    fieldName: "Comments",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Comment'));
  static final LIKES = amplify_core.QueryField(
    fieldName: "Likes",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Like'));
  static final STYLE = amplify_core.QueryField(fieldName: "style");
  static final INSTRUMENT = amplify_core.QueryField(fieldName: "instrument");
  static final PIC_KEY = amplify_core.QueryField(fieldName: "pic_key");
  static final VIDEO_KEY = amplify_core.QueryField(fieldName: "video_key");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Post";
    modelSchemaDefinition.pluralName = "Posts";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["userID"], name: "byUser")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.CONTENT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.USERID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Post.COMMENTS,
      isRequired: false,
      ofModelName: 'Comment',
      associatedKey: Comment.POSTID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Post.LIKES,
      isRequired: false,
      ofModelName: 'Like',
      associatedKey: Like.POSTID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.STYLE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.INSTRUMENT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.PIC_KEY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.VIDEO_KEY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _PostModelType extends amplify_core.ModelType<Post> {
  const _PostModelType();
  
  @override
  Post fromJson(Map<String, dynamic> jsonData) {
    return Post.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Post';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Post] in your schema.
 */
class PostModelIdentifier implements amplify_core.ModelIdentifier<Post> {
  final String id;

  /** Create an instance of PostModelIdentifier using [id] the primary key. */
  const PostModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'PostModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is PostModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}