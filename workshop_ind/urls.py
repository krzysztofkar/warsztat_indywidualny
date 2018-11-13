"""workshop_ind URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path

urlpatterns = [
    path('admin/', admin.site.urls),
    re_path('/new', add_new_person_view),
    re_path(r'^modify/(?P<id>[0-9]+)$', modify_person_view),
    re_path(r'^delete_person/(?P<id>[0-9]+)$', delete_person_view),
    re_path(r'^show/(?P<id>[0-9]+)$', show_person_view),
    re_path(r'/', show_all_persons_view),
    re_path(r'^person/(?P<id>[0-9]+)/$', person_view, name="person"),
]
