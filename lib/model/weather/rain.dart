class Rain {
  double? onHour;

  Rain({this.onHour});

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        onHour: (json['onHour'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'onHour': onHour,
      };
}
