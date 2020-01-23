from django.conf.urls import url, include

from rest_framework import routers

from users.views_memberships import MembershipViewSet

router = routers.DefaultRouter(trailing_slash=False)
router.register(r'memberships', MembershipViewSet, base_name='_memberships')
urlpatterns = router.urls