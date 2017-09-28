/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * bool killPid(
 *     int pid, [
 *     ProcessSignal signal = ProcessSignal.SIGTERM
 * ])
 *
 * Kills the process with id pid.
 * ...
 * Returns true if the signal is successfully delivered to the process.
 * Otherwise the signal could not be sent, usually meaning that the process is
 * already dead.
 *
 * @description Checks that static method [killPid] return true, if the signal
 * was successfully delivered to the process
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Process.start('sleep', ['5']).then((Process process) {
    int pid = process.pid;
    bool res = Process.killPid(pid);
    Expect.isTrue(res);
  });
}