/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<HttpServer> bind(
 *  address,
 *  int port, {
 *  int backlog: 0,
 *  bool v6Only: false,
 *  bool shared: false
 * }).
 * ...
 * The address can either be a String or an InternetAddress. If address is a
 * String, bind will perform a InternetAddress.lookup and use the first value in
 * the list. To listen on the loopback adapter, which will allow only incoming
 * connections from the local host, use the value InternetAddress.loopbackIPv4
 * or InternetAddress.loopbackIPv6. To allow for incoming connection from the
 * network use either one of the values InternetAddress.anyIPv4 or
 * InternetAddress.anyIPv6 to bind to all interfaces or the IP address of a
 * specific interface.
 * @description Checks that if [address]  is a String, then
 * InternetAddress.lookup is performed and the first value in the list is used
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

const String SERVER_URL = "127.0.0.1";

test() async {
  String helloWorld = 'Hello, test world!';
  HttpServer server = await HttpServer.bind(SERVER_URL, 0);
  asyncStart();
  server.listen((HttpRequest request) {
    request.response.write(helloWorld);
    request.response.close();
    server.close();
    asyncEnd();
  });

  asyncStart();
  InternetAddress.lookup(SERVER_URL).then((List<InternetAddress> addr) {
    HttpClient client = new HttpClient();
    Expect.isTrue(addr.length > 0);
    client
        .getUrl(Uri.parse("http://${addr[0].address}:${server.port}"))
        .then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      Expect.equals(HttpStatus.ok, response.statusCode);
      response.cast<List<int>>().transform(utf8.decoder).listen((content) {
        Expect.equals(helloWorld, content);
        asyncEnd();
      });
    });
  });
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
