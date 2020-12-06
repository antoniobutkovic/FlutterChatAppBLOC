class ApiResponse<T> {
  Status status;

  T data;

  bool isLoading;

  String message;

  ApiResponse.loading(this.isLoading) : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }
