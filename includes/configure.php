<?php
// set the level of error reporting
  error_reporting(E_ALL);

  const HTTP_SERVER = 'http://localhost';
  const COOKIE_OPTIONS = [
    'lifetime' => 0,
    'domain' => 'localhost',
    'path' => '/oscommerce/',
    'samesite' => 'Lax',
  ];
  const DIR_WS_CATALOG = '/oscommerce/';

  const DIR_FS_CATALOG = '/Applications/XAMPP/xamppfiles/htdocs/oscommerce/';

  date_default_timezone_set(date_default_timezone_get());

// If you are asked to provide configure.php details
// please remove the data below before sharing
  const DB_SERVER = 'localhost';
  const DB_SERVER_USERNAME = 'root';
  const DB_SERVER_PASSWORD = '';
  const DB_DATABASE = 'oscommerce_db';
