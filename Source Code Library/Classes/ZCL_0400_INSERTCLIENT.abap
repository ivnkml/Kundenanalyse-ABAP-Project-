CLASS zcl_0400_insertclient DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    METHODS: fill_customer
             IMPORTING
                out TYPE REF TO if_oo_adt_classrun_out,

             fill_products
             IMPORTING
                out TYPE REF TO if_oo_adt_classrun_out,

             fill_orders
             IMPORTING
                out TYPE REF TO if_oo_adt_classrun_out,

             fill_items
             IMPORTING
                out TYPE REF TO if_oo_adt_classrun_out.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_0400_insertclient IMPLEMENTATION.

  METHOD fill_customer.

  DATA lt_customer TYPE TABLE OF zcust_customer.

  DELETE FROM zcust_customer.

  lt_customer =  VALUE #(
  ( customer_id = 'CUST001' name = 'Ivan KML'           email = 'ivan@example.com'         country = 'UA' customer_type = 'B2C' )
  ( customer_id = 'CUST002' name = 'TOP-PRODUCT'        email = 'sales@tp.com'             country = 'UA' customer_type = 'B2B' )
  ( customer_id = 'CUST003' name = 'John Smith'         email = 'john@company.com'         country = 'US' customer_type = 'B2C' )
  ( customer_id = 'CUST004' name = 'Jane Doe'           email = 'jane.doe@mail.com'         country = 'US' customer_type = 'B2C' )
  ( customer_id = 'CUST005' name = 'Müller GmbH'        email = 'info@mueller.de'           country = 'DE' customer_type = 'B2B' )
  ( customer_id = 'CUST006' name = 'Carlos Sánchez'     email = 'carlos@empresa.mx'         country = 'MX' customer_type = 'B2C' )
  ( customer_id = 'CUST007' name = 'Sakura Tanaka'      email = 'sakura@tokyo.jp'           country = 'JP' customer_type = 'B2C' )
  ( customer_id = 'CUST008' name = 'Jean Dupont'        email = 'jd@paris.fr'               country = 'FR' customer_type = 'B2C' )
  ( customer_id = 'CUST009' name = 'Hans Gruber'        email = 'hans@firma.de'             country = 'DE' customer_type = 'B2B' )
  ( customer_id = 'CUST010' name = 'Angela Merkel'      email = 'angela@kuz.de'              country = 'DE' customer_type = 'B2C' )

  ( customer_id = 'CUST011' name = 'Emma Thompson'      email = 'emma@ukmail.co.uk'         country = 'GB' customer_type = 'B2C' )
  ( customer_id = 'CUST012' name = 'Liam Wilson'        email = 'liam@company.uk'           country = 'GB' customer_type = 'B2B' )
  ( customer_id = 'CUST013' name = 'Chen Wei'           email = 'chen@shanghai.cn'          country = 'CN' customer_type = 'B2C' )
  ( customer_id = 'CUST014' name = 'Fatima Al-Mansour'  email = 'fatima@uae.org'            country = 'AE' customer_type = 'B2C' )
  ( customer_id = 'CUST015' name = 'Lucas Rossi'        email = 'lucas@brasil.com.br'       country = 'BR' customer_type = 'B2C' )
  ( customer_id = 'CUST016' name = 'Nguyen Thi Mai'     email = 'mai@vietnam.vn'            country = 'VN' customer_type = 'B2C' )
  ( customer_id = 'CUST017' name = 'Anna Kowalska'      email = 'anna@warszawa.pl'          country = 'PL' customer_type = 'B2C' )
  ( customer_id = 'CUST018' name = 'Lars Jensen'        email = 'lars@danmark.dk'           country = 'DK' customer_type = 'B2B' )
  ( customer_id = 'CUST019' name = 'Ola Nordmann'       email = 'ola@norge.no'              country = 'NO' customer_type = 'B2C' )
  ( customer_id = 'CUST020' name = 'Juan Pérez'         email = 'juan@empresa.ar'           country = 'AR' customer_type = 'B2B' )

  ( customer_id = 'CUST021' name = 'Max Muestermann'     email = 'mm@mos.de'                country = 'DE' customer_type = 'B2C' )
  ( customer_id = 'CUST022' name = 'Klara Neumann'      email = 'omaklara@mnch.de'          country = 'DE' customer_type = 'B2C' )
  ( customer_id = 'CUST023' name = 'Mohamed Salah'      email = 'msalah@egypt.eg'           country = 'EG' customer_type = 'B2C' )
  ( customer_id = 'CUST024' name = 'Greta Svensson'     email = 'greta@stockholm.se'        country = 'SE' customer_type = 'B2C' )
  ( customer_id = 'CUST025' name = 'Anders Berg'        email = 'aberg@oslo.no'             country = 'NO' customer_type = 'B2B' )
  ( customer_id = 'CUST026' name = 'Thomas Müller'      email = 'thomas@firma.de'           country = 'DE' customer_type = 'B2B' )
  ( customer_id = 'CUST027' name = 'Luisa Fernández'    email = 'luisa@madrid.es'           country = 'ES' customer_type = 'B2C' )
  ( customer_id = 'CUST028' name = 'Robert Taylor'      email = 'robert@usmail.com'         country = 'US' customer_type = 'B2C' )
  ( customer_id = 'CUST029' name = 'Isabella Rossi'     email = 'isabella@roma.it'          country = 'IT' customer_type = 'B2C' )
  ( customer_id = 'CUST030' name = 'David Cohen'        email = 'dcohen@telaviv.il'         country = 'IL' customer_type = 'B2C' )
).

  INSERT zcust_customer FROM TABLE @lt_customer.

  out->write( |{ lines( lt_customer ) } 'Customer table created'| ).

  ENDMETHOD.

  METHOD fill_products.

  DATA lt_products TYPE TABLE OF zcust_product.

  DELETE FROM zcust_product.

       lt_products = VALUE #(
      ( mandt = sy-mandt product_id = 'P000001' product_name = 'Laptop Dell XPS 15' category = 'Elektronik' currency = 'EUR' price = 189 stock_qty = 50 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000002' product_name = 'Smartphone Samsung Galaxy S23' category = 'Elektronik' currency = 'EUR' price = 999 stock_qty = 100 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000003' product_name = 'Kaffeemaschine Philips' category = 'Haushaltsgeräte' currency = 'EUR' price = 299 stock_qty = 30 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000004' product_name = 'Fernseher LG OLED 55"' category = 'Elektronik' currency = 'EUR' price = 1299 stock_qty = 20 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000005' product_name = 'Kopfhörer Sony WH-1000XM5' category = 'Audio' currency = 'EUR' price = 349 stock_qty = 75 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000006' product_name = 'Mikrowelle Samsung' category = 'Haushaltsgeräte' currency = 'EUR' price = 199 stock_qty = 40 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000007' product_name = 'Fitness-Armband Xiaomi Mi Band 7' category = 'Gadgets' currency = 'EUR' price = 49 stock_qty = 200 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000008' product_name = 'Spielkonsole PlayStation 5' category = 'Spiele' currency = 'EUR' price = 499 stock_qty = 15 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000009' product_name = 'Elektroroller Xiaomi' category = 'Transport' currency = 'EUR' price = 599 stock_qty = 10 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000010' product_name = 'Tastatur Logitech MX Keys' category = 'Computerzubehör' currency = 'EUR' price = 99 stock_qty = 60 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000011' product_name = 'Maus Razer DeathAdder V2' category = 'Computerzubehör' currency = 'EUR' price = 69 stock_qty = 80 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000012' product_name = 'Monitor Samsung 27"' category = 'Elektronik' currency = 'EUR' price = 299 stock_qty = 25 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000013' product_name = 'Drucker HP LaserJet Pro' category = 'Bürotechnik' currency = 'EUR' price = 199 stock_qty = 35 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000014' product_name = 'Externe SSD Samsung T7 1TB' category = 'Datenspeicherung' currency = 'EUR' price = 129 stock_qty = 45 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000015' product_name = 'Gamepad Xbox Series X' category = 'Spiele' currency = 'EUR' price = 59 stock_qty = 90 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000016' product_name = 'Smartwatch Apple Watch Series 8' category = 'Gadgets' currency = 'EUR' price = 399 stock_qty = 55 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000017' product_name = 'Saugroboter iRobot Roomba' category = 'Haushaltsgeräte' currency = 'EUR' price = 499 stock_qty = 20 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000018' product_name = 'Kamera Canon EOS R6' category = 'Foto & Video' currency = 'EUR' price = 2499 stock_qty = 10 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000019' product_name = 'Objektiv Sony 50mm f/1.8' category = 'Foto & Video' currency = 'EUR' price = 199 stock_qty = 30 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000020' product_name = 'Smarte Lampe Philips Hue' category = 'Smart Home' currency = 'EUR' price = 49 stock_qty = 100 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000021' product_name = 'Ladegerät Anker 65W' category = 'Zubehör' currency = 'EUR' price = 39 stock_qty = 120 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000022' product_name = 'Powerbank Xiaomi 20000mAh' category = 'Zubehör' currency = 'EUR' price = 29 stock_qty = 150 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000023' product_name = 'Elektrische Zahnbürste Oral-B' category = 'Gesundheit' currency = 'EUR' price = 79 stock_qty = 60 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000024' product_name = 'Kabelloser Lautsprecher JBL Charge 5' category = 'Audio' currency = 'EUR' price = 149 stock_qty = 40 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000025' product_name = 'Grafiktablett Wacom' category = 'Computerzubehör' currency = 'EUR' price = 199 stock_qty = 25 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000026' product_name = 'Router TP-Link' category = 'Netzwerk' currency = 'EUR' price = 89 stock_qty = 70 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000027' product_name = 'Dashcam Xiaomi' category = 'Auto' currency = 'EUR' price = 99 stock_qty = 50 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000028' product_name = 'Elektrogrill Tefal' category = 'Haushaltsgeräte' currency = 'EUR' price = 149 stock_qty = 30 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000029' product_name = 'Kaffeemaschine DeLonghi' category = 'Haushaltsgeräte' currency = 'EUR' price = 249 stock_qty = 20 created_on = '20240508' )
      ( mandt = sy-mandt product_id = 'P000030' product_name = 'Staubsauger Dyson V11' category = 'Haushaltsgeräte' currency = 'EUR' price = 599 stock_qty = 15 created_on = '20240508' )

    ).

     INSERT zcust_product FROM TABLE @lt_products.

     out->write( |{ lines( lt_products ) } Products table has created| ).

  ENDMETHOD.

  METHOD fill_orders.

  DATA lt_orders TYPE TABLE OF zcust_order.

  DELETE FROM zcust_order.

   lt_orders = VALUE #(
  ( mandt = sy-mandt order_id = 'ORD0001' customer_id = 'CUST003' product_id = 'P000005' quantity = 2 order_date = '20240501' currency = 'EUR' total_price = '399.98' )
  ( mandt = sy-mandt order_id = 'ORD0002' customer_id = 'CUST006' product_id = 'P000012' quantity = 1 order_date = '20240502' currency = 'USD' total_price = '149.99' )
  ( mandt = sy-mandt order_id = 'ORD0003' customer_id = 'CUST010' product_id = 'P000020' quantity = 4 order_date = '20240502' currency = 'USD' total_price = '479.96' )
  ( mandt = sy-mandt order_id = 'ORD0004' customer_id = 'CUST008' product_id = 'P000007' quantity = 3 order_date = '20240503' currency = 'EUR' total_price = '89.97' )
  ( mandt = sy-mandt order_id = 'ORD0005' customer_id = 'CUST005' product_id = 'P000017' quantity = 5 order_date = '20240503' currency = 'EUR' total_price = '624.95' )
  ( mandt = sy-mandt order_id = 'ORD0006' customer_id = 'CUST009' product_id = 'P000004' quantity = 1 order_date = '20240504' currency = 'USD' total_price = '1399.00' )
  ( mandt = sy-mandt order_id = 'ORD0007' customer_id = 'CUST014' product_id = 'P000008' quantity = 2 order_date = '20240504' currency = 'USD' total_price = '249.98' )
  ( mandt = sy-mandt order_id = 'ORD0008' customer_id = 'CUST006' product_id = 'P000014' quantity = 1 order_date = '20240504' currency = 'USD' total_price = '89.99' )
  ( mandt = sy-mandt order_id = 'ORD0009' customer_id = 'CUST019' product_id = 'P000011' quantity = 6 order_date = '20240505' currency = 'EUR' total_price = '299.94' )
  ( mandt = sy-mandt order_id = 'ORD0010' customer_id = 'CUST021' product_id = 'P000010' quantity = 3 order_date = '20240505' currency = 'USD' total_price = '459.00' )
  ( mandt = sy-mandt order_id = 'ORD0011' customer_id = 'CUST013' product_id = 'P000006' quantity = 1 order_date = '20240506' currency = 'EUR' total_price = '199.00' )
  ( mandt = sy-mandt order_id = 'ORD0012' customer_id = 'CUST016' product_id = 'P000019' quantity = 2 order_date = '20240506' currency = 'EUR' total_price = '99.98' )
  ( mandt = sy-mandt order_id = 'ORD0013' customer_id = 'CUST017' product_id = 'P000022' quantity = 7 order_date = '20240507' currency = 'USD' total_price = '489.93' )
  ( mandt = sy-mandt order_id = 'ORD0014' customer_id = 'CUST018' product_id = 'P000023' quantity = 1 order_date = '20240507' currency = 'EUR' total_price = '49.00' )
  ( mandt = sy-mandt order_id = 'ORD0015' customer_id = 'CUST011' product_id = 'P000025' quantity = 4 order_date = '20240507' currency = 'USD' total_price = '319.96' )
  ( mandt = sy-mandt order_id = 'ORD0016' customer_id = 'CUST022' product_id = 'P000009' quantity = 1 order_date = '20240508' currency = 'EUR' total_price = '599.00' )
  ( mandt = sy-mandt order_id = 'ORD0017' customer_id = 'CUST002' product_id = 'P000030' quantity = 3 order_date = '20240508' currency = 'EUR' total_price = '899.97' )
  ( mandt = sy-mandt order_id = 'ORD0018' customer_id = 'CUST004' product_id = 'P000013' quantity = 5 order_date = '20240508' currency = 'EUR' total_price = '399.95' )
  ( mandt = sy-mandt order_id = 'ORD0019' customer_id = 'CUST007' product_id = 'P000021' quantity = 2 order_date = '20240508' currency = 'USD' total_price = '179.98' )
  ( mandt = sy-mandt order_id = 'ORD0020' customer_id = 'CUST020' product_id = 'P000016' quantity = 1 order_date = '20240508' currency = 'EUR' total_price = '199.00' )
).


  INSERT zcust_order FROM TABLE @lt_orders.

  out->write( |{ lines( lt_orders ) } Orders table has created | ).

  ENDMETHOD.

  METHOD fill_items.

  DATA lt_items TYPE TABLE OF zcust_order_item.

  DELETE FROM zcust_order_item.

  lt_items = VALUE #(
  ( order_id = 'ORD0001' item_id = '0000000001' product_id = 'P000005' quantity = 2 price = '199.99' total_price = '399.98' currency = 'EUR' )
  ( order_id = 'ORD0002' item_id = '0000000001' product_id = 'P000012' quantity = 1 price = '149.99' total_price = '149.99' currency = 'USD' )
  ( order_id = 'ORD0003' item_id = '0000000001' product_id = 'P000020' quantity = 4 price = '119.99' total_price = '479.96' currency = 'USD' )
  ( order_id = 'ORD0004' item_id = '0000000001' product_id = 'P000007' quantity = 3 price = '29.99' total_price = '89.97' currency = 'EUR' )
  ( order_id = 'ORD0005' item_id = '0000000001' product_id = 'P000017' quantity = 5 price = '124.99' total_price = '624.95' currency = 'EUR' )
  ( order_id = 'ORD0006' item_id = '0000000001' product_id = 'P000004' quantity = 1 price = '1399.00' total_price = '1399.00' currency = 'USD' )
  ( order_id = 'ORD0007' item_id = '0000000001' product_id = 'P000008' quantity = 2 price = '124.99' total_price = '249.98' currency = 'USD' )
  ( order_id = 'ORD0008' item_id = '0000000001' product_id = 'P000014' quantity = 1 price = '89.99' total_price = '89.99' currency = 'USD' )
  ( order_id = 'ORD0009' item_id = '0000000001' product_id = 'P000011' quantity = 6 price = '49.99' total_price = '299.94' currency = 'EUR' )
  ( order_id = 'ORD0010' item_id = '0000000001' product_id = 'P000010' quantity = 3 price = '153.00' total_price = '459.00' currency = 'USD' )
  ( order_id = 'ORD0011' item_id = '0000000001' product_id = 'P000006' quantity = 1 price = '199.00' total_price = '199.00' currency = 'EUR' )
  ( order_id = 'ORD0012' item_id = '0000000001' product_id = 'P000019' quantity = 2 price = '49.99' total_price = '99.98' currency = 'EUR' )
  ( order_id = 'ORD0013' item_id = '0000000001' product_id = 'P000022' quantity = 7 price = '69.99' total_price = '489.93' currency = 'USD' )
  ( order_id = 'ORD0014' item_id = '0000000001' product_id = 'P000023' quantity = 1 price = '49.00' total_price = '49.00' currency = 'EUR' )
  ( order_id = 'ORD0015' item_id = '0000000001' product_id = 'P000025' quantity = 4 price = '79.99' total_price = '319.96' currency = 'USD' )
  ( order_id = 'ORD0016' item_id = '0000000001' product_id = 'P000009' quantity = 1 price = '599.00' total_price = '599.00' currency = 'EUR' )
  ( order_id = 'ORD0017' item_id = '0000000001' product_id = 'P000030' quantity = 3 price = '299.99' total_price = '899.97' currency = 'EUR' )
  ( order_id = 'ORD0018' item_id = '0000000001' product_id = 'P000013' quantity = 5 price = '79.99' total_price = '399.95' currency = 'EUR' )
  ( order_id = 'ORD0019' item_id = '0000000001' product_id = 'P000021' quantity = 2 price = '89.99' total_price = '179.98' currency = 'USD' )
  ( order_id = 'ORD0020' item_id = '0000000001' product_id = 'P000016' quantity = 1 price = '199.00' total_price = '199.00' currency = 'EUR' )
).

  INSERT zcust_order_item FROM TABLE @lt_items.

  out->write( |{ lines( lt_items )  } Order items table has created | ).

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

*    fill_customer( out = out ).
*    fill_products( out = out ).
*    fill_orders( out = out ).
     fill_items( out = out ).
  ENDMETHOD.
ENDCLASS.