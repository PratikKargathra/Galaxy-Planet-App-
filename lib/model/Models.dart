class Planet {
  String description;
  String planetName;
  String galaxyName;
  String distanceFromSun;
  String distanceFromEarth;
  String gravity;
  String image;

  Planet(
      {
       required this.description,
       required this.image,
       required this.planetName,
       required this.galaxyName,
       required this.distanceFromSun,
       required this.distanceFromEarth,
       required this.gravity
      });
}
