with
    units as (select * from {{ ref("stg_units") }}),

    leases as (select * from {{ ref("stg_leases") }}),

    rental_applications as (select * from {{ ref("stg_rental_applications") }}),

    completed_conversions as (

        select leases.unit_id, leases.start_date, leases.end_date
        from leases
        join units using (unit_id)
        join rental_applications using (rental_application_id)
        where
            leases.completed = true
            and rental_applications.status = 'converted_to_tenant'
            and units.status = 'occupied'

    )

select *
from completed_conversions
