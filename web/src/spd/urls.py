from django.conf.urls import url, include

from rest_framework import routers

from spd.views import SpdViewSet

router = routers.DefaultRouter(trailing_slash=False)
router.register(r'spd', SpdViewSet, base_name='_spd')
urlpatterns = router.urls