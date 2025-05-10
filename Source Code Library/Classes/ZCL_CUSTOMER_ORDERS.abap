CLASS zcl_customer_orders DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
        TYPES: BEGIN OF ty_order,
               order_id TYPE zcust_order-order_id,
               customer_id TYPE zcust_order-customer_id,
               order_date TYPE zcust_order-order_date,
               currency TYPE zcust_order-currency,
               total_price TYPE zcust_order-total_price,
               item_id TYPE zcust_order_item-item_id,
               product_id TYPE zcust_order_item-product_id,
               quantity TYPE zcust_order_item-quantity,
               price TYPE zcust_order_item-price,
               item_total TYPE zcust_order_item-total_price,

               END OF ty_order,
               tt_orders TYPE TABLE OF ty_order WITH EMPTY KEY.

        METHODS get_customer_orders
            IMPORTING
                iv_customer_id TYPE zcust_order-customer_id
            RETURNING
                VALUE(rt_orders) TYPE tt_orders
            RAISING
                zcx_static_check.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_customer_orders IMPLEMENTATION.

    METHOD get_customer_orders.

        SELECT o~order_id,
               o~customer_id,
               o~order_date,
               o~currency,
               o~total_price,
               i~item_id,
               i~product_id,
               i~quantity,
               i~total_price as item_total

        FROM zcust_order as o
        INNER JOIN zcust_order_item AS i ON i~order_id = o~order_id
        WHERE o~customer_id = @iv_customer_id
        INTO TABLE @rt_orders.

       IF rt_orders IS INITIAL.
        DATA(lv_msg) = |  Client { iv_customer_id } has no orders. |.

        RAISE EXCEPTION TYPE ZCX_STATIC_CHECK
            EXPORTING
                iv_msg = lv_msg.
       ENDIF.



    ENDMETHOD.

ENDCLASS.