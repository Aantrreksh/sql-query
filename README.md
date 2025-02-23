# sql-query

This repository contains the source files for IBM Cloud SQL's online documentation.

## Designing content for IBM Cloud SQL service

See the [internal documentation for content design](https://test.cloud.ibm.com/docs/developing/writing/), particularly the [section on GitHub](https://test.cloud.ibm.com/docs/developing/writing/build?topic=writing-doc-build-git#doc-build-github-set-up)

Content updates start with the `draft` branch of this repository. Content designers can update the branch directly, other developers create a pull request against `draft` that is reviewed and merged by a content designer. Changes to `draft` trigger a build and automatically update the [IBM Cloud stage docs](https://test.cloud.ibm.com/docs/services/sql-query).

When the draft documentation has been reviewed and checked, they are moved forward to the `publish` branch to publish them externally. To do this in GitHub
- [Open pull request from draft to master](https://github.ibm.com/cloud-docs/sql-query/compare/publish...draft?expand=1)
- Merge that pull request, updating the `publish` branch with the latest `draft` content.
  Do not use the "Rebase and Merge" or "Squash and Merge" options, as they will rewrite commits so the branches appear out of sync afterwards!

When the production documentation has been updated, you can validate the changes in the [IBM Cloud production docs](https://test.cloud.ibm.com/docs/services/sql-query). The production documentation build will also update the [doc repository on public GitHub](https://github.com/ibm-cloud-docs/sql-query).

Do not modify the `publish` branch directly (unless you know what you're doing), this will cause draft and public doc to get out of sync!

## Jenkins Build Pipeline

Before you start developing content for IBM Cloud SQL service ensure that you have access to [Jenkins](https://wcp-ace-docs-jenkins.swg-devops.com/login?from=%2F) executing the doc build pipeline.

In case you cannot login into Jenkins follow the steps described in section [Authority and access](https://console.test.cloud.ibm.com/docs/developing/writing/build/trigger-builds.html#auth-access).

## Content quality checks

The documentation build includes some automated checks for [content quality](https://test.cloud.ibm.com/docs/developing/writing/content-strategy?topic=writing-analytics). You can see an overview of the results when you go to the [dashboard](https://cqd.console.test.cloud.ibm.com/docs/staging) and type `sql-query` in the search box on the left.

Quick references:
- Details for the quality check are in the [draft-cqd branch](https://github.ibm.com/cloud-docs/sql-query/tree/draft-cqd)
- When users click on "Open Issue" in the public docs, this creates labeled [issues in the central Documentation-content repo](https://github.ibm.com/Bluemix/Documentation-content/issues?utf8=%E2%9C%93&q=is%3Aissue+is%3Aopen+label%3Asql-query+)
- When users click on "Edit Topic" in the public docs, this currently creates  a [pull request in the public GitHub repo](https://github.com/ibm-cloud-docs/sql-query/pulls). Merging these PRs makes no sense; instead you need to [copy changes](https://test.cloud.ibm.com/docs/developing/writing?topic=writing-doc-build-git) over to the `draft` branch of the internal repo.

## Whatsnew trigger

When you add new items to the [whatsnew doc section](./whatsnew.md), you must start the commit message for this change with `whatsnew: `. This will trigger a [custom GitHub app](https://github.ibm.com/SqlServiceWdp/whatsnew-ghe-app) which updates the UI build, so that users will see a reminder. We should eventually automate this. 

## SQL Reference

The assets that make up the [SQL reference](https://test.cloud.ibm.com/docs/services/sql-query?topic=sql-query-sql-reference) are stored in subdirectory `sqlref`. The table below lists and describes each asset in more detail.

| Asset | Type | Description |
| ----- | ----- | ---- |
| `diagrams` | directory | This directory contains the **railroad diagrams** as svg files that are displayed on the [SQL Reference](./sqlref/sql_function_reference.md) page. |
| `svgfiles` | directory | This directory contains the svg files created by the `npm run build-rrd` command in the [Spark SQL Parser](https://github.ibm.com/SqlServiceWdp/sparksql-parser) project. They are used by the [markdown preprocessor](https://github.ibm.com/SqlServiceWdp/md-preprocess) to generate the **railroad diagrams** for the [SQL Reference](./sqlref/sql_function_reference.md) page.|
| `sql_function_reference.md` | file | The markdown file containing the SQL function reference. |
| `sql_functions.md` | file | The markdown file containing a description of each supported SQL function. |
| `sql_reference.md` | file | The markdown file containing the SQL reference. This md file is generated by invoking the [markdown preprocessor](https://github.ibm.com/SqlServiceWdp/md-preprocess). |
|`sql_reference.template.md`| file | The markdown template file for the SQL reference. This md file is read by the [markdown preprocessor](https://github.ibm.com/SqlServiceWdp/md-preprocess) to generate the `sql_reference.md` file.|

**Note:**
* SQL reference content has to be added to `sql_reference.template.md` file and **not** to `sql_reference.md` file. Content added to `sql_reference.md` only is overwritten the next time the preprocessor is invoked.
* HTML comments have to be written on a single line to ensure they are being recognized by the preprocessor.

Run the following two convenience scripts to copy over SVG files from the "Spark SQL Parser" project
and re-generate the reference file from the template
```
./scripts/update-ref-diagrams.sh
./scripts/process-ref-template.sh
```

## MD Preprocessor

The [markdown preprocessor](https://github.ibm.com/SqlServiceWdp/md-preprocess) reads a template markdown file to generate a common mark down file.
The preprocessor interprets the following types of HTML comments as directives to generate additional HTML and markdown code in the output markdown file.

``

This preprocessor directive has to directly follow a md table definition. This ensures that a table caption is generated and accessibility requirements are met. The directive takes care of numbering tables correctly and prevents writers from renumbering tables when new tables are added in the middle of a text. For more information see [markdown tips for tables](https://console.test.cloud.ibm.com/docs/developing/writing/markdown/tips.html#tables).

Note: All attributes for `table-caption` tag are mandatory thus one has to specify at least empty strings for each atrribute.

``

This preprocessor directive reads in a svg file containing a railroad diagram for a SQL construct and parses it to
* generate a HTML image map for the svg file,
* add a horizontal scrollbar to the image, and
* change the layout of the railroad diagram in case a *layout operator* is specified.

All attributes for `include-svg` tag are mandatory thus one has to specify at least empty strings for each attribute.


## Created And Designed By - Aantrreksh Singh
