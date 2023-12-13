include: "/wiki_example/views/auto_generated/wikipedia.view"

# Added this local rule_exemption because the project-level rule exemptions are currently
# not working in version 3.0.0-beta.0 in the manifest.lkml file
#LAMS
#rule_exemptions: {
# K3: "Refinement file on top of auto_generated file"
#}

view: +wikipedia {

  dimension: timestamp {
    hidden: yes
  }

  dimension_group: timestamp {
    type: time
    datatype: timestamp
    description: "The timestamp of the article."
    sql: timestamp_seconds(${TABLE}.timestamp) ;;
  }

  measure: count {
    type: count
    description: "The number of wikipedia articles."
    filters: {
      field: id
      value: "NOT NULL"
    }
    drill_fields: [id, contributor_username]
  }
}
