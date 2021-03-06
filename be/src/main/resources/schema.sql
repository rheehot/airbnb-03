drop table if exists calendar;
drop table if exists bookmarks;
drop table if exists user;
drop table if exists bookings;

CREATE TABLE IF NOT EXISTS properties
(
    id                INT,
    title             VARCHAR(64),
    state             VARCHAR(64),
    city              VARCHAR(64),
    latitude          DOUBLE,
    longitude         DOUBLE,
    reservable        BOOLEAN,
    saved             BOOLEAN,
    host_type         VARCHAR(32) DEFAULT 'Not Tag',
    price             DECIMAL(10, 3),
    place_type        VARCHAR(32),
    review_average    DECIMAL(3, 2),
    number_of_reviews INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS bookings
(
    id             INT AUTO_INCREMENT,
    check_in_date  DATE,
    check_out_date DATE,
    booking_date   DATETIME,
    guests         INT,
    cleaning_fee   DECIMAL(10, 3),
    service_fee    DECIMAL(10, 3),
    tax            DECIMAL(10, 3),
    price          DECIMAL(10, 3),
    price_for_stay DECIMAL(10, 3),
    total_price    DECIMAL(10, 3),
    nights         INT,
    properties_id  INT REFERENCES properties (id),
    user_id        INT REFERENCES user (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS user
(
    id    INT,
    name  VARCHAR(64),
    email VARCHAR(128),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS detail
(
    id                          INT,
    summary                     VARCHAR(1024),
    space                       VARCHAR(1024),
    city_overview               VARCHAR(1024),
    notes                       VARCHAR(1024),
    transit                     VARCHAR(1024),
    host_name                   VARCHAR(64),
    host_since                  DATE,
    host_location               VARCHAR(128),
    host_about                  VARCHAR(5000),
    address                     VARCHAR(128),
    accommodates                INT,
    bathrooms                   INT,
    bedrooms                    INT,
    beds                        INT,
    bed_type                    VARCHAR(128),
    amenities                   VARCHAR(512),
    service_fee                 DECIMAL(10,3),
    cleaning_fee                DECIMAL(10,3),
    tax                         DECIMAL(10,3),
    review_scores_accuracy      DECIMAL(2, 1),
    review_scores_cleanliness   DECIMAL(2, 1),
    review_scores_checkin       DECIMAL(2, 1),
    review_scores_communication DECIMAL(2, 1),
    review_scores_location      DECIMAL(2, 1),
    review_scores_value         DECIMAL(2, 1),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS bookmarks
(
    id            INT AUTO_INCREMENT,
    user_id       INT REFERENCES user (id),
    properties_id INT REFERENCES properties (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS images
(
    id            INT AUTO_INCREMENT,
    image_url     VARCHAR(256),
    properties_id INT REFERENCES properties (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS calendar
(
    id               INT AUTO_INCREMENT,
    reservation_date DATE,
    properties_id    INT REFERENCES properties (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS gitHubAccessToken
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT,
    token_type VARCHAR(64),
    gitHubAccessToken      VARCHAR(64)
);
