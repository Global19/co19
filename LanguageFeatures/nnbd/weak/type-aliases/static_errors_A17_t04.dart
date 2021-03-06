/*
 * Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is not an error to call or tear-off a method, setter, or
 * getter, or to read or write a field, on a receiver of static type Never.
 * Implementations that provide feedback about dead or unreachable code are
 * encouraged to indicate that any arguments to the invocation are unreachable.
 *
 * @description Check that it is a warning to call a method, setter, or
 * getter on a receiver of static type Never via a null aware operator. Test
 * type aliases
 * @author sgrekhov@unipro.ru
 * @issue 39866
 * @static-warning
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
// Requirements=nnbd-weak
typedef Neverland = Never;

void test(var x) {
  if (x is Neverland) {
    x?.toString();      /// static type warning
    x?.runtimeType;     /// static type warning
    x?.s = 1;           /// static type warning
    x?..toString();     /// static type warning
    x?..runtimeType;    /// static type warning
    x?..s = 1;          /// static type warning
  }
}

main() {
  test(null);
}
