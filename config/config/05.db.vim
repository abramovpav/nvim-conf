let g:dbext_default_profile_pg = 'type=PGSQL'
let g:dbext_default_profile = 'pg'
let g:dbext_default_PGSQL_bin = "export $(grep -v '^#' /app/.pgenv | xargs -d '\n') && psql"
