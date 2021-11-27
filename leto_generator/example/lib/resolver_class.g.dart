// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolver_class.dart';

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

final queryInClassGraphQLField = graphQLString.nonNull().field<Object?>(
  'queryInClass',
  resolve: (obj, ctx) {
    final args = ctx.args;

    final _call = (Resolver r) => r.queryInClass(ctx);
    // ignore: unnecessary_non_null_assertion
    final FutureOr<Resolver> _obj = Resolver();
    if (_obj is Future<Resolver>)
      return _obj.then(_call);
    else
      return _call(_obj);
  },
);

final mutationInClassGraphQLField = graphQLString.nonNull().field<Object?>(
  'mutationInClass',
  resolve: (obj, ctx) {
    final args = ctx.args;

    final _call =
        (Resolver r) => r.mutationInClass((args["values"] as List<int?>));
    // ignore: unnecessary_non_null_assertion
    final FutureOr<Resolver> _obj = Resolver();
    if (_obj is Future<Resolver>)
      return _obj.then(_call);
    else
      return _call(_obj);
  },
  inputs: [
    graphQLInt.list().nonNull().coerceToInputObject().inputField('values')
  ],
);

final queryInClass2GraphQLField = graphQLString.nonNull().field<Object?>(
  'queryInClass2',
  resolve: (obj, ctx) {
    final args = ctx.args;

    final _call = (Resolver2 r) => r.queryInClass2();
    // ignore: unnecessary_non_null_assertion
    final FutureOr<Resolver2> _obj = instance2;
    if (_obj is Future<Resolver2>)
      return _obj.then(_call);
    else
      return _call(_obj);
  },
);

final queryInClass3GraphQLField = graphQLString.nonNull().field<Object?>(
  'queryInClass3',
  resolve: (obj, ctx) {
    final args = ctx.args;

    final _call = (Resolver3 r) => r.queryInClass3(ctx);
    // ignore: unnecessary_non_null_assertion
    final FutureOr<Resolver3> _obj = Resolver3.ref.get(ctx)!;
    if (_obj is Future<Resolver3>)
      return _obj.then(_call);
    else
      return _call(_obj);
  },
);

final queryInClass4GraphQLField = graphQLString.nonNull().field<Object?>(
  'queryInClass4',
  resolve: (obj, ctx) {
    final args = ctx.args;

    final _call = (Resolver4 r) => r.queryInClass4(ctx);
    // ignore: unnecessary_non_null_assertion
    final FutureOr<Resolver4> _obj = Resolver4.ref.get(ctx)!;
    if (_obj is Future<Resolver4>)
      return _obj.then(_call);
    else
      return _call(_obj);
  },
);

final queryInClass5GraphQLField = graphQLString.nonNull().field<Object?>(
  'queryInClass5',
  resolve: (obj, ctx) {
    final args = ctx.args;

    final _call = (Resolver5 r) => r.queryInClass5(ctx);
    // ignore: unnecessary_non_null_assertion
    final FutureOr<Resolver5> _obj = (_mapToType[Resolver5]! as Resolver5);
    if (_obj is Future<Resolver5>)
      return _obj.then(_call);
    else
      return _call(_obj);
  },
);

final queryInClass6GraphQLField = graphQLString.nonNull().field<Object?>(
  'queryInClass6',
  resolve: (obj, ctx) {
    final args = ctx.args;

    final _call = (Resolver6 r) => r.queryInClass6();
    // ignore: unnecessary_non_null_assertion
    final FutureOr<Resolver6> _obj =
        _mapToRef[Resolver6]!.get(ctx) as FutureOr<Resolver6>;
    if (_obj is Future<Resolver6>)
      return _obj.then(_call);
    else
      return _call(_obj);
  },
);
