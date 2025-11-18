# Using pre-commit Hooks

Hooks allow developers to run tests on the changes they make to a codebase
before submitting those changes in a pull request. Pre-commit hooks run every
time a commit is made locally. Pre-commit hooks allow developers to work faster
by locally running checks that run using remote CI/CD tools such as GitHub
actions.

More information about pre-commit may be found [here](https://pre-commit.com/).

## pre-commit configuration

This repository already comes with a
[pre-commit config file](../.pre-commit-config.yaml). This pre-commit
configuration file runs checks that are particularly important to dbt projects.
It uses [dbt-checkpoint](https://github.com/dbt-checkpoint/dbt-checkpoint) to
run the following checks:

- [check-model-has-description](https://github.com/dbt-checkpoint/dbt-checkpoint/blob/main/HOOKS.md#check-model-has-description)
  : this checks if each model has a description in a `schema.yml` type file
- [check-model-columns-have-desc](https://github.com/dbt-checkpoint/dbt-checkpoint/blob/main/HOOKS.md#check-model-columns-have-desc)
  : this checks that each column in models have a description
- [check-script-semicolon](https://github.com/dbt-checkpoint/dbt-checkpoint/blob/main/HOOKS.md#check-script-semicolon)
  : this checks that sql scripts _don't_ have a semicolon at the end
- [check-script-has-no-table-name](https://github.com/dbt-checkpoint/dbt-checkpoint/blob/main/HOOKS.md#check-script-has-no-table-name)
  : this checks that only `ref` and `source` are used and not table names are
  being used.

In addition:

- [SQLfluff](https://github.com/sqlfluff/sqlfluff) checks are run to lint sql
  files.
- [YAMLLint](https://github.com/adrienverge/yamllint) checks are run to lint
  YAML files.

The pre-commit config does not run _all_ of the linting that is performed on
pull requests. In particular, linting completed by the
[Super-Linter](https://github.com/super-linter/super-linter) is not run on every
commit using a pre-commit hook. The Super-Linter lints many languages and runs
many checks that are outside the scope of most commits in a dbt project.
Instead, these hooks were chosen because they test and lint the code that is
most likely to be changed in a dbt project: SQL and YAML files.

## Installation

### Installing pre-commit

To install pre-commit, from the root of this repository, run either:

```sh
pip install -r requirements.txt # install pre-commit and other dev tools
```

or

```sh
pip install pre-commit
```

After installing, run the command below to verify installation was successful:

```sh
pre-commit --version
```

### Install the hooks

Now that pre-commit is installed, you next have to install the hooks
described in the [.pre-commit-config.yaml](../.pre-commit-config.yaml):

```sh
pre-commit install
```

## Using pre-commit

Now that everything is installed, you can develop projects as you normally do.
Make changes to code and additions, add them to version control and then commit
those changes. Every time you run `git commit` the hooks are run to check the
files changed in your commit. Your terminal will provide extra output
explaining the results of tests like the example below:

```sh
dbt deps.................................................................Passed
dbt parse................................................................Passed
dbt docs generate........................................................Passed
Check the model has description..........................................Passed
Check the model columns have description.................................Passed
Check the model has all columns in properties file.......................Passed
Check the script does not contain a semicolon........(no files to check)Skipped
Check the script has not table name..................(no files to check)Skipped
sqlfluff-lint........................................(no files to check)Skipped
yamllint.................................................................Passed
```

If there are any issues, those issues will be displayed as an error with more
information about where the issue is and what the issue is. You will need
to fix the issue before you are able to commit your changes.
