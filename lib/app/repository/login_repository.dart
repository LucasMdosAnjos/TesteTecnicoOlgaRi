import 'package:dartz/dartz.dart';
import 'package:olga_ri/app/exceptions/login_failure.dart';
import 'package:olga_ri/app/repository/i_login_repository.dart';

class LoginRepository implements ILoginRepository{
  @override
  Future<Either<LoginFailure, String>> login(String email,String password) async {
    try{
      await Future.delayed(Duration(milliseconds: 50));
      if((email!=null && email.isNotEmpty) && (password!=null && password.isNotEmpty)){
        if(email == 'lucas@gmail.com' && password == 'axzcyr'){
          return right('Token');
        }else{
           throw Exception('403');
        }
      }else{
        throw Exception('400');
      }
    }on Exception catch(e){
      if(e.toString().trim() == 'Exception: 403'){
      return left(LoginNotFoundFailure());
      }else{
        return left(LoginCredentialsEmpty());
      }
    }
  }

}