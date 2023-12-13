include: "/wiki_example/views/auto_generated/wikipedia.view"
include: "/wiki_example/views/refinements/wikipedia_refined.view"
include: "/wiki_example/views/derived_tables/wikipedia_yearly_articles.view"

explore: wikipedia {
  join: wikipedia_yearly_articles {
    sql_on: ${wikipedia.timestamp_year} = ${wikipedia_yearly_articles.pk_year} ;;
    relationship: many_to_one
  }

  query: highest_contributors_2008 {
    label: "Highest contributors in 2008"
    dimensions: [contributor_username]
    measures: [count]
    filters: [wikipedia.timestamp_year: "2008"]
  }
}
