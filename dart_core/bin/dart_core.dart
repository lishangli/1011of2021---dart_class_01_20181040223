import 'dart:core';

class Person {
  final String firstName, lastName;

  Person(this.firstName, this.lastName);

  // Override hashCode using strategy from Effective Java,
  // Chapter 11.
  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + firstName.hashCode;
    result = 37 * result + lastName.hashCode;
    return result;
  }

  // You should generally implement operator == if you
  // override hashCode.
  @override
  bool operator ==(dynamic other) {
    return other is Person &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}

class Process {
  // Represents a process...
}

class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  int compareTo(Line other) => length - other.length;
}

class FooException implements Exception {
  final String? msg;

  const FooException([this.msg]);

  @override
  String toString() => msg ?? 'FooException';
}

void main(List<String> args) {
  //1.The top-level print() method takes a single argument (any Object) and displays that object’s string value (as returned by toString()) in the console.
  var p = Person("li", "shangli");
  print(p);
  print('I drink tea');
  //2.You can convert a string into an integer or double with the parse() methods of int and double, respectively:
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);
  //3.Or use the parse() method of num, which creates an integer if possible and otherwise a double:
  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);
  //4.To specify the base of an integer, add a radix parameter:
  // Convert an int to a string.
  assert(42.toString() == '42');

// Convert a double to a string.
  assert(123.456.toString() == '123.456');

// Specify the number of digits after the decimal.
  assert(123.456.toStringAsFixed(2) == '123.46');

// Specify the number of significant figures.
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);
  //5.You can find particular locations within a string, as well as check whether a string begins with or ends with a particular pattern. For example:
  // Check whether a string contains another string.
  assert('Never odd or even'.contains('odd'));

// Does a string start with another string?
  assert('Never odd or even'.startsWith('Never'));

// Does a string end with another string?
  assert('Never odd or even'.endsWith('even'));

// Find the location of a string inside a string.
  assert('Never odd or even'.indexOf('odd') == 6);
  //6.You can also extract a substring or split a string into a list of substrings:
  // Grab a substring.
  assert('Never odd or even'.substring(6, 9) == 'odd');

// Split a string using a string pattern.
  var parts = 'structured web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'structured');

// Get a UTF-16 code unit (as a string) by index.
  assert('Never odd or even'[0] == 'N');

// Use split() with an empty string parameter to get
// a list of all characters (as Strings); good for
// iterating.
  for (final char in 'hello'.split('')) {
    print(char);
  }

// Get all the UTF-16 code units in the string.
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);
  //7.You can easily convert strings to their uppercase and lowercase variants:
  // Convert to uppercase.
  assert('structured web apps'.toUpperCase() == 'STRUCTURED WEB APPS');

// Convert to lowercase.
  assert('STRUCTURED WEB APPS'.toLowerCase() == 'structured web apps');
  //8.Remove all leading and trailing white space with trim(). To check whether a string is empty (length is zero), use isEmpty.
  // Trim a string.
  assert('  hello  '.trim() == 'hello');

// Check whether a string is empty.
  assert(''.isEmpty);

// Strings with only white space are not empty.
  assert('  '.isNotEmpty);
  //9.Strings are immutable objects, which means you can create them but you can’t change them. If you look closely at the String API reference, you’ll notice that none of the methods actually changes the state of a String. For example, the method replaceAll() returns a new String without changing the original String:
  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');

// greetingTemplate didn't change.
  assert(greeting != greetingTemplate);
  //10.To programmatically generate a string, you can use StringBuffer. A StringBuffer doesn’t generate a new String object until toString() is called. The writeAll() method has an optional second parameter that lets you specify a separator—in this case, a space.
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');

  var fullString = sb.toString();

  assert(fullString == 'Use a StringBuffer for efficient string creation.');
  //The RegExp class provides the same capabilities as JavaScript regular expressions. Use regular expressions for efficient searching and pattern matching of strings.
  // Here's a regular expression for one or more digits.
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

// contains() can use a regular expression.
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));

// Replace every match with another string.
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');
  //11.You can work directly with the RegExp class, too. The Match class provides access to a regular expression match.
  var numbers1 = RegExp(r'\d+');
  var someDigits1 = 'llamas live 15 to 20 years';

// Check whether the reg exp has a match in a string.
  assert(numbers1.hasMatch(someDigits1));

// Loop through all matches.
  for (final match in numbers1.allMatches(someDigits1)) {
    print(match.group(0)); // 15, then 20
  }
  //13.As the language tour shows, you can use literals to create and initialize lists. Alternatively, use one of the List constructors. The List class also defines several methods for adding items to and removing items from lists.
  // Create an empty list of strings.
  var grains = <String>[];
  assert(grains.isEmpty);

// Create a list using a list literal.
  var fruits = ['apples', 'oranges'];

// Add to a list.
  fruits.add('kiwis');

// Add multiple items to a list.
  fruits.addAll(['grapes', 'bananas']);

// Get the list length.
  assert(fruits.length == 5);

// Remove a single item.
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

// Remove all elements from a list.
  fruits.clear();
  assert(fruits.isEmpty);

// You can also create a List using one of the constructors.
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));
// Use indexOf() to find the index of an object in a list:
  var fruits1 = ['apples', 'oranges'];

// Access a list item by index.
  assert(fruits1[0] == 'apples');

// Find an item in a list.
  assert(fruits1.indexOf('apples') == 0);

  var fruits2 = ['bananas', 'apples', 'oranges'];

// Sort a list.
  fruits2.sort((a, b) => a.compareTo(b));
  assert(fruits2[0] == 'apples');
  // This list should contain only strings.
  var fruits3 = <String>[];

  fruits3.add('apples');
  var fruit3 = fruits3[0];
  assert(fruit3 is String);

  // Create an empty set of strings.
  var ingredients = <String>{};

// Add new items to it.
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

// Adding a duplicate item has no effect.
  ingredients.add('gold');
  assert(ingredients.length == 3);

// Remove an item from a set.
  ingredients.remove('gold');
  assert(ingredients.length == 2);

// You can also create sets using
// one of the constructors.
  var atomicNumbers = Set.from([79, 22, 54]);
  var ingredients1 = Set<String>();
  ingredients1.addAll(['gold', 'titanium', 'xenon']);

// Check whether an item is in the set.
  assert(ingredients1.contains('titanium'));

// Check whether all the items are in the set.
  assert(ingredients1.containsAll(['titanium', 'xenon']));

  var ingredients2 = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);

// Create the intersection of two sets.
  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection2 = ingredients2.intersection(nobleGases);
  assert(intersection2.length == 1);
  assert(intersection2.contains('xenon'));

  // Maps often use strings as keys.
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

// Maps can be built from a constructor.
  var searchTerms = Map();

// Maps are parameterized types; you can specify what
// types the key and value should be.
  var nobleGases2 = Map<int, String>();
  var nobleGases3 = {54: 'xenon'};

// Retrieve a value with a key.
  assert(nobleGases3[54] == 'xenon');

// Check whether a map contains a key.
  assert(nobleGases3.containsKey(54));

// Remove a key and its value.
  nobleGases3.remove(54);
  assert(!nobleGases3.containsKey(54));
  var hawaiianBeaches2 = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

// Get all the keys as an unordered collection
// (an Iterable).
  var keys = hawaiianBeaches2.keys;

  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));

// Get all the values as an unordered collection
// (an Iterable of Lists).
  var values = hawaiianBeaches2.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));

  var hawaiianBeaches3 = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  assert(hawaiianBeaches3.containsKey('Oahu'));
  assert(!hawaiianBeaches3.containsKey('Florida'));

  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);

  var teas1 = ['green', 'black', 'chamomile', 'earl grey'];

  teas1.forEach((tea) => print('I drink $tea'));
  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v');
    // I want to visit Oahu and swim at
    // [Waikiki, Kailua, Waimanalo], etc.
  });

  var teas2 = ['green', 'black', 'chamomile', 'earl grey'];

  var loudTeas = teas2.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);

  var loudTeas1 = teas.map((tea) => tea.toUpperCase()).toList();

  var teas3 = ['green', 'black', 'chamomile', 'earl grey'];

// Chamomile is not caffeinated.
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';

// Use where() to find only the items that return true
// from the provided function.
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));
// or teas.where(isDecaffeinated)

// Use any() to check whether at least one item in the
// collection satisfies a condition.
  assert(teas.any(isDecaffeinated));

// Use every() to check whether all the items in a
// collection satisfy a condition.
  assert(!teas.every(isDecaffeinated));

  var uri = 'https://example.org/api?foo=some message';

  var encoded = Uri.encodeFull(uri);
  assert(encoded == 'https://example.org/api?foo=some%20message');

  var decoded = Uri.decodeFull(encoded);
  assert(uri == decoded);

  var uri1 = 'https://example.org/api?foo=some message';

  var encoded1 = Uri.encodeComponent(uri);
  assert(encoded1 == 'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');

  var decoded1 = Uri.decodeComponent(encoded);
  assert(uri1 == decoded1);

  var uri2 = Uri.parse('https://example.org:8080/foo/bar#frag');

  assert(uri2.scheme == 'https');
  assert(uri2.host == 'example.org');
  assert(uri2.path == '/foo/bar');
  assert(uri2.fragment == 'frag');
  assert(uri2.origin == 'https://example.org:8080');

  var uri3 = Uri(
      scheme: 'https', host: 'example.org', path: '/foo/bar', fragment: 'frag');
  assert(uri3.toString() == 'https://example.org/foo/bar#frag');

  // Get the current date and time.
  var now = DateTime.now();

// Create a new DateTime with the local time zone.
  var y2k = DateTime(2000); // January 1, 2000

// Specify the month and day.
  y2k = DateTime(2000, 1, 2); // January 2, 2000

// Specify the date as a UTC time.
  y2k = DateTime.utc(2000); // 1/1/2000, UTC

// Specify a date and time in ms since the Unix epoch.
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);

// Parse an ISO 8601 date.
  y2k = DateTime.parse('2000-01-01T00:00:00Z');

  // 1/1/2000, UTC
  var y2k1 = DateTime.utc(2000);
  assert(y2k1.millisecondsSinceEpoch == 946684800000);

// 1/1/1970, UTC
  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.millisecondsSinceEpoch == 0);
  var y2k2 = DateTime.utc(2000);

// Add one year.
  var y2001 = y2k2.add(const Duration(days: 366));
  assert(y2001.year == 2001);

// Subtract 30 days.
  var december2000 = y2001.subtract(const Duration(days: 30));
  assert(december2000.year == 2000);
  assert(december2000.month == 12);

// Calculate the difference between two dates.
// Returns a Duration object.
  var duration = y2001.difference(y2k);
  assert(duration.inDays == 366); // y2k was a leap year.

  var short = const Line(1);
  var long = const Line(100);
  assert(short.compareTo(long) < 0);

  var p1 = Person('Bob', 'Smith');
  var p2 = Person('Bob', 'Smith');
  var p3 = 'not a person';
  assert(p1.hashCode == p2.hashCode);
  assert(p1 == p2);
  assert(p1 != p3);
}
