import 'dart:io';

class NetworkHelper {
  NetworkHelper();

  Future<bool> checkNetworkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (error) {
      print('Net not connected due to: '+error.toString());
      return false;
    }
    return false;
  }

}
