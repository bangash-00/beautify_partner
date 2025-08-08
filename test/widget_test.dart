import 'package:beautify_partner/view/splash/splash_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:beautify_partner/routes/app_pages.dart';

void main() {
  testWidgets('Splash screen loads and navigates', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(
      GetMaterialApp(
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
      ),
    );

    // Verify that SplashView is shown
    expect(find.byType(SplashView), findsOneWidget);
    expect(find.text('Beautify Partner'), findsOneWidget);

    // Wait for the splash delay (3 seconds)
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // Verify that it navigates to the Home screen
    expect(find.text('Home'), findsOneWidget); // Adjust based on your HomeView
  });
}
