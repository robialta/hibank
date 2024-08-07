class HttpUtil {
  static String errorHandlingByStatusCode(int? code) {
    switch (code) {
      case 404:
        return 'Not Found';
      case 503:
        return 'Internet Connection Problem';
    }

    return 'Unknown Error';
  }
}
