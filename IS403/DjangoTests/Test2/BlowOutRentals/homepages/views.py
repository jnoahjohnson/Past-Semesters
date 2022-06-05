from django.shortcuts import render

# Create your views here.
def indexView(request):
    return render(request, 'homepages/index.html')

def aboutView(request):
    return render(request, 'homepages/about.html')