view: groups {
  sql_table_name: looker-private-demo.zendesk.groups
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CREATED_AT;;
  }

  dimension: deleted {
    label: "Is Deleted (y/n)"
    type: yesno
    sql: ${TABLE}.DELETED;;
  }

  dimension: name {
    label: "Name"
    type: string
    sql: ${TABLE}.NAME;;
  }

  measure: count {
    label: "Count of Groups"
    type: count
    drill_fields: [id, name, organization.count, satisfaction_ratings.count, ticket.count]
  }
}
