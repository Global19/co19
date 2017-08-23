/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isDirectory
 * final
 * Is true if the event target was a directory.
 * @description Checks that this property returns true if the event target was a
 * directory. Test Directory
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "../../../Utils/file_utils.dart";

main() {
  Directory dir = getTempDirectorySync();
  Directory d = null;
  asyncStart();
  StreamSubscription s = dir.watch().listen((FileSystemEvent event) {
    if (event is FileSystemModifyEvent) {
      Expect.isTrue(event.isDirectory);
      asyncEnd();
    }
  });
  d = getTempDirectorySync(dir);
  getTempFileSync(d);
  new Future.delayed(new Duration(seconds: 1), () {
    s.cancel().then((_) {
      dir.delete(recursive: true);
    });
  });
}