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

from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, re_path

from contacts.views import add_new_person_view, modify_person_view, modify_address_view, delete_address_view, \
    add_address_view, add_phone_view, modify_phone_view, delete_phone_view, add_email_view, modify_email_view, \
    delete_email_view, delete_person_view, show_all_users_view, show_user_details_view, add_group_view, \
    add_to_group_view, show_all_groups_view, group_search_view, delete_group_view, delete_person_from_group_view, \
    modify_group_view

urlpatterns = [

    path('admin/', admin.site.urls),
    path('new', add_new_person_view),
    path('', show_all_users_view),
    path('group_search', group_search_view),

    re_path(r'^modify/(?P<id>[0-9]+)$', modify_person_view),
    re_path(r'^delete_person/(?P<id>[0-9]+)$', delete_person_view),
    re_path(r'^show_person_details/(?P<id>[0-9]+)$', show_user_details_view),

    re_path(r'^modify_address/(?P<id>[0-9]+)$', modify_address_view),
    re_path(r'^delete/(?P<id>[0-9]+)$', delete_address_view),
    re_path(r'^add_address/(?P<id>[0-9]+)$', add_address_view),

    re_path(r'^add_phone/(?P<id>[0-9]+)$', add_phone_view),
    re_path(r'^modify_phone/(?P<id>[0-9]+)$', modify_phone_view),
    re_path(r'^delete_phone/(?P<id>[0-9]+)$', delete_phone_view),

    re_path(r'^add_email/(?P<id>[0-9]+)$', add_email_view),
    re_path(r'^modify_email/(?P<id>[0-9]+)$', modify_email_view),
    re_path(r'^delete_email/(?P<id>[0-9]+)$', delete_email_view),

    path('add_group', add_group_view),
    re_path(r'^add_to_group/(?P<id>[0-9]+)$', add_to_group_view),
    path('show_all_groups', show_all_groups_view),
    re_path(r'^delete_group/(?P<id>[0-9]+)$', delete_group_view),
    re_path(r'^delete_user_from_group/(?P<id>[0-9]+)/(?P<person_id>[0-9]+)$', delete_person_from_group_view),
    re_path(r'^modify_group/(?P<id>[0-9]+)$', modify_group_view),

]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)