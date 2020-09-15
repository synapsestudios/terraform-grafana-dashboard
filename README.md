# Grafana Dashboard

This module is responsible for assembling various Grafana dashboards based on panel inputs of templates such as [synapsestudios/terraform-grafana-panel-graph](https://github.com/synapsestudios/terraform-grafana-panel-graph), and [synapsestudios/terraform-grafana-panel-bar-gauge](https://github.com/synapsestudios/terraform-grafana-panel-bar-gauge).

This module will output JSON which can be used to populate / deploy a Grafana dashboard using the [Grafana Provider](https://www.terraform.io/docs/providers/grafana/index.html)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.29 |
| template | ~> 2.1 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| application\_name | Name of application. | `string` | n/a | yes |
| datasource | Grafana Datasource name. | `string` | n/a | yes |
| environment\_name | Name of environment. | `string` | n/a | yes |
| namespace | Namespace of environment. | `string` | n/a | yes |
| uid | UID of the grafana dashboard | `string` | n/a | yes |
| ecs\_panels | List of ECS panels in template form.. | `list` | `[]` | no |
| es\_panels | List of ElasticSearch panels in template form. | `list` | `[]` | no |
| load\_balancer\_panels | List of load balancer panels in template form. | `list` | `[]` | no |
| panel\_height | Height of dashboard panels. | `number` | `5` | no |
| panel\_width | Width of dashboard panels. | `number` | `5` | no |
| rds\_panels | List of RDS panels in template form. | `list` | `[]` | no |
| redis\_panels | List of Redis panels in template form. | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| application\_stack | Application Stack Dashboard in JSON format. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->