/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic type alias is a declaration [D] of one of the following
 * forms:
 *    m typedef id<X1extendsB1, ..., Xs extendsBs> = T;
 * ...
 * where [m] is derived from metadata, [T] is a type, and [S?] is a type or the
 * empty string.
 * @description Checks that [T] should be a type.
 * @author iarkh@unipro.ru
 */

class A {
 static void callme<T>() { return null; }
}
class B<T> {}
class C<T1, T2> {}

int i = 5;

typedef X1<T> = A;
typedef X2<T> = B<T>;
typedef X3<T> = B;
typedef X4<T1, T2> = C<T1, T2>;
typedef X5<T> = List<T>;
typedef X6<T1, T2> = Map<T1, T2>;
typedef X7<T> = Object;

typedef S1<T> = dynamic;
typedef S2<T> = Null;
typedef S3<T> = void;
typedef S4<T> = FutureOr;
typedef S5<T> = FutureOr<T>;

typedef W1<T> = i;             //# 01: compile-time error
typedef W2<T> = 5;             //# 02: compile-time error
typedef W2<T> = A.callme<T>(); //# 03: compile-time error

main() {}
