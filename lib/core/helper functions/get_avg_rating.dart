double getAvgRating(dynamic reviews) {
  if (reviews == null) return 0.0;

  if (reviews is! List) return 0.0;

  if (reviews.isEmpty) return 0.0;

  var sum = 0.0;
  var validReviewsCount = 0;

  for (var review in reviews) {
    if (review != null && review['rating'] != null) {
      sum += (review['rating'] as num).toDouble();
      validReviewsCount++;
    }
  }

  return validReviewsCount > 0 ? sum / validReviewsCount : 0.0;
}
