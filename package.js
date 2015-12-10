Package.describe({
  name: "velankani:modalize",
  summary: "Fork of msolters:modalize to support master branch of materialize for Modals.",
  version: "1.0.1",
  git: "https://github.com/velankanisys/modalize.git"
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
    'velankani:materialize',
    'coffeescript'
  ], ["client"]);

  api.addFiles([
    'lib/modal.css',
    'lib/modal.html',
    'lib/Modalize.coffee',
    'lib/modal.coffee'
  ], 'client');

});


Package.onTest(function(api) {
  api.use("msolters:modalize", 'client');
  api.use(['tinytest', 'test-helpers', 'coffeescript'], 'client');
  api.add_files('tests/modal_tests.coffee', 'client');
});
