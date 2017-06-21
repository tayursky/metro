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
	CONSTRAINT `auth_group_permissions_group_id_0cd325b0_uniq` UNIQUE( `group_id`, `permission_id` ) )
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
AUTO_INCREMENT = 70;
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
AUTO_INCREMENT = 5;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "auth_user_groups" -------------------------
-- CREATE TABLE "auth_user_groups" -----------------------------
CREATE TABLE `auth_user_groups` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`user_id` Int( 11 ) NOT NULL,
	`group_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `auth_user_groups_user_id_94350c0c_uniq` UNIQUE( `user_id`, `group_id` ) )
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
	CONSTRAINT `auth_user_user_permissions_user_id_14a6b632_uniq` UNIQUE( `user_id`, `permission_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 103;
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
AUTO_INCREMENT = 2;
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
AUTO_INCREMENT = 5;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "client_okrug" -----------------------------
-- CREATE TABLE "client_okrug" ---------------------------------
CREATE TABLE `client_okrug` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`client_id` Int( 11 ) NOT NULL,
	`okrug_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `client_okrug_client_id_1fb4d33b_uniq` UNIQUE( `client_id`, `okrug_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 5;
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
AUTO_INCREMENT = 1;
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
AUTO_INCREMENT = 45;
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
AUTO_INCREMENT = 24;
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
AUTO_INCREMENT = 31;
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
AUTO_INCREMENT = 5;
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
AUTO_INCREMENT = 2;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "metro_okrug" ------------------------------
-- CREATE TABLE "metro_okrug" ----------------------------------
CREATE TABLE `metro_okrug` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`stancmetro_id` Int( 11 ) NOT NULL,
	`okrug_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `metro_okrug_stancmetro_id_19f018d2_uniq` UNIQUE( `stancmetro_id`, `okrug_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
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
	PRIMARY KEY ( `history_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
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
	PRIMARY KEY ( `history_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 5;
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
AUTO_INCREMENT = 3;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "object_naznach" ---------------------------
-- CREATE TABLE "object_naznach" -------------------------------
CREATE TABLE `object_naznach` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`myobject_id` Int( 11 ) NOT NULL,
	`naznach_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `object_naznach_myobject_id_8d65e6bb_uniq` UNIQUE( `myobject_id`, `naznach_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "object_okrug" -----------------------------
-- CREATE TABLE "object_okrug" ---------------------------------
CREATE TABLE `object_okrug` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`myobject_id` Int( 11 ) NOT NULL,
	`okrug_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `object_okrug_myobject_id_5e901da1_uniq` UNIQUE( `myobject_id`, `okrug_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
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
AUTO_INCREMENT = 1;
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
AUTO_INCREMENT = 2;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "task_client" ------------------------------
-- CREATE TABLE "task_client" ----------------------------------
CREATE TABLE `task_client` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`prioritet` VarChar( 30 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`date` Date NOT NULL,
	`task` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`client_id` Int( 11 ) NOT NULL,
	`manager_id` Int( 11 ) NOT NULL,
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
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '4', 'Can add user', '2', 'add_user' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '5', 'Can change user', '2', 'change_user' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '6', 'Can delete user', '2', 'delete_user' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '7', 'Can add permission', '3', 'add_permission' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '8', 'Can change permission', '3', 'change_permission' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '9', 'Can delete permission', '3', 'delete_permission' );
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
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '22', 'Can add email confirmation', '8', 'add_emailconfirmation' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '23', 'Can change email confirmation', '8', 'change_emailconfirmation' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '24', 'Can delete email confirmation', '8', 'delete_emailconfirmation' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '25', 'Can add email address', '9', 'add_emailaddress' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '26', 'Can change email address', '9', 'change_emailaddress' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '27', 'Can delete email address', '9', 'delete_emailaddress' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '28', 'Can add Приоритет', '10', 'add_prioritet' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '29', 'Can change Приоритет', '10', 'change_prioritet' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '30', 'Can delete Приоритет', '10', 'delete_prioritet' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '31', 'Can add Назначение', '11', 'add_naznach' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '32', 'Can change Назначение', '11', 'change_naznach' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '33', 'Can delete Назначение', '11', 'delete_naznach' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '34', 'Can add Клиент', '12', 'add_client' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '35', 'Can change Клиент', '12', 'change_client' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '36', 'Can delete Клиент', '12', 'delete_client' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '37', 'Can add Округ', '13', 'add_okrug' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '38', 'Can change Округ', '13', 'change_okrug' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '39', 'Can delete Округ', '13', 'delete_okrug' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '40', 'Can add historical Клиент', '14', 'add_historicalclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '41', 'Can change historical Клиент', '14', 'change_historicalclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '42', 'Can delete historical Клиент', '14', 'delete_historicalclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '43', 'Can add Задача клиента', '15', 'add_taskclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '44', 'Can change Задача клиента', '15', 'change_taskclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '45', 'Can delete Задача клиента', '15', 'delete_taskclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '46', 'Can add historical Объект', '16', 'add_historicalmyobject' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '47', 'Can change historical Объект', '16', 'change_historicalmyobject' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '48', 'Can delete historical Объект', '16', 'delete_historicalmyobject' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '49', 'Can add Объект', '17', 'add_myobject' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '50', 'Can change Объект', '17', 'change_myobject' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '51', 'Can delete Объект', '17', 'delete_myobject' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '52', 'Can add Стация метро', '18', 'add_stancmetro' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '53', 'Can change Стация метро', '18', 'change_stancmetro' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '54', 'Can delete Стация метро', '18', 'delete_stancmetro' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '55', 'Can add Настройки циан', '19', 'add_cian' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '56', 'Can change Настройки циан', '19', 'change_cian' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '57', 'Can delete Настройки циан', '19', 'delete_cian' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '58', 'Can add Настрока сайта\\SEO', '20', 'add_seo' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '59', 'Can change Настрока сайта\\SEO', '20', 'change_seo' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '60', 'Can delete Настрока сайта\\SEO', '20', 'delete_seo' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '61', 'Can add Настроки прав', '21', 'add_menageroptions' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '62', 'Can change Настроки прав', '21', 'change_menageroptions' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '63', 'Can delete Настроки прав', '21', 'delete_menageroptions' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '64', 'Can add Обратная связь', '22', 'add_contact' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '65', 'Can change Обратная связь', '22', 'change_contact' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '66', 'Can delete Обратная связь', '22', 'delete_contact' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '67', 'Can add Черный список', '23', 'add_blacklist' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '68', 'Can change Черный список', '23', 'change_blacklist' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '69', 'Can delete Черный список', '23', 'delete_blacklist' );
-- ---------------------------------------------------------


-- Dump data of "auth_user" --------------------------------
INSERT INTO `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) VALUES ( '1', 'pbkdf2_sha256$36000$iGF3wrRR0Y6Y$7gGeAvkaQisWPzOoJcrIEl0I0fiesaqTgNpwtyvvYMw=', '2017-06-21 21:09:27.536169', '1', 'DJWOMS', '', '', 'sd@mail.ru', '1', '1', '2017-06-21 20:52:27.446832' );
INSERT INTO `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) VALUES ( '4', 'pbkdf2_sha256$36000$RVnWl8wURuFx$0IByOll47bYmx5+UypCg5b2kbiOOIe+//rc4VqRdwGE=', '2017-06-21 21:08:43.473287', '0', 'test', '', '', '', '0', '0', '2017-06-21 21:08:28.016803' );
-- ---------------------------------------------------------


-- Dump data of "auth_user_groups" -------------------------
-- ---------------------------------------------------------


-- Dump data of "auth_user_user_permissions" ---------------
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '1', '2', '1' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '2', '2', '2' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '3', '2', '3' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '4', '2', '4' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '5', '2', '5' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '6', '2', '6' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '7', '2', '7' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '8', '2', '8' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '9', '2', '9' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '10', '2', '10' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '11', '2', '11' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '12', '2', '12' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '13', '2', '13' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '14', '2', '14' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '15', '2', '15' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '16', '2', '16' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '17', '2', '17' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '18', '2', '18' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '25', '2', '25' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '26', '2', '26' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '27', '2', '27' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '28', '2', '28' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '29', '2', '29' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '30', '2', '30' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '31', '2', '31' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '32', '2', '32' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '33', '2', '33' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '34', '2', '34' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '35', '2', '35' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '36', '2', '36' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '37', '2', '37' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '38', '2', '38' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '39', '2', '39' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '40', '2', '40' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '41', '2', '41' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '42', '2', '42' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '43', '2', '43' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '44', '2', '44' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '45', '2', '45' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '46', '2', '46' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '47', '2', '47' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '48', '2', '48' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '49', '2', '49' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '50', '2', '50' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '51', '2', '51' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '52', '2', '52' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '53', '2', '53' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '54', '2', '54' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '55', '3', '1' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '56', '3', '2' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '57', '3', '3' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '58', '3', '4' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '59', '3', '5' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '60', '3', '6' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '61', '3', '7' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '62', '3', '8' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '63', '3', '9' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '64', '3', '10' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '65', '3', '11' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '66', '3', '12' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '67', '3', '13' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '68', '3', '14' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '69', '3', '15' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '70', '3', '16' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '71', '3', '17' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '72', '3', '18' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '73', '3', '25' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '74', '3', '26' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '75', '3', '27' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '76', '3', '28' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '77', '3', '29' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '78', '3', '30' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '79', '3', '31' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '80', '3', '32' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '81', '3', '33' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '82', '3', '34' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '83', '3', '35' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '84', '3', '36' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '85', '3', '37' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '86', '3', '38' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '87', '3', '39' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '88', '3', '40' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '89', '3', '41' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '90', '3', '42' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '91', '3', '43' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '92', '3', '44' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '93', '3', '45' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '94', '3', '46' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '95', '3', '47' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '96', '3', '48' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '97', '3', '49' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '98', '3', '50' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '99', '3', '51' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '100', '3', '52' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '101', '3', '53' );
INSERT INTO `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) VALUES ( '102', '3', '54' );
-- ---------------------------------------------------------


-- Dump data of "black_list" -------------------------------
-- ---------------------------------------------------------


-- Dump data of "cian" -------------------------------------
INSERT INTO `cian`(`id`,`login`,`password`,`tel`) VALUES ( '1', '72364', '785585260', '4955858231' );
-- ---------------------------------------------------------


-- Dump data of "client" -----------------------------------
INSERT INTO `client`(`id`,`name`,`tel`,`email`,`hide`,`hide_date`,`area_ot`,`area_do`,`price_obsh`,`price_m`,`dop_kont`,`metro`,`adres`,`komisiya`,`etaj`,`podborka`,`type_obj`,`my_manager_id`,`naznach_one_id`,`naznach_two_id`) VALUES ( '4', 'Миша', '+380957506112', 'l2maximum@mail.ru', '0', NULL, '0', '0', '0', '0', '', '0', '0', '1', '0', '0', 'tc', '1', '18', NULL );
-- ---------------------------------------------------------


-- Dump data of "client_okrug" -----------------------------
INSERT INTO `client_okrug`(`id`,`client_id`,`okrug_id`) VALUES ( '1', '2', '3' );
INSERT INTO `client_okrug`(`id`,`client_id`,`okrug_id`) VALUES ( '2', '2', '5' );
INSERT INTO `client_okrug`(`id`,`client_id`,`okrug_id`) VALUES ( '3', '3', '3' );
INSERT INTO `client_okrug`(`id`,`client_id`,`okrug_id`) VALUES ( '4', '3', '5' );
-- ---------------------------------------------------------


-- Dump data of "contact" ----------------------------------
-- ---------------------------------------------------------


-- Dump data of "django_admin_log" -------------------------
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '1', '2017-05-05 02:14:50.986748', '2', 'admin', '1', '[{"added": {}}]', '3', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '2', '2017-05-05 02:15:11.865925', '2', 'admin', '2', '[{"changed": {"fields": ["is_staff"]}}]', '3', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '3', '2017-05-05 02:16:13.011400', '1', 'Юг', '1', '[{"added": {}}]', '11', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '4', '2017-05-05 02:16:17.155639', '2', 'Север', '1', '[{"added": {}}]', '11', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '5', '2017-05-05 02:16:21.239904', '3', 'Запад', '1', '[{"added": {}}]', '11', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '6', '2017-05-05 02:16:25.515896', '4', 'Восток', '1', '[{"added": {}}]', '11', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '7', '2017-05-05 02:16:30.042932', '5', 'Центер', '1', '[{"added": {}}]', '11', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '8', '2017-05-05 02:16:47.345368', '6', 'Область', '1', '[{"added": {}}]', '11', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '9', '2017-05-05 02:17:13.824740', '1', 'Колбаса', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '10', '2017-05-05 02:17:44.529933', '2', 'Молоко', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '11', '2017-05-05 02:17:50.677548', '3', 'Табак', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '12', '2017-05-05 02:18:00.718106', '4', 'Кондитерка', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '13', '2017-05-05 02:18:06.368174', '5', 'Мясо', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '14', '2017-05-05 02:18:18.254843', '6', 'Фрукты\\Овощи', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '15', '2017-05-05 02:18:28.001067', '7', 'Кулинария', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '16', '2017-05-05 02:18:39.106332', '8', 'Пиво\\Алкоголь', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '17', '2017-05-05 02:18:43.037032', '9', 'Хлеб', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '18', '2017-05-05 02:18:55.753575', '10', 'Магазин продуктов', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '19', '2017-05-05 02:19:04.679910', '11', 'Рыба\\Икра', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '20', '2017-05-05 02:19:12.526380', '12', 'Чай и другое', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '21', '2017-05-05 02:19:24.333682', '13', 'Выпечка и подобное', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '22', '2017-05-05 02:19:35.210730', '14', 'Кофе с собой', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '23', '2017-05-05 02:19:51.640549', '15', 'Рестораны и другое', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '24', '2017-05-05 02:20:14.342547', '16', 'Шаурма\\Тандыр', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '25', '2017-05-05 02:20:32.380205', '17', 'Аптека\\Оптика', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '26', '2017-05-05 02:21:25.937641', '18', 'Офис\\Мед. Услуги\\Салон кр.', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '27', '2017-05-05 02:21:34.466809', '19', 'Промтовары', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '28', '2017-05-05 02:21:57.774699', '20', 'Ломбард\\Банк. Услуги', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '29', '2017-05-05 02:22:11.872109', '21', 'Ремонт\\Быт. Услуги', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '30', '2017-05-05 02:22:24.141828', '22', 'Одежда\\Обувь', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '31', '2017-05-05 02:22:30.891400', '23', 'Цветы', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '32', '2017-05-05 02:22:41.506610', '24', 'Другое', '1', '[{"added": {}}]', '10', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '33', '2017-05-11 21:56:53.198440', '1', 'admin', '1', '[{"added": {}}]', '16', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '34', '2017-05-11 21:57:27.167977', '1', 'SEO настройки Аренда у метро, аренда торговых площадей, аренда под магазин, аренда в метро, аренда отдела', '1', '[{"added": {}}]', '17', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '35', '2017-05-11 21:58:08.779978', '1', '72364', '1', '[{"added": {}}]', '18', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '36', '2017-05-11 21:59:39.110006', '2', 'admin', '2', '[]', '3', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '37', '2017-05-11 22:03:18.386794', '3', 'superadmin', '1', '[{"added": {}}]', '3', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '38', '2017-05-11 22:04:12.306640', '3', 'superadmin', '2', '[{"changed": {"fields": ["is_staff"]}}]', '3', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '39', '2017-05-11 22:04:35.415132', '2', 'superadmin', '2', '[{"changed": {"fields": ["tel", "tel_vlad", "del_obj", "edit_obj", "look"]}}]', '16', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '40', '2017-05-15 10:51:13.467096', '1', 'Сокольники', '1', '[{"added": {}}]', '14', '3' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '41', '2017-05-15 10:51:51.140059', '5', 'Центр', '2', '[{"changed": {"fields": ["options"]}}]', '11', '3' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '42', '2017-05-15 12:46:04.108927', '6', 'Область', '2', '[]', '11', '3' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '43', '2017-06-21 21:05:20.029405', '1', 'Москва', '2', '[{"changed": {"fields": ["hide"]}}]', '17', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '44', '2017-06-21 21:08:28.087807', '4', 'test', '1', '[{"added": {}}]', '2', '1' );
-- ---------------------------------------------------------


-- Dump data of "django_content_type" ----------------------
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '9', 'account', 'emailaddress' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '8', 'account', 'emailconfirmation' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '1', 'admin', 'logentry' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '4', 'auth', 'group' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '3', 'auth', 'permission' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '2', 'auth', 'user' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '23', 'black_list', 'blacklist' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '22', 'contactform', 'contact' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '5', 'contenttypes', 'contenttype' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '12', 'myclient', 'client' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '14', 'myclient', 'historicalclient' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '11', 'myclient', 'naznach' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '13', 'myclient', 'okrug' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '10', 'myclient', 'prioritet' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '15', 'myclient', 'taskclient' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '16', 'myobject', 'historicalmyobject' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '17', 'myobject', 'myobject' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '18', 'myobject', 'stancmetro' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '19', 'seo', 'cian' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '21', 'seo', 'menageroptions' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '20', 'seo', 'seo' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '6', 'sessions', 'session' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '7', 'sites', 'site' );
-- ---------------------------------------------------------


-- Dump data of "django_migrations" ------------------------
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '1', 'contenttypes', '0001_initial', '2017-05-05 01:48:49.148328' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '2', 'auth', '0001_initial', '2017-05-05 01:48:52.617181' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '3', 'account', '0001_initial', '2017-05-05 01:48:53.526493' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '4', 'account', '0002_email_max_length', '2017-05-05 01:48:53.556699' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '5', 'admin', '0001_initial', '2017-05-05 01:48:54.341642' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '6', 'admin', '0002_logentry_remove_auto_add', '2017-05-05 01:48:54.364341' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '7', 'contenttypes', '0002_remove_content_type_name', '2017-05-05 01:48:54.484453' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '8', 'auth', '0002_alter_permission_name_max_length', '2017-05-05 01:48:54.518434' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '9', 'auth', '0003_alter_user_email_max_length', '2017-05-05 01:48:54.549410' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '10', 'auth', '0004_alter_user_username_opts', '2017-05-05 01:48:54.562590' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '11', 'auth', '0005_alter_user_last_login_null', '2017-05-05 01:48:54.600755' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '12', 'auth', '0006_require_contenttypes_0002', '2017-05-05 01:48:54.602096' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '13', 'auth', '0007_alter_validators_add_error_messages', '2017-05-05 01:48:54.615237' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '14', 'auth', '0008_alter_user_username_max_length', '2017-05-05 01:48:54.645555' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '15', 'sessions', '0001_initial', '2017-05-05 01:48:54.955294' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '16', 'sites', '0001_initial', '2017-05-05 01:48:55.221029' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '17', 'sites', '0002_alter_domain_unique', '2017-05-05 01:48:55.272815' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '18', 'myclient', '0001_initial', '2017-05-05 01:51:18.735460' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '19', 'myclient', '0002_auto_20170504_0052', '2017-05-05 01:51:18.775114' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '20', 'myclient', '0003_auto_20170504_0055', '2017-05-05 01:51:18.796515' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '21', 'myclient', '0004_auto_20170504_0058', '2017-05-05 01:51:18.820370' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '22', 'myclient', '0005_auto_20170504_0103', '2017-05-05 01:51:18.838747' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '23', 'myclient', '0006_auto_20170504_0109', '2017-05-05 01:51:18.923313' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '24', 'myclient', '0007_auto_20170504_0118', '2017-05-05 01:51:20.271140' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '25', 'myclient', '0008_auto_20170504_0455', '2017-05-05 01:51:20.546889' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '26', 'myclient', '0009_auto_20170505_0135', '2017-05-05 01:51:21.282059' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '27', 'myclient', '0010_auto_20170505_0229', '2017-05-05 01:51:21.322040' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '28', 'myobject', '0001_initial', '2017-05-11 21:54:26.774681' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '29', 'seo', '0001_initial', '2017-05-11 21:54:28.028637' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '30', 'seo', '0002_cian', '2017-05-11 21:54:28.426147' );
-- ---------------------------------------------------------


-- Dump data of "django_session" ---------------------------
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( '6t64bdtwwwm6mki6hddhyds7uudh00b8', 'NGQxZjI5ZjBhMGY1MmFiYTdiZDc2YjYzMWVmZThlZjNhZjY4NzFmMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJfYXV0aF91c2VyX2hhc2giOiIzODgwMWU2ODdmM2JmNjU5YTE2NmZlNmExYjExZjI2MDYyNmI0YmVhIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==', '2017-05-19 09:28:21.877828' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'dwar8actuw68e7mowzz0ma4zmeqtsw8z', 'YTBhYjU2YmUwZjE0YTI1MmRkYWMzYjc2Y2QyZGUyYzYyM2M2MTVjNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzMTA0N2U3ZTY3MWUzZTFhMTIyMmVhZmZlM2M0NDY4ZTQzNzcyMGIiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==', '2017-06-24 17:32:38.409091' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'hnpjl9gh393aygda0j37i4zi69roelhl', 'YzE4MDZiYTk1YjAyOGQ4NjU2OGRmMmZmM2ExNGQ5OWExMTVmNjk0ZTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTVkMGFmMWZkODIwNDZhZDE2NmViZjUzYWZhOGFkOWVmZDNiZDRiZCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2017-05-25 22:29:35.816691' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'mfudkc0po6lt8etqfwa60n0k23q0hhuv', 'Y2JmZmMzNzk2Nzc1MDkzODk0MzkwNGYxYzQ4MjlmOWU3OWVmZjhjZDp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjE1ZDBhZjFmZDgyMDQ2YWQxNjZlYmY1M2FmYThhZDllZmQzYmQ0YmQifQ==', '2017-05-29 10:47:02.564892' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'vuja3zeapxiwfh0evgo0ljnj6gohta7d', 'MDg3ZjUzMDkzN2JmNjU2ZjNmZDc4NzAxNGIxNGQ2MmE3NzczNzE1Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDAyNWQ2ZmE3MzM0MjY1MWI1YzY2NTcwNDQwZTFmMjEwOTg3ZGI0YyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2017-07-05 21:09:27.650176' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'w5h209myktd8tjuxle1wa7iiz7nudqea', 'NzI1ZjcwZDQxZDVjODU4MDA5MjE4NDk2NDUxYWY4Y2Y4ZGU3ZDA5NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE1ZDBhZjFmZDgyMDQ2YWQxNjZlYmY1M2FmYThhZDllZmQzYmQ0YmQiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX3Nlc3Npb25fZXhwaXJ5IjoxMjA5NjAwfQ==', '2017-05-26 16:13:23.896160' );
-- ---------------------------------------------------------


-- Dump data of "django_site" ------------------------------
INSERT INTO `django_site`(`id`,`domain`,`name`) VALUES ( '1', 'example.com', 'example.com' );
-- ---------------------------------------------------------


-- Dump data of "manager_options" --------------------------
INSERT INTO `manager_options`(`id`,`name`,`tel`,`tel_vlad`,`del_obj`,`edit_obj`,`look`,`user_id`) VALUES ( '1', 'Миша', '+380957506112', '1', '1', '1', '1', '2' );
INSERT INTO `manager_options`(`id`,`name`,`tel`,`tel_vlad`,`del_obj`,`edit_obj`,`look`,`user_id`) VALUES ( '2', 'superadmin', '+380957506112', '1', '1', '1', '1', '3' );
INSERT INTO `manager_options`(`id`,`name`,`tel`,`tel_vlad`,`del_obj`,`edit_obj`,`look`,`user_id`) VALUES ( '3', 'DJWOMS', '', '0', '0', '0', '0', '1' );
INSERT INTO `manager_options`(`id`,`name`,`tel`,`tel_vlad`,`del_obj`,`edit_obj`,`look`,`user_id`) VALUES ( '4', 'test', '', '0', '0', '0', '0', '4' );
-- ---------------------------------------------------------


-- Dump data of "metro" ------------------------------------
INSERT INTO `metro`(`id`,`color`,`name`) VALUES ( '1', 'Сокольническая', 'Сокольники' );
-- ---------------------------------------------------------


-- Dump data of "metro_okrug" ------------------------------
INSERT INTO `metro_okrug`(`id`,`stancmetro_id`,`okrug_id`) VALUES ( '1', '1', '4' );
-- ---------------------------------------------------------


-- Dump data of "myclient_historicalclient" ----------------
INSERT INTO `myclient_historicalclient`(`id`,`name`,`tel`,`email`,`hide`,`hide_date`,`area_ot`,`area_do`,`price_obsh`,`price_m`,`dop_kont`,`metro`,`adres`,`komisiya`,`etaj`,`podborka`,`type_obj`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`history_user_id`,`my_manager_id`,`naznach_one_id`,`naznach_two_id`) VALUES ( '4', 'Миша', '+380957506112', 'l2maximum@mail.ru', '0', NULL, '0', '0', '0', '0', '', '0', '0', '1', '0', '0', 'tc', '1', '2017-06-21 21:08:59.021290', NULL, '+', '4', '4', '18', NULL );
-- ---------------------------------------------------------


-- Dump data of "myobject_historicalmyobject" --------------
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '1', '1', 'Москва', '0', '0', '0', '0', '0', '0', '', '0', '', '', '', '', '', '', '', '0', NULL, '2017-06-22', '1', '2017-06-21 21:03:10.007655', NULL, '+', '1', '1', '1', NULL );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '1', '1', 'Москва', '3424', '0', '0', '0', '0', '0', '', '0', '', '', '', '', '', '', 'увпнукпавпавпиавпвапр', '0', NULL, '2017-06-22', '2', '2017-06-21 21:04:51.790516', NULL, '~', '1', '1', '1', NULL );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '1', '1', 'Москва', '0', '0', '0', '0', '0', '0', '', '0', '', '', '', '', '', '', '', '', NULL, '2017-06-22', '3', '2017-06-21 21:05:19.983403', NULL, '~', '1', '1', '1', NULL );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '2', '3', 'Москва', '0', '0', '0', '0', '0', '0', '', '0', '', '', '', '', '', '', 'fdbvfcxb', '0', NULL, '2017-06-22', '4', '2017-06-21 21:09:14.373775', NULL, '+', '4', '4', '1', NULL );
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
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '19', 'Другое', 'Промтовары' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '20', 'Другое', 'Ломбард\\Банк. Услуги' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '21', 'Другое', 'Ремонт\\Быт. Услуги' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '22', 'Другое', 'Одежда\\Обувь' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '23', 'Другое', 'Цветы' );
INSERT INTO `naznach`(`id`,`group`,`options`) VALUES ( '24', 'Другое', 'Другое' );
-- ---------------------------------------------------------


-- Dump data of "object" -----------------------------------
INSERT INTO `object`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '1', '1', 'Москва', '0', '0', '0', '0', '0', '0', '', '0', '', '', '', '', '', '', '', '', NULL, '2017-06-22', '1', '1', NULL );
INSERT INTO `object`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '2', '3', 'Москва', '0', '0', '0', '0', '0', '0', '', '0', '', '', '', '', '', '', 'fdbvfcxb', '0', NULL, '2017-06-22', '1', '1', NULL );
-- ---------------------------------------------------------


-- Dump data of "object_naznach" ---------------------------
INSERT INTO `object_naznach`(`id`,`myobject_id`,`naznach_id`) VALUES ( '1', '1', '4' );
INSERT INTO `object_naznach`(`id`,`myobject_id`,`naznach_id`) VALUES ( '2', '1', '22' );
-- ---------------------------------------------------------


-- Dump data of "object_okrug" -----------------------------
INSERT INTO `object_okrug`(`id`,`myobject_id`,`okrug_id`) VALUES ( '1', '1', '4' );
-- ---------------------------------------------------------


-- Dump data of "okrug" ------------------------------------
INSERT INTO `okrug`(`id`,`options`) VALUES ( '1', 'Юг' );
INSERT INTO `okrug`(`id`,`options`) VALUES ( '2', 'Север' );
INSERT INTO `okrug`(`id`,`options`) VALUES ( '3', 'Запад' );
INSERT INTO `okrug`(`id`,`options`) VALUES ( '4', 'Восток' );
INSERT INTO `okrug`(`id`,`options`) VALUES ( '5', 'Центр' );
INSERT INTO `okrug`(`id`,`options`) VALUES ( '6', 'Область' );
-- ---------------------------------------------------------


-- Dump data of "prioritet" --------------------------------
-- ---------------------------------------------------------


-- Dump data of "seo" --------------------------------------
INSERT INTO `seo`(`id`,`title`,`desc`,`keywords`) VALUES ( '1', 'Аренда у метро, аренда торговых площадей, аренда под магазин, аренда в метро, аренда отдела', 'Аренда у метро, аренда торговых площадей, аренда под магазин, аренда в метро, аренда отдела', 'аренда павильонов, аренда торговых павильонов, аренда торговых площадей, аренда торговых, аренда торговых помещений, торговое помещение в аренду, павильон в аренду, аренда торгового помещения, помещения в аренду, торговая аренда, аренда под магазин, аренда в подземных переходах, аренда в метро' );
-- ---------------------------------------------------------


-- Dump data of "task_client" ------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "account_emailaddress_user_id_2c513194_fk_auth_user_id" 
-- CREATE INDEX "account_emailaddress_user_id_2c513194_fk_auth_user_id" 
CREATE INDEX `account_emailaddress_user_id_2c513194_fk_auth_user_id` USING BTREE ON `account_emailaddress`( `user_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id" 
-- CREATE INDEX "account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id" 
CREATE INDEX `account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id` USING BTREE ON `account_emailconfirmation`( `email_address_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id" 
-- CREATE INDEX "auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id" 
CREATE INDEX `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` USING BTREE ON `auth_group_permissions`( `permission_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "auth_user_groups_group_id_97559544_fk_auth_group_id" 
-- CREATE INDEX "auth_user_groups_group_id_97559544_fk_auth_group_id" 
CREATE INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id` USING BTREE ON `auth_user_groups`( `group_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id" 
-- CREATE INDEX "auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id" 
CREATE INDEX `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` USING BTREE ON `auth_user_user_permissions`( `permission_id` );
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


-- CREATE INDEX "django_admin_log_user_id_c564eba6_fk_auth_user_id" 
-- CREATE INDEX "django_admin_log_user_id_c564eba6_fk_auth_user_id" 
CREATE INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id` USING BTREE ON `django_admin_log`( `user_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "django_admin__content_type_id_c4bce8eb_fk_django_content_type_id" 
-- CREATE INDEX "django_admin__content_type_id_c4bce8eb_fk_django_content_type_id" 
CREATE INDEX `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` USING BTREE ON `django_admin_log`( `content_type_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "django_session_de54fa62" ------------------
-- CREATE INDEX "django_session_de54fa62" ----------------------
CREATE INDEX `django_session_de54fa62` USING BTREE ON `django_session`( `expire_date` );
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


-- CREATE LINK "account_emailaddress_user_id_2c513194_fk_auth_user_id" 
-- CREATE LINK "account_emailaddress_user_id_2c513194_fk_auth_user_id" 
ALTER TABLE `account_emailaddress`
	ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id" 
-- CREATE LINK "account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id" 
ALTER TABLE `account_emailconfirmation`
	ADD CONSTRAINT `account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id` FOREIGN KEY ( `email_address_id` )
	REFERENCES `account_emailaddress`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id" 
-- CREATE LINK "auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id" 
ALTER TABLE `auth_group_permissions`
	ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY ( `permission_id` )
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


-- CREATE LINK "auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id" 
-- CREATE LINK "auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id" 
ALTER TABLE `auth_permission`
	ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY ( `content_type_id` )
	REFERENCES `django_content_type`( `id` )
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


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


