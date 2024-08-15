// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDetailsResponse _$BookDetailsResponseFromJson(Map<String, dynamic> json) =>
    BookDetailsResponse(
      kind: json['kind'] as String?,
      id: json['id'] as String?,
      etag: json['etag'] as String?,
      selfLink: json['selfLink'] as String?,
      volumeInfo: json['volumeInfo'] == null
          ? null
          : VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
      saleInfo: json['saleInfo'] == null
          ? null
          : SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
      accessInfo: json['accessInfo'] == null
          ? null
          : AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookDetailsResponseToJson(
        BookDetailsResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'id': instance.id,
      'etag': instance.etag,
      'selfLink': instance.selfLink,
      'volumeInfo': instance.volumeInfo,
      'saleInfo': instance.saleInfo,
      'accessInfo': instance.accessInfo,
    };

VolumeInfo _$VolumeInfoFromJson(Map<String, dynamic> json) => VolumeInfo(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      publisher: json['publisher'] as String?,
      publishedDate: json['publishedDate'] as String?,
      description: json['description'] as String?,
      industryIdentifiers: (json['industryIdentifiers'] as List<dynamic>?)
          ?.map((e) => IndustryIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      readingModes: json['readingModes'] == null
          ? null
          : ReadingModes.fromJson(json['readingModes'] as Map<String, dynamic>),
      pageCount: (json['pageCount'] as num?)?.toInt(),
      printedPageCount: (json['printedPageCount'] as num?)?.toInt(),
      dimensions: json['dimensions'] == null
          ? null
          : Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
      printType: json['printType'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      maturityRating: json['maturityRating'] as String?,
      allowAnonLogging: json['allowAnonLogging'] as bool?,
      contentVersion: json['contentVersion'] as String?,
      panelizationSummary: json['panelizationSummary'] == null
          ? null
          : PanelizationSummary.fromJson(
              json['panelizationSummary'] as Map<String, dynamic>),
      imageLinks: json['imageLinks'] == null
          ? null
          : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
      language: json['language'] as String?,
      previewLink: json['previewLink'] as String?,
      infoLink: json['infoLink'] as String?,
      canonicalVolumeLink: json['canonicalVolumeLink'] as String?,
    );

Map<String, dynamic> _$VolumeInfoToJson(VolumeInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'publishedDate': instance.publishedDate,
      'description': instance.description,
      'industryIdentifiers': instance.industryIdentifiers,
      'readingModes': instance.readingModes,
      'pageCount': instance.pageCount,
      'printedPageCount': instance.printedPageCount,
      'dimensions': instance.dimensions,
      'printType': instance.printType,
      'categories': instance.categories,
      'maturityRating': instance.maturityRating,
      'allowAnonLogging': instance.allowAnonLogging,
      'contentVersion': instance.contentVersion,
      'panelizationSummary': instance.panelizationSummary,
      'imageLinks': instance.imageLinks,
      'language': instance.language,
      'previewLink': instance.previewLink,
      'infoLink': instance.infoLink,
      'canonicalVolumeLink': instance.canonicalVolumeLink,
    };

IndustryIdentifier _$IndustryIdentifierFromJson(Map<String, dynamic> json) =>
    IndustryIdentifier(
      type: json['type'] as String?,
      identifier: json['identifier'] as String?,
    );

Map<String, dynamic> _$IndustryIdentifierToJson(IndustryIdentifier instance) =>
    <String, dynamic>{
      'type': instance.type,
      'identifier': instance.identifier,
    };

ReadingModes _$ReadingModesFromJson(Map<String, dynamic> json) => ReadingModes(
      text: json['text'] as bool?,
      image: json['image'] as bool?,
    );

Map<String, dynamic> _$ReadingModesToJson(ReadingModes instance) =>
    <String, dynamic>{
      'text': instance.text,
      'image': instance.image,
    };

Dimensions _$DimensionsFromJson(Map<String, dynamic> json) => Dimensions(
      height: json['height'] as String?,
    );

Map<String, dynamic> _$DimensionsToJson(Dimensions instance) =>
    <String, dynamic>{
      'height': instance.height,
    };

PanelizationSummary _$PanelizationSummaryFromJson(Map<String, dynamic> json) =>
    PanelizationSummary(
      containsEpubBubbles: json['containsEpubBubbles'] as bool?,
      containsImageBubbles: json['containsImageBubbles'] as bool?,
    );

Map<String, dynamic> _$PanelizationSummaryToJson(
        PanelizationSummary instance) =>
    <String, dynamic>{
      'containsEpubBubbles': instance.containsEpubBubbles,
      'containsImageBubbles': instance.containsImageBubbles,
    };

ImageLinks _$ImageLinksFromJson(Map<String, dynamic> json) => ImageLinks(
      smallThumbnail: json['smallThumbnail'] as String?,
      thumbnail: json['thumbnail'] as String?,
      small: json['small'] as String?,
      medium: json['medium'] as String?,
      large: json['large'] as String?,
      extraLarge: json['extraLarge'] as String?,
    );

Map<String, dynamic> _$ImageLinksToJson(ImageLinks instance) =>
    <String, dynamic>{
      'smallThumbnail': instance.smallThumbnail,
      'thumbnail': instance.thumbnail,
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
      'extraLarge': instance.extraLarge,
    };

LayerInfo _$LayerInfoFromJson(Map<String, dynamic> json) => LayerInfo(
      layers: (json['layers'] as List<dynamic>?)
          ?.map((e) => Layer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LayerInfoToJson(LayerInfo instance) => <String, dynamic>{
      'layers': instance.layers,
    };

Layer _$LayerFromJson(Map<String, dynamic> json) => Layer(
      layerId: json['layerId'] as String?,
      volumeAnnotationsVersion: json['volumeAnnotationsVersion'] as String?,
    );

Map<String, dynamic> _$LayerToJson(Layer instance) => <String, dynamic>{
      'layerId': instance.layerId,
      'volumeAnnotationsVersion': instance.volumeAnnotationsVersion,
    };

SaleInfo _$SaleInfoFromJson(Map<String, dynamic> json) => SaleInfo(
      country: json['country'] as String?,
      saleability: json['saleability'] as String?,
      isEbook: json['isEbook'] as bool?,
      listPrice: json['listPrice'] == null
          ? null
          : ListPrice.fromJson(json['listPrice'] as Map<String, dynamic>),
      retailPrice: json['retailPrice'] == null
          ? null
          : RetailPrice.fromJson(json['retailPrice'] as Map<String, dynamic>),
      buyLink: json['buyLink'] as String?,
      offers: (json['offers'] as List<dynamic>?)
          ?.map((e) => Offer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SaleInfoToJson(SaleInfo instance) => <String, dynamic>{
      'country': instance.country,
      'saleability': instance.saleability,
      'isEbook': instance.isEbook,
      'listPrice': instance.listPrice,
      'retailPrice': instance.retailPrice,
      'buyLink': instance.buyLink,
      'offers': instance.offers,
    };

ListPrice _$ListPriceFromJson(Map<String, dynamic> json) => ListPrice(
      amount: (json['amount'] as num?)?.toDouble(),
      currencyCode: json['currencyCode'] as String?,
    );

Map<String, dynamic> _$ListPriceToJson(ListPrice instance) => <String, dynamic>{
      'amount': instance.amount,
      'currencyCode': instance.currencyCode,
    };

RetailPrice _$RetailPriceFromJson(Map<String, dynamic> json) => RetailPrice(
      amount: (json['amount'] as num?)?.toDouble(),
      currencyCode: json['currencyCode'] as String?,
    );

Map<String, dynamic> _$RetailPriceToJson(RetailPrice instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currencyCode': instance.currencyCode,
    };

Offer _$OfferFromJson(Map<String, dynamic> json) => Offer(
      finskyOfferType: (json['finskyOfferType'] as num?)?.toInt(),
      listPrice: json['listPrice'] == null
          ? null
          : ListPrice.fromJson(json['listPrice'] as Map<String, dynamic>),
      retailPrice: json['retailPrice'] == null
          ? null
          : RetailPrice.fromJson(json['retailPrice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
      'finskyOfferType': instance.finskyOfferType,
      'listPrice': instance.listPrice,
      'retailPrice': instance.retailPrice,
    };

AccessInfo _$AccessInfoFromJson(Map<String, dynamic> json) => AccessInfo(
      country: json['country'] as String?,
      viewability: json['viewability'] as String?,
      embeddable: json['embeddable'] as bool?,
      publicDomain: json['publicDomain'] as bool?,
      textToSpeechPermission: json['textToSpeechPermission'] as String?,
      epub: json['epub'] == null
          ? null
          : Epub.fromJson(json['epub'] as Map<String, dynamic>),
      pdf: json['pdf'] == null
          ? null
          : Pdf.fromJson(json['pdf'] as Map<String, dynamic>),
      webReaderLink: json['webReaderLink'] as String?,
      accessViewStatus: json['accessViewStatus'] as String?,
      quoteSharingAllowed: json['quoteSharingAllowed'] as bool?,
    );

Map<String, dynamic> _$AccessInfoToJson(AccessInfo instance) =>
    <String, dynamic>{
      'country': instance.country,
      'viewability': instance.viewability,
      'embeddable': instance.embeddable,
      'publicDomain': instance.publicDomain,
      'textToSpeechPermission': instance.textToSpeechPermission,
      'epub': instance.epub,
      'pdf': instance.pdf,
      'webReaderLink': instance.webReaderLink,
      'accessViewStatus': instance.accessViewStatus,
      'quoteSharingAllowed': instance.quoteSharingAllowed,
    };

Epub _$EpubFromJson(Map<String, dynamic> json) => Epub(
      isAvailable: json['isAvailable'] as bool?,
      acsTokenLink: json['acsTokenLink'] as String?,
    );

Map<String, dynamic> _$EpubToJson(Epub instance) => <String, dynamic>{
      'isAvailable': instance.isAvailable,
      'acsTokenLink': instance.acsTokenLink,
    };

Pdf _$PdfFromJson(Map<String, dynamic> json) => Pdf(
      isAvailable: json['isAvailable'] as bool?,
    );

Map<String, dynamic> _$PdfToJson(Pdf instance) => <String, dynamic>{
      'isAvailable': instance.isAvailable,
    };
