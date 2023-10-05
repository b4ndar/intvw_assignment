
import 'package:sof/features/users/data/users_data.dart';
import 'package:sof/features/users/domain/users_domain.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

// Create a mock class for ApiHelper
class MockApiHelper extends Mock implements ApiHelper {}

void main() {
  late UserRepositoryImpl userRepository;
  MockApiHelper? mockApiHelper;

  setUp(() {
    mockApiHelper = MockApiHelper();
    userRepository = UserRepositoryImpl();
  });

  group('getUserDetails', () {
    test('should return a list of ReputationHistory', () async {
      // Arrange
      const userId = 123;
      const page = 1;
      const rReputation = ReputationHistoryEntity(
          reputationHistoryType: 'reputationHistoryType',
          reputationChange: 1,
          postId: 1,
          creationDate: 1,
          userId: userId);

      when(mockApiHelper!.get('any', queryParams: anyNamed('queryParams')))
          .thenAnswer((_) async => rReputation);

      // Act
      final result = await userRepository.getUserDetails(userId, page: page);

      // Assert
      expect(result, isA<List<ReputationHistory>>());
    });
  });

  group('getUsers', () {
    test('should return a list of UserEntity', () async {
      // Arrange
      const page = 1;
      const rUser = UserEntity(
          reputation: 1,
          userType: 'userType',
          userId: 1,
          location: 'location',
          profileImage: 'profileImage',
          displayName: 'displayName');

      when(mockApiHelper!.get('any', queryParams: anyNamed('queryParams')))
          .thenAnswer((_) async => rUser);
      // Act
      final result = await userRepository.getUsers(page: page);
      // Assert
      expect(result, isA<List<UserEntity>>());
    });
  });
}
