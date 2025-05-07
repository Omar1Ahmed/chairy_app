import 'package:chairy_app/Features/authentication/data/model/auth_model.dart';

import '../../../../core/network/dio_client.dart';
import 'AuthenticaionRemoteDataSource.dart';

class AuthenticationRemoteDataSourceImp implements AuthenticationRemoteDataSource {
  final DioClient dioClient;

  AuthenticationRemoteDataSourceImp({required this.dioClient});


  @override
  Future<AuthModel> login(String email, String password) async {

    try {
      final response = await dioClient.post(
      '/api/login',
      body: {
        'email': email,
        'password': password
      },
    );
      print(response);
    return AuthModel.fromJson(response);
  }catch(e){
  print(e);

  throw e;
  }
  }

  @override
  Future<AuthModel> signUp(String name, String lastName, String email, String password) async {



    try {
      final response = await dioClient.post('/api/register', body: {
        "name": name,
        "lastname": lastName,
        "password": password,
        "email": email,
      });

      print(response);
      return AuthModel.fromJson(response);
    }catch(e){
      print(e);

      throw e;
    }

  }
}
