import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voca_do/core/services/local_keys_service.dart';
import 'package:voca_do/features/admin_home_screen/data/models/admin_home_screen_model.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';


abstract class BaseAdminHomeScreenRemoteDataSource {
  Future<AdminHomeScreenModel> getAdminHomeScreen();
}


@LazySingleton(as: BaseAdminHomeScreenRemoteDataSource)
class AdminHomeScreenRemoteDataSource implements BaseAdminHomeScreenRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   AdminHomeScreenRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<AdminHomeScreenModel> getAdminHomeScreen() async {
    try {
      return AdminHomeScreenModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
