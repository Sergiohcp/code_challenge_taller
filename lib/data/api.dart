class Api {
  static Future<Map<String, bool>> getData({required String username, required String password}) async {
    await Future.delayed(Duration(seconds: 2));
    if (username == 'flutter' && password == 'dev') {
      return {
        'success': true
      };
    }
    throw Error();
  }
}