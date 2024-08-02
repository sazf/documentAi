connection: "cnn-documentai"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: documentai_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: documentai_default_datagroup

explore: cargue {
  join: facturas {
    type: left_outer 
    sql_on: ${cargue.factura_id} = ${facturas.factura_id} ;;
    relationship: many_to_one
  }
}

explore: facturas {}

explore: productos {
  join: facturas {
    type: left_outer 
    sql_on: ${productos.factura_id} = ${facturas.factura_id} ;;
    relationship: many_to_one
  }
}

