## My Personal website

Hosted at http://jalexander.ninja

Originally derived from [this repo](https://github.com/GoogleCloudPlatform/getting-started-java)
and set up using [this tutorial](https://cloud.google.com/java/docs/tutorials/getting-started-on-compute-engine)

### Deploying to Compute Engine

* Initialize the [Google Cloud SDK][cloud_sdk]

        gcloud init

* Deploy your App

    ./makeProject gce

* To tear down the App, use

    ./makeProject down

### Running Locally

    mvn clean jetty:run-exploded -DprojectID=jalexander-website

### Listing Compute Instances

    gcloud compute instances list

### Auto-Formatting

    mvn process-sources

### Auto-Formatting Daemon

    mvn fizzed-watcher:run