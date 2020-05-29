# ![AWS](aws-logo.png) CloudWatch Alarm

Purpose: Templates for CloudWatch Alarms.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alarm\_actions | A list of ARNs triggered when alarm transitions to ALARM state | `list(string)` | `[]` | no |
| alarm\_name | Name of the CloudWatch alarm | `any` | n/a | yes |
| alarm\_type | A predefined string used to reference alarm templates | `any` | n/a | yes |
| dimensions | Properties specific to the namespace used for filtering metrics | `map(any)` | `{}` | no |
| evaluation\_periods | Number of intervals used to evaluate alarm metrics | `number` | `1` | no |
| namespace | The namespace of the metrics used to trigger the alarm | `any` | n/a | yes |
| ok\_actions | A list of ARNs triggered when alarm transitions to OK state | `list(string)` | `[]` | no |
| threshold | Alarm threshold value for evaluating metrics | `number` | `50` | no |

## Outputs

No output.

