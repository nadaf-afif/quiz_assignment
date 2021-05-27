class OptionsData {
  List<Options> _options;

  OptionsData({List<Options> options}) {
    this._options = options;
  }

  List<Options> get options => _options;
  set options(List<Options> options) => _options = options;

  OptionsData.fromJson(Map<String, dynamic> json) {
    if (json['options'] != null) {
      _options = new List<Options>();
      json['options'].forEach((v) {
        _options.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._options != null) {
      data['options'] = this._options.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  String _optionName;
  String _option;
  bool _isCorrect;

  Options({String optionName, String option, bool isCorrect}) {
    this._optionName = optionName;
    this._option = option;
    this._isCorrect = isCorrect;
  }

  String get optionName => _optionName;
  set optionName(String optionName) => _optionName = optionName;
  String get option => _option;
  set option(String option) => _option = option;
  bool get isCorrect => _isCorrect;
  set isCorrect(bool isCorrect) => _isCorrect = isCorrect;

  Options.fromJson(Map<String, dynamic> json) {
    _optionName = json['option_name'];
    _option = json['option'];
    _isCorrect = json['is_correct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['option_name'] = this._optionName;
    data['option'] = this._option;
    data['is_correct'] = this._isCorrect;
    return data;
  }
}
