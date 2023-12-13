view: wikipedia_yearly_articles {
  derived_table: {
    explore_source: wikipedia {
      column: timestamp_year {}
      column: count {}
    }
  }
  dimension: pk_year {
    hidden: yes
    primary_key: yes
    type: number
    sql: extract(year from ${TABLE}.timestamp_year) ;;
  }

  dimension: yearly_articles {
    description: "The number of wikipedia articles."
    type: number
    sql: ${TABLE}.count ;;
  }
}
