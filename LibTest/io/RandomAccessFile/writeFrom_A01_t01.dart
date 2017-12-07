/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<RandomAccessFile> writeFrom(
 *     List<int> buffer, [
 *     int start = 0,
 *     int end
 * ])
 * Writes from a List<int> to the file. It will read the buffer from index start
 * to index end. If start is omitted, it'll start from index 0. If end is
 * omitted, it will write to end of buffer.
 *
 * @description Checks that method writeFrom writes from a List<int> to file
 * from index start to index end.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "../file_utils.dart";

void check(int start, int end) {
  List<int> list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  int len = end - start;
  File file = getTempFileSync();
  asyncStart();
  Future<RandomAccessFile> raFile = file.open(mode: FileMode.WRITE);
  raFile.then((RandomAccessFile rf) {
    Expect.equals(0, file.lengthSync());
    var f = rf.writeFrom(list, start, end);
    f.then((RandomAccessFile file) {
      Expect.equals(len, file.lengthSync());
      rf.setPositionSync(0);
      List<int> l = file.readSync(len);

      for (int i = 0; i < len; i++) {
        Expect.isTrue(i + start == l[i]);
      }
      asyncEnd();
    }).whenComplete(() {
      rf.closeSync();
      file.deleteSync();
    });
  });
}

main() {
  for (int i = 0; i < 10; i++) {
    for (int j = i; j <= 10; j++) {
      check(i, j);
    }
  }
}
