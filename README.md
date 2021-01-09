# FIFA21 Players Database

A FIFA21 Players Database built from the players' in-game data extracted from https://sofifa.com/players


## Data Extraction

The data is included in this repo.

To get the latest data, run the following script for extracting the data:

``` python
cd source_datasets
python fifa21_data_crawler.py
```

## Data Preprocessing

``` python
cd data_preprocessing_script

python process_fifa21_data.py # preprocess players' data
python language_process.py # preprocess country-language data
```

This will generate the csv files under cleaned_tables. 


## Schema and Queries

Using PostgreSQL environment, use the following commands to import the data, build the schema, and run queries:

```
\i schema.ddl
\i import.sql
\i queries.sql
```

## Demo

Some demos on example interactions can be found in the following files:

1. load_data_demo.txt
2. simple_demo.txt
3. simple_demo2.txt
4. run_queries_demo.txt
