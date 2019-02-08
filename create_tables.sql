create table billing_plan (
	code varchar(50),
	name varchar(100),
	period enum ('monthly', 'yearly'),
	fee int
);

create table merchants (
	sk_id int unsigned not null autoincrement primary key,
	name varchar(100),
	contact_name varchar(100),
	contact_phone varchar(50),
	street varchar(100),
	city varchar(100),
	zip varchar(5),
	state varchar(2),
	billing_code varchar(50),
	key (street),
	key (city),
	key (zip),
	key (state)
);

create table shoppers (
	id int unsigned not null auto_increment primary key,
	name varchar(100),
	email varchar(100),
	street varchar(100),
	city varchar(100),
	zip varchar(5),
	state varchar(2),
	merchant_id int,
	constraint foreign key (merchant_id) references merchants (id) on delete cascade	
);
