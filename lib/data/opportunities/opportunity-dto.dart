class OpportunityDTO {
  String title;
  String image;
  int id;
  String type;

  OpportunityDTO(this.title, this.image, this.type, this.id);

  factory OpportunityDTO.fromJson(Map<String, dynamic> json) {
    return OpportunityDTO(
        json['title'], json['image'], json['opportunityType'], json["id"]);
  }
}

class OpportunitiesDTO {
  String title;
  String key;
  List<OpportunityDTO> opportunitiesDTO;

  OpportunitiesDTO(this.key, this.title, this.opportunitiesDTO);

  factory OpportunitiesDTO.fromJson(
      Map<String, dynamic> json, String key, String title) {
    Iterable opps = json[key];
    List<OpportunityDTO> opp = [];

    for (var value in opps) {
      var opportunity = OpportunityDTO.fromJson(value);
      opp.add(opportunity);
    }

    return new OpportunitiesDTO(key, title, opp);
  }
}

class HomeOpportunitiesDTO {
  List<OpportunitiesDTO> opportunitiesList;

  HomeOpportunitiesDTO(this.opportunitiesList);

  factory HomeOpportunitiesDTO.fromJson(Map<String, dynamic> json) {
    List<OpportunitiesDTO> list = [
      new OpportunitiesDTO("featured", "Featured", null),
      new OpportunitiesDTO("competitions", "Competitions", null),
      new OpportunitiesDTO("conferences", "Conferences", null),
      new OpportunitiesDTO("exchangePrograms", "Exchange Programs", null),
      new OpportunitiesDTO("internship", "Internships", null),
      new OpportunitiesDTO("scholarships", "Scholarships", null),
      new OpportunitiesDTO("workshops", "Workshops", null),
      new OpportunitiesDTO("grants", "Grants", null),
      new OpportunitiesDTO("miscellaneous", "MISCELLANEOUS", null),
    ];
    List<OpportunitiesDTO> newList = [];
    for (OpportunitiesDTO value in list) {
      newList.add(OpportunitiesDTO.fromJson(json, value.key, value.title));
    }
    return HomeOpportunitiesDTO(newList);
  }
}
