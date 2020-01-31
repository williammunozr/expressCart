#!/bin/bash

cd kubernetes/

# GKE Authentication
gcloud container clusters get-credentials gke-expresscart --region us-central1 --project kubernetes-2020

kubectl delete -f expresscart_service.yaml

kubectl delete -f expresscart_deployment.yaml