class HttpClientSwitch {
  final void Function() resumeRequests;
  final void Function() pauseRequests;

  HttpClientSwitch(this.resumeRequests, this.pauseRequests);
}
