# Start here

Before being able to run dbt models and manipulate data in the D3B warehouse,
your environment must be configured appropriately.

Any time you start a new project or begin working on an existing project in a
new environment, you will need to follow the steps on this page to get that
environment configured.

## Clone the template repository

On your machine, clone the template repository:

```sh
git clone https://github.com/d3b-center/d3b-dbt-template.git
```

## Install PostgreSQL client

To be able to interact with the warehouse from your terminal (and run some of
the commands in this quick start guide), you will need PostgreSQL installed on
your machine.

Download instructions for PostgreSQL can be found
[here](https://www.postgresql.org/download/). From those instructions, to
install on ubuntu:

```sh
apt install postgresql
```

and to install on macOS using `brew`:

```sh
brew install postgresql
```

## Environment setup

### Python Version

First, your environment must be configured to use a specific version of python.
Our suggestion is to use `pyenv` to manage your machine's python versions. A
comprehensive discussion on why to use `pyenv` and how to install it on many
systems can be found on [Real Python](https://realpython.com/intro-to-pyenv/).

Below is a condensed set of those instructions.

1. Install build dependencies. These are required so that `pyenv` can build
   desired versions of python.

   On **Ubuntu/Debian**:

   ```sh
   sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
   libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
   libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl
   ```

   On **macOS** (using Homebrew):

   ```sh
   brew install openssl readline sqlite3 xz zlib
   ```

2. Install `pyenv`:

   ```sh
   curl https://pyenv.run | bash
   ```

3. Add `pyenv` to your load path

   After installing in the previous step, you should see a message similar to
   the one below. **This output varies depending on your local environment.**
   Follow the instructions **in your terminal** so that you can add `pyenv`
   to your path.

   ```sh
   WARNING: seems you still have not added 'pyenv' to the load path.

   Load pyenv automatically by adding
   the following to ~/.bashrc:

   export PATH="$HOME/.pyenv/bin:$PATH"
   eval "$(pyenv init -)"
   eval "$(pyenv virtualenv-init -)"
   ```

4. Reload your shell

   ```sh
   exec "$SHELL"
   ```

5. Use `pyenv` to install a version of python

   At the time of writing these docs, the most recent version of python is
   3.12.4.

   ```sh
   pyenv install 3.12.4
   ```

   You can view all of the versions of python available to install with
   `pyenv install --list`.

6. Set a version of python to use with dbt

   Set the local version to use as the same one you installed in the previous
   step.

   ```sh
   pyenv local 3.12.4
   ```

   This will create a file in the directory you are currently in,
   `.python-version`. As long as `pyenv` is active in your environment
   (see step 3 above), this file will automatically activate the specified
   version of python.

### Create and Activate a Virtual Environment

While you can use `python venv` to create virtual environments,
`pyenv vurtualenv` is integrated with pyenv to manage python version and
virtual environment in one tool.

To create the virtual environment:

```sh
pyenv virtualenv 3.12.4 my_env_name
```

Note that `3.12.4` should match the version of python you installed in the
previous step and `my_env_name` can be whatever you would like to use to name
your virtual environment.

To activate the virtual environment:

```sh
pyenv local my_env_name
```

This will create a file in the directory you are currently in,
`.python-version`. As long as `pyenv` is active in your environment
(see step 3 above), this file will automatically activate the specified version
of python.

You can test that the version of python you are using in terminal is the
expected one with:

```sh
pyenv which python
# should return something similar to
$HOME/path/to/d3b-dbt-template/my_env_name/bin/python
```

## Install Development Tools

To install dbt and other helpful development tools, run:

```sh
pip install -r requirements.txt
```

To test that dbt was installed correctly, run:

```sh
dbt -v
# Should return something similar to
# Core:
#   - installed: 1.8.6
#   - latest:    1.8.6 - Up to date!
#
# Plugins:
#   - postgres: 1.8.2 - Up to date!
```

## Install dbt Dependencies

Now that you know that dbt is installed, you can install common dependencies
we use for dbt projects.

```sh
dbt deps
# Should return something similar to
# 19:54:29  Running with dbt=1.8.6
# 19:54:29  Installing dbt-labs/dbt_utils
# 19:54:29  Installed from version 1.3.0
# 19:54:29  Up to date!
# 19:54:29  Installing calogica/dbt_expectations
# 19:54:32  Installed from version 0.10.4
# 19:54:32  Up to date!
# 19:54:32  Installing dbt-labs/codegen
# 19:54:32  Installed from version 0.12.1
# 19:54:32  Up to date!
# 19:54:32  Installing calogica/dbt_date
# 19:54:32  Installed from version 0.10.1
# 19:54:32  Up to date!
```

## Final thoughts

In this part of the quickstart tutorial, you have installed environment
management tools, used those tools, and installed and tested dbt. In the
[next tutorial](./02-profile-yml.md), you will build the `profiles.yml` file
used by dbt to connect to the D3B warehouse.
