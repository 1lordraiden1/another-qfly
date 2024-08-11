import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionChecker {
  final Connectivity _connectivity = Connectivity();

  // Stream to listen for connectivity changes
  Stream<List<ConnectivityResult>> get connectivityStream =>
      _connectivity.onConnectivityChanged;

  // Check if the device is currently connected to the internet
  Future<bool> isConnected() async {
    final result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
