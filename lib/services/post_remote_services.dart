import 'package:http/http.dart' as http ;
import 'package:job_interview/models/post.dart';
import '../config/app_constants.dart';

class PostRemoteServices {


  Future<List<Post>?> getPosts(int page,int limit) async{
    var client  = http.Client();
    var uri = Uri.parse("${AppConstants.baseUrl}?_page=$page&_limit=$limit");
    var response  = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return listPostFromJson(json);
    }
  }

  Future<Post?> getPost(int id) async{
    var client  = http.Client();
    var uri = Uri.parse("${AppConstants.baseUrl}/$id");
    var response  = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return postFromJson(json);
    }
    return null;
  }
}