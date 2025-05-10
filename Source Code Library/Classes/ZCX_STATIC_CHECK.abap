CLASS zcx_static_check DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: message_text TYPE string.

    METHODS:
        constructor
            IMPORTING
                iv_msg TYPE string.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_static_check IMPLEMENTATION.

    METHOD constructor ##ADT_SUPPRESS_GENERATION.

        super->constructor( ).
        me->message_text = iv_msg.


    ENDMETHOD.




ENDCLASS.