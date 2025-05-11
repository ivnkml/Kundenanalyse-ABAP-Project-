CLASS zcx_static_check DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: message_text TYPE string.                   *  holds custom error message


    METHODS:
        constructor
            IMPORTING
                iv_msg TYPE string.                   * message text passed by caller


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_static_check IMPLEMENTATION.

    METHOD constructor ##ADT_SUPPRESS_GENERATION.

        super->constructor( ).                        * call base exception constructor
        me->message_text = iv_msg.                    * store custom message


    ENDMETHOD.




ENDCLASS.
