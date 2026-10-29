<?php
/*
  $Id$

  CE Phoenix, E-Commerce made Easy
  https://phoenixcart.org

  Copyright (c) 2021 Phoenix Cart

  Released under the GNU General Public License
*/

define('TABLE_HEADING_NEW_PRODUCTS', 'Produk Terbaru');

define('TEXT_NO_PRODUCTS', 'Belum ada produk di kategori ini.');
define('TEXT_NUMBER_OF_PRODUCTS', 'Jumlah Produk: ');
define('TEXT_SHOW', '<strong>Tampilkan:</strong>');
define('TEXT_BUY', 'Buy 1 \'');
define('TEXT_NOW', '\' now');
define('TEXT_ALL_CATEGORIES', 'Semua Kategori');
define('TEXT_ALL_MANUFACTURERS', 'Semua Produsen');

// seo
if ( ($category_depth == 'top') && (!isset($_GET['manufacturers_id'])) ) {
  define('META_SEO_TITLE', 'Index Page Title');
  define('META_SEO_DESCRIPTION', 'Dwell&Co Fine Home & Living: peralatan dapur, penyimpanan, dekorasi, dan perawatan rumah pilihan. Bayar di tempat (COD).');
}

