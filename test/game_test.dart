import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_2b_park_etme/oyun_2b_park_etme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(parkConfig.title.length, 33);
    expect(parkConfig.tagline.length, 33);
    for (final s in parkConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(parkRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: parkId, optionalMechanics: parkRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(parkRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
