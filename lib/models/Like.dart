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


/** This is an auto generated class representing the Like type in your schema. */
class Like extends amplify_core.Model {
  static const classType = const _LikeModelType();
  final String id;
  final String? _postID;
  final String? _liked_by;
  final String? _liked_by_pic;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  LikeModelIdentifier get modelIdentifier {
      return LikeModelIdentifier(
        id: id
      );
  }
  
  String get postID {
    try {
      return _postID!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get liked_by {
    try {
      return _liked_by!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get liked_by_pic {
    return _liked_by_pic;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Like._internal({required this.id, required postID, required liked_by, liked_by_pic, createdAt, updatedAt}): _postID = postID, _liked_by = liked_by, _liked_by_pic = liked_by_pic, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Like({String? id, required String postID, required String liked_by, String? liked_by_pic}) {
    return Like._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      postID: postID,
      liked_by: liked_by,
      liked_by_pic: liked_by_pic);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Like &&
      id == other.id &&
      _postID == other._postID &&
      _liked_by == other._liked_by &&
      _liked_by_pic == other._liked_by_pic;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Like {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("postID=" + "$_postID" + ", ");
    buffer.write("liked_by=" + "$_liked_by" + ", ");
    buffer.write("liked_by_pic=" + "$_liked_by_pic" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Like copyWith({String? postID, String? liked_by, String? liked_by_pic}) {
    return Like._internal(
      id: id,
      postID: postID ?? this.postID,
      liked_by: liked_by ?? this.liked_by,
      liked_by_pic: liked_by_pic ?? this.liked_by_pic);
  }
  
  Like copyWithModelFieldValues({
    ModelFieldValue<String>? postID,
    ModelFieldValue<String>? liked_by,
    ModelFieldValue<String?>? liked_by_pic
  }) {
    return Like._internal(
      id: id,
      postID: postID == null ? this.postID : postID.value,
      liked_by: liked_by == null ? this.liked_by : liked_by.value,
      liked_by_pic: liked_by_pic == null ? this.liked_by_pic : liked_by_pic.value
    );
  }
  
  Like.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _postID = json['postID'],
      _liked_by = json['liked_by'],
      _liked_by_pic = json['liked_by_pic'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'postID': _postID, 'liked_by': _liked_by, 'liked_by_pic': _liked_by_pic, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'postID': _postID,
    'liked_by': _liked_by,
    'liked_by_pic': _liked_by_pic,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<LikeModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<LikeModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final POSTID = amplify_core.QueryField(fieldName: "postID");
  static final LIKED_BY = amplify_core.QueryField(fieldName: "liked_by");
  static final LIKED_BY_PIC = amplify_core.QueryField(fieldName: "liked_by_pic");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Like";
    modelSchemaDefinition.pluralName = "Likes";
    
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
      amplify_core.ModelIndex(fields: const ["postID"], name: "byPost")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Like.POSTID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Like.LIKED_BY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Like.LIKED_BY_PIC,
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

class _LikeModelType extends amplify_core.ModelType<Like> {
  const _LikeModelType();
  
  @override
  Like fromJson(Map<String, dynamic> jsonData) {
    return Like.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Like';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Like] in your schema.
 */
class LikeModelIdentifier implements amplify_core.ModelIdentifier<Like> {
  final String id;

  /** Create an instance of LikeModelIdentifier using [id] the primary key. */
  const LikeModelIdentifier({
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
  String toString() => 'LikeModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is LikeModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}