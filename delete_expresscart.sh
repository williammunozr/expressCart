#!/bin/bash

cd kubernetes/

gcloud container clusters get-credentials gke-expresscart --region us-central1 --project gke-terraform-2508

kubectl delete -f expresscart_service.yaml

kubectl delete -f expresscart_deployment.yaml