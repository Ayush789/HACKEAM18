# SFPHAD 🏥👩‍⚕️ (System For Prevention of Hospital-Acquired Diseases)

<img src=gifs/signup.gif width=19%> <img src=gifs/onboarding.gif width=19%> <img src=gifs/drawer.gif width=19%> <img src=gifs/schedule.gif width=19%> <img src=gifs/file_upload.gif width=19%>

> Redesigned by @piculet [github](http://www.github.com/piculet)

### A Cross-platform mobile application for patient scheduling and report management to reduce time hospital-acquired diseases and cut down on patient waiting period.

## Inspiration 

We visited Guru Teg Bahadur Hospital as part of HACKEAM 2018 initiative to learn and understand the problems faced by the public healthcare system in India. We observed extremely long lines, hours of wait time and lack of coordination between the pharmaceutical industry and public demand, leading to increased risk of Hospital Acquired Diseases.

## What it does 

### Patient Scheduling
We take care of automatic slot allotment and efficient scheduling to try and stagger the incoming of patients to reduce waiting times. We also make sure to remind the patients through SMS and automated phone calls of their appointments.

### Patient Medical History Record
We provide a centralised location for the medical history of all patients allowing easy and secure access to all medical professionals.

### Medicine Stock Prediction
We keep track of prescribed medicines and based on trends, try to predict the requirement for more efficient distribution of pharmaceuticals even in remote areas.

## How we built it
We have built a cross-platform mobile application built using Flutter that will work on Android/IOS phones, desktops and as a website.

We have built a Django Server for the backend management.

## Steps to reproduce

### Mobile App
**Step 1**: Install Flutter using latest official guide [`https://flutter.dev/docs/get-started/install`](https://flutter.dev/docs/get-started/install)

**Step 2**: Run application using  `flutter run` in `Android/sfphad2` folder

### Server
**Step 1**: Install Django 2.0 using `pip install Django==2.0`

**Step 2**: Run server using `python manage.py runserver` in `Server/sfphad` folder
