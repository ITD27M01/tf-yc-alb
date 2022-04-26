## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| yandex | >= 0.72.0 |

## Providers

| Name | Version |
|------|---------|
| yandex | >= 0.72.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| folder\_id | Folder id (default to provider config) | `string` | n/a | yes |
| labels | Labels map to assign to instance | `map(string)` | `{}` | no |
| lb\_certificate\_id | Certificate ID from Yandex Certificate Manager | `string` | n/a | yes |
| lb\_external\_ip | External Static IP for LB | `string` | `null` | no |
| lb\_name | Name of this LB | `string` | n/a | yes |
| lb\_network\_id | VPC id for LB attachments | `string` | n/a | yes |
| lb\_port | Port for LB listener | `number` | `443` | no |
| lb\_subnet\_name | LB Subnet name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| fqdn | LoadBalancer FQDN |
| lb | LoadBalancer object |
| lb\_router\_id | LoadBalancer router ID |

