{%- macro union_tables_by_prefix(p_database, p_schema, p_prefix) -%}

  {%- set tables = dbt_utils.get_relations_by_prefix(database=p_database, schema=p_schema, prefix=p_prefix) -%}

  {% for table in tables %}

      {%- if not loop.first -%}
      union all 
      {%- endif %}
        
      select * from {{ table.database }}.{{ table.schema }}.{{ table.name }}
      
  {% endfor -%}
  
{%- endmacro -%}