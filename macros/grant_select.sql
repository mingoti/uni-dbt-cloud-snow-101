{% macro grant_select(p_schema=target.schema, p_role=target.role) %}

    {% set sql %}
        grant usage on schema {{ p_schema }} to role {{ p_role }};
        grant select on all tables in schema {{ p_schema }} to role {{ p_role }};
        grant select on all views in schema {{ p_schema }} to role {{ p_role }};
    {% endset %}

    {{ log('Granting select on all tables and views in schema ' ~ target.schema ~ ' to role ' ~ role, info=True) }}
    {% do run_query(sql) %}
    {{ log('Privileges granted', info=True) }}

{% endmacro %}