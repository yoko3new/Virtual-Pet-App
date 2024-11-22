import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/pages/milestones.dart';
import 'package:login/pages/support.dart';
import 'package:login/pages/profile.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/pages/pet_checklist.dart';
import 'package:flutter/widgets.dart';




void main() {
  group('Pet Pals Test', () {

    // Test ID: 001_ Profile
    // Purpose: Verify that the user is able to navigate back to the homepage after updating profile
    //Testing environment: Flutter test package
    //Test Steps
    testWidgets('Navigating back after saving profile', (WidgetTester tester) async {
      // Step 1: Build the profilePage widget
      await tester.pumpWidget(MaterialApp(home: profilePage()));

      // Step 2: Click the "Save Changes" button
      final saveButton = find.byType(ElevatedButton);
      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      expect(find.byType(profilePage), findsOneWidget);

      //Expected results: Navigate back to the homepage

      //Likely Problems/Bugs Revealed: There may be a bug where it does not navigate to the homepage correctly
    });


    //Test ID: 002_Pet Milestones
    //Purpose: The petMilestones widget is displayed correctly(ensure that the title, back button, and milestone cards are present and displayed correctly
    //Testing environment: Flutter test package
    //Test Steps

    testWidgets('Displays milestones correctly', (WidgetTester tester) async {
      // Step 1: Build the petMilestones widget
      await tester.pumpWidget(MaterialApp(home: petMilestones()));

      // Step 2: Verify that the app bar is present with the text 'Milestones'
      expect(find.text('Milestones'), findsOneWidget);

      // Step 3: Verify that all milestone cards are rendered correctly
      expect(find.text('🔔 Your pet has turned 2 years old!'), findsOneWidget);
      expect(find.text('🔔 Your pet is potty trained!'), findsOneWidget);
      expect(find.text('🔔 Your pet made a new friend!'), findsOneWidget);
      expect(find.text('🔔 Your pet lost their first tooth!'), findsOneWidget);
      expect(find.text('🔔 Your pet has turned 1 year old!'), findsOneWidget);

      // Step 4: Verify that the back button in the app bar is present
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      //Expected results: The milestone widget is rendered correctly

      //Likely Problems/Bugs Revealed: There was a RenderFlex overflowed error

    });



    //Test ID: 003_Pet Support
    //Purpose: To ensure the form validation shows an error when the fields are empty
    //Testing environment: Flutter test package
    //Test Steps

    testWidgets('Form validation shows error when the fields are empty', (WidgetTester tester) async {
      // Step 1: Build petSupport widget.
      await tester.pumpWidget(MaterialApp(home: petSupport()));

      // Step 2: Try to submit the form when fields are empty
      await tester.tap(find.text('Submit Ticket'));
      await tester.pump();

      // Step 3: Verify that validation error messages are shown.
      expect(find.text('Do not leave blank'), findsNWidgets(2));

      //Expected results: It displays an error message when the fields are empty

      //Likely Problems/Bugs Revealed: There may be a bug where the error message does not pop up for empty fields
    });



    //Test ID: 004_Login
    //Purpose: To ensure the user navigates to the pet dashboard once they sign in
    //Testing environment: Flutter test package
    //Test Steps
    testWidgets('Login page renders and navigates to pet dashboard on sign-in', (WidgetTester tester) async {
      final navigationKey = GlobalKey<NavigatorState>();

      // Step 1: Build the LoginPage widget
      await tester.pumpWidget(MaterialApp(
        home: LoginPage(),
        navigatorKey: navigationKey,
        routes: {
          '/petdashboard': (context) => Scaffold(body: Text('Pet Dashboard')),
        },
      ));

      // Step 2: Check that the 'PetPals' text is present
      expect(find.text('PetPals'), findsOneWidget);

      // Step 3: Check if the "Sign in" button is visible
      expect(find.byType(ElevatedButton), findsNWidgets(2));

      // Step 4: Enter a username and password in the text fields
      await tester.enterText(find.byType(TextField).first, 'testuser');
      await tester.enterText(find.byType(TextField).at(1), 'testpassword');

      // Step 5: Ensure the text fields have the correct input
      expect(find.text('testuser'), findsOneWidget);
      expect(find.text('testpassword'), findsOneWidget);

      // Step 6: Tap the "Sign in" button
      await tester.tap(find.byKey(Key('sign_in')));
      await tester.pumpAndSettle();

      expect(find.text('Pet Dashboard'), findsOneWidget);

      //Expected results: The user is navigated to the dashboard

      //Likely Problems/Bugs Revealed: There was a tap location issue

    });



    //Test ID: 005_Pet Checklist
    //Purpose: To ensure the pet checklist is rendered correctly and the task states are updated correctly
    //Testing environment: Flutter test package
    //Test Steps
    testWidgets('PetChecklist renders and updates task states correctly', (WidgetTester tester) async {
      // Stel 1: Build the petChecklist widget
      await tester.pumpWidget(MaterialApp(
        home: const petChecklist(),
      ));

      // Step 2: Verify the checklist title is rendered
      expect(find.text('Pet Care Checklist'), findsOneWidget);

      // Step 3: Verify the number of task match the taskTitles length
      expect(find.byType(CheckboxListTile), findsNWidgets(5));

      // Step 5: Ensure that all checkboxes are initially unchecked
      for (int i = 0; i < 5; i++) {
        expect(tester.widget<CheckboxListTile>(find.byType(CheckboxListTile).at(i)).value, false);
      }

      // Step 6: Click on the first checkbox to check it
      await tester.tap(find.byType(CheckboxListTile).at(0));
      await tester.pump();

      // Step 7: Verify that the first checkbox is now checked
      expect(tester.widget<CheckboxListTile>(find.byType(CheckboxListTile).at(0)).value, true);

      // Step 8: Click on the first checkbox to uncheck it
      await tester.tap(find.byType(CheckboxListTile).at(0));
      await tester.pump();  // Rebuild the widget to reflect the change

      // Step 9: Verify that the first checkbox is now unchecked
      expect(tester.widget<CheckboxListTile>(find.byType(CheckboxListTile).at(0)).value, false);

      //Expected results: The pet checklist is rendered correctly and the user is able to check and uncheck the tasks

      //Likely Problems/Bugs Revealed: There may be a bug where the pet checklist is not rendered correctly

    });
  });
}

