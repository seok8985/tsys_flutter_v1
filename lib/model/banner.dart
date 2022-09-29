class BannerModel {
  String image;
  BannerModel(this.image);
}

List<BannerModel> banners =
    bannerData.map((e) => BannerModel(e['image']!)).toList();

var bannerData = [
  {"image": "images/banner1.jpeg"},
  {"image": "images/banner2.jpeg"},
  {"image": "images/banner3.jpeg"},
];
