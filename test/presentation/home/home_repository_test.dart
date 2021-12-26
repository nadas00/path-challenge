import 'package:flutter_test/flutter_test.dart';
import 'package:path_challenge/presentation/home/view_model/home_bloc_repository.dart';

void main() {
  late HomeRepository homeRepository;
  setUp(() {
    homeRepository = HomeRepository()..init();
  });
  group('Pagination Test', () {
    test('Test Update Offset', () {
      expect(homeRepository.offset, 0);
      homeRepository.updateOffset();
      expect(homeRepository.offset, 30);
      homeRepository.updateOffset();
      expect(homeRepository.offset, 60);
    });

    test('Update total Test', () async {
      expect(homeRepository.total, null);
      homeRepository.setTotalCount(100);
      expect(homeRepository.total, 100);
    });
  });
}
