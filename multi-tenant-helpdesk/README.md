# Multi-tenant Helpdesk

This project contains a multi-tenant helpdesk application and its infrastructure.

## Structure

The project is structured as follows:

- `services`: Contains the source code for the microservices.
- `infra`: Contains the infrastructure as code, including Helm charts.

## Helm Charts

The Helm charts are located in the `infra/helm-charts` directory. There is a separate chart for each microservice, and an umbrella chart to manage all the sub-charts.

To install the charts, run the following commands:

```
$ helm dependency update multi-tenant-helpdesk/infra/helm-charts/multi-tenant-helpdesk
$ helm install my-release multi-tenant-helpdesk/infra/helm-charts/multi-tenant-helpdesk
```

This will deploy all the microservices and create an Ingress to expose the frontend and the backend services.