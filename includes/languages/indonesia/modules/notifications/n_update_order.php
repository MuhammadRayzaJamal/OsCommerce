<?php
/*
  $Id$

  CE Phoenix, E-Commerce made Easy
  https://phoenixcart.org

  Copyright (c) 2021 Phoenix Cart

  Released under the GNU General Public License
*/

const MODULE_NOTIFICATIONS_UPDATE_ORDER_TEXT_TITLE = 'Update order status';
const MODULE_NOTIFICATIONS_UPDATE_ORDER_TEXT_DESCRIPTION = 'Send a notification when the order status is updated.';

const MODULE_NOTIFICATIONS_UPDATE_ORDER_SEPARATOR = '------------------------------------------------------';
const MODULE_NOTIFICATIONS_UPDATE_ORDER_TEXT_SUBJECT = 'Pembaruan Pesanan';
const MODULE_NOTIFICATIONS_UPDATE_ORDER_TEXT_ORDER_NUMBER = 'Nomor Pesanan:  %d';
const MODULE_NOTIFICATIONS_UPDATE_ORDER_TEXT_INVOICE_URL = 'Faktur Rinci:  %s';
const MODULE_NOTIFICATIONS_UPDATE_ORDER_TEXT_DATE_ORDERED = 'Tanggal Pesanan:  %s';
const MODULE_NOTIFICATIONS_UPDATE_ORDER_TEXT_STATUS_UPDATE = <<<'EOT'
Your order has been updated to the following status.

New status: %s

Please reply to this email if you have any questions.


EOT;
const MODULE_NOTIFICATIONS_UPDATE_ORDER_TEXT_COMMENTS_UPDATE = 'The comments for your order are' . "\n\n%s\n\n";
