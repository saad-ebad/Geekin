// To parse this JSON data, do
//
//     final bodyModel = bodyModelFromJson(jsonString);

import 'dart:convert';

ArticleModel bodyModelFromJson(String str) => ArticleModel.fromJson(json.decode(str));

String bodyModelToJson(ArticleModel data) => json.encode(data.toJson());

class ArticleModel {
  ArticleModel({
    this.status,
    this.copyright,
    this.response,
  });

  String? status;
  String? copyright;
  Response? response;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    status: json["status"],
    copyright: json["copyright"],
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "copyright": copyright,
    "response": response?.toJson(),
  };
}

class Response {
  Response({
    this.docs,
    this.meta,
  });

  List<Doc>? docs;
  Meta? meta;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "docs": List<dynamic>.from(docs!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class Doc {
  Doc({
    this.docAbstract,
    this.webUrl,
    this.snippet,
    this.leadParagraph,
    this.printSection,
    this.printPage,
    this.source,
    this.multimedia,
    this.headline,
    this.keywords,
    this.pubDate,
    this.documentType,
    this.newsDesk,
    this.sectionName,
    this.subsectionName,
    this.byline,
    this.typeOfMaterial,
    this.id,
    this.wordCount,
    this.uri,
  });

  String? docAbstract;
  String? webUrl;
  String? snippet;
  String? leadParagraph;
  String? printSection;
  String? printPage;
  Source? source;
  List<Multimedia>? multimedia;
  Headline? headline;
  List<Keyword>? keywords;
  String? pubDate;
  DocumentType? documentType;
  String? newsDesk;
  String? sectionName;
  String? subsectionName;
  Byline? byline;
  TypeOfMaterial? typeOfMaterial;
  String? id;
  int? wordCount;
  String? uri;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    docAbstract: json["abstract"],
    webUrl: json["web_url"],
    snippet: json["snippet"],
    leadParagraph: json["lead_paragraph"],
    printSection: json["print_section"] == null ? null : json["print_section"],
    printPage: json["print_page"] == null ? null : json["print_page"],
    source: sourceValues.map[json["source"]],
    multimedia: List<Multimedia>.from(json["multimedia"].map((x) => Multimedia.fromJson(x))),
    headline: Headline.fromJson(json["headline"]),
    keywords: List<Keyword>.from(json["keywords"].map((x) => Keyword.fromJson(x))),
    pubDate: json["pub_date"],
    documentType: documentTypeValues.map[json["document_type"]],
    newsDesk: json["news_desk"],
    sectionName: json["section_name"],
    subsectionName: json["subsection_name"] == null ? null : json["subsection_name"],
    byline: Byline.fromJson(json["byline"]),
    typeOfMaterial: typeOfMaterialValues.map[json["type_of_material"]],
    id: json["_id"],
    wordCount: json["word_count"],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "abstract": docAbstract,
    "web_url": webUrl,
    "snippet": snippet,
    "lead_paragraph": leadParagraph,
    "print_section": printSection == null ? null : printSection,
    "print_page": printPage == null ? null : printPage,
    "source": sourceValues.reverse[source],
    "multimedia": List<dynamic>.from(multimedia!.map((x) => x.toJson())),
    "headline": headline?.toJson(),
    "keywords": List<dynamic>.from(keywords!.map((x) => x.toJson())),
    "pub_date": pubDate,
    "document_type": documentTypeValues.reverse[documentType],
    "news_desk": newsDesk,
    "section_name": sectionName,
    "subsection_name": subsectionName == null ? null : subsectionName,
    "byline": byline?.toJson(),
    "type_of_material": typeOfMaterialValues.reverse[typeOfMaterial],
    "_id": id,
    "word_count": wordCount,
    "uri": uri,
  };
}

class Byline {
  Byline({
    this.original,
    this.person,
    this.organization,
  });

  String? original;
  List<Person>? person;
  dynamic organization;

  factory Byline.fromJson(Map<String, dynamic> json) => Byline(
    original: json["original"] == null ? null : json["original"],
    person: List<Person>.from(json["person"].map((x) => Person.fromJson(x))),
    organization: json["organization"],
  );

  Map<String, dynamic> toJson() => {
    "original": original == null ? null : original,
    "person": List<dynamic>.from(person!.map((x) => x.toJson())),
    "organization": organization,
  };
}

class Person {
  Person({
    this.firstname,
    this.middlename,
    this.lastname,
    this.qualifier,
    this.title,
    this.role,
    this.organization,
    this.rank,
  });

  String? firstname;
  dynamic middlename;
  String? lastname;
  String? qualifier;
  dynamic title;
  String? role;
  String? organization;
  int? rank;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    firstname: json["firstname"],
    middlename: json["middlename"],
    lastname: json["lastname"],
    qualifier: json["qualifier"] == null ? null : json["qualifier"],
    title: json["title"],
    role: json["role"],
    organization: json["organization"],
    rank: json["rank"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "middlename": middlename,
    "lastname": lastname,
    "qualifier": qualifier == null ? null : qualifier,
    "title": title,
    "role": role,
    "organization": organization,
    "rank": rank,
  };
}

enum DocumentType { ARTICLE }

final documentTypeValues = EnumValues({
  "article": DocumentType.ARTICLE
});

class Headline {
  Headline({
    this.main,
    this.kicker,
    this.contentKicker,
    this.printHeadline,
    this.name,
    this.seo,
    this.sub,
  });

  String? main;
  String? kicker;
  dynamic contentKicker;
  String? printHeadline;
  dynamic name;
  dynamic seo;
  dynamic sub;

  factory Headline.fromJson(Map<String, dynamic> json) => Headline(
    main: json["main"],
    kicker: json["kicker"] == null ? null : json["kicker"],
    contentKicker: json["content_kicker"],
    printHeadline: json["print_headline"] == null ? null : json["print_headline"],
    name: json["name"],
    seo: json["seo"],
    sub: json["sub"],
  );

  Map<String, dynamic> toJson() => {
    "main": main,
    "kicker": kicker == null ? null : kicker,
    "content_kicker": contentKicker,
    "print_headline": printHeadline == null ? null : printHeadline,
    "name": name,
    "seo": seo,
    "sub": sub,
  };
}

class Keyword {
  Keyword({
    this.name,
    this.value,
    this.rank,
    this.major,
  });

  Name? name;
  String? value;
  int? rank;
  Major? major;

  factory Keyword.fromJson(Map<String, dynamic> json) => Keyword(
    name: nameValues.map[json["name"]],
    value: json["value"],
    rank: json["rank"],
    major: majorValues.map[json["major"]],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "value": value,
    "rank": rank,
    "major": majorValues.reverse[major],
  };
}

enum Major { N }

final majorValues = EnumValues({
  "N": Major.N
});

enum Name { SUBJECT, PERSONS, CREATIVE_WORKS, ORGANIZATIONS, GLOCATIONS }

final nameValues = EnumValues({
  "creative_works": Name.CREATIVE_WORKS,
  "glocations": Name.GLOCATIONS,
  "organizations": Name.ORGANIZATIONS,
  "persons": Name.PERSONS,
  "subject": Name.SUBJECT
});

class Multimedia {
  Multimedia({
    this.rank,
    this.subtype,
    this.caption,
    this.credit,
    this.type,
    this.url,
    this.height,
    this.width,
    this.legacy,
    this.subType,
    this.cropName,
  });

  int? rank;
  String? subtype;
  dynamic caption;
  dynamic credit;
  Type? type;
  String? url;
  int? height;
  int? width;
  Legacy? legacy;
  String? subType;
  String? cropName;

  factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
    rank: json["rank"],
    subtype: json["subtype"],
    caption: json["caption"],
    credit: json["credit"],
    type: typeValues.map[json["type"]],
    url: json["url"],
    height: json["height"],
    width: json["width"],
    legacy: Legacy.fromJson(json["legacy"]),
    subType: json["subType"],
    cropName: json["crop_name"],
  );

  Map<String, dynamic> toJson() => {
    "rank": rank,
    "subtype": subtype,
    "caption": caption,
    "credit": credit,
    "type": typeValues.reverse[type],
    "url": url,
    "height": height,
    "width": width,
    "legacy": legacy?.toJson(),
    "subType": subType,
    "crop_name": cropName,
  };
}

class Legacy {
  Legacy({
    this.xlarge,
    this.xlargewidth,
    this.xlargeheight,
    this.thumbnail,
    this.thumbnailwidth,
    this.thumbnailheight,
    this.widewidth,
    this.wideheight,
    this.wide,
  });

  String? xlarge;
  int? xlargewidth;
  int? xlargeheight;
  String? thumbnail;
  int? thumbnailwidth;
  int? thumbnailheight;
  int? widewidth;
  int? wideheight;
  String? wide;

  factory Legacy.fromJson(Map<String, dynamic> json) => Legacy(
    xlarge: json["xlarge"] == null ? null : json["xlarge"],
    xlargewidth: json["xlargewidth"] == null ? null : json["xlargewidth"],
    xlargeheight: json["xlargeheight"] == null ? null : json["xlargeheight"],
    thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
    thumbnailwidth: json["thumbnailwidth"] == null ? null : json["thumbnailwidth"],
    thumbnailheight: json["thumbnailheight"] == null ? null : json["thumbnailheight"],
    widewidth: json["widewidth"] == null ? null : json["widewidth"],
    wideheight: json["wideheight"] == null ? null : json["wideheight"],
    wide: json["wide"] == null ? null : json["wide"],
  );

  Map<String, dynamic> toJson() => {
    "xlarge": xlarge == null ? null : xlarge,
    "xlargewidth": xlargewidth == null ? null : xlargewidth,
    "xlargeheight": xlargeheight == null ? null : xlargeheight,
    "thumbnail": thumbnail == null ? null : thumbnail,
    "thumbnailwidth": thumbnailwidth == null ? null : thumbnailwidth,
    "thumbnailheight": thumbnailheight == null ? null : thumbnailheight,
    "widewidth": widewidth == null ? null : widewidth,
    "wideheight": wideheight == null ? null : wideheight,
    "wide": wide == null ? null : wide,
  };
}

enum Type { IMAGE }

final typeValues = EnumValues({
  "image": Type.IMAGE
});

enum Source { THE_NEW_YORK_TIMES }

final sourceValues = EnumValues({
  "The New York Times": Source.THE_NEW_YORK_TIMES
});

enum TypeOfMaterial { REVIEW, NEWS }

final typeOfMaterialValues = EnumValues({
  "News": TypeOfMaterial.NEWS,
  "Review": TypeOfMaterial.REVIEW
});

class Meta {
  Meta({
    this.hits,
    this.offset,
    this.time,
  });

  int? hits;
  int? offset;
  int? time;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    hits: json["hits"],
    offset: json["offset"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "hits": hits,
    "offset": offset,
    "time": time,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
