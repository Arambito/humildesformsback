-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.3.0-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para survey
CREATE DATABASE IF NOT EXISTS `survey` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci */;
USE `survey`;

-- Volcando estructura para tabla survey.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla survey.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla survey.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla survey.migrations: ~8 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_04_29_120942_create_surveys_table', 1),
	(6, '2023_04_29_122248_create_survey_questions_table', 1),
	(7, '2023_04_29_122330_create_survey_answers_table', 1),
	(8, '2023_04_29_122347_create_survey_question_answers_table', 1);

-- Volcando estructura para tabla survey.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla survey.password_reset_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla survey.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla survey.personal_access_tokens: ~4 rows (aproximadamente)
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(1, 'App\\Models\\User', 1, 'master', '31b16d1d0bf71f54835c936207ec7180936defd7cd5c8bd67e1dad43544d6811', '["*"]', '2023-10-19 04:09:20', NULL, '2023-10-19 03:51:20', '2023-10-19 04:09:20'),
	(2, 'App\\Models\\User', 1, 'master', '1afe2ee5572dc1477e54195a3521169bd8a34ef463c4c0a3b63ae4eae0398085', '["*"]', NULL, NULL, '2023-10-19 04:28:40', '2023-10-19 04:28:40'),
	(3, 'App\\Models\\User', 1, 'master', '787a6995eadc576a594cb99c042983900030f17f280f64427330d3cf4d15a457', '["*"]', NULL, NULL, '2023-10-19 04:32:56', '2023-10-19 04:32:56'),
	(4, 'App\\Models\\User', 1, 'master', 'a79ecff08a2e98afa5ae5006667d42ab7c670c7029a78491ae29fe710e26f176', '["*"]', NULL, NULL, '2023-10-19 04:32:59', '2023-10-19 04:32:59');

-- Volcando estructura para tabla survey.surveys
CREATE TABLE IF NOT EXISTS `surveys` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(500) NOT NULL,
  `slug` varchar(500) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expire_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla survey.surveys: ~0 rows (aproximadamente)

-- Volcando estructura para tabla survey.survey_answers
CREATE TABLE IF NOT EXISTS `survey_answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `survey_id` bigint(20) unsigned NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla survey.survey_answers: ~8 rows (aproximadamente)
INSERT INTO `survey_answers` (`id`, `survey_id`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
	(1, 1, '2023-10-19 03:51:56', NULL, '2023-10-19 03:51:56', '2023-10-19 03:51:56'),
	(2, 1, '2023-10-19 03:51:56', '2023-10-19 03:52:04', '2023-10-19 03:51:56', '2023-10-19 03:52:04'),
	(3, 1, '2023-10-19 03:52:14', NULL, '2023-10-19 03:52:14', '2023-10-19 03:52:14'),
	(4, 1, '2023-10-19 03:52:14', '2023-10-19 03:56:14', '2023-10-19 03:52:14', '2023-10-19 03:56:14'),
	(5, 1, '2023-10-19 03:57:31', NULL, '2023-10-19 03:57:31', '2023-10-19 03:57:31'),
	(6, 1, '2023-10-19 03:57:32', NULL, '2023-10-19 03:57:32', '2023-10-19 03:57:32'),
	(7, 1, '2023-10-19 04:08:19', NULL, '2023-10-19 04:08:19', '2023-10-19 04:08:19'),
	(8, 1, '2023-10-19 04:08:19', '2023-10-19 04:08:28', '2023-10-19 04:08:19', '2023-10-19 04:08:28');

-- Volcando estructura para tabla survey.survey_questions
CREATE TABLE IF NOT EXISTS `survey_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(200) NOT NULL,
  `type` varchar(50) NOT NULL,
  `question` varchar(2000) NOT NULL,
  `description` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `survey_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla survey.survey_questions: ~1 rows (aproximadamente)
INSERT INTO `survey_questions` (`id`, `uuid`, `type`, `question`, `description`, `data`, `survey_id`, `created_at`, `updated_at`) VALUES
	(1, '8769f94d-f4f5-4dbc-b026-6480646c0046', 'text', 'sex', 'sex', '[]', 1, '2023-10-19 03:51:54', '2023-10-19 03:51:54');

-- Volcando estructura para tabla survey.survey_question_answers
CREATE TABLE IF NOT EXISTS `survey_question_answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `survey_question_id` bigint(20) unsigned NOT NULL,
  `survey_answer_id` bigint(20) unsigned NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla survey.survey_question_answers: ~3 rows (aproximadamente)
INSERT INTO `survey_question_answers` (`id`, `survey_question_id`, `survey_answer_id`, `answer`, `created_at`, `updated_at`) VALUES
	(1, 1, 2, 'sex', '2023-10-19 03:52:04', '2023-10-19 03:52:04'),
	(2, 1, 4, 'sex', '2023-10-19 03:56:14', '2023-10-19 03:56:14'),
	(3, 1, 8, 'sdsdasdasdasd', '2023-10-19 04:08:28', '2023-10-19 04:08:28');

-- Volcando estructura para tabla survey.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla survey.users: ~1 rows (aproximadamente)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Deimos', 'dei@humildesrp.cl', NULL, '$2y$10$nkH37LzkGLF5DxD5L0YzNetk2lsZJO9b9mQGOX7rq8kUQM52TDXXe', '9b3Ni5oXzGOlahejoko7vRQLQTZkizGzmVLE10hwcUTaZjdlk6JrYRJ7TaDa', '2023-10-19 03:51:20', '2023-10-19 03:51:20');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
