// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

final messageMetadataSerializer = SerializerValue<MessageMetadata>(
  key: "MessageMetadata",
  fromJson: (ctx, json) =>
      MessageMetadata.fromJson(json), // _$$_MessageMetadataFromJson,
  // toJson: (m) => _$$_MessageMetadataToJson(m as _$_MessageMetadata),
);

GraphQLObjectType<MessageMetadata>? _messageMetadataGraphQLType;

/// Auto-generated from [MessageMetadata].
GraphQLObjectType<MessageMetadata> get messageMetadataGraphQLType {
  final __name = 'MessageMetadata';
  if (_messageMetadataGraphQLType != null)
    return _messageMetadataGraphQLType! as GraphQLObjectType<MessageMetadata>;

  final __messageMetadataGraphQLType =
      objectType<MessageMetadata>(__name, isInterface: false, interfaces: []);

  _messageMetadataGraphQLType = __messageMetadataGraphQLType;
  __messageMetadataGraphQLType.fields.addAll(
    [
      fileMetadataGraphQLType.field('fileMetadata',
          resolve: (obj, ctx) => obj.fileMetadata),
      linksMetadataGraphQLType.field('linksMetadata',
          resolve: (obj, ctx) => obj.linksMetadata),
      graphQLDate
          .nonNull()
          .field('computedAt', resolve: (obj, ctx) => obj.computedAt)
    ],
  );

  return __messageMetadataGraphQLType;
}

final linksMetadataSerializer = SerializerValue<LinksMetadata>(
  key: "LinksMetadata",
  fromJson: (ctx, json) =>
      LinksMetadata.fromJson(json), // _$$_LinksMetadataFromJson,
  // toJson: (m) => _$$_LinksMetadataToJson(m as _$_LinksMetadata),
);

GraphQLObjectType<LinksMetadata>? _linksMetadataGraphQLType;

/// Auto-generated from [LinksMetadata].
GraphQLObjectType<LinksMetadata> get linksMetadataGraphQLType {
  final __name = 'LinksMetadata';
  if (_linksMetadataGraphQLType != null)
    return _linksMetadataGraphQLType! as GraphQLObjectType<LinksMetadata>;

  final __linksMetadataGraphQLType =
      objectType<LinksMetadata>(__name, isInterface: false, interfaces: []);

  _linksMetadataGraphQLType = __linksMetadataGraphQLType;
  __linksMetadataGraphQLType.fields.addAll(
    [
      linkMetadataGraphQLType
          .nonNull()
          .list()
          .nonNull()
          .field('links', resolve: (obj, ctx) => obj.links),
      graphQLString
          .nonNull()
          .list()
          .nonNull()
          .field('emails', resolve: (obj, ctx) => obj.emails),
      graphQLString.nonNull().list().nonNull().field('userTags',
          resolve: (obj, ctx) => obj.userTags,
          description: 'TODO: bring user ids?'),
      graphQLBoolean
          .nonNull()
          .field('hasLinks', resolve: (obj, ctx) => obj.hasLinks)
    ],
  );

  return __linksMetadataGraphQLType;
}

final linkMetadataSerializer = SerializerValue<LinkMetadata>(
  key: "LinkMetadata",
  fromJson: (ctx, json) =>
      LinkMetadata.fromJson(json), // _$$_LinkMetadataFromJson,
  // toJson: (m) => _$$_LinkMetadataToJson(m as _$_LinkMetadata),
);

GraphQLObjectType<LinkMetadata>? _linkMetadataGraphQLType;

/// Auto-generated from [LinkMetadata].
GraphQLObjectType<LinkMetadata> get linkMetadataGraphQLType {
  final __name = 'LinkMetadata';
  if (_linkMetadataGraphQLType != null)
    return _linkMetadataGraphQLType! as GraphQLObjectType<LinkMetadata>;

  final __linkMetadataGraphQLType =
      objectType<LinkMetadata>(__name, isInterface: false, interfaces: []);

  _linkMetadataGraphQLType = __linkMetadataGraphQLType;
  __linkMetadataGraphQLType.fields.addAll(
    [
      graphQLString.field('title', resolve: (obj, ctx) => obj.title),
      graphQLString.field('description',
          resolve: (obj, ctx) => obj.description),
      graphQLString.field('image', resolve: (obj, ctx) => obj.image),
      graphQLString.field('url', resolve: (obj, ctx) => obj.url)
    ],
  );

  return __linkMetadataGraphQLType;
}

final fileMetadataSerializer = SerializerValue<FileMetadata>(
  key: "FileMetadata",
  fromJson: (ctx, json) =>
      FileMetadata.fromJson(json), // _$$_FileMetadataFromJson,
  // toJson: (m) => _$$_FileMetadataToJson(m as _$_FileMetadata),
);

GraphQLObjectType<FileMetadata>? _fileMetadataGraphQLType;

/// Auto-generated from [FileMetadata].
GraphQLObjectType<FileMetadata> get fileMetadataGraphQLType {
  final __name = 'FileMetadata';
  if (_fileMetadataGraphQLType != null)
    return _fileMetadataGraphQLType! as GraphQLObjectType<FileMetadata>;

  final __fileMetadataGraphQLType =
      objectType<FileMetadata>(__name, isInterface: false, interfaces: []);

  _fileMetadataGraphQLType = __fileMetadataGraphQLType;
  __fileMetadataGraphQLType.fields.addAll(
    [
      graphQLInt
          .nonNull()
          .field('sizeInBytes', resolve: (obj, ctx) => obj.sizeInBytes),
      graphQLString
          .nonNull()
          .field('mimeType', resolve: (obj, ctx) => obj.mimeType),
      graphQLString
          .nonNull()
          .field('fileName', resolve: (obj, ctx) => obj.fileName),
      graphQLString
          .nonNull()
          .field('sha1Hash', resolve: (obj, ctx) => obj.sha1Hash),
      graphQLString.field('fileHashBlur',
          resolve: (obj, ctx) => obj.fileHashBlur)
    ],
  );

  return __fileMetadataGraphQLType;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageMetadata _$$_MessageMetadataFromJson(Map<String, dynamic> json) =>
    _$_MessageMetadata(
      fileMetadata: json['fileMetadata'] == null
          ? null
          : FileMetadata.fromJson(json['fileMetadata'] as Map<String, dynamic>),
      linksMetadata: json['linksMetadata'] == null
          ? null
          : LinksMetadata.fromJson(
              json['linksMetadata'] as Map<String, dynamic>),
      computedAt: DateTime.parse(json['computedAt'] as String),
    );

Map<String, dynamic> _$$_MessageMetadataToJson(_$_MessageMetadata instance) =>
    <String, dynamic>{
      'fileMetadata': instance.fileMetadata,
      'linksMetadata': instance.linksMetadata,
      'computedAt': instance.computedAt.toIso8601String(),
    };

_$_LinksMetadata _$$_LinksMetadataFromJson(Map<String, dynamic> json) =>
    _$_LinksMetadata(
      links: (json['links'] as List<dynamic>)
          .map((e) => LinkMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      emails:
          (json['emails'] as List<dynamic>).map((e) => e as String).toList(),
      userTags:
          (json['userTags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_LinksMetadataToJson(_$_LinksMetadata instance) =>
    <String, dynamic>{
      'links': instance.links,
      'emails': instance.emails,
      'userTags': instance.userTags,
    };

_$_LinkMetadata _$$_LinkMetadataFromJson(Map<String, dynamic> json) =>
    _$_LinkMetadata(
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_LinkMetadataToJson(_$_LinkMetadata instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'url': instance.url,
    };

_$_FileMetadata _$$_FileMetadataFromJson(Map<String, dynamic> json) =>
    _$_FileMetadata(
      sizeInBytes: json['sizeInBytes'] as int,
      mimeType: json['mimeType'] as String,
      fileName: json['fileName'] as String,
      sha1Hash: json['sha1Hash'] as String,
      fileHashBlur: json['fileHashBlur'] as String?,
    );

Map<String, dynamic> _$$_FileMetadataToJson(_$_FileMetadata instance) =>
    <String, dynamic>{
      'sizeInBytes': instance.sizeInBytes,
      'mimeType': instance.mimeType,
      'fileName': instance.fileName,
      'sha1Hash': instance.sha1Hash,
      'fileHashBlur': instance.fileHashBlur,
    };
