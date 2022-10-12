import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final ConnectivityResult connectivityResult;

  NetworkInfoImpl(this.connectivityResult);

  @override
  Future<bool> get isConnected async =>
      !(await Connectivity().checkConnectivity() == ConnectivityResult.none);
}
