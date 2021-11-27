// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_rooms.dart';

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

final addChatRoomUserGraphQLField = chatRoomUserGraphQLType.field<Object?>(
  'addChatRoomUser',
  resolve: (obj, ctx) {
    final args = ctx.args;

    return addChatRoomUser(
        ctx, (args["chatId"] as int), (args["userId"] as int),
        role: (args["role"] as ChatRoomUserRole));
  },
  inputs: [
    graphQLInt.nonNull().coerceToInputObject().inputField('chatId'),
    graphQLInt.nonNull().coerceToInputObject().inputField('userId'),
    chatRoomUserRoleGraphQLType
        .nonNull()
        .coerceToInputObject()
        .inputField('role', defaultValue: ChatRoomUserRole.peer)
  ],
);

final deleteChatRoomUserGraphQLField = graphQLBoolean.nonNull().field<Object?>(
  'deleteChatRoomUser',
  resolve: (obj, ctx) {
    final args = ctx.args;

    return deleteChatRoomUser(
        ctx, (args["chatId"] as int), (args["userId"] as int));
  },
  inputs: [
    graphQLInt.nonNull().coerceToInputObject().inputField('chatId'),
    graphQLInt.nonNull().coerceToInputObject().inputField('userId')
  ],
);

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

final userChatAddedEventSerializer = SerializerValue<UserChatAddedEvent>(
  key: "UserChatAddedEvent",
  fromJson: (ctx, json) =>
      UserChatAddedEvent.fromJson(json), // _$$UserChatAddedEventFromJson,
  // toJson: (m) => _$$UserChatAddedEventToJson(m as _$UserChatAddedEvent),
);

GraphQLObjectType<UserChatAddedEvent>? _userChatAddedEventGraphQLType;

/// Auto-generated from [UserChatAddedEvent].
GraphQLObjectType<UserChatAddedEvent> get userChatAddedEventGraphQLType {
  final __name = 'UserChatAddedEvent';
  if (_userChatAddedEventGraphQLType != null)
    return _userChatAddedEventGraphQLType!
        as GraphQLObjectType<UserChatAddedEvent>;

  final __userChatAddedEventGraphQLType = objectType<UserChatAddedEvent>(__name,
      isInterface: false, interfaces: []);

  _userChatAddedEventGraphQLType = __userChatAddedEventGraphQLType;
  __userChatAddedEventGraphQLType.fields.addAll(
    [
      chatRoomUserGraphQLType
          .nonNull()
          .field('chatUser', resolve: (obj, ctx) => obj.chatUser),
      graphQLInt.nonNull().field('chatId', resolve: (obj, ctx) => obj.chatId)
    ],
  );

  return __userChatAddedEventGraphQLType;
}

final userChatRemovedEventSerializer = SerializerValue<UserChatRemovedEvent>(
  key: "UserChatRemovedEvent",
  fromJson: (ctx, json) =>
      UserChatRemovedEvent.fromJson(json), // _$$UserChatRemovedEventFromJson,
  // toJson: (m) => _$$UserChatRemovedEventToJson(m as _$UserChatRemovedEvent),
);

GraphQLObjectType<UserChatRemovedEvent>? _userChatRemovedEventGraphQLType;

/// Auto-generated from [UserChatRemovedEvent].
GraphQLObjectType<UserChatRemovedEvent> get userChatRemovedEventGraphQLType {
  final __name = 'UserChatRemovedEvent';
  if (_userChatRemovedEventGraphQLType != null)
    return _userChatRemovedEventGraphQLType!
        as GraphQLObjectType<UserChatRemovedEvent>;

  final __userChatRemovedEventGraphQLType = objectType<UserChatRemovedEvent>(
      __name,
      isInterface: false,
      interfaces: []);

  _userChatRemovedEventGraphQLType = __userChatRemovedEventGraphQLType;
  __userChatRemovedEventGraphQLType.fields.addAll(
    [
      graphQLInt.nonNull().field('chatId', resolve: (obj, ctx) => obj.chatId),
      graphQLInt.nonNull().field('userId', resolve: (obj, ctx) => obj.userId)
    ],
  );

  return __userChatRemovedEventGraphQLType;
}

final userChatEventSerializer = SerializerValue<UserChatEvent>(
  key: "UserChatEvent",
  fromJson: (ctx, json) =>
      UserChatEvent.fromJson(json), // _$UserChatEventFromJson,
  // toJson: (m) => _$UserChatEventToJson(m as UserChatEvent),
);

GraphQLUnionType<UserChatEvent>? _userChatEventGraphQLType;
GraphQLUnionType<UserChatEvent> get userChatEventGraphQLType {
  return _userChatEventGraphQLType ??= GraphQLUnionType(
    'UserChatEvent',
    [userChatAddedEventGraphQLType, userChatRemovedEventGraphQLType],
  );
}

final chatRoomUserSerializer = SerializerValue<ChatRoomUser>(
  key: "ChatRoomUser",
  fromJson: (ctx, json) =>
      ChatRoomUser.fromJson(json), // _$ChatRoomUserFromJson,
  // toJson: (m) => _$ChatRoomUserToJson(m as ChatRoomUser),
);

GraphQLObjectType<ChatRoomUser>? _chatRoomUserGraphQLType;

/// Auto-generated from [ChatRoomUser].
GraphQLObjectType<ChatRoomUser> get chatRoomUserGraphQLType {
  final __name = 'ChatRoomUser';
  if (_chatRoomUserGraphQLType != null)
    return _chatRoomUserGraphQLType! as GraphQLObjectType<ChatRoomUser>;

  final __chatRoomUserGraphQLType =
      objectType<ChatRoomUser>(__name, isInterface: false, interfaces: []);

  _chatRoomUserGraphQLType = __chatRoomUserGraphQLType;
  __chatRoomUserGraphQLType.fields.addAll(
    [
      userGraphQLType.nonNull().field('user', resolve: (obj, ctx) {
        final args = ctx.args;

        return obj.user(ctx);
      }),
      graphQLInt.nonNull().field('userId', resolve: (obj, ctx) => obj.userId),
      graphQLInt.nonNull().field('chatId', resolve: (obj, ctx) => obj.chatId),
      chatRoomUserRoleGraphQLType
          .nonNull()
          .field('role', resolve: (obj, ctx) => obj.role),
      graphQLDate
          .nonNull()
          .field('createdAt', resolve: (obj, ctx) => obj.createdAt)
    ],
  );

  return __chatRoomUserGraphQLType;
}

/// Auto-generated from [ChatRoomUserRole].
final GraphQLEnumType<ChatRoomUserRole> chatRoomUserRoleGraphQLType = enumType(
    'ChatRoomUserRole',
    const {'admin': ChatRoomUserRole.admin, 'peer': ChatRoomUserRole.peer});

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomUser _$ChatRoomUserFromJson(Map<String, dynamic> json) => ChatRoomUser(
      userId: json['userId'] as int,
      chatId: json['chatId'] as int,
      role: $enumDecode(_$ChatRoomUserRoleEnumMap, json['role']),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ChatRoomUserToJson(ChatRoomUser instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'chatId': instance.chatId,
      'role': _$ChatRoomUserRoleEnumMap[instance.role],
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$ChatRoomUserRoleEnumMap = {
  ChatRoomUserRole.admin: 'admin',
  ChatRoomUserRole.peer: 'peer',
};

_$UserChatAddedEvent _$$UserChatAddedEventFromJson(Map<String, dynamic> json) =>
    _$UserChatAddedEvent(
      chatUser: ChatRoomUser.fromJson(json['chatUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserChatAddedEventToJson(
        _$UserChatAddedEvent instance) =>
    <String, dynamic>{
      'chatUser': instance.chatUser,
    };

_$UserChatRemovedEvent _$$UserChatRemovedEventFromJson(
        Map<String, dynamic> json) =>
    _$UserChatRemovedEvent(
      chatId: json['chatId'] as int,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$$UserChatRemovedEventToJson(
        _$UserChatRemovedEvent instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'userId': instance.userId,
    };
