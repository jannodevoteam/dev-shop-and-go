test: wikipedia_2008_aggregates {
  explore_source: wikipedia {
    column: count {}
    filters: {
      field: wikipedia.timestamp_year
      value: "2008"
    }
  }
  assert: assert_count {
    expression: ${wikipedia.count} = 74757575 ;;
  }
}
