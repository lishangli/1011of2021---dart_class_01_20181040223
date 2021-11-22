import 'dart:async';

void main(List<String> arguments) {
  //Future`
  //Future.value()
  void testFuture() async {
    var future = await Future.value(1);
    print("future value: $future.");
  }

  testFuture();
  print("在testFuture()执行之后打印。");

  //Future.delayed()
  void testFuture1() async {
    Future.delayed(Duration(seconds: 2), () {
      print("Future.delayed 2 seconds.");
    });
  }

  testFuture1();
  print("在testFuture1()执行之后打印。");

  //Future.then()
  void testFuture2() async {
    Future.value(1).then((value) {
      return Future.value(value + 2);
    }).then((value) {
      return Future.value(value + 3);
    }).then(print);
  }

  testFuture2();
  print("在testFuture2()执行之后打印。");

  void testFuture3() async {
    var future = new Future.value('a').then((v1) {
      return new Future.value('$v1 b').then((v2) {
        return new Future.value('$v2 c').then((v3) {
          return new Future.value('$v3 d');
        });
      });
    });
    future.then(print, onError: print);
  }

  testFuture3();
  print("在testFuture3()执行之后打印。");

  //Future.catchError
  void testFuture4() async {
    new Future.error('Future 发生错误啦！').catchError(print, test: (error) {
      return error is String;
    });
  }

  testFuture4();
  print("在testFuture4()执行之后打印。");

  //then中的回调onError和Future.catchError
  void testFuture5() async {
    new Future.error('Future 发生错误啦！').then((_) {
      throw 'new error';
    }).catchError((error) {
      print('error: $error');
      throw 'new error2';
    }).then(print, onError: (error) {
      print("handle new error: $error");
    });
  }

  testFuture5();
  print("在testFuture5()执行之后打印。");

  //Future.wait
  void testFuture6() async {
    var future1 = new Future.delayed(new Duration(seconds: 1), () => 1);

    var future2 = new Future.delayed(new Duration(seconds: 2), () => 2);

    var future3 = new Future.delayed(new Duration(seconds: 3), () => 3);

    Future.wait({future1, future2, future3}).then(print).catchError(print);
  }

  testFuture6();
  print("在testFuture6()执行之后打印。");
}
