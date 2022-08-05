import 'job_category_ads.dart';

class JobCategory {
  final String category;
  final String header;
  final List<JobCategoryAd> ads;

  JobCategory({
    required this.category,
    required this.header,
    this.ads = const [],
  });
}
