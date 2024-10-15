select
    id as lease_id,
    unit_id,
    start_date,
    end_date,
    rental_application_id,
    completed,
    uploaded_at,
    created_at

from {{ source("property_management", "leases") }}
