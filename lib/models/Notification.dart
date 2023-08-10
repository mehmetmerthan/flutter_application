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


/** This is an auto generated class representing the Notification type in your schema. */
class Notification extends amplify_core.Model {
  static const classType = const _NotificationModelType();
  final String id;
  final String? _liked_by;
  final String? _liked_by_pic;
  final String? _comment_by;
  final String? _comment_by_pic;
  final String? _userID;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  NotificationModelIdentifier get modelIdentifier {
      return NotificationModelIdentifier(
        id: id
      );
  }
  
  String? get liked_by {
    return _liked_by;
  }
  
  String? get liked_by_pic {
    return _liked_by_pic;
  }
  
  String? get comment_by {
    return _comment_by;
  }
  
  String? get comment_by_pic {
    return _comment_by_pic;
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
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Notification._internal({required this.id, liked_by, liked_by_pic, comment_by, comment_by_pic, required userID, createdAt, updatedAt}): _liked_by = liked_by, _liked_by_pic = liked_by_pic, _comment_by = comment_by, _comment_by_pic = comment_by_pic, _userID = userID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Notification({String? id, String? liked_by, String? liked_by_pic, String? comment_by, String? comment_by_pic, required String userID}) {
    return Notification._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      liked_by: liked_by,
      liked_by_pic: liked_by_pic,
      comment_by: comment_by,
      comment_by_pic: comment_by_pic,
      userID: userID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Notification &&
      id == other.id &&
      _liked_by == other._liked_by &&
      _liked_by_pic == other._liked_by_pic &&
      _comment_by == other._comment_by &&
      _comment_by_pic == other._comment_by_pic &&
      _userID == other._userID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Notification {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("liked_by=" + "$_liked_by" + ", ");
    buffer.write("liked_by_pic=" + "$_liked_by_pic" + ", ");
    buffer.write("comment_by=" + "$_comment_by" + ", ");
    buffer.write("comment_by_pic=" + "$_comment_by_pic" + ", ");
    buffer.write("userID=" + "$_userID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Notification copyWith({String? liked_by, String? liked_by_pic, String? comment_by, String? comment_by_pic, String? userID}) {
    return Notification._internal(
      id: id,
      liked_by: liked_by ?? this.liked_by,
      liked_by_pic: liked_by_pic ?? this.liked_by_pic,
      comment_by: comment_by ?? this.comment_by,
      comment_by_pic: comment_by_pic ?? this.comment_by_pic,
      userID: userID ?? this.userID);
  }
  
  Notification copyWithModelFieldValues({
    ModelFieldValue<String?>? liked_by,
    ModelFieldValue<String?>? liked_by_pic,
    ModelFieldValue<String?>? comment_by,
    ModelFieldValue<String?>? comment_by_pic,
    ModelFieldValue<String>? userID
  }) {
    return Notification._internal(
      id: id,
      liked_by: liked_by == null ? this.liked_by : liked_by.value,
      liked_by_pic: liked_by_pic == null ? this.liked_by_pic : liked_by_pic.value,
      comment_by: comment_by == null ? this.comment_by : comment_by.value,
      comment_by_pic: comment_by_pic == null ? this.comment_by_pic : comment_by_pic.value,
      userID: userID == null ? this.userID : userID.value
    );
  }
  
  Notification.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _liked_by = json['liked_by'],
      _liked_by_pic = json['liked_by_pic'],
      _comment_by = json['comment_by'],
      _comment_by_pic = json['comment_by_pic'],
      _userID = json['userID'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'liked_by': _liked_by, 'liked_by_pic': _liked_by_pic, 'comment_by': _comment_by, 'comment_by_pic': _comment_by_pic, 'userID': _userID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'liked_by': _liked_by,
    'liked_by_pic': _liked_by_pic,
    'comment_by': _comment_by,
    'comment_by_pic': _comment_by_pic,
    'userID': _userID,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<NotificationModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<NotificationModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final LIKED_BY = amplify_core.QueryField(fieldName: "liked_by");
  static final LIKED_BY_PIC = amplify_core.QueryField(fieldName: "liked_by_pic");
  static final COMMENT_BY = amplify_core.QueryField(fieldName: "comment_by");
  static final COMMENT_BY_PIC = amplify_core.QueryField(fieldName: "comment_by_pic");
  static final USERID = amplify_core.QueryField(fieldName: "userID");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Notification";
    modelSchemaDefinition.pluralName = "Notifications";
    
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
      key: Notification.LIKED_BY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.LIKED_BY_PIC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.COMMENT_BY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.COMMENT_BY_PIC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.USERID,
      isRequired: true,
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

class _NotificationModelType extends amplify_core.ModelType<Notification> {
  const _NotificationModelType();
  
  @override
  Notification fromJson(Map<String, dynamic> jsonData) {
    return Notification.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Notification';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Notification] in your schema.
 */
class NotificationModelIdentifier implements amplify_core.ModelIdentifier<Notification> {
  final String id;

  /** Create an instance of NotificationModelIdentifier using [id] the primary key. */
  const NotificationModelIdentifier({
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
  String toString() => 'NotificationModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is NotificationModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}