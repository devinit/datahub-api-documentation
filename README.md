# Datahub API Documentation

### Introduction

The Datahub is Development Initiative’s user data portal, containing a comprehesive set of visualisations and dashboards meant to inform users about all dimensions of development and humanitarian activity. Behind the Datahub is a database, known as the Development Data Warehouse (DDW). The following is a guide for how to access the public-facing API of the DDW. At present, all of our API functions are built to power various features of the Datahub, but will be expanded over time.

### Technology Stack

The DDW is a stock PostgresQL database. Access to this database is available through a GraphQL server hosted on port 3000 of 212.111.41.68. By sending POST requests with small query parameters, it is possible for a technical user of the DDW to gain access to the live data within the DDW.

For an introduction to Graphql, please see https://graphql.org/learn/


### Using the API

GraphQL queries can be sent via POST request to http://212.111.41.68:3000. A very simple query for `name`, `year`, and `value` for humanitarian flows to the module responsible for colouring the Datahub's world map might look like so:

```
'{
    mapData(id: "data_series.in_ha") {
      map {
        name
        year
        value
      }
    }
  }'
```

All of the datasets available via the `mapData` module are defined within this concept file from the `datahub-cms` repository: https://github.com/devinit/datahub-cms/blob/master/global-picture/concept.csv (Note: `subnational_p20` and `survey_p20` are placeholder datasets only for more complicated data stored within DI's tileserver itself.) You can see an example of how this query might be operationalized in this repo here  https://github.com/devinit/datahub-api-documentation/blob/master/graphql.R or here https://github.com/devinit/datahub-api-documentation/blob/master/graphql.py
