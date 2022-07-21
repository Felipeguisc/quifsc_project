class Options {
  final List options;

  Options(this.options);

  Options.fromJson(List<dynamic> options) : options = options;

  Map<String, dynamic> toJson() => {
        'options': options,
      };
}
