view: referencia {
  sql_table_name: `hippo-387619.Prueba.referencia` ;;

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: nombre_referencia {
    type: string
    sql: ${TABLE}.nombre_referencia ;;
  }
  dimension: precio_final {
    type: number
    sql: ${TABLE}.precio_final ;;
  }
  measure: count {
    type: count
  }
}
