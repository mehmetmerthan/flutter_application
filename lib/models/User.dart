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


/** This is an auto generated class representing the User type in your schema. */
class User extends amplify_core.Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _user_name;
  final String? _name;
  final String? _age;
  final String? _bio;
  final String? _pic;
  final List<Post>? _Posts;
  final String? _gender;
  final String? _email;
  final List<String>? _instrument;
  final List<String>? _style;
  final String? _country;
  final String? _state;
  final String? _city;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  UserModelIdentifier get modelIdentifier {
      return UserModelIdentifier(
        id: id
      );
  }
  
  String get user_name {
    try {
      return _user_name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get age {
    return _age;
  }
  
  String? get bio {
    return _bio;
  }
  
  String? get pic {
    return _pic;
  }
  
  List<Post>? get Posts {
    return _Posts;
  }
  
  String? get gender {
    return _gender;
  }
  
  String? get email {
    return _email;
  }
  
  List<String>? get instrument {
    return _instrument;
  }
  
  List<String>? get style {
    return _style;
  }
  
  String? get country {
    return _country;
  }
  
  String? get state {
    return _state;
  }
  
  String? get city {
    return _city;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const User._internal({required this.id, required user_name, required name, age, bio, pic, Posts, gender, email, instrument, style, country, state, city, createdAt, updatedAt}): _user_name = user_name, _name = name, _age = age, _bio = bio, _pic = pic, _Posts = Posts, _gender = gender, _email = email, _instrument = instrument, _style = style, _country = country, _state = state, _city = city, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory User({String? id, required String user_name, required String name, String? age, String? bio, String? pic, List<Post>? Posts, String? gender, String? email, List<String>? instrument, List<String>? style, String? country, String? state, String? city}) {
    return User._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      user_name: user_name,
      name: name,
      age: age,
      bio: bio,
      pic: pic,
      Posts: Posts != null ? List<Post>.unmodifiable(Posts) : Posts,
      gender: gender,
      email: email,
      instrument: instrument != null ? List<String>.unmodifiable(instrument) : instrument,
      style: style != null ? List<String>.unmodifiable(style) : style,
      country: country,
      state: state,
      city: city);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _user_name == other._user_name &&
      _name == other._name &&
      _age == other._age &&
      _bio == other._bio &&
      _pic == other._pic &&
      DeepCollectionEquality().equals(_Posts, other._Posts) &&
      _gender == other._gender &&
      _email == other._email &&
      DeepCollectionEquality().equals(_instrument, other._instrument) &&
      DeepCollectionEquality().equals(_style, other._style) &&
      _country == other._country &&
      _state == other._state &&
      _city == other._city;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("user_name=" + "$_user_name" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("age=" + "$_age" + ", ");
    buffer.write("bio=" + "$_bio" + ", ");
    buffer.write("pic=" + "$_pic" + ", ");
    buffer.write("gender=" + "$_gender" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("instrument=" + (_instrument != null ? _instrument!.toString() : "null") + ", ");
    buffer.write("style=" + (_style != null ? _style!.toString() : "null") + ", ");
    buffer.write("country=" + "$_country" + ", ");
    buffer.write("state=" + "$_state" + ", ");
    buffer.write("city=" + "$_city" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? user_name, String? name, String? age, String? bio, String? pic, List<Post>? Posts, String? gender, String? email, List<String>? instrument, List<String>? style, String? country, String? state, String? city}) {
    return User._internal(
      id: id,
      user_name: user_name ?? this.user_name,
      name: name ?? this.name,
      age: age ?? this.age,
      bio: bio ?? this.bio,
      pic: pic ?? this.pic,
      Posts: Posts ?? this.Posts,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      instrument: instrument ?? this.instrument,
      style: style ?? this.style,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city);
  }
  
  User copyWithModelFieldValues({
    ModelFieldValue<String>? user_name,
    ModelFieldValue<String>? name,
    ModelFieldValue<String?>? age,
    ModelFieldValue<String?>? bio,
    ModelFieldValue<String?>? pic,
    ModelFieldValue<List<Post>?>? Posts,
    ModelFieldValue<String?>? gender,
    ModelFieldValue<String?>? email,
    ModelFieldValue<List<String>?>? instrument,
    ModelFieldValue<List<String>?>? style,
    ModelFieldValue<String?>? country,
    ModelFieldValue<String?>? state,
    ModelFieldValue<String?>? city
  }) {
    return User._internal(
      id: id,
      user_name: user_name == null ? this.user_name : user_name.value,
      name: name == null ? this.name : name.value,
      age: age == null ? this.age : age.value,
      bio: bio == null ? this.bio : bio.value,
      pic: pic == null ? this.pic : pic.value,
      Posts: Posts == null ? this.Posts : Posts.value,
      gender: gender == null ? this.gender : gender.value,
      email: email == null ? this.email : email.value,
      instrument: instrument == null ? this.instrument : instrument.value,
      style: style == null ? this.style : style.value,
      country: country == null ? this.country : country.value,
      state: state == null ? this.state : state.value,
      city: city == null ? this.city : city.value
    );
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _user_name = json['user_name'],
      _name = json['name'],
      _age = json['age'],
      _bio = json['bio'],
      _pic = json['pic'],
      _Posts = json['Posts'] is List
        ? (json['Posts'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Post.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _gender = json['gender'],
      _email = json['email'],
      _instrument = json['instrument']?.cast<String>(),
      _style = json['style']?.cast<String>(),
      _country = json['country'],
      _state = json['state'],
      _city = json['city'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'user_name': _user_name, 'name': _name, 'age': _age, 'bio': _bio, 'pic': _pic, 'Posts': _Posts?.map((Post? e) => e?.toJson()).toList(), 'gender': _gender, 'email': _email, 'instrument': _instrument, 'style': _style, 'country': _country, 'state': _state, 'city': _city, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'user_name': _user_name,
    'name': _name,
    'age': _age,
    'bio': _bio,
    'pic': _pic,
    'Posts': _Posts,
    'gender': _gender,
    'email': _email,
    'instrument': _instrument,
    'style': _style,
    'country': _country,
    'state': _state,
    'city': _city,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<UserModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<UserModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final USER_NAME = amplify_core.QueryField(fieldName: "user_name");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final AGE = amplify_core.QueryField(fieldName: "age");
  static final BIO = amplify_core.QueryField(fieldName: "bio");
  static final PIC = amplify_core.QueryField(fieldName: "pic");
  static final POSTS = amplify_core.QueryField(
    fieldName: "Posts",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Post'));
  static final GENDER = amplify_core.QueryField(fieldName: "gender");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final INSTRUMENT = amplify_core.QueryField(fieldName: "instrument");
  static final STYLE = amplify_core.QueryField(fieldName: "style");
  static final COUNTRY = amplify_core.QueryField(fieldName: "country");
  static final STATE = amplify_core.QueryField(fieldName: "state");
  static final CITY = amplify_core.QueryField(fieldName: "city");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.USER_NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.AGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.BIO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.PIC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.POSTS,
      isRequired: false,
      ofModelName: 'Post',
      associatedKey: Post.USERID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.GENDER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.EMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.INSTRUMENT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.STYLE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.COUNTRY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.STATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.CITY,
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

class _UserModelType extends amplify_core.ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'User';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [User] in your schema.
 */
class UserModelIdentifier implements amplify_core.ModelIdentifier<User> {
  final String id;

  /** Create an instance of UserModelIdentifier using [id] the primary key. */
  const UserModelIdentifier({
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
  String toString() => 'UserModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is UserModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}