from django.http import HttpResponse

def page_9820_view(request):


    html = "<h1> This is the first page </h1>"
    return HttpResponse(html)