# slackbot - Slack to PagerDuty integration Bot for Customer support

## Intro

`slackbot` is an automated Bot for Slack that connects to PagerDuty to provide 
some basic self-service and oncall Support features to Customers.

## Pre-Req

In order for the bot to work, you'll have to create and install a custom Slack app.
Unfortunately atm there's a withstanding issues with RTM perms thus a v1 token needs to be created instead.

Please create a "legacy token" [here](https://api.slack.com/apps?new_classic_app=1) and add a "Legacy Bot user" afterward.

## Settings

In order to do so a few basic requirements need to be setup and configured via environment variables:

| Variable Name | Description | Example |
|---------------|-------------|---------|
| CUSTOMER_NAME | Arbitrary name used in messages and needed to identify the customer requesting support | "Awesome Customer Brand" |
| SLACK_PAGERDUTY_DIRECTORY | String that specifies a Directory of email addresses (used in PagerDuty) and their corresponding Slack user (via their Slack username) in a JSON format | { "oncalluser1@example.email" : "slack_username1", "oncalluser2@example.email" : "slack_username2" } |
| SLACK_TOKEN | Slack Legacy App Token provided when creating the Bot app | xoxb-11111111111-2222222222222-333333333333333333333333 |
| SLACK_BOT_USERNAME | Slack username assigned to the bot, mostly used in the `help` message output | "customersupportbot" |
| SLACK_BOT_DEBUG | Enable Debug messages from the bot | true |
| PAGERDUTY_LINK | Base PagerDuty link used to hook up to the API | "https://mycompany.pagerduty.com" |
| PAGERDUTY_API_KEY | PagerDuty API Key provided when creating a new API Token | 0123456789abcdef0123456789abcdef |
| PAGERDUTY_FROM_EMAIL | Email Address used as the "From:" in Incidents creation on PagerDuty API requests | "customersupport@example.email" |
| PAGERDUTY_SERVICE_API_KEY | API Key used to access PagerDuty schedule | 0123456789abcdef0123456789abcdef |
| PAGERDUTY_SUPPORT_SCHEDULE | ID for the chosen PagerDuty Schedule | P000001 |
| PAGERDUTY_SUPPORT_SERVICE | ID for the chosen PagerDuty Service | P000001 |

## Running slackbot Locally

You can test your `slackbot` by running the following, however all [environment variables](#Settings)
must be set correctly for it to work.

You can build and run the bot locally by running:

    $ go build
    $ ./slackbot

Setting all environment variables in your current shell is tedious so we advise 
to use a script with all the variables set locally.

## Running slackbot in Docker (and with Docker Compose) 

We suggest using Docker Compose for your local testing and development.<br>
Using `slackbot` with Docker Compose is as easy as setting all your variables in
a `.env` file and then running:

     docker-compose build 
     docker-compose up

You can choose a different name for the `docker-compose.yml` and `.env` files 
and specify them through the appropriate settings.

## Running slackbot in Kubernetes

### Through a Deployment

Once you're confident your Bot works, you can run in your Kubernetes production environment.<br>
See the bundled Deployment (slackbot_deploy.yaml) as an example.

    kubectl apply -f slackbot_deploy.yml


## TODO

* write a simple `helm` chart for alternative Kubernetes deployment
