view: productos {
  sql_table_name: `Prueba.productos` ;;

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }
  dimension: amount_confidence {
    type: number
    sql: ${TABLE}.amount_confidence ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: description_confidence {
    type: number
    sql: ${TABLE}.description_confidence ;;
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
  dimension: invoice_id {
    type: string
    sql: ${TABLE}.invoice_id ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }
  dimension: quantity_confidence {
    type: number
    sql: ${TABLE}.quantity_confidence ;;
  }
  dimension: unit_price {
    type: number
    sql: ${TABLE}.unit_price ;;
  }
  dimension: unit_price_confidence {
    type: number
    sql: ${TABLE}.unit_price_confidence ;;
  }
  measure: count {
    type: count
    drill_fields: [facturas.factura_id, facturas.supplier_name]
  }
}
