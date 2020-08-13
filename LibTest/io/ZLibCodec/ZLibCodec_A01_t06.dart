/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * ZLibCodec({
 *     int level: ZLibOption.DEFAULT_LEVEL,
 *     int windowBits: ZLibOption.DEFAULT_WINDOW_BITS,
 *     int memLevel: ZLibOption.DEFAULT_MEM_LEVEL,
 *     int strategy: ZLibOption.strategyDefault,
 *     List<int> dictionary: null,
 *     bool raw: false,
 *     bool gzip: false
 * })
 * @description Checks that this constructor creates a new ZLibCodec object
 * with specified [dictionary] parameter.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  List<int> dictionary = [1,2,3];
  ZLibCodec v = new ZLibCodec(dictionary: dictionary);
  Expect.equals(ZLibOption.defaultLevel, v.level);
  Expect.equals(ZLibOption.defaultWindowBits, v.windowBits);
  Expect.equals(ZLibOption.defaultMemLevel, v.memLevel);
  Expect.equals(ZLibOption.strategyDefault, v.strategy);
  Expect.equals(dictionary, v.dictionary);
  Expect.equals(false, v.raw);
  Expect.equals(false, v.gzip);
}
