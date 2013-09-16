/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if an instance method m1 overrides an instance
 * member m2 and m1 does not declare all the named parameters declared by m2.
 * @description Checks that there is no static warning is produced if m1 has the same set of
 * named parameters as m2 but in a different order.
 * @static-clean
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer rodionov
 */

class A {
  f({var x, var y}) { return x+y; }
}

class C extends A {
  f({var y, var x}) { return x+y; }
}

main() {
  try {
    new A().f(x:1, y:2);
    new C().f(x:2, y:1);
  } catch (e) {}
}
