/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RawSocketEvent> last
 * Returns the last element of the stream.
 *
 * If an error event occurs before the first data event, the resulting future
 * is completed with that error.
 *
 * If this stream is empty (a done event occurs before the first data event),
 * the resulting future completes with a StateError.
 *
 * @description Checks that property last returns the last element of the
 * stream when no one sent event was received ang  RawDatagramSocket was closed.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check([bool no_write_events = false]) {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      if (no_write_events) {
        receiver.writeEventsEnabled = false;
      }
      int sent = 0;
      var rEvent;

      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();
      receiver.close();

      receiver.last.then((event) {
        rEvent = event;
      }).whenComplete (() {
        Expect.equals(RawSocketEvent.CLOSED, rEvent);
        asyncEnd();
      });
    });
  });
}

main() {
  check();
  check(true);
}