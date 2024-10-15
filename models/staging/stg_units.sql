select
    id as unit_id,
    created_at,
    rent,
    property_id,
    name,
    bedrooms,
    bathrooms,
    square_feet,
    status,
    concat(address_1, ' ', coalesce(address_2, '')) as address,
    city,
    state,
    zip_code,
    uploaded_at

from {{ source("property_management", "units") }}
