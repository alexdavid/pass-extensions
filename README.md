# Password-Store Scripts

A list of various scripts that compliment [pass](https://www.passwordstore.org/).

To install copy the scripts you want to `~/.password-store/.extensions`

---

## `pass ages`
List all passwords with their last generated date, last modified date, and created date
If the commit message contains the word `generated` it assumes that commit generated a new password

### Examples:
```shell
$ pass ages
Password            | Last Generated | Last Modified  | Created
work/aws/my-product | -              | 11 months ago  | 1 year, 2 months ago
personal/keybase    | -              | 32 hours ago   | 32 hours ago
personal/amazon     | 3 years ago    | 3 years ago    | 3 years ago
personal/github     | 1 month ago    | 2 weeks ago    | 5 years ago
work/stripe         | 11 minutes ago | 11 minutes ago | 2 weeks ago
```

## `pass insecure`
List all passwords with a non-secure protocol for the `URL` field
### Example:
```
$ pass insecure
Insecure protocol -- personal/github (URL: http://github.com/)
```

## `pass older-than [age]`
Gets passwords that haven't been changed since the passed date/commit

### Examples:
To get passwords that were last modified over 3 months ago:
```shell
$ pass older-than 3 months ago
```
To get passwords modified over 1 year ago:
```shell
$ pass older-than 1 year ago
```
