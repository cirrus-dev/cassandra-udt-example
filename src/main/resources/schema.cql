CREATE KEYSPACE umv WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'};

CREATE TYPE umv.entitlement (
    name text,
    start_date timestamp,
    end_date timestamp
);

CREATE TABLE umv.household_entitlement (
    household_id text,
    provider text,
    entitlement frozen<entitlement>,
    PRIMARY KEY ((household_id, provider))
);

INSERT INTO household_entitlement(household_id, provider , entitlement ) values ('household', 'provider', {name: 'ENTS', start_date: 1, end_date: 2});