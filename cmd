gcloud app deploy --image-url=us-docker.pkg.dev/practical-414209/test/calc-app

docker tag ankitraut0987/calc-app:1.0.0 us-central1-docker.pkg.dev/master-project-413009/test/calc-app

docker push us-central1-docker.pkg.dev/master-project-413009/test/calc-app

gcloud auth configure-docker us-central1-docker.pkg.dev