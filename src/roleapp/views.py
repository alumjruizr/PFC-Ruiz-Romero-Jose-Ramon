from django.shortcuts import render

def race_list(request):
    return render(request, 'roleapp/race_list.html', {})