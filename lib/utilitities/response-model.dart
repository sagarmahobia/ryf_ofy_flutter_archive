class Response<T> {
  T _data;

  Error _error;

  Status _status;

  Response._success(this._status, this._data);

  Response._errorC(this._status, this._error);

  Response._loading(this._status);

  static Response<P> success<P>(P data) {
    return new Response._success(Status.SUCCESS, data);
  }

  static Response exception(Error error) {
    return new Response._errorC(Status.ERROR, error);
  }

  static Response loading() {
    return new Response._loading(Status.LOADING);
  }

  Status get status => _status;

  Error get error => _error;

  T get data => _data;
}

enum Status { SUCCESS, LOADING, ERROR }
