/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form super.v = e proceeds as
 * follows:
 * Let g be the method currently executing, and let C be the class in which
 * g was looked up. Let Sdynamic be the superclass of C.
 * ...
 * If the setter lookup has failed, then a new instance im of the predefined
 * class Invocation is created, such that :
 *  • im.isSetter evaluates to true.
 *  • im.memberName evaluates to the symbol v=.
 *  • im.positionalArguments evaluates to an immutable list with the same values
 *    as [o].
 *  • im.namedArguments evaluates to the value of const {}.
 *  Then the method noSuchMethod() is looked up in Sdynamic and invoked
 *  with argument im.  However, if the implementation found cannot be invoked
 *  with a single positional argument, the implementation of noSuchMethod()
 *  in class Object is invoked on this
 * @description Checks that it is a compile error if there is no setter for v in
 * Sdynamic.
 * @author sgrekhov@unipro.ru
 * @compile-error
 */

class TestException {}

class A {
  noSuchMethod(Invocation im) => throw new TestException();
}

class C extends A {
  test() {
    super.v = 1;
  }
}

main() {
  C c = new C();
  c.test();
}
