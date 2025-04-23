{% macro check_dependencies(dependencies) -%}
  {# 
    `dependencies` should be a list of dictionaries, each with the keys "schema" and "table".
    The macro will return true only if every dependency exists.
  #}
  {%- set all_met = true -%}
  {%- for dep in dependencies -%}
    {% if not dependency_exists(dep.schema, dep.table) %}
      {%- set all_met = false -%}
    {% endif %}
  {%- endfor -%}
  {{ return(all_met) }}
{%- endmacro %}
