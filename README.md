# monitoring-logging-GCP-Terraform
This repo contains how to create the logging-metrics, notification channel, alert policy, uptime checks and dashboards in monitoring using the terraform.

## Try it out

1. Initialize your new Terraform configuration by running the terraform init command in the same directory as your main.tf file:

    ```sh
    terraform init
    ```
1. See the execution plan by running the terraform plan command with var-file, var-file is the inputs of the variables:

    ```sh
    terraform plan -var-file=var.tfvars 
    ```
    The output has a + next to resources blocks , meaning that Terraform will create these resources. Beneath that, it shows the attributes that will be set. When the value displayed is (known after 
    apply), it means that the value won't be known until the resource is created.

    If anything in the plan seems incorrect, it is shows the error messages.

1. Apply you configuration now by running the command terraform apply:

    ```sh
    terraform apply plans.tfplan
    ```

1. Clean up after you’re done:

    ```sh
    terraform destroy -var-file=var.tfvars 
    ```

----

