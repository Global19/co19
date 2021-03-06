/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String responseText
 * The response in String form or empty String on failure.
 * @description Checks that the property is  empty in case of failure.
 * @needsreview #16757
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var request = new HttpRequest();
  var port = crossOriginPort;
  var host = '${window.location.protocol}//${window.location.hostname}:$port';
  var url = '$host/root_dart/tests/co19/src/LibTest/html/IntentionallyMissingFile';
  request.open('GET', url);
  asyncStart();
  request.onError.listen((event) {
    Expect.equals(0, request.status);
    Expect.isNull(request.response);
    Expect.equals(0, request.responseText?.length);
    asyncEnd();
  });
  request.send();
}
