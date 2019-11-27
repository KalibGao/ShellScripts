
sudo set -e

DASHBOARD_VERSION=v1.10.1
GOOGLE_CONTAINER=k8s.gcr.io
GOOGLE_MIRROR=mirrorgooglecontainers

sudo docker pull $GOOGLE_MIRROR/$DASHBOARD_VERSION
sudo docker tag $GOOGLE_MIRROR/$DASHBOARD_VERSION $GOOGLE_CONTAINER/$DASHBOARD_VERSION
sudo docker rmi $GOOGLE_MIRROR/$DASHBOARD_VERSION

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml