SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+03:00";

CREATE TABLE `examdb` (
  `id` int(6) UNSIGNED NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `exam-db` (`id`, `firstname`, `lastname`, `email`, `reg_date`) VALUES
(1, 'Andrii', 'Moroz', 'andrii.moroz.rob@gmail.com', '2021-10-07 12:01:44');

ALTER TABLE `examdb`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `examdb`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;