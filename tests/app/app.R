require("DBI")
cs <- paste(
        "driver={PostgreSQL ANSI};Uid=",
        Sys.getenv("USER"),
        ";Pwd=",
        Sys.getenv("PASSWORD"),
        ";Server=",
        Sys.getenv("HOST"),
        ",",
        Sys.getenv("PORT"),
        ";Database=",
        Sys.getenv("DATABASE"),
        sep=""
    )
print(cs)
con <- dbConnect(odbc::odbc(),
    .connection_string = cs
)

queries <- c(
    "CREATE TABLE IF NOT EXISTS test (id int CONSTRAINT pk PRIMARY KEY);",
    "INSERT INTO test VALUES ('100') ON CONFLICT DO NOTHING;",
    "SELECT * FROM test;"
)
lapply(queries, function(query){
    res <- dbSendQuery(con, query)
    avg <- dbFetch(res)
    print(avg)
    dbClearResult(res)
})
dbDisconnect(con)
