# How to connect to the hosted Airflow instance

This guide documents how to connected to the AWS hosted Airflow instance

## First Time Setup

For first time setup, see the instructions [here](./connect-to-hosted-infrastructure.md).
If you already completed this setup to connect to some other infrastructure in
the INCLUDE AWS account, such as the warehouse, you do not need to complete
the first time setup again.

## Connecting to Airflow

1. run the command `saml2aws login`. When using this tool, you will want to connect create a
profile for the AWS account `373997854230`.
2. Navigate to the `ssm_forward_to_mwaa` directory within the `devops_utils`
repository you cloned on to your machine during first time setup
3. Run the script `./mwaa_connect.sh include-mwaa-prd-airflow prd 443 us-east-1`
This script should should that you can now connect to airflow
4. Open your web browser and navigate to google. Click on the `google apps` menu
to the left of your user profile picture at the right of the page and then
scroll down to and click on `Amazon Web Services`. You will then be presented
with a page to choose which aws account and role you would like to log into.
Choose the same one you chose in step 1 above.
5. In your web browser, navigate to [https://localhost](https://localhost). This
should display an airflow login page. Login and then the page should now show
airflow's main page.
