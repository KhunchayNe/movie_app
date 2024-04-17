class Movie {
  String? title;
  String? year;
  String? rated;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? writer;
  String? actors;
  String? plot;
  String? language;
  String? country;
  String? awards;
  String? poster;
  String? metascore;
  String? imdbRating;
  String? imdbVotes;
  String? imdbId;
  String? type;
  String? response;
  List<String>? images;

  Movie({
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbId,
    this.type,
    this.response,
    this.images,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title: json['Title'] as String?,
        year: json['Year'] as String?,
        rated: json['Rated'] as String?,
        released: json['Released'] as String?,
        runtime: json['Runtime'] as String?,
        genre: json['Genre'] as String?,
        director: json['Director'] as String?,
        writer: json['Writer'] as String?,
        actors: json['Actors'] as String?,
        plot: json['Plot'] as String?,
        language: json['Language'] as String?,
        country: json['Country'] as String?,
        awards: json['Awards'] as String?,
        poster: json['Poster'] as String?,
        metascore: json['Metascore'] as String?,
        imdbRating: json['imdbRating'] as String?,
        imdbVotes: json['imdbVotes'] as String?,
        imdbId: json['imdbID'] as String?,
        type: json['Type'] as String?,
        response: json['Response'] as String?,
        images: List<String>.from(json['Images'] as List),
      );

  Map<String, dynamic> toJson() => {
        'Title': title,
        'Year': year,
        'Rated': rated,
        'Released': released,
        'Runtime': runtime,
        'Genre': genre,
        'Director': director,
        'Writer': writer,
        'Actors': actors,
        'Plot': plot,
        'Language': language,
        'Country': country,
        'Awards': awards,
        'Poster': poster,
        'Metascore': metascore,
        'imdbRating': imdbRating,
        'imdbVotes': imdbVotes,
        'imdbID': imdbId,
        'Type': type,
        'Response': response,
        'Images': images,
      };
}
