import '../models/job_category.dart';
import '../models/job_category_ads.dart';

final mockAdsCategories = [
  JobCategory(
      header: 'Drei einfache Schritter\nzu deinem neuen Job',
      category: 'Arbeitneihmer',
      ads: <JobCategoryAd>[
        JobCategoryAd(
          title: 'Erstellen dein Lebenslauf',
          image: 'assets/images/profile_data.svg',
        ),
        JobCategoryAd(
          title: 'Erstellen dein Lebenslauf',
          image: 'assets/images/business_deal.svg',
        ),
        JobCategoryAd(
          title: 'Mit nur einem Klick\nbewerben',
          image: 'assets/images/job_offers.svg',
        ),
      ]),
  JobCategory(
      header: 'Drei einfache Schritter\nzu deinem neuen Mitarbeiter',
      category: 'Arbeitgeber',
      ads: <JobCategoryAd>[
        JobCategoryAd(
          title: 'Erstellen dein\nUnternehmensprofil',
          image: 'assets/images/profile_data.svg',
        ),
        JobCategoryAd(
          title: 'Erstellen ein Jobinserat',
          image: 'assets/images/business_deal.svg',
        ),
        JobCategoryAd(
          title: 'Wahle deinen\neuen Mitarbeiter aus',
          image: 'assets/images/job_offers.svg',
        ),
      ]),
  JobCategory(
      header: 'Drei einfache Schritter zur Vermittlung neuer Mitarbeiter',
      category: 'Temporarburo',
      ads: <JobCategoryAd>[
        JobCategoryAd(
          title: 'Erstellen dein\nUnternehmensprofil',
          image: 'assets/images/profile_data.svg',
        ),
        JobCategoryAd(
          title: 'Erhalter Vermittlungs-\nangebot von Arbeitgeber',
          image: 'assets/images/business_deal.svg',
        ),
        JobCategoryAd(
          title: 'Vermittlung nach\nProvision oder\nStundenlohn',
          image: 'assets/images/job_offers.svg',
        ),
      ]),
];
