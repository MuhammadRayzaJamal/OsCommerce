<?php
/*
  $Id$

  CE Phoenix, E-Commerce made Easy
  https://phoenixcart.org

  Copyright (c) 2021 Phoenix Cart

  Released under the GNU General Public License
*/

const MODULE_CUSTOMER_DATA_DOB_TEXT_TITLE = 'Date of Birth';
const MODULE_CUSTOMER_DATA_DOB_TEXT_DESCRIPTION = 'Show a date of birth field in customer registration';

const ENTRY_DOB = 'Tanggal Lahir';
const ENTRY_DOB_ERROR = 'Tanggal lahir harus berformat DD/MM/YYYY (mis. 21/05/1990)';
const ENTRY_DOB_TEXT = 'eg. 05/21/1970';

////
// Return date in raw format
// $date should be in format mm/dd/yyyy
// raw date is in format YYYYMMDD, or DDMMYYYY
function tep_cd_dob_date_raw($date, $reverse = false) {
  return substr($date, 6, 4) . substr($date, 0, 2) . substr($date, 3, 2);
}
