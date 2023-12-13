view: wikipedia {
  sql_table_name: `bigquery-public-data.samples.wikipedia`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    description: "A unique ID for the article that was revised. These correspond to the order in which articles were created, except for the first several thousand IDs, which are issued in alphabetical order."
    sql: ${TABLE}.id ;;
  }

  dimension: comment {
    type: string
    description: "Optional user-supplied description of the edit. Section edits are, by default, prefixed with \"/* Section Name */ \"."
    sql: ${TABLE}.comment ;;
  }

  dimension: contributor_id {
    type: number
    description: "Typically, either (_id and _username) or _ip will be set. A (very) small fraction of edits have neither _ip or (_id and _username). They show up on Wikipedia as \"(Username or IP removed)\"."
    sql: ${TABLE}.contributor_id ;;
  }

  dimension: contributor_ip {
    type: string
    description: "Typically, either _ip or (_id and _username) will be set. IP information is unavailable for edits from registered accounts. A (very) small fraction of edits have neither _ip or (_id and _username). They show up on Wikipedia as \"(Username or IP removed)\"."
    sql: ${TABLE}.contributor_ip ;;
  }

  dimension: contributor_username {
    type: string
    description: "Typically, either (_id and _username) or _ip will be set. A (very) small fraction of edits have neither _ip or (_id and _username). They show up on Wikipedia as \"(Username or IP removed)\"."
    sql: ${TABLE}.contributor_username ;;
  }

  dimension: is_bot {
    type: yesno
    description: "A special flag that some of Wikipedia's more active bots voluntarily set."
    sql: ${TABLE}.is_bot ;;
  }

  dimension: is_minor {
    type: yesno
    description: "Corresponds to the \"Minor Edit\" checkbox on Wikipedia's edit page."
    sql: ${TABLE}.is_minor ;;
  }

  dimension: is_redirect {
    type: yesno
    description: "Versions later than ca. 200908 may have a redirection marker in the XML."
    sql: ${TABLE}.is_redirect ;;
  }

  dimension: language {
    type: string
    description: "Empty in the current dataset."
    sql: ${TABLE}.language ;;
  }

  dimension: num_characters {
    type: number
    description: "The length of the article after the revision was applied."
    sql: ${TABLE}.num_characters ;;
  }

  dimension: reversion_id {
    type: number
    description: "If this edit is a reversion to a previous edit, this field records the revision_id that was reverted to. If the same article text occurred multiple times, then this will point to the earliest revision. Only revisions with greater than fifty characters are considered for this field. This is to avoid labeling multiple blankings as reversions."
    sql: ${TABLE}.reversion_id ;;
  }

  dimension: revision_id {
    type: number
    description: "These are unique across all revisions to all pages in a particular language and increase with time. Sorting the revisions to a page by revision_id will yield them in chronological order."
    sql: ${TABLE}.revision_id ;;
  }

  dimension: timestamp {
    type: number
    description: "In Unix time, seconds since epoch."
    sql: ${TABLE}.timestamp ;;
  }

  dimension: title {
    type: string
    description: "The title of the page, as displayed on the page (not in the URL). Always starts with a capital letter and may begin with a namespace (e.g. \"Talk:\", \"User:\", \"User Talk:\", ... )"
    sql: ${TABLE}.title ;;
  }

  dimension: wp_namespace {
    type: number
    description: "Wikipedia segments its pages into namespaces (e.g. \"Talk\", \"User\", etc.)

    MEDIA = 202; // =-2 in WP XML, but these values must be >0
    SPECIAL = 201; // =-1 in WP XML, but these values must be >0
    MAIN = 0;
    TALK = 1;
    USER = 2;
    USER_TALK = 3;
    WIKIPEDIA = 4;
    WIKIPEDIA_TALK = 5;
    IMAGE  = 6;  // Has since been renamed to \"File\" in WP XML.
    IMAGE_TALK = 7;  // Equivalent to \"File talk\".
    MEDIAWIKI = 8;
    MEDIAWIKI_TALK = 9;
    TEMPLATE = 10;
    TEMPLATE_TALK = 11;
    HELP = 12;
    HELP_TALK = 13;
    CATEGORY = 14;
    CATEGORY_TALK = 15;
    PORTAL = 100;
    PORTAL_TALK = 101;
    WIKIPROJECT = 102;
    WIKIPROJECT_TALK = 103;
    REFERENCE = 104;
    REFERENCE_TALK = 105;
    BOOK = 108;
    BOOK_TALK = 109;"
    sql: ${TABLE}.wp_namespace ;;
  }

  measure: count {
    type: count
    drill_fields: [id, contributor_username]
  }
}
