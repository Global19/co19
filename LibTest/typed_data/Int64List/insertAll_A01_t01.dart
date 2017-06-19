/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void insertAll(int index, Iterable<E> iterable)
 * Inserts all objects of iterable at position [index] in this list.
 * This increases the length of the list by the length of iterable and shifts
 * all later elements towards the end of the list.
 * ...
 * An UnsupportedError occurs if the list is fixed-length.
 * @description Checks that [UnsupportedError] is thrown since [Int64List] is a
 * fixed-length list.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Int64List(10);
  try {
    l.insertAll(0, [1, 2, 3]);
    Expect.fail("UnsupportedError is expected");
  } on UnsupportedError {}
  Expect.equals(10, l.length);

  l = new Int64List(0);
  try {
    l.insertAll(0, [1, 1, 1]);
    Expect.fail("UnsupportedError is expected");
  } on UnsupportedError {}
  Expect.equals(0, l.length);
}
