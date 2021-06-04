class OnboardingContent {
  String title;
  String image;
  String description1;
  String description2;
  OnboardingContent(
      {required this.title,
      required this.image,
      required this.description1,
      required this.description2});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      title: 'PICKUPjob.com',
      description1: 'Deliver load to customer',
      description2: 'location and get paid ',
      image: 'assets/images/Phone1.png'),
  OnboardingContent(
      title: 'Find jobs nearby',
      description1: 'Find  job and Navigate through',
      description2: ' map with ease',
      image: 'assets/images/Phone2.png'),
  OnboardingContent(
      title: 'Bid price',
      description1: 'Bid your own price based on the ',
      description2: 'load & delivery location',
      image: 'assets/images/Phone3.png'),
  OnboardingContent(
      title: 'Instant pay',
      description1: 'Get paid instantly ',
      description2: 'when job done',
      image: 'assets/images/Phone4.png'),
];
