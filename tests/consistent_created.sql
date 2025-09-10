SELECT *
FROM {{ ref("fct_reviews")}} f
WHERE EXISTS
    (SELECT 1 
    FROM {{ ref("dim_listings_cleansed")}} d
    WHERE f.listing_id = d.listing_id
    AND f.review_date < d.created_at
    )
LIMIT 1