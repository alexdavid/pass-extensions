# Password-Store Scripts

A list of various scripts that compliment [pass](https://www.passwordstore.org/).

To install copy the scripts you want to `~/.password-store/.extensions`

---

## `pass ages`
List all passwords from oldest to newest and print last change date

### Examples:
```shell
$ pass ages
personal/amazon     - 3 years ago
work/aws/my-product - 11 months ago
personal/github     - 1 month ago
personal/keybase    - 32 hours ago
work/stripe         - 11 minutes ago
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
