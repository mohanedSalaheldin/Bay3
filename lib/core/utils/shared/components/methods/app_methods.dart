bool emailIsValid(email) => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    .hasMatch(email);
Map<String, String> getAPIHeaders({required String token}) => {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token,
    };
