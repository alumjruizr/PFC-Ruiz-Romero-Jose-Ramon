from django.contrib import admin
from django.urls import path, include
from rest_framework_jwt.views import obtain_jwt_token

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('roleapp.urls')),
    path('api/login/', obtain_jwt_token),
    path('accounts/', include('django.contrib.auth.urls'))
]
