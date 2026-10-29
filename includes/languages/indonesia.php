<?php
/*
  $Id$

  CE Phoenix, E-Commerce made Easy
  https://phoenixcart.org

  Copyright (c) 2021 Phoenix Cart

  Released under the GNU General Public License
*/

// look in your $PATH_LOCALE/locale directory for available locales
// or type locale -a on the server.
// Array examples which should work on all servers:
// 'en_US.UTF-8', 'en_US.UTF8', 'enu_usa'
// 'en_GB.UTF-8', 'en_GB.UTF8', 'eng_gb'
// 'en_AU.UTF-8', 'en_AU.UTF8', 'ena_au'
@setlocale(LC_ALL, ['id_ID.UTF-8', 'id_ID.UTF8', 'id_ID']);

const DATE_FORMAT_SHORT = '%d/%m/%Y';  // this is used for strftime()
const DATE_FORMAT_LONG = '%A %d %B, %Y'; // this is used for strftime()
const DATE_FORMAT = 'd/m/Y'; // this is used for date()
const DATE_TIME_FORMAT = DATE_FORMAT_SHORT . ' %H:%M:%S';
const JQUERY_DATEPICKER_FORMAT = 'dd/mm/yy'; // see http://docs.jquery.com/UI/Datepicker/formatDate

// if USE_DEFAULT_LANGUAGE_CURRENCY is true, use the following currency, instead of the application's default currency (used when changing language)
const LANGUAGE_CURRENCY = 'IDR';

// Global entries for the <html> tag
const HTML_PARAMS = '';

// charset for web pages and emails
const CHARSET = 'utf-8';

// page title
const TITLE = STORE_NAME;

// text in includes/modules/downloads.php
const HEADER_TITLE_MY_ACCOUNT = 'Akun Saya';

// checkout procedure text
const CHECKOUT_BAR_DELIVERY = 'Informasi Pengiriman';
const CHECKOUT_BAR_PAYMENT = 'Informasi Pembayaran';
const CHECKOUT_BAR_CONFIRMATION = 'Konfirmasi';

// pull down default text
const PULL_DOWN_DEFAULT = 'Silakan Pilih';

// javascript messages
const JS_ERROR = 'Errors have occured during the process of your form.\n\nPlease make the following corrections:\n\n';

const JS_ERROR_NO_PAYMENT_MODULE_SELECTED = '* Silakan pilih metode pembayaran untuk pesanan Anda.\n';

const ERROR_NO_PAYMENT_MODULE_SELECTED = 'Silakan pilih metode pembayaran untuk pesanan Anda.';

// constants for use in tep_prev_next_display function
const TEXT_RESULT_PAGE = 'Halaman:';
const TEXT_DISPLAY_NUMBER_OF_PRODUCTS = 'Menampilkan <strong>%d</strong> sampai <strong>%d</strong> (dari <strong>%d</strong> produk)';

const PREVNEXT_TITLE_FIRST_PAGE = 'Halaman Pertama';
const PREVNEXT_TITLE_PREVIOUS_PAGE = 'Halaman Sebelumnya';
const PREVNEXT_TITLE_NEXT_PAGE = 'Halaman Berikutnya';
const PREVNEXT_TITLE_LAST_PAGE = 'Halaman Terakhir';
const PREVNEXT_TITLE_PAGE_NO = 'Halaman %d';
const PREVNEXT_TITLE_PREV_SET_OF_NO_PAGE = '%d Halaman Sebelumnya';
const PREVNEXT_TITLE_NEXT_SET_OF_NO_PAGE = '%d Halaman Berikutnya';
const PREVNEXT_BUTTON_FIRST = '&lt;&lt;PERTAMA';
const PREVNEXT_BUTTON_PREV = '[&lt;&lt;&nbsp;Sebelumnya]';
const PREVNEXT_BUTTON_NEXT = '[Berikutnya&nbsp;&gt;&gt;]';
const PREVNEXT_BUTTON_LAST = 'TERAKHIR&gt;&gt;';

const IMAGE_BUTTON_ADD_ADDRESS = 'Tambah Alamat';
const IMAGE_BUTTON_BACK = 'Kembali';
const IMAGE_BUTTON_BUY_NOW = 'Beli Sekarang';
const IMAGE_BUTTON_CHANGE_ADDRESS = 'Ubah Alamat';
const IMAGE_BUTTON_CHECKOUT = 'Checkout';
const IMAGE_BUTTON_CONFIRM_ORDER = 'Konfirmasi Pesanan';
const IMAGE_BUTTON_CONTINUE = 'Lanjutkan';
const IMAGE_BUTTON_DELETE = 'Hapus';
const IMAGE_BUTTON_LOGIN = 'Masuk';
const IMAGE_BUTTON_IN_CART = 'Tambah ke Keranjang';
const IMAGE_BUTTON_SEARCH = 'Cari';
const IMAGE_BUTTON_UPDATE = 'Perbarui';
const IMAGE_BUTTON_UPDATE_PREFERENCES = 'Perbarui Preferensi';

const SMALL_IMAGE_BUTTON_DELETE = 'Hapus';
const SMALL_IMAGE_BUTTON_EDIT = 'Ubah';
const SMALL_IMAGE_BUTTON_VIEW = 'Lihat';
const SMALL_IMAGE_BUTTON_BUY = 'Beli';

const ICON_ARROW_RIGHT = 'selengkapnya';

const TEXT_SORT_PRODUCTS = 'Urutkan produk ';
const TEXT_DESCENDINGLY = 'menurun';
const TEXT_ASCENDINGLY = 'menaik';
const TEXT_BY = ' berdasarkan ';

const TEXT_UNKNOWN_TAX_RATE = 'Tarif pajak tidak diketahui';

const TEXT_CCVAL_ERROR_INVALID_DATE = 'The expiry date entered for the credit card is invalid. Please check the date and try again.';
const TEXT_CCVAL_ERROR_INVALID_NUMBER = 'The credit card number entered is invalid. Please check the number and try again.';
const TEXT_CCVAL_ERROR_UNKNOWN_CARD = 'The first four digits of the number entered are: %s. If that number is correct, we do not accept that type of credit card. If it is wrong, please try again.';

// category views
const TEXT_VIEW = 'Tampilan: ';
const TEXT_VIEW_LIST = ' Daftar';
const TEXT_VIEW_GRID = ' Kotak';

// search placeholder
const TEXT_SEARCH_PLACEHOLDER = 'Cari produk';

// message for required inputs
const FORM_REQUIRED_INFORMATION = '<i class="fas fa-asterisk text-danger"></i> Wajib diisi';
const FORM_REQUIRED_INPUT = '<span class="form-control-feedback text-danger"><i class="fas fa-asterisk"></i></span>';

// grid/list
const TEXT_SORT_BY = 'Urutkan ';
// moved from index
const TABLE_HEADING_IMAGE = '';
const TABLE_HEADING_MODEL = 'Model';
const TABLE_HEADING_PRODUCTS = 'Nama Produk';
const TABLE_HEADING_MANUFACTURER = 'Produsen';
const TABLE_HEADING_QUANTITY = 'Stok';
const TABLE_HEADING_PRICE = 'Harga';
const TABLE_HEADING_WEIGHT = 'Berat';
const TABLE_HEADING_BUY_NOW = 'Beli Sekarang';
const TABLE_HEADING_LATEST_ADDED = 'Tanggal Ditambahkan';
const TABLE_HEADING_ORDERED = 'Terlaris';

// product notifications
const PRODUCT_SUBSCRIBED = '%s telah ditambahkan ke daftar notifikasi Anda';
const PRODUCT_UNSUBSCRIBED = '%s telah dihapus dari daftar notifikasi Anda';
const PRODUCT_ADDED = '%s telah ditambahkan ke keranjang Anda';
const PRODUCT_REMOVED = '%s telah dihapus dari keranjang Anda';

// bootstrap helper
const MODULE_CONTENT_BOOTSTRAP_ROW_DESCRIPTION = '';

// noscript helper
const TEXT_NOSCRIPT = <<<'EOT'
<p><strong>JavaScript seems to be disabled in your browser.</strong></p>
<p>You must have JavaScript enabled in your browser to utilize the functionality of this website.<br>
<a class="alert-link" href="https://www.enable-javascript.com/" target="_blank" rel="noreferrer">Click here for instructions on enabling javascript in your browser</a>.</p>
EOT;

// sitewide is-product
const IS_PRODUCT_SHOW_PRICE = '%s';
const IS_PRODUCT_SHOW_PRICE_SPECIAL = '<del>%s</del> <span class="text-danger">kini %s</span>';
const IS_PRODUCT_BUTTON_BUY = '<i class="fas fa-shopping-cart"></i>';
const IS_PRODUCT_BUTTON_VIEW = '<i class="fas fa-eye"></i> Lihat';

// sitewide product listing
const LISTING_SORT_DOWN = '<i class="fas fa-level-down-alt text-primary"></i>';
const LISTING_SORT_UP = '<i class="fas fa-level-up-alt text-primary"></i>';
const LISTING_SORT_UNSELECTED = '<i class="fas fa-level-up-alt text-black-50"></i>';
// for new style internal pages
const LINK_TEXT_EDIT = '<small><a class="%s" href="%s">Ubah</a></small>';
const SHIPPING_FA_ICON = '<i class="fas fa-shipping-fast fa-fw fa-3x float-right text-black-50"></i>';
const PAYMENT_FA_ICON = '<i class="fas fa-file-invoice-dollar fa-fw fa-3x float-right text-black-50"></i>';

const ENTRY_COMMENTS = 'Ada yang perlu kami ketahui?';
const ENTRY_COMMENTS_PLACEHOLDER = 'Tulis catatan di sini...';
const TABLE_HEADING_OR = '-atau-';
