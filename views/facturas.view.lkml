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
###########################################
  dimension: percent_confidence {
    type: number
    sql:
    ((coalesce(${facturas.invoice_date_confidence}, 0) +
      coalesce(${facturas.net_amount_confidence}, 0) +
      coalesce(${facturas.total_amount_confidence}, 0) +
      coalesce(${facturas.total_tax_amount_confidence}, 0) +
      coalesce(${facturas.supplier_name_confidence}, 0)) / 5);;
    value_format_name: "percent_2"
    label: "% confiabilidad"
  }

  measure: avg_confidence_percent {
    type: average
    sql: ${percent_confidence} ;;
    label: "% confiabilidad medio"
    value_format_name: "percent_2"
  }
  measure: distinct_factura_count {
    type: count_distinct
    sql: ${factura_id} ;;
    label: "Productos"
  }
}
