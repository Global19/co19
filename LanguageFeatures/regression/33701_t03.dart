/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issue 33701 (Dart does not throw error
 * if function argument parameter extends [Null]).
 *
 * Finally analyzer behavior was fixed here, so checks that function type
 * parameter can extend [Never] with nnbd turned on.
 *
 * @Issue 33701
 * @author iarkh@unipro.ru
 */

void testme1<X extends Never>(X x) {}
X testme2<X extends Never>() => throw "Cannot do it";
X testme3<X extends Never>(X x) => throw "Cannot do it";
void testme4<X extends Never>() {}

main() {}
