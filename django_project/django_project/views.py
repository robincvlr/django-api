from .models import RAPPERS
from rest_framework import status
from django.http import JsonResponse
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.authentication import SessionAuthentication, TokenAuthentication
from rest_framework.permissions import IsAuthenticated


@api_view(['GET'])
@authentication_classes([SessionAuthentication, TokenAuthentication])
@permission_classes([IsAuthenticated])
def rappers(request):
    """
    :param request: HTTP request
    :return:        Rappers as JSON
    """
    if request.method == 'GET':
        return JsonResponse(RAPPERS)


@api_view(['GET'])
@authentication_classes([SessionAuthentication, TokenAuthentication])
@permission_classes([IsAuthenticated])
def rapper(request, name):
    """
    :param request: HTTP request
    :param name:    Rapper name as key
    :return:        Rapper as JSON
    """
    if request.method == 'GET':
        try:
            json_response = JsonResponse(RAPPERS.get(name))
            json_response.status_code = status.HTTP_302_FOUND
        except TypeError:
            not_found_content = {"status": "rapper not found", "key": f"{name}"}
            json_response = JsonResponse(not_found_content)
            json_response.status_code = status.HTTP_404_NOT_FOUND
        return json_response
