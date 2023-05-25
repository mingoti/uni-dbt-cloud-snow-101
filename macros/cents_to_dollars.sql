{% macro cents_to_dollars(p_column_name, p_decimal_places=2) -%}
    round( 1.0 * {{ p_column_name }} / 100, {{ p_decimal_places }})
{%- endmacro %}