import 'package:chatapp/constants.dart';

class model {
  final String? message;
final String? id;
  model(this.message, this.id);

  factory model.fromjson( jsondata) {
    return model(jsondata[kMessage],jsondata['id']);
  }
}
