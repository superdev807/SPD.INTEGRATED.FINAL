from django.conf.urls import url, include

from rest_framework import routers

from users.views_subscriptions import SubscriptionViewSet	

router = routers.DefaultRouter(trailing_slash=False)
router.register(r'subscriptions', SubscriptionViewSet, base_name='_subscriptions')
urlpatterns = router.urls