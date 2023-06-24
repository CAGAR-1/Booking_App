import 'package:go_fresha/core/data/data_source/remote/network_info.dart';
import 'package:go_fresha/feature/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:go_fresha/feature/auth/domain/repository/auth_repository.dart';

class AuthRepostoryImpl extends AuthRepository {
  final AuthLocalDataSource authLocalDataSource;
  final NetworkInfo networkInfo;

  AuthRepostoryImpl(
      {required this.authLocalDataSource, required this.networkInfo});
      
  @override
  Future<bool> isAuthenticated() async {
    return authLocalDataSource.isAuthenticated();
  }

  @override
  Future<void> logout() async{
    // try {
    //   await authRemote
      
    // } catch (e) {
      
    // }
   
  }
}
