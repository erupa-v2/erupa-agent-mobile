import 'dart:math';

/// Generate unique usernames for users
String generateUsername() {
  Random random = Random();
  String username = '';

  for (int i = 0; i < 6; i++) {
    int asciiValue = random.nextInt(26) + 65;
    // Generate random ASCII value for uppercase letters (A-Z)
    String character = String.fromCharCode(asciiValue);
    username += character;
  }

  return username.toLowerCase();
}
