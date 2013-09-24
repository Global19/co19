/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A numeric literal is either a decimal or hexadecimal integer of arbitrary size,
 * or a decimal double. 
 *  NUMBER: DIGIT+ ('.' DIGIT+)? EXPONENT? | '.' DIGIT+ EXPONENT?
 *  EXPONENT: ('e' | 'E') ('+' | '-')? DIGIT+
 *  HEX NUMBER: '0x' HEX DIGIT+ | '0X' HEX DIGIT+ ;
 *  HEX DIGIT: 'a'..'f' | 'A'..'F' | DIGIT ;
 * @description Checks various large positive decimal and hexadecimal integer numbers.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../Utils/expect.dart";

main() {
  Expect.equals(2147483647, 0x7FFFFFFF);
  Expect.equals("2147483647", 2147483647.toString());
  Expect.equals("2147483647", 0x7FFFFFFF.toString());

  Expect.equals(2147483648, 0x80000000);
  Expect.equals("2147483648", 2147483648.toString());
  Expect.equals("2147483648", 0x80000000.toString());
  Expect.equals(2147483648, 1 << 31);
  Expect.equals(4294967295, 0xFFFFFFFF);

  Expect.equals(9223372036854775807, 0x7FFFFFFFFFFFFFFF);
  Expect.equals(9223372036854775808, 0x8000000000000000);
  Expect.equals(9223372036854775808, 1 << 63);

  Expect.equals("9223372036854775807", 9223372036854775807.toString());
  Expect.equals("9223372036854775807", 0x7FFFFFFFFFFFFFFF.toString());

  Expect.equals(18446744073709551615, 0xFFFFFFFFFFFFFFFF);
  Expect.equals(18446744073709551616, 0x10000000000000000);
  Expect.equals(18446744073709551616, 1 << 64);

  Expect.equals(340282366920938463463374607431768211455, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF); //2^128-1
  Expect.equals(340282366920938463463374607431768211456, 0x100000000000000000000000000000000); //2^128
  Expect.equals(340282366920938463463374607431768211456, 1 << 128); //2^128
  Expect.equals("340282366920938463463374607431768211456", 340282366920938463463374607431768211456.toString());
  Expect.equals("340282366920938463463374607431768211456", 0x100000000000000000000000000000000.toString());

  //just random huge number
  Expect.equals(189235618345629384561001123710923457234968236298719823750192572039457239561982637461982634019234019509283906712345667890,
                0x12c2b09f317ade6eb8abe7ebafb0e0b59b4a6dfb8166397b07c8f9fa1f10b6d34c5aeb78d452fe58c554c81af512cc6a6932);

  Expect.equals("189235618345629384561001123710923457234968236298719823750192572039457239561982637461982634019234019509283906712345667890",
                189235618345629384561001123710923457234968236298719823750192572039457239561982637461982634019234019509283906712345667890.toString());
  Expect.equals("189235618345629384561001123710923457234968236298719823750192572039457239561982637461982634019234019509283906712345667890",
                0x12c2b09f317ade6eb8abe7ebafb0e0b59b4a6dfb8166397b07c8f9fa1f10b6d34c5aeb78d452fe58c554c81af512cc6a6932.toString());
}
