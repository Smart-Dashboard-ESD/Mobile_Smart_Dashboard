import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_smart_dashboard/controllers/loginC.dart';
import 'package:mobile_smart_dashboard/controllers/registerC.dart';
import 'package:mobile_smart_dashboard/providers/auth_provider.dart';
import 'package:mobile_smart_dashboard/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.transparent, // status bar
      statusBarIconBrightness: Brightness.dark // color
      ));
  runApp(MobileSmartDashboard());
}

class MobileSmartDashboard extends StatelessWidget {
  MobileSmartDashboard({Key? key}) : super(key: key);
  final registerC = Get.put(RegisterC());
  final loginC = Get.put(LoginC());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routes,
        initialRoute: AppPages.initial,
      ),
    );
  }
}
