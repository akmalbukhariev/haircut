abstract class AbstractModel {
  AbstractModel();
  Map<String, dynamic> toJson();
  factory AbstractModel.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson method must be implemented in concrete subclasses.');
  }
}