class PagedResult<T> {
  PagedResult({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.data,
  });

  int page;
  int totalPages;
  int totalResults;
  List<T> data;

  factory PagedResult.fromJson(Map<String, dynamic> data,
      T Function(Map<String, dynamic>) fromJsonDataItem) {
    List<T> dataList = data.containsKey('results')
        ? (data['results'] as List<dynamic>)
            .map((p) => fromJsonDataItem(p))
            .toList()
        : [];

    return PagedResult(
      page: data["page"] as int,
      totalPages: data["total_pages"] as int,
      totalResults: data["total_results"] as int,
      data: dataList,
    );
  }
}
