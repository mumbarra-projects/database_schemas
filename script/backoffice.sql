CREATE TABLE IF NOT EXISTS `company` (
  `id` BIGINT NOT NULL,
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
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC) VISIBLE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `user` (
  `id` BIGINT NOT NULL,
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
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC) VISIBLE,
  INDEX `fk_user_company_idx` (`company_id` ASC) VISIBLE,
  CONSTRAINT `fk_company_user` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;