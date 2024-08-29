enum ConnectionAction {
  accept("accept"),
  reject("reject");

  final String value;
  const ConnectionAction(this.value);
}