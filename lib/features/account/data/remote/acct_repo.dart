import 'dart:convert';
import 'package:craftmanapp/constants/api_constants.dart';
import 'package:craftmanapp/features/account/domain/acct_repo_interface.dart';
import 'package:http/http.dart';

class AcctRepo extends AcctRepoInterface {
  var client = Client();
  @override
  Future<Response> updateUserInfo(
      {String? name, String? mobile, String? address}) async {
    var url = Uri.parse(Apis.updateUserProfile);
    var body = {'mobile_number': mobile};

    var response = await client.patch(url,
        body: jsonEncode(body), headers: ApiHeaders.aunthenticatedHeader);
    return response;
  }
}
