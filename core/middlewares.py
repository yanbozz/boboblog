import time
from datetime import datetime
from django.utils.deprecation import MiddlewareMixin


class StatsMiddleware(MiddlewareMixin):
    duration = 0

    def process_request(self, request):
        # Store the start time when the request comes in.
        request.start_time = time.time()

    def process_response(self, request, response):
        # Calculate and output the page generation duration
        # Get the start time from the request and calculate how long
        # the response took.
        self.duration = time.time() - request.start_time
        response["x-page-generation-duration-ms"] = self.duration * 1000
        return response
