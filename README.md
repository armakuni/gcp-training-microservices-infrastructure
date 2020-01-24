# GCP Infrastructure and Microservice Deployment Repository

## Before running the GCP infra pipeline ensure that following are there:
1. Your account should have higher level privileges(may be the owner) to execute this script as it involves enabling the APIs and provisioning GCP resources.
2. If you would like to deploy Microservices and run the Smoke Test through this script. 
   Ensure that below repositories are forked in your account and than cloned in the same directory where this repo is cloned. 
   * [gcp-training-customer-service](https://github.com/armakuni/gcp-training-customer-service)
   * [gcp-training-account-service](https://github.com/armakuni/gcp-training-account-service)
   * [gcp-training-cashier-service](https://github.com/armakuni/gcp-training-cashier-service)
   * [gcp-training-transaction-service](https://github.com/armakuni/gcp-training-transaction-service)
   * [gcp-training-balance-service](https://github.com/armakuni/gcp-training-balance-service)
   * [gcp-training-microservices-smoke-test](https://github.com/armakuni/gcp-training-microservices-smoke-test)

   Your project structure should look something like this where all projects are cloned at the same level.
![](images/project_structure.png)
   If not you may clone them according to your convenience.
3. The Cloud Build Service Account has the access or role allocated to provision the resources (Service Account, PubSub, Firestore etc)
4. On a brand new project, the setup script may fail because there is no app engine set up in the project and may get an error with Firestore such as:
```
ERROR: gcloud crashed (AppEngineAppDoesNotExist): You must first create a Google App Engine app in the corresponding region by running: 
```

To avoid the error execute below command and create an app engine app.
```bash
gcloud app create --region=europe-west
```
   
## Execution:

Before execution ensure that you are in the root of the infra repository.

The [setup_gcp_infra](setup_gcp_infra.sh) script performs below tasks:
1. Enabling Google APIs
2. Grant role to the Cloud Build Service Account with higher privileges
3. Create Firestore Instance
4. Create a PubSub topic
5. Deploy Microservices if first parameter ```deploy_microservices``` in [config.cfg.defaults](config.cfg.defaults) is set to ```true```, default is ```true```
6. If opted to deploy Microservices then will trigger the Smoke Tests in Cloud Build Pipeline against the newly deployed Microservices.
   
Execute below command to run the script:

```bash
. setup_gcp_infra.sh > infra_execution_$(date +%s).log
```

Here ```infra_execution_[TIMESTAMP].log``` file will store the execution logs for debugging purpose.

### If "deploy_microservices" was set to "true"
The setup script will generate ```microservice_url_env.sh``` file which will have all the respective endpoints and exported as environment variables.
This ```microservice_url_env.sh``` will be handy when you would like to run the Smoke Test manually in later stages.

### If "deploy_microservices" was set to "false"
As you have opted for deploying the Microservices by yourselves we would recommend you to follow below sequence while deploying the same.

Even though the deployment is independent of each other but to work as expected the Microservices internally makes call to each other.

This is covered and explained in detail in each Microservice documentations.

* [gcp-training-customer-service](https://github.com/armakuni/gcp-training-customer-service)
* [gcp-training-account-service](https://github.com/armakuni/gcp-training-account-service)
* [gcp-training-cashier-service](https://github.com/armakuni/gcp-training-cashier-service)
* [gcp-training-transaction-service](https://github.com/armakuni/gcp-training-transaction-service)
* [gcp-training-balance-service](https://github.com/armakuni/gcp-training-balance-service)

## Assumptions: 

1. All the previous labs are completed. Hence Cloud Build API is enabled and associated Service Account already exists.
