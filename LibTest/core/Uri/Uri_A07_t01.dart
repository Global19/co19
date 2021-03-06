/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion new Uri({scheme, String userInfo: "", String host: "", port: 0,
 * String path, Iterable<String> pathSegments, String query, Map<String,
 * String> queryParameters, fragment: ""})
 * Creates a new URI from its components.
 * The fragment component is set through fragment.
 * @description Checks fragment component set through [fragment].
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  var x = '-._~';
  var uri = new Uri(fragment: x);
  Expect.equals(x, uri.fragment);
}
