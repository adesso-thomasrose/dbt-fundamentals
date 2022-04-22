{% macro grant_select(schema = target.schema, role = target.user) %}
    {% set query %}
        grant usage on schema {{ schema }} to {{ role }}
        grant select on all tables in {{ schema }} to {{ role }}
        grant select on all views in {{ schema }} to {{ role }}
    {% endset %}

    {{ log('Granting SELECT on ALL TABLES and VIEWS in SCHEMA ' ~ schema ~ ' to ROLE ' ~ role, info = true) }}
    {% do run_query(query) %}
    {{ log('Privileges granted', info = true) }}
{% endmacro %}