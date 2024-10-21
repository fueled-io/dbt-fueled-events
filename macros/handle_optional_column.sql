{% macro handle_optional_column(relation, column_name, default_value) %}
    {% set columns = adapter.get_columns_in_relation(relation) %}
    {% set column_names = columns | map(attribute='name') | list %}

    {% if column_name in column_names %}
        {{ column_name }}
    {% else %}
        {{ default_value }} AS {{ column_name }}
    {% endif %}
{% endmacro %}
