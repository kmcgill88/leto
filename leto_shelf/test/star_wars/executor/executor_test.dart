// https://github.com/graphql/graphql-js/blob/e6820a98b27b0d0c0c880edfe3b5b39a72496a62/src/execution/__tests__/executor-test.ts

// import { expect } from 'chai';
// import { describe, it } from 'mocha';

// import { expectJSON } from '../../__testUtils__/expectJSON';

// import { inspect } from '../../jsutils/inspect';
// import { invariant } from '../../jsutils/invariant';

// import { Kind } from '../../language/kinds';
// import { parse } from '../../language/parser';

// import { GraphQLSchema } from '../../type/schema';
// import { GraphQLInt, GraphQLBoolean, GraphQLString } from '../../type/scalars';
// import {
//   GraphQLList,
//   GraphQLNonNull,
//   GraphQLScalarType,
//   GraphQLInterfaceType,
//   GraphQLObjectType,
//   GraphQLUnionType,
// } from '../../type/definition';

// import { execute, executeSync } from '../execute';

import 'dart:convert';

import 'package:shelf_graphql/shelf_graphql.dart';
import 'package:test/test.dart';

void main() {
  Iterable<GraphQLObjectField<Object, Object, T>> fieldsFromMap<T>(
    Map<String, GraphQLType> map,
  ) {
    return map.entries.map((e) => e.value.field(e.key));
  }

  GraphQLObjectType<T> objectTypeFromMap<T extends Object>(
    String name,
    Map<String, GraphQLType> map,
  ) {
    return objectType(
      name,
      fields: fieldsFromMap(map),
    );
  }

  Future<void> simpleTest(
    Map<String, GraphQLType> fields,
    Map<String, Object?>? rootValue,
    String document,
    Map<String, Object?> expectedResponse, {
    String? operationName,
  }) async {
    final schema = GraphQLSchema(
      queryType: objectTypeFromMap(
        'Type',
        fields,
      ),
    );

    final result = await GraphQL(schema, introspect: false).parseAndExecute(
      document,
      initialValue: rootValue,
      operationName: operationName,
    );

    expect(result.toJson(), expectedResponse);
  }

  group('Execute: Handles basic execution tasks', () {
    // it('throws if no document is provided', () {
    //   final schema = new GraphQLSchema({
    //     query: new GraphQLObjectType({
    //       name: 'Type',
    //       fields: {
    //         a: { type: GraphQLString },
    //       },
    //     }),
    //   });

    //   // @ts-expect-error
    //   expect(() => executeSync({ schema })).to.throw('Must provide document.');
    // });

    // it('throws if no schema is provided', () {
    //   final document = parse('{ field }');

    //   // @ts-expect-error
    //   expect(() => executeSync({ document })).to.throw(
    //     'Expected undefined to be a GraphQL schema.',
    //   );
    // });

    // it('throws on invalid variables', () {
    //   final schema = new GraphQLSchema({
    //     query: new GraphQLObjectType({
    //       name: 'Type',
    //       fields: {
    //         fieldA: {
    //           type: GraphQLString,
    //           args: { argA: { type: GraphQLInt } },
    //         },
    //       },
    //     }),
    //   });
    //   final document = parse(`
    //     query ($a: Int) {
    //       fieldA(argA: $a)
    //     }
    //   `);
    //   final variableValues = '{ "a": 1 }';

    //   // @ts-expect-error
    //   expect(() => executeSync({ schema, document, variableValues })).to.throw(
    //     'Variables must be provided as an Object where each property is a variable value. Perhaps look to see if an unparsed JSON string was provided.',
    //   );
    // });

    // TODO:
    // it('executes arbitrary code', () async {
    //   final data = {
    //     a: () => 'Apple',
    //     b: () => 'Banana',
    //     c: () => 'Cookie',
    //     d: () => 'Donut',
    //     e: () => 'Egg',
    //     f: 'Fish',
    //     // Called only by DataType::pic static resolver
    //     pic: (size: number) => 'Pic of size: ' + size,
    //     deep: () => deepData,
    //     promise: promiseData,
    //   };

    //   final deepData = {
    //     a: () => 'Already Been Done',
    //     b: () => 'Boring',
    //     c: () => ['Contrived', undefined, 'Confusing'],
    //     deeper: () => [data, null, data],
    //   };

    //   function promiseData() {
    //     return Promise.resolve(data);
    //   }

    //   final DataType: GraphQLObjectType = new GraphQLObjectType({
    //     name: 'DataType',
    //     fields: () => ({
    //       a: { type: GraphQLString },
    //       b: { type: GraphQLString },
    //       c: { type: GraphQLString },
    //       d: { type: GraphQLString },
    //       e: { type: GraphQLString },
    //       f: { type: GraphQLString },
    //       pic: {
    //         args: { size: { type: GraphQLInt } },
    //         type: GraphQLString,
    //         resolve: (obj, { size }) => obj.pic(size),
    //       },
    //       deep: { type: DeepDataType },
    //       promise: { type: DataType },
    //     }),
    //   });

    //   final DeepDataType = new GraphQLObjectType({
    //     name: 'DeepDataType',
    //     fields: {
    //       a: { type: GraphQLString },
    //       b: { type: GraphQLString },
    //       c: { type: new GraphQLList(GraphQLString) },
    //       deeper: { type: new GraphQLList(DataType) },
    //     },
    //   });

    //   final document = parse(`
    //     query ($size: Int) {
    //       a,
    //       b,
    //       x: c
    //       ...c
    //       f
    //       ...on DataType {
    //         pic(size: $size)
    //         promise {
    //           a
    //         }
    //       }
    //       deep {
    //         a
    //         b
    //         c
    //         deeper {
    //           a
    //           b
    //         }
    //       }
    //     }

    //     fragment c on DataType {
    //       d
    //       e
    //     }
    //   `);

    //   final result = await execute({
    //     schema: new GraphQLSchema({ query: DataType }),
    //     document,
    //     rootValue: data,
    //     variableValues: { size: 100 },
    //   });

    //   expect(result).to.deep.equal({
    //     data: {
    //       a: 'Apple',
    //       b: 'Banana',
    //       x: 'Cookie',
    //       d: 'Donut',
    //       e: 'Egg',
    //       f: 'Fish',
    //       pic: 'Pic of size: 100',
    //       promise: { a: 'Apple' },
    //       deep: {
    //         a: 'Already Been Done',
    //         b: 'Boring',
    //         c: ['Contrived', null, 'Confusing'],
    //         deeper: [
    //           { a: 'Apple', b: 'Banana' },
    //           null,
    //           { a: 'Apple', b: 'Banana' },
    //         ],
    //       },
    //     },
    //   });
    // });

    test('merges parallel fragments', () async {
      // final data = {'a': 'Apple', 'b': 'Banana', 'c': 'Cherry'};
      final Type = objectType<Object>('Type', fields: [
        graphQLString.field('a', resolve: (_, __) => 'Apple'),
        graphQLString.field('b', resolve: (_, __) => 'Banana'),
        graphQLString.field('c', resolve: (_, __) => 'Cherry'),
      ]);
      Type.fields.add(
        Type.field('deep', resolve: (_, __) => <String, Object?>{}),
      );

      final schema = GraphQLSchema(queryType: Type);

      const document = '''
      { a, ...FragOne, ...FragTwo }

      fragment FragOne on Type {
        b
        deep { b, deeper: deep { b } }
      }

      fragment FragTwo on Type {
        c
        deep { c, deeper: deep { c } }
      }
    ''';

      final result = await GraphQL(schema).parseAndExecute(document);
      print(printSchema(schema));
      print(result);
      expect(result.toJson(), {
        'data': {
          'a': 'Apple',
          'b': 'Banana',
          'c': 'Cherry',
          'deep': {
            'b': 'Banana',
            'c': 'Cherry',
            'deeper': {
              'b': 'Banana',
              'c': 'Cherry',
            },
          },
        },
      });
    });

    // it('provides info about current execution state', () {
    //   let resolvedInfo;
    //   final testType = new GraphQLObjectType({
    //     name: 'Test',
    //     fields: {
    //       test: {
    //         type: GraphQLString,
    //         resolve(_val, _args, _ctx, info) {
    //           resolvedInfo = info;
    //         },
    //       },
    //     },
    //   });
    //   final schema = new GraphQLSchema({ query: testType });

    //   final document = parse('query ($var: String) { result: test }');
    //   final rootValue = { root: 'val' };
    //   final variableValues = { var: 'abc' };

    //   executeSync({ schema, document, rootValue, variableValues });

    //   expect(resolvedInfo).to.have.all.keys(
    //     'fieldName',
    //     'fieldNodes',
    //     'returnType',
    //     'parentType',
    //     'path',
    //     'schema',
    //     'fragments',
    //     'rootValue',
    //     'operation',
    //     'variableValues',
    //   );

    //   final operation = document.definitions[0];
    //   invariant(operation.kind === Kind.OPERATION_DEFINITION);

    //   expect(resolvedInfo).to.include({
    //     fieldName: 'test',
    //     returnType: GraphQLString,
    //     parentType: testType,
    //     schema,
    //     rootValue,
    //     operation,
    //   });

    //   final field = operation.selectionSet.selections[0];
    //   expect(resolvedInfo).to.deep.include({
    //     fieldNodes: [field],
    //     path: { prev: undefined, key: 'result', typename: 'Test' },
    //     variableValues: { var: 'abc' },
    //   });
    // });

    // test('populates path correctly with complex types', () async {
    //   String? path;
    //   final someObject = objectType<Object>(
    //     'SomeObject',
    //     fields: [
    //       graphQLString.field(
    //         'test',
    //         resolve: (obj, ctx) {
    //           path = info.path;
    //         },
    //       ),
    //     ],
    //   );
    //   final someUnion = GraphQLUnionType(
    //     'SomeUnion',
    //     [someObject],
    //     // TODO:
    //     // resolveType() {
    //     //   return 'SomeObject';
    //     // },
    //   );
    //   final testType = objectType<Object>(
    //     'SomeQuery',
    //     fields: [
    //       field(
    //         'test',
    //         listOf(someUnion.nonNull()).nonNull(),
    //       )
    //     ],
    //   );
    //   final schema = GraphQLSchema(queryType: testType);
    //   final rootValue = {
    //     'test': [<String, Object?>{}]
    //   };
    //   const document = '''
    //     query {
    //       l1: test {
    //         ... on SomeObject {
    //           l2: test
    //         }
    //       }
    //     }
    //   ''';

    //   executeSync({schema, document, rootValue});

    //   expect(path, {
    //     'key': 'l2',
    //     'typename': 'SomeObject',
    //     'prev': {
    //       'key': 0,
    //       'typename': null,
    //       'prev': {
    //         'key': 'l1',
    //         'typename': 'SomeQuery',
    //         'prev': null,
    //       },
    //     },
    //   });
    // });

    test('threads root value context correctly', () async {
      Object? resolvedRootValue;
      final schema = GraphQLSchema(
        queryType: objectType(
          'Type',
          fields: [
            graphQLString.field(
              'a',
              resolve: (rootValueArg, ctx) {
                resolvedRootValue = rootValueArg;
              },
            )
          ],
        ),
      );

      final rootValue = {'contextThing': 'thing'};

      await GraphQL(schema).parseAndExecute(
        'query Example { a }',
        initialValue: rootValue,
      );

      expect(resolvedRootValue, rootValue);
    });

    test('correctly threads arguments', () async {
      Object? resolvedArgs;
      final schema = GraphQLSchema(
        queryType: objectType(
          'Type',
          fields: [
            field(
              'b',
              graphQLString,
              inputs: [
                GraphQLFieldInput('numArg', graphQLInt),
                GraphQLFieldInput('stringArg', graphQLString),
              ],
              resolve: (_, ctx) {
                resolvedArgs = ctx.args;
              },
            )
          ],
        ),
      );

      const document = '''
        query Example {
          b(numArg: 123, stringArg: "foo")
        }
      ''';

      await GraphQL(schema).parseAndExecute(document);
      expect(resolvedArgs, {'numArg': 123, 'stringArg': 'foo'});
    });

    // it('nulls out error subtrees', () async {
    //   final schema = new GraphQLSchema({
    //     query: new GraphQLObjectType({
    //       name: 'Type',
    //       fields: {
    //         sync: { type: GraphQLString },
    //         syncError: { type: GraphQLString },
    //         syncRawError: { type: GraphQLString },
    //         syncReturnError: { type: GraphQLString },
    //         syncReturnErrorList: { type: new GraphQLList(GraphQLString) },
    //         async: { type: GraphQLString },
    //         asyncReject: { type: GraphQLString },
    //         asyncRejectWithExtensions: { type: GraphQLString },
    //         asyncRawReject: { type: GraphQLString },
    //         asyncEmptyReject: { type: GraphQLString },
    //         asyncError: { type: GraphQLString },
    //         asyncRawError: { type: GraphQLString },
    //         asyncReturnError: { type: GraphQLString },
    //         asyncReturnErrorWithExtensions: { type: GraphQLString },
    //       },
    //     }),
    //   });

    //   final document = parse(`
    //     {
    //       sync
    //       syncError
    //       syncRawError
    //       syncReturnError
    //       syncReturnErrorList
    //       async
    //       asyncReject
    //       asyncRawReject
    //       asyncEmptyReject
    //       asyncError
    //       asyncRawError
    //       asyncReturnError
    //       asyncReturnErrorWithExtensions
    //     }
    //   `);

    //   final rootValue = {
    //     sync() {
    //       return 'sync';
    //     },
    //     syncError() {
    //       throw new Error('Error getting syncError');
    //     },
    //     syncRawError() {
    //       // eslint-disable-next-line @typescript-eslint/no-throw-literal
    //       throw 'Error getting syncRawError';
    //     },
    //     syncReturnError() {
    //       return new Error('Error getting syncReturnError');
    //     },
    //     syncReturnErrorList() {
    //       return [
    //         'sync0',
    //         new Error('Error getting syncReturnErrorList1'),
    //         'sync2',
    //         new Error('Error getting syncReturnErrorList3'),
    //       ];
    //     },
    //     async() {
    //       return new Promise((resolve) => resolve('async'));
    //     },
    //     asyncReject() {
    //       return new Promise((_, reject) =>
    //         reject(new Error('Error getting asyncReject')),
    //       );
    //     },
    //     asyncRawReject() {
    //       // eslint-disable-next-line prefer-promise-reject-errors
    //       return Promise.reject('Error getting asyncRawReject');
    //     },
    //     asyncEmptyReject() {
    //       // eslint-disable-next-line prefer-promise-reject-errors
    //       return Promise.reject();
    //     },
    //     asyncError() {
    //       return new Promise(() {
    //         throw new Error('Error getting asyncError');
    //       });
    //     },
    //     asyncRawError() {
    //       return new Promise(() {
    //         // eslint-disable-next-line @typescript-eslint/no-throw-literal
    //         throw 'Error getting asyncRawError';
    //       });
    //     },
    //     asyncReturnError() {
    //       return Promise.resolve(new Error('Error getting asyncReturnError'));
    //     },
    //     asyncReturnErrorWithExtensions() {
    //       final error = new Error('Error getting asyncReturnErrorWithExtensions');
    //       // @ts-expect-error
    //       error.extensions = { foo: 'bar' };

    //       return Promise.resolve(error);
    //     },
    //   };

    //   final result = await execute({ schema, document, rootValue });
    //   expectJSON(result).to.deep.equal({
    //     data: {
    //       sync: 'sync',
    //       syncError: null,
    //       syncRawError: null,
    //       syncReturnError: null,
    //       syncReturnErrorList: ['sync0', null, 'sync2', null],
    //       async: 'async',
    //       asyncReject: null,
    //       asyncRawReject: null,
    //       asyncEmptyReject: null,
    //       asyncError: null,
    //       asyncRawError: null,
    //       asyncReturnError: null,
    //       asyncReturnErrorWithExtensions: null,
    //     },
    //     errors: [
    //       {
    //         message: 'Error getting syncError',
    //         locations: [{ line: 4, column: 9 }],
    //         path: ['syncError'],
    //       },
    //       {
    //         message: 'Unexpected error value: "Error getting syncRawError"',
    //         locations: [{ line: 5, column: 9 }],
    //         path: ['syncRawError'],
    //       },
    //       {
    //         message: 'Error getting syncReturnError',
    //         locations: [{ line: 6, column: 9 }],
    //         path: ['syncReturnError'],
    //       },
    //       {
    //         message: 'Error getting syncReturnErrorList1',
    //         locations: [{ line: 7, column: 9 }],
    //         path: ['syncReturnErrorList', 1],
    //       },
    //       {
    //         message: 'Error getting syncReturnErrorList3',
    //         locations: [{ line: 7, column: 9 }],
    //         path: ['syncReturnErrorList', 3],
    //       },
    //       {
    //         message: 'Error getting asyncReject',
    //         locations: [{ line: 9, column: 9 }],
    //         path: ['asyncReject'],
    //       },
    //       {
    //         message: 'Unexpected error value: "Error getting asyncRawReject"',
    //         locations: [{ line: 10, column: 9 }],
    //         path: ['asyncRawReject'],
    //       },
    //       {
    //         message: 'Unexpected error value: undefined',
    //         locations: [{ line: 11, column: 9 }],
    //         path: ['asyncEmptyReject'],
    //       },
    //       {
    //         message: 'Error getting asyncError',
    //         locations: [{ line: 12, column: 9 }],
    //         path: ['asyncError'],
    //       },
    //       {
    //         message: 'Unexpected error value: "Error getting asyncRawError"',
    //         locations: [{ line: 13, column: 9 }],
    //         path: ['asyncRawError'],
    //       },
    //       {
    //         message: 'Error getting asyncReturnError',
    //         locations: [{ line: 14, column: 9 }],
    //         path: ['asyncReturnError'],
    //       },
    //       {
    //         message: 'Error getting asyncReturnErrorWithExtensions',
    //         locations: [{ line: 15, column: 9 }],
    //         path: ['asyncReturnErrorWithExtensions'],
    //         extensions: { foo: 'bar' },
    //       },
    //     ],
    //   });
    // });

    test('nulls error subtree for promise rejection #1071', () async {
      final schema = GraphQLSchema(
        queryType: objectType('Query', fields: [
          listOf(objectType<Object>(
            'Food',
            fields: [
              graphQLString.field('name'),
            ],
          )).field(
            'foods',
            resolve: (parent, ctx) {
              return Future.error(GraphQLExceptionError('Oops'));
            },
          )
        ]),
      );

      const document = '''
        query {
          foods {
            name
          }
        }
      ''';

      final result = await GraphQL(schema).parseAndExecute(document);

      expect(result.toJson(), {
        'data': {'foods': null},
        'errors': [
          {
            'locations': [
              {'column': 10, 'line': 1}
            ],
            'message': 'Oops',
            'path': ['foods'],
          },
        ],
      });
    });

    test('Full response path is included for non-nullable fields', () async {
      GraphQLObjectType<Object>? _A;
      GraphQLObjectType<Object> A() {
        return _A ??= objectType('A', fields: [
          field(
            'nullableA',
            refType(A),
            resolve: (_, __) => <String, Object?>{},
          ),
          field(
            'nonNullA',
            refType(A).nonNull(),
            resolve: (_, __) => <String, Object?>{},
          ),
          field(
            'throws',
            graphQLString.nonNull(),
            resolve: (_, __) {
              throw GraphQLExceptionError('Catch me if you can');
            },
          ),
        ]);
      }

      final schema = GraphQLSchema(
        queryType: objectType(
          'query',
          fields: [
            A().nonNull().field(
                  'nullableA',
                  resolve: (_, __) => <String, Object?>{},
                ),
          ],
        ),
      );

      const document = '''
        query {
          nullableA {
            aliasedA: nullableA {
              nonNullA {
                anotherA: nonNullA {
                  throws
                }
              }
            }
          }
        }
      ''';

      final result = await GraphQL(schema).parseAndExecute(document);
      expect(result.toJson(), {
        'data': {
          'nullableA': {
            'aliasedA': null,
          },
        },
        'errors': [
          {
            'message': 'Catch me if you can',
            'locations': [
              {'line': 5, 'column': 18}
            ],
            'path': ['nullableA', 'aliasedA', 'nonNullA', 'anotherA', 'throws'],
          },
        ],
      });
    });

    test('uses the inline operation if no operation name is provided',
        () async {
      final schema = GraphQLSchema(
        queryType: objectType(
          'Type',
          fields: [graphQLString.field('a')],
        ),
      );
      final rootValue = {'a': 'b'};

      final result = await GraphQL(schema).parseAndExecute(
        '{ a }',
        initialValue: rootValue,
      );
      expect(result.toJson(), {
        'data': {'a': 'b'}
      });
    });

    test('uses the only operation if no operation name is provided', () async {
      await simpleTest(
        {'a': graphQLString},
        {'a': 'b'},
        'query Example { a }',
        {
          'data': {'a': 'b'}
        },
      );
    });

    test('uses the named operation if operation name is provided', () async {
      await simpleTest(
        {'a': graphQLString},
        {'a': 'b'},
        'query Example { first: a } query OtherExample { second: a }',
        {
          'data': {'second': 'b'}
        },
        operationName: 'OtherExample',
      );
    });

    test('provides error if no operation is provided', () async {
      await simpleTest(
        {'a': graphQLString},
        {'a': 'b'},
        'fragment Example on Type { a }',
        {
          'errors': [
            {'message': 'This document does not define any operations.'}
          ],
        },
      );
    });

    test('errors if no op name is provided with multiple operations', () async {
      await simpleTest(
        {'a': graphQLString},
        null,
        'query Example { a } query OtherExample { a }',
        {
          'errors': [
            {
              'message': 'Multiple operations found, '
                  'please provide an operation name.',
            },
          ],
        },
      );
    });

    test('errors if unknown operation name is provided', () async {
      await simpleTest(
        {'a': graphQLString},
        null,
        '''
        query Example { a }
        query OtherExample { a }
        ''',
        {
          'errors': [
            {'message': 'Operation named "UnknownExample" not found in query.'}
          ],
        },
        operationName: 'UnknownExample',
      );
    });

    // it('errors if empty string is provided as operation name', () {
    //   final schema = new GraphQLSchema({
    //     query: new GraphQLObjectType({
    //       name: 'Type',
    //       fields: {
    //         a: { type: GraphQLString },
    //       },
    //     }),
    //   });
    //   final document = parse('{ a }');
    //   final operationName = '';

    //   final result = executeSync({ schema, document, operationName });
    //   expectJSON(result).to.deep.equal({
    //     errors: [{ message: 'Unknown operation named "".' }],
    //   });
    // });

    // it('uses the query schema for queries', () {
    //   final schema = new GraphQLSchema({
    //     query: new GraphQLObjectType({
    //       name: 'Q',
    //       fields: {
    //         a: { type: GraphQLString },
    //       },
    //     }),
    //     mutation: new GraphQLObjectType({
    //       name: 'M',
    //       fields: {
    //         c: { type: GraphQLString },
    //       },
    //     }),
    //     subscription: new GraphQLObjectType({
    //       name: 'S',
    //       fields: {
    //         a: { type: GraphQLString },
    //       },
    //     }),
    //   });
    //   final document = parse(`
    //     query Q { a }
    //     mutation M { c }
    //     subscription S { a }
    //   `);
    //   final rootValue = { a: 'b', c: 'd' };
    //   final operationName = 'Q';

    //   final result = executeSync({ schema, document, rootValue, operationName });
    //   expect(result).to.deep.equal({ data: { a: 'b' } });
    // });

    // it('uses the mutation schema for mutations', () {
    //   final schema = new GraphQLSchema({
    //     query: new GraphQLObjectType({
    //       name: 'Q',
    //       fields: {
    //         a: { type: GraphQLString },
    //       },
    //     }),
    //     mutation: new GraphQLObjectType({
    //       name: 'M',
    //       fields: {
    //         c: { type: GraphQLString },
    //       },
    //     }),
    //   });
    //   final document = parse(`
    //     query Q { a }
    //     mutation M { c }
    //   `);
    //   final rootValue = { a: 'b', c: 'd' };
    //   final operationName = 'M';

    //   final result = executeSync({ schema, document, rootValue, operationName });
    //   expect(result).to.deep.equal({ data: { c: 'd' } });
    // });

    // it('uses the subscription schema for subscriptions', () {
    //   final schema = new GraphQLSchema({
    //     query: new GraphQLObjectType({
    //       name: 'Q',
    //       fields: {
    //         a: { type: GraphQLString },
    //       },
    //     }),
    //     subscription: new GraphQLObjectType({
    //       name: 'S',
    //       fields: {
    //         a: { type: GraphQLString },
    //       },
    //     }),
    //   });
    //   final document = parse(`
    //     query Q { a }
    //     subscription S { a }
    //   `);
    //   final rootValue = { a: 'b', c: 'd' };
    //   final operationName = 'S';

    //   final result = executeSync({ schema, document, rootValue, operationName });
    //   expect(result).to.deep.equal({ data: { a: 'b' } });
    // });

    test('correct field ordering despite execution order', () async {
      await simpleTest(
        {
          'a': graphQLString,
          'b': graphQLString,
          'c': graphQLString,
          'd': graphQLString,
          'e': graphQLString,
        },
        {
          'a': 'a',
          'b': Future.value('b'),
          'c': 'c',
          'd': Future.value('d'),
          'e': 'e',
        },
        '{ a, b, c, d, e }',
        {
          'data': {'a': 'a', 'b': 'b', 'c': 'c', 'd': 'd', 'e': 'e'},
        },
      );
    });

    test('Avoids recursion', () async {
      await simpleTest(
        {'a': graphQLString},
        {'a': 'b'},
        '''
        {
          a
          ...Frag
          ...Frag
        }

        fragment Frag on Type {
          a,
          ...Frag
        }
      ''',
        {
          'data': {'a': 'b'},
        },
      );
    });

    test('ignores missing sub selections on fields', () async {
      await simpleTest(
        {
          'a': objectType(
            'SomeType',
            fields: fieldsFromMap({'b': graphQLString}),
          )
        },
        {
          'a': {'b': 'c'}
        },
        '{ a }',
        {
          'data': {'a': <String, Object?>{}},
        },
      );
    });

    test('does not include illegal fields in output', () async {
      await simpleTest(
        {'a': graphQLString},
        null,
        '{ thisIsIllegalDoNotIncludeMe }',
        {
          'data': <String, Object?>{},
        },
      );
    });

    test('does not include arguments that were not set', () async {
      final schema = GraphQLSchema(
        queryType: objectType(
          'Type',
          fields: [
            graphQLString.field(
              'field',
              resolve: (_source, ctx) => jsonEncode(ctx.args),
              inputs: [
                GraphQLFieldInput('a', graphQLBoolean),
                GraphQLFieldInput('b', graphQLBoolean),
                GraphQLFieldInput('c', graphQLBoolean),
                GraphQLFieldInput('d', graphQLInt),
                GraphQLFieldInput('e', graphQLInt),
              ],
            ),
          ],
        ),
      );

      final result = await GraphQL(schema, introspect: false).parseAndExecute(
        '{ field(a: true, c: false, e: 0) }',
      );

      expect(result.toJson(), {
        'data': {
          'field': '{"a":true,"c":false,"e":0}',
        },
      });
    });

    test('fails when an isTypeOf check is not met', () async {
      final SpecialType = objectType<Special>(
        'SpecialType',
        // isTypeOf(obj, context) {
        //   final result = obj instanceof Special;
        //   return context?.async ? Promise.resolve(result) : result;
        // },
        fields: [graphQLString.field('value')],
      );

      final schema = GraphQLSchema(
        queryType: objectType(
          'Query',
          fields: fieldsFromMap({
            'specials': listOf(SpecialType),
          }),
        ),
      );

      final rootValue = {
        'specials': [Special('foo'), NotSpecial('bar')],
      };

      final result = await GraphQL(schema, introspect: false).parseAndExecute(
        '{ specials { value } }',
        initialValue: rootValue,
      );
      expect(result.toJson(), {
        'data': {
          'specials': [
            {'value': 'foo'},
            null
          ],
        },
        'errors': [
          {
            'message': 'Expected value of type "SpecialType" '
                'but got: { value: "bar" }.',
            'locations': [
              {'line': 0, 'column': 1}
            ],
            'path': ['specials', 1],
          },
        ],
      });

      // final contextValue = {async: true};
      // final asyncResult = await execute({
      //   schema,
      //   document,
      //   rootValue,
      //   contextValue,
      // });
      // expect(asyncResult).to.deep.equal(result);
    });

    // it('fails when serialize of custom scalar does not return a value', () {
    //   final customScalar = new GraphQLScalarType({
    //     name: 'CustomScalar',
    //     serialize() {
    //       /* returns nothing */
    //     },
    //   });
    //   final schema = new GraphQLSchema({
    //     query: new GraphQLObjectType({
    //       name: 'Query',
    //       fields: {
    //         customScalar: {
    //           type: customScalar,
    //           resolve: () => 'CUSTOM_VALUE',
    //         },
    //       },
    //     }),
    //   });

    //   final result = executeSync({ schema, document: parse('{ customScalar }') });
    //   expectJSON(result).to.deep.equal({
    //     data: { customScalar: null },
    //     errors: [
    //       {
    //         message:
    //           'Expected `CustomScalar.serialize("CUSTOM_VALUE")` to return non-nullable value, returned: undefined',
    //         locations: [{ line: 1, column: 3 }],
    //         path: ['customScalar'],
    //       },
    //     ],
    //   });
    // });

    test('executes ignoring invalid non-executable definitions', () async {
      await simpleTest(
        {'foo': graphQLString},
        null,
        '''
        { foo }

        type Query { bar: String }
      ''',
        {
          'data': {'foo': null}
        },
      );
    });

    test('uses a custom field resolver', () async {
      final schema = GraphQLSchema(
        queryType: objectType(
          'Query',
          fields: fieldsFromMap({
            'foo': graphQLString,
          }),
        ),
      );

      final result = await GraphQL(
        schema,
        introspect: false,
        defaultFieldResolver: <Object>(obj, fieldName, ctx) => fieldName,
      ).parseAndExecute('{ foo }');

      expect(result.toJson(), {
        'data': {'foo': 'foo'}
      });
    });

    test('uses a custom type resolver', () async {
      const document = '{ foo { bar } }';

      final fooInterface = objectType<Object>(
        'FooInterface',
        fields: fieldsFromMap(
          {
            'bar': graphQLString,
          },
        ),
        isInterface: true,
      );

      // TODO:
      final fooObject = objectType<Object>(
        'FooObject',
        interfaces: [fooInterface],
        fields: fieldsFromMap({
          'bar': graphQLString,
        }),
      );

      final schema = GraphQLSchema(
        queryType: objectType(
          'Query',
          fields: fieldsFromMap({
            'foo': fooInterface,
          }),
        ),
        // types: [fooObject],
      );

      const rootValue = {
        'foo': {'bar': 'bar'}
      };

      // TODO:
      // let possibleTypes;
      // final result = executeSync({
      //   schema,
      //   document,
      //   rootValue,
      //   typeResolver(_source, _context, info, abstractType) {
      //     // Resolver should be able to figure out all possible types on its own
      //     possibleTypes = info.schema.getPossibleTypes(abstractType);

      //     return 'FooObject';
      //   },
      // });

      final result = await GraphQL(schema, introspect: false).parseAndExecute(
        document,
        initialValue: rootValue,
      );
      expect(result.toJson(), {
        'data': {
          'foo': {'bar': 'bar'}
        }
      });
      // expect(possibleTypes).to.deep.equal([fooObject]);
    });
  });
}

class Special {
  final String value;

  Special(this.value);

  Map<String, Object?> toJson() => {'value': value};
}

class NotSpecial {
  final String value;

  NotSpecial(this.value);
}
