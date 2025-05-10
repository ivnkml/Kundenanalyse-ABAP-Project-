CLASS zcl_top_products DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    
    INTERFACES if_oo_adt_classrun.

  
    TYPES: BEGIN OF ty_product,
             product_id   TYPE zcust_order_item-product_id,
             product_name TYPE zcust_product-product_name,
             total_qty    TYPE zcust_order_item-quantity,
           END OF ty_product.


    TYPES tt_product TYPE STANDARD TABLE OF ty_product WITH EMPTY KEY.

   
    METHODS get_top_products
      IMPORTING
        iv_max_count TYPE i DEFAULT 5
      RETURNING
        VALUE(rt_products) TYPE tt_product.

ENDCLASS.  


CLASS zcl_top_products IMPLEMENTATION.

  METHOD get_top_products.
    DATA: lt_all       TYPE tt_product,
          ls_row       TYPE ty_product,
          lv_counter   TYPE i VALUE 0.


    SELECT
      a~product_id,
      b~product_name,
      SUM( a~quantity ) AS total_qty
      FROM zcust_order_item AS a
      INNER JOIN zcust_product    AS b
        ON a~product_id = b~product_id
      GROUP BY
        a~product_id,
        b~product_name
      ORDER BY
        total_qty DESCENDING
      INTO TABLE @lt_all.

   
    LOOP AT lt_all INTO ls_row.
      lv_counter = lv_counter + 1.
      IF lv_counter > iv_max_count.
        EXIT.
      ENDIF.
      APPEND ls_row TO rt_products.
    ENDLOOP.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    DATA lt_top5 TYPE tt_product.


    lt_top5 = me->get_top_products( iv_max_count = 5 ).


    out->write( lt_top5 ).
  ENDMETHOD.

ENDCLASS.  
1