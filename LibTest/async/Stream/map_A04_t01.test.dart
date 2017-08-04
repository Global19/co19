/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> map<S>(S convert(T event))
 * The returned stream is a broadcast stream if this stream is.
 *
 * @description Checks that the returned stream is a broadcast stream
 * if source stream is.
 * @author a.semenov@unipro.ru
 */
library map_A04_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream<T> stream, dynamic convert(T event)) {
  Expect.equals(stream.isBroadcast, stream.map(convert).isBroadcast);
}

void test(Stream<T> create(Iterable<T> data)) {

  check(create([]), (_) => null);
  check(create([]).asBroadcastStream(), (_) => null);

  check(create([1,2,3,4,5]), (_) => null);
  check(create([1,2,3,4,5]).asBroadcastStream(), (_) => null);

  check(create([]), (e) => e);
  check(create([]).asBroadcastStream(), (e) => e);

  check(create([1,2,3,4,5]), (e) => e);
  check(create([1,2,3,4,5]).asBroadcastStream(), (e) => e);

  check(create([1,2,3,4,5]), (e) => e.toString());
  check(create([1,2,3,4,5]).asBroadcastStream(), (e) => e.toString());
}
