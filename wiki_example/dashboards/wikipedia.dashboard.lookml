- dashboard: wikipedia_demo_dashboard
  title: Wikipedia Demo Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: SyXMppjAuDGoGS76ay2zQT
  elements:
  - title: Wikipedia Demo Dashboard
    name: Wikipedia Demo Dashboard
    model: wikipedia
    explore: wikipedia
    type: looker_line
    fields: [wikipedia.count, wikipedia.timestamp_year, wikipedia.wp_namespace, wikipedia.language]
    pivots: [wikipedia.wp_namespace, wikipedia.language]
    fill_fields: [wikipedia.timestamp_year]
    sorts: [wikipedia.wp_namespace, wikipedia.timestamp_year desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots: {}
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12
