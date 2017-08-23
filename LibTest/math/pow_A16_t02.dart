/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num pow(num x, num exponent)
 * For doubles, pow(x, y) handles edge cases as follows:
 * ...
 *  - if [y] is -Infinity, the result is 1/pow([x], Infinity).
 * @description Checks the result when [y] is 1/pow([x], Infinity).
 * @author ngl@unipro.ru
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.equals(1 / Math.pow(0.9999999999999999, double.INFINITY),
      Math.pow(0.9999999999999999, double.NEGATIVE_INFINITY));
  Expect.equals(1 / Math.pow(-0.9999999999999999, double.INFINITY),
      Math.pow(-0.9999999999999999, double.NEGATIVE_INFINITY));
  Expect.equals(1 / Math.pow(0.5, double.INFINITY),
      Math.pow(0.5, double.NEGATIVE_INFINITY));
  Expect.equals(1 / Math.pow(-0.5, double.INFINITY),
      Math.pow(-0.5, double.NEGATIVE_INFINITY));
  Expect.equals(1 / Math.pow(4.9406564584124654e-324, double.INFINITY),
      Math.pow(4.9406564584124654e-324, double.NEGATIVE_INFINITY));
  Expect.equals(1 / Math.pow(-4.9406564584124654e-324, double.INFINITY),
      Math.pow(-4.9406564584124654e-324, double.NEGATIVE_INFINITY));

  Expect.equals(1 / Math.pow(-1, double.INFINITY),
      Math.pow(-1, double.NEGATIVE_INFINITY));
  Expect.equals(1 / Math.pow(-1.0, double.INFINITY),
      Math.pow(-1.0, double.NEGATIVE_INFINITY));

  Expect.equals(1 / Math.pow(1.0000000000000002, double.INFINITY),
      Math.pow(1.0000000000000002, double.NEGATIVE_INFINITY));
  Expect.equals(1 / Math.pow(-1.0000000000000002, double.INFINITY),
      Math.pow(-1.0000000000000002, double.NEGATIVE_INFINITY));
  Expect.equals(1 / Math.pow(2, double.INFINITY),
      Math.pow(2, double.NEGATIVE_INFINITY));
  Expect.equals(1 / Math.pow(-2, double.INFINITY),
      Math.pow(-2, double.NEGATIVE_INFINITY));
  Expect.equals(1 / Math.pow(123.123, double.INFINITY),
      Math.pow(123.123, double.NEGATIVE_INFINITY));
  Expect.equals(1 / Math.pow(-123.123, double.INFINITY),
      Math.pow(-123.123, double.NEGATIVE_INFINITY));
  Expect.equals(1 / Math.pow(1.7976931348623157e308, double.INFINITY),
      Math.pow(1.7976931348623157e308, double.NEGATIVE_INFINITY));
  Expect.equals(1 / Math.pow(-1.7976931348623157e308, double.INFINITY),
      Math.pow(-1.7976931348623157e308, double.NEGATIVE_INFINITY));
}