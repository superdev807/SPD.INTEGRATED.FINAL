from django.conf.urls import url, include

from rest_framework import routers

from users.views_users import UserViewSet

router = routers.DefaultRouter(trailing_slash=False)
router.register(r'users', UserViewSet, base_name='_users')
urlpatterns = router.urls