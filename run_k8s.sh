microk8s.kubectl apply -f /home/arthur/PycharmProjects/gloop-app/deployment.yaml
microk8s.kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443 &

token=$(microk8s.kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
microk8s.kubectl -n kube-system describe secret $token

