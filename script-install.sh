apt-get update
apt-get upgrade -y
apt-get install git
curl -fsSL https://get.docker.com | sh
apt-get install build-essential
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/ubuntu/.linuxbrew/bin/brew shellenv)"
brew install kind
kind create cluster --name k8s --config=kind.yaml
kind get kubeconfig --name k8s > /root/.kube/config
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
helm repo add kedacore https://kedacore.github.io/charts
helm repo update
kubectl create namespace keda
helm install keda kedacore/keda --namespace keda
