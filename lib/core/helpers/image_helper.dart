class ImageHelper {
  static String getTMDBImagePath(String splittedPath, String size) {
    return 'https://image.tmdb.org/t/p/$size$splittedPath';
  }
}
