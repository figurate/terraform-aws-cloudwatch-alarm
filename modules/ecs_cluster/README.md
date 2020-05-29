## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alarm\_actions | A list of ARNs triggered when alarm transitions to ALARM state | `list(string)` | `[]` | no |
| alarm\_name | Name of the CloudWatch alarm | `any` | n/a | yes |
| alarm\_type | A predefined string used to reference alarm templates | `any` | n/a | yes |
| cluster\_name | Name of the ECS cluster this alarm is monitoring | `any` | n/a | yes |
| evaluation\_periods | Number of intervals used to evaluate alarm metrics | `number` | `1` | no |
| ok\_actions | A list of ARNs triggered when alarm transitions to OK state | `list(string)` | `[]` | no |
| threshold | Alarm threshold value for evaluating metrics | `number` | `50` | no |

## Outputs

No output.

