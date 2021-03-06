// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
require("trix")
require("@rails/actiontext")

// Toastr - extension for cute alerts
require('frest/app-assets/vendors/js/extensions/toastr.min.js');
window.toastr = toastr

// Sweet Alerts from frest theme
require('frest/app-assets/vendors/js/extensions/sweetalert2.all.min.js');
window.Swal = Swal;

// JS autocomplete module
require('@tarekraafat/autocomplete.js');
window.autoComplete = autoComplete;

require('jquery-ujs');

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// BEGIN Vendor JS
require('frest/app-assets/vendors/js/vendors.min.js')

require('frest/app-assets/js/scripts/configs/horizontal-menu.js')
require('frest/app-assets/js/core/app-menu.min.js');
require('frest/app-assets/js/scripts/footer.js')

// Generate ID for ActionCabel csv exporter
import './exporter/data'
// Toastr - extension for cute alerts
require('frest/app-assets/js/scripts/extensions/toastr.min.js');
require('frest/app-assets/vendors/js/extensions/toastr.min.js');
