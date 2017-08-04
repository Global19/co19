/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> contains(Object needle)
 * If this stream reports an error, the Future will report that error.
 * @description Checks that if needle is found after this stream reports
 * an error, the returned Future completes with error
 * @author a.semenov@unipro.ru
 */
library contains_A03_t03;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void test(Stream<T> create(Iterable<T> data, {bool isError(T x)})) {
  Error error = new Error();
  Stream s = create([1, 2, error, 3, 4], isError: (e) => e is Error);
  asyncStart();
  s.contains(4).then(
    (_) {
      Expect.fail("Returned future is expected to fail with error");
    },
    onError: (e) {
      Expect.equals(error, e);
      asyncEnd();
    }
  );
}
