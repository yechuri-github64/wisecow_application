# Cow wisdom web server

## Prerequisites

```
sudo apt install fortune-mod cowsay -y
```

## How to use?

1. Run `./wisecow.sh`
2. Point the browser to server port (default 4499)

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

# building docker image
 ![build_image](https://github.com/user-attachments/assets/e7a6610a-7184-4cd7-9026-23c8c7a62419)

# pushing image into Docker hub
![pushing](https://github.com/user-attachments/assets/0f2545ec-14d6-4b8c-ab5b-5725954ff715)

# The images are......
![docker images](https://github.com/user-attachments/assets/0ae99675-1dd8-4607-8b21-19a279dd599b)

# minikube installed
![minikube](https://github.com/user-attachments/assets/00f60508-2969-4209-a6ce-f6c4f611002e)

# apply manifest files 
![manifest files](https://github.com/user-attachments/assets/48362877-e359-4d68-b297-92de93b55bcf)

# creating pods 
![pods](https://github.com/user-attachments/assets/35c5907f-b2c7-43ea-bad5-96b9da37ae8e)

# pods are ready.....
![pods are ready](https://github.com/user-attachments/assets/f4cbe4e2-4c44-4d3b-b599-bdf7cbd024e3)

# port-forward......
![port forward](https://github.com/user-attachments/assets/dce647ba-2967-4cb2-bde8-562f121e3e24)

