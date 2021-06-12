class ApiResponse<T> {
  APIStatus status;
  T data;
  String message;

  ApiResponse.loading(this.message) : status = APIStatus.LOADING;
  ApiResponse.complete(this.data) : status = APIStatus.COMPLETED;
  ApiResponse.error(this.message) : status = APIStatus.ERROR;
}

enum APIStatus { LOADING, COMPLETED, ERROR }