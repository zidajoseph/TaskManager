# README

### Model tasks

| Colums      | Description |
| ----------- | ----------- |
| name        | string      |
| content     | string      |
| expiry_date | string      |
| status      | boolean     |
| priority    | string      |
| user_id     | foreign_key |

### Model users

| Colums   | Description |
| -------- | ----------- |
| name     | string      |
| email    | string      |
| password | string      |
| is_admin | boolean     |

### labels

| Colums | Description |
| ------ | ----------- |
| name   | string      |

### labellings

| Colums    | Description |
| --------- | ----------- |
| task_id   | foreign_key |
| label_id  | foreign_key |
