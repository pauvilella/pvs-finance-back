from django.shortcuts import render
from django.http import JsonResponse

# Create your views here.


def get_all_accounts(request):
    content = {"success": True}
    return JsonResponse(content)
