from django.http import StreamingHttpResponse
import time

def test_view(request):
    def iterable_content():
        for _ in range(5):
            time.sleep(1)
            print('Returning chunk')
            yield b'a' * 10000
    return StreamingHttpResponse(iterable_content(), content_type="text/plain")
