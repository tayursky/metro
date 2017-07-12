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
AUTO_INCREMENT = 76;
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
AUTO_INCREMENT = 1;
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
AUTO_INCREMENT = 26;
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
AUTO_INCREMENT = 5;
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
AUTO_INCREMENT = 5;
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
	`change_message` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
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
	`area_range` VarChar( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`history_id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`history_date` DateTime NOT NULL,
	`history_change_reason` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`history_type` VarChar( 1 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`change_message` LongText CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`history_user_id` Int( 11 ) NULL,
	`my_manager_id` Int( 11 ) NULL,
	`station_one_id` Int( 11 ) NULL,
	`station_two_id` Int( 11 ) NULL,
	PRIMARY KEY ( `history_id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 27;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "myobject_multiimages" ---------------------
-- CREATE TABLE "myobject_multiimages" -------------------------
CREATE TABLE `myobject_multiimages` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`title` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`file` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`uploaded_at` DateTime NOT NULL,
	`weight` Int( 11 ) NULL,
	`my_manager_id` Int( 11 ) NULL,
	`parent_id` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 21;
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
	`area_range` VarChar( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`my_manager_id` Int( 11 ) NOT NULL,
	`station_one_id` Int( 11 ) NOT NULL,
	`station_two_id` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 9;
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
AUTO_INCREMENT = 7;
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
AUTO_INCREMENT = 10;
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
AUTO_INCREMENT = 13;
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
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '4', 'Can add user', '2', 'add_user' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '5', 'Can change user', '2', 'change_user' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '6', 'Can delete user', '2', 'delete_user' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '7', 'Can add group', '3', 'add_group' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '8', 'Can change group', '3', 'change_group' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '9', 'Can delete group', '3', 'delete_group' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '10', 'Can add permission', '4', 'add_permission' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '11', 'Can change permission', '4', 'change_permission' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '12', 'Can delete permission', '4', 'delete_permission' );
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
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '28', 'Can add Клиент', '10', 'add_client' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '29', 'Can change Клиент', '10', 'change_client' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '30', 'Can delete Клиент', '10', 'delete_client' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '31', 'Can add historical Клиент', '11', 'add_historicalclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '32', 'Can change historical Клиент', '11', 'change_historicalclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '33', 'Can delete historical Клиент', '11', 'delete_historicalclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '34', 'Can add Задача клиента', '12', 'add_taskclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '35', 'Can change Задача клиента', '12', 'change_taskclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '36', 'Can delete Задача клиента', '12', 'delete_taskclient' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '37', 'Can add Назначение', '13', 'add_naznach' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '38', 'Can change Назначение', '13', 'change_naznach' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '39', 'Can delete Назначение', '13', 'delete_naznach' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '40', 'Can add Приоритет', '14', 'add_prioritet' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '41', 'Can change Приоритет', '14', 'change_prioritet' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '42', 'Can delete Приоритет', '14', 'delete_prioritet' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '43', 'Can add Округ', '15', 'add_okrug' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '44', 'Can change Округ', '15', 'change_okrug' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '45', 'Can delete Округ', '15', 'delete_okrug' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '46', 'Can add historical Объект', '16', 'add_historicalmyobject' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '47', 'Can change historical Объект', '16', 'change_historicalmyobject' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '48', 'Can delete historical Объект', '16', 'delete_historicalmyobject' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '49', 'Can add multi images', '17', 'add_multiimages' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '50', 'Can change multi images', '17', 'change_multiimages' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '51', 'Can delete multi images', '17', 'delete_multiimages' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '52', 'Can add Объект', '18', 'add_myobject' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '53', 'Can change Объект', '18', 'change_myobject' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '54', 'Can delete Объект', '18', 'delete_myobject' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '55', 'Can add Стация метро', '19', 'add_stancmetro' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '56', 'Can change Стация метро', '19', 'change_stancmetro' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '57', 'Can delete Стация метро', '19', 'delete_stancmetro' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '58', 'Can add Настройки циан', '20', 'add_cian' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '59', 'Can change Настройки циан', '20', 'change_cian' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '60', 'Can delete Настройки циан', '20', 'delete_cian' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '61', 'Can add Настроки прав', '21', 'add_menageroptions' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '62', 'Can change Настроки прав', '21', 'change_menageroptions' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '63', 'Can delete Настроки прав', '21', 'delete_menageroptions' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '64', 'Can add Настрока сайта\\SEO', '22', 'add_seo' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '65', 'Can change Настрока сайта\\SEO', '22', 'change_seo' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '66', 'Can delete Настрока сайта\\SEO', '22', 'delete_seo' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '67', 'Can add Обратная связь', '23', 'add_contact' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '68', 'Can change Обратная связь', '23', 'change_contact' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '69', 'Can delete Обратная связь', '23', 'delete_contact' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '70', 'Can add Черный список', '24', 'add_blacklist' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '71', 'Can change Черный список', '24', 'change_blacklist' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '72', 'Can delete Черный список', '24', 'delete_blacklist' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '73', 'Can add Фото база', '25', 'add_photo' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '74', 'Can change Фото база', '25', 'change_photo' );
INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES ( '75', 'Can delete Фото база', '25', 'delete_photo' );
-- ---------------------------------------------------------


-- Dump data of "auth_user" --------------------------------
INSERT INTO `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) VALUES ( '1', 'pbkdf2_sha256$36000$IufnHqMuplXN$Gny8qSN3N4v/E4ZoJ+UHtjzxrDOytl0D+zPev9pL4ik=', '2017-07-11 16:14:49.955735', '1', 'DJWOMS', '', '', 'l2maximum@mail.ru', '1', '1', '2017-06-28 14:24:54.977772' );
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
INSERT INTO `client`(`id`,`name`,`tel`,`email`,`hide`,`hide_date`,`area_ot`,`area_do`,`price_obsh`,`price_m`,`dop_kont`,`metro`,`adres`,`komisiya`,`etaj`,`podborka`,`type_obj`,`my_manager_id`,`naznach_one_id`,`naznach_two_id`) VALUES ( '1', 'Михаил Омельчекно', '+380957506112', 'socanime@gmail.com', '0', NULL, '50', '80', '10000', '100', 'Доп конт', '1', '0', '0', '1', '0', 'undeg', '1', '1', '2' );
-- ---------------------------------------------------------


-- Dump data of "client_okrug" -----------------------------
-- ---------------------------------------------------------


-- Dump data of "contact" ----------------------------------
-- ---------------------------------------------------------


-- Dump data of "django_admin_log" -------------------------
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '1', '2017-06-29 00:12:09.082256', '1', 'Север', '1', '[{"added": {}}]', '13', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '2', '2017-06-29 00:12:13.510381', '2', 'Юг', '1', '[{"added": {}}]', '13', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '3', '2017-06-29 00:12:16.597502', '3', 'Восток', '1', '[{"added": {}}]', '13', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '4', '2017-06-29 00:12:24.045690', '4', 'Запад', '1', '[{"added": {}}]', '13', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '5', '2017-06-29 00:12:31.511900', '5', 'Центр', '1', '[{"added": {}}]', '13', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '6', '2017-06-29 00:12:35.097009', '6', 'Область', '1', '[{"added": {}}]', '13', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '7', '2017-06-29 00:12:50.151450', '1', '1', '1', '[{"added": {}}]', '14', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '8', '2017-06-29 00:36:29.775306', '1', 'Речной вокзал', '1', '[{"added": {}}]', '17', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '9', '2017-06-29 00:37:09.525810', '2', 'Водный стадион', '1', '[{"added": {}}]', '17', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '10', '2017-06-29 00:37:41.913956', '3', 'Театральная', '1', '[{"added": {}}]', '17', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '11', '2017-06-29 00:38:06.357966', '4', 'Алма-Атинская', '1', '[{"added": {}}]', '17', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '12', '2017-06-29 00:38:49.397893', '1', 'Колбаса', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '13', '2017-06-29 00:38:56.115206', '2', 'Молоко', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '14', '2017-06-29 00:39:01.225432', '3', 'Табак', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '15', '2017-06-29 00:39:12.124943', '4', 'Кондитерка', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '16', '2017-06-29 00:39:21.643326', '5', 'Мясо', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '17', '2017-06-29 00:39:32.592753', '6', 'Фрукты\\Овощи', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '18', '2017-06-29 00:39:43.704204', '7', 'Кулинария', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '19', '2017-06-29 00:39:50.882474', '8', 'Пиво\\Алкоголь', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '20', '2017-06-29 00:39:54.148625', '9', 'Хлеб', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '21', '2017-06-29 00:40:02.200916', '10', 'Магазин продуктов', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '22', '2017-06-29 00:40:05.643075', '11', 'Рыба\\Икра', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '23', '2017-06-29 00:40:13.631402', '12', 'Чай и другое', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '24', '2017-06-29 00:40:45.562387', '13', 'Выпечка и подобное', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '25', '2017-06-29 00:40:51.711605', '14', 'Кофе с собой', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '26', '2017-06-29 00:40:57.636856', '15', 'Рестораны и другое', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '27', '2017-06-29 00:41:03.015024', '16', 'Шаурма\\Тандыр', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '28', '2017-06-29 00:41:17.397536', '14', 'Кофе с собой', '2', '[{"changed": {"fields": ["group"]}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '29', '2017-06-29 00:41:22.432749', '15', 'Рестораны и другое', '2', '[{"changed": {"fields": ["group"]}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '30', '2017-06-29 00:41:27.072961', '16', 'Шаурма\\Тандыр', '2', '[{"changed": {"fields": ["group"]}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '31', '2017-06-29 00:41:46.618640', '17', 'Аптека\\Оптика', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '32', '2017-06-29 00:41:51.364818', '18', 'Офис\\Мед. Услуги\\Салон кр.', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '33', '2017-06-29 00:42:00.494211', '19', 'Другое', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '34', '2017-06-29 00:42:06.994445', '20', 'Промтовары', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '35', '2017-06-29 00:42:13.916747', '21', 'Ломбард\\Банк. Услуги', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '36', '2017-06-29 00:42:18.395921', '22', 'Ремонт\\Быт. Услуги', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '37', '2017-06-29 00:42:26.128214', '23', 'Одежда\\Обувь', '1', '[{"added": {}}]', '15', '1' );
INSERT INTO `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) VALUES ( '38', '2017-06-29 00:42:31.582426', '24', 'Цветы', '1', '[{"added": {}}]', '15', '1' );
-- ---------------------------------------------------------


-- Dump data of "django_content_type" ----------------------
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '8', 'account', 'emailaddress' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '9', 'account', 'emailconfirmation' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '1', 'admin', 'logentry' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '3', 'auth', 'group' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '4', 'auth', 'permission' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '2', 'auth', 'user' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '24', 'black_list', 'blacklist' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '23', 'contactform', 'contact' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '5', 'contenttypes', 'contenttype' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '10', 'myclient', 'client' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '11', 'myclient', 'historicalclient' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '13', 'myclient', 'naznach' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '15', 'myclient', 'okrug' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '14', 'myclient', 'prioritet' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '12', 'myclient', 'taskclient' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '16', 'myobject', 'historicalmyobject' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '17', 'myobject', 'multiimages' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '18', 'myobject', 'myobject' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '19', 'myobject', 'stancmetro' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '25', 'photo_baza', 'photo' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '20', 'seo', 'cian' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '21', 'seo', 'menageroptions' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '22', 'seo', 'seo' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '6', 'sessions', 'session' );
INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES ( '7', 'sites', 'site' );
-- ---------------------------------------------------------


-- Dump data of "django_migrations" ------------------------
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '1', 'contenttypes', '0001_initial', '2017-07-07 18:16:23.123643' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '2', 'auth', '0001_initial', '2017-07-07 18:16:29.897152' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '3', 'account', '0001_initial', '2017-07-07 18:16:31.771346' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '4', 'account', '0002_email_max_length', '2017-07-07 18:16:32.473290' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '5', 'admin', '0001_initial', '2017-07-07 18:16:33.887780' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '6', 'admin', '0002_logentry_remove_auto_add', '2017-07-07 18:16:33.996754' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '7', 'contenttypes', '0002_remove_content_type_name', '2017-07-07 18:16:35.032939' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '8', 'auth', '0002_alter_permission_name_max_length', '2017-07-07 18:16:35.701496' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '9', 'auth', '0003_alter_user_email_max_length', '2017-07-07 18:16:36.388341' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '10', 'auth', '0004_alter_user_username_opts', '2017-07-07 18:16:36.439043' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '11', 'auth', '0005_alter_user_last_login_null', '2017-07-07 18:16:36.948219' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '12', 'auth', '0006_require_contenttypes_0002', '2017-07-07 18:16:37.031831' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '13', 'auth', '0007_alter_validators_add_error_messages', '2017-07-07 18:16:37.086005' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '14', 'auth', '0008_alter_user_username_max_length', '2017-07-07 18:16:37.709128' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '15', 'black_list', '0001_initial', '2017-07-07 18:16:37.980123' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '16', 'contactform', '0001_initial', '2017-07-07 18:16:38.649182' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '17', 'myclient', '0001_initial', '2017-07-07 18:16:49.133506' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '18', 'myclient', '0002_historicalclient', '2017-07-07 18:16:51.063820' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '19', 'myobject', '0001_initial', '2017-07-07 18:17:02.012105' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '20', 'myobject', '0002_historicalmyobject', '2017-07-07 18:17:04.601007' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '21', 'myobject', '0003_auto_20170629_0334', '2017-07-07 18:17:04.819380' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '22', 'myobject', '0004_auto_20170707_2116', '2017-07-07 18:17:06.449748' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '23', 'photo_baza', '0001_initial', '2017-07-07 18:17:07.461176' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '24', 'seo', '0001_initial', '2017-07-07 18:17:09.241543' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '25', 'sessions', '0001_initial', '2017-07-07 18:17:10.000865' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '26', 'sites', '0001_initial', '2017-07-07 18:17:10.387938' );
INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES ( '27', 'sites', '0002_alter_domain_unique', '2017-07-07 18:17:10.852885' );
-- ---------------------------------------------------------


-- Dump data of "django_session" ---------------------------
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( '20dtayc7p9qcy11ae7kghj4hqkyqxnt6', 'MWYyNTM2MDc0YTc1MjZlZGRmOThmOGVlN2U0MmNiMGZiYzE2ODM4ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjJjYmJlZTRmN2VmYmFkMzRjMDViOGI1YTJlN2JkMzJhNWE5YTFiYyIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==', '2017-07-21 18:19:39.012504' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'ai4h5il7r7osfs7weyq1hce4s2r6t63s', 'MWYyNTM2MDc0YTc1MjZlZGRmOThmOGVlN2U0MmNiMGZiYzE2ODM4ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjJjYmJlZTRmN2VmYmFkMzRjMDViOGI1YTJlN2JkMzJhNWE5YTFiYyIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==', '2017-07-25 16:14:50.027492' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 'gpimj2tc34s1nmccbr5jrn9xkr8358eb', 'NDdhYTNlYTM2ZGEzNmQ1YzE1MzFmMTRkYjJmNzNkMGY5ODViYjNlZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmNiYmVlNGY3ZWZiYWQzNGMwNWI4YjVhMmU3YmQzMmE1YTlhMWJjIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==', '2017-07-12 14:25:06.175413' );
INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES ( 't44z85g02ihvm6hlba00fws43ddrlpgj', 'NjI3N2NhNGFiNmI0Y2MwOWU1Mzk1YjU0YWE3NjRlYTA5Yjk4NTJkMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjJjYmJlZTRmN2VmYmFkMzRjMDViOGI1YTJlN2JkMzJhNWE5YTFiYyIsIl9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2017-07-13 00:10:13.135958' );
-- ---------------------------------------------------------


-- Dump data of "django_site" ------------------------------
INSERT INTO `django_site`(`id`,`domain`,`name`) VALUES ( '1', 'example.com', 'example.com' );
-- ---------------------------------------------------------


-- Dump data of "manager_options" --------------------------
INSERT INTO `manager_options`(`id`,`name`,`tel`,`tel_vlad`,`del_obj`,`edit_obj`,`look`,`user_id`) VALUES ( '1', 'DJWOMS', '', '0', '0', '0', '0', '1' );
-- ---------------------------------------------------------


-- Dump data of "metro" ------------------------------------
INSERT INTO `metro`(`id`,`color`,`name`) VALUES ( '1', '#008d50', 'Речной вокзал' );
INSERT INTO `metro`(`id`,`color`,`name`) VALUES ( '2', '#008d50', 'Водный стадион' );
INSERT INTO `metro`(`id`,`color`,`name`) VALUES ( '3', '#008d50', 'Театральная' );
INSERT INTO `metro`(`id`,`color`,`name`) VALUES ( '4', '#008d50', 'Алма-Атинская' );
-- ---------------------------------------------------------


-- Dump data of "metro_okrug" ------------------------------
INSERT INTO `metro_okrug`(`id`,`stancmetro_id`,`okrug_id`) VALUES ( '1', '1', '1' );
INSERT INTO `metro_okrug`(`id`,`stancmetro_id`,`okrug_id`) VALUES ( '2', '2', '1' );
INSERT INTO `metro_okrug`(`id`,`stancmetro_id`,`okrug_id`) VALUES ( '3', '3', '5' );
INSERT INTO `metro_okrug`(`id`,`stancmetro_id`,`okrug_id`) VALUES ( '4', '4', '2' );
-- ---------------------------------------------------------


-- Dump data of "myclient_historicalclient" ----------------
INSERT INTO `myclient_historicalclient`(`id`,`name`,`tel`,`email`,`hide`,`hide_date`,`area_ot`,`area_do`,`price_obsh`,`price_m`,`dop_kont`,`metro`,`adres`,`komisiya`,`etaj`,`podborka`,`type_obj`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`naznach_one_id`,`naznach_two_id`) VALUES ( '1', 'Михаил Омельчекно', '+380957506112', 'socanime@gmail.com', '0', NULL, '50', '80', '10000', '100', 'Доп конт', '1', '0', '0', '1', '0', 'undeg', '1', '2017-06-29 01:19:24.785106', NULL, '+', '[{\'added\': {\'object\': \'Клиент\', \'name\': \'Михаил Омельчекно\'}}]', '1', '1', '1', '2' );
-- ---------------------------------------------------------


-- Dump data of "myobject_historicalmyobject" --------------
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '1', '1', 'Ленина 100', '1000', '10', '100', '10', '1', '1000', 'Описание', '1', '10', 'Договор', '', '+380957506112', '', '', 'ЗАМЕТКА', '0', NULL, '2017-06-29', 'large', '1', '2017-06-29 01:20:47.212925', NULL, '+', '[{\'added\': {\'object\': \'Объект\', \'name\': \'Ленина 100\'}}]', '1', '1', '3', NULL );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '2', '1', 'Ленина 1002', '2000', '10', '200', '20', '1', '5000', 'Описание', '1', '15', 'Договор 2', '', '+380957506112', '', '', 'ЗАМЕТКА', '0', NULL, '2017-06-29', 'large', '2', '2017-06-29 01:21:31.606621', NULL, '+', '[{\'added\': {\'object\': \'Объект\', \'name\': \'Ленина 1002\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '3', '1', 'Макеевка', '100', '1000', '0', '0', '0', '0', '', '0', '55', '', '', '', '', '', '', '0', NULL, '2017-07-07', 'large', '3', '2017-07-07 18:22:53.023366', NULL, '+', '[{\'added\': {\'object\': \'Объект\', \'name\': \'Макеевка\'}}]', '1', '1', '1', '3' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '1', '1', 'Ленина 100', '1000', '10', '100', '10', '1', '1000', 'Описание', '1', '10', 'Договор', '', '+380957506112', '', '', 'ЗАМЕТКА', '0', NULL, '2017-06-29', 'large', '4', '2017-07-07 18:26:36.645965', NULL, '~', '[{\'changed\': {\'object\': \'Объект\', \'fields\': [\'Станция метро\'], \'name\': \'Ленина 100\'}}]', '1', '1', '1', NULL );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '2', '1', 'Ленина 1002', '2000', '10', '200', '20', '1', '5000', 'Описание', '1', '15', 'Договор 2', '', '+380957506112', '', '', 'ЗАМЕТКА', '0', NULL, '2017-06-29', 'large', '5', '2017-07-07 18:26:45.382710', NULL, '~', '[{\'no changed\': {\'object\': \'Объект\', \'name\': \'Ленина 1002\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '1', '1', 'Ленина 100', '1000', '10', '100', '10', '1', '1000', 'Описание', '1', '10', 'Договор', '', '+380957506112', '', '', 'ЗАМЕТКА', '0', NULL, '2017-06-29', 'large', '6', '2017-07-07 18:27:53.463658', NULL, '~', '[{\'changed\': {\'object\': \'Объект\', \'fields\': [\'Станция метро доп.\'], \'name\': \'Ленина 100\'}}]', '1', '1', '1', '3' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '2', '1', 'Ленина 1002', '2000', '10', '200', '20', '1', '5000', 'Описание', '1', '15', 'Договор 2', '', '+380957506112', '', '', 'ЗАМЕТКА', '0', NULL, '2017-06-29', 'large', '7', '2017-07-07 18:28:11.484906', NULL, '~', '[{\'no changed\': {\'object\': \'Объект\', \'name\': \'Ленина 1002\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '3', '1', 'Макеевка', '100', '1000', '0', '0', '0', '0', '', '0', '55', '', '', '', '', '', '', '0', NULL, '2017-07-07', 'large', '8', '2017-07-07 18:29:38.970998', NULL, '~', '[{\'no changed\': {\'object\': \'Объект\', \'name\': \'Макеевка\'}}]', '1', '1', '1', '3' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '2', '1', 'Ленина 1002', '2000', '10', '200', '20', '1', '5000', 'Описание', '1', '15', 'Договор 2', '', '+380957506112', '', '', 'ЗАМЕТКА', '0', NULL, '2017-06-29', 'large', '9', '2017-07-07 18:30:24.248993', NULL, '~', '[{\'no changed\': {\'object\': \'Объект\', \'name\': \'Ленина 1002\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '3', '1', 'Макеевка', '100', '1000', '0', '0', '0', '0', '', '0', '55', '', '', '', '', '', '', '0', NULL, '2017-07-07', 'large', '10', '2017-07-07 18:30:44.186210', NULL, '~', '[{\'changed\': {\'object\': \'Объект\', \'fields\': [\'Станция метро\', \'Станция метро доп.\'], \'name\': \'Макеевка\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '1', '1', 'Ленина 100', '1000', '10', '100', '10', '1', '1000', 'Описание', '1', '10', 'Договор', '', '+380957506112', '', '', 'ЗАМЕТКА', '0', NULL, '2017-06-29', 'large', '11', '2017-07-07 18:30:59.107526', NULL, '~', '[{\'changed\': {\'object\': \'Объект\', \'fields\': [\'Станция метро\', \'Станция метро доп.\'], \'name\': \'Ленина 100\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '1', '1', 'Ленина 100', '1000', '10', '100', '10', '1', '1000', 'Описание', '1', '10', 'Договор', '', '+380957506112', '', '', 'ЗАМЕТКА', '0', NULL, '2017-06-29', 'large', '12', '2017-07-07 18:32:46.983155', NULL, '~', '[{\'no changed\': {\'object\': \'Объект\', \'name\': \'Ленина 100\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '1', '1', 'Ленина 100', '1000', '10', '100', '10', '1', '1000', 'Описание', '1', '10', 'Договор', '', '+380957506112', '', '', 'ЗАМЕТКА', '0', NULL, '2017-06-29', 'large', '13', '2017-07-07 18:33:27.873654', NULL, '-', '[{\'deleted\': {\'object\': \'Объект\', \'name\': \'Ленина 100\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '2', '1', 'Ленина 1002', '2000', '10', '200', '20', '1', '5000', 'Описание', '1', '15', 'Договор 2', '', '+380957506112', '', '', 'ЗАМЕТКА', '0', NULL, '2017-06-29', 'large', '14', '2017-07-07 18:33:30.559972', NULL, '-', '[{\'deleted\': {\'object\': \'Объект\', \'name\': \'Ленина 1002\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '3', '1', 'Макеевка', '100', '1000', '0', '0', '0', '0', '', '0', '55', '', '', '', '', '', '', '0', NULL, '2017-07-07', 'large', '15', '2017-07-07 18:33:33.626360', NULL, '-', '[{\'deleted\': {\'object\': \'Объект\', \'name\': \'Макеевка\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '4', '1', 'Москва', '1000', '10', '100', '10', '1', '100', 'Описание', '1', '55', 'Договор', '', '+380957506112', '', '', 'Заметка', '0', NULL, '2017-07-07', 'large', '16', '2017-07-07 18:34:58.867273', NULL, '+', '[{\'added\': {\'object\': \'Объект\', \'name\': \'Москва\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '4', '1', 'Москва', '1000', '10', '100', '10', '1', '100', 'Описание', '1', '55', 'Договор', '', '+380957506112', '', '', 'Заметка', '0', NULL, '2017-07-07', 'large', '17', '2017-07-07 18:35:40.882290', NULL, '~', '[{\'no changed\': {\'object\': \'Объект\', \'name\': \'Москва\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '5', '3', 'Макеевка', '500', '20', '10', '5', '1', '10', 'Описание', '1', '2', 'Договор', '', '+380957506112', '', '', 'Заметка', '0', NULL, '2017-07-07', 'large', '18', '2017-07-07 18:58:52.055575', NULL, '+', '[{\'added\': {\'name\': \'Макеевка\', \'object\': \'Объект\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '5', '3', 'Макеевка', '500', '20', '10', '5', '1', '10', 'Описание', '1', '2', 'Договор', '', '+380957506112', '', '', 'Заметка', '0', NULL, '2017-07-07', 'large', '19', '2017-07-07 18:59:34.603554', NULL, '~', '[{\'no changed\': {\'name\': \'Макеевка\', \'object\': \'Объект\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '4', '1', 'Москва', '1000', '10', '100', '10', '1', '100', 'Описание', '1', '55', 'Договор', '', '+380957506112', '', '', 'Заметка', '0', NULL, '2017-07-07', 'large', '20', '2017-07-07 19:41:08.048354', NULL, '~', '[{\'no changed\': {\'name\': \'Москва\', \'object\': \'Объект\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '6', '3', 'Макеевка', '500', '20', '10', '5', '1', '10', 'Описание', '1', '2', 'Договор', '', '+380957506112', '', '', 'Заметка', '0', NULL, '2017-07-07', 'large', '21', '2017-07-07 19:45:10.361221', NULL, '+', '[{\'added\': {\'name\': \'Макеевка\', \'object\': \'Объект\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '6', '3', 'Макеевка', '500', '20', '10', '5', '1', '10', 'Описание', '1', '2', 'Договор', '', '+380957506112', '', '', 'Заметка', '0', NULL, '2017-07-07', 'large', '22', '2017-07-07 19:49:00.387280', NULL, '~', '[{\'no changed\': {\'name\': \'Макеевка\', \'object\': \'Объект\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '7', '3', 'Макеевка', '500', '20', '10', '5', '1', '10', 'Описание', '1', '2', 'Договор', '', '+380957506112', '', '', 'Заметка', '0', NULL, '2017-07-07', 'large', '23', '2017-07-07 19:49:23.557474', NULL, '+', '[{\'added\': {\'name\': \'Макеевка\', \'object\': \'Объект\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '7', '3', 'Макеевка', '500', '20', '10', '5', '1', '10', 'Описание', '1', '2', 'Договор', '', '+380957506112', '', '', 'Заметка', '0', NULL, '2017-07-07', 'large', '24', '2017-07-07 19:49:38.803341', NULL, '~', '[{\'no changed\': {\'name\': \'Макеевка\', \'object\': \'Объект\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '7', '3', 'ул. Ленина д. 100', '500', '20', '10', '5', '1', '10', 'Описание', '1', '2', 'Договор', '', '+380957506112', '', '', 'Заметка', '0', NULL, '2017-07-07', 'large', '25', '2017-07-07 20:01:37.867727', NULL, '~', '[{\'changed\': {\'name\': \'ул. Ленина д. 100\', \'fields\': [\'Адрес\'], \'object\': \'Объект\'}}]', '1', '1', '3', '1' );
INSERT INTO `myobject_historicalmyobject`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`history_id`,`history_date`,`history_change_reason`,`history_type`,`change_message`,`history_user_id`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '8', '4', 'ул. Ленина д. 101', '5000', '50', '100', '10', '1', '100', 'Хоршая проходимость', '0', '6', 'Договор', '', '+380957506112', '', '', '', '0', NULL, '2017-07-11', 'large', '26', '2017-07-11 16:16:10.096209', NULL, '+', '[{\'added\': {\'object\': \'Объект\', \'name\': \'ул. Ленина д. 101\'}}]', '1', '1', '3', NULL );
-- ---------------------------------------------------------


-- Dump data of "myobject_multiimages" ---------------------
INSERT INTO `myobject_multiimages`(`id`,`title`,`file`,`uploaded_at`,`weight`,`my_manager_id`,`parent_id`) VALUES ( '7', '', 'object_photos/201707/097.jpg', '2017-07-07 18:34:44.412168', '1', '1', '4' );
INSERT INTO `myobject_multiimages`(`id`,`title`,`file`,`uploaded_at`,`weight`,`my_manager_id`,`parent_id`) VALUES ( '8', '', 'object_photos/201707/i.jpg', '2017-07-07 18:34:56.666064', '1', '1', '4' );
INSERT INTO `myobject_multiimages`(`id`,`title`,`file`,`uploaded_at`,`weight`,`my_manager_id`,`parent_id`) VALUES ( '9', '', 'object_photos/201707/object_398.jpg', '2017-07-07 18:34:56.806084', '1', '1', '4' );
INSERT INTO `myobject_multiimages`(`id`,`title`,`file`,`uploaded_at`,`weight`,`my_manager_id`,`parent_id`) VALUES ( '10', '', 'object_photos/201707/oktyabrskaya.jpg', '2017-07-07 18:34:56.887327', '1', '1', '4' );
INSERT INTO `myobject_multiimages`(`id`,`title`,`file`,`uploaded_at`,`weight`,`my_manager_id`,`parent_id`) VALUES ( '11', '', 'object_photos/201707/metro.jpg', '2017-07-07 18:34:56.969361', '1', '1', '4' );
INSERT INTO `myobject_multiimages`(`id`,`title`,`file`,`uploaded_at`,`weight`,`my_manager_id`,`parent_id`) VALUES ( '12', '', 'object_photos/201707/097_z7JJjAh.jpg', '2017-07-07 18:58:46.131121', '2', '1', '5' );
INSERT INTO `myobject_multiimages`(`id`,`title`,`file`,`uploaded_at`,`weight`,`my_manager_id`,`parent_id`) VALUES ( '13', '', 'object_photos/201707/oktyabrskaya_vHfmVrL.jpg', '2017-07-07 18:58:50.241609', '1', '1', '5' );
INSERT INTO `myobject_multiimages`(`id`,`title`,`file`,`uploaded_at`,`weight`,`my_manager_id`,`parent_id`) VALUES ( '14', '', 'object_photos/201707/4.jpg', '2017-07-07 19:48:58.667003', '1', '1', '6' );
INSERT INTO `myobject_multiimages`(`id`,`title`,`file`,`uploaded_at`,`weight`,`my_manager_id`,`parent_id`) VALUES ( '15', '', 'object_photos/201707/5.jpeg', '2017-07-07 19:48:58.863408', '1', '1', '6' );
INSERT INTO `myobject_multiimages`(`id`,`title`,`file`,`uploaded_at`,`weight`,`my_manager_id`,`parent_id`) VALUES ( '16', '', 'object_photos/201707/2.jpg', '2017-07-07 19:49:37.462375', '1', '1', '7' );
INSERT INTO `myobject_multiimages`(`id`,`title`,`file`,`uploaded_at`,`weight`,`my_manager_id`,`parent_id`) VALUES ( '17', '', 'object_photos/201707/3.jpg', '2017-07-07 19:49:37.588511', '1', '1', '7' );
INSERT INTO `myobject_multiimages`(`id`,`title`,`file`,`uploaded_at`,`weight`,`my_manager_id`,`parent_id`) VALUES ( '18', '', 'object_photos/201707/4_JabQtZk.jpg', '2017-07-07 19:49:37.672108', '1', '1', '7' );
INSERT INTO `myobject_multiimages`(`id`,`title`,`file`,`uploaded_at`,`weight`,`my_manager_id`,`parent_id`) VALUES ( '19', '', 'object_photos/201707/3_X4vmwJ2.jpg', '2017-07-11 16:16:06.351320', '1', '1', '8' );
INSERT INTO `myobject_multiimages`(`id`,`title`,`file`,`uploaded_at`,`weight`,`my_manager_id`,`parent_id`) VALUES ( '20', '', 'object_photos/201707/4_2qnBJPR.jpg', '2017-07-11 16:16:06.469497', '2', '1', '8' );
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
INSERT INTO `object`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '4', '1', 'Москва', '1000', '10', '100', '10', '1', '100', 'Описание', '1', '55', 'Договор', '', '+380957506112', '', '', 'Заметка', '0', NULL, '2017-07-07', 'large', '1', '3', '1' );
INSERT INTO `object`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '5', '3', 'Макеевка', '500', '20', '10', '5', '1', '10', 'Описание', '1', '2', 'Договор', '', '+380957506112', '', '', 'Заметка', '0', NULL, '2017-07-07', 'large', '1', '3', '1' );
INSERT INTO `object`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '6', '3', 'Макеевка', '500', '20', '10', '5', '1', '10', 'Описание', '1', '2', 'Договор', '', '+380957506112', '', '', 'Заметка', '0', NULL, '2017-07-07', 'large', '1', '3', '1' );
INSERT INTO `object`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '7', '3', 'ул. Ленина д. 100', '500', '20', '10', '5', '1', '10', 'Описание', '1', '2', 'Договор', '', '+380957506112', '', '', 'Заметка', '0', NULL, '2017-07-07', 'large', '1', '3', '1' );
INSERT INTO `object`(`id`,`typeobj`,`adres`,`area`,`block_area`,`block_price`,`block_procent`,`etaj`,`price`,`opis`,`dom`,`kvt`,`dogovor`,`block_name`,`block_tel`,`block_email`,`silka`,`zametka`,`hide`,`hide_date`,`zvon`,`area_range`,`my_manager_id`,`station_one_id`,`station_two_id`) VALUES ( '8', '4', 'ул. Ленина д. 101', '5000', '50', '100', '10', '1', '100', 'Хоршая проходимость', '0', '6', 'Договор', '', '+380957506112', '', '', '', '0', NULL, '2017-07-11', 'large', '1', '3', NULL );
-- ---------------------------------------------------------


-- Dump data of "object_naznach" ---------------------------
INSERT INTO `object_naznach`(`id`,`myobject_id`,`naznach_id`) VALUES ( '2', '6', '1' );
INSERT INTO `object_naznach`(`id`,`myobject_id`,`naznach_id`) VALUES ( '3', '6', '2' );
INSERT INTO `object_naznach`(`id`,`myobject_id`,`naznach_id`) VALUES ( '4', '7', '1' );
INSERT INTO `object_naznach`(`id`,`myobject_id`,`naznach_id`) VALUES ( '5', '7', '2' );
INSERT INTO `object_naznach`(`id`,`myobject_id`,`naznach_id`) VALUES ( '6', '8', '5' );
-- ---------------------------------------------------------


-- Dump data of "object_okrug" -----------------------------
INSERT INTO `object_okrug`(`id`,`myobject_id`,`okrug_id`) VALUES ( '1', '4', '1' );
INSERT INTO `object_okrug`(`id`,`myobject_id`,`okrug_id`) VALUES ( '2', '4', '2' );
INSERT INTO `object_okrug`(`id`,`myobject_id`,`okrug_id`) VALUES ( '3', '5', '1' );
INSERT INTO `object_okrug`(`id`,`myobject_id`,`okrug_id`) VALUES ( '4', '5', '2' );
INSERT INTO `object_okrug`(`id`,`myobject_id`,`okrug_id`) VALUES ( '5', '6', '1' );
INSERT INTO `object_okrug`(`id`,`myobject_id`,`okrug_id`) VALUES ( '6', '6', '2' );
INSERT INTO `object_okrug`(`id`,`myobject_id`,`okrug_id`) VALUES ( '7', '7', '1' );
INSERT INTO `object_okrug`(`id`,`myobject_id`,`okrug_id`) VALUES ( '8', '7', '2' );
INSERT INTO `object_okrug`(`id`,`myobject_id`,`okrug_id`) VALUES ( '9', '8', '4' );
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
INSERT INTO `photo_baza`(`id`,`image`,`is_main`,`is_active`,`created`,`station_id`) VALUES ( '1', 'photo_baza/2017_07_07_212553_752878.jpg', '0', '1', '2017-07-07 18:25:54.748052', '1' );
INSERT INTO `photo_baza`(`id`,`image`,`is_main`,`is_active`,`created`,`station_id`) VALUES ( '2', 'photo_baza/2017_07_07_212554_795811.jpg', '0', '1', '2017-07-07 18:25:54.854323', '1' );
INSERT INTO `photo_baza`(`id`,`image`,`is_main`,`is_active`,`created`,`station_id`) VALUES ( '3', 'photo_baza/2017_07_07_212555_001307.jpg', '0', '1', '2017-07-07 18:25:55.167909', '1' );
INSERT INTO `photo_baza`(`id`,`image`,`is_main`,`is_active`,`created`,`station_id`) VALUES ( '4', 'photo_baza/2017_07_07_212555_251775.jpg', '0', '1', '2017-07-07 18:25:55.322611', '1' );
INSERT INTO `photo_baza`(`id`,`image`,`is_main`,`is_active`,`created`,`station_id`) VALUES ( '5', 'photo_baza/2017_07_07_212555_368834.jpg', '0', '1', '2017-07-07 18:25:55.452075', '1' );
INSERT INTO `photo_baza`(`id`,`image`,`is_main`,`is_active`,`created`,`station_id`) VALUES ( '6', 'photo_baza/2017_07_07_212845_671219.jpg', '0', '1', '2017-07-07 18:28:45.839009', '1' );
INSERT INTO `photo_baza`(`id`,`image`,`is_main`,`is_active`,`created`,`station_id`) VALUES ( '7', 'photo_baza/2017_07_07_212845_868074.jpg', '0', '1', '2017-07-07 18:28:45.968620', '1' );
INSERT INTO `photo_baza`(`id`,`image`,`is_main`,`is_active`,`created`,`station_id`) VALUES ( '8', 'photo_baza/2017_07_07_212846_018518.jpg', '0', '1', '2017-07-07 18:28:46.111773', '1' );
INSERT INTO `photo_baza`(`id`,`image`,`is_main`,`is_active`,`created`,`station_id`) VALUES ( '9', 'photo_baza/2017_07_07_220210_079475.jpg', '0', '1', '2017-07-07 19:02:11.124081', '1' );
INSERT INTO `photo_baza`(`id`,`image`,`is_main`,`is_active`,`created`,`station_id`) VALUES ( '10', 'photo_baza/2017_07_07_220211_218309.jpg', '0', '1', '2017-07-07 19:02:11.271737', '1' );
INSERT INTO `photo_baza`(`id`,`image`,`is_main`,`is_active`,`created`,`station_id`) VALUES ( '11', 'photo_baza/2017_07_07_220225_488179.jpg', '0', '1', '2017-07-07 19:02:25.696242', '3' );
INSERT INTO `photo_baza`(`id`,`image`,`is_main`,`is_active`,`created`,`station_id`) VALUES ( '12', 'photo_baza/2017_07_07_220225_737504.jpg', '0', '1', '2017-07-07 19:02:25.829740', '3' );
-- ---------------------------------------------------------


-- Dump data of "prioritet" --------------------------------
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


-- CREATE INDEX "myobject_multiimages_my_manager_id_5b388d85_fk_auth_user_id" 
-- CREATE INDEX "myobject_multiimages_my_manager_id_5b388d85_fk_auth_user_id" 
CREATE INDEX `myobject_multiimages_my_manager_id_5b388d85_fk_auth_user_id` USING BTREE ON `myobject_multiimages`( `my_manager_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "myobject_multiimages_parent_id_99cdc799_fk_object_id" 
-- CREATE INDEX "myobject_multiimages_parent_id_99cdc799_fk_object_id" 
CREATE INDEX `myobject_multiimages_parent_id_99cdc799_fk_object_id` USING BTREE ON `myobject_multiimages`( `parent_id` );
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


-- CREATE LINK "myobject_multiimages_my_manager_id_5b388d85_fk_auth_user_id" 
-- CREATE LINK "myobject_multiimages_my_manager_id_5b388d85_fk_auth_user_id" 
ALTER TABLE `myobject_multiimages`
	ADD CONSTRAINT `myobject_multiimages_my_manager_id_5b388d85_fk_auth_user_id` FOREIGN KEY ( `my_manager_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "myobject_multiimages_parent_id_99cdc799_fk_object_id" 
-- CREATE LINK "myobject_multiimages_parent_id_99cdc799_fk_object_id" 
ALTER TABLE `myobject_multiimages`
	ADD CONSTRAINT `myobject_multiimages_parent_id_99cdc799_fk_object_id` FOREIGN KEY ( `parent_id` )
	REFERENCES `object`( `id` )
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


