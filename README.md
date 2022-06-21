# 10 - middleware GetX part 2

### الان بدنا نشتغل على موضوع ال middlewares  بالاضافة الى priority على سبيل المثال (تطبيق بيحتوي على دخول كأدمن ودخول كيوزر)

// step 1 

      getPages: [
        GetPage(
          name: "/",
          page: () => const Login(),
          middlewares: [AuthMiddleWare()],
        ),
        GetPage(name: "/home", page: () => Home()),
        GetPage(name: "/admin", page: () => Admin()),
      ],
      
      
 // step 2 
 
    @override
   RouteSettings? redirect(String? route) {
     if (sharepref!.getString("role") == "user") {
       return const RouteSettings(
         name: "/home",
       );
     }
     if (sharepref!.getString("role") == "admin") {
       return const RouteSettings(
         name: "/admin",
        );
     }
   }
   
 // step 3
 
 
               onPressed: () {
                sharepref!.setString("role", "user");
                Get.offNamed("/home");
              },
              
              
              onPressed: () {
                sharepref!.setString("role", "admin");
                Get.offNamed("/admin");
              },
              
              
              

### الان حنعمل على انه يكون أكثر من middlewares  عنا في التطبيق 

// step 1 


class SuperMiddleWare extends GetMiddleware 


// step 2 


   GetPage(
          name: "/",
          page: () => const Login(),
          middlewares: [AuthMiddleWare(),SuperMiddleWare()],
        ),
        
        
### ال priority هو متغيير موجود عن في كلاسات ال middlewares  


// step 3 

    class AuthMiddleWare extends GetMiddleware {
     @override
     int? get priority => 1;
     
     class SuperMiddleWare extends GetMiddleware {
     @override
     int? get priority => 2;
     
### باختصار انه عند تشغيل ال (middlewares: [AuthMiddleWare(),SuperMiddleWare()]) 
     
### حينفذ بالاول AuthMiddleWare بعدين ال SuperMiddleWare حسب الاولوية الي احنا ضفناها 
     
 // step 4 
 
class SuperMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  bool myvar = true;
  @override
  RouteSettings? redirect(String? route) {
    if (myvar) {
      return const RouteSettings(
        name: "/super",
      );
    }
    return null;
  }
}


     
### هيك أول ما يشتغل التطبيق سوف يذهب الى شاشة ال super مباشرة


     
