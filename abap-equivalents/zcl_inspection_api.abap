*----------------------------------------------------------------------*
* Class: ZCL_INSPECTION_API
* Description: ABAP class implementing Quality Inspection CRUD operations
*              Equivalent of srv/inspection-service.js in CAP
*----------------------------------------------------------------------*
CLASS zcl_inspection_api DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES:
      BEGIN OF ty_inspection,
        inspection_lot_id  TYPE char12,
        material_number    TYPE matnr,
        material_desc      TYPE maktx,
        plant              TYPE werks_d,
        inspection_type    TYPE char40,
        status             TYPE char20,
        created_date       TYPE datum,
        inspector          TYPE char80,
        quantity           TYPE menge_d,
        unit_of_measure    TYPE meins,
        batch_number       TYPE charg_d,
      END OF ty_inspection,

      tt_inspections TYPE STANDARD TABLE OF ty_inspection WITH KEY inspection_lot_id,

      BEGIN OF ty_result,
        result_id          TYPE char10,
        inspection_lot_id  TYPE char12,
        characteristic     TYPE char80,
        target_value       TYPE char20,
        actual_value       TYPE char20,
        unit               TYPE char20,
        tolerance          TYPE char20,
        valuation          TYPE char10,
      END OF ty_result,

      tt_results TYPE STANDARD TABLE OF ty_result WITH KEY result_id.

    METHODS:
      get_inspections
        RETURNING VALUE(rt_inspections) TYPE tt_inspections,

      get_inspection_by_id
        IMPORTING iv_lot_id             TYPE char12
        RETURNING VALUE(rs_inspection)  TYPE ty_inspection
        RAISING   cx_sy_no_handler,

      get_results_for_lot
        IMPORTING iv_lot_id        TYPE char12
        RETURNING VALUE(rt_results) TYPE tt_results,

      create_inspection
        IMPORTING is_inspection         TYPE ty_inspection
        RETURNING VALUE(rs_inspection)  TYPE ty_inspection
        RAISING   cx_sy_no_handler,

      update_inspection
        IMPORTING is_inspection    TYPE ty_inspection
        RAISING   cx_sy_no_handler,

      delete_inspection
        IMPORTING iv_lot_id        TYPE char12
        RAISING   cx_sy_no_handler.

  PRIVATE SECTION.
    METHODS:
      generate_lot_id
        RETURNING VALUE(rv_lot_id) TYPE char12.

ENDCLASS.


CLASS zcl_inspection_api IMPLEMENTATION.

  METHOD get_inspections.
*   Equivalent of: GET /odata/v4/InspectionService/Inspections
    SELECT prueflos AS inspection_lot_id,
           matnr    AS material_number,
           maktx    AS material_desc,
           werk     AS plant,
           art      AS inspection_type,
           stat     AS status,
           erdat    AS created_date,
           prufer   AS inspector,
           lmenge01 AS quantity,
           mengeneinh AS unit_of_measure,
           charg    AS batch_number
      FROM qals
      INTO TABLE @rt_inspections.

    " Map status codes to text
    LOOP AT rt_inspections ASSIGNING FIELD-SYMBOL(<fs_insp>).
      CASE <fs_insp>-status.
        WHEN '01'. <fs_insp>-status = 'Created'.
        WHEN '02'. <fs_insp>-status = 'In Progress'.
        WHEN '03'. <fs_insp>-status = 'Completed'.
        WHEN '04'. <fs_insp>-status = 'Rejected'.
      ENDCASE.
    ENDLOOP.
  ENDMETHOD.


  METHOD get_inspection_by_id.
*   Equivalent of: GET /odata/v4/InspectionService/Inspections('{id}')
    SELECT SINGLE prueflos AS inspection_lot_id,
           matnr    AS material_number,
           maktx    AS material_desc,
           werk     AS plant,
           art      AS inspection_type,
           stat     AS status,
           erdat    AS created_date,
           prufer   AS inspector,
           lmenge01 AS quantity,
           mengeneinh AS unit_of_measure,
           charg    AS batch_number
      FROM qals
      WHERE prueflos = @iv_lot_id
      INTO @rs_inspection.

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_sy_no_handler.
    ENDIF.
  ENDMETHOD.


  METHOD get_results_for_lot.
*   Equivalent of: $expand=Results
    SELECT ergebnis_id AS result_id,
           prueflos    AS inspection_lot_id,
           merkmal     AS characteristic,
           sollwert    AS target_value,
           istwert     AS actual_value,
           einheit     AS unit,
           toleranz    AS tolerance,
           bewertung   AS valuation
      FROM qase
      WHERE prueflos = @iv_lot_id
      INTO TABLE @rt_results.
  ENDMETHOD.


  METHOD create_inspection.
*   Equivalent of: POST /odata/v4/InspectionService/Inspections
*   In CAP: srv/inspection-service.js before('CREATE') handler
    rs_inspection = is_inspection.

    " Auto-generate lot ID (equivalent of CAP before handler)
    IF rs_inspection-inspection_lot_id IS INITIAL.
      rs_inspection-inspection_lot_id = generate_lot_id( ).
    ENDIF.

    " Set defaults
    IF rs_inspection-status IS INITIAL.
      rs_inspection-status = 'Created'.
    ENDIF.

    IF rs_inspection-created_date IS INITIAL.
      rs_inspection-created_date = sy-datum.
    ENDIF.

    " Insert into database
    INSERT qals FROM @( VALUE #(
      prueflos   = rs_inspection-inspection_lot_id
      matnr      = rs_inspection-material_number
      maktx      = rs_inspection-material_desc
      werk       = rs_inspection-plant
      art        = rs_inspection-inspection_type
      stat       = '01'  "Created
      erdat      = rs_inspection-created_date
      prufer     = rs_inspection-inspector
      lmenge01   = rs_inspection-quantity
      mengeneinh = rs_inspection-unit_of_measure
      charg      = rs_inspection-batch_number
    ) ).

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_sy_no_handler.
    ENDIF.

    COMMIT WORK.
  ENDMETHOD.


  METHOD update_inspection.
*   Equivalent of: PATCH /odata/v4/InspectionService/Inspections('{id}')
    MODIFY qals FROM @( VALUE #(
      prueflos   = is_inspection-inspection_lot_id
      matnr      = is_inspection-material_number
      maktx      = is_inspection-material_desc
      werk       = is_inspection-plant
      art        = is_inspection-inspection_type
      erdat      = is_inspection-created_date
      prufer     = is_inspection-inspector
      lmenge01   = is_inspection-quantity
      mengeneinh = is_inspection-unit_of_measure
      charg      = is_inspection-batch_number
    ) ).

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_sy_no_handler.
    ENDIF.

    COMMIT WORK.
  ENDMETHOD.


  METHOD delete_inspection.
*   Equivalent of: DELETE /odata/v4/InspectionService/Inspections('{id}')
    DELETE FROM qals WHERE prueflos = @iv_lot_id.
    DELETE FROM qase WHERE prueflos = @iv_lot_id.

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_sy_no_handler.
    ENDIF.

    COMMIT WORK.
  ENDMETHOD.


  METHOD generate_lot_id.
*   Uses SAP Number Range (transaction SNRO) to generate sequential IDs
*   Number range object: ZQINSP, interval 01
    DATA: lv_number TYPE char12.

    CALL FUNCTION 'NUMBER_GET_NEXT'
      EXPORTING
        nr_range_nr = '01'
        object      = 'ZQINSP'
      IMPORTING
        number      = lv_number
      EXCEPTIONS
        OTHERS      = 1.

    IF sy-subrc = 0.
      rv_lot_id = lv_number.
    ELSE.
      " Fallback: find max and increment
      SELECT MAX( prueflos )
        FROM qals
        INTO @DATA(lv_max).

      rv_lot_id = lv_max + 1.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
