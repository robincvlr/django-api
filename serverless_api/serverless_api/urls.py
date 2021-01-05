from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.rappers),
    url(r'^(?P<name>[0-9A-Za-z-_]+)$', views.rapper)
]