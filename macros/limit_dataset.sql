{% macro limit_dataset(p_column_name, p_number_of_days) %}

   {% if target.name == 'default' %}

      where {{ p_column_name }} >= dateadd('day' , -{{ p_number_of_days }}, current_timestamp() )

   {% endif %}

{% endmacro %}