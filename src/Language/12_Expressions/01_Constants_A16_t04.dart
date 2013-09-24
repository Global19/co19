/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if evaluation of a compile-time constant would raise
 * an exception.
 * @description Checks that using null in a boolean constant expression is a compile-time error.
 * @compile-error
 * @author kaigorodov
 * @issue 13394
 */

class C {
  final g;
  const C() :
    g = true && null;
}

main() {
  try {
    const C();
  } catch(ok) {} // NPEs and whatnot
}
