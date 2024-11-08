import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ResultService {
  static const String _keyResults = 'results';

  // Save a list of results
  Future<void> saveResults(List<Map<String, dynamic>> results) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonResults = jsonEncode(results);
    await prefs.setString(_keyResults, jsonResults);
  }

  // Load the list of results
  Future<List<Map<String, dynamic>>> loadResults() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonResults = prefs.getString(_keyResults);
    if (jsonResults != null) {
      List<dynamic> resultList = jsonDecode(jsonResults);
      return resultList.map((result) => Map<String, dynamic>.from(result)).toList();
    }
    return [];
  }

  // Add a new result to the list
  Future<void> addResult(Map<String, dynamic> newResult) async {
    List<Map<String, dynamic>> currentResults = await loadResults();
    currentResults.add(newResult);
    await saveResults(currentResults);
  }

  // Clear all results
  Future<void> clearResults() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyResults);
  }
}
