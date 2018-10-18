# Datahub API Documentation

## Introduction

The Datahub is Development Initiative’s user data portal, containing a comprehesive set of visualisations and dashboards meant to inform users about all dimensions of development and humanitarian activity. Behind the Datahub is a database, known as the Development Data Warehouse (DDW). The following is a guide for how to access the public-facing API of the DDW. At present, all of our API functions are built to power various features of the Datahub, but will be expanded over time.

## Technology Stack

The DDW is a stock PostgresQL database. Access to this database is available through a Graphql server hosted on port 3000 of 212.111.41.68. By sending POST requests with small query parameters, it is possible for a technical user of the DDW to gain access to the live data within the DDW.
