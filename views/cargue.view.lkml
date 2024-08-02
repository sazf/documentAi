view: cargue {
  sql_table_name: `Prueba.cargue` ;;
  drill_fields: [cargue_id]

  dimension: cargue_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.cargue_id ;;
  }
  dimension: document_id {
    type: string
    sql: ${TABLE}.document_id ;;
  }
  dimension: factura_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.factura_id ;;
  }
  dimension_group: fecha_de_cargue {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha_de_cargue ;;
  }
  dimension: invoice_id {
    type: string
    sql: ${TABLE}.invoice_id ;;
  }
  measure: count {
    type: count
    drill_fields: [cargue_id, facturas.factura_id, facturas.supplier_name]
  }
}
