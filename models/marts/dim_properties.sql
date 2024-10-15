with
    units as (select * from {{ ref("stg_units") }}),
    properties as (select * from {{ ref("stg_properties") }}),
    total_rent_income as (
        select properties.property_id, properties.name, sum(units.rent) as total_rent

        from properties
        join units using (property_id)
        where units.status in ('occupied', 'rented')
        group by properties.property_id, properties.name
    )
-- test change
select *
from total_rent_income
