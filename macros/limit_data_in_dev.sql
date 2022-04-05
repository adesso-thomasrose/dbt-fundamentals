{%- macro limit_data_in_dev(column_name, dev_days_of_data=3) %}
    {%- if target.name == 'default' %}
        WHERE {{ column_name }} >= DATE_ADD(CURRENT_DATE(), INTERVAL -{{dev_days_of_data}} DAY)
    {%- endif %}
{% endmacro -%}