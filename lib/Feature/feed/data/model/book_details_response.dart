import 'package:json_annotation/json_annotation.dart';

part 'book_details_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class BookDetailsResponse {
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'etag')
  String? etag;
  @JsonKey(name: 'selfLink')
  String? selfLink;
  @JsonKey(name: 'volumeInfo')
  VolumeInfo? volumeInfo;
  @JsonKey(name: 'saleInfo')
  SaleInfo? saleInfo;
  @JsonKey(name: 'accessInfo')
  AccessInfo? accessInfo;

  BookDetailsResponse(
      {this.kind,
      this.id,
      this.etag,
      this.selfLink,
      this.volumeInfo,
      this.saleInfo,
      this.accessInfo});

  factory BookDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$BookDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookDetailsResponseToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class VolumeInfo {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'subtitle')
  String? subtitle;
  @JsonKey(name: 'authors')
  List<String>? authors;
  @JsonKey(name: 'publisher')
  String? publisher;
  @JsonKey(name: 'publishedDate')
  String? publishedDate;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'industryIdentifiers')
  List<IndustryIdentifier>? industryIdentifiers;
  @JsonKey(name: 'readingModes')
  ReadingModes? readingModes;
  @JsonKey(name: 'pageCount')
  int? pageCount;
  @JsonKey(name: 'printedPageCount')
  int? printedPageCount;
  @JsonKey(name: 'dimensions')
  Dimensions? dimensions;
  @JsonKey(name: 'printType')
  String? printType;
  @JsonKey(name: 'categories')
  List<String>? categories;
  @JsonKey(name: 'maturityRating')
  String? maturityRating;
  @JsonKey(name: 'allowAnonLogging')
  bool? allowAnonLogging;
  @JsonKey(name: 'contentVersion')
  String? contentVersion;
  @JsonKey(name: 'panelizationSummary')
  PanelizationSummary? panelizationSummary;
  @JsonKey(name: 'imageLinks')
  ImageLinks? imageLinks;
  @JsonKey(name: 'language')
  String? language;
  @JsonKey(name: 'previewLink')
  String? previewLink;
  @JsonKey(name: 'infoLink')
  String? infoLink;
  @JsonKey(name: 'canonicalVolumeLink')
  String? canonicalVolumeLink;

  VolumeInfo(
      {this.title,
      this.subtitle,
      this.authors,
      this.publisher,
      this.publishedDate,
      this.description,
      this.industryIdentifiers,
      this.readingModes,
      this.pageCount,
      this.printedPageCount,
      this.dimensions,
      this.printType,
      this.categories,
      this.maturityRating,
      this.allowAnonLogging,
      this.contentVersion,
      this.panelizationSummary,
      this.imageLinks,
      this.language,
      this.previewLink,
      this.infoLink,
      this.canonicalVolumeLink});

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeInfoToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class IndustryIdentifier {
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'identifier')
  String? identifier;

  IndustryIdentifier({this.type, this.identifier});

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) =>
      _$IndustryIdentifierFromJson(json);

  Map<String, dynamic> toJson() => _$IndustryIdentifierToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class ReadingModes {
  @JsonKey(name: 'text')
  bool? text;
  @JsonKey(name: 'image')
  bool? image;

  ReadingModes({this.text, this.image});

  factory ReadingModes.fromJson(Map<String, dynamic> json) =>
      _$ReadingModesFromJson(json);

  Map<String, dynamic> toJson() => _$ReadingModesToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Dimensions {
  @JsonKey(name: 'height')
  String? height;

  Dimensions({this.height});

  factory Dimensions.fromJson(Map<String, dynamic> json) =>
      _$DimensionsFromJson(json);

  Map<String, dynamic> toJson() => _$DimensionsToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class PanelizationSummary {
  @JsonKey(name: 'containsEpubBubbles')
  bool? containsEpubBubbles;
  @JsonKey(name: 'containsImageBubbles')
  bool? containsImageBubbles;

  PanelizationSummary({this.containsEpubBubbles, this.containsImageBubbles});

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) =>
      _$PanelizationSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$PanelizationSummaryToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class ImageLinks {
  @JsonKey(name: 'smallThumbnail')
  String? smallThumbnail;
  @JsonKey(name: 'thumbnail')
  String? thumbnail;
  @JsonKey(name: 'small')
  String? small;
  @JsonKey(name: 'medium')
  String? medium;
  @JsonKey(name: 'large')
  String? large;
  @JsonKey(name: 'extraLarge')
  String? extraLarge;

  ImageLinks(
      {this.smallThumbnail,
      this.thumbnail,
      this.small,
      this.medium,
      this.large,
      this.extraLarge});

  factory ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksFromJson(json);

  Map<String, dynamic> toJson() => _$ImageLinksToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class LayerInfo {
  @JsonKey(name: 'layers')
  List<Layer>? layers;

  LayerInfo({this.layers});

  factory LayerInfo.fromJson(Map<String, dynamic> json) =>
      _$LayerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$LayerInfoToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Layer {
  @JsonKey(name: 'layerId')
  String? layerId;
  @JsonKey(name: 'volumeAnnotationsVersion')
  String? volumeAnnotationsVersion;

  Layer({this.layerId, this.volumeAnnotationsVersion});

  factory Layer.fromJson(Map<String, dynamic> json) => _$LayerFromJson(json);

  Map<String, dynamic> toJson() => _$LayerToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class SaleInfo {
  @JsonKey(name: 'country')
  String? country;
  @JsonKey(name: 'saleability')
  String? saleability;
  @JsonKey(name: 'isEbook')
  bool? isEbook;
  @JsonKey(name: 'listPrice')
  ListPrice? listPrice;
  @JsonKey(name: 'retailPrice')
  RetailPrice? retailPrice;
  @JsonKey(name: 'buyLink')
  String? buyLink;
  @JsonKey(name: 'offers')
  List<Offer>? offers;

  SaleInfo(
      {this.country,
      this.saleability,
      this.isEbook,
      this.listPrice,
      this.retailPrice,
      this.buyLink,
      this.offers});

  factory SaleInfo.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SaleInfoToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class ListPrice {
  @JsonKey(name: 'amount')
  double? amount;
  @JsonKey(name: 'currencyCode')
  String? currencyCode;

  ListPrice({this.amount, this.currencyCode});

  factory ListPrice.fromJson(Map<String, dynamic> json) =>
      _$ListPriceFromJson(json);

  Map<String, dynamic> toJson() => _$ListPriceToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class RetailPrice {
  @JsonKey(name: 'amount')
  double? amount;
  @JsonKey(name: 'currencyCode')
  String? currencyCode;

  RetailPrice({this.amount, this.currencyCode});

  factory RetailPrice.fromJson(Map<String, dynamic> json) =>
      _$RetailPriceFromJson(json);

  Map<String, dynamic> toJson() => _$RetailPriceToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Offer {
  @JsonKey(name: 'finskyOfferType')
  int? finskyOfferType;
  @JsonKey(name: 'listPrice')
  ListPrice? listPrice;
  @JsonKey(name: 'retailPrice')
  RetailPrice? retailPrice;

  Offer({this.finskyOfferType, this.listPrice, this.retailPrice});

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  Map<String, dynamic> toJson() => _$OfferToJson(this);
}

/*@JsonSerializable(ignoreUnannotated: false)
class ListPrice {
  @JsonKey(name: 'amountInMicros')
  int? amountInMicros;
  @JsonKey(name: 'currencyCode')
  String? currencyCode;

  ListPrice({this.amountInMicros, this.currencyCode});

  factory ListPrice.fromJson(Map<String, dynamic> json) => _$ListPriceFromJson(json);

  Map<String, dynamic> toJson() => _$ListPriceToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class RetailPrice {
  @JsonKey(name: 'amountInMicros')
  int? amountInMicros;
  @JsonKey(name: 'currencyCode')
  String? currencyCode;

  RetailPrice({this.amountInMicros, this.currencyCode});

  factory RetailPrice.fromJson(Map<String, dynamic> json) => _$RetailPriceFromJson(json);

  Map<String, dynamic> toJson() => _$RetailPriceToJson(this);
}*/

@JsonSerializable(ignoreUnannotated: false)
class AccessInfo {
  @JsonKey(name: 'country')
  String? country;
  @JsonKey(name: 'viewability')
  String? viewability;
  @JsonKey(name: 'embeddable')
  bool? embeddable;
  @JsonKey(name: 'publicDomain')
  bool? publicDomain;
  @JsonKey(name: 'textToSpeechPermission')
  String? textToSpeechPermission;
  @JsonKey(name: 'epub')
  Epub? epub;
  @JsonKey(name: 'pdf')
  Pdf? pdf;
  @JsonKey(name: 'webReaderLink')
  String? webReaderLink;
  @JsonKey(name: 'accessViewStatus')
  String? accessViewStatus;
  @JsonKey(name: 'quoteSharingAllowed')
  bool? quoteSharingAllowed;

  AccessInfo(
      {this.country,
      this.viewability,
      this.embeddable,
      this.publicDomain,
      this.textToSpeechPermission,
      this.epub,
      this.pdf,
      this.webReaderLink,
      this.accessViewStatus,
      this.quoteSharingAllowed});

  factory AccessInfo.fromJson(Map<String, dynamic> json) =>
      _$AccessInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AccessInfoToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Epub {
  @JsonKey(name: 'isAvailable')
  bool? isAvailable;
  @JsonKey(name: 'acsTokenLink')
  String? acsTokenLink;

  Epub({this.isAvailable, this.acsTokenLink});

  factory Epub.fromJson(Map<String, dynamic> json) => _$EpubFromJson(json);

  Map<String, dynamic> toJson() => _$EpubToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Pdf {
  @JsonKey(name: 'isAvailable')
  bool? isAvailable;

  Pdf({this.isAvailable});

  factory Pdf.fromJson(Map<String, dynamic> json) => _$PdfFromJson(json);

  Map<String, dynamic> toJson() => _$PdfToJson(this);
}
