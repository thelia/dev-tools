Thelia dev tools
===

This repo is a set of tools for helping thelia developers.

Test thelia update
---

Here's a bash script to help you testing the command thelia:update from 2.0.0 to the last version.
It should prevent from doing a release where thelia:update crashes.

Usage:
```bash
$ bash update_test.sh http://github.com/your/thelia your_branch db_host db_name db_username [db_password]
``` 
