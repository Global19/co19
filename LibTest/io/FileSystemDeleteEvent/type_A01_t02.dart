/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int type
 *  final
 * The type of event. See FileSystemEvent for a list of events.
 * @description Checks that this property returns type of event. Test Directory
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
    if (event is FileSystemDeleteEvent) {
      Expect.equals(FileSystemEvent.DELETE, event.type);
      asyncEnd();
    } else {
      d.delete();
    }
  });
  d = getTempDirectorySync(dir);
  new Future.delayed(new Duration(seconds: 1), () {
    s.cancel().then((_) {
      dir.delete(recursive: true);
    });
  });
}