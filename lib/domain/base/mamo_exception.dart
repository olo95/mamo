sealed class MamoException implements Exception {
  final String message;

  MamoException({this.message = ''});
}

class MamoGenericException extends MamoException {
  MamoGenericException({required super.message});
}
