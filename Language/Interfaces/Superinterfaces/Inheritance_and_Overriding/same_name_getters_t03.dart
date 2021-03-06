/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We define inherited(J, K) to be
 * the set of members m such that all of the following hold:
 * • m is accessible to K and
 * • A is a direct superinterface of J and either
 * – A declares a member m or
 * – m is a member of inherited(A, K).
 * • m is not overridden by J.
 * ...
 * However, if the above rules would cause multiple members m1,...,mk with
 * the same name n to be inherited (because identically named members existed
 * in several superinterfaces) then at most one member is inherited
 * @description Checks that if multiple getters with the same name are
 * inherited actually only one getter is inherited and no static warning
 * issued. Test type aliases
 * @static-clean
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import '../../../../Utils/expect.dart';

abstract class SI1 {
  int get m => 1;
}

abstract class SI2 {
  int get m => 2;
}

typedef SIAlias1 = SI1;
typedef SIAlias2 = SI2;

abstract class I implements SIAlias1, SIAlias2 {
}

class C extends I {
  int get m => 3;
}

main() {
  I i = new C();
  Expect.equals(3, i.m, "Wrong getter inherited");
}
