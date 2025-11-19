# Pull Request Name

Please include a summary of the change and which issue is fixed. Please also
include relevant motivation and context. List any dependencies that are
required for this change.

Closes (issue identifier)

## Type of change

Please delete options that are not relevant.

- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality
      to not work as expected)
- [ ] This change requires a documentation update

## How Has This Been Tested?

Please describe the tests that you ran to verify your changes. Provide
instructions so we can reproduce. Please also list any relevant details for
your test configuration

- [ ] Test A
- [ ] Test B

**Test Configuration**:

- Environment:
- Test files:

## Checklist

- [ ] I ensured that all tables have proper source and ref definitions
- [ ] I Defined {{ config(schema=[schema name], tags = [list, of, tags]) }} at
      the start of each script
- [ ] I have performed a self-review of my own code
- [ ] I have checked my code and corrected any misspellings
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation
- [ ] I have added tests that prove my fix is effective or that my feature
      works
- [ ] My code follows the style guidelines of this project
- [ ] My changes generate no new warnings
- [ ] New and existing unit tests pass locally with my changes
- [ ] I have committed any related changes to the PR
- [ ] Run `sqlfluff fix` on tables that are created or modified in this PR.
