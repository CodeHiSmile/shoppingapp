class ProductEntity {
  String? urlImage;
  String? nameProduct;
  double? price;
  bool? isFavorite;
  String? volume;

  ProductEntity({
    this.isFavorite,
    this.nameProduct,
    this.price,
    this.urlImage,
    this.volume,
  });
}

List<ProductEntity> listProduct = [
  ProductEntity(
    nameProduct: "Aveeno Shampoo",
    price: 75.46,
    isFavorite: false,
    volume: "Volume 398ml/13.15 floz",
    urlImage: "https://pngimg.com/uploads/shampoo/shampoo_PNG17.png",
  ),
  ProductEntity(
    nameProduct: "Venicream Shampoo",
    price: 55.46,
    isFavorite: false,
    volume: "Volume 398ml/13.15 floz",
    urlImage:
        "https://pngimg.com/uploads/shampoo/small/shampoo_PNG1.png",
  ),
  ProductEntity(
    nameProduct: "Cetaphil Body lotion",
    price: 65.46,
    isFavorite: false,
    volume: "Volume 398ml/13.15 floz",
    urlImage: "https://pngimg.com/uploads/shampoo/small/shampoo_PNG4.png",
  ),
  ProductEntity(
    nameProduct: "Nivea Body lotion",
    price: 52.46,
    isFavorite: false,
    volume: "Volume 398ml/13.15 floz",
    urlImage: "https://pngimg.com/uploads/shampoo/small/shampoo_PNG7.png",
  ),
];
