/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
library tearoff1_lib;

extension ExtendedList on List {
  int foo<T>(T x) => x.toString().length;
}

extension ExtendedString on String {
  String bar() => "Ext:" + this;
}


int Function(int) func = list.foo;

