import 'metrics_model.dart';

class Data {
  String? id;
  String? slug;
  String? symbol;
  Metrics? metrics;

  Data({this.id, this.slug, this.symbol, this.metrics});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    symbol = json['symbol'];
    metrics = Metrics.fromJson(json['metrics']);
  }
}
