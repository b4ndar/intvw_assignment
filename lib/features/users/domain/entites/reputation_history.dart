import 'package:equatable/equatable.dart';

class ReputationHistoryEntity extends Equatable {

  final String reputationHistoryType;
  final int reputationChange;
  final int postId;
  final int creationDate;
  final int userId;

  const ReputationHistoryEntity({required this.reputationHistoryType, required this.reputationChange, required this.postId, required this.creationDate, required this.userId});

  @override
  List<Object?> get props => [reputationHistoryType,reputationChange,postId,creationDate,userId];
}
