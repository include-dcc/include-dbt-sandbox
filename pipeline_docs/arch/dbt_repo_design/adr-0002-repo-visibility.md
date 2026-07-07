---
# These are optional metadata elements. Feel free to remove any of them.
status: proposed
date: 2025-11-19
---

# INCLUDE dbt Repository Visibility

## Context

A decision needs to be made regarding the repository being public or private.
While private repositories does provide ability to control who can see the
source code for transformations, there are many features of GitHub that are only
available to public repositories that are using the free GitHub plan.

### What information needs to be private?

As with any software project, there are secrets that need to be private so as
not to allow unauthorized access to resources or data. Although private
repositories reduce the risk associated with accidentally putting a secret into
version control, best practice is to not put secrets into a version-controlled
repository, regardless of wether or not the repository is public or private.
Most often, this is accomplished by storing secrets in environment variables
and in specifically prohibiting files from being added to a repository by using
a `.gitignore` file.

In addition to these secrets, the other key set of information that must not be
disclosed to the public is raw data that has not been approved for public,
uncontrolled access.

### What information does not need to be private?

The transformation code itself, in dbt models, does not need to be private.
The code in these models refer to the structure of source data and later
transformations of those source data and *not* the data itself.

Other supporting code related to deployment of dbt models (e.g. airflow DAG's)
does not need to be private. The transformation code referenced immediately
above and deployment code would only reference studies generally and not
reference individual data points that need to be kept private.

### What GitHub Features are only available in public repositories on the free GitHub Plan?

This is not a definitive or exhaustive list of the comparison between GitHub
plans. A list from GitHub of features in paid organizations vs free
organizations is [here](https://docs.github.com/en/get-started/learning-about-github/faq-about-changes-to-githubs-plans#if-i-downgrade-from-github-team-or-a-legacy-plan-to-github-free-what-features-will-i-lose). To compare the current differences in features between all plans, visit
[GitHub pricing page](https://github.com/pricing).

The key features of note that are useful in repositories that are only available
in public repositories are:

* **Protected branches**: Branch protection of the `main` branch is of
particular importance. Protecting main branch can prohibit committing directly
to the branch, meaning that every change gets reviewed in a pull request,
potentially also requiring review by certain code owners or requiring that
status checks pass before merging into main branch is allowed
* **Multiple Pull Request Reviewers**: Often times a change needs to be reviewed
by multiple people.

### Considered Options

#### Making the repository public

**Pros**

* Access to GitHub features that are only available in public repositories on
  the free GitHub plan
* Increased transparency into transformation code
* Easier collaboration with external contributors

**Cons**

* Potential risk of exposing sensitive information if best practices are not
  followed

#### Making the repository private

**Pros**

* Increased control over who can see the source code

**Cons**

* Lack of access to GitHub features that are only available in public
  repositories on the free GitHub plan.
* Reduced transparency into transformation code
* More difficult collaboration with external contributors

## Decision

The repository will be made public to take advantage of GitHub features that
are only available in public repositories on the free GitHub plan. Best
practices will be followed to ensure that no sensitive information is added to
the repository. These best practices include using environment variables to
mask secrets and using the `.gitignore` to prohibit environment-defining files,
such as `.env` files from being added to the repository

## Consequences

The repository is made public. The `.gitignore` is checked to make sure that
environment configuration files are ignored.
