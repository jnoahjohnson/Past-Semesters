from django.shortcuts import render

# Create your views here.
def inventoryView(request):
    return render(request, 'inventory/instruments.html')

def instrumentView(request, instrument_name, instrument_price):
    context = {
        'instrument_name': instrument_name,
        'price': instrument_price
    }
    return render(request, 'inventory/trumpet.html', context)