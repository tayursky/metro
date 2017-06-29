-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE TABLE "account_emailaddress" ---------------------
-- CREATE TABLE "account_emailaddress" -------------------------
CREATE TABLE `account_emailaddress` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`email` VarChar( 254 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`verified` TinyInt( 1 ) NOT NULL,
	`primary` TinyInt( 1 ) NOT NULL,
	`user_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `email` UNIQUE( `email` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "account_emailconfirmation" ----------------
-- CREATE TABLE "account_emailconfirmation" --------------------
CREATE TABLE `account_emailconfirmation` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`created` DateTime NOT NULL,
	`sent` DateTime NULL,
	`key` VarChar( 64 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`email_address_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `key` UNIQUE( `key` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "auth_group" -------------------------------
-- CREATE TABLE "auth_group" -----------------------------------
CREATE TABLE `auth_group` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 80 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `name` UNIQUE( `name` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "auth_group_permissions" -------------------
-- CREATE TABLE "auth_group_permissions" -----------------------
CREATE TABLE `auth_group_permissions` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`group_id` Int( 11 ) NOT NULL,
	`permission_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` UNIQUE( `group_id`, `permission_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "auth_permission" --------------------------
-- CREATE TABLE "auth_permission" ------------------------------
CREATE TABLE `auth_permission` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`content_type_id` Int( 11 ) NOT NULL,
	`codename` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `auth_permission_content_type_id_codename_01ab375a_uniq` UNIQUE( `content_type_id`, `codename` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 73;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "auth_user" --------------------------------
-- CREATE TABLE "auth_user" ------------------------------------
CREATE TABLE `auth_user` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`password` VarChar( 128 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`last_login` DateTime NULL,
	`is_superuser` TinyInt( 1 ) NOT NULL,
	`username` VarChar( 150 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`first_name` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`last_name` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`email` VarChar( 254 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`is_staff` TinyInt( 1 ) NOT NULL,
	`is_active` TinyInt( 1 ) NOT NULL,
	`date_joined` DateTime NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `username` UNIQUE( `username` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "auth_user_groups" -------------------------
-- CREATE TABLE "auth_user_groups" -----------------------------
CREATE TABLE `auth_user_groups` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`user_id` Int( 11 ) NOT NULL,
	`group_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `auth_user_groups_user_id_group_id_94350c0c_uniq` UNIQUE( `user_id`, `group_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "auth_user_user_permissions" ---------------
-- CREATE TABLE "auth_user_user_permissions" -------------------
CREATE TABLE `auth_user_user_permissions` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`user_id` Int( 11 ) NOT NULL,
	`permission_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` UNIQUE( `user_id`, `permission_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "black_list" -------------------------------
-- CREATE TABLE "black_list" -----------------------------------
CREATE TABLE `black_list` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`tel` VarChar( 20 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`text` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`data` DateTime NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "cian" -------------------------------------
-- CREATE TABLE "cian" -----------------------------------------
CREATE TABLE `cian` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`login` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`password` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`tel` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "client" -----------------------------------
-- CREATE TABLE "client" ---------------------------------------
CREATE TABLE `client` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`tel` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`email` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`hide` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`hide_date` Date NULL,
	`area_ot` Int( 11 ) NOT NULL,
	`area_do` Int( 11 ) NOT NULL,
	`price_obsh` Int( 11 ) NOT NULL,
	`price_m` Int( 11 ) NOT NULL,
	`dop_kont` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`metro` TinyInt( 1 ) NOT NULL,
	`adres` TinyInt( 1 ) NOT NULL,
	`komisiya` TinyInt( 1 ) NOT NULL,
	`etaj` TinyInt( 1 ) NOT NULL,
	`podborka` TinyInt( 1 ) NOT NULL,
	`type_obj` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`my_manager_id` Int( 11 ) NOT NULL,
	`naznach_one_id` Int( 11 ) NOT NULL,
	`naznach_two_id` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "client_okrug" -----------------------------
-- CREATE TABLE "client_okrug" ---------------------------------
CREATE TABLE `client_okrug` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`client_id` Int( 11 ) NOT NULL,
	`okrug_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `client_okrug_client_id_okrug_id_1fb4d33b_uniq` UNIQUE( `client_id`, `okrug_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "contact" ----------------------------------
-- CREATE TABLE "contact" --------------------------------------
CREATE TABLE `contact` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`tel` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`email` VarChar( 70 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`message` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`data` DateTime NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "django_admin_log" -------------------------
-- CREATE TABLE "django_admin_log" -----------------------------
CREATE TABLE `django_admin_log` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`action_time` DateTime NOT NULL,
	`object_id` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`object_repr` VarChar( 200 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`action_flag` Smallint( 5 ) UNSIGNED NOT NULL,
	`change_message` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`content_type_id` Int( 11 ) NULL,
	`user_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 39;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "django_content_type" ----------------------
-- CREATE TABLE "django_content_type" --------------------------
CREATE TABLE `django_content_type` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`app_label` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`model` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `django_content_type_app_label_model_76bd3d3b_uniq` UNIQUE( `app_label`, `model` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 25;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "django_migrations" ------------------------
-- CREATE TABLE "django_migrations" ----------------------------
CREATE TABLE `django_migrations` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`app` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`applied` DateTime NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 28;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "django_session" ---------------------------
-- CREATE TABLE "django_session" -------------------------------
CREATE TABLE `django_session` ( 
	`session_key` VarChar( 40 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`session_data` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`expire_date` DateTime NOT NULL,
	PRIMARY KEY ( `session_key` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "django_site" ------------------------------
-- CREATE TABLE "django_site" ----------------------------------
CREATE TABLE `django_site` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`domain` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`name` VarChar( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `django_site_domain_a2e37b91_uniq` UNIQUE( `domain` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "manager_options" --------------------------
-- CREATE TABLE "manager_options" ------------------------------
CREATE TABLE `manager_options` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 20 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`tel` VarChar( 20 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`tel_vlad` TinyInt( 1 ) NOT NULL,
	`del_obj` TinyInt( 1 ) NOT NULL,
	`edit_obj` TinyInt( 1 ) NOT NULL,
	`look` TinyInt( 1 ) NOT NULL,
	`user_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `user_id` UNIQUE( `user_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "metro" ------------------------------------
-- CREATE TABLE "metro" ----------------------------------------
CREATE TABLE `metro` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`color` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`name` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "metro_okrug" ------------------------------
-- CREATE TABLE "metro_okrug" ----------------------------------
CREATE TABLE `metro_okrug` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`stancmetro_id` Int( 11 ) NOT NULL,
	`okrug_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `metro_okrug_stancmetro_id_okrug_id_19f018d2_uniq` UNIQUE( `stancmetro_id`, `okrug_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "myclient_historicalclient" ----------------
-- CREATE TABLE "myclient_historicalclient" --------------------
CREATE TABLE `myclient_historicalclient` ( 
	`id` Int( 11 ) NOT NULL,
	`name` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`tel` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`email` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`hide` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`hide_date` Date NULL,
	`area_ot` Int( 11 ) NOT NULL,
	`area_do` Int( 11 ) NOT NULL,
	`price_obsh` Int( 11 ) NOT NULL,
	`price_m` Int( 11 ) NOT NULL,
	`dop_kont` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`metro` TinyInt( 1 ) NOT NULL,
	`adres` TinyInt( 1 ) NOT NULL,
	`komisiya` TinyInt( 1 ) NOT NULL,
	`etaj` TinyInt( 1 ) NOT NULL,
	`podborka` TinyInt( 1 ) NOT NULL,
	`type_obj` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`history_id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`history_date` DateTime NOT NULL,
	`history_change_reason` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`history_type` VarChar( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`history_user_id` Int( 11 ) NULL,
	`my_manager_id` Int( 11 ) NULL,
	`naznach_one_id` Int( 11 ) NULL,
	`naznach_two_id` Int( 11 ) NULL,
	`change_message` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `history_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "myobject_historicalmyobject" --------------
-- CREATE TABLE "myobject_historicalmyobject" ------------------
CREATE TABLE `myobject_historicalmyobject` ( 
	`id` Int( 11 ) NOT NULL,
	`typeobj` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`adres` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`area` Int( 11 ) NOT NULL,
	`block_area` Double( 22, 0 ) NOT NULL,
	`block_price` Double( 22, 0 ) NOT NULL,
	`block_procent` Double( 22, 0 ) NOT NULL,
	`etaj` Int( 11 ) NOT NULL,
	`price` Int( 11 ) NOT NULL,
	`opis` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`dom` TinyInt( 1 ) NOT NULL,
	`kvt` VarChar( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`dogovor` VarChar( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`block_name` VarChar( 20 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`block_tel` VarChar( 20 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`block_email` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`silka` VarChar( 200 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`zametka` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`hide` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`hide_date` Date NULL,
	`zvon` Date NOT NULL,
	`history_id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`history_date` DateTime NOT NULL,
	`history_change_reason` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`history_type` VarChar( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`history_user_id` Int( 11 ) NULL,
	`my_manager_id` Int( 11 ) NULL,
	`station_one_id` Int( 11 ) NULL,
	`station_two_id` Int( 11 ) NULL,
	`change_message` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `history_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 10;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "naznach" ----------------------------------
-- CREATE TABLE "naznach" --------------------------------------
CREATE TABLE `naznach` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`group` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`options` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 25;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "object" -----------------------------------
-- CREATE TABLE "object" ---------------------------------------
CREATE TABLE `object` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`typeobj` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`adres` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`area` Int( 11 ) NOT NULL,
	`block_area` Double( 22, 0 ) NOT NULL,
	`block_price` Double( 22, 0 ) NOT NULL,
	`block_procent` Double( 22, 0 ) NOT NULL,
	`etaj` Int( 11 ) NOT NULL,
	`price` Int( 11 ) NOT NULL,
	`opis` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`dom` TinyInt( 1 ) NOT NULL,
	`kvt` VarChar( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`dogovor` VarChar( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`block_name` VarChar( 20 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`block_tel` VarChar( 20 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`block_email` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`silka` VarChar( 200 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`zametka` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`hide` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`hide_date` Date NULL,
	`zvon` Date NOT NULL,
	`my_manager_id` Int( 11 ) NOT NULL,
	`station_one_id` Int( 11 ) NOT NULL,
	`station_two_id` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "object_naznach" ---------------------------
-- CREATE TABLE "object_naznach" -------------------------------
CREATE TABLE `object_naznach` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`myobject_id` Int( 11 ) NOT NULL,
	`naznach_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `object_naznach_myobject_id_naznach_id_8d65e6bb_uniq` UNIQUE( `myobject_id`, `naznach_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 9;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "object_okrug" -----------------------------
-- CREATE TABLE "object_okrug" ---------------------------------
CREATE TABLE `object_okrug` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`myobject_id` Int( 11 ) NOT NULL,
	`okrug_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `object_okrug_myobject_id_okrug_id_5e901da1_uniq` UNIQUE( `myobject_id`, `okrug_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 8;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "okrug" ------------------------------------
-- CREATE TABLE "okrug" ----------------------------------------
CREATE TABLE `okrug` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`options` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 7;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "photo_baza" -------------------------------
-- CREATE TABLE "photo_baza" -----------------------------------
CREATE TABLE `photo_baza` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`image` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`is_main` TinyInt( 1 ) NOT NULL,
	`is_active` TinyInt( 1 ) NOT NULL,
	`created` DateTime NOT NULL,
	`station_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 14;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "prioritet" --------------------------------
-- CREATE TABLE "prioritet" ------------------------------------
CREATE TABLE `prioritet` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`prioritet` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`num` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "seo" --------------------------------------
-- CREATE TABLE "seo" ------------------------------------------
CREATE TABLE `seo` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`title` VarChar( 200 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`desc` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`keywords` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "task_client" ------------------------------
-- CREATE TABLE "task_client" ----------------------------------
CREATE TABLE `task_client` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`date` Date NOT NULL,
	`task` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`end` TinyInt( 1 ) NOT NULL,
	`client_id` Int( 11 ) NOT NULL,
	`manager_id` Int( 11 ) NOT NULL,
	`prioritet_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "account_emailaddress" ---------------------
-- ---------------------------------------------------------


-- Dump data of "account_emailconfirmation" ----------------
-- ---------------------------------------------------------


-- Dump data of "auth_group" -------------------------------
-- ---------------------------------------------------------


-- Dump data of "auth_group_permissions" -------------------
-- ---------------------------------------------------------


-- Dump data of "auth_permission" --------------------------
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '1', 'Can add log entry', '1', 'add_logentry' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '2', 'Can change log entry', '1', 'change_logentry' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '3', 'Can delete log entry', '1', 'delete_logentry' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '4', 'Can add permission', '2', 'add_permission' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '5', 'Can change permission', '2', 'change_permission' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '6', 'Can delete permission', '2', 'delete_permission' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '7', 'Can add user', '3', 'add_user' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '8', 'Can change user', '3', 'change_user' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '9', 'Can delete user', '3', 'delete_user' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '10', 'Can add group', '4', 'add_group' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '11', 'Can change group', '4', 'change_group' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '12', 'Can delete group', '4', 'delete_group' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '13', 'Can add content type', '5', 'add_contenttype' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '14', 'Can change content type', '5', 'change_contenttype' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '15', 'Can delete content type', '5', 'delete_contenttype' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '16', 'Can add session', '6', 'add_session' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '17', 'Can change session', '6', 'change_session' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '18', 'Can delete session', '6', 'delete_session' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '19', 'Can add site', '7', 'add_site' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '20', 'Can change site', '7', 'change_site' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '21', 'Can delete site', '7', 'delete_site' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '22', 'Can add email address', '8', 'add_emailaddress' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '23', 'Can change email address', '8', 'change_emailaddress' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '24', 'Can delete email address', '8', 'delete_emailaddress' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '25', 'Can add email confirmation', '9', 'add_emailconfirmation' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '26', 'Can change email confirmation', '9', 'change_emailconfirmation' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '27', 'Can delete email confirmation', '9', 'delete_emailconfirmation' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '28', 'Can add historical Клиент', '10', 'add_historicalclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '29', 'Can change historical Клиент', '10', 'change_historicalclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '30', 'Can delete historical Клиент', '10', 'delete_historicalclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '31', 'Can add Приоритет', '11', 'add_prioritet' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '32', 'Can change Приоритет', '11', 'change_prioritet' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '33', 'Can delete Приоритет', '11', 'delete_prioritet' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '34', 'Can add Задача клиента', '12', 'add_taskclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '35', 'Can change Задача клиента', '12', 'change_taskclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '36', 'Can delete Задача клиента', '12', 'delete_taskclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '37', 'Can add Клиент', '13', 'add_client' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '38', 'Can change Клиент', '13', 'change_client' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '39', 'Can delete Клиент', '13', 'delete_client' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '40', 'Can add Назначение', '14', 'add_naznach' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '41', 'Can change Назначение', '14', 'change_naznach' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '42', 'Can delete Назначение', '14', 'delete_naznach' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '43', 'Can add Округ', '15', 'add_okrug' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '44', 'Can change Округ', '15', 'change_okrug' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '45', 'Can delete Округ', '15', 'delete_okrug' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '46', 'Can add historical Объект', '16', 'add_historicalmyobject' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '47', 'Can change historical Объект', '16', 'change_historicalmyobject' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '48', 'Can delete historical Объект', '16', 'delete_historicalmyobject' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '49', 'Can add Объект', '17', 'add_myobject' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '50', 'Can change Объект', '17', 'change_myobject' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '51', 'Can delete Объект', '17', 'delete_myobject' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '52', 'Can add Стация метро', '18', 'add_stancmetro' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '53', 'Can change Стация метро', '18', 'change_stancmetro' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '54', 'Can delete Стация метро', '18', 'delete_stancmetro' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '55', 'Can add Настроки прав', '19', 'add_menageroptions' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '56', 'Can change Настроки прав', '19', 'change_menageroptions' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '57', 'Can delete Настроки прав', '19', 'delete_menageroptions' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '58', 'Can add Настройки циан', '20', 'add_cian' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '59', 'Can change Настройки циан', '20', 'change_cian' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '60', 'Can delete Настройки циан', '20', 'delete_cian' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '61', 'Can add Настрока сайта\\SEO', '21', 'add_seo' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '62', 'Can change Настрока сайта\\SEO', '21', 'change_seo' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '63', 'Can delete Настрока сайта\\SEO', '21', 'delete_seo' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '64', 'Can add Обратная связь', '22', 'add_contact' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '65', 'Can change Обратная связь', '22', 'change_contact' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '66', 'Can delete Обратная связь', '22', 'delete_contact' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '67', 'Can add Черный список', '23', 'add_blacklist' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '68', 'Can change Черный список', '23', 'change_blacklist' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '69', 'Can delete Черный список', '23', 'delete_blacklist' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '70', 'Can add Фото база', '24', 'add_photo' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '71', 'Can change Фото база', '24', 'change_photo' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '72', 'Can delete Фото база', '24', 'delete_photo' );
-- ---------------------------------------------------------


-- Dump data of "auth_user" --------------------------------
INSERT INTO `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) VALUES ( '1', 'pbkdf2_sha256$36000$nB8s4T9SRYER$iuNJ0JkYBeXDjQLafbhFEAUlybxGTBLPUSvVmIMiM9M=', '2017-06-26 21:27:32.518138', '1', 'DJWOMS', '', '', 'socanime@gmail.com', '1', '1', '2017-06-22 09:51:28.029187' );
-- ---------------------------------------------------------


-- Dump data of "auth_user_groups" -------------------------
-- ---------------------------------------------------------


-- Dump data of "auth_user_user_permissions" ---------------
-- ---------------------------------------------------------


-- Dump data of "black_list" -------------------------------
-- ---------------------------------------------------------


-- Dump data of "cian" -------------------------------------
-- ---------------------------------------------------------


-- Dump data of "client" -----------------------------------
INSERT INTO `client`(`id`,`name`,`tel`,`email`,`hide`,`hide_date`,`area_ot`,`area_do`,`price_obsh`,`price_m`,`dop_kont`,`metro`,`adres`,`komisiya`,`etaj`,`podborka`,`type_obj`,`my_manager_id`,`naznach_one_id`,`naznach_two_id`) VALUES ( '1', 'Михаил Омельчекно', '+380957506112', 'socanime@gmail.com', '', NULL, '0', '0', '0', '0', 'вавапав', '0', '0', '0', '1', '0', 'undeg', '1', '1', '1' );
-- ---------------------------------------------------------


-- Dump data of "client_okrug" -----------------------------
INSERT INTO `client_okrug`(`id`,`client_id`,`okrug_id`) VALUES ( '1', '1', '4' );
INSERT INTO `client_okrug`(`id`,`client_id`,`okrug_id`) VALUES ( '2', '1', '6' );
-- ---------------------------------------------------------


-- Dump data of "contact" ----------------------------------
INSERT INTO `contact`(`id`,`name`,`tel`,`email`,`message`,`data`) VALUES ( '1', 'Михаил Омельчекно', '+380957506112', 'socanime@gmail.com', 'Тестовоесообщение', '2017-06-26 11:14:49.872807' );
-- ---------------------------------------------------------


-- Dump data of "django_admin_log" -------------------------
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '1', '2017-06-22 09:52:36.015524', '1', 'Север', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '2', '2017-06-22 09:52:42.251681', '2', 'Юг', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '3', '2017-06-22 09:52:46.693843', '3', 'Восток', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '4', '2017-06-22 09:52:50.419936', '4', 'Запад', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '5', '2017-06-22 09:52:56.209053', '5', 'Центр', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '6', '2017-06-22 09:53:03.071173', '6', 'Область', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '7', '2017-06-22 10:12:48.245111', '1', 'Электрозаводская', '1', '[{"added": {}}]', '16', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '8', '2017-06-22 10:13:25.196512', '1', 'Колбаса', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '9', '2017-06-22 10:14:22.391156', '1', 'Михаил Омельчекно', '2', '[{"changed": {"fields": ["hide"]}}]', '11', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '10', '2017-06-22 10:14:37.603557', '1', 'Михаил Омельчекно', '2', '[{"changed": {"fields": ["hide"]}}]', '11', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '11', '2017-06-22 10:16:35.813060', '1', 'Москва', '1', '[{"added": {}}]', '17', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '12', '2017-06-22 10:16:46.441379', '1', 'Москва', '2', '[{"changed": {"fields": ["opis"]}}]', '17', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '13', '2017-06-22 10:16:57.803777', '1', 'Москва', '2', '[]', '17', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '14', '2017-06-22 10:17:45.304625', '2', 'Молоко', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '15', '2017-06-22 10:17:53.198884', '3', 'Табак', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '16', '2017-06-22 10:18:00.433113', '4', 'Кондитерка', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '17', '2017-06-22 10:18:05.582263', '5', 'Мясо', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '18', '2017-06-22 10:18:10.826432', '6', 'Фрукты\\Овощи', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '19', '2017-06-22 10:18:18.664649', '7', 'Кулинария', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '20', '2017-06-22 10:18:27.338869', '8', 'Пиво\\Алкоголь', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '21', '2017-06-22 10:18:31.123965', '9', 'Хлеб', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '22', '2017-06-22 10:18:45.049242', '10', 'Магазин продуктов', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '23', '2017-06-22 10:18:54.923471', '11', 'Рыба\\Икра', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '24', '2017-06-22 10:19:01.626675', '12', 'Чай и другое', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '25', '2017-06-22 10:19:13.305970', '13', 'Выпечка и подобное', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '26', '2017-06-22 10:19:20.977189', '14', 'Кофе с собой', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '27', '2017-06-22 10:19:28.393424', '15', 'Рестораны и другое', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '28', '2017-06-22 10:19:36.290642', '16', 'Шаурма\\Тандыр', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '29', '2017-06-22 10:19:45.305890', '17', 'Аптека\\Оптика', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '30', '2017-06-22 10:19:53.225109', '18', 'Офис\\Мед. Услуги\\Салон кр.', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '31', '2017-06-22 10:20:02.264353', '19', 'Другое', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '32', '2017-06-22 10:20:07.008488', '20', 'Промтовары', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '33', '2017-06-22 10:20:18.993775', '21', 'Ломбард\\Банк. Услуги', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '34', '2017-06-22 10:20:28.847010', '22', 'Ремонт\\Быт. Услуги', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '35', '2017-06-22 10:20:33.903153', '23', 'Одежда\\Обувь', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '36', '2017-06-22 10:20:41.085350', '24', 'Цветы', '1', '[{"added": {}}]', '12', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '37', '2017-06-22 10:21:30.437451', '2', 'Тушинская', '1', '[{"added": {}}]', '16', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '38', '2017-06-27 05:58:29.137017', '4', 'dsffdfds', '1', '[{"added": {}}]', '17', '1' );
-- ---------------------------------------------------------


-- Dump data of "django_content_type" ----------------------
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '8', 'account', 'emailaddress' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '9', 'account', 'emailconfirmation' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '1', 'admin', 'logentry' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '4', 'auth', 'group' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '2', 'auth', 'permission' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '3', 'auth', 'user' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '23', 'black_list', 'blacklist' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '22', 'contactform', 'contact' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '5', 'contenttypes', 'contenttype' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '13', 'myclient', 'client' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '10', 'myclient', 'historicalclient' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '14', 'myclient', 'naznach' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '15', 'myclient', 'okrug' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '11', 'myclient', 'prioritet' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '12', 'myclient', 'taskclient' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '16', 'myobject', 'historicalmyobject' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '17', 'myobject', 'myobject' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '18', 'myobject', 'stancmetro' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '24', 'photo_baza', 'photo' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '20', 'seo', 'cian' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '19', 'seo', 'menageroptions' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '21', 'seo', 'seo' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '6', 'sessions', 'session' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '7', 'sites', 'site' );
-- ---------------------------------------------------------


-- Dump data of "django_migrations" ------------------------
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '1', 'contenttypes', '0001_initial', '2017-06-25 17:42:12.317467' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '2', 'auth', '0001_initial', '2017-06-25 17:42:21.546799' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '3', 'account', '0001_initial', '2017-06-25 17:42:24.255898' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '4', 'account', '0002_email_max_length', '2017-06-25 17:42:25.019936' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '5', 'admin', '0001_initial', '2017-06-25 17:42:27.322012' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '6', 'admin', '0002_logentry_remove_auto_add', '2017-06-25 17:42:27.368013' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '7', 'contenttypes', '0002_remove_content_type_name', '2017-06-25 17:42:28.553052' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '8', 'auth', '0002_alter_permission_name_max_length', '2017-06-25 17:42:29.246088' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '9', 'auth', '0003_alter_user_email_max_length', '2017-06-25 17:42:30.072111' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '10', 'auth', '0004_alter_user_username_opts', '2017-06-25 17:42:30.120114' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '11', 'auth', '0005_alter_user_last_login_null', '2017-06-25 17:42:30.702144' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '12', 'auth', '0006_require_contenttypes_0002', '2017-06-25 17:42:30.737146' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '13', 'auth', '0007_alter_validators_add_error_messages', '2017-06-25 17:42:30.790147' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '14', 'auth', '0008_alter_user_username_max_length', '2017-06-25 17:42:31.443168' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '15', 'black_list', '0001_initial', '2017-06-25 17:42:31.661171' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '16', 'contactform', '0001_initial', '2017-06-25 17:42:31.886174' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '17', 'myclient', '0001_initial', '2017-06-25 17:42:46.560641' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '18', 'myclient', '0002_auto_20170623_2007', '2017-06-25 17:42:48.152697' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '19', 'myclient', '0003_historicalclient_change_message', '2017-06-25 17:42:49.093734' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '20', 'myobject', '0001_initial', '2017-06-25 17:43:05.513274' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '21', 'myobject', '0002_historicalmyobject_change_message', '2017-06-25 17:43:06.603325' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '22', 'photo_baza', '0001_initial', '2017-06-25 17:43:08.321423' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '23', 'seo', '0001_initial', '2017-06-25 17:43:12.507663' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '24', 'seo', '0002_cian', '2017-06-25 17:43:13.379712' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '25', 'sessions', '0001_initial', '2017-06-25 17:43:14.349768' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '26', 'sites', '0001_initial', '2017-06-25 17:43:15.218818' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '27', 'sites', '0002_alter_domain_unique', '2017-06-25 17:43:15.752848' );
-- ---------------------------------------------------------


-- Dump data of "django_session" ---------------------------
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( '1efyzw6671mdgtm8dksfvfoy2sh9j4yw', 'MTU4OTM3YmY3MjNhY2FiOTc1NTg1NWU3MzRlYzk5NzU5YmU1MTQ5Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIl9hdXRoX3VzZXJfaGFzaCI6Ijk2ZjIxZjVmNzJiNTJiYzMwYmY1ZDFmOTNmNDg3MjBkNzgwOWVmNWYifQ==', '2017-07-09 17:46:13.880516' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( '25y1enejbcdlk9yhr2t8y2l97uhcv7t5', 'OTE2MGZkZjc4MTk2Y2I1NjI0ZGQxNWRhZDVjZDc3OTY3YzY2MGUyMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk2ZjIxZjVmNzJiNTJiYzMwYmY1ZDFmOTNmNDg3MjBkNzgwOWVmNWYiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2017-07-10 21:27:32.583142' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'eji8ros69jvl1q7dy011culls2upeeq1', 'YzUzMDRkZDZmMTNiNzlmZWNlMzE5YzZhNmJiMDFlNTk5ZDEwZTNhMTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5NmYyMWY1ZjcyYjUyYmMzMGJmNWQxZjkzZjQ4NzIwZDc4MDllZjVmIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2017-07-10 10:48:56.781543' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'yp36ifbo8zbei13yq5we44m56xbxv84j', 'ZWY2ZTI2N2E3ZGNkMWVkOGM1YmExNjk3YjcyZTM0MGVlZDNjNTJkMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTZmMjFmNWY3MmI1MmJjMzBiZjVkMWY5M2Y0ODcyMGQ3ODA5ZWY1ZiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-07-06 09:51:44.959466' );
-- ---------------------------------------------------------


-- Dump data of "django_site" ------------------------------
INSERT INTO `django_site`(`id`,`domain`,`name`) VALUES ( '1', 'example.com', 'example.com' );
-- ---------------------------------------------------------


-- Dump data of "manager_options" --------------------------
INSERT INTO `manager_options`(`id`,`name`,`tel`,`tel_vlad`,`del_obj`,`edit_obj`,`look`,`user_id`) VALUES ( '1', 'DJWOMS', '', '0', '0', '0', '0', '1' );
-- ---------------------------------------------------------


-- Dump data of "metro" ------------------------------------
INSERT INTO `metro`(`id`,`color`,`name`) VALUES ( '1', 'Красная', 'Электрозаводская' );
INSERT INTO `metro`(`id`,`color`,`name`) VALUES ( '2', 'Зеленая', 'Тушинская' );
-- ---------------------------------------------------------


-- Dump data of "metro_okrug" ------------------------------
INSERT INTO `metro_okrug`(`id`,`stancmetro_id`,`okrug_id`) VALUES ( '1', '1', '1' );
INSERT INTO `metro_okrug`(`id`,`stancmetro_id`,`okrug_id`) VALUES ( '2', '2', '2' );
-- ---------------------------------------------------------


-- Dump data of "myclient_historicalclient" ----------------
INSERT INTO `myclient_historicalclient`(`id`,`name`,`tel`,`email`,`hide`,`hide_date`,`area_ot`,`area_do`,`price_obsh`,`price_m`,`dop_kont`,`metro`,`adres`,`komisiya`,`etaj`,`podborka`,`type_obj`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`history_user_id`,`my_manager_id`,`naznach_one_id`,`naznach_two_id`,`change_message`) VALUES ( '1', 'Михаил Омельчекно', '+380957506112', 'socanime@gmail.com', '0', NULL, '0', '0', '0', '0', '', '0', '0', '0', '1', '0', 'undeg', '1', '2017-06-22 10:13:45.750177', NULL, '+', '1', '1', '1', '1', '' );
INSERT INTO `myclient_historicalclient`(`id`,`name`,`tel`,`email`,`hide`,`hide_date`,`area_ot`,`area_do`,`price_obsh`,`price_m`,`dop_kont`,`metro`,`adres`,`komisiya`,`etaj`,`podborka`,`type_obj`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`history_user_id`,`my_manager_id`,`naznach_one_id`,`naznach_two_id`,`change_message`) VALUES ( '1', 'Михаил Омельчекно', '+380957506112', 'socanime@gmail.com', '0', NULL, '0', '0', '0', '0', 'вавапав', '0', '0', '0', '1', '0', 'undeg', '2', '2017-06-22 10:13:54.601467', NULL, '~', '1', '1', '1', '1', '' );
INSERT INTO `myclient_historicalclient`(`id`,`name`,`tel`,`email`,`hide`,`hide_date`,`area_ot`,`area_do`,`price_obsh`,`price_m`,`dop_kont`,`metro`,`adres`,`komisiya`,`etaj`,`podborka`,`type_obj`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`history_user_id`,`my_manager_id`,`naznach_one_id`,`naznach_two_id`,`change_message`) VALUES ( '1', 'Михаил Омельчекно', '+380957506112', 'socanime@gmail.com', '', NULL, '0', '0', '0', '0', '', '0', '0', '0', '1', '0', 'undeg', '3', '2017-06-22 10:14:22.350154', NULL, '~', '1', '1', '1', '1', '' );
INSERT INTO `myclient_historicalclient`(`id`,`name`,`tel`,`email`,`hide`,`hide_date`,`area_ot`,`area_do`,`price_obsh`,`price_m`,`dop_kont`,`metro`,`adres`,`komisiya`,`etaj`,`podborka`,`type_obj`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`history_user_id`,`my_manager_id`,`naznach_one_id`,`naznach_two_id`,`change_message`) VALUES ( '1', 'Михаил Омельчекно', '+380957506112', 'socanime@gmail.com', '', NULL, '0', '0', '0', '0', 'вавапав', '0', '0', '0', '1', '0', 'undeg', '4', '2017-06-22 10:14:37.500551', NULL, '~', '1', '1', '1', '1', '' );
-- ---------------------------------------------------------


-- Dump data of "myobject_historicalmyobject" --------------
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`,`change_message`) VALUES ( '1', '1', 'Москва', '0', '0', '0', '0', '0', '0', '', '0', '', '', '', '', '', '', '', '', NULL, '2017-06-22', '1', '2017-06-22 10:16:35.793059', NULL, '+', '1', '1', '1', NULL, '' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`,`change_message`) VALUES ( '1', '1', 'Москва', '0', '0', '0', '0', '0', '0', 'выавыавыа', '0', '', '', '', '', '', '', '', '', NULL, '2017-06-22', '2', '2017-06-22 10:16:46.258368', NULL, '~', '1', '1', '1', NULL, '' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`,`change_message`) VALUES ( '1', '1', 'Москва', '0', '0', '0', '0', '0', '0', '', '0', '', '', '', '', '', '', '', '', NULL, '2017-06-22', '3', '2017-06-22 10:16:57.757774', NULL, '~', '1', '1', '1', NULL, '' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`,`change_message`) VALUES ( '1', '1', 'Москва', '100', '20', '0', '0', '1', '100', 'Описание', '1', '5', 'Договор', '', '+380957506112', '', '', 'Заметка', '', NULL, '2017-06-22', '4', '2017-06-26 11:22:08.033913', NULL, '~', '1', '1', '1', NULL, '[{\'changed\': {\'fields\': [\'Площадь\', \'Метраж\', \'Этаж\', \'Цена\', \'Описание\', \'Дом\', \'КВт\', \'Тип договора\', \'Телефон\', \'Заметка\']}}]' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`,`change_message`) VALUES ( '1', '1', 'Москва', '100', '20', '0', '0', '1', '1000', 'Описание', '1', '5', 'Договор', '', '+380957506112', '', '', 'Заметка', '', NULL, '2017-06-22', '5', '2017-06-27 02:06:09.147984', NULL, '~', '1', '1', '1', '2', '[{\'changed\': {\'object\': \'Объект\', \'name\': \'Москва\', \'fields\': [\'Цена\', \'Станция метро доп.\']}}]' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`,`change_message`) VALUES ( '1', '1', 'Москва', '100', '20', '100', '10', '1', '1000', 'Описание', '1', '5', 'Договор', '', '+380957506112', '', '', 'Заметка', '', NULL, '2017-06-22', '6', '2017-06-27 02:29:49.255872', NULL, '~', '1', '1', '1', '2', '[{\'changed\': {\'name\': \'Москва\', \'object\': \'Объект\', \'fields\': [\'Цена\', \'Процент комиссии\']}}]' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`,`change_message`) VALUES ( '2', '1', 'Москва', '1000', '200', '1000', '20', '1', '10000', 'Описание', '1', '50', 'Договор', '', '+380957506112', '', '', 'Заметка', '', NULL, '2017-06-27', '7', '2017-06-27 04:56:00.875261', NULL, '+', '1', '1', '1', '2', '[{\'added\': {\'object\': \'Объект\', \'name\': \'Москва\'}}]' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`,`change_message`) VALUES ( '3', '3', 'Макеевка', '23', '0', '0', '0', '0', '0', '', '0', '78', '', '', '', '', '', '', '0', NULL, '2017-06-27', '8', '2017-06-27 05:57:43.213243', NULL, '+', '1', '1', '2', NULL, '[{\'added\': {\'name\': \'Макеевка\', \'object\': \'Объект\'}}]' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`,`change_message`) VALUES ( '4', '1', 'dsffdfds', '0', '0', '0', '0', '0', '0', '', '0', '', '', '', '', '', '', '', '', NULL, '2017-06-27', '9', '2017-06-27 05:58:28.978008', NULL, '+', '1', '1', '2', NULL, '[{\'added\': {\'name\': \'dsffdfds\', \'object\': \'Объект\'}}]' );
-- ---------------------------------------------------------


-- Dump data of "naznach" ----------------------------------
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '1', 'Продукты', 'Колбаса' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '2', 'Продукты', 'Молоко' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '3', 'Продукты', 'Табак' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '4', 'Продукты', 'Кондитерка' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '5', 'Продукты', 'Мясо' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '6', 'Продукты', 'Фрукты\\Овощи' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '7', 'Продукты', 'Кулинария' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '8', 'Продукты', 'Пиво\\Алкоголь' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '9', 'Продукты', 'Хлеб' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '10', 'Продукты', 'Магазин продуктов' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '11', 'Продукты', 'Рыба\\Икра' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '12', 'Продукты', 'Чай и другое' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '13', 'Общепит', 'Выпечка и подобное' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '14', 'Общепит', 'Кофе с собой' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '15', 'Общепит', 'Рестораны и другое' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '16', 'Общепит', 'Шаурма\\Тандыр' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '17', 'Другое', 'Аптека\\Оптика' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '18', 'Другое', 'Офис\\Мед. Услуги\\Салон кр.' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '19', 'Другое', 'Другое' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '20', 'Другое', 'Промтовары' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '21', 'Другое', 'Ломбард\\Банк. Услуги' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '22', 'Другое', 'Ремонт\\Быт. Услуги' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '23', 'Другое', 'Одежда\\Обувь' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '24', 'Другое', 'Цветы' );
-- ---------------------------------------------------------


-- Dump data of "object" -----------------------------------
INSERT INTO `object`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '1', '1', 'Москва', '100', '20', '100', '10', '1', '1000', 'Описание', '1', '5', 'Договор', '', '+380957506112', '', '', 'Заметка', '', NULL, '2017-06-22', '1', '1', '2' );
INSERT INTO `object`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '2', '1', 'Москва', '1000', '200', '1000', '20', '1', '10000', 'Описание', '1', '50', 'Договор', '', '+380957506112', '', '', 'Заметка', '', NULL, '2017-06-27', '1', '1', '2' );
INSERT INTO `object`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '3', '3', 'Макеевка', '23', '0', '0', '0', '0', '0', '', '0', '78', '', '', '', '', '', '', '0', NULL, '2017-06-27', '1', '2', NULL );
INSERT INTO `object`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '4', '1', 'dsffdfds', '0', '0', '0', '0', '0', '0', '', '0', '', '', '', '', '', '', '', '', NULL, '2017-06-27', '1', '2', NULL );
-- ---------------------------------------------------------


-- Dump data of "object_naznach" ---------------------------
INSERT INTO `object_naznach`(`id`,`myobject_id`,`naznach_id`) VALUES ( '1', '1', '1' );
INSERT INTO `object_naznach`(`id`,`myobject_id`,`naznach_id`) VALUES ( '3', '1', '13' );
INSERT INTO `object_naznach`(`id`,`myobject_id`,`naznach_id`) VALUES ( '2', '1', '18' );
INSERT INTO `object_naznach`(`id`,`myobject_id`,`naznach_id`) VALUES ( '4', '2', '1' );
INSERT INTO `object_naznach`(`id`,`myobject_id`,`naznach_id`) VALUES ( '7', '2', '6' );
INSERT INTO `object_naznach`(`id`,`myobject_id`,`naznach_id`) VALUES ( '6', '2', '13' );
INSERT INTO `object_naznach`(`id`,`myobject_id`,`naznach_id`) VALUES ( '5', '2', '18' );
INSERT INTO `object_naznach`(`id`,`myobject_id`,`naznach_id`) VALUES ( '8', '4', '3' );
-- ---------------------------------------------------------


-- Dump data of "object_okrug" -----------------------------
INSERT INTO `object_okrug`(`id`,`myobject_id`,`okrug_id`) VALUES ( '2', '1', '1' );
INSERT INTO `object_okrug`(`id`,`myobject_id`,`okrug_id`) VALUES ( '3', '1', '5' );
INSERT INTO `object_okrug`(`id`,`myobject_id`,`okrug_id`) VALUES ( '4', '2', '1' );
INSERT INTO `object_okrug`(`id`,`myobject_id`,`okrug_id`) VALUES ( '5', '2', '3' );
INSERT INTO `object_okrug`(`id`,`myobject_id`,`okrug_id`) VALUES ( '6', '2', '6' );
INSERT INTO `object_okrug`(`id`,`myobject_id`,`okrug_id`) VALUES ( '7', '4', '6' );
-- ---------------------------------------------------------


-- Dump data of "okrug" ------------------------------------
INSERT INTO `okrug`(`id`,`options`) VALUES ( '1', 'Север' );
INSERT INTO `okrug`(`id`,`options`) VALUES ( '2', 'Юг' );
INSERT INTO `okrug`(`id`,`options`) VALUES ( '3', 'Восток' );
INSERT INTO `okrug`(`id`,`options`) VALUES ( '4', 'Запад' );
INSERT INTO `okrug`(`id`,`options`) VALUES ( '5', 'Центр' );
INSERT INTO `okrug`(`id`,`options`) VALUES ( '6', 'Область' );
-- ---------------------------------------------------------


-- Dump data of "photo_baza" -------------------------------
INSERT INTO `photo_baza`(`id`,`image`,`is_main`,`is_active`,`created`,`station_id`) VALUES ( '12', 'photo_baza/2017_06_27_072618_513615.jpg', '0', '1', '2017-06-27 04:26:18.580619', '1' );
INSERT INTO `photo_baza`(`id`,`image`,`is_main`,`is_active`,`created`,`station_id`) VALUES ( '13', 'photo_baza/2017_06_27_072618_640622.jpg', '0', '1', '2017-06-27 04:26:18.782630', '1' );
-- ---------------------------------------------------------


-- Dump data of "prioritet" --------------------------------
INSERT INTO `prioritet`(`id`,`prioritet`,`num`) VALUES ( '1', '1', '1' );
-- ---------------------------------------------------------


-- Dump data of "seo" --------------------------------------
-- ---------------------------------------------------------


-- Dump data of "task_client" ------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "account_emailaddress_user_id_2c513194_fk_auth_user_id" 
-- CREATE INDEX "account_emailaddress_user_id_2c513194_fk_auth_user_id" 
CREATE INDEX `account_emailaddress_user_id_2c513194_fk_auth_user_id` USING BTREE ON `account_emailaddress`( `user_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "account_emailconfirm_email_address_id_5b7f8c58_fk_account_e" 
-- CREATE INDEX "account_emailconfirm_email_address_id_5b7f8c58_fk_account_e" 
CREATE INDEX `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` USING BTREE ON `account_emailconfirmation`( `email_address_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" 
-- CREATE INDEX "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" 
CREATE INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` USING BTREE ON `auth_group_permissions`( `permission_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "auth_user_groups_group_id_97559544_fk_auth_group_id" 
-- CREATE INDEX "auth_user_groups_group_id_97559544_fk_auth_group_id" 
CREATE INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id` USING BTREE ON `auth_user_groups`( `group_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" 
-- CREATE INDEX "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" 
CREATE INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` USING BTREE ON `auth_user_user_permissions`( `permission_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "client_my_manager_id_530baa61_fk_auth_user_id" 
-- CREATE INDEX "client_my_manager_id_530baa61_fk_auth_user_id" 
CREATE INDEX `client_my_manager_id_530baa61_fk_auth_user_id` USING BTREE ON `client`( `my_manager_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "client_naznach_one_id_ba98bc63_fk_naznach_id" 
-- CREATE INDEX "client_naznach_one_id_ba98bc63_fk_naznach_id" -
CREATE INDEX `client_naznach_one_id_ba98bc63_fk_naznach_id` USING BTREE ON `client`( `naznach_one_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "client_naznach_two_id_ad3a4e5a_fk_naznach_id" 
-- CREATE INDEX "client_naznach_two_id_ad3a4e5a_fk_naznach_id" -
CREATE INDEX `client_naznach_two_id_ad3a4e5a_fk_naznach_id` USING BTREE ON `client`( `naznach_two_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "client_okrug_okrug_id_5841394a_fk_okrug_id" 
-- CREATE INDEX "client_okrug_okrug_id_5841394a_fk_okrug_id" ---
CREATE INDEX `client_okrug_okrug_id_5841394a_fk_okrug_id` USING BTREE ON `client_okrug`( `okrug_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "django_admin_log_content_type_id_c4bce8eb_fk_django_co" 
-- CREATE INDEX "django_admin_log_content_type_id_c4bce8eb_fk_django_co" 
CREATE INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co` USING BTREE ON `django_admin_log`( `content_type_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "django_admin_log_user_id_c564eba6_fk_auth_user_id" 
-- CREATE INDEX "django_admin_log_user_id_c564eba6_fk_auth_user_id" 
CREATE INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id` USING BTREE ON `django_admin_log`( `user_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "django_session_expire_date_a5c62663" ------
-- CREATE INDEX "django_session_expire_date_a5c62663" ----------
CREATE INDEX `django_session_expire_date_a5c62663` USING BTREE ON `django_session`( `expire_date` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "metro_okrug_okrug_id_48f02f1d_fk_okrug_id" 
-- CREATE INDEX "metro_okrug_okrug_id_48f02f1d_fk_okrug_id" ----
CREATE INDEX `metro_okrug_okrug_id_48f02f1d_fk_okrug_id` USING BTREE ON `metro_okrug`( `okrug_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "myclient_historicalclient_id_9b6f9363" ----
-- CREATE INDEX "myclient_historicalclient_id_9b6f9363" --------
CREATE INDEX `myclient_historicalclient_id_9b6f9363` USING BTREE ON `myclient_historicalclient`( `id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "myclient_historicalclient_my_manager_id_8eb0ddf6" 
-- CREATE INDEX "myclient_historicalclient_my_manager_id_8eb0ddf6" 
CREATE INDEX `myclient_historicalclient_my_manager_id_8eb0ddf6` USING BTREE ON `myclient_historicalclient`( `my_manager_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "myclient_historicalclient_naznach_one_id_4b68f529" 
-- CREATE INDEX "myclient_historicalclient_naznach_one_id_4b68f529" 
CREATE INDEX `myclient_historicalclient_naznach_one_id_4b68f529` USING BTREE ON `myclient_historicalclient`( `naznach_one_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "myclient_historicalclient_naznach_two_id_cfc0de68" 
-- CREATE INDEX "myclient_historicalclient_naznach_two_id_cfc0de68" 
CREATE INDEX `myclient_historicalclient_naznach_two_id_cfc0de68` USING BTREE ON `myclient_historicalclient`( `naznach_two_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "myclient_historicalc_history_user_id_19d91a71_fk_auth_user" 
-- CREATE INDEX "myclient_historicalc_history_user_id_19d91a71_fk_auth_user" 
CREATE INDEX `myclient_historicalc_history_user_id_19d91a71_fk_auth_user` USING BTREE ON `myclient_historicalclient`( `history_user_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "myobject_historicalmyobject_id_6d45539d" --
-- CREATE INDEX "myobject_historicalmyobject_id_6d45539d" ------
CREATE INDEX `myobject_historicalmyobject_id_6d45539d` USING BTREE ON `myobject_historicalmyobject`( `id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "myobject_historicalmyobject_my_manager_id_0aff48d0" 
-- CREATE INDEX "myobject_historicalmyobject_my_manager_id_0aff48d0" 
CREATE INDEX `myobject_historicalmyobject_my_manager_id_0aff48d0` USING BTREE ON `myobject_historicalmyobject`( `my_manager_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "myobject_historicalmyobject_station_one_id_e641a7f5" 
-- CREATE INDEX "myobject_historicalmyobject_station_one_id_e641a7f5" 
CREATE INDEX `myobject_historicalmyobject_station_one_id_e641a7f5` USING BTREE ON `myobject_historicalmyobject`( `station_one_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "myobject_historicalmyobject_station_two_id_b1264829" 
-- CREATE INDEX "myobject_historicalmyobject_station_two_id_b1264829" 
CREATE INDEX `myobject_historicalmyobject_station_two_id_b1264829` USING BTREE ON `myobject_historicalmyobject`( `station_two_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "myobject_historicalm_history_user_id_ce6b9aa7_fk_auth_user" 
-- CREATE INDEX "myobject_historicalm_history_user_id_ce6b9aa7_fk_auth_user" 
CREATE INDEX `myobject_historicalm_history_user_id_ce6b9aa7_fk_auth_user` USING BTREE ON `myobject_historicalmyobject`( `history_user_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "object_my_manager_id_2f5979b5_fk_auth_user_id" 
-- CREATE INDEX "object_my_manager_id_2f5979b5_fk_auth_user_id" 
CREATE INDEX `object_my_manager_id_2f5979b5_fk_auth_user_id` USING BTREE ON `object`( `my_manager_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "object_station_one_id_fcf868d5_fk_metro_id" 
-- CREATE INDEX "object_station_one_id_fcf868d5_fk_metro_id" ---
CREATE INDEX `object_station_one_id_fcf868d5_fk_metro_id` USING BTREE ON `object`( `station_one_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "object_station_two_id_5c716354_fk_metro_id" 
-- CREATE INDEX "object_station_two_id_5c716354_fk_metro_id" ---
CREATE INDEX `object_station_two_id_5c716354_fk_metro_id` USING BTREE ON `object`( `station_two_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "object_naznach_naznach_id_b2ca4760_fk_naznach_id" 
-- CREATE INDEX "object_naznach_naznach_id_b2ca4760_fk_naznach_id" 
CREATE INDEX `object_naznach_naznach_id_b2ca4760_fk_naznach_id` USING BTREE ON `object_naznach`( `naznach_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "object_okrug_okrug_id_bde21601_fk_okrug_id" 
-- CREATE INDEX "object_okrug_okrug_id_bde21601_fk_okrug_id" ---
CREATE INDEX `object_okrug_okrug_id_bde21601_fk_okrug_id` USING BTREE ON `object_okrug`( `okrug_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "photo_baza_station_id_48136e1b_fk_metro_id" 
-- CREATE INDEX "photo_baza_station_id_48136e1b_fk_metro_id" ---
CREATE INDEX `photo_baza_station_id_48136e1b_fk_metro_id` USING BTREE ON `photo_baza`( `station_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "task_client_client_id_7a28e174_fk_client_id" 
-- CREATE INDEX "task_client_client_id_7a28e174_fk_client_id" --
CREATE INDEX `task_client_client_id_7a28e174_fk_client_id` USING BTREE ON `task_client`( `client_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "task_client_manager_id_044d843b_fk_auth_user_id" 
-- CREATE INDEX "task_client_manager_id_044d843b_fk_auth_user_id" 
CREATE INDEX `task_client_manager_id_044d843b_fk_auth_user_id` USING BTREE ON `task_client`( `manager_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "task_client_prioritet_id_11769f7b_fk_prioritet_id" 
-- CREATE INDEX "task_client_prioritet_id_11769f7b_fk_prioritet_id" 
CREATE INDEX `task_client_prioritet_id_11769f7b_fk_prioritet_id` USING BTREE ON `task_client`( `prioritet_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "account_emailaddress_user_id_2c513194_fk_auth_user_id" 
-- CREATE LINK "account_emailaddress_user_id_2c513194_fk_auth_user_id" 
ALTER TABLE `account_emailaddress`
	ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "account_emailconfirm_email_address_id_5b7f8c58_fk_account_e" 
-- CREATE LINK "account_emailconfirm_email_address_id_5b7f8c58_fk_account_e" 
ALTER TABLE `account_emailconfirmation`
	ADD CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY ( `email_address_id` )
	REFERENCES `account_emailaddress`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" 
-- CREATE LINK "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" 
ALTER TABLE `auth_group_permissions`
	ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY ( `permission_id` )
	REFERENCES `auth_permission`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" 
-- CREATE LINK "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" 
ALTER TABLE `auth_group_permissions`
	ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY ( `group_id` )
	REFERENCES `auth_group`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "auth_permission_content_type_id_2f476e4b_fk_django_co" 
-- CREATE LINK "auth_permission_content_type_id_2f476e4b_fk_django_co" 
ALTER TABLE `auth_permission`
	ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY ( `content_type_id` )
	REFERENCES `django_content_type`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "auth_user_groups_group_id_97559544_fk_auth_group_id" 
-- CREATE LINK "auth_user_groups_group_id_97559544_fk_auth_group_id" 
ALTER TABLE `auth_user_groups`
	ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY ( `group_id` )
	REFERENCES `auth_group`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" 
-- CREATE LINK "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" 
ALTER TABLE `auth_user_groups`
	ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" 
-- CREATE LINK "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" 
ALTER TABLE `auth_user_user_permissions`
	ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY ( `permission_id` )
	REFERENCES `auth_permission`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" 
-- CREATE LINK "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" 
ALTER TABLE `auth_user_user_permissions`
	ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "client_my_manager_id_530baa61_fk_auth_user_id" 
-- CREATE LINK "client_my_manager_id_530baa61_fk_auth_user_id" -
ALTER TABLE `client`
	ADD CONSTRAINT `client_my_manager_id_530baa61_fk_auth_user_id` FOREIGN KEY ( `my_manager_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "client_naznach_one_id_ba98bc63_fk_naznach_id" 
-- CREATE LINK "client_naznach_one_id_ba98bc63_fk_naznach_id" --
ALTER TABLE `client`
	ADD CONSTRAINT `client_naznach_one_id_ba98bc63_fk_naznach_id` FOREIGN KEY ( `naznach_one_id` )
	REFERENCES `naznach`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "client_naznach_two_id_ad3a4e5a_fk_naznach_id" 
-- CREATE LINK "client_naznach_two_id_ad3a4e5a_fk_naznach_id" --
ALTER TABLE `client`
	ADD CONSTRAINT `client_naznach_two_id_ad3a4e5a_fk_naznach_id` FOREIGN KEY ( `naznach_two_id` )
	REFERENCES `naznach`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "client_okrug_client_id_16a0bcc5_fk_client_id" 
-- CREATE LINK "client_okrug_client_id_16a0bcc5_fk_client_id" --
ALTER TABLE `client_okrug`
	ADD CONSTRAINT `client_okrug_client_id_16a0bcc5_fk_client_id` FOREIGN KEY ( `client_id` )
	REFERENCES `client`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "client_okrug_okrug_id_5841394a_fk_okrug_id" 
-- CREATE LINK "client_okrug_okrug_id_5841394a_fk_okrug_id" ----
ALTER TABLE `client_okrug`
	ADD CONSTRAINT `client_okrug_okrug_id_5841394a_fk_okrug_id` FOREIGN KEY ( `okrug_id` )
	REFERENCES `okrug`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "django_admin_log_content_type_id_c4bce8eb_fk_django_co" 
-- CREATE LINK "django_admin_log_content_type_id_c4bce8eb_fk_django_co" 
ALTER TABLE `django_admin_log`
	ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY ( `content_type_id` )
	REFERENCES `django_content_type`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "django_admin_log_user_id_c564eba6_fk_auth_user_id" 
-- CREATE LINK "django_admin_log_user_id_c564eba6_fk_auth_user_id" 
ALTER TABLE `django_admin_log`
	ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "manager_options_user_id_46e7b9d8_fk_auth_user_id" 
-- CREATE LINK "manager_options_user_id_46e7b9d8_fk_auth_user_id" 
ALTER TABLE `manager_options`
	ADD CONSTRAINT `manager_options_user_id_46e7b9d8_fk_auth_user_id` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "metro_okrug_okrug_id_48f02f1d_fk_okrug_id" -
-- CREATE LINK "metro_okrug_okrug_id_48f02f1d_fk_okrug_id" -----
ALTER TABLE `metro_okrug`
	ADD CONSTRAINT `metro_okrug_okrug_id_48f02f1d_fk_okrug_id` FOREIGN KEY ( `okrug_id` )
	REFERENCES `okrug`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "metro_okrug_stancmetro_id_68328e2e_fk_metro_id" 
-- CREATE LINK "metro_okrug_stancmetro_id_68328e2e_fk_metro_id" 
ALTER TABLE `metro_okrug`
	ADD CONSTRAINT `metro_okrug_stancmetro_id_68328e2e_fk_metro_id` FOREIGN KEY ( `stancmetro_id` )
	REFERENCES `metro`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "myclient_historicalc_history_user_id_19d91a71_fk_auth_user" 
-- CREATE LINK "myclient_historicalc_history_user_id_19d91a71_fk_auth_user" 
ALTER TABLE `myclient_historicalclient`
	ADD CONSTRAINT `myclient_historicalc_history_user_id_19d91a71_fk_auth_user` FOREIGN KEY ( `history_user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "myobject_historicalm_history_user_id_ce6b9aa7_fk_auth_user" 
-- CREATE LINK "myobject_historicalm_history_user_id_ce6b9aa7_fk_auth_user" 
ALTER TABLE `myobject_historicalmyobject`
	ADD CONSTRAINT `myobject_historicalm_history_user_id_ce6b9aa7_fk_auth_user` FOREIGN KEY ( `history_user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "object_my_manager_id_2f5979b5_fk_auth_user_id" 
-- CREATE LINK "object_my_manager_id_2f5979b5_fk_auth_user_id" -
ALTER TABLE `object`
	ADD CONSTRAINT `object_my_manager_id_2f5979b5_fk_auth_user_id` FOREIGN KEY ( `my_manager_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "object_station_one_id_fcf868d5_fk_metro_id" 
-- CREATE LINK "object_station_one_id_fcf868d5_fk_metro_id" ----
ALTER TABLE `object`
	ADD CONSTRAINT `object_station_one_id_fcf868d5_fk_metro_id` FOREIGN KEY ( `station_one_id` )
	REFERENCES `metro`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "object_station_two_id_5c716354_fk_metro_id" 
-- CREATE LINK "object_station_two_id_5c716354_fk_metro_id" ----
ALTER TABLE `object`
	ADD CONSTRAINT `object_station_two_id_5c716354_fk_metro_id` FOREIGN KEY ( `station_two_id` )
	REFERENCES `metro`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "object_naznach_myobject_id_80f3af66_fk_object_id" 
-- CREATE LINK "object_naznach_myobject_id_80f3af66_fk_object_id" 
ALTER TABLE `object_naznach`
	ADD CONSTRAINT `object_naznach_myobject_id_80f3af66_fk_object_id` FOREIGN KEY ( `myobject_id` )
	REFERENCES `object`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "object_naznach_naznach_id_b2ca4760_fk_naznach_id" 
-- CREATE LINK "object_naznach_naznach_id_b2ca4760_fk_naznach_id" 
ALTER TABLE `object_naznach`
	ADD CONSTRAINT `object_naznach_naznach_id_b2ca4760_fk_naznach_id` FOREIGN KEY ( `naznach_id` )
	REFERENCES `naznach`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "object_okrug_myobject_id_d511a1e6_fk_object_id" 
-- CREATE LINK "object_okrug_myobject_id_d511a1e6_fk_object_id" 
ALTER TABLE `object_okrug`
	ADD CONSTRAINT `object_okrug_myobject_id_d511a1e6_fk_object_id` FOREIGN KEY ( `myobject_id` )
	REFERENCES `object`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "object_okrug_okrug_id_bde21601_fk_okrug_id" 
-- CREATE LINK "object_okrug_okrug_id_bde21601_fk_okrug_id" ----
ALTER TABLE `object_okrug`
	ADD CONSTRAINT `object_okrug_okrug_id_bde21601_fk_okrug_id` FOREIGN KEY ( `okrug_id` )
	REFERENCES `okrug`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "photo_baza_station_id_48136e1b_fk_metro_id" 
-- CREATE LINK "photo_baza_station_id_48136e1b_fk_metro_id" ----
ALTER TABLE `photo_baza`
	ADD CONSTRAINT `photo_baza_station_id_48136e1b_fk_metro_id` FOREIGN KEY ( `station_id` )
	REFERENCES `metro`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "task_client_client_id_7a28e174_fk_client_id" 
-- CREATE LINK "task_client_client_id_7a28e174_fk_client_id" ---
ALTER TABLE `task_client`
	ADD CONSTRAINT `task_client_client_id_7a28e174_fk_client_id` FOREIGN KEY ( `client_id` )
	REFERENCES `client`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "task_client_manager_id_044d843b_fk_auth_user_id" 
-- CREATE LINK "task_client_manager_id_044d843b_fk_auth_user_id" 
ALTER TABLE `task_client`
	ADD CONSTRAINT `task_client_manager_id_044d843b_fk_auth_user_id` FOREIGN KEY ( `manager_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "task_client_prioritet_id_11769f7b_fk_prioritet_id" 
-- CREATE LINK "task_client_prioritet_id_11769f7b_fk_prioritet_id" 
ALTER TABLE `task_client`
	ADD CONSTRAINT `task_client_prioritet_id_11769f7b_fk_prioritet_id` FOREIGN KEY ( `prioritet_id` )
	REFERENCES `prioritet`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


