#!/usr/bin/env bash

function importData {
    sleep 10s;
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P qsddF234fdfFFsx -d master -i ./setup.sql;
};


importData &
/opt/mssql/bin/sqlservr;
