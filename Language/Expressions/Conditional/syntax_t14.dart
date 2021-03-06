/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A conditional expression evaluates one of two expressions
 * based on a boolean condition.
 * conditionalExpression:
 *   ifNullExpression ('?' expressionWithoutCascade ':'
 * expressionWithoutCascade)?
 * ;
 * @description Checks that a type parameter can not be used as the condition
 * in a conditional expression without a compile error.
 * @compile-error
 * @author msyabro
 */

class A<T> {
  test() {
    T ? "" : '';
  }
}

main() {
  A<int> a = new A<int>();
  a.test();
}
