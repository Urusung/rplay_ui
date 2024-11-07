class RankingModel {
  final int rank;
  final String image;
  final String title;
  final String creator;
  final String viewCount;
  final String likeCount;
  final String commentCount;

  RankingModel({
    required this.rank,
    required this.image,
    required this.title,
    required this.creator,
    required this.viewCount,
    required this.likeCount,
    required this.commentCount,
  });
}
