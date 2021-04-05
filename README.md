# Minimum example of terraform - API Gateway v2 (HTTP API) + Lambda

## Architecture
![Architecture](./doc/architecture.drawio.svg)

## Code structure
```
.
├── envs
│   └── dev
│       ├── aws.tf
│       └── main.tf
└── module
    ├── api-gateway
    │   ├── api-gateway.tf
    │   ├── output.tf
    │   └── vars.tf
    └── lambda
        ├── iam.tf
        ├── lambda.tf
        ├── output.tf
        ├── src
        │   └── main.py
        ├── upload
        │   └── lambda.zip
        └── vars.tf
```
