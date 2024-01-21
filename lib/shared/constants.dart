import 'package:shared_preferences/shared_preferences.dart';

const String apiBaseUrl = 'https://newsapi.org/';
const String apiKey = 'ca063cd942134589b01f1ec12d623b4a';
const String apiCountry = 'eg';
const String topHeadlinesApi = 'v2/top-headlines';
const String searchApi = 'v2/everything';
const String imgNotAvailable = 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png';

late SharedPreferences prefs;
