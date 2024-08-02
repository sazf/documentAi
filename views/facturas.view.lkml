view: facturas {
  sql_table_name: `Prueba.facturas` ;;
  drill_fields: [factura_id]

  dimension: factura_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.factura_id ;;
  }
  dimension: document_id {
    type: string
    sql: ${TABLE}.document_id ;;
  }
  dimension_group: invoice {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.invoice_date ;;
  }
  dimension: invoice_date_confidence {
    type: number
    sql: ${TABLE}.invoice_date_confidence ;;
  }
  dimension: invoice_id {
    type: string
    sql: ${TABLE}.invoice_id ;;
  }
  dimension: invoice_id_confidence {
    type: number
    value_format_name: id
    sql: ${TABLE}.invoice_id_confidence ;;
  }
  dimension: net_amount {
    type: number
    sql: ${TABLE}.net_amount ;;
  }
  dimension: net_amount_confidence {
    type: number
    sql: ${TABLE}.net_amount_confidence ;;
  }
  dimension: supplier_name {
    type: string
    sql: ${TABLE}.supplier_name ;;
  }
  dimension: supplier_name_confidence {
    type: number
    sql: ${TABLE}.supplier_name_confidence ;;
  }
  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
  }
  dimension: total_amount_confidence {
    type: number
    sql: ${TABLE}.total_amount_confidence ;;
  }
  dimension: total_tax_amount {
    type: number
    sql: ${TABLE}.total_tax_amount ;;
  }
  dimension: total_tax_amount_confidence {
    type: number
    sql: ${TABLE}.total_tax_amount_confidence ;;
  }
  measure: count {
    type: count
    drill_fields: [factura_id, supplier_name, cargue.count, productos.count]
  }
}
