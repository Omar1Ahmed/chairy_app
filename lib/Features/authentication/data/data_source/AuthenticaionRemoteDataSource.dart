abstract class AuthenticationRemoteDataSource {
  //login setup by marwan
  Future login(String email, String password);
  Future signUp(String firstName, String lastName,String email, String password);

}