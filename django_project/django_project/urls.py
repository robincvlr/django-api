from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.availability),
    url(r'^rappers$', views.rappers),
    url(r'rapper/(?P<name>[0-9A-Za-z-_]+)$', views.rapper)
]