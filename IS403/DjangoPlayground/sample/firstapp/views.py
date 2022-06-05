from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.


def indexPageView(request, visitor_name):
    context = {
        'visitor': visitor_name,
        'movies': [
            'Star Wars',
            'The Martian',
            'Mandalorian'
        ]
    }

    return render(request, 'firstapp/index.html', context)
