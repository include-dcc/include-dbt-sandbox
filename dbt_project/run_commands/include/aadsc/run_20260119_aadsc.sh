#!/bin/bash
dbt clean
dbt deps || { echo "Error: dbt deps failed. Exiting..."; exit 1; }
dbt seed #--full-refresh
# Source tables
dbt run --select include_aadsc_src_chicoine_down_syndrome_extract

dbt run --select aadsc_test_participant
dbt run --select aadsc_test_condition
dbt run --select aadsc_test_study