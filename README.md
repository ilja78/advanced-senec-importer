# SENEC importer

Import CSV data downloaded from mein-senec.de and push it to InfluxDB.


## Requirements

- CSV files downloaded from mein-senec.de
- Connection to your InfluxDB
- Docker


## Usage

Prepare your CSV files in Excel, to calculate for every timestamp the kWh values of:
-inverter_power
-house_power
-grid_power_plus
-grid_power_minus
-akku_power_plus
-akku_power_minus
then sum the values ​​from timestamp to timestamp in columns with the names:
-Stromerzeugung_total [kWh]
-Stromverbrauch_total [kWh]
-Netzbezug_total [kWh]
-Netzeinspeisung_total [kWh]
-Akkubeladung_total [kWh]
-Akkuentnahme_total [kWh]

Prepare an `.env` file (like `.env.example`) and place CSV files into a folder of your choice. Then do:

```bash
docker run -it --rm \
           --env-file .env \
           -v /folder/with/csv-files:/data \
           https://github.com/Ilja78/advanced-senec-importer.git
```

This imports all CSV files from the folder `/folder/with/csv-files` and pushes them to your InfluxDB.
The process is idempotent, so you can run it multiple times without any harm.


## License

Copyright (c) 2020-2022 Georg Ledermann, released under the MIT License
