// ignore_for_file: prefer_const_constructors, dead_code, avoid_print, unused_element

import 'package:flutter/material.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

import 'fcpsApp.dart';
import 'pages/dashboard.dart';
import 'pages/quizzes.dart';
import 'pages/search.dart';
import 'pages/settings.dart';
import 'pages/signin.dart';
import 'pages/signup.dart';
import 'pages/subjects.dart';
import 'pages/subscription.dart';
import 'pages/syllabus.dart';

/// settings support
// dark
final _dark = RM.inject(() => store.get('dark') ?? false);
bool get dark {
  return _dark.state;
}

set dark(bool value) {
  _dark.state = value;
  store.put('dark', dark);
}

// implementing subscriptions
List subscriptions = ['30 days - Free', '2 months - 100PKR', '6 months - 300PKR', 'About 14 years - 1000PKR'];
final _subscription = RM.inject(() => store.get('subscription') ?? '30 days - Free');

String get subscription => _subscription.state;

set subscription(value) {
  _subscription.state = value;
  store.put('subscription', value);
}

String startSubscription = store.get('startSubscription') ?? DateTime.now().toIso8601String();
String endSubscription = store.get('endSubscription') ?? DateTime.now().add(Duration(days: 30)).toIso8601String();

buySubscription(value) {
  if (value == subscriptions[0]) {
    endSubscription = DateTime.parse(startSubscription).add(Duration(days: 30)).toIso8601String();
  } else if (value == subscriptions[1]) {
    endSubscription = DateTime.parse(startSubscription).add(Duration(days: 60)).toIso8601String();
  } else if (value == subscriptions[2]) {
    endSubscription = DateTime.parse(startSubscription).add(Duration(days: 180)).toIso8601String();
  } else {
    endSubscription = DateTime.parse(startSubscription)
        .add(
          Duration(days: 5000),
        )
        .toIso8601String();
  }
  subscription = value;
  startSubscription = DateTime.now().toIso8601String();
  store.put('subscription', subscription);
  store.put('startSubscription', startSubscription);
  store.put('endSubscription', endSubscription);
  print(store.get('subscription'));
  // update();
}

openBuySubscriptions(context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => BuySubscriptionsPage(),
    ),
  );
}

openSubscriptions(context, String subscription) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => SubscriptionPage(
        subscription: subscription,
      ),
    ),
  );
}

// login implementation
final _name = RM.inject(() => store.get('name') ?? 'Adnan Farooq');

String get name => _name.state;

set name(value) {
  _name.state = value;
  store.put('name', value);
}

final _email = RM.inject(() => store.get('email') ?? 'adn@gmail.com');

String get email => _email.state;

set email(value) {
  _email.state = value;
  store.put('email', value);
}

final _city = RM.inject(() => store.get('city') ?? 'Swabi');

String get city => _city.state;

set city(value) {
  _city.state = value;
  store.put('city', value);
}

String speciality = store.get('speciality') ?? 'Radiology';
String username = store.get('username') ?? 'admin';
String password = store.get('password') ?? '123456';
var usernameC = TextEditingController();
var passwordC = TextEditingController();
var nameC = TextEditingController();
var emailC = TextEditingController();
var cityC = TextEditingController();
var specialityC = TextEditingController();
bool isLogged = store.get('isLogged') ?? false;
bool isForgot = false;

signupUser(context) async {
  name = nameC.text;
  email = emailC.text;
  city = cityC.text;
  speciality = specialityC.text;
  username = usernameC.text;
  password = passwordC.text;
  store.put('name', name);
  store.put('email', email);
  store.put('city', city);
  store.put('speciality', speciality);
  store.put('username', username);
  store.put('password', password);
  openDashboard(context);
}

forgotPassword(context) async {
  store.put('username', usernameC.text);
  store.put('password', passwordC.text);
  username = usernameC.text;
  password = passwordC.text;
  // update();
  openDashboard(context);
}

signin(context) async {
  if (usernameC.text == username && passwordC.text == password) {
    isLogged = true;
    openDashboard(context);
  } else {
    isLogged = false;
    openSignin(context);
  }
  store.put('isLogged', isLogged);
  // update();
}

signout(context) async {
  isLogged = false;
  store.put('isLogged', isLogged);
  openSignin(context);
  // update();
}

// pages navigation

openSignin(context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => SigninPage(),
    ),
  );
}

openSignup(context, isForgot) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => SignupPage(
        isForgot: isForgot,
      ),
    ),
  );
}

openSettings(context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => SettingsPage(),
    ),
  );
}

openSubjects(context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => SubjectsPage(),
    ),
  );
}

openDashboard(context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => Dashboard(),
    ),
  );
}

var listOfSubjects = [
  'Biochemistry',
  'Physiology',
  'Anatomy',
  'Biostatistics',
  'Embryology',
  'General Anatomy',
  'Histology',
  'Microbiology',
  'General Pathology',
  'Pharmacology',
  'Special Pathology'
];

openSyllabus(context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => SyllabusPage(),
    ),
  );
}

openSearch(context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => SearchPage(),
    ),
  );
}

openQuiz(context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => QuizzesPage(),
    ),
  );
}

void deleteAllDataFromDisk(context) {
  // store.erase();
  // Phoenix.rebirth(context);
}

final _selectedCity = RM.inject(() => store.get('city'));

String? get selectedCity => _selectedCity.state;

set selectedCity(String? value) {
  _selectedCity.state = value;
  store.put('city', value);
}

final listOfCities = [
  'Abbottabad',
  'Bajaur',
  'Bannu',
  'Batagram',
  'Buner',
  'Charsadda',
  'Dera Ismail Khan',
  'Hangu',
  'Haripur',
  'Karak',
  'Khyber',
  'Kohat',
  'Kolai Pallas',
  'Kurram',
  'Lakki Marwat',
  'Lower Chitral',
  'Lower Dir',
  'Lower Kohistan',
  'Malakand',
  'Mansehra',
  'Mardan',
  'Mohmand',
  'North Waziristan',
  'Nowshera',
  'Orakzai',
  'Peshawar',
  'Shangla',
  'South Waziristan',
  'Swabi',
  'Swat',
  'Tank',
  'Tor Ghar',
  'Upper Chitral',
  'Upper Dir',
  'Upper Kohistan',
];
