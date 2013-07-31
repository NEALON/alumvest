CREATE TABLE borrower_credits
(
    id int PRIMARY KEY NOT NULL,
    score_range varchar(255),
    earliest_credit_line date,
    open_credit_lines int,
    total_credit_lines int,
    revolving_credit_balance numeric(19),
    revolving_line_utilization_pct numeric(19),
    inquiries_in_last_6_months int,
    accounts_now_delinquent int,
    delinquent_amount numeric(19),
    delinquencies_in_last_2_years int,
    months_since_last_delinquency int,
    public_records_on_file int,
    months_since_last_public_record int,
    months_since_last_derogatory int,
    borrower_id int,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
)
CREATE TABLE borrower_credits_id_seq
(
    sequence_name text NOT NULL,
    last_value bigint NOT NULL,
    start_value bigint NOT NULL,
    increment_by bigint NOT NULL,
    max_value bigint NOT NULL,
    min_value bigint NOT NULL,
    cache_value bigint NOT NULL,
    log_cnt bigint NOT NULL,
    is_cycled bool NOT NULL,
    is_called bool NOT NULL
)
CREATE TABLE borrower_profiles
(
    id int PRIMARY KEY NOT NULL,
    home_ownership varchar(255),
    current_employer varchar(255),
    length_of_employment_in_months int,
    gross_monthly_income numeric(19),
    location varchar(255),
    borrower_id int,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
)
CREATE TABLE borrower_profiles_id_seq
(
    sequence_name text NOT NULL,
    last_value bigint NOT NULL,
    start_value bigint NOT NULL,
    increment_by bigint NOT NULL,
    max_value bigint NOT NULL,
    min_value bigint NOT NULL,
    cache_value bigint NOT NULL,
    log_cnt bigint NOT NULL,
    is_cycled bool NOT NULL,
    is_called bool NOT NULL
)
CREATE TABLE borrowers
(
    id int PRIMARY KEY NOT NULL,
    first_name varchar(255),
    last_name varchar(255),
    street_address varchar(255),
    state varchar(255),
    postal_code varchar(255),
    daytime_phone varchar(255),
    evening_phone varchar(255),
    dob date,
    user_id int,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
)
CREATE TABLE borrowers_id_seq
(
    sequence_name text NOT NULL,
    last_value bigint NOT NULL,
    start_value bigint NOT NULL,
    increment_by bigint NOT NULL,
    max_value bigint NOT NULL,
    min_value bigint NOT NULL,
    cache_value bigint NOT NULL,
    log_cnt bigint NOT NULL,
    is_cycled bool NOT NULL,
    is_called bool NOT NULL
)
CREATE TABLE coupons
(
    id int PRIMARY KEY NOT NULL,
    investment_amount numeric(19),
    interest_rate numeric(19),
    term_in_months int,
    outstanding_principal numeric(19),
    accrued_interest numeric(19),
    payments_received numeric(19),
    payment_due_day int,
    portfolio_id int,
    loan_id int,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
)
CREATE TABLE coupons_id_seq
(
    sequence_name text NOT NULL,
    last_value bigint NOT NULL,
    start_value bigint NOT NULL,
    increment_by bigint NOT NULL,
    max_value bigint NOT NULL,
    min_value bigint NOT NULL,
    cache_value bigint NOT NULL,
    log_cnt bigint NOT NULL,
    is_cycled bool NOT NULL,
    is_called bool NOT NULL
)
CREATE TABLE investors
(
    id int PRIMARY KEY NOT NULL,
    first_name varchar(255),
    last_name varchar(255),
    street_address varchar(255),
    state varchar(255),
    postal_code varchar(255),
    daytime_phone varchar(255),
    evening_phone varchar(255),
    dob date,
    investable_assets varchar(255),
    user_id int,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
)
CREATE TABLE investors_id_seq
(
    sequence_name text NOT NULL,
    last_value bigint NOT NULL,
    start_value bigint NOT NULL,
    increment_by bigint NOT NULL,
    max_value bigint NOT NULL,
    min_value bigint NOT NULL,
    cache_value bigint NOT NULL,
    log_cnt bigint NOT NULL,
    is_cycled bool NOT NULL,
    is_called bool NOT NULL
)
CREATE TABLE loans
(
    id int PRIMARY KEY NOT NULL,
    identifier varchar(255),
    amount_requested int,
    purpose varchar(255),
    description text,
    grade varchar(255),
    interest_rate numeric(19),
    months int,
    monthly_payment numeric(19),
    first_payment_due_on date,
    funding_received numeric(19),
    review_status varchar(255),
    loan_status varchar(255),
    submitted_at timestamp,
    listing_expires_at timestamp,
    borrower_id int,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    apr numeric(19),
    sub_grade varchar(255),
    accepted_at timestamp,
    listed_at timestamp,
    issued_at timestamp,
    loan_status_on date,
    review_status_on date
)
CREATE TABLE loans_id_seq
(
    sequence_name text NOT NULL,
    last_value bigint NOT NULL,
    start_value bigint NOT NULL,
    increment_by bigint NOT NULL,
    max_value bigint NOT NULL,
    min_value bigint NOT NULL,
    cache_value bigint NOT NULL,
    log_cnt bigint NOT NULL,
    is_cycled bool NOT NULL,
    is_called bool NOT NULL
)
CREATE TABLE orders
(
    id int PRIMARY KEY NOT NULL,
    order_number varchar(255),
    ordered_on date,
    amount numeric(19),
    coupon_count int,
    interest_rate_weighted_avg numeric(19),
    in_funding_amount numeric(19),
    in_funding_coupon_count int,
    expired_amount numeric(19),
    expired_coupon_count int,
    issued_amount numeric(19),
    issued_coupon_count int,
    issued_interest_rate_weighted_avg numeric(19),
    investor_id int,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
)
CREATE TABLE orders_id_seq
(
    sequence_name text NOT NULL,
    last_value bigint NOT NULL,
    start_value bigint NOT NULL,
    increment_by bigint NOT NULL,
    max_value bigint NOT NULL,
    min_value bigint NOT NULL,
    cache_value bigint NOT NULL,
    log_cnt bigint NOT NULL,
    is_cycled bool NOT NULL,
    is_called bool NOT NULL
)
CREATE TABLE portfolios
(
    id int PRIMARY KEY NOT NULL,
    name varchar(255),
    coupon_count int,
    investment numeric(19),
    interest_rate_weighted_avg numeric(19),
    oustanding_principal numeric(19),
    payments_to_date numeric(19),
    expected_monthly_payments numeric(19),
    investor_id int,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
)
CREATE TABLE portfolios_id_seq
(
    sequence_name text NOT NULL,
    last_value bigint NOT NULL,
    start_value bigint NOT NULL,
    increment_by bigint NOT NULL,
    max_value bigint NOT NULL,
    min_value bigint NOT NULL,
    cache_value bigint NOT NULL,
    log_cnt bigint NOT NULL,
    is_cycled bool NOT NULL,
    is_called bool NOT NULL
)
CREATE TABLE rails_admin_histories
(
    id int PRIMARY KEY NOT NULL,
    message text,
    username varchar(255),
    item int,
    table varchar(255),
    month smallint,
    year bigint,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
);
CREATE INDEX index_rails_admin_histories ON rails_admin_histories ( item, "table", month, year )
CREATE TABLE rails_admin_histories_id_seq
(
    sequence_name text NOT NULL,
    last_value bigint NOT NULL,
    start_value bigint NOT NULL,
    increment_by bigint NOT NULL,
    max_value bigint NOT NULL,
    min_value bigint NOT NULL,
    cache_value bigint NOT NULL,
    log_cnt bigint NOT NULL,
    is_cycled bool NOT NULL,
    is_called bool NOT NULL
)
CREATE TABLE schema_migrations
(
    version varchar(255) NOT NULL
);
CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations ( version )
CREATE TABLE users
(
    id int PRIMARY KEY NOT NULL,
    email varchar(255) DEFAULT '' NOT NULL,
    encrypted_password varchar(255) DEFAULT '',
    reset_password_token varchar(255),
    reset_password_sent_at timestamp,
    remember_created_at timestamp,
    sign_in_count int DEFAULT 0,
    current_sign_in_at timestamp,
    last_sign_in_at timestamp,
    current_sign_in_ip varchar(255),
    last_sign_in_ip varchar(255),
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    name varchar(255),
    confirmation_token varchar(255),
    confirmed_at timestamp,
    confirmation_sent_at timestamp,
    unconfirmed_email varchar(255),
    invitation_token varchar(60),
    invitation_sent_at timestamp,
    invitation_accepted_at timestamp,
    invitation_limit int,
    invited_by_id int,
    invited_by_type varchar(255),
    role varchar(255)
);
CREATE UNIQUE INDEX index_users_on_email ON users ( email );
CREATE UNIQUE INDEX index_users_on_invitation_token ON users ( invitation_token );
CREATE UNIQUE INDEX index_users_on_reset_password_token ON users ( reset_password_token );
CREATE INDEX index_users_on_invited_by_id ON users ( invited_by_id )
CREATE TABLE users_id_seq
(
    sequence_name text NOT NULL,
    last_value bigint NOT NULL,
    start_value bigint NOT NULL,
    increment_by bigint NOT NULL,
    max_value bigint NOT NULL,
    min_value bigint NOT NULL,
    cache_value bigint NOT NULL,
    log_cnt bigint NOT NULL,
    is_cycled bool NOT NULL,
    is_called bool NOT NULL
)
CREATE TABLE versions
(
    id int PRIMARY KEY NOT NULL,
    item_type varchar(255) NOT NULL,
    item_id int NOT NULL,
    event varchar(255) NOT NULL,
    whodunnit varchar(255),
    object text,
    created_at timestamp
);
CREATE INDEX index_versions_on_item_type_and_item_id ON versions ( item_type, item_id )
CREATE TABLE versions_id_seq
(
    sequence_name text NOT NULL,
    last_value bigint NOT NULL,
    start_value bigint NOT NULL,
    increment_by bigint NOT NULL,
    max_value bigint NOT NULL,
    min_value bigint NOT NULL,
    cache_value bigint NOT NULL,
    log_cnt bigint NOT NULL,
    is_cycled bool NOT NULL,
    is_called bool NOT NULL
)
    interest_rate_weighted_avg numeric(19),
    oustanding_principal numeric(19),
    payments_to_date numeric(19),
    expected_monthly_payments numeric(19),
    investor_id int,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
)
CREATE TABLE portfolios_id_seq
(
    sequence_name text NOT NULL,
    last_value bigint NOT NULL,
    start_value bigint NOT NULL,
    increment_by bigint NOT NULL,
    max_value bigint NOT NULL,
    min_value bigint NOT NULL,
    cache_value bigint NOT NULL,
    log_cnt bigint NOT NULL,
    is_cycled bool NOT NULL,
    is_called bool NOT NULL
)
CREATE TABLE rails_admin_histories
(
    id int PRIMARY KEY NOT NULL,
    message text,
    username varchar(255),
    item int,
    table varchar(255),
    month smallint,
    year bigint,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL
);
CREATE INDEX index_rails_admin_histories ON rails_admin_histories ( item, "table", month, year )
CREATE TABLE rails_admin_histories_id_seq
(
    sequence_name text NOT NULL,
    last_value bigint NOT NULL,
    start_value bigint NOT NULL,
    increment_by bigint NOT NULL,
    max_value bigint NOT NULL,
    min_value bigint NOT NULL,
    cache_value bigint NOT NULL,
    log_cnt bigint NOT NULL,
    is_cycled bool NOT NULL,
    is_called bool NOT NULL
)
CREATE TABLE schema_migrations
(
    version varchar(255) NOT NULL
);
CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations ( version )
CREATE TABLE users
(
    id int PRIMARY KEY NOT NULL,
    email varchar(255) DEFAULT '' NOT NULL,
    encrypted_password varchar(255) DEFAULT '',
    reset_password_token varchar(255),
    reset_password_sent_at timestamp,
    remember_created_at timestamp,
    sign_in_count int DEFAULT 0,
    current_sign_in_at timestamp,
    last_sign_in_at timestamp,
    current_sign_in_ip varchar(255),
    last_sign_in_ip varchar(255),
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    name varchar(255),
    confirmation_token varchar(255),
    confirmed_at timestamp,
    confirmation_sent_at timestamp,
    unconfirmed_email varchar(255),
    invitation_token varchar(60),
    invitation_sent_at timestamp,
    invitation_accepted_at timestamp,
    invitation_limit int,
    invited_by_id int,
    invited_by_type varchar(255),
    role varchar(255)
);
CREATE UNIQUE INDEX index_users_on_email ON users ( email );
CREATE UNIQUE INDEX index_users_on_invitation_token ON users ( invitation_token );
CREATE UNIQUE INDEX index_users_on_reset_password_token ON users ( reset_password_token );
CREATE INDEX index_users_on_invited_by_id ON users ( invited_by_id )
CREATE TABLE users_id_seq
(
    sequence_name text NOT NULL,
    last_value bigint NOT NULL,
    start_value bigint NOT NULL,
    increment_by bigint NOT NULL,
    max_value bigint NOT NULL,
    min_value bigint NOT NULL,
    cache_value bigint NOT NULL,
    log_cnt bigint NOT NULL,
    is_cycled bool NOT NULL,
    is_called bool NOT NULL
)
CREATE TABLE versions
(
    id int PRIMARY KEY NOT NULL,
    item_type varchar(255) NOT NULL,
    item_id int NOT NULL,
    event varchar(255) NOT NULL,
    whodunnit varchar(255),
    object text,
    created_at timestamp
);
CREATE INDEX index_versions_on_item_type_and_item_id ON versions ( item_type, item_id )
CREATE TABLE versions_id_seq
(
    sequence_name text NOT NULL,
    last_value bigint NOT NULL,
    start_value bigint NOT NULL,
    increment_by bigint NOT NULL,
    max_value bigint NOT NULL,
    min_value bigint NOT NULL,
    cache_value bigint NOT NULL,
    log_cnt bigint NOT NULL,
    is_cycled bool NOT NULL,
    is_called bool NOT NULL
)
