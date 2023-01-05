// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  BookModel({
    this.status,
    this.copyright,
    this.numResults,
    this.lastModified,
    this.results,
  });

  String? status;
  String? copyright;
  int? numResults;
  DateTime? lastModified;
  Results? results;

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    status: json["status"],
    copyright: json["copyright"],
    numResults: json["num_results"],
    lastModified: DateTime.parse(json["last_modified"]),
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "copyright": copyright,
    "num_results": numResults,
    "last_modified": lastModified?.toIso8601String(),
    "results": results?.toJson(),
  };
}

class Results {
  Results({
    this.listName,
    this.listNameEncoded,
    this.bestsellersDate,
    this.publishedDate,
    this.publishedDateDescription,
    this.nextPublishedDate,
    this.previousPublishedDate,
    this.displayName,
    this.normalListEndsAt,
    this.updated,
    this.books,
    this.corrections,
  });

  String? listName;
  String? listNameEncoded;
  DateTime? bestsellersDate;
  DateTime? publishedDate;
  String? publishedDateDescription;
  String? nextPublishedDate;
  DateTime? previousPublishedDate;
  String? displayName;
  int? normalListEndsAt;
  String? updated;
  List<Book>? books;
  List<dynamic>? corrections;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    listName: json["list_name"],
    listNameEncoded: json["list_name_encoded"],
    bestsellersDate: DateTime.parse(json["bestsellers_date"]),
    publishedDate: DateTime.parse(json["published_date"]),
    publishedDateDescription: json["published_date_description"],
    nextPublishedDate: json["next_published_date"],
    previousPublishedDate: DateTime.parse(json["previous_published_date"]),
    displayName: json["display_name"],
    normalListEndsAt: json["normal_list_ends_at"],
    updated: json["updated"],
    books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
    corrections: List<dynamic>.from(json["corrections"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "list_name": listName,
    "list_name_encoded": listNameEncoded,
    "bestsellers_date": "${bestsellersDate?.year.toString().padLeft(4, '0')}-${bestsellersDate?.month.toString().padLeft(2, '0')}-${bestsellersDate?.day.toString().padLeft(2, '0')}",
    "published_date": "${publishedDate?.year.toString().padLeft(4, '0')}-${publishedDate?.month.toString().padLeft(2, '0')}-${publishedDate?.day.toString().padLeft(2, '0')}",
    "published_date_description": publishedDateDescription,
    "next_published_date": nextPublishedDate,
    "previous_published_date": "${previousPublishedDate?.year.toString().padLeft(4, '0')}-${previousPublishedDate?.month.toString().padLeft(2, '0')}-${previousPublishedDate?.day.toString().padLeft(2, '0')}",
    "display_name": displayName,
    "normal_list_ends_at": normalListEndsAt,
    "updated": updated,
    "books": List<dynamic>.from(books!.map((x) => x.toJson())),
    "corrections": List<dynamic>.from(corrections!.map((x) => x)),
  };
}

class Book {
  Book({
    this.rank,
    this.rankLastWeek,
    this.weeksOnList,
    this.asterisk,
    this.dagger,
    this.primaryIsbn10,
    this.primaryIsbn13,
    this.publisher,
    this.description,
    this.price,
    this.title,
    this.author,
    this.contributor,
    this.contributorNote,
    this.bookImage,
    this.bookImageWidth,
    this.bookImageHeight,
    this.amazonProductUrl,
    this.ageGroup,
    this.bookReviewLink,
    this.firstChapterLink,
    this.sundayReviewLink,
    this.articleChapterLink,
    this.isbns,
    this.buyLinks,
    this.bookUri,
  });

  int? rank;
  int? rankLastWeek;
  int? weeksOnList;
  int? asterisk;
  int? dagger;
  String? primaryIsbn10;
  String? primaryIsbn13;
  String? publisher;
  String? description;
  String? price;
  String? title;
  String? author;
  String? contributor;
  String? contributorNote;
  String? bookImage;
  int? bookImageWidth;
  int? bookImageHeight;
  String? amazonProductUrl;
  String? ageGroup;
  String? bookReviewLink;
  String? firstChapterLink;
  String? sundayReviewLink;
  String? articleChapterLink;
  List<Isbn>? isbns;
  List<BuyLink>? buyLinks;
  String? bookUri;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    rank: json["rank"],
    rankLastWeek: json["rank_last_week"],
    weeksOnList: json["weeks_on_list"],
    asterisk: json["asterisk"],
    dagger: json["dagger"],
    primaryIsbn10: json["primary_isbn10"],
    primaryIsbn13: json["primary_isbn13"],
    publisher: json["publisher"],
    description: json["description"],
    price: json["price"],
    title: json["title"],
    author: json["author"],
    contributor: json["contributor"],
    contributorNote: json["contributor_note"],
    bookImage: json["book_image"],
    bookImageWidth: json["book_image_width"],
    bookImageHeight: json["book_image_height"],
    amazonProductUrl: json["amazon_product_url"],
    ageGroup: json["age_group"],
    bookReviewLink: json["book_review_link"],
    firstChapterLink: json["first_chapter_link"],
    sundayReviewLink: json["sunday_review_link"],
    articleChapterLink: json["article_chapter_link"],
    isbns: List<Isbn>.from(json["isbns"].map((x) => Isbn.fromJson(x))),
    buyLinks: List<BuyLink>.from(json["buy_links"].map((x) => BuyLink.fromJson(x))),
    bookUri: json["book_uri"],
  );

  Map<String, dynamic> toJson() => {
    "rank": rank,
    "rank_last_week": rankLastWeek,
    "weeks_on_list": weeksOnList,
    "asterisk": asterisk,
    "dagger": dagger,
    "primary_isbn10": primaryIsbn10,
    "primary_isbn13": primaryIsbn13,
    "publisher": publisher,
    "description": description,
    "price": price,
    "title": title,
    "author": author,
    "contributor": contributor,
    "contributor_note": contributorNote,
    "book_image": bookImage,
    "book_image_width": bookImageWidth,
    "book_image_height": bookImageHeight,
    "amazon_product_url": amazonProductUrl,
    "age_group": ageGroup,
    "book_review_link": bookReviewLink,
    "first_chapter_link": firstChapterLink,
    "sunday_review_link": sundayReviewLink,
    "article_chapter_link": articleChapterLink,
    "isbns": List<dynamic>.from(isbns!.map((x) => x.toJson())),
    "buy_links": List<dynamic>.from(buyLinks!.map((x) => x.toJson())),
    "book_uri": bookUri,
  };
}

class BuyLink {
  BuyLink({
    this.name,
    this.url,
  });

  Name? name;
  String? url;

  factory BuyLink.fromJson(Map<String, dynamic> json) => BuyLink(
    name: nameValues.map?[json["name"]],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "url": url,
  };
}

enum Name { AMAZON, APPLE_BOOKS, BARNES_AND_NOBLE, BOOKS_A_MILLION, BOOKSHOP, INDIE_BOUND }

final nameValues = EnumValues({
  "Amazon": Name.AMAZON,
  "Apple Books": Name.APPLE_BOOKS,
  "Barnes and Noble": Name.BARNES_AND_NOBLE,
  "Bookshop": Name.BOOKSHOP,
  "Books-A-Million": Name.BOOKS_A_MILLION,
  "IndieBound": Name.INDIE_BOUND
});

class Isbn {
  Isbn({
    this.isbn10,
    this.isbn13,
  });

  String? isbn10;
  String? isbn13;

  factory Isbn.fromJson(Map<String, dynamic> json) => Isbn(
    isbn10: json["isbn10"],
    isbn13: json["isbn13"],
  );

  Map<String, dynamic> toJson() => {
    "isbn10": isbn10,
    "isbn13": isbn13,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
