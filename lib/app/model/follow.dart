import 'package:graduationproject/app/model/user.dart';

class Follow {
  int? Id;
  int? followId;
  int? followedId;
  User? follow;
  User? followed;

  Follow({
    this.Id,
    this.follow,
    this.followId,
    this.followed,
    this.followedId,
  });

  Follow.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    follow = json['follow '];
    followId = json['followId '];
    followed = json['followed'];
    followedId = json['followedId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['follow '] = follow;
    json[' followId'] = followId;
    json['followed'] = followed;
    json[' followedId'] = followedId;
    return json;
  }
}
