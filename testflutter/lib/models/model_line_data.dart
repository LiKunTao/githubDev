class ModelLineData {
  List<Content>? content;
  String? message;
  int? status;

  ModelLineData({this.content, this.message, this.status});

  ModelLineData.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Content {
  String? bp;
  int? createTime;
  IndexPREPoint? indexPREPoint;
  List<LineData>? lineData;
  String? price;
  String? targetCode;
  String? type;
  String? weighted;
  String? targetKey;
  String? realbpforszzj;

  Content(
      {this.bp,
        this.createTime,
        this.indexPREPoint,
        this.lineData,
        this.price,
        this.targetCode,
        this.type,
        this.weighted,
        this.targetKey,
        this.realbpforszzj});

  Content.fromJson(Map<String, dynamic> json) {
    bp = json['bp'];
    createTime = json['createTime'];
    indexPREPoint = json['indexPREPoint'] != null
        ? new IndexPREPoint.fromJson(json['indexPREPoint'])
        : null;
    if (json['lineData'] != null) {
      lineData = <LineData>[];
      json['lineData'].forEach((v) {
        lineData!.add(new LineData.fromJson(v));
      });
    }
    price = json['price'];
    targetCode = json['targetCode'];
    type = json['type'];
    weighted = json['weighted'];
    targetKey = json['targetKey'];
    realbpforszzj = json['realbpforszzj'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bp'] = this.bp;
    data['createTime'] = this.createTime;
    if (this.indexPREPoint != null) {
      data['indexPREPoint'] = this.indexPREPoint!.toJson();
    }
    if (this.lineData != null) {
      data['lineData'] = this.lineData!.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    data['targetCode'] = this.targetCode;
    data['type'] = this.type;
    data['weighted'] = this.weighted;
    data['targetKey'] = this.targetKey;
    data['realbpforszzj'] = this.realbpforszzj;
    return data;
  }
}

class IndexPREPoint {
  String? y;

  IndexPREPoint({this.y});

  IndexPREPoint.fromJson(Map<String, dynamic> json) {
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['y'] = this.y;
    return data;
  }
}

class LineData {
  String? ts;
  String? x;
  String? y;

  LineData({this.ts, this.x, this.y});

  LineData.fromJson(Map<String, dynamic> json) {
    ts = json['ts'];
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ts'] = this.ts;
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}