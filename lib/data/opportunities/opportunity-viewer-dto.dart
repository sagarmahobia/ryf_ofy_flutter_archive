import 'dart:convert';

OpportunityViewerDTO opportunityViewerDtoFromJson(String str) =>
    OpportunityViewerDTO.fromJson(json.decode(str));

String opportunityViewerDtoToJson(OpportunityViewerDTO data) =>
    json.encode(data.toJson());

class OpportunityViewerDTO {
  int id;
  String title;
  String opportunityType;
  String fundingType;
  String region;
  String opportunityTypeEnum;
  String fundingTypeEnum;
  String regionEnum;
  String image;
  String deadline;
  DateTime deadlineString;
  String timeLeft;
  String description;
  String benefit;
  String eligibility;
  String applicationProcess;
  String other;
  String url;
  String applyUrl;
  bool featured;

  OpportunityViewerDTO({
    this.id,
    this.title,
    this.opportunityType,
    this.fundingType,
    this.region,
    this.opportunityTypeEnum,
    this.fundingTypeEnum,
    this.regionEnum,
    this.image,
    this.deadline,
    this.deadlineString,
    this.timeLeft,
    this.description,
    this.benefit,
    this.eligibility,
    this.applicationProcess,
    this.other,
    this.url,
    this.applyUrl,
    this.featured,
  });

  factory OpportunityViewerDTO.fromJson(Map<String, dynamic> json) =>
      OpportunityViewerDTO(
        id: json["id"],
        title: json["title"],
        opportunityType: json["opportunityType"],
        fundingType: json["fundingType"],
        region: json["region"],
        opportunityTypeEnum: json["opportunityTypeEnum"],
        fundingTypeEnum: json["fundingTypeEnum"],
        regionEnum: json["regionEnum"],
        image: json["image"],
        deadline: json["deadline"],
        deadlineString: DateTime.parse(json["deadlineString"]),
        timeLeft: json["timeLeft"],
        description: json["description"],
        benefit: json["benefit"],
        eligibility: json["eligibility"],
        applicationProcess: json["application_process"],
        other: json["other"],
        url: json["url"],
        applyUrl: json["apply_url"],
        featured: json["featured"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "opportunityType": opportunityType,
        "fundingType": fundingType,
        "region": region,
        "opportunityTypeEnum": opportunityTypeEnum,
        "fundingTypeEnum": fundingTypeEnum,
        "regionEnum": regionEnum,
        "image": image,
        "deadline": deadline,
        "deadlineString":
            "${deadlineString.year.toString().padLeft(4, '0')}-${deadlineString.month.toString().padLeft(2, '0')}-${deadlineString.day.toString().padLeft(2, '0')}",
        "timeLeft": timeLeft,
        "description": description,
        "benefit": benefit,
        "eligibility": eligibility,
        "application_process": applicationProcess,
        "other": other,
        "url": url,
        "apply_url": applyUrl,
        "featured": featured,
      };
}
