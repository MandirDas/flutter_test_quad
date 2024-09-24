class Welcome {
  final double score;
  final Show show;

  Welcome({
    required this.score,
    required this.show,
  });

  factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
        score: json["score"]?.toDouble(),
        show: Show.fromMap(json["show"]),
      );
}

class Show {
  final int id;
  final String? url;
  final String? name;
  final String? type;
  final String? language;
  final List<String> genres;
  final String? status;
  final int? runtime;
  final int? averageRuntime;
  final String? premiered;
  final String? ended;
  final String? officialSite;
  final Schedule? schedule;
  final Rating? rating;
  final int? weight;
  final Network? network;
  final Network? webChannel;
  final dynamic dvdCountry;
  final Externals? externals;
  final Image? image;
  final String? summary; // Change this to nullable (String?)
  final int? updated;
  final Links? links;

  Show({
    required this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    required this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    this.webChannel,
    this.dvdCountry,
    this.externals,
    this.image,
    this.summary,
    this.updated,
    this.links,
  });

  factory Show.fromMap(Map<String, dynamic> json) => Show(
        id: json["id"] ?? 0,
        url: json["url"],
        name: json["name"],
        type: json["type"],
        language: json["language"],
        genres: List<String>.from(json["genres"] ?? []),
        status: json["status"],
        runtime: json["runtime"],
        averageRuntime: json["averageRuntime"],
        premiered: json["premiered"],
        ended: json["ended"],
        officialSite: json["officialSite"],
        schedule: json["schedule"] != null
            ? Schedule.fromMap(json["schedule"])
            : null,
        rating: json["rating"] != null ? Rating.fromMap(json["rating"]) : null,
        weight: json["weight"],
        network:
            json["network"] != null ? Network.fromMap(json["network"]) : null,
        webChannel: json["webChannel"] != null
            ? Network.fromMap(json["webChannel"])
            : null,
        dvdCountry: json["dvdCountry"],
        externals: json["externals"] != null
            ? Externals.fromMap(json["externals"])
            : null,
        image: json["image"] != null ? Image.fromMap(json["image"]) : null,
        summary: json["summary"], // This will now accept null values
        updated: json["updated"],
        links: json["_links"] != null ? Links.fromMap(json["_links"]) : null,
      );
}

class Externals {
  final dynamic tvrage;
  final int? thetvdb;
  final String imdb;

  Externals({
    required this.tvrage,
    required this.thetvdb,
    required this.imdb,
  });

  factory Externals.fromMap(Map<String, dynamic> json) => Externals(
        tvrage: json["tvrage"],
        thetvdb: json["thetvdb"] ?? 0,
        imdb: json["imdb"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "tvrage": tvrage,
        "thetvdb": thetvdb,
        "imdb": imdb,
      };
}

class Image {
  final String medium;
  final String original;

  Image({
    required this.medium,
    required this.original,
  });

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        medium: json["medium"],
        original: json["original"],
      );

  Map<String, dynamic> toMap() => {
        "medium": medium,
        "original": original,
      };
}

enum Language { ENGLISH, JAPANESE }

final languageValues =
    EnumValues({"English": Language.ENGLISH, "Japanese": Language.JAPANESE});

class Links {
  final Self self;
  final Previousepisode? previousepisode;

  Links({
    required this.self,
    this.previousepisode,
  });

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        self: Self.fromMap(json["self"]),
        previousepisode: json["previousepisode"] == null
            ? null
            : Previousepisode.fromMap(json["previousepisode"]),
      );

  Map<String, dynamic> toMap() => {
        "self": self.toMap(),
        "previousepisode": previousepisode?.toMap(),
      };
}

class Previousepisode {
  final String href;
  final String name;

  Previousepisode({
    required this.href,
    required this.name,
  });

  factory Previousepisode.fromMap(Map<String, dynamic> json) => Previousepisode(
        href: json["href"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "href": href,
        "name": name,
      };
}

class Self {
  final String href;

  Self({
    required this.href,
  });

  factory Self.fromMap(Map<String, dynamic> json) => Self(
        href: json["href"],
      );

  Map<String, dynamic> toMap() => {
        "href": href,
      };
}

class Network {
  final int id;
  final String name;
  final Country? country;
  final String? officialSite;

  Network({
    required this.id,
    required this.name,
    required this.country,
    required this.officialSite,
  });

  factory Network.fromMap(Map<String, dynamic> json) => Network(
        id: json["id"],
        name: json["name"],
        country:
            json["country"] == null ? null : Country.fromMap(json["country"]),
        officialSite: json["officialSite"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "country": country?.toMap(),
        "officialSite": officialSite,
      };
}

class Country {
  final String name;
  final String code;
  final String timezone;

  Country({
    required this.name,
    required this.code,
    required this.timezone,
  });

  factory Country.fromMap(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "code": code,
        "timezone": timezone,
      };
}

class Rating {
  final double? average;

  Rating({
    required this.average,
  });

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        average: json["average"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "average": average,
      };
}

class Schedule {
  final String time;
  final List<String> days;

  Schedule({
    required this.time,
    required this.days,
  });

  factory Schedule.fromMap(Map<String, dynamic> json) => Schedule(
        time: json["time"],
        days: List<String>.from(json["days"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "time": time,
        "days": List<dynamic>.from(days.map((x) => x)),
      };
}

enum Status { ENDED, IN_DEVELOPMENT, RUNNING }

final statusValues = EnumValues({
  "Ended": Status.ENDED,
  "In Development": Status.IN_DEVELOPMENT,
  "Running": Status.RUNNING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
