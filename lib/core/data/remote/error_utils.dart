class ErrorUtil {
  Map<String, String> errorList = {
    'ERR-001': 'Verifique sua conexão',
  };

  String getError(String code) {
    if (errorList.containsKey(code)) {
      return errorList[code];
    } else { 
      return 'Ops. ocorreu um problema';
    }
  }
}
