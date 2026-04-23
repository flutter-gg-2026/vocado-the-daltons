import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voca_do/core/services/local_keys_service.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';
import 'package:voca_do/features/auth/login/data/models/login_model.dart';


abstract class BaseLoginRemoteDataSource {
  Future<LoginModel> getLogin();
}


@LazySingleton(as: BaseLoginRemoteDataSource)
class LoginRemoteDataSource implements BaseLoginRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   LoginRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<LoginModel> getLogin() async {
    try {
      return LoginModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
