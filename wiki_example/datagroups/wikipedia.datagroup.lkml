datagroup: wikipedia {
  max_cache_age: "24 hours"
  sql_trigger: SELECT TIMESTAMP_MILLIS(last_modified_time)
               FROM `bigquery-public-data.samples.__TABLES__`
               WHERE table_id = "wikipedia" ;;
}
