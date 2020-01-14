#!/bin/bash

cd kubernetes/

gcloud container clusters get-credentials gke-expresscart --region us-central1 --project gke-terraform-2508

kubectl apply -f expresscart_deployment.yaml

kubectl apply -f expresscart_service.yaml