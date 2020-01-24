# GCP Infrastructure and Microservice Deployment Repository

## Before running the GCP infra pipeline ensure that following are there:
1. Your account should have higher level privileges(may be owner) to execute this script as it involve enabling the APIs and provisioning GCP resources.
2. If you would like to deploye Microservices through this script, ensure all the Microservice and Smoke Test Repositories are cloned in the same directory where this repo is cloned as below:
![](images/project_structure.png)
3. The Cloud Build Service Account has the access or role allocated to provision the resources (Service Account, pubsub, firestore etc)
4. On a brand new project the setup script may fail because there is no app engine set up in the project and may get an error with firestore such as:
```
ERROR: gcloud crashed (AppEngineAppDoesNotExist): You must first create an Google App Engine app in the corresponding region by running: 
```

To avoid the error execute below command and create a app engine app.
```bash
gcloud app create --region=europe-west
```
   
## Execution:

Before execution ensure that you are in root of the infra repository.

The [setup_gcp_infra](setup_gcp_infra.sh) script performs below tasks:
1. Enabling the Google APIs
2. Grant role to the Cloud Build Service Account with higher privileges
3. Create Firestore Instance
4. Create PubSub topic
5. Deploy Microservices if first parameter ```deploy_microservices``` in [config.cfg.defaults](config.cfg.defaults) is set to ```true```, default is ```false```
6. If opted to deploy microservices then will trigger the Smoke Tests in Cloud Build Pipeline against the newly deployed microservices.
   
Execute below command to run the script:

```bash
. setup_gcp_infra.sh > infra_execution_$(date +%s).log
```

Here ```infra_execution_[TIMESTAMP].log``` file will store the execution logs for debugging purpose.

### If "deploy_microservices" was set to "true"
The setup script will generate ```microservice_url_env.sh``` file which will have all the respective endpoints and exported as environment variables.
This ```microservice_url_env.sh``` will be handy when you want to run the Smoke Test.

## Assumptions: 

1. All the previous labs are completed. Hence Cloud Build API is enabled and Service account already exist.

