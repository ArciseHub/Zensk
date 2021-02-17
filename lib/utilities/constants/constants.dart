class Constants {
  static String TOP_HEADLINES_URL =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=38ecfbfc562141a6829c6ccf0057d9c0";

  static String headlinesFor(String keyword) {
    return "https://newsapi.org/v2/everything?q=$keyword&apiKey=38ecfbfc562141a6829c6ccf0057d9c0";
  }
}
