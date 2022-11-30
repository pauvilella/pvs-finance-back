from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.


def get_all_accounts(request):
    return HttpResponse("This Works")
