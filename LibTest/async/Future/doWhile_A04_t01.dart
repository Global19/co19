/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Future doWhile(dynamic f())
 * Perform an async operation repeatedly until it returns false.
 * . . .
 * If it returns a non-Future, iteration continues immediately.
 *
 * @description Checks that if f returns non-Future, iteration continues
 * immediately. Future f() returns new Object();
 *
 * @author ngl@unipro.ru
 */
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:async";

const N = 5;

main() {
  int num = 0;

  dynamic getObject() {
    return new Object();
  }

  Future ff() {
    if (num == 2) {
      num++;
      return getObject();
    }
    Completer c = new Completer();
    if (num < N) {
      num++;
      c.complete(true);
      return c.future;
    } else {
      c.complete(false);
      return c.future;
    }
  }

  Future f = Future.doWhile(ff);

  asyncStart();
  f.then((fValue) {
    Expect.fail("Should not be here");
    asyncEnd();
  }).catchError((e) {
    Expect.isTrue(e is TypeError);
    Expect.equals(3, num);
    asyncEnd();
  });

}