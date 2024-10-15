select
    id as property_id,
    name,
    address,
    city,
    state,
    zip_code,
    type,
    year_built,
    uploaded_at,
    created_at

from {{ source("property_management", "properties") }}
