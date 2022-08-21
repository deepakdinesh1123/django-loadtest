from django.contrib.contenttypes.models import ContentType
from django.http import StreamingHttpResponse

def test_view(request):
    def generate():
        yield "hello\n"
        list(ContentType.objects.all())
        yield "bye\n"
    return StreamingHttpResponse(generate(), content_type="text/plain")
