extension CheckingNullOrEmpty on String? {
  String checkString(
    String alternativeString,
  ) {
    if (this != null) {
      if (this!.isNotEmpty) {
        return this!;
      } else {
        return alternativeString;
      }
    } else {
      return alternativeString;
    }
  }
}
