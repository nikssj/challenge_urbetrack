// Package imports:
import 'package:hive/hive.dart';

// Project imports:
import 'package:challenge_ubertrack/hive/hive.dart';
import 'package:challenge_ubertrack/pages/home/models/people_model.dart';

part 'invader_preferences.g.dart';

@HiveType(typeId: 2)
class InvaderPreferences {
  InvaderPreferences();

  @HiveField(0)
  People? people;

  // GETTER y SETTER
  People get invader {
    return hiveModule.box.get('invader');
  }

  set invader(People value) {
    hiveModule.box.put('invader', value);
  }
}
