/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if C does not declare a static method or getter m.
 * @description Checks that it is a static warning if C does not declare
 * a static method m even though its superclass does.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 * @issue 13493
 */

class S {
  static m() {}
}

class C extends S {}

main() {
  try {
    C.m(); // static warning
  } catch(e) {}
}
