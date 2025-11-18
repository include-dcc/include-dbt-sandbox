# Running models in the D3B Warehouse

In this section of the quick start, you will run your first set of models into
the D3B warehouse.

## Running the template project

To run the dbt models, use the command `dbt run`. If it works successfully,
you should see the message below:

<!-- markdownlint-disable line_length -->

```sh
dbt run —-profiles-dir $HOME/.dbt
# 18:21:12  Running with dbt=1.8.6
# 18:21:12  Registered adapter: postgres=1.8.2
# 18:21:12  Found 2 models, 2 operations, 4 data tests, 1 seed, 822 macros
# 18:21:12
# 18:21:13  Concurrency: 4 threads (target='dev')
# 18:21:13
# 18:21:13  1 of 2 START sql table model doej3_dev_schema.my_first_dbt_model .......... [RUN]
# 18:21:14  1 of 2 OK created sql table model doej3_dev_schema.my_first_dbt_model ..... [SELECT 2 in 0.58s]
# 18:21:14  2 of 2 START sql view model doej3_dev_schema.my_second_dbt_model .......... [RUN]
# 18:21:14  2 of 2 OK created sql view model doej3_dev_schema.my_second_dbt_model ..... [CREATE VIEW in 0.46s]
# 18:21:15
# 18:21:15  Running 2 on-run-end hooks
# 18:21:15  1 of 2 START hook: d3b_template_dbt_project.on-run-end.0 ....................... [RUN]
# 18:21:15  1 of 2 OK hook: d3b_template_dbt_project.on-run-end.0 .......................... [GRANT in 0.03s]
# 18:21:15  2 of 2 START hook: d3b_template_dbt_project.on-run-end.1 ....................... [RUN]
# 18:21:15  2 of 2 OK hook: d3b_template_dbt_project.on-run-end.1 .......................... [GRANT in 0.03s]
# 18:21:15
# 18:21:15
# 18:21:15  Finished running 1 table model, 1 view model, 2 project hooks in 0 hours 0 minutes and 2.83 seconds (2.83s).
# 18:21:15
# 18:21:15  Completed successfully
# 18:21:15
# 18:21:15  Done. PASS=2 WARN=0 ERROR=0 SKIP=0 TOTAL=2
```

<!-- markdownlint-enable line_length -->

At this point, if you inspect the d3b warehouse, you should see that a new
schema now exists, `[your_username]_dev_schema`, with one table and one view
in it.

## Final thoughts

In this part of the quick start tutorial, you have run the template models into sadfgasdfasd
the D3B warehouse. This concludes the main part of the tutorial. In the
[next tutorial](./04-next-steps.md), some examples of next steps are discussed.sdfgsdfgsdfg
