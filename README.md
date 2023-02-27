# Final-Project-ITI
-------------------------------------------------------
## Create EKS Cluster Using Terraform
- Create AWS VPC
- Internet Gateway 
- 2private and 2public subnets
- NAT Gateway
- EKS cluster
- Create public load balancer on EKS
- Create private load balancer on EKS


run terraform
```
terraform init
terraform plan
terraform apply
```
-------------------------------------------------------
## Build jenkins docker image and push it to dockerhub:

```
docker build -t jenkins-pod .
docker tag jenkins-pod divinaboules/jenkins-pod
docker push divinaboules/jenkins-pod
```
<img src="https://user-images.githubusercontent.com/92440274/221447756-34d7ad22-0186-4972-8774-5a4b1e0c04d3.png">

## From machine
Copy key on jump host to connect on private worker node
```
scp -i final-iti.pem final-iti.pem ubuntu@3.84.235.172:/home/ubuntu
```
```
aws eks --region us-east-1 update-kubeconfig --name cluster
sudo apt  install awscli
sh file.sh
```
## on Jump-host
```
ssh -i "final-iti.pem" root@10.0.9.110
ssh -i "final-iti.pem" ec2-user@10.0.9.110
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
sudo systemctl status docker
```
## Install kubectl and aws cli packages on jump host
```

sudo apt  install awscli
sh file.sh
```
## Configure aws on jump host and Connect on aws cluster
```
aws configure
aws eks --region us-east-1 update-kubeconfig --name cluster
kubectl get nodes 
```
## Create namespace for jenkins
```
kubectl create namespace jenkins-ns
kubectl apply -f serviceAccount.yaml
kubectl apply -f service.yaml
kubectl apply -f deployment.yaml
kubectl get all -n jenkins-ns
kubectl logs
```
## Create CI/CD pipeline
<img src="https://user-images.githubusercontent.com/92440274/221448555-d01fda51-fa82-4bfc-b625-ceb2610fe62c.png">
<img src="https://user-images.githubusercontent.com/92440274/221448613-1c95666e-96f4-4eee-a7e9-0c4a619d5964.png">
<img src="https://user-images.githubusercontent.com/92440274/221444056-a73cc1c8-6ff4-4ff4-9205-4c99a08403ca.png">
<img src="https://user-images.githubusercontent.com/92440274/221448819-5b0f0e01-f189-4152-8f06-38925f3b8a88.png">




