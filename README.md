# Getting Started with Java - Google Compute Engine

Originally derived from [this repo](https://github.com/GoogleCloudPlatform/getting-started-java)
and set up using [this tutorial](https://cloud.google.com/java/docs/tutorials/getting-started-on-compute-engine)

### Running Locally

    mvn clean jetty:run-exploded -DprojectID=jalexander-website

### Listing Compute Instances

    gcloud compute instances list

### Deploying to Compute Engine

* Initialize the [Google Cloud SDK][cloud_sdk]

        gcloud init

* In the `makeProject` script update the `BUCKET` environment variable
  with your bucket name.

* Deploy your App

        ./makeProject gce

* To tear down the App, use

        ./makeProject down

