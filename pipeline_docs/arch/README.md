# Decisions

From the Architectural Decision Records (ADRs) [documentation](https://adr.github.io/):

> An Architectural Decision (AD) is a justified design choice that addresses a
> functional or non-functional requirement that is architecturally significant.
> An Architecturally Significant Requirement (ASR) is a requirement that has a
> measurable effect on the architecture and quality of a software and/or
> hardware system. An Architectural Decision Record (ADR) captures a single AD
> and its rationale; the collection of ADRs created and maintained in a project
> constitute its decision log

The MADR (Markdown ADR) documentation is available at
<https://adr.github.io/madr/> while general information about ADRs is
available at <https://adr.github.io/>.

## Templates

For new ADR's, please use one of the following templates as a starting point:

- [adr-template.md](adr-template.md) has all sections, with explanations about
  them.
- [adr-template-minmal.md](adr-template-minimal.md) only contains mandatory
  sections, with explanations about them.

## Creating a new ADR

1. Create a branch in this repository title `ADR/AA/title-with-dashes` where
   `AA` is your first and last initials.
2. Select the desired template.
3. Copy the template to `docs/decisions/NNN-title-with-dashes.md` where `NNN`
   indicates the next number in sequence.
4. Edit `NNN-with-title-dashes.md`.
5. Add, commit, and push your changes to remote version control. Make a pull
   request. After checks have completed, passed, and any fixup commits are
   squashed, request review of the ADR by appropriate reviewers.
6. After pull request is reviewed, merge the pull request.
