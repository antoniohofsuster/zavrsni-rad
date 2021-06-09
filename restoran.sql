DROP database IF EXISTS restoran;
create database restoran;
use restoran;


create table hrana (

	šifra int primary key auto_increment not null,
	naziv varchar(50) not null,
	kategorije int not null,
	količina int not null,
	fotografija varchar(50) not null,
	opis text not NULL,
	cijena decimal(18.2) not null,
	dostupan boolean
);
create table narudzbe (

	šifra int primary key auto_increment not null,
	broj_računa varchar(50) not null,
	količina varchar(50) not null,
	status varchar(50) not null,
	datum date not null,
	kupci int
	
);
create table prodano (

	narudzbe int,
	količina int,
	hrana int,
	cijena decimal(18,2)

);
create table kupci (

	šifra int primary key auto_increment not null,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	adresa varchar(50) not null,
	email varchar(50) 
	
);
create table kategorije (

	šifra int primary key auto_increment not null,
	naziv varchar(50)

);
create table ocjena (

	kupci int,
	hrana int,
	ocjena int(1)

);
create table komentari (

	kupci int,
	hrana int,
	komentari text
	
);

alter table narudzbe add foreign key (kupci) references kupci(šifra);

alter table hrana add foreign key (kategorije) references kategorije(šifra);

alter table komentari add foreign key (hrana) references hrana(šifra);
alter table komentari add foreign key (kupci) references kupci(šifra);

alter table ocjena add foreign key (hrana) references hrana(šifra);
alter table ocjena add foreign key (kupci) references kupci(šifra);

alter table prodano add foreign key (narudzbe) references narudzbe(šifra);
alter table prodano add foreign key (hrana) references hrana(šifra);
