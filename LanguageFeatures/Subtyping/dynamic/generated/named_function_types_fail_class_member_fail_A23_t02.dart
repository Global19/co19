/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T0 is a subtype of a type T1 (written T0 <: T1) when:
 * Named Function Types: T0 is U0 Function<X0 extends B00, ..., Xk extends B0k>
 *   (T0 x0, ..., Tn xn, {Tn+1 xn+1, ..., Tm xm})
 *
 * and T1 is U1 Function<Y0 extends B10, ..., Yk extends B1k>(S0 y0, ..., Sn yn,
 * {Sn+1 yn+1, ..., Sq yq})
 * and {yn+1, ... , yq} subsetof {xn+1, ... , xm}
 * and Si[Z0/Y0, ..., Zk/Yk] <: Vi[Z0/X0, ..., Zk/Xk] for i in 0...n
 * and Si[Z0/Y0, ..., Zk/Yk] <: Tj[Z0/X0, ..., Zk/Xk] for i in n+1...q, yj = xi
 * and U0[Z0/X0, ..., Zk/Xk] <: U1[Z0/Y0, ..., Zk/Yk]
 * and B0i[Z0/X0, ..., Zk/Xk] === B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k
 * where the Zi are fresh type variables with bounds B0i[Z0/X0, ..., Zk/Xk]
 * @description Check that if there is i in 0...n such that
 * Si[Z0/Y0, ..., Zk/Yk] is not subtype of Vi[Z0/X0, ..., Zk/Xk], then T0 is not
 * a subtype of T1. Test generic types
 * @author sgrekhov@unipro.ru
 */
import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

class A {}

class C extends A {}

class U<X, Y, Z> {}

class B0<X, Y, Z> {}

class B1<X, Y, Z> {}

class V0<X, Y, Z> {}

class V1<X, Y, Z> {}

class V2<X, Y, Z> {}

class V3<X, Y, Z> {}

class V4<X, Y, Z> {}

typedef T0 = U<C, List<String>, int> Function<X extends B0, Y extends B1>(
    V0<A, List, double> x0, V1<A, List, num> x1,     // V0<C, List<String>, int> is not subtype of V0<A, List, double>
    {V2<A, List, num> x2, V3<A, List, num> x3, V4<A, List, num> x4});
typedef T1 = U<A, List, num> Function<X extends B0, Y extends B1>(
    V0<C, List<String>, int> y0, V1<C, List<String>, int> y1,
    {V2<C, List<String>, int> x2, V3<C, List<String>, int> x3});

U<C, List<String>, int> t0Func<X extends B0, Y extends B1>(
        V0<A, List, double> x0, V1<A, List, num> x1,
        {V2<A, List, num> x2, V3<A, List, num> x3, V4<A, List, num> x4}) =>
    null;
U<A, List, num> t1Func<X extends B0, Y extends B1>(
        V0<C, List<String>, int> y0, V1<C, List<String>, int> y1,
        {V2<C, List<String>, int> x2, V3<C, List<String>, int> x3}) =>
    null;

T0 t0Instance = t0Func;
T1 t1Instance = t1Func;


class ClassMemberSuper1_t02 {
  T1 m;

  ClassMemberSuper1_t02(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.named(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.short(this.m);

  void set superSetter(T1 val) {}
}

class ClassMember1_t02 extends ClassMemberSuper1_t02 {

  ClassMember1_t02() : super(forgetType(t0Instance)) {}

  ClassMember1_t02.named() : super.named(forgetType(t0Instance)) {}

  ClassMember1_t02.short() : super.short(forgetType(t0Instance));

  ClassMember1_t02.valid() : super(null);

  test1() {
    m = forgetType(t0Instance);
  }

  test2() {
    superSetter = forgetType(t0Instance);
  }
}

class ClassMemberSuper2_t02<X> {
  X m;

  ClassMemberSuper2_t02(X value) {
    m = value;
  }

  ClassMemberSuper2_t02.named(X value) {
    m = value;
  }

  ClassMemberSuper2_t02.short(this.m);

  void set superSetter(X val) {}
}

class ClassMember2_t02<X> extends ClassMemberSuper2_t02<X> {

  ClassMember2_t02() : super(forgetType(t0Instance)) {}

  ClassMember2_t02.named() : super.named(forgetType(t0Instance)) {}

  ClassMember2_t02.short() : super.short(forgetType(t0Instance));

  ClassMember2_t02.valid() : super(null);

  test1() {
    m = forgetType(t0Instance);
  }

  test2() {
    superSetter = forgetType(t0Instance);
  }
}

main() {
  Expect.throws(() {new ClassMember1_t02();}, (e) => e is TypeError);
  Expect.throws(() {new ClassMember1_t02.short();}, (e) => e is TypeError);
  Expect.throws(() {new ClassMember1_t02.named();}, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02.valid().m = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02.valid().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02.valid().test1();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02.valid().test2();
  }, (e) => e is TypeError);

  // Test type parameters

}

