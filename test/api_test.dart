import 'package:code_challenge_taller/data/api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Api.getData", () {
    test("returns success when username=flutter and password=dev", () async {
      final result = await Api.getData(username: "flutter", password: "dev");
      expect(result["success"], true);
    });

    test("throws error when username/password are invalid", () async {
      expect(
            () => Api.getData(username: "wrong", password: "user"),
        throwsA(isA<Error>()),
      );
    });
  });
}