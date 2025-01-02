create table cache
(
    `key`      varchar(255) not null
        primary key,
    value      mediumtext   not null,
    expiration int          not null
)
    collate = utf8mb4_unicode_ci;

create table cache_locks
(
    `key`      varchar(255) not null
        primary key,
    owner      varchar(255) not null,
    expiration int          not null
)
    collate = utf8mb4_unicode_ci;

create table departmanlar
(
    id         bigint unsigned auto_increment
        primary key,
    ad         varchar(255) not null,
    aciklama   text         null,
    created_at timestamp    null,
    updated_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table failed_jobs
(
    id         bigint unsigned auto_increment
        primary key,
    uuid       varchar(255)                          not null,
    connection text                                  not null,
    queue      text                                  not null,
    payload    longtext                              not null,
    exception  longtext                              not null,
    failed_at  timestamp default current_timestamp() not null,
    constraint failed_jobs_uuid_unique
        unique (uuid)
)
    collate = utf8mb4_unicode_ci;

create table hizmet_kategoris
(
    id         bigint unsigned auto_increment
        primary key,
    name       varchar(255) not null,
    parent_id  varchar(255) null,
    created_at timestamp    null,
    updated_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table hizmet_bilgis
(
    id                 bigint unsigned auto_increment
        primary key,
    hizmet_kategori_id bigint unsigned                 not null,
    title              varchar(255)                    not null,
    description        text                            not null,
    author             varchar(255) default 'Belediye' null,
    created_at         timestamp                       null,
    updated_at         timestamp                       null,
    constraint hizmet_bilgis_hizmet_kategori_id_foreign
        foreign key (hizmet_kategori_id) references hizmet_kategoris (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table job_batches
(
    id             varchar(255) not null
        primary key,
    name           varchar(255) not null,
    total_jobs     int          not null,
    pending_jobs   int          not null,
    failed_jobs    int          not null,
    failed_job_ids longtext     not null,
    options        mediumtext   null,
    cancelled_at   int          null,
    created_at     int          not null,
    finished_at    int          null
)
    collate = utf8mb4_unicode_ci;

create table jobs
(
    id           bigint unsigned auto_increment
        primary key,
    queue        varchar(255)     not null,
    payload      longtext         not null,
    attempts     tinyint unsigned not null,
    reserved_at  int unsigned     null,
    available_at int unsigned     not null,
    created_at   int unsigned     not null
)
    collate = utf8mb4_unicode_ci;

create index jobs_queue_index
    on jobs (queue);

create table kalite_kategori
(
    id         bigint unsigned auto_increment
        primary key,
    name       varchar(255) not null,
    created_at timestamp    null,
    updated_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table kalite_bilgi
(
    id          bigint unsigned auto_increment
        primary key,
    kategori_id bigint unsigned not null,
    location    varchar(255)    not null,
    aciklama    text            not null,
    created_at  timestamp       null,
    updated_at  timestamp       null,
    constraint kalite_bilgi_kategori_id_foreign
        foreign key (kategori_id) references kalite_kategori (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table migrations
(
    id        int unsigned auto_increment
        primary key,
    migration varchar(255) not null,
    batch     int          not null
)
    collate = utf8mb4_unicode_ci;

create table onerilers
(
    id         bigint unsigned auto_increment
        primary key,
    baslik     varchar(255) not null,
    icerik     text         not null,
    created_at timestamp    null,
    updated_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table password_reset_tokens
(
    email      varchar(255) not null
        primary key,
    token      varchar(255) not null,
    created_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table role
(
    id         bigint unsigned auto_increment
        primary key,
    rol_adi    varchar(255) not null,
    created_at timestamp    null,
    updated_at timestamp    null,
    constraint role_rol_adi_unique
        unique (rol_adi)
)
    collate = utf8mb4_unicode_ci;

create table sakinler_bilgis
(
    id         bigint unsigned auto_increment
        primary key,
    ad         varchar(255) not null,
    soyad      varchar(255) not null,
    telefon    varchar(255) null,
    email      varchar(255) null,
    adres      text         null,
    resim      varchar(255) null,
    created_at timestamp    null,
    updated_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table sessions
(
    id            varchar(255)    not null
        primary key,
    user_id       bigint unsigned null,
    ip_address    varchar(45)     null,
    user_agent    text            null,
    payload       longtext        not null,
    last_activity int             not null
)
    collate = utf8mb4_unicode_ci;

create index sessions_last_activity_index
    on sessions (last_activity);

create index sessions_user_id_index
    on sessions (user_id);

create table users
(
    id                        bigint unsigned auto_increment
        primary key,
    name                      varchar(255)    not null,
    email                     varchar(255)    not null,
    role_id                   bigint unsigned null,
    email_verified_at         timestamp       null,
    password                  varchar(255)    not null,
    two_factor_secret         text            null,
    two_factor_recovery_codes text            null,
    two_factor_confirmed_at   timestamp       null,
    remember_token            varchar(100)    null,
    created_at                timestamp       null,
    updated_at                timestamp       null,
    constraint users_email_unique
        unique (email),
    constraint users_role_id_foreign
        foreign key (role_id) references role (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table calisanlar
(
    id           bigint unsigned auto_increment
        primary key,
    ad           varchar(255)    not null,
    soyad        varchar(255)    not null,
    departman_id bigint unsigned not null,
    user_id      bigint unsigned not null,
    pozisyon     varchar(255)    not null,
    eposta       varchar(255)    not null,
    telefon      varchar(255)    null,
    created_at   timestamp       null,
    updated_at   timestamp       null,
    constraint calisanlar_eposta_unique
        unique (eposta),
    constraint calisanlar_departman_id_foreign
        foreign key (departman_id) references departmanlar (id)
            on delete cascade,
    constraint calisanlar_user_id_foreign
        foreign key (user_id) references users (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table giriskayitlari
(
    id           bigint unsigned auto_increment
        primary key,
    user_id      bigint unsigned                       not null,
    created_at   timestamp                             null,
    updated_at   timestamp                             null,
    giris_zamani timestamp default current_timestamp() not null,
    constraint giriskayitlari_user_id_foreign
        foreign key (user_id) references users (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table sikayetler
(
    id            bigint unsigned auto_increment
        primary key,
    user_id       bigint unsigned                             not null,
    sikayet_metni text                                        not null,
    durum         enum ('Beklemede', 'Cozuldu', 'Reddedildi') not null,
    created_at    timestamp                                   null,
    updated_at    timestamp                                   null,
    constraint sikayetler_user_id_foreign
        foreign key (user_id) references users (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table vatandas_geri_bildirimleris
(
    id         bigint unsigned auto_increment
        primary key,
    name       varchar(255) not null,
    feedback   text         not null,
    created_at timestamp    null,
    updated_at timestamp    null
)
    collate = utf8mb4_unicode_ci;


