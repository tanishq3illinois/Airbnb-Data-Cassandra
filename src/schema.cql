CREATE KEYSPACE IF NOT EXISTS my_keyspace
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'};

USE my_keyspace;

CREATE TABLE IF NOT EXISTS neighbourhoods (
    city text,
    neighbourhood_group text,
    neighbourhood text,
    PRIMARY KEY (city, neighbourhood_group, neighbourhood)
);

CREATE TABLE IF NOT EXISTS listings (
    id bigint,
    listing_url text,
    name text,
    description text,
    neighborhood_overview text,
    picture_url text,
    host_id bigint,
    host_name text,
    host_since date,
    host_location text,
    host_response_time text,
    host_response_rate text,
    host_acceptance_rate text,
    host_is_superhost boolean,
    host_picture_url text,
    host_listings_count int,
    host_identity_verified boolean,
    neighbourhood text,
    neighbourhood_group text,
    city text,
    latitude decimal,
    longitude decimal,
    property_type text,
    room_type text,
    accommodates int,
    bathrooms decimal,
    bedrooms int,
    beds int,
    price decimal,
    minimum_nights int,
    maximum_nights int,
    availability_30 int,
    availability_60 int,
    availability_90 int,
    availability_365 int,
    number_of_reviews int,
    review_scores_rating decimal,
    review_scores_accuracy decimal,
    review_scores_cleanliness decimal,
    review_scores_checkin decimal,
    review_scores_communication decimal,
    review_scores_location decimal,
    review_scores_value decimal,
    instant_bookable boolean,
    calculated_host_listings_count int,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS calendar (
    listing_id bigint,
    date date,
    available boolean,
    price decimal,
    adjusted_price decimal,
    minimum_nights int,
    maximum_nights int,
    PRIMARY KEY (listing_id, date)
);

CREATE TABLE IF NOT EXISTS reviews (
    id bigint,
    listing_id bigint,
    date date,
    reviewer_id bigint,
    reviewer_name text,
    comments text,
    PRIMARY KEY (listing_id, date, id)
) WITH CLUSTERING ORDER BY (date DESC, id ASC);


CREATE INDEX ON listings(host_id);
CREATE INDEX ON listings(room_type);
CREATE INDEX ON listings(city);
CREATE INDEX ON listings(neighbourhood);
