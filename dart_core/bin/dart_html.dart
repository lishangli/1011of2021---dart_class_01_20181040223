import 'dart:html';
import 'dart:async';

var url = "www.baidu.com";
void main(List<String> arguments) {
  {
// Find an element by id (an-id).
    Element idElement = querySelector('#an-id')!;

// Find an element by class (a-class).
    Element classElement = querySelector('.a-class')!;

// Find all elements by tag (<div>).
    List<Element> divElements = querySelectorAll('div');

// Find all text inputs.
    List<Element> textInputElements = querySelectorAll(
      'input[type="text"]',
    );

// Find all elements with the CSS class 'class'
// inside of a <p> that is inside an element with
// the ID 'id'.
    List<Element> specialParagraphElements = querySelectorAll('#id p.class');
    var anchor = querySelector('#example') as AnchorElement;
    anchor.href = 'https://dart.dev';
/*
  // In Dart:
  const osList = ['macos', 'windows', 'linux'];
  final userOs = determineUserOs();

// For each possible OS...
  for (final os in osList) {
    // Matches user OS?
    bool shouldShow = (os == userOs);

    // Find all elements with class=os. For example, if
    // os == 'windows', call querySelectorAll('.windows')
    // to find all elements with the class "windows".
    // Note that '.$os' uses string interpolation.
    for (final elem in querySelectorAll('.$os')) {
      elem.hidden = !shouldShow; // Show or hide.
    }
  }
  */
    var elem = ParagraphElement();
    elem.text = 'Creating is easy!';
    elem.attributes['someAttribute'] = 'someValue';
    var elem2 = Element.html(
      '<p>Creating <em>is</em> easy!</p>',
    );
    document.body!.children.add(elem2);
    querySelector('#inputs')!.nodes.add(elem);

    querySelector('#status')!.replaceWith(elem);

    // Find a node by ID, and remove it from the DOM if it is found.
    querySelector('#expendable')?.remove();

    var elem3 = querySelector('#message')!;
    elem3.classes.add('warning');

    var message = DivElement();
    message.id = 'message2';
    message.text = 'Please subscribe to the Dart mailing list.';

    var message1 = DivElement()
      ..id = 'message2'
      ..text = 'Please subscribe to the Dart mailing list.';

    message1.style
      ..fontWeight = 'bold'
      ..fontSize = '3em';

    // Find a button by ID and add an event handler.
    querySelector('#submitInfo')!.onClick.listen((e) {
      // When the button is clicked, it runs this code.
      //submitData();
    });

    document.body!.onClick.listen((e) {
      final clickedElem = e.target;
      // ...
    });

    Future<void> main() async {
      String pageHtml = await HttpRequest.getString("http://www.baidu.com");
      // Do something with pageHtml...
    }

    /*try {
    var data = await HttpRequest.getString("joonurl");
    // Process data...
  } catch (e) {
    // Handle exception...
  }*/
  }

  String encodeMap(Map<String, String> data) => data.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');

  Future<void> main1() async {
    const data = {'dart': 'fun', 'angular': 'productive'};

    var request = HttpRequest();
    request
      ..open('POST', url)
      ..setRequestHeader(
        'Content-type',
        'application/x-www-form-urlencoded',
      )
      ..send(encodeMap(data));

    await request.onLoadEnd.first;

    if (request.status == 200) {
      // Successful URL access...
    }
    var ws = WebSocket('ws://echo.websocket.org');
    ws.send('Hello from Dart!');
    ws.onMessage.listen((MessageEvent e) {
      print('Received message: ${e.data}');
    });
    void initWebSocket([int retrySeconds = 1]) {
      var reconnectScheduled = false;

      print('Connecting to websocket');

      void scheduleReconnect() {
        if (!reconnectScheduled) {
          Timer(Duration(seconds: retrySeconds),
              () => initWebSocket(retrySeconds * 2));
        }
        reconnectScheduled = true;
      }

      ws.onOpen.listen((e) {
        print('Connected');
        ws.send('Hello from Dart!');
      });

      ws.onClose.listen((e) {
        print('Websocket closed, retrying in $retrySeconds seconds');
        scheduleReconnect();
      });

      ws.onError.listen((e) {
        print('Error connecting to ws');
        scheduleReconnect();
      });

      ws.onMessage.listen((MessageEvent e) {
        print('Received message: ${e.data}');
      });
    }
    // ···
  }
}
