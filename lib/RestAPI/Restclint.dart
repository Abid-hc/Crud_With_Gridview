import 'dart:convert';
import 'package:crud/Style/Style.dart';
import 'package:http/http.dart' as http;


Future<List> ProductGridViewListRquest()async {
  var URL=Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  var PostHeader={"Content-Type":"application/json"};

 var Response= await http.get(URL,headers:PostHeader );
  var ResultCode=Response.statusCode;
  var ResultBody=json.decode(Response.body);

 if(ResultCode==200 && ResultBody['status']=="success"){
   SuccessToast("Read Request Success");
   return ResultBody['data'];

 }
 else{
   ErrorToast("Read Request fail ! try again");
   return [];
 }

}


Future<bool> ProductCreateRquest(Formvalus) async{

  var URL=Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var Postbody=json.encode(Formvalus);
  var PostHeader={"Content-Type":"application/json"};

  var response= await  http.post(URL,headers:PostHeader,body:Postbody  );
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);


  if(ResultCode==200 && ResultBody['status']=="success" ){

    SuccessToast("Request Success");
    return true;

  }

  else{
    ErrorToast("Request fail ! try again");
    return false;

  }


}


Future<bool> ProductDeleteRequest(id) async {

  var URL=Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/"+id);
  var PostHeader={"Content-Type":"application/json"};
  var response= await http.get(URL,headers:PostHeader );

  var ResultCode=response.statusCode;

  var ResultBody=json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success" ){

    SuccessToast("Request Success");
    return true;

  }

  else{
    ErrorToast("Request fail ! try again");
    return false;

  }


}

Future<bool> ProductUpdateRquest(Formvalus,id) async{

  var URL=Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/"+id);
  var Postbody=json.encode(Formvalus);
  var PostHeader={"Content-Type":"application/json"};

  var response= await  http.post(URL,headers:PostHeader,body:Postbody  );
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);


  if(ResultCode==200 && ResultBody['status']=="success" ){

    SuccessToast("Request Success");
    return true;

  }

  else{
    ErrorToast("Request fail ! try again");
    return false;

  }


}