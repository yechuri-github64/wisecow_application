 ## Wisecow Application
A fun little web server that delivers wisdom through fortune and cowsay!
This project covers containerizing, deploying, and securing the Wisecow app using Kubernetes, GitHub Actions (CI/CD), and TLS.

🔧 ## Prerequisites (for local run)
Make sure the following packages are installed:
     sudo apt update
     sudo apt install fortune-mod cowsay -y
How to Run Locally
##1. Clone the Repository:
     git clone https://github.com/<your-username>/wisecow_application.git
     cd wisecow_application


## What to expect?
![wisecow](https://github.com/nyrahul/wisecow/assets/9133227/8d6bfde3-4a5a-480e-8d55-3fef60300d98)

# Problem Statement
Deploy the wisecow application as a k8s app

## Requirement
1. Create Dockerfile for the image and corresponding k8s manifest to deploy in k8s env. The wisecow service should be exposed as k8s service.
2. Github action for creating new image when changes are made to this repo
3. [Challenge goal]: Enable secure TLS communication for the wisecow app.

## Expected Artifacts
1. Github repo containing the app with corresponding dockerfile, k8s manifest, any other artifacts needed.
2. Github repo with corresponding github action.
3. Github repo should be kept private and the access should be enabled for following github IDs: nyrahul, SujithKasireddy


# My work starts here....

project involves containerizing and deploying the Wisecow application to a Kubernetes environment with secure TLS communication. The deployment process is automated using a CI/CD pipeline powered by GitHub Actions. Below is a detailed account of the steps taken, complete with images showing various stages of the process.
# Table of Contents
  1.Dockerization
  2.Kubernetes Deployment
  3.CI/CD Pipeline
  4.TLS Implementation
    Results
    Conclusion
# Dockerization
The Wisecow application is Dockerized using the Dockerfile in this repository, which creates a container image for the application
# building docker image
 ![build_image](https://github.com/user-attachments/assets/e7a6610a-7184-4cd7-9026-23c8c7a62419)

# Pushing Docker Image to Registry
The built image is pushed to a Docker registry, ensuring it’s accessible for deployment.
![pushing](https://github.com/user-attachments/assets/0f2545ec-14d6-4b8c-ab5b-5725954ff715)

# The images are......
![docker images](https://github.com/user-attachments/assets/0ae99675-1dd8-4607-8b21-19a279dd599b)
# Kubernetes Deployment
The Wisecow application is deployed on Kubernetes using the manifest files in this repository.
# Deployment in CI/CD with Minikube
In this project, we use Minikube in our CI/CD pipeline to run a local Kubernetes cluster within GitHub Actions. This approach provides several advantages:
1.Consistency: Running Minikube within GitHub Actions ensures that the deployment environment is consistent across all runs. This eliminates the variability that might occur if different developers use different local setups.

2.Visibility: All deployment results and logs are visible directly in the GitHub Actions interface. This provides clear feedback on the deployment process and helps with debugging any issues that arise.

3.Isolation: By using Minikube in the CI/CD pipeline, we keep the deployment environment separate from our local development environment. This helps to avoid any potential conflicts or issues that might arise from differences between local setups.

# Why We Don’t Include Local Minikube Config
We don’t include the configuration file for our local Minikube setup in this repository for several reasons:

1.Security: Local Minikube configurations can contain sensitive information, such as cluster credentials, that should not be exposed in a public or shared repository.
2.Environment-Specific: The local Minikube configuration is tailored to an individual developer's environment and may not be applicable to others. Using a standardized setup in CI/CD ensures that deployments are not dependent on specific local configurations.
Reproducibility: By defining the Minikube setup in the CI/CD pipeline, we ensure that anyone running the pipeline will have the same setup, leading to more predictable and reproducible results.
# minikube installed
![minikube](https://github.com/user-attachments/assets/00f60508-2969-4209-a6ce-f6c4f611002e)

# apply manifest files 
![manifest files](https://github.com/user-attachments/assets/48362877-e359-4d68-b297-92de93b55bcf)

# creating pods 
![pods](https://github.com/user-attachments/assets/35c5907f-b2c7-43ea-bad5-96b9da37ae8e)

# pods are ready.....
![pods are ready](https://github.com/user-attachments/assets/f4cbe4e2-4c44-4d3b-b599-bdf7cbd024e3)

# Results
# port-forward......
![port forward](https://github.com/user-attachments/assets/dce647ba-2967-4cb2-bde8-562f121e3e24)

# Conclusion
The project demonstrates the complete lifecycle of containerizing, deploying, and securing the Wisecow application on Kubernetes, utilizing a robust CI/CD pipeline and TLS for secure communication.
