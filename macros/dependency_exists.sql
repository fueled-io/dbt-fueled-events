{% macro dependency_exists(schema, table) -%}
  {%- if not execute -%}
    {# When compiling (without a live DB connection), we return true so that models always compile. #}
    {{ return(true) }}
  {%- else -%}
    {# Use the adapter to check if the relation exists in the target warehouse #}
    {% set relation = adapter.get_relation(
         database=target.database,
         schema=schema,
         identifier=table
       ) %}
    {%- if relation is not none -%}
      {{ return(true) }}
    {%- else -%}
      {{ return(false) }}
    {%- endif -%}
  {%- endif -%}
{%- endmacro %}
