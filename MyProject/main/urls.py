from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('', views.index, name='home'),
    path('test', views.test, name='test'),

    path('api/categories/', views.CategorySerializerView.as_view()),
    path('api/items/<int:group>/<int:category>/<int:order>/', views.ItemSerializerView.as_view()),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)




