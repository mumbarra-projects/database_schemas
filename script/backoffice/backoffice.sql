CREATE TABLE IF NOT EXISTS `company` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(45) NOT NULL,
  `name` VARCHAR(250) NOT NULL,
  `business_name` VARCHAR(250) NOT NULL,
  `document` VARCHAR(14) NOT NULL,
  `address` VARCHAR(250) NULL,
  `zip_code` VARCHAR(8) NULL,
  `phone` VARCHAR(14) NULL,
  `email` VARCHAR(250) NOT NULL,
  `status` ENUM("ACTIVE", "INACTIVE") NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC) VISIBLE,
  UNIQUE INDEX `document_UNIQUE` (`document` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `service` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(45) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL,
  `level` ENUM("FREE", "LIGHT", "PRO") NOT NULL,
  `status` ENUM("ACTIVE", "INACTIVE") NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC) VISIBLE,
  UNIQUE INDEX `level_UNIQUE` (`level` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(45) NOT NULL,
  `name` VARCHAR(250) NOT NULL,
  `document` VARCHAR(14) NOT NULL,
  `username` VARCHAR(250) NOT NULL,
  `email` VARCHAR(250) NULL,
  `password` VARCHAR(250) NOT NULL,
  `status` ENUM("ACTIVE", "INACTIVE") NOT NULL,
  `access_level` ENUM("ADMIN", "CUSTOMER", "EMPLOYEE") NOT NULL,
  `company_id` BIGINT NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC) VISIBLE,
  INDEX `fk_user_company_idx` (`company_id` ASC) VISIBLE,
  UNIQUE INDEX `document_UNIQUE` (`document` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) INVISIBLE,
  CONSTRAINT `fk_company_user` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `company_service` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(45) NOT NULL,
  `api_key` VARCHAR(45) NOT NULL,
  `company_id` BIGINT NOT NULL,
  `service_id` BIGINT NOT NULL,
  `status` ENUM("PENDING", "ACTIVE", "BLOCKED", "CLOSED") NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC) VISIBLE,
  UNIQUE INDEX `api_key_UNIQUE` (`api_key` ASC) VISIBLE,
  INDEX `fk_company_service_company_idx` (`company_id` ASC) VISIBLE,
  INDEX `fk_company_service_service_idx` (`service_id` ASC) VISIBLE,
  CONSTRAINT `fk_company_service_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_company_service_service` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;