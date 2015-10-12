Package.describe({
  name: "msolters:modalize",
  summary: "Seamless reactive modals for Materialize.",
  version: "1.0.0",
  git: "https://github.com/msolters/modalize.git"
});

Package.onUse(function(api, where) {
  api.versionsFrom("METEOR@1.2");

  api.use([
    'underscore',
    'templating',
    'blaze',
    'jquery',
    'reactive-var'
  ], 'client');

  api.use([
    'materialize:materialize@0.97.0',
    'aldeed:template-extension@3.4.3',
    'coffeescript'
  ], ["client"]);

  api.addFiles([
    'lib/modal.css',
    'lib/modal.html',
    'lib/MaterializeModal.coffee',
    'lib/modal.coffee'
  ], 'client');

  /*if (api.export) {
    api.export('MaterializeModal')
  }*/

});


Package.onTest(function(api) {
  api.use("msolters:modalize", 'client');
  api.use(['tinytest', 'test-helpers', 'coffeescript'], 'client');
  api.add_files('tests/modal_tests.coffee', 'client');
});
