class ResultNerEntity {
  final List<ResultEntity> listData;

  ResultNerEntity(this.listData);
}

class ResultEntity {
  final String token;
  final String label;

  ResultEntity(this.token, this.label);
}
