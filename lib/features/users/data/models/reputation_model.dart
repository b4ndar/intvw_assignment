

import '../../domain/users_domain.dart';

class ReputationHistory extends ReputationHistoryEntity {
  const ReputationHistory(
      {required super.reputationHistoryType,
        required super.reputationChange,
        required super.postId,
        required super.creationDate,
        required super.userId,});

  factory ReputationHistory.fromJson(Map<String, dynamic> json) {
    return ReputationHistory(
      reputationHistoryType: json['reputation_history_type'],
      reputationChange: json['reputation_change'],
      postId: json['post_id'],
      creationDate: json['creation_date'],
      userId: json['user_id'],
    );
  }
}
