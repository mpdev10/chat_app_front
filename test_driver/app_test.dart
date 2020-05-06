import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';

import 'steps/fill_with.dart';
import 'steps/not_logged_in.dart';
import 'steps/on_page.dart';
import 'steps/see_on_screen.dart';
import 'steps/tap_button.dart';
import 'steps/tick_checkbox.dart';


Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ] // you can include the "StdoutReporter()" without the message level parameter for verbose log information
    //..hooks = []
    ..stepDefinitions = [FillWith(), NotLoggedIn(), OnPage(), SeeOnScreen(), TapButton(), TickCheckbox()]
    //..customStepParameterDefinitions = []
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart"
  // ..tagExpression = "@smoke" // uncomment to see an example of running scenarios based on tag expressions
    ..exitAfterTestRun = true; // set to false if debugging to exit cleanly
  return GherkinRunner().execute(config);
}