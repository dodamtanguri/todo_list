/// 리스트 Extension
/// 작성자 : jtmoon
/// 특이사항 : N/A
/// @copyright 한국선불카드(주)

extension ListExtension on List {
  ///값이 존재하며 code를 가진 enum type여부 검사
  bool isNotEmptyEnumType() {
    bool isEnum = false;
    try {
      isEnum = (first.code != null);
      // ignore: empty_catches
    } catch (e) {}
    return isEnum;
  }

  ///Csv 스트링으로 변환
  String toCsv() => isEmpty
      ? "" //비어 있으면 빈스트링 리턴
      : isNotEmptyEnumType()
          ? map((e) => e.code).toList().join(",") //열거형이면 코드 결합
          : switch (runtimeType) {
              List<String>() => join(","),
              _ => map((e) => e.toString()).toList().join(","),
            };

  ///----------------------------------------
  ///Immutable 객체 수정/삭제 핸들링
  ///----------------------------------------

  ///인덱스에 의한 대체
  List<T> copyReplaceAt<T>(int index, T replacement, {bool growable = true}) =>
      (toList(growable: growable)..[index] = replacement) as List<T>;

  ///값에 의한 첫번재 엘리먼트 대체
  List<T> copyReplaceWith<T>(value, T replacement, {bool growable = true}) =>
      copyReplaceAt<T>(indexOf(value), replacement, growable: growable);

  ///값에 의한 모든 엘리먼트 대체
  List<T> copyReplaceAll<T>(T value, T replacement, {bool growable = true}) =>
      map<T>((element) => (element == value) ? replacement : element)
          .toList(growable: growable);

  ///인덱스에 의한 삭제
  List<T> copyRemoveAt<T>(int index, {bool growable = true}) =>
      (toList(growable: growable)..removeAt(index)) as List<T>;

  ///값에 의한 첫번째 엘리먼트 삭제
  List<T> copyRemoveWith<T>(T value, {bool growable = true}) =>
      copyRemoveAt<T>(indexOf(value), growable: growable);

  ///값에 의한 모든 엘리먼트 삭제
  List<T> copyRemoveAll<T>(T value, {bool growable = true}) =>
      where((element) => element != value).toList(growable: growable)
          as List<T>;
}
