# expressCart

![expressCart](https://raw.githubusercontent.com/mrvautin/expressCart/master/public/images/logo.png)

`expressCart` is a fully functional shopping cart built in Node.js (Express, MongoDB) with Stripe, PayPal, Authorize.net, Adyen and Instore payments. This repository was forked from [here](https://github.com/mrvautin/expressCart).

Our aim here is to deploy this application to Google Kubernetes Engine and MongoDB Sharded Cluster deployed on Kubernetes. We assume that you have followed the instructions described on [GKE repository](https://github.com/williammunozr/terraform-google-gke-mongodb) and have all the infrastructure working before to try the steps described here.

## Requirements

- Follow the instructions described on [GKE repository](https://github.com/williammunozr/terraform-google-gke-mongodb) and all the infrastructure working correctly
- Create a copy of the current repository into your GitHub account
- Docker Hub account
- Google Cloud Platform
- Circle CI

## Assumptions

We assume that you have some basic knowledge working with the following tools:

- Docker
- Circle CI
- GitHub
- Google Cloud Platform

## Docker Hub

During the process we are going to create a Docker image and upload it to Docker Hub, that's why you need to have an account.

The creation of a Docker Hub account is outside of this document, you can create one [here](https://hub.docker.com/signup).

Take note of your Docker Hub username and change the following files:

- kubernetes/expresscart_deployment.yaml
- .circleci/config.yml

Change the entry **hachikoapp** with your Docker Hub username.

## Google Cloud Platform project id configuration

In the GKE repository you created a GCP Project, so change the project id in the following files:

- deploy_expresscart.sh
- delete_expresscart.sh

Change the entry **kubernetes-2020** in both files with your **GCP Project ID**.

And you also create a JSON Key file, change the name of that file in the following file:

- .circleci/config.yml

Change the entries **kubernetes-2020-3e7c463a81eb.json** (3) with the name of your JSON key file.

## CircleCI Configuration

If you are following this instructions is because you already follow the GKE repository ones, so I assume that you have some basic knowledge with CircleCI, just link your expressCart GitHub repository with your CircleCI account.

Tasks to configure the expressCart repository with your CircleCI:

- Click on **Go to app** link
- Click the add Project button
- Search for the GitHub project name on the list and press the **Set Up Project**
- Then press the **Start Building** button and **Start Building** again
- Press the **Settings** button
- Press the **Environment Variables** link
- Click on **Add Variable** button
- In the **Name** field enter **GCP_CREDENTIALS** and for the **Value** field enter the content of the **Service Account** JSON key created in the GKE repository
- And press the **Add Variable** button
- Repeat the process for the variables **DOCKERHUB_USERNAME** and **DOCKERHUB_PASS**

We are good to go, if everything went OK you just need to update the project on GitHub repository commit the changes on the master branch and CircleCI triggers a task to build the Docker image, deploy it to Docker Hub and deploy the application to GKE.